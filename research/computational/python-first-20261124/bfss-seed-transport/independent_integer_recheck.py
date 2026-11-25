"""Independent standard-library integer audit of the frozen BFSS seed.

No floating point, NumPy, or original accumulator code. Direct ordered
scatter and an independently compiled XOR/parity inverse-target gather.
The exact universal Lean transport is upstream; this execution is not a
Lean kernel proof or a physical differential-domain certificate.
"""
import argparse
import ast
import collections
import hashlib
import itertools
import json
from pathlib import Path
import re
import struct
import zipfile

D = Path(__file__).resolve().parent
ROOT = next(p for p in D.parents if (p / "lean").is_dir())
N = 1 << 24
SEED_SHA = "131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7"


def require(ok, message):
    if not ok:
        raise AssertionError(message)


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def npy(raw, descr, shape, code):
    """Strictly parse the small frozen NPY subset, without pickle or numpy."""
    require(raw[:6] == b"\x93NUMPY", "NPY magic")
    version = tuple(raw[6:8])
    require(version in ((1, 0), (2, 0), (3, 0)), "NPY version")
    width = 2 if version == (1, 0) else 4
    size = int.from_bytes(raw[8:8 + width], "little")
    start = 8 + width
    head = ast.literal_eval(raw[start:start + size].decode("utf-8").strip())
    require(head == {"descr": descr, "fortran_order": False, "shape": shape},
            ("NPY header", head, descr, shape))
    data = raw[start + size:]
    count = shape[0] if shape else 1
    require(len(data) == struct.calcsize("<" + code) * count, "NPY byte count")
    return struct.unpack("<" + str(count) + code, data)


def read_seed():
    path = D / "source_seed_integer.npz"
    require(sha(path) == SEED_SHA, "frozen NPZ SHA256")
    with zipfile.ZipFile(path) as z:
        require(sorted(z.namelist()) == sorted(["masks.npy", "real.npy",
                "imag.npy", "raw_norm2.npy"]), "NPZ members")
        require(z.testzip() is None, "NPZ CRC")
        masks = npy(z.read("masks.npy"), "<u4", (19136,), "I")
        real = npy(z.read("real.npy"), "<i2", (19136,), "h")
        imag = npy(z.read("imag.npy"), "<i2", (19136,), "h")
        norm, = npy(z.read("raw_norm2.npy"), "<i8", (), "q")
    require(len(set(masks)) == len(masks), "duplicate masks")
    require(all(0 <= m < N for m in masks), "mask range")
    state = dict(zip(masks, zip(real, imag)))
    require(all(a or b for a, b in state.values()), "explicit zero coefficient")
    require(all(b == 0 for b in imag), "expected real seed")
    require(sum(a*a+b*b for a,b in state.values()) == norm == 8072064, "norm")
    return state


def words_and_terms():
    words = re.findall(r"'([IXZJ]{4})'", (D / "check_seed.py").read_text())
    require(len(words) == 9, "word list")
    def masks(chars):
        return [sum(1 << (3-k) for k,c in enumerate(w) if c in chars)
                for w in words]
    flip, sign = masks("JX"), masks("JZ")
    lean = (ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
            "BFSSMSYPythonGammaRows.lean").read_text()
    for name, actual in (("pythonFlipMask", flip), ("pythonSignMask", sign)):
        match = re.search(r"def " + name + r" : Fin 9 → ℕ :=\s*!\[([^\]]+)\]", lean)
        require(match and [int(x.strip()) for x in match[1].split(",")] == actual,
                ("qualified mask mismatch", name))
    # Literal terms: (left spin, left color, right spin, right color, weight)
    terms = {}
    for a,b in itertools.combinations(range(3),2):
        terms[f"2G_{a}_{b}"] = [(i,a,i,b,1) for i in range(16)]
    for r,s in itertools.combinations(range(9),2):
        t = []
        for a in range(3):
            for i in range(16):
                k = i ^ flip[r]
                j = k ^ flip[s]
                w = (-1)**((i & sign[r]).bit_count() + (k & sign[s]).bit_count())
                t.append((i,a,j,a,w))
        terms[f"8R_{r}_{s}"] = t
    require(len(terms) == 39, "generator count")
    require(all(len(t) == (16 if k.startswith("2G") else 48)
                for k,t in terms.items()), "term counts")
    return words, flip, sign, terms


def rotate(a, b, phase):
    """Multiply Gaussian integers by i**phase, with no complex arithmetic."""
    if phase == 0:
        return a, b
    if phase == 1:
        return -b, a
    if phase == 2:
        return -a, -b
    return b, -a


def add(out, m, a, b):
    r,i = out.get(m, (0,0))
    v = (r+a,i+b)
    if v == (0,0):
        out.pop(m, None)
    else:
        out[m] = v


def step(m, spin, color):
    # Direct exclusive parity and separate occupied-bit correction.
    bit = 3*(spin//2) + color
    parity = (m & ((1 << bit)-1)).bit_count() & 1
    odd = spin % 2
    phase = (2*parity + odd + 2*odd*((m >> bit)&1)) % 4
    return m ^ (1 << bit), phase


def scatter(state, terms):
    out = {}
    targets = set()
    for al,a,be,b,w in terms:
        for m,(r,i) in state.items():
            q, pb = step(m,be,b)
            t, pa = step(q,al,a)
            u,v = rotate(w*r,w*i,(pa+pb)%4)
            targets.add(t)
            add(out,t,u,v)
    return out, targets


def compile_term(term):
    # Independent composition of inclusive parity characters on source masks.
    al,a,be,b,w = term
    ba,bb = 3*(al//2)+a,3*(be//2)+b
    oa,ob = al%2,be%2
    la,lb = (1 << (ba+oa))-1,(1 << (bb+ob))-1
    return ((1 << ba) ^ (1 << bb), la ^ lb,
            (oa+ob+2*((la >> bb)&1))%4,w)


def gather(state, terms):
    groups = collections.defaultdict(list)
    for term in terms:
        delta, parity, phase, weight = compile_term(term)
        groups[delta].append((parity,phase,weight))
    out = {}
    targets = set()
    for delta,group in groups.items():
        # Every term in this group has the same unique inverse predecessor.
        group_targets = {m ^ delta for m in state}
        targets.update(group_targets)
        for target in group_targets:
            m = target ^ delta
            r,i = state[m]
            cr,ci = 0,0
            for parity,phase,w in group:
                p = (phase + 2*((m & parity).bit_count() & 1))%4
                u,v = rotate(w,0,p)
                cr += u
                ci += v
            add(out,target,cr*r-ci*i,cr*i+ci*r)
    return out, targets


def stats(residual):
    squares = [a*a+b*b for a,b in residual.values()]
    return {"nonzero":len(squares), "max_abs_squared":max(squares, default=0),
            "norm2":sum(squares)}


def compare(state, terms):
    a,ta = scatter(state,terms)
    b,tb = gather(state,terms)
    require(a == b and ta == tb, "scatter/gather discrepancy")
    return {**stats(a), "touched_targets":len(ta), "term_count":len(terms)}


def unsigned_permutation(state):
    # Undo only the final signed permutation as in the original control.
    p = [8*(i%3)+i//3 for i in range(24)]
    inv = [(i,j) for i in range(24) for j in range(i+1,24) if p[i]>p[j]]
    return {m: (s*r,s*i) for m,(r,i) in state.items()
            for s in [(-1)**sum(((m>>a)&1)*((m>>b)&1) for a,b in inv)]}


def self_test():
    # Exercise imaginary coefficients, coincident and distinct Majorana modes.
    state = {m:(m-5,2*m+1) for m in range(32)}
    for al,a,be,b in itertools.product(range(4),range(2),range(4),range(2)):
        term = (al,a,be,b,-1)
        require(scatter(state,[term]) == gather(state,[term]),
                ("synthetic phase mismatch", term))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    self_test()
    state = read_seed()
    words,flip,sign,terms = words_and_terms()
    report = {"scope":"Independent exact integer computation; not kernel or physical-domain proof",
              "seed_sha256":SEED_SHA, "support":len(state),
              "norm2":sum(r*r+i*i for r,i in state.values()),
              "occupation_histogram":dict(sorted(collections.Counter(
                  m.bit_count() for m in state).items())),
              "word_list":words, "flip_masks":flip, "sign_masks":sign,
              "algorithm_agreement":True, "generator_results":{}, "controls":{}}
    def save():
        args.output.parent.mkdir(parents=True,exist_ok=True)
        args.output.write_text(json.dumps(report,indent=2,sort_keys=True)+"\n")
    for name,t in terms.items():
        result = compare(state,t)
        report["generator_results"][name] = result
        save()
        print(name, result, flush=True)
        require(result["nonzero"] == 0, ("nonzero generator",name,result))
    perturb = dict(state)
    first = next(iter(perturb))
    r,i = perturb[first]
    perturb[first] = r+1,i
    report["controls"]["coefficient_perturbation"] = compare(perturb,terms["8R_0_3"])
    report["controls"]["unsigned_permutation"] = compare(unsigned_permutation(state),terms["2G_0_1"])
    save()
    for name, expected in (("coefficient_perturbation",(12,16,192)),
                           ("unsigned_permutation",(16584,166464,152855552))):
        r = report["controls"][name]
        require((r["nonzero"],r["max_abs_squared"],r["norm2"]) == expected,
                ("negative control mismatch", name, r))
    report["all_39_zero"] = True
    report["negative_controls_match"] = True
    save()
    print("BFSS_MSY_INDEPENDENT_INTEGER_RECHECK_PASS",flush=True)


if __name__ == "__main__":
    main()
