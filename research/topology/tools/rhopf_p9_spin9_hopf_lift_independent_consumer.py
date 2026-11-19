#!/usr/bin/env python3
"""Independent P9 integer gamma / Lie lift / underdetermination consumer.

Checks 3 distinct original Spin9 bivectors inducing SAME Hopf common-phase
circle on selected C^2, but differing on full 16-spinor and vector planes.
Also tests 48-real-generator color-Spin9 commutation at coefficient level.
DOES NOT assert actual Hamiltonian commutation or physical U(1) conservation.
"""
import json
import math
from pathlib import Path
import numpy as np
from rhopf_p9_spin9_hopf_lift_core import (
    SOURCE_GAMMA_BLOB,SUBCARRIER,BIVECTOR_PAIRS,source_gamma,
    source_bivector,common_phase_generator,spinor_rotation,
    hopf_Q,original_48_label_actions)


def exact_integer_tests():
    G=source_gamma();J=common_phase_generator()
    I16=np.eye(16,dtype=np.int64)
    selected=list(SUBCARRIER)
    transverse=[i for i in range(16) if i not in selected]
    Ks=[]
    for i,j,sign in BIVECTOR_PAIRS:
        K=source_bivector(G,i,j,sign)
        assert np.array_equal(K[np.ix_(selected,selected)],J[np.ix_(selected,selected)])
        assert np.array_equal(K[np.ix_(transverse,selected)],np.zeros((12,4),dtype=np.int64))
        assert np.array_equal(K[np.ix_(selected,transverse)],np.zeros((4,12),dtype=np.int64))
        assert np.array_equal(K@K,-I16)
        assert np.array_equal(K.T,-K)
        # Full source vector Clifford commutation, not inferred from a picture.
        for a in range(9):
            comm=K@G[a]-G[a]@K
            if a==i:target=-2*sign*G[j]
            elif a==j:target=2*sign*G[i]
            else:target=np.zeros((16,16),dtype=np.int64)
            assert np.array_equal(comm,target)
        Ks.append(K)
    # 3 distinct source Spin9 full-spinor generators agree on C² subcarrier.
    assert all(not np.array_equal(Ks[0],K) for K in Ks[1:])
    assert all(np.count_nonzero(Ks[a]-Ks[b])>0 for a in range(3) for b in range(a+1,3))
    # The standalone zero-on-complement complex J is NOT an so(9)-spin
    # Lie generator; projection onto span{gamma_i gamma_j} has an exact
    # complement. All bivectors are pairwise trace orthogonal.
    B=[]
    for i in range(9):
        for j in range(i+1,9):B.append(G[i]@G[j])
    gram=np.array([[int(np.sum(A*Z)) for Z in B] for A in B],dtype=np.int64)
    assert np.array_equal(gram,16*np.eye(36,dtype=np.int64))
    projections=np.array([int(np.sum(A*J)) for A in B],dtype=np.int64)
    numerator=int(np.dot(projections,projections))
    # ||P J||²=(sum <J,Bij>²)/16 = 3, ||J||²=4; residual = 1.
    assert numerator==48
    assert int(np.sum(J*J))==4
    assert numerator//16==3
    assert 4-numerator//16==1
    # Lie algebra Spin9 preserves the actual source 16-spinor metric,
    # but it moves the 9-vector gamma-plane except on selected special
    # fields. Test by explicit vectors and analytic trigonometric rotations.
    vec=np.zeros(16,dtype=float)
    for a,v in zip(selected,(0.1,0.2,0.3,0.4)):vec[a]=v
    vec/=np.linalg.norm(vec)
    q_before=hopf_Q(G,vec)
    assert max(abs(q_before[a]) for a in range(9) if a not in (0,7,8))<1e-12
    for K in Ks:
        for t in (0,.17,.52,math.pi/2,math.pi,2*math.pi):
            U=spinor_rotation(K,t)
            v=U@vec
            assert abs(np.linalg.norm(v)-1)<1e-12
            assert np.linalg.norm(hopf_Q(G,v)-q_before)<1e-12
            # Multiplication z -> e^{it}z on each complex component.
            for a,b in ((0,1),(8,9)):
                assert abs(complex(v[a],v[b])-np.exp(1j*t)*complex(vec[a],vec[b]))<1e-12
            if t==math.pi:assert np.linalg.norm(U+np.eye(16))<1e-12
            if t==2*math.pi:assert np.linalg.norm(U-np.eye(16))<1e-12
    # A generic full 16-real spinor is NOT fixed as a Hopf-vector base by K:
    generic=np.random.default_rng(20261118).standard_normal(16)
    generic/=np.linalg.norm(generic)
    change=[float(np.linalg.norm(hopf_Q(G,spinor_rotation(K,.43)@generic)-hopf_Q(G,generic))) for K in Ks]
    assert all(c>.001 for c in change)
    # Source SU2 color and Spin9 spinor transformations commute on the 48
    # original 48 real COLOR-BY-SPIN tensor coordinates through Kronecker
    # factor separation. Source C48C0 proves the proper paired reindex.
    color_rotations=[]
    c=np.array([[0,-1,0],[1,0,0],[0,0,1]],dtype=np.int64)
    color_rotations.append(c)
    c=np.array([[0,0,1],[1,0,0],[0,1,0]],dtype=np.int64)
    color_rotations.append(c)
    for K in Ks:
        for color in color_rotations:
            S,C=original_48_label_actions(K,color)
            assert S.shape==C.shape==(48,48)
            assert np.array_equal(S@C,C@S)
    # Half-turn -I_16 replicated across three original colors is -I_48.
    half_turn=np.kron(np.eye(3,dtype=int),(-I16))
    assert np.array_equal(half_turn,-np.eye(48,dtype=int))
    return {'source_original_gamma_blob':SOURCE_GAMMA_BLOB,
        'all_9_gamma_exact_Clifford_16x16':True,
        'tested_bivector_lifts':[[i,j,sign] for i,j,sign in BIVECTOR_PAIRS],
        'all_preserve_selected_complex_two_plane':True,
        'all_restrict_to_same_selected_Hopf_U1_phase':True,
        'all_differ_on_full_source_R16':True,
        'full_selected_J_in_spin9_Lie_image':False,
        'selected_J_norm_squared':4,'spin9_Lie_projection_norm_squared':3,
        'orthogonal_residual_norm_squared':1,
        'source_complex_phase_one_parameter_group_half_turn_minus_I16':True,
        'source_48_real_Majorana_axis_half_turn_minus_I48':True,
        'factorized_3_by_16_real_gamma_and_color_action_commute_checked':True,
        'exact_original_source_paired_48_reindex_not_recomputed_here':True,
        'generic_full_spinor_base_not_unchanged_by_fiber_rotation':change}


def independent_fermion_parity_CAR(n):
    """Small ORIGINAL-TYPE CAR algebra abstract demonstration, not 2^24 Fock."""
    d=1<<n
    a=[]
    for k in range(n):
        z=np.zeros((d,d),dtype=np.int64)
        for s in range(d):
            if (s>>k)&1:
                z[s^(1<<k),s]=(-1)**((s&((1<<k)-1)).bit_count())
        a.append(z)
    gam=[]
    for z in a:
        gam.extend((z+z.T,1j*(z.T-z)))
    P=np.diag([(-1)**(s.bit_count()) for s in range(d)])
    for gamk in gam:
        assert np.allclose(P@gamk@P,-gamk)
    assert np.array_equal(P@P,np.eye(d,dtype=int))
    # A candidate unitary implementer of -I on all Majoranas differs
    # from parity by a scalar in an irreducible full Clifford module.
    return len(gam)


def run():
    out=exact_integer_tests()
    out['small_Fock_CAR_odd_generator_parity_sign_test_counts']={str(n):independent_fermion_parity_CAR(n) for n in (1,2,3,4)}
    out['classification']='SOURCE_EXACT_SPIN9_HOPF_CIRCLE__MULTIPLE_FULL_SOURCE_LIFTS__PHYSICAL_CURRENT_NOT_QUALIFIED'
    out['limitations']={
        'is_source_SPIN9_lie_action_tested_in_Lean_new_gate':False,
        'original_BFSS_closed_Hamiltonian_commutes_with_FockOnly_hopf_U1_proved':False,
        'source_Fock_vector_group_implementer_constructed':False,
        'source_48_Majorana_parity_identification_completed_as_Lean_theorem':False,
        'gauge_compatible_physical_3d_current_or_index_constructed':False,
        'actual_new_particle_observable':False}
    print(json.dumps(out,indent=2))
    return out

if __name__=='__main__':run()
