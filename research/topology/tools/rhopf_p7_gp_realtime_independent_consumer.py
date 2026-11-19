#!/usr/bin/env python3
"""RHOPF-P7 independent GP time-evolution controls and convergence docket.

Periodized 3D two-component GP approximation. Species numbers exactly preserved
by each Strang substep in exact arithmetic, energy only NEARLY conserved.
Stable integer winding at finite mesh is NOT certified by a noninteger numerical
spectral estimate. A stronger g12 is an immiscibility-PARAMETER control, NOT
an independently prepared stable phase-separated skyrmion. No BFSS time flow.

Repro: OPENBLAS_NUM_THREADS=1 python rhopf_p7_gp_realtime_independent_consumer.py
Default runs 40^3,48^3,64^3; --full additionally runs 80^3 (expensive).
"""
import argparse
import json
import math
from pathlib import Path
import numpy as np
from rhopf_p6_gp_dynamics_core import exact_source_gamma_restriction, source_hopf_profile
from rhopf_p7_gp_realtime_core import setup, gp_energy, strang_step, run_case

HERE=Path(__file__).resolve().parent
OUTPUT=HERE.parent/'data'/'RHOPF_P7_GP_REALTIME_CONSERVATION_AND_SPATIAL_CONVERGENCE_2026_11_18.json'
SOURCE_GAMMA='b9b8192055c70f0d001d7982669b9823c55562ed'


def gamma_crosscheck():
    p,s=exact_source_gamma_restriction()
    (a,b),(dx,k3,k2,xyz,r)=setup(N=40,L=6.,R=2.)
    pts=[(20,20,20),(25,20,21),(18,23,19),(30,30,30)]
    for pt in pts:
        z1,z2=complex(a[pt]),complex(b[pt])
        v=[0.]*16
        v[0],v[1],v[8],v[9]=z1.real,z1.imag,z2.real,z2.imag
        Q=[sum(s[k][i]*v[i]*v[p[k][i]] for i in range(16)) for k in range(9)]
        assert abs(Q[7]-2*(z1*z2.conjugate()).real)<1e-12
        assert abs(Q[0]+2*(z1*z2.conjugate()).imag)<1e-12
        assert abs(Q[8]-(abs(z1)**2-abs(z2)**2))<1e-12
        assert max(abs(Q[k]) for k in range(9) if k not in (0,7,8))<1e-12
    return {'source_gamma_blob':SOURCE_GAMMA,'source_samples':len(pts),
            'original_spinor_coords':[0,1,8,9], 'source_Q_coords':[0,7,8]}


def stationary_vacuum_check():
    N=24;L=6.;dx=2*L/N
    a=np.zeros((N,N,N),dtype=np.complex128)
    b=np.ones_like(a)
    k=2*np.pi*np.fft.fftfreq(N,d=dx)
    kk=np.meshgrid(k,k,k,indexing='ij')
    k2=sum(x*x for x in kk)
    for g12 in (2.,3.5):
        energy=gp_energy(a,b,dx,k2,g12=g12)
        assert abs(energy['energy'])<1e-10
        aa,bb=a.copy(),b.copy()
        for _ in range(20):aa,bb=strang_step(aa,bb,.01,k2,g12=g12)
        assert np.max(np.abs(aa))<1e-12
        assert np.max(np.abs(bb-1))<1e-12
    return {'stationary_uniform_vacuum_verified':True,'g12_controls':[2.,3.5],
            'time_steps_per_control':20,'boundary_condition':'periodic'}


def control_dynamics(full=False):
    selected={}
    grids=(40,48,64,80) if full else (40,48,64)
    for N in grids:
        for g12 in (2.,3.5):
            result=run_case(N=N,L=6.,dt=.003,t_end=.36,g12=g12,output_every=60)
            d=result['diagnostics']
            assert len(d)==3 and all(abs(p['t']-t)<1e-12 for p,t in zip(d,(0,.18,.36)))
            assert all(abs(p['relative_N1_error'])<3e-12 for p in d)
            assert all(abs(p['relative_N2_error'])<3e-12 for p in d)
            assert all(abs(p['relative_energy_error'])<2e-5 for p in d)
            assert all(math.isfinite(p['energy']) and p['min_density']>0 for p in d)
            assert abs(d[0]['signed_S3_degree_approx']+1)<1e-3
            assert d[-1]['periodic_face_deviation_from_vacuum']<.01
            selected[f'N{N}_g12_{g12}']=result
    for N in grids:
        x=selected[f'N{N}_g12_2.0']['diagnostics']
        y=selected[f'N{N}_g12_3.5']['diagnostics']
        assert abs(y[0]['energy']-x[0]['energy']-1.5*x[0]['overlap'])<1e-8
        assert y[-1]['overlap']<x[-1]['overlap']
        assert abs(y[0]['N1']-x[0]['N1'])<1e-9
        assert abs(y[0]['N2']-x[0]['N2'])<1e-9
    # At early 0.18 there is clear winding convergence; later diagnostics
    # MUST NOT be promoted as a topology change on insufficient resolution.
    w={N:abs(selected[f'N{N}_g12_2.0']['diagnostics'][-1]['signed_S3_degree_approx']+1)
       for N in grids}
    assert all(w[grids[i+1]]<w[grids[i]] for i in range(len(grids)-1))
    assert w[grids[-1]]>.001  # still visibly unresolved at 0.36
    assert abs(selected[f"N{grids[-1]}_g12_2.0"]['diagnostics'][1]['signed_S3_degree_approx']+1)<.002
    return selected,w


def time_step_check():
    # Direct refinement on same 48^3 spatial grid and same immiscibility control.
    coarse=run_case(N=48,L=6.,dt=.003,t_end=.36,g12=3.5,output_every=120)
    fine=run_case(N=48,L=6.,dt=.0015,t_end=.36,g12=3.5,output_every=240)
    c,f=coarse['diagnostics'][-1],fine['diagnostics'][-1]
    assert abs(f['relative_energy_error'])<abs(c['relative_energy_error'])
    assert abs(f['overlap']-c['overlap'])<1e-4
    assert abs(f['min_density']-c['min_density'])<1e-4
    return {'coarse_dt':.003,'fine_dt':.0015,
        'coarse_energy_relative_error':c['relative_energy_error'],
        'fine_energy_relative_error':f['relative_energy_error'],
        'coarse_overlap':c['overlap'],'fine_overlap':f['overlap'],
        'coarse_density_min_grid':c['min_density'],
        'fine_density_min_grid':f['min_density']}


def main():
    cli=argparse.ArgumentParser()
    cli.add_argument("--full",action="store_true",help="Include expensive 80 cubed grid in addition to base suite")
    args=cli.parse_args()
    cross=gamma_crosscheck()
    vacuum=stationary_vacuum_check()
    controls,werr=control_dynamics(full=args.full)
    timerefine=time_step_check()
    largest=80 if args.full else 64
    base=controls[f'N{largest}_g12_2.0']['diagnostics'][-1]
    phase=controls[f'N{largest}_g12_3.5']['diagnostics'][-1]
    result={
      'schema':'RHOPF_P7_TIME_DEPENDENT_GP_CONVERGENCE/0.1',
      'date':'2026-11-18',
      'conclusion':'NUMERICAL_GP_EVOLUTION_CONSERVES_TWO_SPECIES_AND_NEARLY_ENERGY; IMMISCIBLE_PARAMETER_LOWERS_OVERLAP; NO_RESOLVED_TOPOLOGICAL_JUMP',
      'source':cross,'stationary_positive_numerical_control':vacuum,
      'model':'3D periodized two-component GP, g11=g22=2, compare g12=2 and 3.5; dimensionless; not BFSS Hamiltonian',
      'equations':'i dt psi_j=-0.5 Laplacian psi_j+[2(n-1)+(g12-2)*n_other]psi_j; no Rabi',
      'hamiltonian':'E=0.5 sum_j integral|grad psi_j|²+integral(n-1)²+(g12-2)integral n1*n2',
      'domain':'periodic cube [-6,6)^3 (T3), not exact fixed-Dirichlet or R3',
      'integrator':'FFT Strang half kinetic / pointwise nonlinear / half kinetic; exact N_j in arithmetic, energy approximately',
      'parameters':{'N':([40,48,64,80] if args.full else [40,48,64]),'L':6,'profile_radius':2,'dt':.003,'time_end':.36,'record_t':[0,.18,.36]},
      'cases':controls,'time_step_refinement':timerefine,
      'largest_grid_t_end_comparison':{'N':largest,
        'equal_coupling_overlap':base['overlap'],
        'immiscible_parameter_overlap':phase['overlap'],
        'overlap_reduction_absolute':base['overlap']-phase['overlap'],
        'overlap_reduction_fraction':(base['overlap']-phase['overlap'])/base['overlap'],
        'equal_coupling_energy_drift_rel':base['relative_energy_error'],
        'immiscible_parameter_energy_drift_rel':phase['relative_energy_error'],
        'equal_coupling_winding_estimate':base['signed_S3_degree_approx'],
        'immiscible_parameter_winding_estimate':phase['signed_S3_degree_approx'],
        'equal_coupling_min_density_at_sampled_points':base['min_density'],
        'immiscible_parameter_min_density_at_sampled_points':phase['min_density']},
      'spatial_discretization_error_in_winding_t_end':{str(k):v for k,v in werr.items()},
      'limitations':{
         'original_BFSS_Fock48_coupling':False,
         'source_SU2_gauge_projection_applied':False,
         'physical_hopfion_local_minimizer':False,
         'reconnection_or_topological_change_resolved':False,
         'winding_discrepancy_at_t_end_fully_spatially_converged':False,
         'density_zero_between_grid_points_ruled_out':False,
         'is_numerical_time_integrator_exact_energy_conserving':False,
         'phase_separation_equilibrium_prepared':False,
         'actual_stable_trapped_skyrmion_control_completed':False,
         'native_Lean_CI_launched':False,
         'experimental_particle_prediction':False}}
    OUTPUT.write_text(json.dumps(result,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'status':'RHOPF_P7_INDEPENDENT_DYNAMICS_PASS',
        'output':str(OUTPUT),'largest_grid_t_end':result['largest_grid_t_end_comparison'],
        'spatial_degree_estimator_error':result['spatial_discretization_error_in_winding_t_end'],
        'time_step_refinement':timerefine,'limit_no_topological_transition_verified':True},indent=2))

if __name__=='__main__':main()
