"""Exact representation branching and frozen transverse form bound; not a full BFSS proof."""
from fractions import Fraction as F
from itertools import product, combinations

def dim(weight, kind):
    w=tuple(map(F,weight)); n=len(w)
    rho=tuple(F(n-i-1)+(F(1,2) if kind=='B' else 0) for i in range(n))
    a=tuple(x+y for x,y in zip(w,rho)); out=F(1)
    for i,j in combinations(range(n),2):
        out*= (a[i]-a[j])*(a[i]+a[j])/((rho[i]-rho[j])*(rho[i]+rho[j]))
    if kind=='B':
        for x,y in zip(a,rho):out*=x/y
    assert out.denominator==1
    return int(out)
def interval(lo,hi):
    lo,hi=F(lo),F(hi);return [lo+i for i in range(int(hi-lo)+1)]
def restrict(w):
    w=tuple(map(F,w)); a,b,c,d=w
    return list(product(interval(b,a),interval(c,b),interval(d,c),interval(-d,d)))
S=[(2,0,0,0),(1,1,1,0),(F(3,2),F(1,2),F(1,2),F(1,2))]
assert [dim(w,'B') for w in S]==[44,84,128]
slow=set()
for w in S:
    vs=restrict(w); assert sum(dim(v,'D') for v in vs)==dim(w,'B')
    slow.update(vs); print('slow',w,[(tuple(map(str,v)),dim(v,'D')) for v in vs])
assert len(slow)==9
for w in [(0,0,0,0),(2,0,0,0),(2,2,2,0),(F(5,2),F(3,2),F(3,2),F(1,2))]:
    vs=restrict(w); assert sum(dim(v,'D') for v in vs)==dim(w,'B')
    inter=set(vs)&slow
    print('partner',w,'dim',dim(w,'B'),'restricted',[(tuple(map(str,v)),dim(v,'D')) for v in vs],'vacuum overlap',len(inter))
    if w in [(0,0,0,0),(2,0,0,0)]:assert inter
    else:assert not inter
# Source frequency matrix Frobenius norm via gamma orthogonality and epsilon contractions.
import numpy as np
from functools import reduce
I=np.eye(2,dtype=np.int64); J=np.array([[0,1],[-1,0]],dtype=np.int64); X=np.array([[0,1],[1,0]],dtype=np.int64); Z=np.diag([1,-1]); E=np.eye(16,dtype=np.int64)
G=[reduce(np.kron,[dict(I=I,J=J,X=X,Z=Z)[c] for c in w]) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]
for i,j in product(range(9),repeat=2):assert np.trace(G[i].T@G[j])==16*(i==j)
C=[np.array([[0,0,0],[0,0,1],[0,-1,0]]),np.array([[0,0,-1],[0,0,0],[1,0,0]]),np.array([[0,1,0],[-1,0,0],[0,0,0]])]
B=[np.kron(c,g) for c in C for g in G]
for i,j in product(range(27),repeat=2):assert np.sum(B[i]*B[j])==32*(i==j)
# A=sqrt(2) sum x_i B_i: ||A||_F²=64 |x|². ||iK(A)||≤(1/2) sqrt(24*||A||_F²/2)=sqrt(192)|x|.
C2=F(192); delta=F(1,18); coefficient=(1-delta)*9-8; remainder=C2/(4*delta)
assert coefficient==F(1,2) and remainder==864
print('729 Frobenius inner products PASS; C²=',C2,'retained kinetic coefficient=',delta/2,'linear gain in omega units=',coefficient,'error constant=',remainder)
print('PASS')
# Exact constants for the fixed-color cone localization argument.
kappa=F(32,33); near=F(99,100); net=F(99,100); away=F(1,200)
assert near*net>kappa
assert (1-near**2)/3>away
assert 9*(1-delta)-8/kappa==F(1,4)
print('cone: r/rho >',kappa,'; gap coefficient >=',F(1,4),'omega; far potential >',away,'rho^4')
