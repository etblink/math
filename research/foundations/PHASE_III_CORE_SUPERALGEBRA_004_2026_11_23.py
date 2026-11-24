"""Exact integer coefficient tests for SU(2) smooth-core charge-square identity.
Source Gamma9 words; color scale lambda=sqrt(2) restored in analytic receipt.
No native Lean qualification or domain result.
"""
import numpy as np
from itertools import combinations, product
from functools import reduce
I=np.eye(2,dtype=np.int64); J=np.array([[0,1],[-1,0]],dtype=np.int64)
X=np.array([[0,1],[1,0]],dtype=np.int64); Z=np.diag([1,-1]); E=np.eye(16,dtype=np.int64)
G=[reduce(np.kron,[dict(I=I,J=J,X=X,Z=Z)[c] for c in w]) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]
for i,j in product(range(9),repeat=2):
    assert np.array_equal(G[i].T,G[i])
    assert np.array_equal(G[i]@G[j]+G[j]@G[i],2*(i==j)*E)
vs=[E[:,a] for a in range(16)]+[E[:,a]+E[:,b] for a,b in combinations(range(16),2)]
for v,j in product(vs,range(9)):
    F=sum((np.outer(G[i]@v,G[i]@G[j]@v)+np.outer(G[i]@G[j]@v,G[i]@v) for i in range(9) if i!=j),np.zeros((16,16),dtype=np.int64))
    assert np.array_equal(F,-(v@v)*G[j]+(v@G[j]@v)*E)
print('Fierz: 136 spinor probes x 9 axes PASS')
def eps(a,b,c):
    if len({a,b,c})<3:return 0
    return 1 if (a,b,c) in [(0,1,2),(1,2,0),(2,0,1)] else -1
def cliff(x):return sum((int(x[i])*G[i] for i in range(9)),np.zeros((16,16),dtype=np.int64))
def pot(x,v):
    g=[cliff(x[:,a]) for a in range(3)]
    return np.concatenate([-(g[b]@g[c]-(x[:,b]@x[:,c])*E)@v for b,c in [(1,2),(2,0),(0,1)]])
# Coordinates and fermion labels both color-major. V defined with source
# gammaTwo rows, hence its transpose acting on v introduces a minus sign.
configs=[np.zeros((9,3),dtype=np.int64),np.eye(9,dtype=np.int64)[:,:3],np.arange(27,dtype=np.int64).reshape(9,3)%5-2,np.outer(np.arange(9,dtype=np.int64)-4,[1,2,-1])]
for v,x in product(vs,configs):
    h=np.array([v@g@v for g in G]); g=[cliff(x[:,a]) for a in range(3)]; r=v@v
    K=np.zeros((27,48),dtype=np.int64); D=K.copy()
    for a,i in product(range(3),range(9)):
        p=9*a+i; K[p,16*a:16*(a+1)]=G[i]@v
        y=np.zeros_like(x);y[i,a]=1
        # Exact central difference of the quadratic potential coefficient.
        diff=pot(x+y,v)-pot(x-y,v);assert not np.any(diff%2);D[p]=diff//2
    V=pot(x,v)
    assert np.array_equal(K@K.T,r*np.eye(27,dtype=np.int64))
    assert V@V==r*sum((x[:,b]@x[:,b])*(x[:,c]@x[:,c])-(x[:,b]@x[:,c])**2 for b,c in combinations(range(3),2))
    # Q(v)^2 first-order term is -i (K V) dot derivative.
    target=np.array([sum(eps(a,b,c)*x[i,b]*(h@x[:,c]) for b,c in product(range(3),repeat=2)) for a,i in product(range(3),range(9))])
    assert np.array_equal(-K@V,target)
    M=K.T@D;assert np.trace(M)==0
    F=M-M.T
    expected=np.block([[sum((eps(a,b,c)*(-r*g[c]+(h@x[:,c])*E) for c in range(3)),np.zeros_like(E)) for b in range(3)] for a in range(3)])
    assert np.array_equal(F,expected)
print('544 charge-square coefficient tests: kinetic, potential, first-order gauge, derivative/Yukawa PASS')
