#!/usr/bin/env python3
"""Independent exact G16 coefficient control. Numerical/model check, NOT a Lean proof."""
from pathlib import Path
from fractions import Fraction
import numpy as np
from random import Random

def qmul(a,b):
    a0,a1,a2,a3=a
    b0,b1,b2,b3=b
    return (a0*b0-a1*b1-a2*b2-a3*b3,
            a0*b1+a1*b0+a2*b3-a3*b2,
            a0*b2-a1*b3+a2*b0+a3*b1,
            a0*b3+a1*b2-a2*b1+a3*b0)

def qbar(a):
    return (a[0],-a[1],-a[2],-a[3])

def omul(x,y):
    a,b=x[:4],x[4:]
    c,d=y[:4],y[4:]
    u,v=qmul(a,c),qmul(qbar(d),b)
    p,q=qmul(d,a),qmul(b,qbar(c))
    return tuple(u[i]-v[i] for i in range(4))+tuple(p[i]+q[i] for i in range(4))

basis=[tuple(int(i==j) for i in range(8)) for j in range(8)]
A=[np.array([omul(basis[i],basis[j]) for j in range(8)],
            dtype=np.int64).T for i in range(8)]
z=np.zeros((8,8),dtype=np.int64)
u=np.eye(8,dtype=np.int64)
gammas=[np.block([[z,a],[a.T,z]]) for a in A]
gammas.append(np.block([[u,z],[z,-u]]))
one=np.eye(16,dtype=np.int64)
assert all(np.array_equal(g.T,g) for g in gammas)
assert all(np.array_equal(gammas[i]@gammas[j]+gammas[j]@gammas[i],
     2*int(i==j)*one) for i in range(9) for j in range(9))

planes=[(0,1),(2,3),(4,5),(6,7)]

def coefficient_112(X):
    """112 times the four-plane original G2 Y: 112/16=7, 112/56=2."""
    B=np.zeros((16,16),dtype=np.int64)
    for i,j in planes:
        B+=7*(X[i]*gammas[j]-X[j]*gammas[i])
        for k in range(9):
            if k not in (i,j):
                B+=2*X[k]*(gammas[k]@gammas[i]@gammas[j])
    return B

def check_vector(X):
    B=coefficient_112(X)
    observed=int(np.sum(B*B))
    expected=16*(61*sum(x*x for x in X[:8])+16*X[8]**2)
    assert observed==expected, (X,observed,expected)
    return observed

units=[check_vector([int(i==j) for i in range(9)]) for j in range(9)]
rng=Random(20261115)
random_tests=[check_vector([rng.randint(-9,9) for _ in range(9)])
              for _ in range(64)]
assert units==[976]*8+[256]
assert len(random_tests)==64
print("G16_EXACT_OCTONION_GAMMA_CONTROL_PASS", "relations=81", "vectors=73",
      "unit_first=976", "unit_ninth=256",
      "status=EXPLICIT_REPRESENTATION_ONLY_NOT_LEAN_QUALIFIED")
