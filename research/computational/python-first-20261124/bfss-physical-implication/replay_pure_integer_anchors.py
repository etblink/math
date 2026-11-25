"""R5 pure standard-library integer rank-one anchors.

Use previously qualified independent seed recheck's ordered scatter and
inverse-target gather; no NumPy, no historical C++ or rotational shortcut.
"""
import ast, hashlib, itertools as it, json, re, struct, sys, zipfile
from pathlib import Path
D=Path(__file__).resolve().parent.parent
ROOT=next(p for p in D.parents if (p/'lean').is_dir())
sys.path.insert(0,str(D/'bfss-seed-transport'))
from independent_integer_recheck import read_seed, scatter, gather, add, rotate, words_and_terms, self_test
out=Path(sys.argv[1])
P=list(it.product(range(3),range(9)))
report={'scope':'pure Python integer action and rank-one anchor replay','actions':0,'stages':[]}
def save():
    out.write_text(json.dumps(report,indent=2)+'\n')
def record(label,**kw):
    report['stages'].append({'label':label,**kw});save();print(label,kw,flush=True)
def pin(path,sha):
    b=path.read_bytes()
    assert hashlib.sha1(b'blob '+str(len(b)).encode()+b'\0'+b).hexdigest()==sha
    return b
def norm(v):
    return sum(a*a+b*b for a,b in v.values())
def diff(A,B):
    bad=[]
    for m in sorted(set(A)|set(B)):
        a,b=A.get(m,(0,0)),B.get(m,(0,0))
        if a!=b:bad.append([m,a,b])
    return {'count':len(bad),'examples':bad[:8]}
def lin(*terms):
    out={}
    for c,v in terms:
        if c:
            for m,(a,b) in v.items():add(out,m,c*a,c*b)
    return out
def apply(label,terms,v,phase=0):
    # Scatter and inverse-target gather are independent algorithms from
    # the earlier standard-library seed audit. Compare vectors AND touched sets.
    A,ta=scatter(v,terms);B,tb=gather(v,terms)
    report['actions']+=1
    if A!=B or ta!=tb:
        record('action_disagreement',action=label,difference=diff(A,B),touched_symmetric_difference=len(ta^tb))
        raise AssertionError(label)
    return {m:rotate(a,b,phase) for m,(a,b) in A.items()}
def npy_int(raw,shape,allowed):
    assert raw[:6]==b'\x93NUMPY'
    version=tuple(raw[6:8]);assert version in ((1,0),(2,0),(3,0))
    width=2 if version==(1,0) else 4
    offset=8+width
    size=int.from_bytes(raw[8:offset],'little')
    h=ast.literal_eval(raw[offset:offset+size].decode('utf-8').strip())
    assert set(h)=={'descr','shape','fortran_order'} and h['shape']==shape and not h['fortran_order'],h
    assert h['descr'] in allowed,h
    code={'<i4':'i','<u4':'I','<i8':'q','<u8':'Q'}[h['descr']]
    n=shape[0] if shape else 1
    body=raw[offset+size:];assert len(body)==n*struct.calcsize('<'+code)
    return struct.unpack('<'+str(n)+code,body)
def anchor():
    path=D/'bfss-h3-tensor/rank1_vector.npz'
    pin(path,'fd48a584ad72683ab1aa4b974a8e3dfcc9fa15c7')
    with zipfile.ZipFile(path) as z:
        assert set(z.namelist())=={'masks.npy','real.npy','imag.npy','denominator.npy'}
        assert z.testzip() is None
        m=npy_int(z.read('masks.npy'),(28256,),{'<i4','<u4','<i8','<u8'})
        a=npy_int(z.read('real.npy'),(28256,),{'<i8','<i4'})
        b=npy_int(z.read('imag.npy'),(28256,),{'<i8','<i4'})
        den,=npy_int(z.read('denominator.npy'),(),{'<i8','<i4'})
        assert den==55 and len(set(m))==len(m) and all(0<=k<1<<24 for k in m)
    v={k:(6*u,6*w) for k,u,w in zip(m,a,b)}
    assert all(u or w for u,w in v.values()) and norm(v)==9549400422481920
    return v
def main():
    self_test()
    seed=read_seed()
    words,flip,sign,gen=words_and_terms()
    assert len(seed)==19136 and norm(seed)==8072064
    expected=anchor()
    record('frozen_inputs',seed_support=len(seed),seed_norm=norm(seed),anchor_support=len(expected),anchor_scaled_norm=norm(expected),python=sys.version,numpy_loaded='numpy' in sys.modules)
    assert 'numpy' not in sys.modules
    for label,T in gen.items():
        if label.startswith('2G') or label in ('8R_0_1','8R_0_8','8R_1_2','8R_2_8'):
            v=apply(label,T,seed)
            assert not v,(label,len(v),norm(v))
    K=[[(s,(a+1)%3,s^flip[i],(a+2)%3,(-1)**((s&sign[i]).bit_count())) for s in range(16)] for a,i in P]
    first=[apply('first_'+str(p),k,seed,1) for p,k in enumerate(K)]
    def rank_tensor(a0,i0):
        groups={};count=ss=0
        for p,(a,i) in enumerate(P):
          for q,(b,j) in enumerate(P):
           for k,(c,l) in enumerate(P):
            u=5*int(a==a0 and b==a0 and c==a0)-int(a==b and c==a0)-int(a==c and b==a0)-int(b==c and a==a0)
            d=int(i==j and l==i0)+int(i==l and j==i0)+int(j==l and i==i0)
            w=6*u*d
            if w:
                groups.setdefault(p,{}).setdefault(q,[]).append((w,k))
                count+=1;ss+=w*w
        assert (count,ss)==(175,11880)
        return groups
    for a,i,label in [(0,0,'100'),(2,2,'001')]:
        groups=rank_tensor(a,i);outer={}
        for p,qs in groups.items():
            mid={}
            for q,ks in qs.items():
                v=lin(*[(w,first[k]) for w,k in ks])
                mid=lin((1,mid),(1,apply((label,'middle',p,q),K[q],v,1)))
            if label=='100' and p==1:
                h=hashlib.sha256(repr(sorted(mid.items())).encode()).hexdigest()
                record('R4_actual_input',support=len(mid),sha256=h,agrees_R4=(h=='b4a323fb8013a7ca8dbef37c1498e9f477a40951023c821e1f748a12baa90a7b'))
                assert len(mid)==42384 and h=='b4a323fb8013a7ca8dbef37c1498e9f477a40951023c821e1f748a12baa90a7b'
            if mid:
                v=apply((label,'outer',p),K[p],mid,1)
                if label=='100' and p==1:
                    record('R4_actual_action_agreement',support=len(v),norm2=norm(v))
                outer=lin((1,outer),(1,v))
            print(label,'outer',p,'actions',report['actions'],flush=True)
            save()
        d=diff(outer,expected) if label=='100' else None
        record('anchor_'+label,support=len(outer),norm2=norm(outer),expected_norm2=norm(expected),coefficient_difference=d)
        assert norm(outer)==norm(expected) and (d is None or d['count']==0)
    assert 'numpy' not in sys.modules
    report['all_anchors_pass']=True;save()
    print('BFSS_DIRECT_PURE_INTEGER_ANCHORS_PASS',flush=True)
if __name__=='__main__':main()
