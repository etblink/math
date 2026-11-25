"""Pointwise source charge audit, Gaussian f=exp(-alpha*|X|^2/2).
Run with covariant dir, tensor dir, seed NPZ. t=sqrt(2)*theta.
Exact finite Gaussian integer coefficients, not a physical-domain certificate.
"""
import sys,itertools as it,math,json,hashlib,time
from pathlib import Path
import numpy as np
import sympy as sp
D=Path(__file__).resolve().parent
sys.path.insert(0,str(Path(sys.argv[1]).resolve()))
import covariant_audit as a
T=Path(sys.argv[2]); seedpath=Path(sys.argv[3]); f=np.load(seedpath)
seed=a.check((f['masks'].astype(np.int32),f['real'].astype(float)+1j*f['imag'].astype(float)))
N=a.norm2(seed);assert N==8072064
# Sparse accumulation, independently of archived dense scratch path.
def add(*terms):
    terms=[(k,v) for k,v in terms if k and len(v[0])]
    if not terms:return a.zero
    assert sum(abs(k)*a.size(v) for k,v in terms)<2**49
    m=np.concatenate([v[0] for k,v in terms]);c=np.concatenate([k*v[1] for k,v in terms]);o=np.argsort(m,kind='stable');m=m[o];c=c[o];s=np.r_[0,np.flatnonzero(m[1:]!=m[:-1])+1];v=np.add.reduceat(c,s);keep=v!=0
    return a.check((m[s][keep],v[keep]))
def action(op,v):
    if not op or not len(v[0]):return a.zero
    assert sum(abs(w.real)+abs(w.imag) for _,_,w in op)*a.size(v)<2**49
    m,c=v;terms=[]
    for flip,p,w in op:
        z=m&p;sg=1-2*(a.parity[z&4095]^a.parity[z>>12]);terms.append((1,(m^flip,w*sg*c)))
    return add(*terms)
def majorana(b,c):
    p=3*(b//2)+c;return (1<<p,(1<<(p+b%2))-1,complex(1j**(b%2)))
def inner(v,w):
    _,i,j=np.intersect1d(v[0],w[0],assume_unique=True,return_indices=True)
    # Each Gaussian-integer component product fits below 2**52; sum
    # in bounded chunks, converting exact binary64 sums to Python integers.
    bound=int(a.size(v))*int(a.size(w))
    assert bound<2**50
    block=max(1,min(65536,(2**50)//max(1,bound)))
    real=imag=0
    for k in range(0,len(i),block):
        z=np.vdot(v[1][i[k:k+block]],w[1][j[k:k+block]])
        assert z.real==int(z.real) and z.imag==int(z.imag)
        real+=int(z.real);imag+=int(z.imag)
    return real,imag
def potential(x):
    C=np.zeros((16,16,3),int)
    for i,j in it.combinations(range(9),2):C+=np.einsum('ab,c->abc',a.S[i]@a.S[j],np.cross(x[:,i],x[:,j]))
    return C
# Q/f=(A/sqrt2+B)/(den*sqrt(N)*sqrt(scale2)), common scalar stripped.
def charges(x,p,ds,den,scale2,alpha=2):
    C=potential(x);dps=[add((1,v),(-alpha*int(x[c,i]),p)) for (c,i),v in zip(it.product(range(3),range(9)),ds)];out=[]
    for r in range(16):
        terms=[];ops=[]
        for (c,i),v in zip(it.product(range(3),range(9)),dps):
            if len(v[0]):
                b=int(np.flatnonzero(a.S[i,r])[0]);terms.append((-1j*int(a.S[i,r,b]),action([majorana(b,c)],v)))
        A=add(*terms)
        for b,c in it.product(range(16),range(3)):
            if C[r,b,c]:
                g,sg,w=majorana(b,c);ops.append((g,sg,w*int(C[r,b,c])))
        B=action(ops,p);cross=inner(A,B)
        out.append({'A_norm2':a.norm2(A),'B_norm2':a.norm2(B),'Re_A_B':cross[0],'A_support':len(A[0]),'B_support':len(B[0])})
    e=[(v['A_norm2']/2+v['B_norm2']+math.sqrt(2)*v['Re_A_B'])/(den**2*N*scale2) for v in out]
    return {'scaled_polynomial_denominator':den,'polynomial_scale_squared':scale2,'profile_alpha':alpha,'per_charge':out,'charge_density_without_f_squared':e,'mean':sum(e)/16,'spread':max(e)-min(e)}
fixtures={'rank1':np.pad(np.diag([1,0,0]),((0,0),(0,6))),'rank3':np.pad(np.diag([1,2,3]),((0,0),(0,6))),'oblique':np.array([[1,0,1,0,0,0,0,0,1],[0,1,0,0,0,0,0,0,0],[1,0,0,0,0,0,1,0,0]],int)}
# All 48 Majorana two-point entries, including off-diagonal controls.
def constant():
    Ts=[action([majorana(b,c)],seed) for b,c in it.product(range(16),range(3))]
    for i,j in it.product(range(48),repeat=2):assert inner(Ts[i],Ts[j])==((N if i==j else 0),0)
    result={'source_seed_sha256':hashlib.sha256(seedpath.read_bytes()).hexdigest(),'majorana_two_point_exact_checks':2304,'scope':'Pointwise differential expression; scalar profile and seed normalization factored out. Not a domain proof.','cases':{}}
    for name,x in fixtures.items():
        r=charges(x,seed,[a.zero]*27,1,1);G=x@x.T;vb=int((np.trace(G)**2-np.trace(G@G))//2);expected=2*int(np.sum(x*x))+vb
        assert all(z['A_norm2']==4*int(np.sum(x*x))*N and z['B_norm2']==vb*N and z['Re_A_B']==0 for z in r['per_charge']);assert all(v==expected for v in r['charge_density_without_f_squared']);r['expected_scalar_energy_density']=expected;result['cases']['S_'+name]=r;print('S',name,expected,flush=True)
    wrong=charges(fixtures['rank1'],seed,[a.zero]*27,1,1,alpha=0);assert wrong['mean']==0;result['negative_omit_gaussian_gradient_rank1']=wrong['mean']
    (D/'constant_results.json').write_text(json.dumps(result,indent=2)+'\n')
if __name__=='__main__':constant()
