#!/usr/bin/env python3
"""RHOPF-Q0: exact-source 2-complex-component Hopf texture and null sector.

The 16-vector source uses ONLY original BFSS gamma coordinates 0,1,8,9.
The 3D field is a chosen mathematical test field, NOT BFSS dynamics, an
actual proton, a Lorentzian metric, or a measured optical field.
"""
import cmath
import json
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
FIXTURE = HERE.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
ORIGINAL_SOURCE_SHA = 'b9b8192055c70f0d001d7982669b9823c55562ed'
SUBCARRIER = (0, 1, 8, 9)


def original_gamma_sign_permutation():
    j = json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert j.get('source_git_blob_sha',j.get('source_sha')) == ORIGINAL_SOURCE_SHA
    p, s = j['perm'], j['sign']
    assert len(p) == len(s) == 9 and all(len(a) == 16 for a in p+s)
    assert [k for k in range(9) if any(p[k][i] in SUBCARRIER for i in SUBCARRIER)] == [0,7,8]
    return p,s


def complex_spinor(x,y,z):
    r2=x*x+y*y+z*z
    D=1+r2
    return 2*complex(x,y)/D,complex(r2-1,2*z)/D


def original_gamma_Q(x,y,z,p=None,s=None):
    if p is None or s is None:p,s=original_gamma_sign_permutation()
    a,b=complex_spinor(x,y,z)
    v=[0.]*16
    v[0],v[1],v[8],v[9]=a.real,a.imag,b.real,b.imag
    q=[sum(s[k][i]*v[i]*v[p[k][i]] for i in range(16)) for k in range(9)]
    return q


def spinor_phase_components(x,y,z):
    z1,z2=complex_spinor(x,y,z)
    return z1,z2


def spatial_null_polynomial(x,y,z):
    rho2=x*x+y*y
    r2=rho2+z*z
    return (1+r2)**2-8*rho2


def torus_equation_residual(x,y,z):
    rho=math.hypot(x,y)
    return (rho-math.sqrt(2))**2+z*z-1


def wind(values):
    """Winding around a nonzero closed complex phase loop; no physical current."""
    assert len(values)>=4 and min(map(abs,values))>1e-12
    return sum(cmath.phase(values[(i+1)%len(values)]/values[i])
               for i in range(len(values)))/(2*math.pi)


def closed_fiber_circle_north(t):
    """z2=0, the unit circle in the equatorial plane."""
    return math.cos(t), math.sin(t), 0.


def closed_fiber_circle_equator(t):
    """z1=z2 (Hopf target n=(+1,0,0)): disjoint finite circle."""
    return 1+math.sqrt(2)*math.cos(t), math.sin(t), math.sin(t)


def schwarzschild_consistency(r_m,m_p_kg=1.67262192595e-27,
                             G=6.67430e-11,c=299792458):
    """Dimensional consistency only, not a proton model or QCD fit."""
    assert r_m>0 and m_p_kg>0
    r_s=2*G*m_p_kg/(c*c)
    required_mass=r_m*c*c/(2*G)
    return {'radius_input_m':r_m,'observed_proton_mass_kg':m_p_kg,
            'Schwarzschild_radius_of_observed_proton_mass_m':r_s,
            'mass_required_for_radius_to_be_horizon_kg':required_mass,
            'required_to_observed_mass_ratio':required_mass/m_p_kg}
