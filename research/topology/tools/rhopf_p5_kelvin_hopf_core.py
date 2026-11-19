#!/usr/bin/env python3
"""RHOPF-P5: source-exact Hopf connection and Kelvin-fluid hypothesis filter.

Research mathematics only. A Berry/Hopf one-form is NOT an Euler velocity,
Noether current, GP condensate, original BFSS Fock operator, or proton vortex.
"""
import json
import math
from pathlib import Path

HERE = Path(__file__).resolve().parent
FIXTURE = HERE.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
SOURCE_SHA = 'b9b8192055c70f0d001d7982669b9823c55562ed'
SUBSPACE = (0, 1, 8, 9)


def gamma_source():
    d=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert d.get('source_git_blob_sha',d.get('source_sha')) == SOURCE_SHA
    p,s=d['perm'],d['sign']
    assert len(p)==len(s)==9 and all(len(a)==16 for a in p+s)
    assert [k for k in range(9) if any(p[k][i] in SUBSPACE for i in SUBSPACE)]==[0,7,8]
    return p,s


def spinor(x,y,z):
    d=1+x*x+y*y+z*z
    return 2*complex(x,y)/d,complex(d-2,2*z)/d


def original_source_Q(x,y,z,p,s):
    a,b=spinor(x,y,z)
    v=[0.]*16
    v[0],v[1],v[8],v[9]=a.real,a.imag,b.real,b.imag
    return [sum(s[k][i]*v[i]*v[p[k][i]] for i in range(16)) for k in range(9)]


def hopf_berry_A(x,y,z):
    """A=Im(conj(z1)*dz1+conj(z2)*dz2) for the unit two-complex-component spinor."""
    d=1+x*x+y*y+z*z
    return ((-4*(x*z+y)/d**2), (4*(x-y*z)/d**2),
            (2*(x*x+y*y-z*z-1)/d**2))


def hopf_curvature_B(x,y,z):
    """B=curl A, closed-form exact rational identity."""
    d=1+x*x+y*y+z*z
    return (16*(x*z+y)/d**3,-16*(x-y*z)/d**3,
            -8*(x*x+y*y-z*z-1)/d**3)


def helicity_density(x,y,z):
    d=1+x*x+y*y+z*z
    return -16/d**3


def axis_loop_A_circulation(radius):
    """Integral A·dl around z=0, x=Rcosφ,y=Rsinφ. Goes to 0 at R→0."""
    return 8*math.pi*radius*radius/(1+radius*radius)**2


def projected_doublet_norm_sq(full):
    return sum(full[i]**2 for i in SUBSPACE)


def based_extended_escape(full,t,base_index=8,extra_index=2):
    """Unit S15 based escape; basepoint e8 (actual spinor at infinity)."""
    assert len(full)==16 and 0<=t<=math.pi/2
    assert base_index in SUBSPACE and extra_index not in SUBSPACE
    assert abs(sum(x*x for x in full)-1)<1e-12
    c,s=math.cos(t),math.sin(t)
    a=full[base_index]
    out=[c*x for x in full]
    out[base_index]=c*c*a+s*s
    out[extra_index]=s*c*(1-a)
    assert abs(sum(x*x for x in out)-1)<1e-12
    return out


def kelvin_theorem_contract():
    return {
      'hypotheses':['smooth regular material loop','inviscid Euler momentum equation',
        'barotropic pressure p=p(rho)','conservative body force','fluid velocity is the 1-form integrated'],
      'claim':'d/dt integral_{C(t)} v·dx = integral_C [-dp/rho - dPhi + d(|v|²/2)] = 0',
      'reconnection_exception':'Vortex zeros/singularities or nonideal forces violate required smooth material-flow hypotheses',
      'hopf_connection_not_euler_velocity':True,
      'BFSS_0plus1_gauge_not_euler_fluid':True
    }
