"""H3 by projection on the coordinate tensor; no Fock Casimir in evaluation.
Usage: python tensor_projection.py COVARIANT_DIRECTORY SEED_NPZ FIXTURE ...
"""
import sys,itertools as it,math,json,time,hashlib
from pathlib import Path
import numpy as np
D=Path(__file__).resolve().parent
sys.path.insert(0,str(Path(sys.argv[1]).resolve()))
import covariant_audit as a

def sym(T,space):
    return sum(T.transpose(tuple(list(range(3))+[3+i for i in p]) if space else tuple(list(p)+list(range(3,6)))) for p in it.permutations(range(3)))
def insert_trace(T,space):
    U=T.transpose(3,4,5,0,1,2) if space else T
    tr=np.einsum('aacijk->cijk',U);I=np.eye(U.shape[0],dtype=np.int64)
    V=np.einsum('ab,cijk->abcijk',I,tr)+np.einsum('ac,bijk->abcijk',I,tr)+np.einsum('bc,aijk->abcijk',I,tr)
    return V.transpose(3,4,5,0,1,2) if space else V
def action(T,B,axes):
    out=np.zeros_like(T)
    for k in axes:out+=np.moveaxis(np.tensordot(B,T,axes=(1,k)),0,k)
    return out
def casimir(T,n,axes):
    out=np.zeros_like(T)
    for i,j in it.combinations(range(n),2):
        B=np.zeros((n,n),np.int64);B[i,j]=1;B[j,i]=-1
        out-=action(action(T,B,axes),B,axes)
    return out
def tensor(x):
    T=np.einsum('ai,bj,ck->abcijk',x,x,x);U=sym(T,False)
    assert np.array_equal(sym(U,True),6*U)
    C=5*U-insert_trace(U,False);H=insert_trace(C,True)
    assert np.array_equal(casimir(C,3,range(3)),12*C)
    assert np.array_equal(casimir(H,9,range(3,6)),8*H)
    Q=casimir(T,3,range(3));Q=casimir(Q,3,range(3))-2*Q;Q=casimir(Q,3,range(3))-6*Q
    assert np.array_equal(Q*30,C*720)
    W=30*Q-casimir(Q,9,range(3,6));assert np.array_equal(W*330,H*(720*22))
    bad=insert_trace(5*U,True);res=casimir(bad,3,range(3))-12*bad
    assert np.any(res)
    return H,int(np.count_nonzero(res))
def contract(H,seed):
    T=H.transpose(0,3,1,4,2,5).reshape(27,27,27);den=330
    g=math.gcd(den,*map(int,T.ravel()));T=T//g;den//=g
    K=[a.K[c,i] for c,i in it.product(range(3),range(9))]
    first={r:a.apply(K[r],seed) for r in np.flatnonzero(np.any(T,axis=(0,1)))}
    outer=[];midcount=0
    for p in np.flatnonzero(np.any(T,axis=(1,2))):
        mid=[]
        for q in np.flatnonzero(np.any(T[p],axis=1)):
            v=a.combine(*[(int(T[p,q,r]),first[r]) for r in np.flatnonzero(T[p,q])]);mid.append((1,a.apply(K[q],v)));midcount+=1
        outer.append((1,a.apply(K[p],a.combine(*mid))))
    h=a.combine(*outer);g=math.gcd(den,*map(int,h[1].real),*map(int,h[1].imag));den//=g;h=a.check((h[0],h[1]/g))
    return h,den,{'first_actions':len(first),'middle_actions':midcount,'outer_actions':len(outer),'tensor_nonzero':int(np.count_nonzero(T))}
def main():
    path=Path(sys.argv[2]);f=np.load(path);seed=a.check((f['masks'].astype(np.int32),f['real'].astype(float)+1j*f['imag'].astype(float)))
    assert a.norm2(seed)==8072064 and len(seed[0])==19136
    fixtures={k:np.pad(np.diag(d),((0,0),(0,6))) for k,d in [('rank1',[1,0,0]),('rank2',[1,2,0]),('rank3',[1,2,3])]}
    fixtures['oblique']=np.array([[1,0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,0,0],[1,0,0,0,0,0,1,0,0]],int)
    for name in sys.argv[3:]:
        t=time.monotonic();H,bad=tensor(fixtures[name]);h,den,counts=contract(H,seed)
        record={'fixture':name,'input_sha256':hashlib.sha256(path.read_bytes()).hexdigest(),'X':fixtures[name].tolist(),'tensor_projector_exact':True,'independent_Casimir_polynomial_exact':True,'color_trace_omission_nonzero':bad,'2sqrt2_H3_numerator':a.stats(h),'denominator':den,'actions':counts,'elapsed_seconds':time.monotonic()-t}
        print(json.dumps(record),flush=True)
        if name=='rank1':
            old=json.loads((Path(sys.argv[1])/'rank1.json').read_text())['H3'];assert old['2sqrt2_H3_numerator']==a.stats(h) and old['H3_denominator']==den;record['archived_rank1_summary_exact']=True
        np.savez_compressed(D/(name+'_vector.npz'),masks=h[0],real=h[1].real.astype(np.int64),imag=h[1].imag.astype(np.int64),denominator=den)
        (D/(name+'.json')).write_text(json.dumps(record,indent=2)+'\n')
if __name__=='__main__':main()
