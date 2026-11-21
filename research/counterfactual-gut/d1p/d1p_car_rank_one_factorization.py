#!/usr/bin/env python3
"""Adversarial rank-one polynomial projector test in irreducible Clifford CAR.

Uses arbitrary REAL orthogonal transforms of 2m Majorana axes, including
orientation-reversing transforms that flip Fock parity (not merely Slaters).
The analytical proof uses commuting involutions and the Clifford trace trick;
dense small-m CAR tests are controls, not a 24-mode original Lean certificate.
"""
import json
from itertools import combinations
from pathlib import Path
import numpy as np

I2=np.eye(2, dtype=complex)
Z=np.diag([1,-1]).astype(complex)
ANN=np.array([[0,1],[0,0]],complex)

def kr(seq):
    out=np.ones((1,1),complex)
    for x in seq:out=np.kron(out,x)
    return out

def gamma_list(m):
    gam=[]
    for j in range(m):
        a=kr([Z]*j+[ANN]+[I2]*(m-j-1))
        gam.extend([a+a.conj().T,-1j*(a-a.conj().T)])
    return gam

def standard_C(m):
    c=np.zeros((2*m,2*m))
    for j in range(m):c[2*j,2*j+1]=-1;c[2*j+1,2*j]=1
    return c

def orthogonal(rng,n,det_sign):
    a=rng.normal(size=(n,n));q,r=np.linalg.qr(a)
    q=q@np.diag(np.sign(np.diag(r)))
    if (np.linalg.det(q)>0) != (det_sign>0):q[:,0]*=-1
    return q

def run_case(m,rng,orientation):
    gam=gamma_list(m)
    O=orthogonal(rng,2*m,orientation)
    C=O@standard_C(m)@O.T
    dim=2**m;Id=np.eye(dim,dtype=complex)
    gpair=[sum(O[a,j]*gam[a] for a in range(2*m)) for j in range(2*m)]
    hj=[1j*gpair[2*j]@gpair[2*j+1] for j in range(m)]
    H=(sum(hj, np.zeros((dim,dim),complex)))/2
    Hc=np.zeros_like(H)
    for i in range(2*m):
        for j in range(i+1,2*m):Hc+=-.5j*C[i,j]*(gam[i]@gam[j])
    P=Id.copy();Ppoly=Id.copy()
    max_involution=max(np.linalg.norm(a@a-Id) for a in hj)
    max_hermitian=max(np.linalg.norm(a-a.conj().T) for a in hj)
    max_commutation=max(np.linalg.norm(a@b-b@a) for a,b in combinations(hj,2)) if m>1 else 0
    tr_nonempty=0.
    for length in range(1,m+1):
        for inds in combinations(range(m),length):
            product=Id.copy()
            for j in inds: product=product@hj[j]
            tr_nonempty=max(tr_nonempty,abs(np.trace(product)))
    for j in range(m):P=P@((Id-hj[j])/2)
    for k in range(1,m+1):Ppoly=Ppoly@(((k-m/2)*Id-Hc)/k)
    P=(P+P.conj().T)/2
    Ppoly=(Ppoly+Ppoly.conj().T)/2
    recovered=np.zeros_like(C)
    for i in range(2*m):
        for j in range(i+1,2*m):
            recovered[i,j]=(1j*np.trace(P@gam[i]@gam[j])).real
            recovered[j,i]=-recovered[i,j]
    parity=kr([Z]*m)
    observed_parity=np.trace(P@parity).real
    expect_parity=float(np.linalg.det(O))
    return {'m':m,'Majorana_frame_orientation':orientation,
            'max_commuting_involution_residual':max_involution,
            'max_involution_hermiticity_residual':max_hermitian,
            'max_pair_commutator_residual':max_commutation,
            'max_nonempty_clifford_product_trace':float(tr_nonempty),
            'H_from_C_minus_half_sum_involutions':float(np.linalg.norm(Hc-H)),
            'polynomial_vs_factor_projector':float(np.linalg.norm(Ppoly-P)),
            'rank_one_projector_idempotency':float(np.linalg.norm(P@P-P)),
            'projector_trace_minus_one':float(abs(np.trace(P)-1)),
            'recovered_covariance_residual':float(np.linalg.norm(recovered-C)),
            'parity_expectation':float(observed_parity),
            'parity_sign_error':float(abs(observed_parity-expect_parity)),
            'spectrum':sorted(set(np.round(np.linalg.eigvalsh(Hc),8)))}

def run():
    rng=np.random.default_rng(20261121)
    results=[]
    for m in range(1,7):
        for orientation in (-1,+1):
            for k in range(3):
                row=run_case(m,rng,orientation)
                for key,value in row.items():
                    if key.startswith(('max_','H_from_','polynomial_','rank_','projector_','recovered_','parity_sign_')):
                        assert value<5e-10,(row,key,value)
                results.append(row)
    metrics=[k for k in results[0] if k.startswith(('max_','H_from_','polynomial_','rank_','projector_','recovered_','parity_sign_'))]
    return {'status':'PASS', 'modes_tested':[1,2,3,4,5,6], 'cases':len(results),
            'transforms':'Haar orthogonal, both det +1 and det -1, including Bogoliubov/non-number conserving',
            'max_errors':{k:max(row[k] for row in results) for k in metrics},
            'parity_negative_control':'O(2m) det -1 flips Gaussian ground Fock parity, while P(C) remains rank-one',
            'proof_strategy':'CAR commuting involutions A_j=i gamma(e_j)gamma(f_j); trace of each nonempty product is zero by conjugation with one gamma(e_j); tr P=2^m/2^m=1; spectral polynomial equals product of zero-occupation projections',
            'limitations':'Small-m dense numerical control; universal algebraic reasoning independent of Spin lift, not Lean source-typed rank-one proof',
            'rows':results}

if __name__=='__main__':
    d=run();p=Path(__file__).with_name('d1p_car_rank_one_factorization_results.json');p.write_text(json.dumps(d,indent=2)+'\n')
    print(d['status'], d['cases'],d['max_errors'])
