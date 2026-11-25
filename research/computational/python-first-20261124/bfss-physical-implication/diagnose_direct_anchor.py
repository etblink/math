"""R3 primitive/anchor diagnostic; no full fixture or altered receipts."""
import json,sys
from pathlib import Path
import replay_direct_fixture as r
import numpy as np
out=Path(sys.argv[1])
report={'scope':'R3 primitive and rank-one anchor isolation','actions':[],'anchors':[]}
def save():out.write_text(json.dumps(report,indent=2)+'\n')
def diff(A,B):
    keys=set(A)|set(B);bad=[]
    for m in sorted(keys):
        if A.get(m,(0,0))!=B.get(m,(0,0)):
            bad.append([m,A.get(m,(0,0)),B.get(m,(0,0))])
    return {'count':len(bad),'examples':bad[:8]}
def norm(A):return str(r.dot(A,A))
def compare(label,T,V):
    A=r.apply(T,V);B=r.apply_literal(T,V)
    d=diff(A,B)
    report['actions'].append({'label':label,'input_support':len(V),'terms':len(T),'vector_support':len(A),'literal_support':len(B),'vector_norm':norm(A),'literal_norm':norm(B),'difference':d})
    save()
    print(label,d['count'],flush=True)
    if d['count']:raise AssertionError((label,d))
    return A
r.selftest()
seed=r.read_seed();g=r.gamma()
# Independently reproduce the previously qualified seed generators on actual data.
for a,b in r.PAIRS:
    z=compare(f'color_{a}_{b}',r.bil(a,b,np.eye(16,dtype=int)),seed)
    assert not z,('color seed residual',a,b)
for i,j in [(0,1),(0,8),(1,2),(2,8)]:
    T=r.ops(*[(1,r.bil(a,a,g[i]@g[j])) for a in range(3)])
    z=compare(f'spin_{i}_{j}',T,seed)
    assert not z,('spin seed residual',i,j)
K=[r.bil((a+1)%3,(a+2)%3,g[i],1) for a,i in r.P]
first=[compare(f'K_{p}_seed',k,seed) for p,k in enumerate(K)]
for p,q in [(0,0),(20,20),(0,20),(20,0)]:
    compare(f'K_{p}_K_{q}_seed',K[p],first[q])
# Include a sum with overlapping targets and opposing coefficients.
compare('mixed_K',r.ops((2,K[0]),(-3,K[20]),(1,K[0])),first[20])
f=r.D/'bfss-h3-tensor/rank1_vector.npz'
r.pin(f,'fd48a584ad72683ab1aa4b974a8e3dfcc9fa15c7')
with np.load(f) as h:
    assert int(h['denominator'])==55
    expected={int(m):(6*int(a),6*int(b)) for m,a,b in zip(h['masks'],h['real'],h['imag'])}
assert norm(expected)=='9549400422481920'
# Derive the rank-one tensor independently in scalar delta notation.
def rank_tensor(a0,i0):
    T=np.zeros((27,27,27),dtype=np.int64)
    for p,(a,i) in enumerate(r.P):
      for q,(b,j) in enumerate(r.P):
       for k,(c,l) in enumerate(r.P):
        u=5*int(a==a0 and b==a0 and c==a0)-int(a==b and c==a0)-int(a==c and b==a0)-int(b==c and a==a0)
        d=int(i==j and l==i0)+int(i==l and j==i0)+int(j==l and i==i0)
        T[p,q,k]=6*u*d
    x=np.zeros((3,9),dtype=np.int64);x[a0,i0]=1
    assert np.array_equal(T,r.tensor(x))
    return T
def contract(T,label):
    outer={}
    for p in range(27):
        mid={}
        for q in range(27):
            if not np.any(T[p,q]):continue
            v=r.lin(*[(int(T[p,q,k]),first[k]) for k in range(27) if T[p,q,k]])
            mid=r.lin((1,mid),(1,compare(f'{label}_middle_{p}_{q}',K[q],v)))
        if mid:outer=r.lin((1,outer),(1,compare(f'{label}_outer_{p}',K[p],mid)))
    return outer
for a,i,label in [(0,0,'100'),(2,2,'001')]:
    A=contract(rank_tensor(a,i),label)
    d=diff(A,expected) if label=='100' else None
    q={'fixture':label,'support':len(A),'norm2':norm(A),'expected_norm2':norm(expected),'coefficient_difference':d}
    report['anchors'].append(q);save();print(q,flush=True)
    assert q['norm2']==q['expected_norm2'] and (d is None or d['count']==0),q
print('BFSS_DIRECT_ANCHOR_DIAGNOSTIC_PASS',flush=True)
