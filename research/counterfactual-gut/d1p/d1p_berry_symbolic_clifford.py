#!/usr/bin/env python3
"""Exact symbolic Clifford Berry/trace identity for arbitrary SO(4) tangents.

Bilinearity means checking the six basis generators of so(4) proves
identity for every real linear combination at canonical vacuum C0.
This is NOT a 24-mode source-typed Lean theorem.
"""
import json
from pathlib import Path
import sympy as S

I=S.I
sigZ=S.diag(1,-1);Id=S.eye(2); a=S.Matrix([[0,1],[0,0]])

def kron(mats):
    out=S.ones(1,1)
    for m in mats:out=S.kronecker_product(out,m)
    return out

m=2; gamma=[]
for j in range(m):
    c=kron([sigZ]*j+[a]+[Id]*(m-j-1))
    gamma.extend([c+c.conjugate().T,-I*(c-c.conjugate().T)])
C=S.zeros(4)
for j in range(m):C[2*j,2*j+1]=-1;C[2*j+1,2*j]=1

def H(D):
    val=S.zeros(4)
    for p in range(4):
        for q in range(p+1,4):val+=-I*S.Rational(1,2)*D[p,q]*gamma[p]*gamma[q]
    return val

H0=H(C);P=(H0*H0-H0)/2
assert P*P==P and P.trace()==1

def Dproj(dC):
    dh=H(dC)
    return (H0*dh+dh*H0-dh)/2

gens=[]
for p in range(4):
    for q in range(p+1,4):
        K=S.zeros(4);K[p,q]=1;K[q,p]=-1
        D=K*C-C*K
        gens.append({'edge':[p,q],'dC':D,'dP':Dproj(D)})

pairs=[]
for i in range(len(gens)):
    for j in range(i+1,len(gens)):
        a,b=gens[i],gens[j]
        berry=S.expand(I*(P*(a['dP']*b['dP']-b['dP']*a['dP'])).trace())
        ctrace=(C*(a['dC']*b['dC']-b['dC']*a['dC'])).trace()
        assert S.simplify(berry-ctrace/16)==0,(i,j,berry,ctrace)
        pairs.append({'generators':[a['edge'],b['edge']], 'berry':str(berry), 'covariance_trace_over16':str(ctrace/16)})
nonzero=sum(S.sympify(x['berry'])!=0 for x in pairs)
assert nonzero>0
result={'qualification':'Exact symbolic SO(4) basis-pair Clifford identity, not general 48-mode proof',
        'CAR_modes':2,'so4_generator_basis_count':6,'basis_2plane_checks':15,'nonzero_Berry_2plane_checks':nonzero,
        'identity':'for every linear combo A,B of so4 basis, i tr(P[dP_A,dP_B]) = tr(C[dC_A,dC_B])/16',
        'all_pairs':pairs}
Path(__file__).with_name('d1p_berry_symbolic_clifford_results.json').write_text(json.dumps(result,indent=2)+'\n')
print('PASS exact symbolic so(4) curvature identity, nonzero controls',nonzero)
