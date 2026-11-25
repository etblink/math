"""Direct exact S, ZS charge contractions (Z=sqrt(2)Y). Use argv of charge_audit plus its directory."""
import sys,json,itertools as it,time,hashlib
from pathlib import Path
import numpy as np
import sympy as sp
sys.path.insert(0,str(Path(sys.argv[4]).resolve()))
import charge_audit as c
from charge_audit import a,seed,N,majorana,inner,potential
D=Path(__file__).resolve().parent
names=['L0','B0','D1','L1','B1'];deg=[1,2,0,2,3];pairs=list(it.combinations_with_replacement(range(5),2))
# Q/f on S: alpha L0/sqrt2+B0; on ZS: (D1+alpha L1)/sqrt2+B1.
def t(b,k,v):
    flip,p,w=majorana(b,k);m,z=v;z1=m&p;sg=1-2*(a.parity[z1&4095]^a.parity[z1>>12]);order=np.argsort(m^flip);return (m[order]^flip,w*sg[order]*z[order])
def lin(x,r,p):
    return c.add(*[(1j*int(x[k,i])*int(a.S[i,r,b]),t(b,k,p)) for k,i in it.product(range(3),range(9)) if x[k,i] for b in np.flatnonzero(a.S[i,r])])
def pot(C,r,p):
    return c.add(*[(int(C[r,b,k]),t(b,k,p)) for b,k in it.product(range(16),range(3)) if C[r,b,k]])
Kseed={k:c.action(op,seed) for k,op in a.K.items()}
D1=[c.add(*[(-1j*int(a.S[i,r,b]),t(b,k,Kseed[k,i])) for k,i in it.product(range(3),range(9)) for b in np.flatnonzero(a.S[i,r])]) for r in range(16)]
def invariants(x):
    G=x@x.T;s=int(np.trace(G));u=int((s*s-np.trace(G@G))//2);return s,u,int(sp.Matrix(G).det())
def run(x):
    Z=c.add(*[(int(x[k,i]),Kseed[k,i]) for k,i in Kseed if x[k,i]]);C=potential(x);tot={names[i]+'_'+names[j]:[0,0] for i,j in pairs};single=[]
    for r in range(16):
        vec=[lin(x,r,seed),pot(C,r,seed),D1[r],lin(x,r,Z),pot(C,r,Z)];row={}
        for i,j in pairs:
            z=inner(vec[i],vec[j]);key=names[i]+'_'+names[j];tot[key][0]+=z[0];tot[key][1]+=z[1];row[key]=list(z)
        single.append(row)
    return {'x':x.tolist(),'invariants':invariants(x),'norm_Z':inner(Z,Z)[0],'overlap_S_Z':inner(seed,Z),'sum_charge_inner':tot,'single_charge0':single[0],'all_charge_kernels_equal':all(z==single[0] for z in single)}
fixtures={str(d):np.pad(np.diag(d),((0,0),(0,6))) for d in [(0,0,0),(1,0,0),(1,1,0),(1,1,1),(1,2,3),(2,3,4)]};fixtures['oblique']=c.fixtures['oblique'];fixtures['signed']=np.pad(np.diag([1,-2,3]),((0,0),(0,6)))
rows={}
for k,x in fixtures.items():
    start=time.monotonic();rows[k]=run(x);print(k,rows[k]['invariants'],time.monotonic()-start,flush=True)
    (D/'pointwise_results.json').write_text(json.dumps({'seed_sha256':hashlib.sha256(c.seedpath.read_bytes()).hexdigest(),'N':N,'names':names,'degree':deg,'rows':rows},indent=2)+'\n')
polys={};fit_names=list(rows)[:5];hold=list(rows)[5:]
for i,j in pairs:
    key=names[i]+'_'+names[j];d=deg[i]+deg[j];exps=[(aa,bb,cc) for aa in range(d//2+1) for bb in range(d//4+1) for cc in range(d//6+1) if 2*aa+4*bb+6*cc==d] if d%2==0 else []
    def val(suv,e):return int(np.prod([int(x)**z for x,z in zip(suv,e)],dtype=object))
    coeff=[]
    for part in range(2):
        y=sp.Matrix([sp.Rational(rows[k]['sum_charge_inner'][key][part],16*N) for k in fit_names])
        if exps:
            M=sp.Matrix([[val(rows[k]['invariants'],e) for e in exps] for k in fit_names]);assert M.rank()==len(exps);v=list(M.gauss_jordan_solve(y)[0])
        else:assert not any(y);v=[]
        for k in rows:assert sum(z*val(rows[k]['invariants'],e) for z,e in zip(v,exps))==sp.Rational(rows[k]['sum_charge_inner'][key][part],16*N),(key,k,part)
        coeff.append([str(z) for z in v])
    polys[key]={'degree':d,'exps':exps,'real':coeff[0],'imag':coeff[1]}
assert all(r['overlap_S_Z']==(0,0) and sp.Rational(r['norm_Z'],N)==sp.Rational(160,3)*r['invariants'][0] for r in rows.values())
report={'polynomials':polys,'fit_fixtures':fit_names,'holdout_fixtures':hold,'norm_Z':'160/3*s','scope':'Exact reconstruction conditional on invariant homogeneous polynomial structure; not typed source domain qualification.'}
(D/'kernel_polynomials.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2),flush=True)
