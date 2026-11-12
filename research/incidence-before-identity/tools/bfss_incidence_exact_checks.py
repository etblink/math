#!/usr/bin/env python3
"""Exact integer fixtures for BFSS bosonic incidence relations.

Diagnostics only: these examples do not prove the general orbit-separation
theorem and do not verify the original source's Lean gauge action.
"""
from itertools import combinations


def dot(u, v):
    return sum(a * b for a, b in zip(u, v))


def det3(a, b, c):
    return (a[0] * (b[1] * c[2] - b[2] * c[1])
            - a[1] * (b[0] * c[2] - b[2] * c[0])
            + a[2] * (b[0] * c[1] - b[1] * c[0]))


def gram(x):
    return tuple(tuple(dot(u, v) for v in x) for u in x)


def triple(x):
    return {indices: det3(*(x[i] for i in indices))
            for indices in combinations(range(len(x)), 3)}


def action(matrix, x):
    return tuple(tuple(dot(row, v) for row in matrix) for v in x)


def check_minor_identity(x):
    g, d = gram(x), triple(x)
    for i in d:
        for j in d:
            block = [[g[a][b] for b in j] for a in i]
            assert det3(*block) == d[i] * d[j], (i, j)


def run():
    zeros = ((0, 0, 0),) * 6
    x = ((1, 0, 0), (0, 1, 0), (0, 0, 1)) + zeros
    r = ((0, -1, 0), (1, 0, 0), (0, 0, 1))
    s = ((1, 0, 0), (0, 1, 0), (0, 0, -1))
    assert det3(*r) == 1 and det3(*s) == -1
    assert gram(x) == gram(action(r, x))
    assert triple(x) == triple(action(r, x))
    assert gram(x) == gram(action(s, x))
    assert triple(x) != triple(action(s, x))
    assert triple(action(s, x))[(0, 1, 2)] == -1

    x2 = ((1, 0, 0), (0, 1, 0)) + ((0, 0, 0),) * 7
    improper = ((-1, 0, 0), (0, 1, 0), (0, 0, 1))
    proper = ((-1, 0, 0), (0, 1, 0), (0, 0, -1))
    assert det3(*improper) == -1 and det3(*proper) == 1
    assert action(improper, x2) == action(proper, x2)
    assert gram(x2) == gram(action(improper, x2))
    assert all(v == 0 for v in triple(x2).values())

    x1 = ((2, 0, 0),) + ((0, 0, 0),) * 8
    flip = ((-1, 0, 0), (0, -1, 0), (0, 0, 1))
    assert det3(*flip) == 1 and action(flip, x1)[0] == (-2, 0, 0)
    assert gram(x1) == gram(action(flip, x1))

    nontrivial = ((1, 2, 3), (0, 1, 4), (2, -1, 0),
                  (1, 0, 1), (-2, 1, 1)) + ((0, 0, 0),) * 4
    check_minor_identity(nontrivial)
    print('PASS: SO(3) exact Gram/triple invariance')
    print('PASS: rank-three O(3) reflection distinguished by orientation')
    print('PASS: rank-two orientation reversal repaired by a proper rotation')
    print('PASS: rank-one sign reversal is gauge-related')
    print('PASS: Cauchy-Binet D_I D_J = det(G_{I,J}) for all 84x84 triples')
    print('These are exact integer fixtures, NOT Lean qualification or general proof.')


if __name__ == '__main__':
    run()
