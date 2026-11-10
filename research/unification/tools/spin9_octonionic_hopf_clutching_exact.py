#!/usr/bin/env python3
"""Source-pinned exact arithmetic for the BFSS real Spin(9) gamma-bundle clutching.

Exploratory certificate only: NOT a Lean theorem, physics derivation,
topological formalization, or evidence of observed particle generations.
Reads exact original 9x16 signed-permutation tables, refuses source drift.
Python 3 standard library; fractions only, no floating-point arithmetic.
"""
from fractions import Fraction as Q
import hashlib
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean"
SOURCE_BLOB = "b9b8192055c70f0d001d7982669b9823c55562ed"


def tables(src, name, next_name):
    a, b = src.index("private def "+name), src.index("private def "+next_name)
    entries = re.findall(r"\|\s*([0-8])\s*=>\s*!\[([^\]]*)\]", src[a:b])
    out = [(int(i), [int(x) for x in re.findall(r"-?\d+", s)])
           for i, s in entries]
    assert len(out) == 9
    assert all(i == j and len(v) == 16 for j, (i, v) in enumerate(out))
    return [v for _, v in out]


def transpose(a):
    return [list(row) for row in zip(*a)]


def mm(a, b):
    bt = transpose(b)
    return [[sum(x*y for x, y in zip(r, c)) for c in bt] for r in a]


def eye(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]


def add(a, b):
    return [[x+y for x, y in zip(r, s)] for r, s in zip(a, b)]


def scale(c, a):
    return [[c*x for x in r] for r in a]


def determinant(a):
    # Exact rational Gaussian elimination (8x8 integer input).
    m = [[Q(x) for x in row] for row in a]
    d = Q(1)
    for j in range(len(m)):
        pivot = next((k for k in range(j, len(m)) if m[k][j]), None)
        if pivot is None:
            return Q(0)
        if pivot != j:
            m[j], m[pivot] = m[pivot], m[j]
            d = -d
        pv = m[j][j]
        d *= pv
        for k in range(j+1, len(m)):
            coefficient = m[k][j]/pv
            for l in range(j, len(m)):
                m[k][l] -= coefficient*m[j][l]
    return d


def gamma_for(x, t, blocks):
    a = [[sum(x[i]*blocks[i][r][c] for i in range(8))
          for c in range(8)] for r in range(8)]
    at = transpose(a)
    return [[t*int(r==c) for c in range(8)] + a[r]
            for r in range(8)] + [
        at[r] + [-t*int(r==c) for c in range(8)]
        for r in range(8)
    ]


def check_unit_point(x, t, blocks):
    assert sum(v*v for v in x) + t*t == 1
    g = gamma_for(x, t, blocks)
    assert mm(g, g) == eye(16)
    assert g == transpose(g)
    plus, minus = scale(Q(1, 2), add(eye(16), g)), scale(Q(1, 2), add(eye(16), scale(-1, g)))
    assert mm(plus, plus) == plus and mm(minus, minus) == minus
    assert mm(plus, minus) == [[0]*16 for _ in range(16)]
    assert add(plus, minus) == eye(16)
    assert sum(plus[k][k] for k in range(16)) == 8
    assert sum(minus[k][k] for k in range(16)) == 8

    a = [r[8:] for r in g[:8]]
    at = transpose(a)
    if t != -1:
        # North chart: (u, A(x)^T/(1+t) u) belongs to E_+(x,t).
        for k in range(8):
            u = [Q(int(i == k)) for i in range(8)]
            v = [at[i][k]/(1+t) for i in range(8)]
            ev = u+v
            assert [sum(g[i][j]*ev[j] for j in range(16)) for i in range(16)] == ev
    if t != 1:
        # South chart: (A(x)/(1-t) v, v) belongs to E_+(x,t).
        for k in range(8):
            v = [Q(int(i == k)) for i in range(8)]
            u = [a[i][k]/(1-t) for i in range(8)]
            ev = u+v
            assert [sum(g[i][j]*ev[j] for j in range(16)) for i in range(16)] == ev


def main():
    data = SOURCE.read_bytes()
    blob = hashlib.sha1(b"blob "+str(len(data)).encode()+b"\0"+data).hexdigest()
    assert blob == SOURCE_BLOB, (blob, SOURCE_BLOB)
    s = data.decode("utf-8")
    perm, signs = tables(s, "perm", "sign"), tables(s, "sign", "gammaInt")
    assert perm[8] == list(range(16))
    assert signs[8] == [1]*8 + [-1]*8
    blocks = []
    for i in range(8):
        assert all(perm[i][j] >= 8 for j in range(8))
        assert all(perm[i][j] < 8 for j in range(8, 16))
        a = [[signs[i][r] if perm[i][r] == c+8 else 0
              for c in range(8)] for r in range(8)]
        # The lower-left block is exactly the transpose of the upper-right.
        assert all(
            (signs[i][r+8] if perm[i][r+8] == c else 0) == a[c][r]
            for r in range(8) for c in range(8)
        )
        blocks.append(a)
    I = eye(8)
    Z = [[0]*8 for _ in range(8)]
    for i in range(8):
        for j in range(8):
            assert add(mm(blocks[i], transpose(blocks[j])),
                       mm(blocks[j], transpose(blocks[i]))) == scale(2*int(i==j), I)
            assert add(mm(transpose(blocks[i]), blocks[j]),
                       mm(transpose(blocks[j]), blocks[i])) == scale(2*int(i==j), I)

    assert blocks[7] == I
    D = [[blocks[j][i][0] for j in range(8)] for i in range(8)]
    DT = [[blocks[j][0][i] for j in range(8)] for i in range(8)]
    assert mm(D, transpose(D)) == I and mm(DT, transpose(DT)) == I
    assert determinant(D) == -1 and determinant(DT) == 1

    samples = [
        ([Q(0)]*8, Q(1)),
        ([Q(0)]*8, Q(-1)),
        ([Q(1)]+[Q(0)]*7, Q(0)),
        ([Q(3, 5), Q(4, 5)]+[Q(0)]*6, Q(0)),
        ([Q(3, 5)]+[Q(0)]*7, Q(4, 5)),
        ([Q(3, 13), Q(4, 13)]+[Q(0)]*6, Q(12, 13)),
    ]
    for x, t in samples:
        check_unit_point(x, t, blocks)

    # For every equator unit x, A(x) is orthogonal by checked
    # coefficient identities; its determinant is +1 since A(e7)=I.
    # North/south transition E+ is A(x): south coordinates -> north.
    # Evaluation x -> A(x)e0 is exactly D x, degree det(D)=-1.
    print("ORIGINAL_GAMMA_SOURCE_BLOB_MATCH", blob)
    print("SOURCE_CLIFFORD_BLOCK_RELATIONS_8x8_EXACT_PASS")
    print("SPHERE_GAMMA_PROJECTORS_AND_NORTH_SOUTH_CHARTS_EXACT_PASS")
    print("EQUATOR_CLUTCHING_A(x)_ORTHOGONAL_CERTIFICATE_PASS")
    print("CLUTCHING_EVALUATION_D_IS_ORTHOGONAL_DET", determinant(D))
    print("INVERSE_CHART_EVALUATION_DET", determinant(DT))
    print("TOPOLOGICAL_INFERENCE: ABS_EULER_NUMBER=1 (clutching theorem)")
    print("E_PLUS_HOPF_TYPE_NOT_THREE_FAMILIES_NOT_A_LEAN_THEOREM")


if __name__ == "__main__":
    main()
