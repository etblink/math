#!/usr/bin/env python3
"""RHOPF-P3 independent occupation-basis CAR and Fock-parity controls.

Proves finite-dimensional parity via exact small-mode matrices; the 24-mode
statement follows from canonical CAR algebra, not dense matrix execution.
Tests source-gamma projector along a based three-dimensional escape.
NO 3+1D physical Dirac/Yukawa operator, gauge-domain map or BFSS Hamiltonian.
"""
import json
import math
from pathlib import Path
import numpy as np
from rhopf_p3_original_gamma_projector_core import (
    original_gamma,hopf_Q,occupied_projector,based_escape,ORIGINAL_GAMMA_SHA)


def occupation_CAR_test(n):
    """Exact integer CAR, parity, Majorana volume and even-operator checks."""
    dim=1<<n
    a=[]
    for k in range(n):
        z=np.zeros((dim,dim),dtype=np.int64)
        for state in range(dim):
            if (state>>k)&1:
                z[state^(1<<k),state]=(-1)**((state & ((1<<k)-1)).bit_count())
        a.append(z)
    I=np.eye(dim,dtype=np.int64)
    for i in range(n):
        for j in range(n):
            assert np.array_equal(a[i]@a[j]+a[j]@a[i],np.zeros((dim,dim),dtype=np.int64))
            assert np.array_equal(a[i]@a[j].T+a[j].T@a[i],I if i==j else 0*I)
    major=[]
    for c in a:
        major.extend((c+c.T,1j*(c.T-c)))
    for i in range(2*n):
        for j in range(2*n):
            test=major[i]@major[j]+major[j]@major[i]
            assert np.array_equal(test,2*np.eye(dim) if i==j else 0*I)
    parity=np.diag([(-1)**state.bit_count() for state in range(dim)])
    product=np.eye(dim,dtype=complex)
    for g in major:product=product@g
    # Correct convention with gamma_(2j)=a+a†, gamma_(2j+1)=i(a†−a):
    exact_parity=(-1j)**n*product
    assert np.array_equal(exact_parity,parity)
    assert np.array_equal(parity@parity,I)
    for g in major:assert np.array_equal(parity@g@parity,-g)
    for i in range(2*n):
        for j in range(2*n):
            assert np.array_equal(parity@(major[i]@major[j])@parity,major[i]@major[j])
    return {'n_modes':n,'dim_Fock':dim,'Majorana_CAR_anticommutators_checked':(2*n)**2,
            'parity_flips_all_Majoranas':True,'parity_commutes_with_even_bilinears':True,
            'ordered_Majorana_volume_convention':'(-i)^n product gamma_0...gamma_(2n-1)'}


def run():
    gamma=original_gamma()
    numerical=[]
    trial=[]
    for z in [0.0,0.3,0.7,1.2]:
        phi=np.zeros(16,dtype=float)
        phi[0]=math.cos(z);phi[1]=math.sin(z)*math.cos(.6)
        phi[8]=math.sin(z)*math.sin(.6)/math.sqrt(2)
        phi[9]=math.sin(z)*math.sin(.6)/math.sqrt(2)
        trial.append(phi)
    for phi in trial:
        first=None;last=None
        for t in np.linspace(0,math.pi/2,9):
            evolved=based_escape(phi,float(t))
            y=hopf_Q(evolved,gamma)
            P=occupied_projector(y,gamma)
            spectrum=np.linalg.eigvalsh(2*P-np.eye(16))
            assert np.max(np.abs(np.sort(spectrum)-np.array([-1.]*8+[1.]*8)))<1e-11
            if first is None:first=P
            last=P
            numerical.append({'t_rad':float(t),'Q_target_norm':float(np.linalg.norm(y)),
                              'occupied_rank':int(round(np.trace(P))),
                              'one_body_min_abs_eig':float(np.min(np.abs(spectrum)))})
        assert np.max(np.abs(last-occupied_projector(hopf_Q(np.eye(16)[0],gamma),gamma)))<1e-11
    micro=[occupation_CAR_test(n) for n in (1,2,3,4)]
    result={
      'status':'LOCAL_SOURCE_PINNED_MATHEMATICAL_CONSUMER_PASS_ONLY',
      'original_gamma_blob_sha':ORIGINAL_GAMMA_SHA,
      'projector_form':'P_-(y)=(I16-Gamma(y))/2 over S8; rank 8',
      'checked_based_escape_field_fixtures':len(trial),
      'checked_projector_frames':len(numerical),
      'every_observed_projector_rank':8,
      'every_observed_onebody_abs_gap':1.0,
      'source_16_gamma_not_identified_with_original_48_Majoranas':True,
      'CAR_microtests':micro,
      'purely_algebraic_24_mode_consequence':'Parity volume is unitary, flips 48 normalized gamma and commutes with even bilinears; precise original source mode orientation not qualified here',
      'original_BFSS_Fock_vector_representation_qualified_here':False,
      'physical_spatial_Dirac_index_computed':False,
      'gauge_projector_and_Fock_parity_intertwiner_qualified':False,
    }
    print(json.dumps(result,indent=2))
    return result

if __name__=='__main__':run()
