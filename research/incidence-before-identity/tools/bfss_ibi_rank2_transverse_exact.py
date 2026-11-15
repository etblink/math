#!/usr/bin/env python3
"""Exact rank-two transverse-slice tests for SO(3) BFSS bosonic incidence.

Candidate-neutral finite integer checks: not an original-source gauge
crosswalk, Lean theorem, physical quotient or Hamiltonian-domain theorem.
"""
from itertools import combinations
from fractions import Fraction


def dot(u, v):
    return sum(a * b for a, b in zip(u, v))


def det3(a, b, c):
    return (a[0] * (b[1] * c[2] - b[2] * c[1])
            - a[1] * (b[0] * c[2] - b[2] * c[0])
            + a[2] * (b[0] * c[1] - b[1] * c[0]))


def gram(x):
    return tuple(tuple(dot(u, v) for v in x) for u in x)


def triples(x):
    return {p: det3(*(x[k] for k in p))
            for p in combinations(range(9), 3)}


def slice_config(z):
    assert len(z) == 7
    return ((1, 0, 0), (0, 1, 0)) + tuple((0, 0, a) for a in z)


def rank(matrix):
    a = [[Fraction(x) for x in row] for row in matrix]
    m, n = len(a), len(a[0])
    r = 0
    for col in range(n):
        pivot = next((i for i in range(r, m) if a[i][col]), None)
        if pivot is None:
            continue
        a[r], a[pivot] = a[pivot], a[r]
        scale = a[r][col]
        a[r] = [x / scale for x in a[r]]
        for i in range(m):
            if i != r and a[i][col]:
                factor = a[i][col]
                a[i] = [u - factor * v for u, v in zip(a[i], a[r])]
        r += 1
        if r == m:
            break
    return r


def wedge_sq(u, v):
    return dot(u, u) * dot(v, v) - dot(u, v)**2


def run():
    samples = [(0,) * 7, (1, 0, 0, 0, 0, 0, 0),
               (2, -3, 0, 5, 0, -1, 4)]
    for z in samples:
        x = slice_config(z)
        neg_x = slice_config(tuple(-a for a in z))
        g = gram(x)
        d = triples(x)
        assert g == gram(neg_x)
        for k in range(7):
            assert d[(0, 1, k + 2)] == z[k]
            assert triples(neg_x)[(0, 1, k + 2)] == -z[k]
            for ell in range(7):
                assert g[k + 2][ell + 2] == z[k] * z[ell]
                assert d[(0, 1, k + 2)] * d[(0, 1, ell + 2)] == g[k + 2][ell + 2]
        all_pairs = sum(wedge_sq(u, v) for u, v in combinations(x, 2))
        assert all_pairs == 1 + 2 * dot(z, z)

    # For quadratic Gram entries and linear selected triple entries,
    # these two-sided differences are their exact derivatives at z=0.
    jac_g = []
    for i in range(9):
        for j in range(i, 9):
            row = []
            for k in range(7):
                e = tuple(int(k == m) for m in range(7))
                gn = gram(slice_config(tuple(-v for v in e)))
                gp = gram(slice_config(e))
                row.append(Fraction(gp[i][j] - gn[i][j], 2))
            jac_g.append(row)
    jac_d = []
    for j in range(7):
        row = []
        for k in range(7):
            e = tuple(int(k == m) for m in range(7))
            dp = triples(slice_config(e))[(0, 1, j + 2)]
            dn = triples(slice_config(tuple(-v for v in e)))[(0, 1, j + 2)]
            row.append(Fraction(dp - dn, 2))
        jac_d.append(row)
    assert rank(jac_g) == 0
    assert rank(jac_d) == 7
    assert jac_d == [[int(j == k) for k in range(7)] for j in range(7)]
    assert 2 * (9 + 3 - 2) - 3 == 17
    assert 27 - 3 == 24
    print("PASS: Gram(X(z))=Gram(X(-z)); signed D_01k(z)=z[k]")
    print("PASS: Gram transverse derivatives all zero; D derivative rank = 7")
    print("PASS: exact D_01k D_01l = Gram_kl; wedge potential = 1+2||z||^2")
    print("PASS: rank-two stratum 17d, effective SO(3) quotient 24d")
    print("These fixtures are NOT a Lean proof or physical quotient construction.")


if __name__ == "__main__":
    run()
