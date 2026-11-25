"""R4: isolate actual p=1 action and verify alternate exact dense scatter.
The original R2/R3 backend is frozen and imported only as a diagnostic.
No change to historical seed, gamma, H3 anchor or receipts.
"""
import json,sys,hashlib
from pathlib import Path
import numpy as np
import replay_direct_fixture as r
out=Path(sys.argv[1])
report={'scope':'R4 same-input primitive diagnosis and independent rank-one anchors','stages':[]}
def save():out.write_text(json.dumps(report,indent=2)+'\n')
def difference(A,B):
    bad=[(m,A.get(m,(0,0)),B.get(m,(0,0))) for m in sorted(set(A)|set(B)) if A.get(m,(0,0))!=B.get(m,(0,0))]
    return {'count':len(bad),'examples':bad[:8]}
def record(label,**kw):
    report['stages'].append({'label':label,**kw});save();print(label,kw,flush=True)
# Third method: aligned triples from one iteration; direct dense addressing;
# no np.fromiter, np.choose, np.searchsorted or unique target list.
# Keep individual integer coefficient bound for every output.
SIZE=1<<24
R=np.zeros(SIZE,np.int64);I=np.zeros(SIZE,np.int64)
PAR=np.array([m.bit_count()&1 for m in range(4096)],np.int64)
def dense(T,V):
    if not T or not V:return {}
    bound=max(max(abs(a),abs(b)) for a,b in V.values())*sum(abs(c) for p,u,q,v,c,h in T)
    if bound>=2**62:return r.apply_literal(T,V)
    m,a,b=np.array([(m,a,b) for m,(a,b) in sorted(V.items())],dtype=np.int64).T
    def parity(z):return PAR[z&4095]^PAR[z>>12]
    for p,u,q,v,c,h in T:
        n=m^(1<<q)
        phase=(h+u+v+2*(parity(m&((1<<q)-1))+v*((m>>q)&1)+parity(n&((1<<p)-1))+u*((n>>p)&1)))%4
        even=(phase&1)==0
        sign=1-2*(phase>>1)
        rr=sign*np.where(even,a,-b);ii=sign*np.where(even,b,a)
        dest=n^(1<<p)
        np.add.at(R,dest,c*rr);np.add.at(I,dest,c*ii)
    nz=np.flatnonzero((R!=0)|(I!=0))
    result={int(k):(int(a),int(b)) for k,a,b in zip(nz,R[nz],I[nz])}
    R[nz]=0;I[nz]=0
    return result
seed=r.read_seed();g=r.gamma()
K=[r.bil((a+1)%3,(a+2)%3,g[i],1) for a,i in r.P]
first=[r.apply_literal(k,seed) for k in K]
x=np.zeros((3,9),dtype=np.int64);x[0,0]=1
T=r.tensor(x)
def middle(p,T):
    mid={}
    for q in range(27):
        if not np.any(T[p,q]):continue
        v=r.lin(*[(int(T[p,q,k]),first[k]) for k in range(27) if T[p,q,k]])
        mid=r.lin((1,mid),(1,r.apply_literal(K[q],v)))
    return mid
V=middle(1,T);ref=r.apply_literal(K[1],V)
old=r.apply(K[1],V);alt=dense(K[1],V)
m=np.fromiter(V,dtype=np.int64,count=len(V));a=np.fromiter((z[0] for z in V.values()),dtype=np.int64,count=len(V));b=np.fromiter((z[1] for z in V.values()),dtype=np.int64,count=len(V))
alignment=sum(V.get(int(k))!=(int(u),int(v)) for k,u,v in zip(m,a,b))
record('actual_outer_1',input_support=len(V),old_vs_literal=difference(old,ref),dense_vs_literal=difference(alt,ref),fromiter_alignment_errors=alignment,
       input_sha256=hashlib.sha256(repr(sorted(V.items())).encode()).hexdigest())
# Compare all constituent terms and the sum of separately computed outputs.
old_parts=[];literal_parts=[];alt_parts=[]
for k,t in enumerate(K[1]):
    L=r.apply_literal([t],V);A=r.apply([t],V);B=dense([t],V)
    record('term_'+str(k),term=t,old_vs_literal=difference(A,L),dense_vs_literal=difference(B,L))
    old_parts.append((1,A));literal_parts.append((1,L));alt_parts.append((1,B))
record('accumulator',old_full_vs_old_parts=difference(old,r.lin(*old_parts)),literal_full_vs_literal_parts=difference(ref,r.lin(*literal_parts)),dense_full_vs_dense_parts=difference(alt,r.lin(*alt_parts)))
assert alt==ref and r.lin(*alt_parts)==ref
# Check every dense action on both rank-one anchors against literal actions.
f=r.D/'bfss-h3-tensor/rank1_vector.npz';r.pin(f,'fd48a584ad72683ab1aa4b974a8e3dfcc9fa15c7')
with np.load(f) as h:
    assert int(h['denominator'])==55
    expected={int(m):(6*int(a),6*int(b)) for m,a,b in zip(h['masks'],h['real'],h['imag'])}
expected_norm=r.dot(expected,expected);assert expected_norm==9549400422481920
actions=0
def verified(T,V,label):
    global actions
    A=dense(T,V);B=r.apply_literal(T,V);actions+=1
    if A!=B:
        record('dense_divergence',action=label,difference=difference(A,B));raise AssertionError(label)
    return A
for p,k in enumerate(K):assert first[p]==verified(k,seed,'first_'+str(p))
for a,i,label in [(0,0,'100'),(2,2,'001')]:
    x=np.zeros((3,9),dtype=np.int64);x[a,i]=1;T=r.tensor(x);outer={}
    for p in range(27):
        mid={}
        for q in range(27):
            if not np.any(T[p,q]):continue
            v=r.lin(*[(int(T[p,q,k]),first[k]) for k in range(27) if T[p,q,k]])
            mid=r.lin((1,mid),(1,verified(K[q],v,(label,'middle',p,q))))
        if mid:outer=r.lin((1,outer),(1,verified(K[p],mid,(label,'outer',p))))
        print(label,'outer',p,flush=True)
    d=difference(outer,expected) if label=='100' else None
    n=r.dot(outer,outer)
    record('anchor_'+label,support=len(outer),norm2=str(n),expected_norm2=str(expected_norm),coefficient_difference=d,verified_actions=actions)
    assert n==expected_norm and (d is None or not d['count'])
report['all_anchor_controls_pass']=True;save()
print('BFSS_DIRECT_SCATTER_R4_ANCHOR_PASS',flush=True)
