"""Exact signed coordinate stabilizer orbits of diagonal 3x9 fixtures.
No occupation data, NumPy, or GitHub Actions. Checks only coordinate geometry.
"""
import itertools as it
import json
from collections import deque
P=list(it.product(range(3),range(9)))

def identity(n):return tuple((i,1) for i in range(n))
def quarter(n,a,b):
    r=list(identity(n));r[a]=(b,1);r[b]=(a,-1);return tuple(r)
def det(R):
    p=[i for i,s in R]
    return (-1)**sum(p[i]>p[j] for i in range(len(p)) for j in range(i+1,len(p))) * prod(s for i,s in R)
def prod(xs):
    v=1
    for x in xs:v*=x
    return v

def generators(d):
    z=[a for a in range(3) if d[a]==0];unused=z+list(range(3,9))
    for a,b in it.combinations(z,2):yield quarter(3,a,b),identity(9)
    for i,j in it.combinations(unused,2):yield identity(3),quarter(9,i,j)
    for a,b in it.combinations(range(3),2):
        if d[a]==d[b] and d[a]!=0:yield quarter(3,a,b),quarter(9,a,b)

def check(d):
    X={(a,a):v for a,v in enumerate(d) if v};G=list(generators(d))
    for C,S in G:
        assert det(C)==det(S)==1
        assert {(C[a][0],S[i][0]):v*C[a][1]*S[i][1] for (a,i),v in X.items()}==X
    groups=[];left=set(P)
    while left:
        rep=min(left);paths={rep:[]};q=deque([rep])
        while q:
            a,i=q.popleft()
            for j,(C,S) in enumerate(G):
                b,k=C[a][0],S[i][0]
                if (b,k) not in paths:paths[b,k]=paths[a,i]+[j];q.append((b,k))
        for (a,i),path in paths.items():
            u,v=rep;sign=1
            for j in path:
                C,S=G[j];(u,sc),(v,ss)=C[u],S[v];sign*=sc*ss
            assert (u,v)==(a,i) and sign in (-1,1)
        left.difference_update(paths)
        groups.append({'representative':rep,'multiplicity':len(paths),'coordinates':sorted(paths)})
    assert sum(g['multiplicity'] for g in groups)==27
    assert len({p for g in groups for p in map(tuple,g['coordinates'])})==27
    return {'diag':d,'generator_count':len(G),'orbits':groups}

if __name__=='__main__':
    cases=[(0,0,0),(0,0,1),(0,1,2),(0,1,1),(1,2,3),(1,1,2),(1,1,1)]
    results=[check(d) for d in cases]
    expected=[1,4,9,5,12,7,3]
    assert [len(r['orbits']) for r in results]==expected,[(r['diag'],len(r['orbits'])) for r in results]
    print(json.dumps({'scope':'signed stabilizer coordinate orbit coverage only; no occupation contractions','results':results},indent=2))
