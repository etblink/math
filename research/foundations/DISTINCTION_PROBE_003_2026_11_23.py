from itertools import product, combinations_with_replacement
from collections import Counter

def part(xs):
    d={}; return tuple(d.setdefault(x,len(d)) for x in xs)

def refines(a,b):
    return all(a[i]!=a[j] or b[i]==b[j] for i in range(len(a)) for j in range(i))

def audit(n):
    ps=sorted({part(p) for p in product(range(n),repeat=n)},key=lambda p:(len(set(p)),p))
    k=len(ps); sizes=[len(set(p)) for p in ps]; fs=list(product(range(n),repeat=n))
    finer=[sum(1<<j for j,q in enumerate(ps) if refines(q,p)) for p in ps]
    coarser=[sum(1<<j for j,q in enumerate(ps) if refines(p,q)) for p in ps]
    data=[]
    for f in fs:
        fw=rv=fx=0
        for j,p in enumerate(ps):
            pf=tuple(p[x] for x in f)
            if refines(p,pf): fw|=1<<j
            if part(pf)==p: rv|=1<<j
            if pf==p: fx|=1<<j
        data.append((fw,rv,fx))
    def first(mask): return (mask&-mask).bit_length()-1
    def last(mask): return mask.bit_length()-1
    def solve(p, fw,rv,fx):
        q=first(fw&finer[p]); r=last(rv&coarser[q]); i=last(fx&coarser[q]); return q,r,i
    # Independently check the extremal claims once for every distinct constraint mask.
    verified=set(); C=Counter(); examples={}
    for a,b in combinations_with_replacement(range(len(fs)),2):
        fa,ra,ia=data[a]; fb,rb,ib=data[b]; fw,rv,fx=fa&fb,ra&rb,ia&ib
        for p in range(k):
            q,r,i=solve(p,fw,rv,fx)
            key=(p,fw,rv,fx)
            if key not in verified:
                assert fw&finer[p]&~finer[q]==0
                assert rv&coarser[q]&~coarser[r]==0
                assert fx&coarser[q]&~coarser[i]==0
                assert refines(ps[q],ps[r]) and refines(ps[r],ps[i])
                # Independent constructive Q refinement for the representative pair.
                z=ps[p]
                while True:
                    zz=part((z[x],z[fs[a][x]],z[fs[b][x]]) for x in range(n))
                    if zz==z: break
                    z=zz
                assert z==ps[q]
                verified.add(key)
            qa,rr_a,_=solve(p,fa,ra,ia); qb,rr_b,_=solve(p,fb,rb,ib)
            flags={'models':True,'distinct_maps':a!=b,'Q_nontrivial':sizes[q]>1,'R_nontrivial':sizes[r]>1,'I_nontrivial':sizes[i]>1,'R_nontrivial_I_trivial':sizes[r]>1 and sizes[i]==1,'Q_nontrivial_R_trivial':sizes[q]>1 and sizes[r]==1,'both_single_R_nontrivial_joint_trivial':sizes[rr_a]>1 and sizes[rr_b]>1 and sizes[r]==1,'R_nontrivial_either_map_noninjective':sizes[r]>1 and (len(set(fs[a]))<n or len(set(fs[b]))<n),'R_nontrivial_both_maps_noninjective':sizes[r]>1 and len(set(fs[a]))<n and len(set(fs[b]))<n,'joint_R_not_determined_by_P':not refines(ps[p],ps[r])}
            for key,v in flags.items():
                if v: C[key]+=1
                if v and key not in examples and a!=b: examples[key]=(ps[p],fs[a],fs[b],ps[q],ps[r],ps[i],ps[rr_a],ps[rr_b])
    print('n',n,'partitions',k,'maps',len(fs),'verified constraint sets',len(verified),dict(C))
    if n==3:
        for key in ('both_single_R_nontrivial_joint_trivial','R_nontrivial_I_trivial','R_nontrivial_both_maps_noninjective','joint_R_not_determined_by_P'):
            print(key,examples.get(key))

if __name__=='__main__':
    for n in (2,3,4): audit(n)
