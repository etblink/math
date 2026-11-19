#!/usr/bin/env python3
"""SM-P0N7 independent consumer and negative controls (stdlib only).

Distinct PMNS direct-sum and analytic expanded-amplitude consumers test the
math layer on a physical 3-neutrino representation. No CI/theory acceptance.
"""
import cmath
import json
import math
from pathlib import Path
from sm_p0n7_clfv_core import (unitary_row_pair, gim_weighted_sum,
    light_only_br, conditional_br_envelope, centered_spectral_bound)


def pmns_rows(s12_sq, s13_sq, s23_sq, delta_rad):
    assert all(0 < x < 1 for x in (s12_sq, s13_sq, s23_sq))
    s12,c12=math.sqrt(s12_sq),math.sqrt(1-s12_sq)
    s13,c13=math.sqrt(s13_sq),math.sqrt(1-s13_sq)
    s23,c23=math.sqrt(s23_sq),math.sqrt(1-s23_sq)
    phase=cmath.exp(1j*delta_rad)
    e=[c12*c13,s12*c13,s13/phase]
    mu=[-s12*c23-c12*s23*s13*phase,
        c12*c23-s12*s23*s13*phase,
        s23*c13]
    unitary_row_pair(e,mu)
    return e,mu


def independently_expanded_amplitude(s12_sq,s13_sq,s23_sq,delta_rad,d21,d31):
    s12,c12=math.sqrt(s12_sq),math.sqrt(1-s12_sq)
    s13,c13=math.sqrt(s13_sq),math.sqrt(1-s13_sq)
    s23,c23=math.sqrt(s23_sq),math.sqrt(1-s23_sq)
    return c13*(s12*c12*c23*d21 + s13*s23*cmath.exp(1j*delta_rad)*(d31-s12_sq*d21))


def check(expected,actual,label,rtol=1e-12,atol=1e-64):
    assert math.isclose(expected,actual,rel_tol=rtol,abs_tol=atol),(label,expected,actual)


def main():
    path=Path(__file__).resolve().parent.parent/'data'/'SM_P0N7_CLFV_GIM_CROSS_CHANNEL_CONTROL_2026_11_18.json'
    v=json.loads(path.read_text(encoding='utf-8'))
    assert v['provenance']['joint_likelihood_imported'] is False
    assert v['model']['heavy_light_mixing_included'] is False
    assert v['decision']['statistical_significance_calculated'] is False
    alpha=v['conservative_inputs']['alpha_max']
    mw=v['conservative_inputs']['W_mass_lower_GeV']*1e9
    out={}
    theta13=(1-math.sqrt(1-v['source_inputs']['dayabay_sin2_2theta13']))/2
    for ordering,dm31 in v['source_inputs']['JUNO_2026_delta_m2_31_eV2'].items():
        masses=[0,v['source_inputs']['JUNO_2026_delta_m2_21_eV2'],dm31]
        bound=conditional_br_envelope(masses,mw,alpha)
        check(v['derived']['envelope'][ordering],bound,ordering,1e-12,1e-65)
        representative=[]
        for s23 in (.30,.50,.70):
            for phase in (0,math.pi/2,math.pi,1.23456789):
                e,mu=pmns_rows(v['source_inputs']['JUNO_2026_sin2_theta12'],theta13,s23,phase)
                A=gim_weighted_sum(masses,e,mu)
                direct=sum(ei.conjugate()*ui*d for ei,ui,d in zip(e,mu,masses))
                expanded=independently_expanded_amplitude(v['source_inputs']['JUNO_2026_sin2_theta12'],theta13,s23,phase,masses[1],masses[2])
                assert abs(A-direct)<1e-17 and abs(A-expanded)<1e-17
                assert abs(gim_weighted_sum(masses,e,mu,shift_eV2=17.25)-A)<1e-12
                assert abs(A)<centered_spectral_bound(masses)+1e-12
                representative.append(light_only_br(A,mw,alpha))
        assert max(representative)<=bound*(1+1e-12)
        out[ordering]={'conditional_envelope':bound,'fixture_sample_min':min(representative),'fixture_sample_max':max(representative),'MEGII_limit_over_envelope':v['experiment']['MEG_II_BR_limit_90CL']/bound}
    # Unitarity is essential; rejecting a physical-row mutation is intentional.
    e,mu=pmns_rows(.3036,theta13,.5,.4)
    mutated_mu=mu.copy(); mutated_mu[0]+=0.05
    rejected=False
    try: gim_weighted_sum([0,7.388e-5,2.509e-3],e,mutated_mu)
    except AssertionError: rejected=True
    assert rejected
    # Raw unphysical mutant no longer cancels a common mass shift.
    raw0=sum(x.conjugate()*y*z for x,y,z in zip(e,mutated_mu,[0,7.388e-5,2.509e-3]))
    raw1=sum(x.conjugate()*y*(z+20.0) for x,y,z in zip(e,mutated_mu,[0,7.388e-5,2.509e-3]))
    assert abs(raw1-raw0)>1e-4
    # Units mutation must not produce a plausible bound (80 GeV != 80 eV).
    wrong_mw=80.0
    units_rejected=False
    try: light_only_br(2.509e-3,wrong_mw,alpha)
    except AssertionError: units_rejected=True
    assert units_rejected
    print(json.dumps({'status':'LOCAL_RESEARCH_CONSUMER_PASS_NOT_FORMAL_OR_PHYSICAL_QUALIFICATION',
       'test_fixtures_are_not_measured_theta23_or_delta':True,
       'negative_control_unitarity_rejected':rejected,
       'mass_shift_invariance_checked':True,
       'unit_mismatch_guard_rejected_wrong_GeV_as_eV':units_rejected,
       'outputs':out},indent=2))

if __name__=='__main__':
    main()
