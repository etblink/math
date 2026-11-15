#!/usr/bin/env python3
"""Exact integer determinant-vs-source-cross column orientation tests.

Original source polynomial convention is:
  colorCross(u,v) = (u1 v2-u2 v1, u2 v0-u0 v2, u0 v1-u1 v0)
  G3A R(g) B A = adjointCoefficient g A B (output ROW / input COLUMN).
This checker proves no original-gauge theorem; it falsifies sign/order bugs.
"""


def color_cross(u, v):
    return (u[1]*v[2] - u[2]*v[1],
            u[2]*v[0] - u[0]*v[2],
            u[0]*v[1] - u[1]*v[0])


def dot(u, v):
    return sum(x*y for x,y in zip(u,v))


def column(R, j):
    return tuple(R[i][j] for i in range(3))


def determinant(R):
    a, b, c = R
    return (a[0]*(b[1]*c[2]-b[2]*c[1])
            -a[1]*(b[0]*c[2]-b[2]*c[0])
            +a[2]*(b[0]*c[1]-b[1]*c[0]))


def test(R, expected=None):
    value = dot(color_cross(column(R,0), column(R,1)),column(R,2))
    direct = determinant(R)
    assert value == direct, (R,value,direct)
    if expected is not None:
        assert value == expected, (R,value,expected)


def main():
    I=((1,0,0),(0,1,0),(0,0,1))
    proper=((0,-1,0),(1,0,0),(0,0,1))
    parity=((1,0,0),(0,1,0),(0,0,-1))
    odd_swap=((0,1,0),(1,0,0),(0,0,1))
    test(I,1)
    test(proper,1)
    test(parity,-1)
    test(odd_swap,-1)
    test(((1,2,3),(4,5,6),(7,8,10)),-3)
    # Adversarial integer examples: determinant identity on nonorthogonal data
    for a in range(-2,3):
        for b in range(-2,3):
            R=((1,a,b),(0,1,a),(b,0,1))
            test(R)
    assert dot(color_cross((1,0,0),(0,1,0)),(0,0,1)) == 1
    assert dot(color_cross((0,1,0),(1,0,0)),(0,0,1)) == -1
    print("PASS source colorCross columns = real det, all integer controls")
    print("PASS proper and improper signed orientation and signed basis swaps")
    print("Finite exact checks, NOT native original SU(2) Lean qualification.")


if __name__=="__main__":
    main()
