#!/usr/bin/env python3
"""D1O CAR projector: exact exterior gauge orientation + rank-one projector tests.
Finite 3- and 4-orbital matrix examples. Not a 2^24 dense computation.
"""
import json
from itertools import combinations
from pathlib import Path
import numpy as np
from d1o_clifford_projector import operators,covariance,quadratic,ground_polynomial

def second_quantize(U):
    m=len(U);dim=2**m
    F=np.zeros((dim,dim),complex)
    for number in range(m+1):
        sets=list(combinations(range(m),number))
        def idx(S):return sum(1<<(m-1-i) for i in S)
        for S in sets:
            for T in sets:
                F[idx(T),idx(S)]=np.linalg.det(U[np.ix_(T,S)]) if number else 1
    return F

def ortho(rng,m):
    A=rng.normal(size=(m,m));Q,R=np.linalg.qr(A)
    Q=Q@np.diag(np.sign(np.diag(R)))
    if np.linalg.det(Q)<0:Q[:,0]*=-1
    return Q

def case(m,rng):
    a,cdag,gam=operators(m)
    U=ortho(rng,m)
    W=second_quantize(U)
    idm=np.eye(2**m)
    c_cov=max(np.linalg.norm(W@gam[2*j+s]@W.conj().T -sum(U[k,j]*gam[2*k+s] for k in range(m)),ord='fro') for j in range(m) for s in range(2))
    # Literal real color on 48 labels preserves spin-pair parity.
    T=np.kron(U,np.eye(2))
    vac=np.zeros(2**m,complex);vac[0]=1
    v=(cdag[0]+1j*cdag[1])@vac/np.sqrt(2)
    if m==4:v=(cdag[0]+1j*cdag[2])@vac/np.sqrt(2)
    C=covariance(gam,v)
    Ct=covariance(gam,W@v)
    H=quadratic(C,gam)
    Ht=quadratic(Ct,gam)
    P=ground_polynomial(H,m)
    Pt=ground_polynomial(Ht,m)
    errH=np.linalg.norm(Ht-W@H@W.conj().T,ord='fro')
    errP=np.linalg.norm(Pt-W@P@W.conj().T,ord='fro')
    errC=np.linalg.norm(Ct-T@C@T.T,ord='fro')
    neg_wrong=np.linalg.norm(Ct-T.T@C@T,ord='fro')
    assert min(neg_wrong,1)>1e-4,neg_wrong
    return {'modes':m,'U_det':float(np.linalg.det(U)),'U_orth_err':float(np.linalg.norm(U.T@U-np.eye(m))),
      'exterior_W_unitarity_err':float(np.linalg.norm(W.conj().T@W-idm)),
      'exterior_W_vacuum_err':float(np.linalg.norm(W@vac-vac)),
      'creator_covariance_err':float(c_cov),
      'C_gauge_covariance_err':float(errC),
      'H_gauge_covariance_err':float(errH),
      'P_gauge_covariance_err':float(errP),
      'wrong_transposed_color_negative_control':float(neg_wrong)}

def run():
    rng=np.random.default_rng(20261121)
    data=[case(m,rng) for m in (3,4) for _ in range(8)]
    for d in data:
        for k,v in d.items():
            if k.endswith('_err'):assert v<1e-11,(d['modes'],k,v)
    return {'qualification':'finite 3/4-mode CAR and exterior-power gauge tests; not source-typed Lean, not a 24-mode vector proof',
     'convention':'U[k,j] is OUTPUT k, INPUT j; T=U ⊗ I2 on paired real/imag Majorana labels',
     'source_evidence':'G3A adjointColorMatrix B A, G4A ExteriorAlgebra.map orbitalGauge g, G4E/Fock and G4J GaugeData',
     'max_good_residuals':{k:max(d[k] for d in data) for k in data[0] if k.endswith('_err')},
     'wrong_transpose_min_residual':min(d['wrong_transposed_color_negative_control'] for d in data),
     'case_count':len(data),'example':data[0]}

if __name__=='__main__':
    out=run();p=Path(__file__).with_name('d1o_gauge_projector_results.json')
    p.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
