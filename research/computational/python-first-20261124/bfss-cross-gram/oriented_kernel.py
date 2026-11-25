"""Exact oriented-gradient cross term for S and ZS; not the full witness."""
import sys,itertools as it,json
from pathlib import Path
import numpy as np
import sympy as sp
sys.path.insert(0,str(Path(sys.argv[4]).resolve()))
import charge_audit as c
from charge_audit import a,seed,N,majorana,inner,potential
D=Path(__file__).resolve().parent

def t(b,k,v):
    f,p,w=majorana(b,k);m,z=v;bits=m&p;sg=1-2*(a.parity[bits&4095]^a.parity[bits>>12]);order=np.argsort(m^f);return (m[order]^f,w*sg[order]*z[order])
def lin(y,r,p):
    return c.add(*[(1j*int(y[k,i])*int(a.S[i,r,b]),t(b,k,p)) for k,i in it.product(range(3),range(9)) if y[k,i] for b in np.flatnonzero(a.S[i,r])])
def pot(C,r,p):return c.add(*[(int(C[r,b,k]),t(b,k,p)) for b,k in it.product(range(16),range(3)) if C[r,b,k]])
def basis(x,A):
    G=x@x.T;s=int(np.trace(G));u=int((s*s-np.trace(G@G))//2);return [int(np.trace(A))*s*s,int(np.trace(A))*u,int(np.trace(A@G))*s,int(np.trace(A@G@G))]
rows=[]
xs=[np.pad(np.diag(d),((0,0),(0,6))) for d in [(1,0,0),(1,1,0),(1,2,3),(2,3,4)]]+[c.fixtures['oblique']]
As=[np.diag([1,0,0]),np.diag([0,1,0]),np.diag([0,0,1]),np.array([[2,1,0],[1,3,1],[0,1,4]])]
for j,x in enumerate(xs):
    Z=c.action(a.Z(x),seed);C=potential(x);B0=[pot(C,r,seed) for r in range(16)];B1=[pot(C,r,Z) for r in range(16)]
    for k,A in enumerate(As if j<3 else As[-1:]):
        y=A@x;z1=z2=0;im=0
        for r in range(16):
            L0=lin(y,r,seed);L1=lin(y,r,Z);v=inner(L0,B1[r]);w=inner(B0[r],L1);assert v==w;z1+=v[0];im+=v[1]
        assert im==0
        rows.append({'fixture':j,'A':A.tolist(),'basis':basis(x,A),'cross':str(sp.Rational(z1,16*N))});print(j,k,rows[-1]['cross'],flush=True)
M=sp.Matrix([v['basis'] for v in rows[:12]]);rhs=sp.Matrix([sp.Rational(v['cross']) for v in rows[:12]]);assert M.rank()==4
coef=M.gauss_jordan_solve(rhs)[0];assert all(sum(a*b for a,b in zip(v['basis'],coef))==sp.Rational(v['cross']) for v in rows)
report={'basis':['tr(A)*s^2','tr(A)*u','tr(A G)*s','tr(A G^2)'],'coefficients':list(map(str,coef)),'rows':rows,'holdout_count':len(rows)-12,'scope':'Exact averaged mixed kinetic-potential contraction, conditional on invariant tensor ansatz.'};print(report);(D/'oriented_results.json').write_text(json.dumps(report,indent=2)+'\n')
