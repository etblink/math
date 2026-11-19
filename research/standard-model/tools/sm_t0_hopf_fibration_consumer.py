#!/usr/bin/env python3
"""Independent finite algebra/negative controls for a Hopf-spinor ANALOG.

This is not Mark Dennis' Maxwell-field apparatus, not experimental Skyrme
charge integration, and not evidence for particle identity or stability.
"""
import cmath
import json
import math
from pathlib import Path


def normalized_spinor(x,y,z):
    r2=x*x+y*y+z*z
    return (2*complex(x,y)/(1+r2),complex(r2-1,2*z)/(1+r2))


def poincare(z1,z2):
    u=z1*z2.conjugate()
    return (2*u.real,2*u.imag,abs(z1)**2-abs(z2)**2)


def close(a,b,tol=2e-12):
    assert abs(a-b) < tol,(a,b)


def run():
    path=Path(__file__).resolve().parent.parent/'data'/'SM_T0_DENNIS_HOPF_MATH_BRIDGE_2026_11_18.json'
    d=json.loads(path.read_text(encoding='utf-8'))
    assert d['physical_scope']['optical_field_measurement_reproduced'] is False
    assert d['physical_scope']['elementary_particle_identification'] is False
    assert d['physical_scope']['stability_energy_derived'] is False
    for x,y,z in ((0,0,0),(1,0,0),(0.2,-0.4,1.7),(-2,5,0.1),(100,70,-200)):
        a,b=normalized_spinor(x,y,z)
        close(abs(a)**2+abs(b)**2,1.)
        n=poincare(a,b)
        close(sum(t*t for t in n),1.)
        for phi in (0.1,0.9,-2.3):
            phase=cmath.exp(1j*phi)
            n2=poincare(phase*a,phase*b)
            for i in range(3):close(n[i],n2[i])
    # North-pole fiber: z2=0 => z=0,r²=1; sample equator circle.
    for phi in (0,0.5,1.7,3.):
        a,b=normalized_spinor(math.cos(phi),math.sin(phi),0)
        close(abs(b),0.)
        close(poincare(a,b)[2],1.)
    # South-pole fiber: z1=0 => x=y=0, all z, plus compactification point.
    for z in (-9,0,0.6,10):
        a,b=normalized_spinor(0,0,z)
        close(abs(a),0.)
        close(poincare(a,b)[2],-1.)
    # Boundary limit of R³ one-point compactification: Psi -> (0,1).
    for x,y,z in ((1e6,0,0),(0,-1e6,0),(0,0,1e6)):
        a,b=normalized_spinor(x,y,z)
        assert abs(a)<3e-6 and abs(b-1)<3e-6
    # A physically permitted raw optical amplitude may vanish at an isolated
    # point; global normalized spinor/degree cannot then be assigned without
    # repairing or excluding that zero and checking new boundary assumptions.
    raw_zero=(0j,0j)
    assert abs(raw_zero[0])**2+abs(raw_zero[1])**2==0
    # A field whose normalized state keeps oscillating at infinity has no
    # unique constant compactification boundary.
    def badly_bounded(x):
        return (cmath.exp(1j*x)/math.sqrt(2),1/math.sqrt(2))
    assert abs(badly_bounded(1e6)[0]-badly_bounded(1e6+math.pi)[0])>1.0
    print(json.dumps({'status':'LOCAL_HOPF_SPINOR_ALGEBRA_CONSUMER_PASS_ONLY',
        'normalized_two_component_spinor_S3_identity':True,
        'Poincare_S2_identity':True,
        'common_phase_quotient_invariance':True,
        'analytic_north_pole_preimage_equatorial_circle':True,
        'analytic_south_pole_preimage_compactified_z_axis':True,
        'negative_zero_field_invalidates_normalization':True,
        'negative_nonconstant_boundary_blocks_compactification':True,
        'integer_Hopf_invariant_numerically_integrated':False,
        'Maxwell_solution_or_particle_stability_qualified':False},indent=2))


if __name__=='__main__':run()
