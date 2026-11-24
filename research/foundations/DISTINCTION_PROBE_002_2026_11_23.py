from itertools import product
from collections import Counter

def partition(labels):
    seen={}
    return tuple(seen.setdefault(x,len(seen)) for x in labels)

def all_partitions(n):
    return sorted({partition(p) for p in product(range(n),repeat=n)})

def step(f, xs):
    return tuple(f[x] for x in xs)

def refine(p,f):
    return partition((p[x],p[f[x]]) for x in range(len(f)))

def factor(p,f):
    return all(p[i]!=p[j] or p[f[i]]==p[f[j]] for i in range(len(f)) for j in range(len(f)))

def reversible(p,f):
    return all((p[i]==p[j])==(p[f[i]]==p[f[j]]) for i in range(len(f)) for j in range(len(f)))

def coarsens(p,q):
    # p coarser than q
    return all(q[i]!=q[j] or p[i]==p[j] for i in range(len(q)) for j in range(len(q)))

def audit(n):
    ps=all_partitions(n)
    stats=Counter()
    for f in product(range(n),repeat=n):
        rev=[r for r in ps if reversible(r,f)]
        periodic=tuple(range(n))
        for _ in range(n):
            periodic=step(f,periodic)
        full=partition(periodic)
        assert reversible(full,f)
        assert all(coarsens(r,full) for r in rev)
        for p in ps:
            q=p
            while (r:=refine(q,f))!=q: q=r
            tail=partition(q[x] for x in periodic)
            # Independent direct history computation.
            xs=tuple(range(n))
            histories=[[] for _ in xs]
            for t in range(2*n):
                for i,x in enumerate(xs): histories[i].append(p[x])
                xs=step(f,xs)
            assert q==partition(tuple(h) for h in histories)
            assert tail==partition(tuple(h[n:]) for h in histories)
            assert reversible(tail,f)
            assert coarsens(tail,q)
            assert all(coarsens(r,tail) for r in rev if coarsens(r,q))
            stats['models']+=1
            stats['history_nontrivial']+=len(set(q))>1
            stats['tail_nontrivial']+=len(set(tail))>1
            stats['history_strictly_more']+=q!=tail
            stats['all_history_distinctions_transient']+=len(set(q))>1 and len(set(tail))==1
            stats['mixed_transient_persistent']+=q!=tail and len(set(tail))>1
            stats['noninjective_with_tail_distinction']+=len(set(f))<n and len(set(tail))>1
            stats['present_not_enough_for_tail']+=not coarsens(tail,p)
            stats['tail_not_enough_for_present']+=not coarsens(p,tail)
    return dict(stats)

if __name__ == "__main__":
    for n in range(1,5):
        print(n,audit(n))
