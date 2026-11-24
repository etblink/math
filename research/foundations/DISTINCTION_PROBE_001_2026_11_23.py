from itertools import combinations, permutations, product
from collections import Counter

def signature(values):
    seen = {}
    return tuple(seen.setdefault(v, len(seen)) for v in values)

def partitions(n):
    return sorted({signature(p) for p in product(range(n), repeat=n)})

def refine(p, f):
    return signature(tuple((p[i], p[f[i]]) for i in range(len(p))))

def stable(p, f):
    return refine(p, f) == p

for n in (2, 3, 4):
    ps = partitions(n)
    counts = Counter()
    for p in ps:
        for f in product(range(n), repeat=n):
            q = p
            while (r := refine(q, f)) != q:
                q = r
            counts['pairs'] += 1
            counts['stable'] += stable(p, f)
            counts['nontrivial_pairs'] += 1 < len(set(p)) < n
            counts['nontrivial_stable'] += (1 < len(set(p)) < n and stable(p, f))
            counts['strict_refinement'] += p != q
            counts['refines_to_discrete'] += p != q and len(set(q)) == n
    print('dynamics', n, dict(counts))

# All labeled undirected simple graphs on 1..5 vertices; labels used only for enumeration.
def graph_test(n, edges):
    adj = tuple(tuple(int(tuple(sorted((i,j))) in edges) if i != j else 0 for j in range(n)) for i in range(n))
    degree = signature(tuple(sum(row) for row in adj))
    p = degree
    while True:
        q = signature(tuple((p[i], tuple(sorted(p[j] for j in range(n) if adj[i][j]))) for i in range(n)))
        if q == p: break
        p = q
    autos = [perm for perm in permutations(range(n)) if all(adj[i][j] == adj[perm[i]][perm[j]] for i in range(n) for j in range(i+1,n))]
    orbit = signature(tuple(min(perm[i] for perm in autos) for i in range(n)))
    return degree,p,orbit
for n in range(1,6):
    all_edges = list(combinations(range(n),2))
    counts=Counter()
    example=None
    for bits in product((0,1),repeat=len(all_edges)):
        edges={e for e,b in zip(all_edges,bits) if b}
        d,w,a=graph_test(n,edges)
        counts['graphs']+=1
        counts['degree_insufficient']+=d!=a
        counts['wl_insufficient']+=w!=a
        counts['one_orbit']+=len(set(a))==1
        counts['all_singletons']+=len(set(a))==n
        if d!=a and example is None: example=(sorted(edges),d,w,a)
    print('graphs',n,dict(counts),'first_degree_failure',example)
# Two disjoint regular components with differing lengths: local refinement cannot see role distinction.
edges={(0,1),(1,2),(0,2),(3,4),(4,5),(5,6),(3,6)}
print('triangle + square',graph_test(7,edges))
