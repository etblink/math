from itertools import combinations, product
from collections import Counter

def rank(rows):
    basis={}
    for x in rows:
        while x:
            k=x.bit_length()-1
            if k in basis: x^=basis[k]
            else: basis[k]=x; break
    return len(basis)

def components(n, edges):
    p=list(range(n))
    def root(i):
        while p[i]!=i: i=p[i]
        return i
    for i,j in edges: p[root(i)]=root(j)
    return len({root(i) for i in range(n)})

def coboundaries(n,edges):
    return {sum((((g>>i)^(g>>j))&1)<<k for k,(i,j) in enumerate(edges)) for g in range(1<<n)}

def check_graph(n,edges):
    m=len(edges); c=components(n,edges); b=m-n+c
    G=coboundaries(n,edges)
    assert len(G)==2**(n-c)
    remaining=set(range(1<<m)); orbits=0; connected=0
    while remaining:
        a=min(remaining); orbit={a^g for g in G}; assert orbit<=remaining
        remaining-=orbit; orbits+=1
        if c==1:
            lift=[(2*i+s,2*j+(s^((a>>k)&1))) for k,(i,j) in enumerate(edges) for s in (0,1)]
            lc=components(2*n,lift)
            assert lc==(2 if a in G else 1)
            connected+=lc==1
    assert orbits==2**b
    return c,b,orbits,connected

def triangle_fill(n,edges):
    index={e:i for i,e in enumerate(edges)}
    rows=[sum(1<<index[e] for e in combinations(t,2)) for t in combinations(range(n),3) if all(e in index for e in combinations(t,2))]
    b=len(edges)-n+components(n,edges)
    G=coboundaries(n,edges)
    flat={a for a in range(1<<len(edges)) if all((a&r).bit_count()%2==0 for r in rows)}
    assert G<=flat
    assert len(flat)//len(G)==2**(b-rank(rows))
    return b-rank(rows)

if __name__=='__main__':
    for n in range(1,6):
        E=list(combinations(range(n),2)); C=Counter(); hist=Counter()
        for bits in range(1<<len(E)):
            edges=[e for k,e in enumerate(E) if bits>>k&1]
            c,b,o,k=check_graph(n,edges)
            h=triangle_fill(n,edges)
            C['graphs']+=1; C['signings']+=2**len(edges); C['gauge_classes']+=o
            if c==1:
                C['connected_bases']+=1; C['connected_bases_with_twist']+=b>0
                C['connected_bases_with_flat_twist']+=h>0
                C['connected_cover_classes']+=k
                hist[(b,h)]+=1
        print(n,dict(C),'(cycle_rank, filled_rank):',sorted(hist.items()))
    examples={'path4':(4,[(0,1),(1,2),(2,3)]),'triangle':(3,[(0,1),(0,2),(1,2)]),'square':(4,[(0,1),(0,3),(1,2),(2,3)]),'square_diagonal':(4,[(0,1),(0,2),(0,3),(1,2),(2,3)]),'K4':(4,list(combinations(range(4),2)))}
    for name,(n,e) in examples.items(): print(name,check_graph(n,e),'filled H1 rank',triangle_fill(n,e))
