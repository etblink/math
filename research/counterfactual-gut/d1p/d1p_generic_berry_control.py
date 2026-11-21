#!/usr/bin/env python3
"""Generic Gaussian families have nonzero Berry curvature: negative control.
Calibrate covariance commutator trace against exact derivative of Fock
rank-one projector polynomial, not finite differences or a guessed factor.
"""
import json
from pathlib import Path
import numpy as np
from d1p_car_rank_one_factorization import gamma_list, standard_C

def H_from_C(C,gam):
    d=gam[0].shape[0]; H=np.zeros((d,d),complex)
    for i in range(len(gam)):
        for j in range(i+1,len(gam)):
            H+=-.5j*C[i,j]*(gam[i]@gam[j])
    return H

def project_and_dP(C,dCs,gam):
    m=len(gam)//2;Id=np.eye(2**m,dtype=complex)
    H=H_from_C(C,gam)
    Q=[((k-m/2)*Id-H)/k for k in range(1,m+1)]
    P=Id.copy()
    for q in Q:P=P@q
    ds=[]
    for dC in dCs:
        dH=H_from_C(dC,gam)
        dP=np.zeros_like(P)
        for j in range(m):
            prod=Id.copy()
            for k in range(m):prod=prod@(-dH/(k+1) if k==j else Q[k])
            dP+=prod
        ds.append(dP)
    return P,ds

def run():
    rng=np.random.default_rng(20261121);rows=[]
    for m in (2,3,4):
        C=standard_C(m);gam=gamma_list(m);dim=2*m
        for trial in range(10):
            X=rng.integers(-3,4,size=(dim,dim));Y=rng.integers(-3,4,size=(dim,dim))
            A=X-X.T;B=Y-Y.T
            dCa=A@C-C@A;dCb=B@C-C@B
            P,(dPa,dPb)=project_and_dP(C,[dCa,dCb],gam)
            curvature=float(np.real(1j*np.trace(P@(dPa@dPb-dPb@dPa))))
            raw=float(np.trace(C@(dCa@dCb-dCb@dCa)))
            rows.append({'modes':m,'trial':trial,'Berry_2form':curvature,'C_derivative_commutator_trace':raw,
                         'ratio':curvature/raw if abs(raw)>1e-10 else None,
                         'P_projector_error':float(np.linalg.norm(P@P-P)),
                         'dP_hermitian_error':float(max(np.linalg.norm(dPa-dPa.conj().T),np.linalg.norm(dPb-dPb.conj().T)))})
    nonzero=[x for x in rows if abs(x['C_derivative_commutator_trace'])>1e-8]
    ratios=[x['ratio'] for x in nonzero]
    assert len(nonzero)>=20, 'failed negative control: random Gaussian curvature never nonzero'
    errors=[abs(x['Berry_2form']-x['C_derivative_commutator_trace']/16) for x in rows]
    assert max(errors)<1e-8, ('Berry/C trace mismatch',max(errors))
    assert max(x['P_projector_error'] for x in rows)<1e-10
    assert max(x['dP_hermitian_error'] for x in rows)<1e-10
    print('PASS general nonzero curvature:',len(nonzero),'of',len(rows),'ratio exactly ~1/16, max absolute deviation',max(errors))
    return {'status':'PASS', 'mode_counts':[2,3,4], 'sample_count':len(rows),
            'nonzero_generic_Berry_curvature_samples':len(nonzero),
            'max_berry_identity_error':max(errors),
            'fock_vs_covariance_Berry_2form':'i tr(P[dP_A,dP_B]) = tr(C[dC_A,dC_B])/16 with chosen Majorana orientation',
            'negative_control':'generic pure Gaussian covariance has NONZERO Berry curvature, unlike original BFSS family',
            'rows':rows}

if __name__=='__main__':
    out=run();Path(__file__).with_name('d1p_generic_berry_control_results.json').write_text(json.dumps(out,indent=2)+'\n')
