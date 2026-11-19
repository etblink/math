#!/usr/bin/env python3
"""RHOPF-P1 independent finite algebra consumer, NOT a Lean/physics gate.

Requires the P0 gamma fixture extracted from original Lean blob
b9b8192055c70f0d001d7982669b9823c55562ed. A strict checkout
must additionally rerun P0's source/fixture SHA guard. This script
checks the resulting exact octonion product, Spin(9) Lie brackets,
Hopf coordinate restrictions and based escape homotopy.
"""
import json
import math
from itertools import product
from pathlib import Path

PATH = Path(__file__).resolve().parent.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
f = json.loads(PATH.read_text())
assert f.get('source_git_blob_sha',f.get('source_sha')) == 'b9b8192055c70f0d001d7982669b9823c55562ed'
p,s=f['perm'],f['sign']
assert len(p)==len(s)==9 and all(len(row)==16 for row in p+s)

def basis(i,n=8):return tuple(int(i==j) for j in range(n))
def B(u,v):return tuple(sum(s[k][i]*u[i]*v[p[k][i]-8] for i in range(8)) for k in range(8))
L=[B(basis(i),basis(0)) for i in range(8)]
R=[B(basis(0),basis(i)) for i in range(8)]
assert L[0]==R[0]==basis(7)
for columns in (L,R):
    assert all(sum(a[k]*b[k] for k in range(8))==int(i==j)
               for i,a in enumerate(columns) for j,b in enumerate(columns))
def inv(w,columns):return tuple(sum(columns[i][k]*w[k] for k in range(8)) for i in range(8))
def octmul(x,y):return B(inv(x,L),inv(y,R))

# Explicit isometric basis identification with a UNITAL octonion algebra.
T=[]
for i in range(8):
    row=[]
    for j in range(8):
        z=octmul(basis(i),basis(j))
        assert sum(abs(q) for q in z)==1
        k=next(k for k,v in enumerate(z) if v)
        row.append((z[k],k))
    T.append(row)
assert all(octmul(basis(7),basis(i))==basis(i)==octmul(basis(i),basis(7)) for i in range(8))
assert all(octmul(basis(i),basis(i))==tuple(-x for x in basis(7)) for i in range(7))
assert all(octmul(basis(i),basis(j))==tuple(-x for x in octmul(basis(j),basis(i)))
           for i in range(7) for j in range(i+1,7))
def assoc(i,j,k):
    a,b,c=basis(i),basis(j),basis(k)
    return tuple(x-y for x,y in zip(octmul(octmul(a,b),c),octmul(a,octmul(b,c))))
assert assoc(0,1,2)==(0,0,0,0,-2,0,0,0)
for i,j,k in product(range(8),repeat=3):
    assert assoc(i,j,k)==tuple(-x for x in assoc(j,i,k))
    assert assoc(i,j,k)==tuple(-x for x in assoc(i,k,j))
# A quaternion subalgebra exists but is NOT dynamically selected.
H={0,1,3,7}
assert all(all(x==0 or k in H for k,x in enumerate(octmul(basis(i),basis(j))))
           for i in H for j in H)
assert octmul(basis(0),basis(1))==basis(3)
assert octmul(basis(1),basis(3))==basis(0)
assert octmul(basis(3),basis(0))==basis(1)

# Check image supports of the actual quadratic Gamma map, not an invented map.
def image_support(spin_support):
    return sorted(k for k in range(9)
                  if any(p[k][i]==j for i in spin_support for j in spin_support))
assert image_support([0,1,8,9])==[0,7,8]  # C^2 -> C+R = S^2
assert image_support([0,1,2,3,8,9,10,11])==[0,1,3,7,8] # H^2 -> H+R = S^4
assert image_support(list(range(16)))==list(range(9))

# 36 bivectors, 324 component commutators, 82,944 integer entries.
g=[[[s[k][i] if p[k][i]==j else 0 for j in range(16)] for i in range(16)] for k in range(9)]
def mm(A,B):return [[sum(A[i][r]*B[r][j] for r in range(16))
                     for j in range(16)] for i in range(16)]
count=0
for a in range(9):
 for b in range(a+1,9):
    X=mm(g[a],g[b])
    assert all(X[i][j]==-X[j][i] for i,j in product(range(16),repeat=2))
    for k in range(9):
      GX,XG=mm(g[k],X),mm(X,g[k])
      for i,j in product(range(16),repeat=2):
        target=(2*g[b][i][j] if k==a else 0)-(2*g[a][i][j] if k==b else 0)
        assert GX[i][j]-XG[i][j]==target
        count+=1
assert count==82944

# Based nullhomotopy after permitting ONE extra direction, including
# for a quaternionic spinor (S^3) embedded in S^15.
def escape(q,t):
    assert abs(sum(v*v for v in q)-1)<1e-12
    c,z=math.cos(t),math.sin(t)
    a=q[0]
    return (c*c*a+z*z,)+(tuple(c*v for v in q[1:]))+(z*c*(1-a),)
for q in ((1.,0.,0.,0.),(-1.,0.,0.,0.),(0.,1.,0.,0.),(.5,.5,.5,.5)):
 for t in (0.,.2,.7,1.1,math.pi/2):
    X=escape(q,t)
    assert abs(sum(v*v for v in X)-1)<1e-12
    if q==(1.,0.,0.,0.):assert max(abs(v-int(i==0)) for i,v in enumerate(X))<1e-12
 assert max(abs(v-int(i==0)) for i,v in enumerate(escape(q,math.pi/2)))<1e-12

print(json.dumps({'status':'LOCAL_EXACT_ALGEBRA_PASS_NO_FORMAL_OR_PHYSICAL_QUALIFICATION',
'original_gamma_source_sha':f.get('source_git_blob_sha',f.get('source_sha')),
'unit_octonion_basis_index':7,
'quaternion_basis_indices':[7,0,1,3],
'complex_spinor_source_indices':[0,1,8,9],
'quaternion_spinor_source_indices':[0,1,2,3,8,9,10,11],
'spin9_commutator_entries_checked':count,
'octonion_nonassociativity_witness':assoc(0,1,2),
'allow_extra_direction_unwinds_quaternion_spinor':True,
'physical_stability_proven':False},indent=2))
