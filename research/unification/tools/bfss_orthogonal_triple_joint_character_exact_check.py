#!/usr/bin/env python3
"""Exact source-gamma orthogonal-triple character certificate.

Source pin and all arithmetic are integer-only. Distinguish the genuine
joint spectrum of commuting induced K_i on Lambda^2(R^16) from the three
ANTIcommuting spinor gamma_i, which admit no simultaneous eigenbasis.

Status: exact independent finite-dimensional arithmetic, NOT Lean proof,
bundle topology, physical BFSS three generations or spectral statement.
"""
from __future__ import annotations

from collections import Counter
from itertools import combinations
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[3]
SRC = ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean"
PIN = "b9b8192055c70f0d001d7982669b9823c55562ed"
N = 16


def signed_perms():
    sha = subprocess.check_output(
        ["git", "hash-object", "--no-filters", str(SRC)], cwd=ROOT, text=True).strip()
    assert sha == PIN, ("gamma pin drift", sha)
    content = SRC.read_text()
    def parse(left, right):
        a = content.index(left)
        b = content.index(right, a)
        matches = re.findall(r"\|\s+(\d+)\s*=>\s*!\[([^\]]*)\]", content[a:b], re.S)
        assert [int(k) for k, _ in matches] == list(range(9))
        xs = [tuple(int(v) for v in re.findall(r"-?\d+", raw)) for _, raw in matches]
        assert all(len(x) == N for x in xs)
        return xs
    perms = parse("private def perm", "private def sign")
    signs = parse("private def sign", "private def gammaInt")
    result = list(zip(perms, signs))
    for p, s in result:
        assert sorted(p) == list(range(N))
        assert set(s) <= {-1, 1}
    return result


def mul(a, b):
    pa, sa = a
    pb, sb = b
    return tuple(pb[pa[i]] for i in range(N)), tuple(sa[i] * sb[pa[i]] for i in range(N))


def neg(a):
    return a[0], tuple(-x for x in a[1])


def trans(a):
    pa, sa = a
    p = [None] * N
    s = [None] * N
    for i in range(N):
        p[pa[i]], s[pa[i]] = i, sa[i]
    return tuple(p), tuple(s)


def pairing(a, b):
    return sum(a[1][i] * b[1][i] for i in range(N) if a[0][i] == b[0][i])


def sign_on_word(g, word):
    v = pairing(mul(mul(g, word), trans(g)), word)
    assert abs(v) == N, ("non-eigen Clifford word", v)
    return v // N


def main():
    g = signed_perms()
    identity = (tuple(range(N)), (1,) * N)
    for i in range(9):
        assert trans(g[i]) == g[i]
        assert mul(g[i], g[i]) == identity
    for i, j in combinations(range(9), 2):
        assert mul(g[i], g[j]) == neg(mul(g[j], g[i]))

    counts = Counter()
    for degree in (2, 3):
        for indices in combinations(range(9), degree):
            w = identity
            for k in indices:
                w = mul(w, g[k])
            assert trans(w) == neg(w)
            key = tuple(sign_on_word(g[k], w) for k in range(3))
            counts[degree, key] += 1

    expected = {
        (1, 1, 1): (15, 1),
        (1, 1, -1): (6, 6),
        (1, -1, 1): (6, 6),
        (-1, 1, 1): (6, 6),
        (1, -1, -1): (1, 15),
        (-1, 1, -1): (1, 15),
        (-1, -1, 1): (1, 15),
        (-1, -1, -1): (0, 20),
    }
    assert sum(counts[2, key] for key in expected) == 36
    assert sum(counts[3, key] for key in expected) == 84
    for key, (n2, n3) in expected.items():
        assert (counts[2, key], counts[3, key]) == (n2, n3), (key, counts)

    # For orthogonal columns with Gram eigenvalues 5, 4, 3,
    # K_x has eigenvalue 5*k1 + 4*k2 + 3*k3 on each joint sector.
    spectrum = Counter()
    for key, (n2, n3) in expected.items():
        spectrum[sum(w * k for w, k in zip((5, 4, 3), key))] += n2 + n3
    assert spectrum == Counter({12: 16, 6: 12, 4: 12, 2: 12,
                               -2: 16, -4: 16, -6: 16, -12: 20})
    assert sum(v for eigen, v in spectrum.items() if eigen > 0) == 52
    assert sum(v for eigen, v in spectrum.items() if eigen == 1) == 0
    print("GAMMA_PIN", PIN)
    print("ORTHOGONAL_TRIPLE_JOINT_SPECTRUM_GRADE_CERTIFICATE_PASS")
    print("WEIGHTED_5_4_3_KX_SPECTRUM", sorted(spectrum.items()))
    print("NOT_A_LEAN_PROOF_OR_GENERATION_CLAIM")


if __name__ == "__main__":
    main()
