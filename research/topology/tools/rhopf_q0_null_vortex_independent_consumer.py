#!/usr/bin/env python3
"""RHOPF-Q0 independent exact symbolic and linking consumer.

The chosen complex spinor in R3 is not a physically established vortex.
Phase winding is not a Maxwell/Poynting/current/circulation measurement.
"""
import json
import math
from pathlib import Path
import numpy as np
import sympy as sp
from rhopf_q0_null_vortex_core import (
    ORIGINAL_SOURCE_SHA, original_gamma_sign_permutation,original_gamma_Q,
    complex_spinor,spatial_null_polynomial,torus_equation_residual,
    wind,closed_fiber_circle_north,closed_fiber_circle_equator,
    schwarzschild_consistency)


def gauss_link(n=240):
    t=2*np.pi*np.arange(n)/n
    c1=np.array([closed_fiber_circle_north(x) for x in t])
    c2=np.array([closed_fiber_circle_equator(x) for x in t])
    d1=np.column_stack([-np.sin(t),np.cos(t),np.zeros_like(t)])
    d2=np.column_stack([-np.sqrt(2)*np.sin(t),np.cos(t),np.cos(t)])
    sep=c1[:,None,:]-c2[None,:,:]
    cross=np.cross(d1[:,None,:],d2[None,:,:])
    kernel=np.sum(sep*cross,axis=-1)/np.sum(sep*sep,axis=-1)**1.5
    return float(kernel.sum()*(2*np.pi/n)**2/(4*np.pi))


def run():
    p,s=original_gamma_sign_permutation()
    # Original source signs: Q7 = 2 Re(z1 conj z2), Q0 = -2 Im(...)
    # Q8 = |z1|²-|z2|². These assertions are independent from Q formula.
    points=[(0,0,0),(.2,.4,.7),(1,0,0),(0,0,3),(.7,-.3,1.2),(-4,2,-1)]
    for x,y,z in points:
        a,b=complex_spinor(x,y,z)
        Q=original_gamma_Q(x,y,z,p,s)
        assert abs(abs(a)**2+abs(b)**2-1)<1e-13
        assert abs(sum(t*t for t in Q)-1)<1e-12
        assert max(abs(Q[k]) for k in (1,2,3,4,5,6))<1e-14
        assert abs(Q[7]-2*(a*b.conjugate()).real)<1e-12
        assert abs(Q[0]+2*(a*b.conjugate()).imag)<1e-12
        assert abs(Q[8]-(abs(a)**2-abs(b)**2))<1e-12
    # Independent symbolic proof: source null=0 iff ring torus.
    x,y,z=sp.symbols('x y z',real=True)
    R2=x*x+y*y+z*z
    z1=2*(x+sp.I*y)/(1+R2)
    z2=(R2-1+2*sp.I*z)/(1+R2)
    q8=sp.expand_complex(z1*sp.conjugate(z1)-z2*sp.conjugate(z2))
    rho2=x*x+y*y
    assert sp.simplify(q8-(8*rho2-(1+R2)**2)/(1+R2)**2)==0
    # Let rho >= 0, second factor is strictly positive; first defines torus.
    rho=sp.symbols('rho',real=True,nonnegative=True)
    factor=(1+rho*rho+z*z-2*sp.sqrt(2)*rho)*(1+rho*rho+z*z+2*sp.sqrt(2)*rho)
    assert sp.expand(factor-((1+rho*rho+z*z)**2-8*rho*rho))==0
    assert sp.expand(1+rho*rho+z*z-2*sp.sqrt(2)*rho-((rho-sp.sqrt(2))**2+z*z-1))==0
    # Two exact Hopf fibers: z2=0 and z1=z2, with target n north vs equator.
    for t in np.linspace(0,2*np.pi,51):
        a,b=complex_spinor(*closed_fiber_circle_north(float(t)))
        assert abs(b)<1e-12
        a,b=complex_spinor(*closed_fiber_circle_equator(float(t)))
        assert abs(a-b)<1e-12
    # Components' phase vortices: one on z axis, one on equatorial circle.
    ang=2*np.pi*np.arange(360)/360
    w1=wind([complex_spinor(.4*math.cos(t),.4*math.sin(t),0)[0] for t in ang])
    w2=wind([complex_spinor(1+.15*math.cos(t),0,.15*math.sin(t))[1] for t in ang])
    assert abs(w1-1)<1e-12 and abs(w2-1)<1e-12
    # An explicitly CLOSED fiber pair in R3 gives unambiguous Gauss link.
    links=[gauss_link(n) for n in (80,160,320)]
    assert all(abs(L+1)<2e-11 for L in links)
    # Null set is not itself the vortex core; avoid conflating observables.
    assert torus_equation_residual(math.sqrt(2)+1,0,0)<1e-12
    assert abs(spatial_null_polynomial(1,0,0))>0
    charge_radius_schwarz=schwarzschild_consistency(0.84075e-15)
    source_radius_schwarz=schwarzschild_consistency(1.32e-15)
    assert 3e38<charge_radius_schwarz['required_to_observed_mass_ratio']<4e38
    assert 5e38<source_radius_schwarz['required_to_observed_mass_ratio']<6e38
    out={'status':'LOCAL_SOURCE_RESTRICTED_MATH_AND_ADVERSARIAL_PHYSICS_SCREEN_PASS',
      'original_BFSS_gamma_source_blob':ORIGINAL_SOURCE_SHA,
      'field_classification':'CONSTRUCTED_MATHEMATICAL_3D_COMPLEX_FIELD_NOT_SOURCE_BFSS_PHYSICAL_FIELD',
      'exact_source_Q_indices':[0,7,8],
      'source_quadratic_null_signature_on_R4':'(2,2)',
      'source_quadratic_null_signature_on_R16':'(8,8)',
      'compactified_complex_null_intersection':'S1 x S1 = Clifford T2',
      'spatial_null_surface':'(sqrt(x²+y²)-sqrt(2))²+z²=1',
      'spatial_null_surface_topology':'embedded ring torus T2',
      'fiber_1':'z2=0 => radius1 equatorial circle',
      'fiber_2':'z1=z2 => (1+sqrt2 cos(t),sin(t),sin(t))',
      'gauss_linking_number_fiber_pair':links[-1],
      'convergence_three_resolutions':links,
      'complex_phase_vortex_winding_z1_axis':w1,
      'complex_phase_vortex_winding_z2_ring':w2,
      'schwarzschild_proton_charge_radius_consistency':charge_radius_schwarz,
      'schwarzschild_proton_2010_assumed_radius_consistency':source_radius_schwarz,
      'qualifications':{'actual_proton_black_hole_supported':False,
        'proton_charge_radius_is_event_horizon':False,
        'BFSS_original_48_Majorana_Fock_coupling_used':False,
        'physical_Maxwell_or_fluid_circulation_computed':False,
        'Hopf_link_and_vortex_phase_winding_MATH':True,
        'torus_null_surface_QUADRATIC_SOURCE':True,
        'original_BFSS_source_Hamiltonian_physical_vortex':False,
        'native_Lean_CI_passed':False}}
    print(json.dumps(out,indent=2))
    return out

if __name__=='__main__':run()
