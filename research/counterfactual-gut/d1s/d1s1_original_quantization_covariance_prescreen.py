#!/usr/bin/env python3
"""D1S1 analytic preflight for ORIGINAL BFSS source FrequencyMatrix 2 (real 48x48).

Under source G3A, R[output B, input A] = adjointCoefficient(g,A,B).
Original source quantizeFrequency(K)=(i/2) sum K[p,q] theta[p]theta[q],
where theta=gamma/sqrt(2) and p=(spin,color).
This is not a 24-mode Lean qualification nor a source smooth-core result.
"""
import json
from pathlib import Path
from itertools import combinations
import numpy as np

DIMS=[3,6]

def color_O(rng):
    A=rng.normal(size=(3,3))
    Q,R=np.linalg.qr(A)
    Q=Q@np.diag(np.sign(np.diag(R)))
    if np.linalg.det(Q)<0:Q[:,0]*=-1
    return Q

def color_transform48(O,K):
    # K[i,a,j,b], i,j original 16 spin indices, a,b 3 SU2 color axes
    return np.einsum('pa,qb,iajb->ipjq', O,O,K.reshape(16,3,16,3),optimize=True).reshape(48,48)

def jw_majoranas(m):
    sx=np.array([[0,1],[1,0]],complex)
    sy=np.array([[0,-1j],[1j,0]],complex)
    sz=np.diag([1,-1]).astype(complex)
    eye=np.eye(2,dtype=complex)
    gam=[]
    for i in range(m):
        for s in [sx,sy]:
            op=np.array([[1.0+0j]])
            for j in range(m): op=np.kron(op,sz if j<i else s if j==i else eye)
            gam.append(op)
    return np.stack(gam)

def exterior_second_quantize(U):
    m=U.shape[0]; out=np.zeros((2**m,2**m),complex)
    def occ_idx(ids):return sum(1<<(m-1-i) for i in ids)
    for n in range(m+1):
        sets=list(combinations(range(m),n))
        for a in sets:
            for b in sets:
                out[occ_idx(b),occ_idx(a)]=np.linalg.det(U[np.ix_(b,a)]) if n else 1
    return out

def Q_source(K,gam):
    # Quantize the exact real FrequencyMatrix K on theta_a=gamma_a/sqrt2.
    # m <=6, so dense small Fock source *analogue* is feasible.
    theta=gam/np.sqrt(2.0)
    return (0.5j)*np.einsum('ij,iab,jbc->ac',K,theta,theta,optimize=True)

def run():
    rng=np.random.default_rng(20261121)
    e={name:0.0 for name in ['source_real_48_gauge_coefficient', 'real_48_group_law',
         'source_Fock_gauge_conjugation', 'source_Fock_selfadjoint',
         'source_theta_covariance', 'source_flattened_sign']}
    bad=[];examples=[]
    for k in range(40):
        O=color_O(rng);P=color_O(rng)
        X=rng.normal(size=(48,48));K=X-X.T
        T=np.kron(np.eye(16),O)
        expected=T@K@T.T
        actual=color_transform48(O,K)
        e['source_real_48_gauge_coefficient']=max(e['source_real_48_gauge_coefficient'],float(np.linalg.norm(actual-expected)))
        group=color_transform48(O,color_transform48(P,K))
        e['real_48_group_law']=max(e['real_48_group_law'],float(np.linalg.norm(group-color_transform48(O@P,K))))
        # Incorrect inverse/transpose color orientation must fail noticeably.
        bad.append(float(np.linalg.norm(actual-T.T@K@T)))
    for m in DIMS:
        gam=jw_majoranas(m)
        theta=gam/np.sqrt(2.0)
        for k in range(6 if m==3 else 3):
            O=color_O(rng);U=O if m==3 else np.kron(np.eye(2),O)
            W=exterior_second_quantize(U)
            T=np.kron(U,np.eye(2))
            A=rng.normal(size=(2*m,2*m));K=A-A.T
            Q=Q_source(K,gam);Qt=Q_source(T@K@T.T,gam)
            e['source_Fock_gauge_conjugation']=max(e['source_Fock_gauge_conjugation'],float(np.linalg.norm(Qt-W@Q@W.conj().T)))
            e['source_Fock_selfadjoint']=max(e['source_Fock_selfadjoint'],float(np.linalg.norm(Q-Q.conj().T)))
            # Literal creator/annihilator (hence theta) output-input covariance.
            e['source_theta_covariance']=max(e['source_theta_covariance'],float(max(np.linalg.norm(W@theta[2*j+s]@W.conj().T - sum(U[p,j]*theta[2*p+s] for p in range(m))) for j in range(m) for s in range(2))))
            # H_C=-(i/4) C_ab gamma_a gamma_b = quantizeFrequency(-C)
            H_explicit=-.25j*np.einsum('ij,iab,jbc->ac',K,gam,gam,optimize=True)
            e['source_flattened_sign']=max(e['source_flattened_sign'],float(np.linalg.norm(H_explicit-Q_source(-K,gam))))
            examples.append({'modes':m,'Q_hermitian_residual':float(np.linalg.norm(Q-Q.conj().T)), 'Q_covariance_residual':float(np.linalg.norm(Qt-W@Q@W.conj().T))})
    assert max(e.values())<1e-10,e
    assert min(bad)>10, min(bad)
    result={'kind':'D1S1 original real FrequencyMatrix 48x48 and reduced exterior Fock source-quantization covariance prescreen',
            'original_source_contract':{'FermionFrequency':'FrequencyMatrix 2 = Matrix (SpinIndex×ColorIndex 2) (SpinIndex×ColorIndex 2) ℝ',
            'FermionQuantization':'M.quantizeFrequency K = (i/2) sum K[p,q] theta_p theta_q',
            'G3A':'adjointCoefficient g A B = R_g[output B,input A]',
            'G4J':'fermion_adjoint transport of original theta'},
            'max_abs_or_fro_residuals':e,'original_48_coefficient_tests':40,
            'small_fock_tests':len(examples),'small_fock_mode_counts':DIMS,
            'wrong_color_transpose_min_fro_error':min(bad),'examples':examples[:3],
            'limitations':'No exact SU2 group parametrization in numerical prescreen: all tested proper real SO3 output-input rotations; not a compiled Lean theorem, 2^24 Fock test, Kato line, SmoothCore or physical spectrum.'}
    Path(__file__).with_name('d1s1_original_quantization_covariance_prescreen_results.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'passed':True,'max_residuals':e,'negative_control_min':min(bad),'small_fock_tests':len(examples)},indent=2))

if __name__=='__main__':run()
