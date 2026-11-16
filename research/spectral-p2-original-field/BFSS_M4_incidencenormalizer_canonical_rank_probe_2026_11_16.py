#!/usr/bin/env python3
"""Canonical octonionic Clifford9 x so3 Yukawa-incidence normalizer probe.

Independent finite-algebra computation; NOT the original BFSS source
gamma basis, not a Lean proof, and not a full-Hamiltonian symmetry test.
Requires Python3, numpy, scipy. Uses integer arithmetic and modular rank.
"""
import numpy as np
from scipy.sparse import coo_matrix, csr_matrix, vstack

def qmul(a,b):
    a0,a1,a2,a3=a
    b0,b1,b2,b3=b
    return np.array([
        a0*b0-a1*b1-a2*b2-a3*b3,
        a0*b1+a1*b0+a2*b3-a3*b2,
        a0*b2-a1*b3+a2*b0+a3*b1,
        a0*b3+a1*b2-a2*b1+a3*b0],dtype=np.int64)

def qconj(a):
    t=np.array(a,dtype=np.int64).copy()
    t[1:]*=-1
    return t

def omul(x,y):
    a,b=x[:4],x[4:]
    c,d=y[:4],y[4:]
    return np.r_[qmul(a,c)-qmul(d,qconj(b)),
                 qmul(qconj(a),d)+qmul(c,b)]

unit8=np.eye(8,dtype=np.int64)
A=[np.array([omul(unit8[i],unit8[j])
             for j in range(8)],dtype=np.int64).T for i in range(8)]
I8=np.eye(8,dtype=np.int64)
Z8=np.zeros((8,8),dtype=np.int64)
gamma=[np.block([[Z8,a],[a.T,Z8]]) for a in A]
gamma.append(np.block([[I8,Z8],[Z8,-I8]]))
I16=np.eye(16,dtype=np.int64)
for i in range(9):
    for j in range(9):
        assert np.array_equal(gamma[i]@gamma[j]+gamma[j]@gamma[i],
             (2 if i==j else 0)*I16), (i,j)

def eps(a,b,c):
    if len({a,b,c})<3:return 0
    return 1 if (a,b,c) in ((0,1,2),(1,2,0),(2,0,1)) else -1

color=[np.array([[eps(a,b,c) for c in range(3)]
                 for b in range(3)],dtype=np.int64) for a in range(3)]
Y=[np.kron(g,l) for g in gamma for l in color]
n=48
pairs=[(i,j) for i in range(n) for j in range(i+1,n)]
N=len(pairs)
ix={p:k for k,p in enumerate(pairs)}

def coords(mat):
    return np.array([mat[i,j] for i,j in pairs],dtype=np.int64)

Yrows=np.stack([coords(y) for y in Y])
assert np.array_equal(Yrows@Yrows.T,16*np.eye(27,dtype=np.int64))
assert all(np.array_equal(y+y.T,np.zeros((n,n),dtype=np.int64))
           for y in Y)

def ad_matrix(y):
    """Column uv = upper-triangle coordinates of [E_uv-E_vu,y]."""
    rr=[];cc=[];vv=[]
    for col,(u,v) in enumerate(pairs):
        for j in np.nonzero(y[v,:])[0]:
            if u<j: rr.append(ix[u,j]);cc.append(col);vv.append(int(y[v,j]))
        for j in np.nonzero(y[u,:])[0]:
            if v<j: rr.append(ix[v,j]);cc.append(col);vv.append(-int(y[u,j]))
        for i in np.nonzero(y[:,v])[0]:
            if i<u: rr.append(ix[i,u]);cc.append(col);vv.append(int(y[i,v]))
        for i in np.nonzero(y[:,u])[0]:
            if i<v: rr.append(ix[i,v]);cc.append(col);vv.append(-int(y[i,u]))
    return coo_matrix((vv,(rr,cc)),shape=(N,N),dtype=np.int64).tocsr()

U=csr_matrix(Yrows)
# W is the 27-row span of the Y matrices in upper-triangle coordinates.
# U U^T = 16 I, hence 16*(I-P_W) = 16 I - U^T U.
blocks=[]
for y in Y:
    D=ad_matrix(y)
    blocks.append(16*D-U.T@(U@D))
M=vstack(blocks,format="csr")
Gram=(M.T@M).tocsr()
assert M.shape==(27*1128,1128)
assert Gram.shape==(1128,1128)

def rank_mod(mat, p):
    a=np.asarray(mat.toarray() if hasattr(mat,"toarray") else mat,
                 dtype=np.int64)%p
    nrows,ncols=a.shape
    rank=0
    for c in range(ncols):
        nz=np.flatnonzero(a[rank:,c])
        if len(nz)==0:continue
        k=rank+int(nz[0])
        if k!=rank:a[[rank,k],:]=a[[k,rank],:]
        inv=pow(int(a[rank,c]),-1,p)
        if rank<nrows-1:
            rows=np.flatnonzero(a[rank+1:,c])+rank+1
            if len(rows):
                fac=(a[rows,c]*inv)%p
                a[rows,c:]=(a[rows,c:]-fac[:,None]*a[rank,c:])%p
        rank+=1
        if rank==nrows:break
    return rank

I3=np.eye(3,dtype=np.int64)
spin=[np.kron(gamma[i]@gamma[j],I3)
      for i in range(9) for j in range(i+1,9)]
colors=[np.kron(I16,l) for l in color]
Z=np.stack([coords(z) for z in spin+colors],axis=1)
assert Z.shape==(1128,39)
assert np.count_nonzero(M@Z)==0
for p in (97,101,103,1009):
    rg=rank_mod(Gram,p)
    rz=rank_mod(Z,p)
    assert (rg,rz)==(1089,39),(p,rg,rz)
    print(f"GF({p}) Gram rank: {rg}; 39 candidate generator rank: {rz}")
print("CL9 CAR verified; 27 Yukawa matrices; 1128 so48 generators")
print("39 exact candidate kernel directions; normalizer dim over R = 39")
print("NOTE: canonical incidence only. No source-exact or Hamiltonian theorem.")
