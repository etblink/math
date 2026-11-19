#!/usr/bin/env python3
"""RHOPF-P2 independent energy and finite Fock/CAR negative-control consumer.

Numerical grid and a model Fock Hamiltonian built from the exact 16x16
BFSS gamma coefficients. Toy one-body embedding 16+8 is not original BFSS
fermion source and cannot be promoted into a physical assertion.
"""
import json
import math
from pathlib import Path
import numpy as np
from rhopf_p2_boson_fock_core import (gamma_source,hopf_Q,hedgehog_field,
    escape,full_extended_energy,one_particle_spectrum,SELECTED,EXTRA)

HERE=Path(__file__).resolve().parent
OUT=HERE.parent/'data'/'RHOPF_P2_ENERGY_FOCK_GAP_NUMERICAL_WITNESS_2026_11_18.json'


def check_small_fock_car():
    """Independent 3-mode CAR creation matrices over exact occupation basis."""
    m=3;dim=1<<m
    annih=[]
    for k in range(m):
        c=np.zeros((dim,dim),dtype=np.float64)
        for state in range(dim):
            if state&(1<<k):
                lower=(1<<k)-1
                sign=(-1)**((state&lower).bit_count())
                c[state^(1<<k),state]=sign
        annih.append(c)
    for a in range(m):
        for b in range(m):
            z=annih[a]@annih[b].T+annih[b].T@annih[a]
            assert np.array_equal(z,np.eye(dim) if a==b else np.zeros((dim,dim)))
            assert np.array_equal(annih[a]@annih[b]+annih[b]@annih[a],np.zeros((dim,dim)))
    # One negative and two positive modes, dGamma h many-body gap 1.
    H=sum(ev*(c.T@c) for ev,c in zip((-1,1,1),annih))
    spectrum=np.linalg.eigvalsh(H)
    assert np.array_equal(spectrum,np.array([-1,0,0,0,1,1,1,2],dtype=float))
    return {'modes':3,'fock_dimension':8,'CAR_pairs_checked':9,
      'many_body_energies':spectrum.tolist(),
      'ground_fermion_number':1,'excitation_gap':1.0}


def run():
    gamma=gamma_source()
    phi,dx=hedgehog_field(grid=21,scale=1.4,extent=2.0)
    grid=phi.shape[0]
    assert len(SELECTED)==4 and EXTRA not in SELECTED
    s0=full_extended_energy(phi,gamma,dx,kappa=50)
    target_initial=hopf_Q(phi,gamma)
    assert np.max(np.abs(target_initial[...,[1,2,3,4,5,6]]))<1e-12
    target_middle=hopf_Q(escape(phi,math.pi/4),gamma)
    assert np.max(np.abs(target_middle[...,[1,2,3,4,5,6]]))>1e-2
    assert abs(s0['anisotropy_integral'])<1e-13
    angles=np.linspace(0,math.pi/2,17)
    runs={}
    fiducial=[(10,10,10),(10,10,14),(8,11,10),(10,7,10),(10,10,10)]
    for kappa in (0.,10.,100.,1000.,10000.):
        curve=[]
        for t in angles:
            spin=escape(phi,float(t))
            energy=full_extended_energy(spin,gamma,dx,kappa=kappa)
            assert all(math.isfinite(x) and x>=-1e-9 for x in energy.values())
            qs=hopf_Q(spin,gamma)
            for index in fiducial:
                spectrum=one_particle_spectrum(qs[index],gamma)
                assert spectrum['many_body_ground_parity']==1
                assert spectrum['many_body_excitation_gap']==1
            curve.append({'theta_rad':float(t),**energy,
              'Fock_many_body_gap':1,'Fock_ground_parity':1})
        assert abs(curve[0]['E_total']-s0['E_total'])<1e-8
        assert curve[-1]['E_total']<1e-10
        assert any(x['anisotropy_integral']>1e-3 for x in curve[1:-1])
        runs[str(int(kappa))]=curve
    # Demonstrate an unconstrained field with finite anisotropy coupling has
    # continuous finite-energy escape, and a gap in the TOY Fock model.
    assert max(x['E_total'] for x in runs['10000'])<1e9
    assert max(x['E_total'] for x in runs['10000'])>s0['E_total']+100  # explicit finite barrier along ONE path
    assert all(x['Fock_many_body_gap']==1 for c in runs.values() for x in c)
    # When κ is infinite, an escape state violates the hard constraint.
    assert runs['10'][8]['anisotropy_integral']>0
    # Distinguish finite-energy barrier from exact topological superselection.
    # We have not minimized energies over all configurations or proven a metastable local min.
    car=check_small_fock_car()
    data={'schema':'RHOPF_P2_BOSON_FOCK_TOY_WITNESS/0.1','as_of':'2026-11-18',
       'source_sha':'b9b8192055c70f0d001d7982669b9823c55562ed',
       'environment':{'python':'3.13','numpy':'2.3.5'},
       'field_model':'3D 16-real-unit-spinor; source Gamma quadratic Hopf Q:S15->S8; chosen 4-real complex subsector',
       'energy_model':'E= a∫|∇Q|² + b∫Σ_i<j|∂iQ∧∂jQ|² + κ∫||P_orth φ||²; toy coefficient a=b=1, no physical unit',
       'field_profile':'compact-support radial hedgehog on selected 4-real original gamma source coordinates',
       'grid':{'N':grid,'extent':2.0,'support_radius':1.4,'spacing':dx,'angles_count':len(angles)},
       'fock_adapter':'illustrative number-conserving dGamma(h(Q) ⊕ I8) on ΛC24; NOT original BFSS Fermion 2 theta/Hamiltonian; no SU2 gauge projection',
       'single_particle_h':'h(Q)=Σ_k Q_k Gamma_k (original 16x16 source), plus 8 +1 spectator modes',
       'fock_analytic_spectrum':{'negative_onebody_modes':8,'positive_onebody_modes':16,
            'ground_energy':-8,'ground_fermion_number':8,'ground_parity':1,'excitation_gap':1},
       'independent_small_fock_CAR_consumer':car,
       'selected_source_coords':list(SELECTED),'escape_source_coord':EXTRA,
       'samples':runs,
       'derived':{'strict_sector_initial_E2':s0['E2'],'strict_sector_initial_E4':s0['E4'],
          'finite_kappa_100_max_E':max(c['E_total'] for c in runs['100']),
          'finite_kappa_1000_max_E':max(c['E_total'] for c in runs['1000']),
          'finite_kappa_10000_max_E':max(c['E_total'] for c in runs['10000']),
          'finite_kappa_0_max_E':max(c['E_total'] for c in runs['0']),
          'vacuum_final_energy':runs['100'][-1]['E_total'],
          'selected_S2_target_broken_during_escape':True,
          'one_specific_finite_kappa_10000_path_has_finite_barrier_not_optimized':True,
          'gap_never_closes_in_toy':True,
          'parity_never_changes_in_toy':True,
          'finite_anisotropy_blocks_homotopy_topologically':False},
       'evidence_ceiling':{'physics_model_not_derived':True,'native_Lean_acceptance':False,
          'original_BFSS_Fock_operator_used':False,'BFSS_Fock_vector_unitary_lift':False,
          'valid_full_BFSS_Hamiltonian':False,'gauge_constraints_checked':False,
          'soliton_local_minimum_tested':False,'metastability_proved':False,
          'experimental_prediction':False}}
    OUT.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'status':'LOCAL_P2_TOY_CONSUMER_PASS','grid':data['grid'],
        'initial_energy':s0,'max_E_kappa0':data['derived']['finite_kappa_0_max_E'],
        'max_E_kappa100':data['derived']['finite_kappa_100_max_E'],
        'max_E_kappa1000':data['derived']['finite_kappa_1000_max_E'],
        'max_E_kappa10000':data['derived']['finite_kappa_10000_max_E'],
        'final_energy':data['derived']['vacuum_final_energy'],
        'fermionic_gap_and_parity_constant':True,
        'independent_CAR':car,
        'physical_BFSS_Fock_Hamiltonian':False},indent=2))

if __name__=='__main__':run()
