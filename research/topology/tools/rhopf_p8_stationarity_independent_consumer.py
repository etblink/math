#!/usr/bin/env python3
"""RHOPF-P8: independent fixed-N, trapped GP energetic-instability controls.

Test original source-gamma initial Hopf restriction and actual GP stationarity,
negative versus positive specific energy curvatures, perturbation response,
and adversarial Hopf imprint. This is not a proof of global stability nor
original BFSS Fock dynamics.

Run: OPENBLAS_NUM_THREADS=1 python rhopf_p8_stationarity_independent_consumer.py
Use --full to include the 48^3 finite-grid refinement for the stationary pair.
"""
import argparse
import json
import math
from pathlib import Path
import numpy as np
from rhopf_p8_trapped_gp_core import (
    domain,normalize,init_two_lobes,energy,stationary_residual,
    prepare_stationary,evolve,amplitude_disturbance,
    opposite_periodic_displacement,symmetric_mixture_curvature,
    hopf_imprinted_trap,axial_core_filling)
from rhopf_p6_gp_dynamics_core import (exact_source_gamma_restriction,
                                            profile_degree_magnitude)

OUT=Path(__file__).resolve().parent.parent/'data'/'RHOPF_P8_TRAPPED_GP_STATIONARITY_PERTURBATION_EVIDENCE_2026_11_18.json'
GAMMA_SHA='b9b8192055c70f0d001d7982669b9823c55562ed'


def symmetric_stationary(N,L,xyz,dx,k2,V,g12=3.5):
    x,y,z=xyz
    seed=np.exp(-.5*(x*x+y*y+z*z)/2**2).astype(complex)
    phi=normalize(seed,dx,50.)
    a,b,h=prepare_stationary(phi,phi.copy(),dx,k2,V,50.,50.,g12=g12,
                              dt=.02,max_iter=800,record_every=400)
    a,b,s=prepare_stationary(a,b,dx,k2,V,50.,50.,g12=g12,
                              dt=.006,max_iter=300,record_every=150)
    assert np.max(np.abs(a-b))<1e-10
    E=energy(a,b,dx,k2,V,g12=g12)
    residual=stationary_residual(a,b,dx,k2,V,g12=g12)
    assert residual['max_residual']<.003
    kappa=symmetric_mixture_curvature(a,xyz,dx,k2,V,g12=g12)
    assert abs(kappa['E_at_zero']-E['E'])<1e-8
    assert kappa['d2E_d_epsilon2'] < -20
    eps=.03
    am,bm=opposite_periodic_displacement(a,b,xyz,L,dx,50.,50.,eps)
    ep=energy(am,bm,dx,k2,V,g12=g12)
    assert ep['E']<E['E']
    assert abs(ep['N1']-50)<1e-10 and abs(ep['N2']-50)<1e-10
    return a,b,{'state':E,'residual':residual,'negative_exact_directional_curvature':kappa,
        'anti_species_perturb_eps':eps,'perturb_energy':ep['E'],
        'perturb_energy_delta':ep['E']-E['E'],
        'iteration_stage_coarse':[{'it':i['it'],'E':i['E']} for i in h],
        'iteration_stage_refine':[{'it':i['it'],'E':i['E']} for i in s]}


def separated_stationary(N,L,xyz,dx,k2,V,g12=3.5,require_positive_curvature=True):
    a,b=init_two_lobes(xyz,dx,N1=50.,N2=50.)
    a,b,h=prepare_stationary(a,b,dx,k2,V,50.,50.,g12=g12,
                              dt=.025,max_iter=750,record_every=375)
    a,b,s=prepare_stationary(a,b,dx,k2,V,50.,50.,g12=g12,
                              dt=.006,max_iter=300,record_every=150)
    E=energy(a,b,dx,k2,V,g12=g12)
    residual=stationary_residual(a,b,dx,k2,V,g12=g12)
    assert residual['max_residual']<.003
    dE=[]
    eps=.03
    for sign in (1,-1):
        aa,bb=opposite_periodic_displacement(a,b,xyz,L,dx,50.,50.,sign*eps)
        dE.append(energy(aa,bb,dx,k2,V,g12=g12)['E']-E['E'])
    sampled_curvature=sum(dE)/eps**2
    if require_positive_curvature:
        assert min(dE)>0
        assert sampled_curvature>35
    # Real-time stationary-state verification. Two independent Noether
    # charges and energy must remain nearly conserved, density near static.
    aa,bb,real_history=evolve(a.copy(),b.copy(),dx,k2,V,
                               dt=.005,t_end=.3,g12=g12,record_step=30)
    initial,final=real_history[0],real_history[-1]
    drift=abs(final['E']-initial['E'])
    ndrift=max(abs(final['N1']-initial['N1']),abs(final['N2']-initial['N2']))
    adrift=float(np.linalg.norm(np.abs(aa)**2-np.abs(a)**2)/np.linalg.norm(np.abs(a)**2))
    bdrift=float(np.linalg.norm(np.abs(bb)**2-np.abs(b)**2)/np.linalg.norm(np.abs(b)**2))
    assert drift<1e-5 and ndrift<1e-9
    assert max(adrift,bdrift)<.002
    # Positive-energy physical perturb, without assuming stability in all modes.
    ap,bp=amplitude_disturbance(a,b,xyz,dx,50.,50.,epsilon=.15)
    Epert=energy(ap,bp,dx,k2,V,g12=g12)
    assert Epert['E']>E['E']
    ca,cb,history_pert=evolve(ap,bp,dx,k2,V,dt=.005,t_end=.3,g12=g12,record_step=30)
    assert abs(history_pert[-1]['E']-history_pert[0]['E'])<1e-4
    assert abs(history_pert[-1]['N1']-50)<1e-8
    assert abs(history_pert[-1]['N2']-50)<1e-8
    return a,b,{'state':E,'residual':residual,'opposite_shift_eps':eps,
        'opposite_shift_E_deltas':dE,'sampled_even_curvature':sampled_curvature,
        'real_time':{'t_end':.3,'dt':.005,'E_absolute_drift':drift,'N_absolute_max_drift':ndrift,
          'species1_relative_density_drift':adrift,'species2_relative_density_drift':bdrift},
        'amplitude_disturbance':{'epsilon':.15,'positive_E_delta':Epert['E']-E['E'],
          'relative_energy_drift':(history_pert[-1]['E']-history_pert[0]['E'])/Epert['E'],
          'final_component_overlap':history_pert[-1]['overlap']},
        'iteration_stage_coarse':[{'it':i['it'],'E':i['E']} for i in h],
        'iteration_stage_refine':[{'it':i['it'],'E':i['E']} for i in s]}


def hopf_perturbation_control(N,L,xyz,dx,k2,V,reference_sep_E):
    a,b,r=hopf_imprinted_trap(xyz,dx,N1=50.,N2=50.)
    init=energy(a,b,dx,k2,V,g12=3.5)
    a,b,h=prepare_stationary(a,b,dx,k2,V,50.,50.,g12=3.5,
                              dt=.02,max_iter=900,record_every=300)
    imprinted=energy(a,b,dx,k2,V,g12=3.5)
    assert init['E']>imprinted['E']+100
    assert imprinted['E']>reference_sep_E+8
    # Explicitly allow a small symmetry-breaking seed filling the
    # psi1 axial vortex core; do NOT impose winding as hard constraint.
    ap,bp=axial_core_filling(a,b,r,dx,50.,50.,eps=.08)
    Eseed=energy(ap,bp,dx,k2,V,g12=3.5)
    ap,bp,relax=prepare_stationary(ap,bp,dx,k2,V,50.,50.,g12=3.5,
                                   dt=.025,max_iter=1000,record_every=250)
    final=energy(ap,bp,dx,k2,V,g12=3.5)
    assert final['E']<imprinted['E']-8
    assert final['E']<reference_sep_E+1
    return {'original_Hopf_imprint_degree_abs':1,
         'imprint_degree_analytic_reason':'degree one compact radial S3 map; constant positive component rescaling and envelope preserve orientation where normalized',
         'imprint_initial_E':init['E'],
         'symmetry_constrained_relax_E':imprinted['E'],
         'core_fill_seed_E':Eseed['E'],
         'symmetry_broken_relax_E':final['E'],
         'separate_ground_state_reference_E':reference_sep_E,
         'initial_imaginary_time_history':[{'it':j['it'],'E':j['E']} for j in h],
         'broken_symmetry_history':[{'it':j['it'],'E':j['E']} for j in relax],
         'numeric_post_relaxation_Hopf_winding_not_certified':True,
         'minimum_grid_density_after_relax':final['min_total_grid_density'],
         'no_actual_GP_real_time_Hopf_transition_certified':True}


def main():
    p=argparse.ArgumentParser()
    p.add_argument('--full',action='store_true',help='Include N48 spatial refinement; costs more CPU')
    args=p.parse_args()
    signed_perm,signs=exact_source_gamma_restriction()
    degree,err=profile_degree_magnitude(R=2.)
    assert abs(degree-1)<1e-11
    grids=[(32,5.),(40,6.)]+([(48,6.)] if args.full else [])
    tests={}
    for N,L in grids:
        xyz,dx,k2,V=domain(N,L)
        _,_,symmetric=symmetric_stationary(N,L,xyz,dx,k2,V,g12=3.5)
        _,_,separated=separated_stationary(N,L,xyz,dx,k2,V,g12=3.5)
        assert symmetric['state']['E']>separated['state']['E']+5
        assert symmetric['state']['overlap']>2*separated['state']['overlap']
        tests[str(N)]={'L':L,'dx':dx,'symmetric_mixed':symmetric,
                       'separated':separated,
                       'difference_E_mixed_minus_separated':symmetric['state']['E']-separated['state']['E']}
        print('P8_GRID_PASS',N,'symmetric_curvature',symmetric['negative_exact_directional_curvature']['d2E_d_epsilon2'],
              'mixed_E',symmetric['state']['E'],'separated_E',separated['state']['E'],flush=True)
    # Miscible-parameter control at same continuum units, fixed populations.
    xyz,dx,k2,V=domain(40,6.)
    _,_,miscible=separated_stationary(40,6.,xyz,dx,k2,V,g12=2.,require_positive_curvature=False)
    assert miscible['state']['overlap']>2*tests['40']['separated']['state']['overlap']
    hopf={}
    for N,L in ((32,5.),(40,6.)):
        xyz,dx,k2,V=domain(N,L)
        hopf[str(N)]=hopf_perturbation_control(N,L,xyz,dx,k2,V,tests[str(N)]['separated']['state']['E'])
        print('P8_HOPF_CHALLENGE_PASS',N,'imprinted',hopf[str(N)]['symmetry_constrained_relax_E'],
                'after_symmetry_break',hopf[str(N)]['symmetry_broken_relax_E'],flush=True)
    evidence={
      'schema':'RHOPF_P8_TRAPPED_GP_NUMERICAL_STATIONARITY_AND_ADVERSARIAL_HOPF/0.1',
      'date':'2026-11-18','status':'LOCAL_NUMERICAL_EQUILIBRIUM_AND_ADVERSARIAL_CONTROL_PASS',
      'original_source_gamma_sha':GAMMA_SHA,
      'GP_model':'2 complex BOSONIC species in harmonic trap omega=0.6, g11=g22=2, g12=2 or 3.5, N1=N2=50',
      'computational_boundary':'periodic cube [-L,L)^3 with harmonic trap; not hard Dirichlet',
      'stationary_equations':'[-0.5 Delta+V+2*n_j+g12*n_other]psi_j=mu_j psi_j',
      'preparation':'separate-Nj-normalized imaginary-time Strang gradient relaxation',
      'real_time':'unitary Hamiltonian Strang integrator, conserving both Nj and energy approximately',
      'negative_Hessian_direction':'psi±=phi (1±eps sin(pi*x/L))/sqrt(1+eps² q), exact population preservation; analytical E(eps) rational from Fourier kinetic and contact terms',
      'per_grid':tests,'g12_2_miscible_control_N40':miscible,
      'initial_source_Hopf_degree_abs_analytic':degree,'Hopf_seed_and_core_filling':hopf,
      'limitations':{
        'full_constrained_BdG_spectrum_computed':False,
        'global_two_species_GP_ground_state_proved':False,
        'stable_Hopf_soliton_found':False,
        'topology_change_after_Hopf_relax_certified':False,
        'periodic_boundary_density_exactly_zero':False,
        'stronger_g12_stable_skyrmion_established':False,
        'original_48_Majorana_BFSS_Fock_coupling':False,
        'source_SU2_BFSS_gauge_action_used':False,
        'native_Lean_CI_launched':False,
        'measured_particle_mass_or_proton_result':False}}
    OUT.write_text(json.dumps(evidence,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'status':'RHOPF_P8_CONSUMER_PASS','file':str(OUT),
       'grids':list(tests),'energy_mixed_vs_separated_40':
       [tests['40']['symmetric_mixed']['state']['E'],tests['40']['separated']['state']['E']],
       'symmetric_exact_negative_curvature_40':tests['40']['symmetric_mixed']['negative_exact_directional_curvature']['d2E_d_epsilon2'],
       'separated_positive_sampled_curvature_40':tests['40']['separated']['sampled_even_curvature'],
       'source_hopf_imprint_after_symmetry_break':hopf['40']['symmetry_broken_relax_E'],
       'unproven_stable_hopf':True},indent=2))

if __name__=='__main__':main()
