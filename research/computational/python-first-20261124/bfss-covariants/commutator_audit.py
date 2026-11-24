"""Coefficientwise CAR commutator audit; no state-vector expansion required."""
import json,itertools as it
from pathlib import Path
from covariant_audit import G,R,K,opsum
D=Path(__file__).resolve().parent

def product(A,B):
    out={}
    for f,p,w in A:
        for g,q,v in B:
            key=(f^g,p^q);out[key]=out.get(key,0)+w*v*(-1)**((p&g).bit_count()%2)
    return [(f,p,w) for (f,p),w in out.items() if w]

def comm(A,B):return opsum((1,product(A,B)),(-1,product(B,A)))

def residual(A,B):return len(opsum((1,A),(-1,B)))

color=space=mixed=0
for (a,b),g in G.items():
    for c,i in K:
        rhs=opsum(*([(2,K[a,i])] if c==b else [(-2,K[b,i])] if c==a else []))
        assert residual(comm(g,K[c,i]),rhs)==0
        color+=1
for (i,j),r in R.items():
    for a,k in K:
        rhs=opsum(*([(8,K[a,i])] if k==j else [(-8,K[a,j])] if k==i else []))
        assert residual(comm(r,K[a,k]),rhs)==0
        space+=1
for g,r in it.product(G.values(),R.values()):
    assert not comm(g,r)
    mixed+=1
# Falsifying control: reverse the sign of a nonzero expected commutator.
bad=residual(comm(G[0,1],K[1,0]),opsum((-2,K[0,0])))
assert bad>0
report={'color_Y_commutators':color,'spatial_Y_commutators':space,'mixed_group_commutators':mixed,'all_exact_zero':True,'wrong_sign_nonzero_pauli_coefficients':bad,'scope':'All finite coefficient commutators for the reconstructed CAR representation; no typed Lean or differential-domain qualification.'}
print(json.dumps(report,indent=2));(D/'commutator_results.json').write_text(json.dumps(report,indent=2)+'\n')
