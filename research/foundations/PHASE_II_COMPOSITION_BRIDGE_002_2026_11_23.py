"""Exact controls for sign, order, and associativity. No empirical claims."""
import sympy as s
from itertools import product
I=s.eye(2); X=s.Matrix([[0,1],[1,0]]); Z=s.diag(1,-1)
A=-s.I*X; B=-s.I*Z
R=s.Matrix([[0,-1],[1,0]]); S=Z

def key(M): return tuple(M)
def group(a,b):
    G={key(I):I}; frontier=[I]
    while frontier:
        x=frontier.pop()
        for y in (a,b):
            z=s.simplify(x*y); k=key(z)
            if k not in G: G[k]=z; frontier.append(z)
            assert len(G)<=16
    return list(G.values())
for name,a,b in [('Q8',A,B),('D4',R,S)]:
    G=group(a,b)
    assert len(G)==8 and a*b==-b*a
    assert a*b*a.inv()*b.inv()==-I
    assert all(g.conjugate().T*g==I for g in G)
    count=sum(g*g==-I for g in G)
    assert count== (6 if name=='Q8' else 2)
    print(name,'order',len(G),'squares -I',count,'generator squares',a*a== -I,b*b== -I)
# Independently verify a small exact Cayley-Dickson multiplication convention.
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def neg(a): return tuple(-x for x in a)
def conj(a): return (a[0],)+neg(a[1:])
def mul(a,b):
    if len(a)==1: return (a[0]*b[0],)
    k=len(a)//2; x,y=a[:k],a[k:]; u,v=b[:k],b[k:]
    return add(mul(x,u),neg(mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
def basis(n,i): return tuple(int(j==i) for j in range(n))
for n in (1,2,4,8):
    E=[basis(n,i) for i in range(n)]
    failures=[(i,j,k) for i,j,k in product(range(n),repeat=3) if mul(mul(E[i],E[j]),E[k])!=mul(E[i],mul(E[j],E[k]))]
    assert len(failures)==(168 if n==8 else 0)
    print('dimension',n,'basis associativity failures',len(failures),'of',n**3)
    if failures:
        i,j,k=failures[0]; a,b,c=E[i],E[j],E[k]
        left=mul(mul(a,b),c); right=mul(a,mul(b,c))
        assert left==neg(right)
        def L(a): return s.Matrix.hstack(*(s.Matrix(mul(a,e)) for e in E))
        assert L(a)*L(b)*L(c)==(L(a)*L(b))*L(c)
        assert L(a)*L(b)!=L(mul(a,b))
        assert all(L(e).T*L(e)==s.eye(n) for e in E)
        print('octonion witness',i,j,k,left,right)
# A norm-preserving group need not have a division algebra as linear span.
# Real 2x2 matrices include singular nonzero elements even though SO(2) and O(2) preserve vector norms.
P=s.diag(1,0); T=s.diag(0,1)
assert P!=s.zeros(2) and T!=s.zeros(2) and P*T==s.zeros(2)
print('all assertions passed')
