#!/usr/bin/env python3
"""Exact source gamma-pair commutants for original BFSS Spin(8)/Spin(9).

Reads the real signed-permutation gamma tables from the literal
SU2RealGammaProbe.lean source and verifies the exact pinned Git blob.
No floating point, arbitrary replacement representation, network,
external Python packages, Lean modifications or CI activity.

This is an EXPLORATORY exact finite-arithmetic certificate, not an
independently qualified Lean theorem or physical particle model.
"""
from __future__ import annotations

import hashlib
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / (
    "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/"
    "SU2RealGammaProbe.lean"
)
EXPECTED_BLOB = "b9b8192055c70f0d001d7982669b9823c55562ed"
SIZE = 16


def git_blob_id(data: bytes) -> str:
    return hashlib.sha1(
        b"blob " + str(len(data)).encode() + b"\0" + data
    ).hexdigest()


def extract_tables(source: str, name: str, next_name: str) -> list[list[int]]:
    start = source.index("private def " + name)
    end = source.index("private def " + next_name, start)
    section = source[start:end]
    entries = [
        (int(m.group(1)), [int(n) for n in re.findall(r"-?\d+", m.group(2))])
        for m in re.finditer(r"\|\s*([0-8])\s*=>\s*!\[([^\]]+)\]", section)
    ]
    assert [i for i, _ in entries] == list(range(9)), (name, "index order")
    assert all(len(v) == SIZE for _, v in entries), (name, "row size")
    return [v for _, v in entries]


def source_gamma_tables():
    data = SOURCE.read_bytes()
    assert git_blob_id(data) == EXPECTED_BLOB, (
        "original Lean gamma source changed; refuse stale certificate",
        git_blob_id(data), EXPECTED_BLOB
    )
    raw = data.decode("utf-8")
    p = extract_tables(raw, "perm", "sign")
    s = extract_tables(raw, "sign", "gammaInt")
    for i in range(9):
        assert sorted(p[i]) == list(range(SIZE))
        assert set(s[i]) <= {-1, 1}
        # All nine original signed-permutation gamma tables are symmetric.
        assert all(p[i][p[i][j]] == j and s[i][j] == s[i][p[i][j]]
                   for j in range(SIZE))
    assert p[8] == list(range(SIZE))
    assert s[8] == [1]*8 + [-1]*8
    return p, s


def product(p, s, a: int, b: int):
    """Signed-permutation matrix gamma_a gamma_b, row -> column."""
    return (
        [p[b][p[a][i]] for i in range(SIZE)],
        [s[a][i]*s[b][p[a][i]] for i in range(SIZE)],
    )


def verify_clifford(p, s):
    for i in range(9):
        for j in range(9):
            pi, si = product(p, s, i, j)
            pj, sj = product(p, s, j, i)
            if i == j:
                assert pi == list(range(SIZE)) and si == [1]*SIZE
            else:
                assert pi == pj and all(x == -y for x, y in zip(si, sj))
    print("SOURCE_GAMMA_CLIFFORD_ENTRIES_EXACT_PASS")


def commutant_dimension(p, s, pairs):
    """Signed union/find solves [X, gamma_a gamma_b]=0 exactly over R.

    For B_(i,p(i))=sign(i), commutation relates
      X_(i,k) = sign(i)*sign(k) * X_(p(i),p(k)).
    An inconsistent sign cycle forces its entire component to zero.
    Each remaining component contributes one independent real scalar.
    This is *exact* finite linear algebra, no random/modular rank test.
    """
    n = SIZE*SIZE
    parent = list(range(n))
    parity = [1]*n
    rank = [0]*n
    contradiction = [False]*n

    def find(x):
        if parent[x] == x:
            return x, 1
        root, sign = find(parent[x])
        parity[x] *= sign
        parent[x] = root
        return root, parity[x]

    def bind(a, b, ratio):
        # Variable(a) = ratio * Variable(b), ratio in {-1,+1}.
        ra, sa = find(a)
        rb, sb = find(b)
        if ra == rb:
            if sa != ratio*sb:
                contradiction[ra] = True
            return
        v = ratio*sb*sa
        if rank[ra] < rank[rb]:
            parent[ra], parity[ra] = rb, v
            contradiction[rb] |= contradiction[ra]
        else:
            parent[rb], parity[rb] = ra, v
            contradiction[ra] |= contradiction[rb]
            if rank[ra] == rank[rb]:
                rank[ra] += 1

    for a, b in pairs:
        permutation, sign = product(p, s, a, b)
        for row in range(SIZE):
            for col in range(SIZE):
                bind(
                    SIZE*row+col,
                    SIZE*permutation[row]+permutation[col],
                    sign[row]*sign[col]
                )
    roots = {find(k)[0] for k in range(n)}
    free = [root for root in roots if not contradiction[root]]
    return len(free), len(roots), len(roots)-len(free)


def run():
    p, s = source_gamma_tables()
    print("EXACT_PINNED_LEAN_GAMMA_BLOB:", EXPECTED_BLOB)
    verify_clifford(p, s)

    spin8_witnesses = [(0, j) for j in range(1, 8)]
    spin9_witnesses = spin8_witnesses + [(0, 8)]
    for k in range(1, 9):
        dim, ncomp, nzero = commutant_dimension(
            p, s, spin9_witnesses[:k]
        )
        print("GAMMA_PAIR_PREFIX", k, "COMMUTANT_DIM", dim,
              "COMPONENTS", ncomp, "FORCED_ZERO", nzero)
        expected_dim = 2**(8-k)
        assert dim == expected_dim, (k, dim, expected_dim)

    # Real source gamma_8 is diag(+1 eight times,-1 eight times).
    # I and gamma_8 are independent and commute with all seven
    # gamma_0 gamma_j (j=1..7), so they span the dimension-2 commutant.
    assert s[8] == [1]*8+[-1]*8
    for j in range(1, 8):
        bp, _ = product(p, s, 0, j)
        assert all(s[8][bp[k]] == s[8][k] for k in range(16))
    # The eighth element gamma_0 gamma_8 exchanges the two sign halves.
    bp, bs = product(p, s, 0, 8)
    assert all(s[8][bp[k]] == -s[8][k] for k in range(16))
    assert all(bs[k] in (-1, 1) for k in range(16))

    assert commutant_dimension(
        p, s, [(i, j) for i in range(8) for j in range(i+1, 8)]
    )[0] == 2
    assert commutant_dimension(
        p, s, [(i, j) for i in range(9) for j in range(i+1, 9)]
    )[0] == 1

    # No projection of real rank 8 commutes with all Spin9 witnesses,
    # but I, P_+, P_-, 0 commute with Spin8 witnesses.
    assert sum((1 + t)//2 for t in s[8]) == 8
    assert sum((1 - t)//2 for t in s[8]) == 8
    print("SEVEN_SPIN8_STABILIZER_PAIR_COMMUTANT_SPAN: I16, gamma_8")
    print("SPIN8_SOURCE_PROJECTOR_RANKS: 0,8,8,16")
    print("FULL_SPIN9_PAIR_COMMUTANT_SPAN: I16")
    print("FULL_SPIN9_SOURCE_PROJECTOR_RANKS: 0,16")
    print("GAMMA_0_GAMMA_8_EXCHANGES_PLUS_MINUS_EIGHT: PASS")
    print("COLOR_TENSOR_COMPATIBLE_SOURCE_RANKS: 0,24,24,48")
    print("EIGHT_EXACT_SOURCE_GAMMA_PAIR_CERTIFICATE_PASS")
    print("NOT_LEAN_QUALIFIED_NOT_PHYSICS_DISCOVERY")


if __name__ == "__main__":
    run()
