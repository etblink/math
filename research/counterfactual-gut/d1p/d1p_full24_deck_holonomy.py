#!/usr/bin/env python3
"""Source Gamma7/Gamma8 exact 24-orbital eight-Slater deck holonomy.

Uses matrices of size 24, never a dense 2^24 Fock matrix. Tracks the
actual occupied wedge and its continuous Berry connection along the
full simultaneous spatial/color deck path, not just endpoint signs.
"""
import json
from pathlib import Path
import numpy as np
from d1p_berry_curvature_exact import G

S_generator=G[7]@G[8]
assert np.array_equal(S_generator@S_generator,-np.eye(16,dtype=np.int64))
K8=S_generator[::2,::2].astype(float)
assert np.array_equal(K8.T,-K8)
assert np.array_equal(K8@K8,-np.eye(8))
assert np.array_equal(S_generator[1::2,1::2],S_generator[::2,::2])
assert np.all(S_generator[::2,1::2]==0) and np.all(S_generator[1::2,::2]==0)

V0=np.zeros((24,8),dtype=complex)
for j in range(8):
    s=1 if j<4 else -1
    V0[3*j+1,j]=1/np.sqrt(2)
    V0[3*j+2,j]=1j*s/np.sqrt(2)
assert np.linalg.norm(V0.conj().T@V0-np.eye(8))<1e-14

Bcolor=np.array([[0,-1,0],[1,0,0],[0,0,0]],dtype=float)
Kcolor=np.kron(np.eye(8),Bcolor)
Ksp=np.zeros((24,24))
for j in range(8):
    for k in range(8):
        for color in (1,2):Ksp[3*j+color,3*k+color]=K8[j,k]/2
assert np.allclose(Ksp.T,-Ksp)

def val(theta,V=V0):
    S8=np.cos(theta/2)*np.eye(8)+np.sin(theta/2)*K8
    Us=np.eye(24)
    for j in range(8):
        for k in range(8):
            for color in (1,2):Us[3*j+color,3*k+color]=S8[j,k]
    c,s=np.cos(theta),np.sin(theta)
    Oc=np.array([[c,-s,0],[s,c,0],[0,0,1]])
    Uc=np.kron(np.eye(8),Oc)
    Vt=Uc@Us@V
    dV=Kcolor@Vt+Uc@Ksp@Us@V
    return Vt,dV

def run_path(steps,V):
    phases=[];max_local=0.;max_unit=0.;max_dphase=0.
    prev=val(0.,V)[0]
    for k in range(steps+1):
        theta=np.pi*k/steps
        vt,dv=val(theta,V)
        trace=np.trace(vt.conj().T@dv)
        max_local=max(max_local,abs(trace))
        max_unit=max(max_unit,float(np.linalg.norm(vt.conj().T@vt-np.eye(8))))
        if k>0:
            z=np.linalg.det(prev.conj().T@vt)
            phases.append(np.angle(z))
            max_dphase=max(max_dphase,abs(np.angle(z)))
        prev=vt
    W=val(np.pi,V)[0]
    frame=V.conj().T@W
    span_error=np.linalg.norm(W-V@frame)
    phase=np.linalg.det(frame)
    return {'steps':steps,'maximum_instantaneous_occupied_Berry_trace':float(max_local),
            'maximum_orthonormal_frame_residual':float(max_unit),
            'maximum_neighbor_wedge_overlap_phase':float(max_dphase),
            'sum_neighbor_overlap_phases':float(sum(phases)),
            'endpoint_occupied_subspace_error':float(span_error),
            'endpoint_occupied_wedge_overlap_real':float(phase.real),
            'endpoint_occupied_wedge_overlap_imag':float(phase.imag),
            'endpoint_deck_holonomy_error':float(abs(phase-1))}

def main():
    good=[run_path(s,V0) for s in (24,96,384)]
    for x in good:
        assert x['maximum_instantaneous_occupied_Berry_trace']<1e-11
        assert x['endpoint_occupied_subspace_error']<1e-10
        assert x['endpoint_deck_holonomy_error']<1e-10
    wrong=V0.copy()
    for j in range(4,8):wrong[3*j+2,j]=1j/np.sqrt(2)
    bad=run_path(96,wrong)
    assert bad['endpoint_occupied_subspace_error']>1, bad
    return {'status':'PASS','carrier':'literal Gamma7Gamma8 source 24-orbital SU2 color wedge, no dense 2^24 Fock matrix',
            'seeds':'Gamma8 four-plus/four-minus occupied orbitals',
            'path':'u(t)=sin(t)e7+cos(t)e8; n(t)=Ocolor(t)e0; 0<=t<=pi',
            'full24_deck_checks':good,
            'all_plus_wrong_seeds_negative_control':bad,
            'proof_perspective':'exact Γ7Γ8 source block and source orbital matrix give endpoint A=4 positive SO2 blocks; occupied Berry trace vanishes along entire explicit path',
            'limitation':'Real/complex 24-orbital exterior calculation, not a compiled original Fermion 2 Kato transport theorem'}

if __name__=='__main__':
    r=main();Path(__file__).with_name('d1p_full24_deck_holonomy_results.json').write_text(json.dumps(r,indent=2)+'\n')
    print(r['status'],'max trace',max(x['maximum_instantaneous_occupied_Berry_trace'] for x in r['full24_deck_checks']), 'wrong-span',r['all_plus_wrong_seeds_negative_control']['endpoint_occupied_subspace_error'])
