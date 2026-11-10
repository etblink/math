#!/usr/bin/env python3
"""Source-exact NumPy checks of the original BFSS 120-skew K_x operator.

Must be run from a checkout containing the exact original source Gamma tables.
This is an exploratory exact finite-integer calculation, not a Lean theorem.
"""
import hashlib
import itertools as it
import json
import re
from pathlib import Path

import numpy as np

ORIGINAL_BLOB = "b9b8192055c70f0d001d7982669b9823c55562ed"
SOURCE = Path(__file__).resolve().parents[3] / (
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean")
PAIRS = list(it.combinations(range(16), 2))

def original_gamma():
    data = SOURCE.read_bytes()
    sha = hashlib.sha1(("blob " + str(len(data)) + "\0").encode() + data).hexdigest()
    if sha != ORIGINAL_BLOB:
        raise RuntimeError(f"Original gamma source drift: {sha}")
    source = data.decode("utf-8")
    def table(name):
        start = source.index("private def " + name + " ")
        choices = re.findall(r"\|\s*(\d+)\s*=>\s*!\[([^\]]+)\]",
                             source[start:], re.S)[:9]
        out = {int(i): [int(x) for x in re.findall(r"-?\d+", v)]
               for i,v in choices}
        assert sorted(out) == list(range(9))
        assert all(len(a)==16 for a in out.values())
        return [out[i] for i in range(9)]
    perm, sign = table("perm"), table("sign")
    gamma = np.zeros((9,16,16), dtype=np.int64)
    for i in range(9):
        for a in range(16):
            gamma[i,perm[i][a],a] = sign[i][a]
    eye = np.eye(16,dtype=np.int64)
    assert all(np.array_equal(g,g.T) and np.array_equal(g@g,eye) for g in gamma)
    assert all(not np.any(gamma[i]@gamma[j]+gamma[j]@gamma[i])
               for i,j in it.combinations(range(9),2))
    return gamma

def wedge2(g):
    # On antisymmetric matrices: B -> g B g.T.
    return np.array([[g[i,a]*g[j,b]-g[i,b]*g[j,a] for a,b in PAIRS]
                     for i,j in PAIRS],dtype=np.int64)

def char_ranks(gamma):
    ks = [wedge2(gamma[i]) for i in range(9)]
    eye=np.eye(120,dtype=np.int64)
    assert all(np.array_equal(k@k,eye) for k in ks)
    assert all(np.array_equal(ks[i]@ks[j],ks[j]@ks[i])
               for i,j in it.combinations(range(9),2))
    traces=[]
    for mask in range(8):
        k=eye.copy()
        for i in range(3):
            if mask&(1<<i): k=k@ks[i]
        traces.append(int(np.trace(k)))
    assert traces==[120,-8,-8,8,-8,8,8,8]
    ranks={}
    for signs in it.product((1,-1),repeat=3):
        numerator=sum(
            traces[mask]*np.prod([signs[i] for i in range(3) if mask&(1<<i)])
            for mask in range(8))
        assert numerator%8==0
        ranks["".join("+" if e>0 else "-" for e in signs)]=int(numerator//8)
    assert ranks=={"+++":16,"++-":12,"+-+":12,"+--":16,
                   "-++":12,"-+-":16,"--+":16,"---":20}
    return ranks

def calculate(x,gamma,ranks):
    assert x.shape==(9,3) and x.dtype==np.int64
    gram=x.T@x
    t=int(np.trace(gram))
    v=sum(int(gram[a,a]*gram[b,b]-gram[a,b]**2)
          for a,b in it.combinations(range(3),2))
    wedge=sum(sum(int((x[i,a]*x[j,b]-x[j,a]*x[i,b])**2)
                  for i,j in it.combinations(range(9),2))
              for a,b in it.combinations(range(3),2))
    assert v==wedge
    a,b,c=map(int,gram[0])
    d,e=map(int,gram[1,1:])
    f=int(gram[2,2])
    det=a*(d*f-e*e)-b*(b*f-e*c)+c*(b*e-d*c)
    assert det>=0
    k=sum((wedge2(np.einsum("i,ijk->jk",x[:,a],gamma)) for a in range(3)),
          np.zeros((120,120),dtype=np.int64))
    assert np.array_equal(k,k.T)
    m1,m2,m3=(int(np.trace(k)),int(np.trace(k@k)),int(np.trace(k@k@k)))
    assert m1==-8*t
    assert m2==120*t*t-224*v
    assert m3==-8*t**3+96*det
    delta=t**3-4*t*v+8*det
    assert 168*delta==-80*t**3+3*t*m2+14*m3
    lambdas=np.linalg.eigvalsh(gram.astype(float))[::-1]
    eigenvalues=np.linalg.eigvalsh(k.astype(float))
    predicted=sorted(
        sum((1 if sign=="+" else -1)*lambdas[j]
            for j,sign in enumerate(pattern))
        for pattern,n in ranks.items() for _ in range(n))
    assert np.allclose(np.sort(eigenvalues),predicted,atol=1e-7,rtol=1e-8)
    gap=float(lambdas[0]-lambdas[1]-lambdas[2])
    assert (delta>0)==(gap>1e-7) if delta!=0 else abs(gap)<1e-7
    inertia=(int((eigenvalues>1e-7).sum()),
             int((abs(eigenvalues)<=1e-7).sum()),
             int((eigenvalues<(-1e-7)).sum()))
    return {"T":t,"V":v,"D":det,"delta":delta,
            "trace":[m1,m2,m3],"inertia":inertia}

def main():
    gamma=original_gamma()
    ranks=char_ranks(gamma)
    cases={
        "rank1":[[2,0,0]],
        "rank2-equal":[[1,0,0],[0,1,0]],
        "rank3-valley":[[2,0,0],[0,1,0],[0,0,1]],
        "rank3-threshold":[[1,1,0],[1,-1,0],[0,0,2]],
        "rank3-balanced":[[1,0,0],[0,1,0],[0,0,1]],
        "generic-nonorthogonal":[[1,1,0],[0,1,2],[1,-1,1],[0,1,1]]
    }
    results={}
    for name,rows in cases.items():
        x=np.zeros((9,3),dtype=np.int64)
        x[:len(rows)]=rows
        results[name]=calculate(x,gamma,ranks)
    rng=np.random.default_rng(20261110)
    for _ in range(10):
        calculate(rng.integers(-2,3,size=(9,3),dtype=np.int64),gamma,ranks)
    print(json.dumps({"source_blob":ORIGINAL_BLOB,
                      "status":"EXPLORATORY_PYTHON_NOT_LEAN",
                      "joint_ranks":ranks,
                      "cases":results,
                      "random_integer_cases":10},indent=2))

if __name__=="__main__":
    main()
