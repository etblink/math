"""Independent rank-one fast fermion model. Not native BFSS qualification."""
import sympy as s
from collections import Counter
from math import cos,pi

def conj(a): return (a[0],)+tuple(-x for x in a[1:])
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mul(a,b):
    if len(a)==1:return (a[0]*b[0],)
    k=len(a)//2;x,y=a[:k],a[k:];u,v=b[:k],b[k:]
    return add(mul(x,u),tuple(-z for z in mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
I=s.eye(8);O=s.zeros(8);Id=s.eye(16)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
assert all(G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id for i in range(9) for j in range(9))
C=s.Matrix([[0,1,0],[-1,0,0],[0,0,0]])
A=s.kronecker_product(C,G[8]);assert A.eigenvals()=={s.I:16,-s.I:16,0:16}
assert A*A==-s.kronecker_product(s.diag(1,1,0),Id)
full=Counter();neutral=Counter()
for b in range(1<<16):
    p=(b&255).bit_count();h=8-(b>>8).bit_count();q=p-h;energy=p+h
    full[energy]+=1
    if q==0:neutral[energy]+=1
assert neutral=={2*k:s.binomial(8,k)**2 for k in range(9)}
assert sum(neutral.values())==s.binomial(16,8)==12870
assert neutral[2]==64
# Weyl implementer W=product of 16 imaginary Majoranas; maps c to c^dagger.
def W(b):
    z=1
    for j in reversed(range(16)):
        z*=(-1)**((b&((1<<j)-1)).bit_count())*(1j if not b>>j&1 else -1j)
        b^=1<<j
    return b,z
for b in range(1<<16):
    c,z=W(b);d,w=W(c)
    assert c==b^65535 and d==b and z*w==1
    assert (b&255).bit_count()+8-(b>>8).bit_count()==(c>>8).bit_count()+8-(c&255).bit_count()
    assert c.bit_count()-8==-(b.bit_count()-8)
print('rank-one skew frequency spectrum:',A.eigenvals())
print('neutral excitation multiplicities:',sorted(neutral.items()))
print('Weyl complement, square and energy/charge checks: 65536 PASS')
F=G[0]*G[1]/2
Fp=F[:8,:8];Fm=F[8:,8:];assert Fp.T==-Fp and Fm.T==-Fm
assert Fp*Fp==Fm*Fm==-I/4
Fn=s.kronecker_product(Fp,I)+s.kronecker_product(I,-Fm.T)
assert Fn.eigenvals()=={s.I:16,-s.I:16,0:32}
assert s.trace(Fn.T*Fn)==32
print('neutral curvature spectrum:',Fn.eigenvals())
assert s.kronecker_product(-I,-I)==s.eye(64)
for deg in [0,30,60,90,120,180]:
    tr=cos(pi*cos(deg*pi/180))**2
    print('latitude',deg,'neutral normalized trace',round(tr,9))
print('PASS')
