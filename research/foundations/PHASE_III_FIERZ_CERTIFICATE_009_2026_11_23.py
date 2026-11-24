"""Exact integer Fierz coefficient certificate; no Lean/physical qualification.
Usage: python SCRIPT path/to/SU2RealGammaProbe.lean
Also accepts JSON containing literal extracted perm/sign tables.
"""
from pathlib import Path
from itertools import combinations, product
import json, re, sys
import numpy as np

path = Path(sys.argv[1])
if path.suffix == '.json':
    tables = json.loads(path.read_text())
else:
    source = path.read_text()
    def extract(name, next_name):
        block = source.split('private def '+name+' :', 1)[1].split('private def '+next_name+' ', 1)[0]
        rows = re.findall(r'\|\s*(\d+)\s*=>\s*!\[([^\]]+)\]', block)
        assert [int(k) for k,_ in rows] == list(range(9))
        return [[int(x.strip()) for x in row.split(',')] for _,row in rows]
    tables = {'perm':extract('perm','sign'), 'sign':extract('sign','gammaInt')}
P = np.array(tables['perm'], dtype=np.int64)
S = np.array(tables['sign'], dtype=np.int64)
assert P.shape == S.shape == (9,16)
assert all(sorted(row)==list(range(16)) for row in P.tolist())
assert set(S.ravel()) <= {-1,1}
G = np.zeros((9,16,16),dtype=np.int64)
for i,a in product(range(9),range(16)):
    G[i,a,P[i,a]]=S[i,a]
I=np.eye(16,dtype=np.int64)
for i,j in product(range(9),repeat=2):
    assert np.array_equal(G[i].T,G[i])
    assert np.array_equal(G[i]@G[j]+G[j]@G[i],2*int(i==j)*I)
# D[j,a,b,p,q] is the ordered coefficient of v[p]v[q] in LHS-RHS.
def coefficients(mut=None):
    D=np.zeros((9,16,16,16,16),dtype=np.int64)
    for j in range(9):
        for i in range(9):
            if i==j or (mut=='omit' and i==(j+1)%9): continue
            W=G[i]@G[(j+1)%9 if mut=='wrong_axis' else j]
            D[j]+=np.einsum('ap,bq->abpq',G[i],W)
            D[j]+=(-1 if mut=='flip_term' else 1)*np.einsum('ap,bq->abpq',W,G[i])
        D[j]+=(-1 if mut=='rhs_sign' else 1)*np.einsum('ab,pq->abpq',G[j],I)
        D[j]-=np.einsum('ab,pq->abpq',I,G[j])
    return D
D=coefficients()
assert np.array_equal(D+D.swapaxes(-1,-2),np.zeros_like(D))
print('ordered tensor entries:',D.size,'nonzero:',np.count_nonzero(D))
print('diagonal and unordered cross coefficients:',9*16*16*136,'PASS')
# Independently evaluate the matrix formula on symmetric basis matrices M.
# This avoids evaluating the same coefficient expansion twice.
checks=0
for p in range(16):
    for q in range(p,16):
        M=np.zeros_like(I); M[p,q]=M[q,p]=1
        for j in range(9):
            L=sum((G[i]@(M@G[j]+G[j]@M)@G[i] for i in range(9) if i!=j),np.zeros_like(I))
            R=-np.trace(M)*G[j]+np.trace(G[j]@M)*I
            assert np.array_equal(L,R)
            checks+=1
print('symmetric matrix linear-map certificate:',checks,'PASS')
# A wrong proof that demands every ordered coefficient vanish must fail.
idx=tuple(int(x) for x in np.argwhere(D!=0)[0]); print('ordered-only counterexample:',idx,int(D[idx]))
for mut in ['omit','wrong_axis','flip_term','rhs_sign']:
    A=coefficients(mut); B=A+A.swapaxes(-1,-2)
    idx=tuple(int(x) for x in np.argwhere(B!=0)[0]);j,a,b,p,q=idx
    print('mutant',mut,'witness',idx,'residual',int(B[idx]//2 if p==q else B[idx]))
# Diagonal-only probes are insufficient: symmetric mixed coefficient mutant.
M=np.zeros((16,16),dtype=np.int64);M[0,1]=M[1,0]=1
assert all(I[:,p]@M@I[:,p]==0 for p in range(16))
assert (I[:,0]+I[:,1])@M@(I[:,0]+I[:,1])==2
print('diagonal-only mutation rejected by cross probe (0,1): 2')
# Independent structural certificate: symmetric Clifford words of grades 0,1,4.
words=[]
for k in (0,1,4):
    for inds in combinations(range(9),k):
        W=I.copy()
        for i in inds: W=W@G[i]
        assert np.array_equal(W,W.T)
        words.append(W)
A=np.array(words).reshape(136,256)
assert np.array_equal(A@A.T,16*np.eye(136,dtype=np.int64))
print('symmetric Clifford basis: 136 orthogonal words PASS')
print('PASS')
