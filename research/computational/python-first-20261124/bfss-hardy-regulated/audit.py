"""Exact finite coefficient audit of the positive-regulator Hardy argument.
All matrix entries and bounds use Python integers (object dtype) and Fraction.
No state-vector expansion or physical domain claim.
"""
import itertools as it
import json
from fractions import Fraction as F
from pathlib import Path
import numpy as np
WORDS='JIIJ JIJX JXJZ JZJZ JJIZ JJXX JJZX XIII ZIII'.split()
letters={'I':[[1,0],[0,1]],'J':[[0,1],[-1,0]],'X':[[0,1],[1,0]],'Z':[[1,0],[0,-1]]}
def word(w):
    z=np.array([[1]],dtype=object)
    for c in w: z=np.kron(z,np.array(letters[c],dtype=object))
    return z
g=[word(w) for w in WORDS]
I=np.eye(16,dtype=object); zero=np.zeros((16,16),dtype=object)
planes=list(it.combinations(range(9),2)); four=[(0,1),(2,3),(4,5),(6,7)]
def eq(a,b,label):
    assert np.array_equal(a,b),label
for i,j in it.product(range(9),repeat=2):eq(g[i]@g[j]+g[j]@g[i],2*I if i==j else zero,('CAR',i,j))
# 112 times the original tau coefficient in each of the 9 directions.
def tau(i,j,k):
    return 7*g[j] if k==i else -7*g[i] if k==j else 2*g[k]@g[i]@g[j]
T=[sum((tau(i,j,k) for i,j in four),zero.copy()) for k in range(9)]
def frob(a,b):return int(sum((a*b).ravel()))
# Explicit Gram, including all cross-terms in the summed four planes.
gram=[[frob(a,b) for b in T] for a in T]
xi=[[frob(a,b) for b in g] for a in g]
for i,j in it.product(range(9),repeat=2):
    assert F(gram[i][j],2*112**2)==(F(61 if i<8 else 16,1568) if i==j else 0)
    assert F(xi[i][j],2)==(8 if i==j else 0)
# Recover B.7 and zero potential traces from all original coefficients.
trace_checks=derivative_checks=potential_checks=0
for i,j in planes:
    U=[tau(i,j,k) for k in range(9)]
    for k,l in it.product(range(9),repeat=2):
        assert frob(g[k],U[l])==112*((l==i and k==j)-(l==j and k==i))
        trace_checks+=1
    eq(sum((g[k]@U[k] for k in range(9)),zero.copy()),28*g[i]@g[j],('tau derivative',i,j));derivative_checks+=1
    for k,(l,m) in it.product(range(9),planes):
        assert frob(g[l]@g[m],U[k])==0
        potential_checks+=1
# Exact spinor charge covariance: A=gamma_r gamma_s/2, B=E_rs-E_sr.
# [A,gamma_k]=sum_l B_lk gamma_l; the differential pullback and
# fiber commutator sum gives -A gamma_k on the charge row index.
# Potential uses the derivation rule on the ordered two-gamma wedge.
kin=pot=0
for r,s in planes:
    A=g[r]@g[s]  # twice A
    B=np.zeros((9,9),dtype=object);B[r,s]=1;B[s,r]=-1
    for k in range(9):
        E=sum((int(B[l,k])*g[l] for l in range(9)),zero.copy())
        eq(A@g[k]-g[k]@A,2*E,('kinetic covariance',r,s,k));kin+=1
    for i,j in planes:
        E=sum((int(B[l,i])*g[l]@g[j]+int(B[l,j])*g[i]@g[l] for l in range(9)),zero.copy())
        eq(A@g[i]@g[j]-g[i]@g[j]@A,2*E,('potential covariance',r,s,i,j));pot+=1
# A basis of End(C^16): ordered gamma products of length <=4.
# Even coordinate sign flips are implemented by +/- gamma_r gamma_s.
# Their common commutant consists only of scalars. This supplies an
# elementary diagonal-moment alternative to invoking the 44 decomposition.
subsets=[s for k in range(5) for s in it.combinations(range(9),k)]
W=[]
for s in subsets:
    z=I.copy()
    for i in s:z=z@g[i]
    W.append(z)
flat=np.array([z.ravel() for z in W],dtype=object)
eq(flat@flat.T,16*np.eye(256,dtype=object),'basis Gram')
fixed=[];flip_checks=0
for s,z in zip(subsets,W):
    invariant=True
    for i,j in planes:
        A=g[i]@g[j]; character=(-1)**((i in s)+(j in s))
        eq(-A@z@A,character*z,('even flip',s,i,j));flip_checks+=1
        invariant &= character==1
    if invariant:fixed.append(s)
assert fixed==[()]
# Negative controls: a wrong gamma commutator sign and omitted trace leg.
bad=A=g[0]@g[1]; wrong=bad@g[0]-g[0]@bad-2*g[1]
wrong_sign=int(np.count_nonzero(wrong));assert wrong_sign
badT=T[0]-tau(2,3,0);wrong_tau=F(frob(badT,badT),2*112**2);assert wrong_tau!=F(61,1568)
# Exact conservative threshold, using only rational comparisons.
assert F(15,4)**2>14
kappa_upper=F(66,25);assert kappa_upper==F(36+8*F(15,4),25)
assert 1-kappa_upper*F(3,8)==F(1,100)
result={'gamma_CAR':81,'tau_gram_entries':81,'xi_gram_entries':81,'tau_diagonal_coefficients':[str(F(gram[i][i],2*112**2)) for i in range(9)],'xi_diagonal_coefficients':[str(F(xi[i][i],2)) for i in range(9)],'tau_trace_checks':trace_checks,'tau_derivative_checks':derivative_checks,'potential_tau_trace_checks':potential_checks,'kinetic_spin_covariance_checks':kin,'potential_spin_covariance_checks':pot,'gamma_endomorphism_basis_gram_entries':256**2,'even_flip_checks':flip_checks,'common_flip_invariant_basis_words':[list(s) for s in fixed],'wrong_commutator_sign_nonzero_entries':wrong_sign,'omitted_tau_leg_coefficient':str(wrong_tau),'isotropic_tau_coefficient':str(F(61*8+16,1568*9)),'kappa_rational_upper':str(kappa_upper),'conditional_fidelity_using_only_q1_lt_3_over_8':str(F(1,100)),'all_exact':True,'scope':'Exact coefficient evidence; regulated Hardy still needs source-exact physical operator and sector/domain identification.'}
print(json.dumps(result,indent=2));Path(__file__).with_name('results.json').write_text(json.dumps(result,indent=2)+'\n')
