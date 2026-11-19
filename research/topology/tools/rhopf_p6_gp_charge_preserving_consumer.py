#!/usr/bin/env python3
"""Independent P6 source-tied GP vs strict Faddeev-Skyrme comparison.

Proves finite-energy fixed-boundary, N1/N2-preserving CONFIGURATION
path through a density zero, not a solution of Hamiltonian GP time dynamics.
The explicit condensate is invented and is NOT the original BFSS Fock model.
"""
import json
import math
from pathlib import Path
import numpy as np
from scipy.integrate import quad
from rhopf_p6_gp_dynamics_core import (
    GAMMA_SOURCE_BLOB,exact_source_gamma_restriction,make_mesh,integrate3,
    source_hopf_profile,source_hopf_target,field_grad_energy,
    noether_populations,charge_preserving_path,faddeev_skyrme_base,
    profile_degree_magnitude)

HERE=Path(__file__).resolve().parent
OUT=HERE.parent/'data'/'RHOPF_P6_GP_CHARGE_FIXED_TOPOLOGICAL_ESCAPE_2026_11_18.json'
R=2.0


def analytic_radial_integrals():
    """Independent analytic angular integration of 3D field's kinetic energy & N1."""
    def f(r):
        u=r/R
        return math.pi*(1-6*u**5+15*u**4-10*u**3)
    def fp(r):
        u=r/R
        return -30*math.pi/R*u*u*(1-u)**2
    kin=2*math.pi*quad(lambda r:r*r*fp(r)**2+2*math.sin(f(r))**2,0,R,epsabs=1e-11)[0]
    n1=8*math.pi/3*quad(lambda r:r*r*math.sin(f(r))**2,0,R,epsabs=1e-11)[0]
    degree=-(2/math.pi)*quad(lambda r:math.sin(f(r))**2*fp(r),0,R,epsabs=1e-11)[0]
    return {'KineticGP_analytic_infinite_space':kin,'N1_exact_radial_infinite_space':n1,
            'degree_magnitude_from_profile_endpoints':degree}


def noether_rabi_control():
    """Check bosonic species charges vs interspecies conversion and total charge.

    Single-boson sector basis |1,0>, |0,1> of TWO-SPECIES BOSONIC FOCK;
    this is not the original 48-Majorana fermionic BFSS Fock carrier.
    """
    N1=np.diag([1,0]);N2=np.diag([0,1]);H=np.array([[0,1],[1,0]])
    K=N1@H-H@N1
    assert np.array_equal(K,np.array([[0,1],[-1,0]]))
    assert np.array_equal((N1+N2)@H-H@(N1+N2),np.zeros((2,2)))
    # Local two-component field Noether/Rabi exchange test, omega=1.
    a=1+2j;b=3+1j
    da=-1j*b;db=-1j*a
    dn1=2*(a.conjugate()*da).real
    dn2=2*(b.conjugate()*db).real
    assert abs(dn1-2*(a.conjugate()*b).imag)<1e-14
    assert abs(dn2+dn1)<1e-14
    return {'two_boson_species_single_particle_sector':True,
            'H_rabi_conversion_commutator_N1':K.tolist(),
            'H_rabi_commutator_total_number_zero':True,
            'finite_complex_amplitude_population_transfer':{'dN1':dn1,'dN2':dn2},
            'not_fermionic_BFSS_Fock':True}


def source_gamma_check(psi1,psi2,p,s):
    """Independent direct original signed-gamma output checks for selected sample points."""
    rng=np.random.default_rng(20261118)
    for _ in range(24):
        i=tuple(int(x) for x in rng.integers(0,psi1.shape[0],size=3))
        u,v=complex(psi1[i]),complex(psi2[i])
        z=[0.]*16
        z[0],z[1],z[8],z[9]=u.real,u.imag,v.real,v.imag
        q=[sum(s[k][i0]*z[i0]*z[p[k][i0]] for i0 in range(16)) for k in range(9)]
        assert abs(q[7]-2*(u*v.conjugate()).real)<5e-13
        assert abs(q[0]+2*(u*v.conjugate()).imag)<5e-13
        assert abs(q[8]-(abs(u)**2-abs(v)**2))<5e-13
        assert max(abs(q[k]) for k in range(9) if k not in (0,7,8))<5e-13


def run():
    p,s=exact_source_gamma_restriction()
    radial=analytic_radial_integrals()
    degree,err=profile_degree_magnitude(R)
    assert abs(degree-1)<1e-11 and abs(radial['degree_magnitude_from_profile_endpoints']-degree)<1e-12
    test_grids={}
    for N in (25,41,57):
        coords,dx=make_mesh(N=N)
        psi1,psi2,r=source_hopf_profile(*coords,R=R)
        assert abs(integrate3(np.ones_like(r),dx)-125)<1e-12
        n=noether_populations(psi1,psi2,dx)
        assert abs(sum(n)-125)<1e-10
        assert abs(n[0]-radial['N1_exact_radial_infinite_space'])<1e-5
        initial_E=field_grad_energy(psi1,psi2,dx)
        assert abs(initial_E['kinetic']/radial['KineticGP_analytic_infinite_space']-1)<.11
        source_gamma_check(psi1,psi2,p,s)
        times=np.linspace(0,1,9)
        sampled=[]
        B=2.5
        # Exact Dirichlet boundary is enforced throughout (r>2.35 support of compensator)
        boundary=(r>=2.4)
        original_populations=noether_populations(psi1,psi2,dx)
        origin=(N//2,N//2,N//2)
        assert abs(psi1[origin])<1e-13 and abs(psi2[origin]+1)<1e-13
        for t in times:
            a,b,lam=charge_preserving_path(psi1,psi2,r,dx,float(t))
            measured=noether_populations(a,b,dx)
            assert np.max(np.abs(measured-original_populations))<5e-10
            assert np.max(np.abs(a[boundary]))<1e-13
            assert np.max(np.abs(b[boundary]-1))<1e-13
            E=field_grad_energy(a,b,dx)
            assert math.isfinite(E['total']) and E['total']>=0
            assert abs(a[origin])<1e-13
            assert abs(b[origin]-(2*t-1))<1e-12
            if abs(t-.5)<1e-12:
                assert abs(a[origin])<1e-13 and abs(b[origin])<1e-13
            if t==1:
                assert float(np.min(b.real))>0 and float(np.max(np.abs(b.imag)))<1e-12
                # With b positive real everywhere, normalized spinor is in
                # an open hemisphere of S3; its degree is zero.
            sampled.append({'t':float(t),'charge_compensator_lambda':lam,
                'N1':float(measured[0]),'N2':float(measured[1]),
                'minimum_total_density':E['min_density'],'GP_kinetic':E['kinetic'],
                'GP_density_potential':E['density_potential'],
                'GP_total_energy':E['total']})
        # Decreasing energy along THIS chosen fixed-charge configuration path;
        # NOT a GP time trajectory and not an energy-conserving dynamical solution.
        assert all(a['GP_total_energy']>b['GP_total_energy']
                   for a,b in zip(sampled,sampled[1:]))
        assert sampled[4]['minimum_total_density']==0.0
        test_grids[str(N)]={'N':N,'dx':dx,'GP_initial_energy':initial_E,
            'population_N1':float(n[0]),'population_N2':float(n[1]),
            'charge_conserving_path':sampled,'energy_strictly_decreases_in_sampled_steps':True,
            'all_comparison_fields_keep_exact_Dirichlet_boundary':True,
            'both_component_populations_equal_original_to_5e-10':True}
    # Strict S2 Faddeev-Skyrme comparison needs the separate quartic derivative.
    mesh,dx=make_mesh(N=41)
    p1,p2,r=source_hopf_profile(*mesh,R=R)
    FS=faddeev_skyrme_base(p1,p2,dx)
    Lopt=math.sqrt(FS['E4_base']/FS['E2_base'])
    scales=[.25,.5,1.,Lopt,2.,4.]
    strict_fs=[{'scale':float(L),'quadratic':float(L*FS['E2_base']),
                'quartic':float(FS['E4_base']/L),
                'total':float(L*FS['E2_base']+FS['E4_base']/L)} for L in scales]
    assert all(x['quadratic']>0 and x['quartic']>0 for x in strict_fs)
    GP_scale=[{'scale':L,'E_gp_kinetic':L*radial['KineticGP_analytic_infinite_space'],
               'species1_population':L**3*radial['N1_exact_radial_infinite_space']}
              for L in (.25,.5,1.,2.)]
    # Derrick scaling: sigma-only E2(L) ->0 when L->0; F-S has E4/L barrier.
    assert FS['E2_base']>1 and FS['E4_base']>1 and Lopt>0
    assert min(x['total'] for x in strict_fs)>=2*math.sqrt(FS['E2_base']*FS['E4_base'])-1e-9
    noether=noether_rabi_control()
    results={
      'schema':'RHOPF_P6_GP_VS_SKYRME_CHARGE_ADMISSIBILITY/0.1',
      'date':'2026-11-18',
      'status':'LOCAL_SOURCE_PINNED_CONFIG_COMPARISON_PASS_NO_TIME_EVOLUTION_OR_PARTICLE',
      'original_BFSS_gamma_git_blob':GAMMA_SOURCE_BLOB,
      'mathematical_carrier':'S3 complex doublet in exact original BFSS gamma (0,1,8,9) sector',
      'physical_model_comparison':'independently specified symmetric 2-component GP and strict S2 Faddeev-Skyrme; NOT BFSS original dynamical equations',
      'GP_action':'E= integral [0.5 (|grad psi1|²+|grad psi2|²)+g/2 (|psi1|²+|psi2|²-1)²], g=2',
      'GP_evolution':'i dt psi_j = -0.5 Laplacian psi_j + g(n-1)psi_j, no Rabi conversion',
      'Noether':'individual N1,N2 conserved for actual GP solutions with suitable no-flux boundary; toy path holds Nj but NOT energy',
      'domain':'cube [-2.5,2.5]^3 with exact (psi1,psi2)=(0,1) Dirichlet boundary',
      'compact_profile_radius':R,
      'profile':'f(r)=pi*(1-(6u^5-15u^4+10u^3)), u=min(r/R,1); psi1=sin f*(x+i y)/r, psi2=cos f+i sin f*z/r',
      'analytic_radial':radial,
      'charge_preserving_path':'psi1(t,x)=psi1(0,x); psi2(t,x)=[(1-t)psi2(0,x)+t] exp(lambda(t) bump(r)); unique lambda selected to keep N2 fixed, bump(0)=0, bump(r>=2.35)=0',
      'based_density_zero_at_t_half':True,
      'at_t_1_normalized_spinor_degree_zero':'psi2(t=1) strictly positive real on cube, hence normalized map fits open hemisphere S3',
      'at_t_0_degree_abs':1,
      'initial_and_final_same_BFSS_gamma_source_coordinate_subspace':True,
      'all_tests_on_three_grids':test_grids,
      'strict_faddeev_skyrme':{'E2_at_scale1':FS['E2_base'],'E4_at_scale1':FS['E4_base'],
          'scale_law':'E2(L)=L*E2(1), E4(L)=E4(1)/L (in infinite R3)',
          'positive_scale_extremum':Lopt,
          'minimum_along_exact_uniform_scaling':2*math.sqrt(FS['E2_base']*FS['E4_base']),
          'samples':strict_fs,'is_global_soliton_minimizer_proved':False},
      'GP_uniform_scaling':{'exact_gradient_scaling':'Ekin(L)=L Ekin(1) ->0 as L->0',
          'species1_number_scaling':'N1(L)=L^3 N1(1), so uniform shrinkage is NOT an allowed path at fixed N1',
          'samples':GP_scale},
      'Noether_Rabi_control':noether,
      'hard_boundary_vs_topology':'Original normalized field degree 1, through total-density zero degree undefined, final normalized field degree0 while BOTH Nj and boundary are held fixed',
      'physical_limitations':{
        'GP_time_evolution_solved':False,'Hamiltonian_energy_shell_preserved_by_path':False,
        'trap_or_rotation_included':False,'GP_metastability_or_instability_proved_globally':False,
        'BFSS_original_48CAR_source_coupled':False,'BFSS_source_full_SU2_gauge_projected':False,
        'fermionic_index_calculated':False,'real_atom_proton_identified':False,
        'native_Lean_CI_launched':False},
      'source_literature':[
          'https://doi.org/10.1103/PhysRevLett.91.010403',
          'https://doi.org/10.1103/PhysRevLett.88.080401',
          'https://doi.org/10.1103/PhysRevA.111.013301',
          'https://doi.org/10.1007/s00220-021-04177-w',
          'https://doi.org/10.1103/PhysRevLett.86.3934'
      ]
    }
    OUT.write_text(json.dumps(results,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({'result':'PASS','out':str(OUT),
        'grid_refinements':list(test_grids),
        'initial_GP_E_N41':test_grids['41']['GP_initial_energy']['total'],
        'final_GP_E_N41':test_grids['41']['charge_conserving_path'][-1]['GP_total_energy'],
        'all_fixed_charges':True,'zero_density_at_t_half':True,
        'degree_abs_t0':1,'degree_t1':0,
        'FS_E2':FS['E2_base'],'FS_E4':FS['E4_base'],'FS_Lstar':Lopt,
        'physical_time_evolution':False},indent=2))

if __name__=='__main__':run()
