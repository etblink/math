#!/usr/bin/env python3
"""RHOPF-P5 independent source/topology/circulation/helicity and escape controls.

Uses exact rational/symbolic mathematics plus independently integrated
numerical checks. No physical fluid velocity or BFSS Fock realization claimed.
"""
import cmath
import json
import math
from pathlib import Path
import sympy as sp
from rhopf_p5_kelvin_hopf_core import (
    SOURCE_SHA,SUBSPACE,gamma_source,spinor,original_source_Q,
    hopf_berry_A,hopf_curvature_B,helicity_density,axis_loop_A_circulation,
    projected_doublet_norm_sq,based_extended_escape,kelvin_theorem_contract)


def run():
    p,s=gamma_source()
    # Independent original gamma crosswalk: complex first Hopf coordinates.
    for xyz in ((0,0,0),(1,0,0),(.3,-.8,1.7),(2,3,-1),(0,0,8)):
        z1,z2=spinor(*xyz)
        q=original_source_Q(*xyz,p,s)
        assert abs(abs(z1)**2+abs(z2)**2-1)<1e-12
        assert abs(q[8]-(abs(z1)**2-abs(z2)**2))<1e-12
        assert abs(q[7]-2*(z1*z2.conjugate()).real)<1e-12
        assert abs(q[0]+2*(z1*z2.conjugate()).imag)<1e-12
        assert max(abs(q[k]) for k in range(9) if k not in (0,7,8))<1e-13
    x,y,z=sp.symbols('x y z', real=True)
    coords=(x,y,z)
    r2=x*x+y*y+z*z
    d=1+r2
    z1=2*(x+sp.I*y)/d
    z2=(r2-1+2*sp.I*z)/d
    assert sp.simplify(sp.conjugate(z1)*z1+sp.conjugate(z2)*z2-1)==0
    # Independent symbolic differentiation of the Berry U(1) connection.
    A=[sp.factor(sp.im(sp.conjugate(z1)*sp.diff(z1,t)+sp.conjugate(z2)*sp.diff(z2,t))) for t in coords]
    B=[sp.factor(sp.diff(A[(i+2)%3],coords[(i+1)%3])-sp.diff(A[(i+1)%3],coords[(i+2)%3])) for i in range(3)]
    h=sp.factor(sum(A[i]*B[i] for i in range(3)))
    assert sp.simplify(h+16/d**3)==0
    for xyz in ((0,0,0),(.3,.5,2.),(-1,2,-.4)):
        vals={t:v for t,v in zip(coords,xyz)}
        for i in range(3):
            assert abs(float(A[i].subs(vals))-hopf_berry_A(*xyz)[i])<1e-11
            assert abs(float(B[i].subs(vals))-hopf_curvature_B(*xyz)[i])<1e-11
        assert abs(float(h.subs(vals))-helicity_density(*xyz))<1e-11
    t=sp.symbols('t',positive=True)
    radial=sp.integrate(t*t/(1+t*t)**3,(t,0,sp.oo))
    assert sp.simplify(radial-sp.pi/16)==0
    integral=sp.simplify(4*sp.pi*(-16)*radial)
    assert integral==-4*sp.pi**2
    cs=sp.simplify(integral/(4*sp.pi**2))
    assert cs==-1
    # Component phase winding is +1, but the Berry circulation shrinks to zero.
    winding=[]
    for R in (.4,.1,.01):
        N=256
        vals=[spinor(R*math.cos(2*math.pi*j/N),R*math.sin(2*math.pi*j/N),0)[0] for j in range(N)]
        phase=sum(cmath.phase(vals[(j+1)%N]/vals[j]) for j in range(N))/(2*math.pi)
        assert abs(phase-1)<1e-12
        # Source A around the very same loop has a continuous, nonquantized integral.
        berry=axis_loop_A_circulation(R)
        assert berry>0 and berry<2*math.pi
        winding.append({'radius':R,'component_z1_phase_winding':phase,
                        'smooth_Berry_A_circulation':berry})
    assert winding[-1]['smooth_Berry_A_circulation']<.003
    # Independent gauge rephasing: derive transformed A from original spinor.
    chi=1/d
    gz1,gz2=sp.exp(sp.I*chi)*z1,sp.exp(sp.I*chi)*z2
    for i in range(3):
        transformed=sp.simplify(sp.im(sp.conjugate(gz1)*sp.diff(gz1,coords[i])
                                     +sp.conjugate(gz2)*sp.diff(gz2,coords[i])))
        assert sp.simplify(transformed-A[i]-sp.diff(chi,coords[i]))==0
    # ∫dχ·B =0 with decay at infinity, by div(B)=0 (exactly checked).
    assert sp.simplify(sum(sp.diff(B[i],coords[i]) for i in range(3)))==0
    # Based S15 escape preserves TOTAL norm while projected C2 field hits zero.
    # At spatial origin z1=0,z2=-1 -> phi=-e8, base phi_inf=e8.
    phi=[0.]*16
    phi[8]=-1.
    for angle in (0,math.pi/8,math.pi/4,3*math.pi/8,math.pi/2):
        after=based_extended_escape(phi,angle)
        assert abs(sum(v*v for v in after)-1)<1e-12
        if angle==math.pi/4:
            assert projected_doublet_norm_sq(after)<1e-26
            assert abs(after[2]-1)<1e-12
    base=[0.]*16;base[8]=1.
    for angle in (0,.3,math.pi/4,math.pi/2):
        assert all(abs(a-b)<1e-12 for a,b in zip(based_extended_escape(base,angle),base))
    # Independent one-mode Fock CAR witness (not original BFSS source):
    # occupation-number U(1) does not leave an odd Majorana invariant.
    a=sp.Matrix([[0,1],[0,0]])
    ad=a.T
    n=ad*a
    majorana=a+ad
    parity=sp.diag(1,-1)
    assert n*majorana-majorana*n == ad-a
    assert n*majorana-majorana*n != sp.zeros(2)
    assert parity*majorana*parity == -majorana
    contract=kelvin_theorem_contract()
    assert contract['hopf_connection_not_euler_velocity']
    assert contract['BFSS_0plus1_gauge_not_euler_fluid']
    result={
      'status':'LOCAL_SYMBOLIC_KELVIN_HOPF_CONSUMER_PASS_NO_PHYSICAL_VORTEX',
      'source_gamma_blob':SOURCE_SHA,
      'exact_berry_connection':list(map(str,A)),
      'exact_berry_curvature':list(map(str,B)),
      'exact_helicity_density':str(h),
      'R3_integral_A_dot_curl_A':str(integral),
      'Hopf_CS_normalized_value':int(cs),
      'component_vs_smooth_connection_circulations':winding,
      'global_phase_gauge_invariance_conditional_boundary':True,
      'based_S15_escape_projected_doublet_zero_with_total_norm_one':True,
      'Kelvin_Euler_hypotheses_supplied_for_actual_BFSS':False,
      'Gross_Pitaevskii_physical_model_built':False,
      'one_mode_Fock_majorana_odd_number_noninvariance_verified':True,
      'one_mode_Fock_parity_majorana_sign_verified':True,
      'original_Fock_state_energy_or_index_derived':False,
      'physical_atom_or_proton_predicted':False
    }
    print(json.dumps(result,indent=2))

if __name__=='__main__':run()
