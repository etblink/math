#!/usr/bin/env python3
"""Source-pinned exact BFSS Gamma(9) -> normed eight-dimensional algebra test.

Candidate-neutral, Python 3 stdlib, exact integers only.
This is NOT an original Lean theorem, a standard-octonion basis equivalence,
a source physical Fock result, or a BFSS spectrum/ontology theorem.

Source: SU2RealGammaProbe.lean, Git blob b9b8192055c70f0d001d7982669b9823c55562ed.
The correction Q(x)=A(x)e7 makes the raw A(x)y orthogonal multiplication
unital on BOTH sides: x star y = A(Q^T x)y.
"""
from hashlib import sha1
from pathlib import Path
from re import findall

ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean"
PIN = "b9b8192055c70f0d001d7982669b9823c55562ed"


def tables(source, name, following):
    a = source.index("private def " + name)
    b = source.index("private def " + following)
    rows = findall(r"\|\s*([0-8])\s*=>\s*!\[([^\]]*)\]", source[a:b])
    assert len(rows) == 9
    result = []
    for i, (index, values) in enumerate(rows):
        row = [int(v) for v in findall(r"-?\d+", values)]
        assert int(index) == i and len(row) == 16
        result.append(row)
    return result


def dot(x, y):
    return sum(a*b for a, b in zip(x, y))


def transpose(a):
    return list(map(list, zip(*a)))


def mm(a, b):
    bt = transpose(b)
    return [[dot(row, col) for col in bt] for row in a]


def mv(a, v):
    return [dot(row, v) for row in a]


def eye(n):
    return [[int(i == j) for j in range(n)] for i in range(n)]


def add(a, b):
    return [x+y for x, y in zip(a, b)]


def unit(i, n=8):
    return [int(j == i) for j in range(n)]


def determinant_signed_permutation(m):
    target = []
    signs = []
    for row in m:
        support = [j for j,v in enumerate(row) if v]
        assert len(support) == 1 and abs(row[support[0]]) == 1
        j = support[0]
        target.append(j)
        signs.append(row[j])
    assert sorted(target) == list(range(len(m)))
    inversions = sum(target[i] > target[j]
                     for i in range(len(m)) for j in range(i+1, len(m)))
    return (-1 if inversions % 2 else 1) * __import__("math").prod(signs)


def verify():
    data = SOURCE.read_bytes()
    objhash = sha1(b"blob " + str(len(data)).encode() + b"\x00" + data).hexdigest()
    assert objhash == PIN, (objhash, PIN)
    source = data.decode("utf-8")
    perm, sign = tables(source, "perm", "sign"), tables(source, "sign", "gammaInt")
    gamma = [[[sign[a][i] if perm[a][i] == j else 0
               for j in range(16)] for i in range(16)] for a in range(9)]
    I8, Z8 = eye(8), [[0]*8 for _ in range(8)]
    A = [[row[8:] for row in gamma[a][:8]] for a in range(8)]

    for a in range(8):
        assert [row[:8] for row in gamma[a][:8]] == Z8
        assert [row[8:] for row in gamma[a][8:]] == Z8
        assert [row[:8] for row in gamma[a][8:]] == transpose(A[a])
    assert gamma[8] == [[(1 if i < 8 else -1) if i == j else 0
                          for j in range(16)] for i in range(16)]

    for i in range(8):
        for j in range(8):
            L = mm(A[i], transpose(A[j]))
            K = mm(A[j], transpose(A[i]))
            M = mm(transpose(A[i]), A[j])
            N = mm(transpose(A[j]), A[i])
            E = [[2*int(i==j)*I8[r][c] for c in range(8)] for r in range(8)]
            assert [[L[r][c]+K[r][c] for c in range(8)] for r in range(8)] == E
            assert [[M[r][c]+N[r][c] for c in range(8)] for r in range(8)] == E
    assert A[7] == I8

    def B(x, y):
        return [sum(x[i] * dot(A[i][r], y) for i in range(8)) for r in range(8)]

    e7 = unit(7)
    Q = transpose([B(unit(i),e7) for i in range(8)])
    assert mm(Q,transpose(Q)) == I8 and mm(transpose(Q),Q) == I8
    assert mv(Q,e7) == e7
    assert determinant_signed_permutation(Q) == -1
    assert B(unit(0),e7) != unit(0)  # raw source product is NOT a right-unital table
    assert all(B(e7,unit(i)) == unit(i) for i in range(8))

    def star(x, y):
        return B(mv(transpose(Q),x),y)

    assert all(star(e7,unit(i)) == unit(i) and
               star(unit(i),e7) == unit(i) for i in range(8))
    assert all(star(unit(i),unit(i)) == [-k for k in e7] for i in range(7))
    assert all(add(star(unit(i),unit(j)),star(unit(j),unit(i))) == [0]*8
               for i in range(7) for j in range(7) if i != j)

    left = star(star(unit(6),unit(5)),unit(0))
    right = star(unit(6),star(unit(5),unit(0)))
    assert left == [0,0,0,-1,0,0,0,0]
    assert right == [0,0,0,1,0,0,0,0]

    vectors = [
        ([1,2,-1,0,0,4,-3,1],[2,-1,3,1,0,-2,1,0]),
        (unit(0),unit(1)), (unit(2),unit(4)),
        ([0]*7+[1],[3,4,0,0,0,0,0,0]),
    ]
    for i in range(8):
        for j in range(8):
            vectors.append((unit(i),unit(j)))
    seed = 17
    def rand():
        nonlocal seed
        seed = (seed * 1664525 + 1013904223) % (1 << 32)
        return seed % 7 - 3
    vectors += [(list(map(lambda _: rand(), range(8))),
                 list(map(lambda _: rand(), range(8)))) for _ in range(36)]

    for u,v in vectors:
        n2 = dot(u,u)+dot(v,v)
        assert dot(B(u,v),B(u,v)) == dot(u,u)*dot(v,v)
        assert dot(star(u,v),star(u,v)) == dot(u,u)*dot(v,v)
        h = [2*dot(u,mv(A[i],v)) for i in range(8)] + [dot(u,u)-dot(v,v)]
        assert dot(h,h) == n2*n2
        assert star(star(u,u),v) == star(u,star(u,v))
        assert star(star(v,u),u) == star(v,star(u,u))

    print("SOURCE_GAMMA_BLOB_PIN_PASS", PIN)
    print("BLOCK_CLIFFORD_RELATIONS_PASS")
    print("RAW_B_LEFT_IDENTITY_ONLY_RIGHT_IDENTITY_FAILS")
    print("Q_ORTHOGONAL_DET_NEGATIVE_PASS")
    print("NORMALIZED_UNITAL_COMPOSITION_NUMERIC_FIXTURES_PASS")
    print("EXPLICIT_NONASSOCIATIVITY_PASS", left, right)
    print("SPINOR_HOPF_QUADRATIC_NORM_FIXTURES_PASS", len(vectors))
    print("EXACT_FINITE_FIXTURES_ONLY_NOT_ORIGINAL_SOURCE_LEAN_THEOREM")


if __name__ == "__main__":
    verify()
