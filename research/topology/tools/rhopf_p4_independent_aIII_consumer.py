#!/usr/bin/env python3
"""RHOPF-P4 separate consumer: protected AIII positive control, source cancellation.

Class AIII is a mathematical family over parameter S3. It is NOT a spatial
Fredholm/Callias index, source original BFSS gauge representation, or a particle.
"""
import json
import math
from itertools import combinations
from pathlib import Path
import numpy as np
from rhopf_p4_source_chiral_core import (
    ORIGINAL_GAMMA_BLOB, original_gamma, minimal_gamma, sphere_map,
    chiral_24_family, symmetry_breaking_escape, based_gap_preserving_escape, fock_ground_data)


def stereographic_density(x):
    """Independent analytic Jacobian of the S3 inverse stereographic map."""
    x=np.asarray(x,dtype=float)
    r2=float(x@x)
    J=np.zeros((4,4),dtype=float)
    y=sphere_map(x)
    J[:,0]=y
    J[0,1:]=4*x/(1+r2)**2
    J[1:,1:]=(2/(1+r2))*np.eye(3)-4*np.outer(x,x)/(1+r2)**2
    return float(np.linalg.det(J)), -8/(1+r2)**3


def simpson_winding(N=4096):
    """Degree = (1/vol(S3)) integral Jacobian; r=tan(t) radial form."""
    assert N%2==0
    t=np.linspace(0,math.pi/2,N+1)
    # -8/(1+r²)^3, volume element 4πr² dr, S3 volume 2π².
    # After r=tan t: density coefficient -(16/π) sin²t cos²t.
    integrand=-16/math.pi *np.sin(t)**2*np.cos(t)**2
    step=(math.pi/2)/N
    return float(step/3*(integrand[0]+integrand[-1]+4*np.sum(integrand[1:-1:2])+2*np.sum(integrand[2:-1:2])))


def run():
    G=original_gamma()
    omega=G[4]@G[0]@G[1]@G[2]@G[3]
    I=np.eye(16,dtype=np.int64)
    assert np.array_equal(omega@omega,I)
    assert int(np.trace(omega))==0
    assert np.array_equal(G[5]@omega@G[5],-omega)
    eig=np.linalg.eigvalsh(omega)
    assert np.array_equal(np.rint(eig).astype(int),np.array([-1]*8+[1]*8))
    # Stronger source-specific negative test: ANY five of the nine original
    # gammas yield vanishing complex AIII volume trace, because one of the
    # four remaining gammas anticommutes with their odd Clifford product.
    five_tuple_checks=0
    for subset in combinations(range(9),5):
        V=np.eye(16,dtype=np.int64)
        for index in subset:V=V@G[index]
        extra=next(i for i in range(9) if i not in subset)
        assert np.array_equal(V@V,I)
        assert np.array_equal(G[extra]@V@G[extra],-V)
        assert int(np.trace(V))==0
        five_tuple_checks+=1
    assert five_tuple_checks==126
    minimal,Smin=minimal_gamma()
    omega4=Smin@minimal[0]@minimal[1]@minimal[2]@minimal[3]
    assert np.allclose(np.trace(omega4),4)
    # The 3D winding density of a 4-generator flattened Dirac family is
    # proportional to tr(S G0 G1 G2 G3); exact zero for full BFSS 16 block.
    for x in ([0,0,0],[.2,.5,-.4],[1,2,3],[7,-11,2]):
        direct,analytic=stereographic_density(x)
        assert abs(direct-analytic)<1e-12
    degree=simpson_winding()
    assert abs(degree+1)<1e-12
    assert abs(simpson_winding(1024)-degree)<1e-12
    fixture_positions=[[0,0,0],[.3,.7,-.5],[2,1,0],[0,8,0]]
    frame_angles=[0,.13,.5,1.,math.pi/2]
    test_counts=0
    based_counts=0
    based_chiral_violation_seen={"minimal4_plus_20":False,"source16_plus_8":False}
    stats={}
    for kind in ('minimal4_plus_20','source16_plus_8'):
        E,Sref=chiral_24_family(kind,np.array([1.,0.,0.,0.]),G)
        for x in fixture_positions:
            h,S=chiral_24_family(kind,sphere_map(x),G)
            assert np.allclose(S,Sref)
            base=fock_ground_data(h)
            assert base['negative_modes']==12 and base['positive_modes']==12
            assert base['ground_parity']==1 and abs(base['ground_energy']+12)<1e-11
            for theta in frame_angles:
                test_counts+=1
                H=symmetry_breaking_escape(h,S,theta)
                data=fock_ground_data(H)
                assert data['negative_modes']==12 and data['ground_parity']==1
                assert abs(data['excitation_gap']-1)<1e-10
                anticom=S@H+H@S
                assert np.allclose(anticom,2*np.sin(theta)*np.eye(24))
                if theta==math.pi/2:assert np.allclose(H,S)
                if theta>0:assert np.linalg.norm(anticom)>0
                based_counts+=1
                HB=based_gap_preserving_escape(h,S,E,theta)
                EB=based_gap_preserving_escape(E,S,E,theta)
                assert np.allclose(EB,E), 'boundary drift in proposed based homotopy'
                db=fock_ground_data(HB)
                assert db['negative_modes']==12 and db['ground_parity']==1
                assert abs(db['excitation_gap']-1)<1e-10
                if theta==math.pi/2:assert np.allclose(HB,E)
                if theta>0 and theta<math.pi/2:
                    if np.linalg.norm(S@HB+HB@S)>1e-7:
                        based_chiral_violation_seen[kind]=True
        stats[kind]={'negative_modes':12,'ground_parity':'+1 even','gap':1,
                     'winding_magnitude':1 if kind.startswith('minimal4') else 0,
                     'is_original_BFSS_hamiltonian':False}
    assert based_counts==40 and all(based_chiral_violation_seen.values())
    # We never equate a nonzero class-AIII invariant of an abstract S3 family
    # to actual localized Fock zero modes in 3+1D physical space.
    out={'status':'LOCAL_MATH_POSITIVE_AND_NEGATIVE_CONTROLS_PASS_NO_PHYSICS_GATE',
       'source_original_gamma_blob':ORIGINAL_GAMMA_BLOB,
       'minimal4_clifford_volume_trace':float(np.trace(omega4).real),
       'original_source16_clifford_volume_trace':int(np.trace(omega)),
       'original_source16_volume_omega_spectrum':{'negative':8,'positive':8},
       'degree_with_orientation':degree,
       'source16_winding':0,'minimal4_winding_abs':1,
       'all_source_gamma_5_subsets_trace_zero':five_tuple_checks,
       'symmetry_breaking_gapped_frames_checked':test_counts,
       'boundary_fixed_gapped_frames_checked':based_counts,
       'boundary_fixed_chiral_violation_detected':based_chiral_violation_seen,
       'toy_Fock_24_mode_comparison':stats,
       'original_BFSS_Fock_gamma_operator_used':False,
       'original_BFSS_su2_gauge_checked':False,
       'real_space_spatial_Dirac_Fredholm_index_computed':False,
       'fermionic_zero_modes_computed':False,'new_physical_particle_claim':False}
    print(json.dumps(out,indent=2))

if __name__=='__main__':run()
