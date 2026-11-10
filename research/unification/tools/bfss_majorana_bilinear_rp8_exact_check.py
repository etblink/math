#!/usr/bin/env python3
"""Pinned, stdlib-only exploratory BFSS 9-gamma / 120-bilinear certificate.

Execute at the repository root:
    python3 research/unification/tools/bfss_majorana_bilinear_rp8_exact_check.py

This is finite integer source arithmetic, not a Lean theorem, a proof
of bundle topology, an index calculation, or a physical BFSS prediction.
Only uses literal SU2RealGammaProbe.lean signed-permutation entries.
"""
from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
from itertools import combinations
from math import comb
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / "lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean"
EXPECTED_GIT_BLOB = "b9b8192055c70f0d001d7982669b9823c55562ed"
N = 16


@dataclass(frozen=True)
class SignedPermutation:
    """M[i,p[i]] = s[i], all other matrix entries zero."""

    p: tuple[int, ...]
    s: tuple[int, ...]


def arrays_between(text: str, left: str, right: str) -> list[tuple[int, ...]]:
    first = text.index(left)
    last = text.index(right, first)
    found = re.findall(r"\|\s+(\d+)\s*=>\s*!\[([^\]]*)\]", text[first:last], re.S)
    assert [int(index) for index, _ in found] == list(range(9)), "changed gamma index layout"
    rows = [tuple(int(x) for x in re.findall(r"-?\d+", body)) for _, body in found]
    assert all(len(row) == N for row in rows)
    return rows


def times(a: SignedPermutation, b: SignedPermutation) -> SignedPermutation:
    return SignedPermutation(
        tuple(b.p[a.p[i]] for i in range(N)),
        tuple(a.s[i] * b.s[a.p[i]] for i in range(N)),
    )


def transpose(a: SignedPermutation) -> SignedPermutation:
    p, s = [0] * N, [0] * N
    for i in range(N):
        p[a.p[i]], s[a.p[i]] = i, a.s[i]
    return SignedPermutation(tuple(p), tuple(s))


def negative(a: SignedPermutation) -> SignedPermutation:
    return SignedPermutation(a.p, tuple(-v for v in a.s))


IDENTITY = SignedPermutation(tuple(range(N)), (1,) * N)


def pairing(a: SignedPermutation, b: SignedPermutation) -> int:
    """Exact Frobenius inner product Tr(a.T*b), all integers."""
    return sum(a.s[i] * b.s[i] for i in range(N) if a.p[i] == b.p[i])


def eigen_sign(g: SignedPermutation, a: SignedPermutation) -> int:
    v = pairing(times(times(g, a), transpose(g)), a)
    assert abs(v) == N, "not an eigendirection for source conjugation"
    return v // N


def main() -> None:
    actual = subprocess.check_output(
        ["git", "hash-object", "--no-filters", str(SOURCE)], text=True, cwd=ROOT
    ).strip()
    assert actual == EXPECTED_GIT_BLOB, ("source pin mismatch", actual)
    raw = SOURCE.read_text(encoding="utf-8")
    perms = arrays_between(raw, "private def perm", "private def sign")
    signs = arrays_between(raw, "private def sign", "private def gammaInt")
    gamma = [SignedPermutation(p, s) for p, s in zip(perms, signs)]
    assert len(gamma) == 9

    for g in gamma:
        assert sorted(g.p) == list(range(N))
        assert set(g.s) <= {-1, 1}
        assert transpose(g) == g and times(g, g) == IDENTITY
    for i, j in combinations(range(9), 2):
        assert times(gamma[i], gamma[j]) == negative(times(gamma[j], gamma[i]))

    words: list[tuple[int, tuple[int, ...], SignedPermutation]] = []
    for degree in (2, 3):
        for indices in combinations(range(9), degree):
            m = IDENTITY
            for i in indices:
                m = times(m, gamma[i])
            assert transpose(m) == negative(m), ("not skew", indices)
            words.append((degree, indices, m))
    assert len(words) == 120
    for a, (_, _, x) in enumerate(words):
        assert pairing(x, x) == N
        for _, _, y in words[a + 1 :]:
            assert pairing(x, y) == 0, "two gamma words overlap"

    axis = gamma[8]
    jpair = times(times(gamma[0], gamma[7]), gamma[8])
    assert times(jpair, jpair) == negative(IDENTITY)
    assert times(jpair, axis) == times(axis, jpair)

    k_count: Counter[tuple[int, int]] = Counter()
    j_count: Counter[tuple[int, int]] = Counter()
    for degree, _, word in words:
        k_count[(degree, eigen_sign(axis, word))] += 1
        j_count[(degree, eigen_sign(jpair, word))] += 1
    assert k_count == Counter({(2, +1): 28, (2, -1): 8, (3, +1): 28, (3, -1): 56})
    assert j_count == Counter({(2, +1): 18, (2, -1): 18, (3, +1): 46, (3, -1): 38})

    # The SU(2) singlet coefficient in each fermion degree is weight 0
    # minus weight 2 for eight complex adjoint triplets.
    zero, one = [0] * 25, [0] * 25
    for a in range(9):
        for b in range(9):
            for c in range(9):
                coefficient = comb(8, a) * comb(8, b) * comb(8, c)
                k = a + b + c
                if b == c:
                    zero[k] += coefficient
                if b == c + 1:
                    one[k] += coefficient
    singlets = [z - o for z, o in zip(zero, one)]
    assert all(v >= 0 for v in singlets)
    assert sum(singlets) == 366080
    assert sum(singlets[0::2]) == sum(singlets[1::2]) == 183040

    # w(kL)=(1+a)^k in H*(RP8;F2)=F2[a]/(a^9).
    # Lucas' rule: binom(k,i) odd iff binary bits of i are within k.
    def sw_degrees(k: int) -> tuple[int, ...]:
        return tuple(i for i in range(9) if (i & k) == i)

    assert sw_degrees(28) == (0, 4, 8)
    assert sw_degrees(4) == (0, 4)
    assert sw_degrees(16) == (0,)
    assert all(len(sw_degrees(k)) > 1 for k in range(1, 16))

    # Stable KO identities, derived from lambda_t(Q)=(1+t)^9/(1+Lt),
    # L^2=1: Lambda2 Q =37-9L; Lambda3 Q =93-37L.
    # Hence E56=(Lambda2 Q)+(L tensor Lambda2 Q)=28+28L;
    # E64=(L tensor Q)+(Lambda3 Q)=92-28L.
    # Their reduced KO classes: +28([L]-1), -28([L]-1).
    print("SOURCE_PIN", actual)
    print("GAMMA_CLIFFORD_SQUARE_AND_ANTICOMMUTE_PASS")
    print("SKEW_GAMMA_WORD_BASIS_120_ORTHOGONAL_PASS")
    print("SPIN9_WORDS", {2: 36, 3: 84})
    print("ANTIPODAL_K_EIGEN_COUNTS", dict(k_count), "ranks", (56, 64))
    print("Fock_Jpair_EIGEN_COUNTS", dict(j_count), "ranks", (64, 56))
    print("SU2_SINGLET_EVEN_ODD", (183040, 183040))
    print("SW_E56_DEGREES", sw_degrees(28), "SW_E64_DEGREES", sw_degrees(4))
    print("BILINEAR_RP8_EXPLORATORY_INTEGER_CERTIFICATE_PASS")


if __name__ == "__main__":
    main()
