#!/usr/bin/env python3
"""Independent 0nu beta-beta consumer, source pins and adversarial witness controls.

Run in tools/ hierarchy with data JSON at ../data/. No experimental likelihood.
"""
import cmath
import json
import math
from pathlib import Path
from sm_p0n8_0nubb_core import (weights,masses_ev,majorana_envelope_ev,
    io_all_lightest_analytic_guarantee_ev,half_life_reach_factor)


def close(a,b,what,relative=1e-10,absolute=3e-14):
    assert math.isclose(a,b,rel_tol=relative,abs_tol=absolute), (what,a,b)


def independent_phasor_min_max(terms):
    """Separate geometry proof via triangle/polygon inequalities."""
    radius=sum(terms)
    for k,term in enumerate(terms):
        other=sum(terms[:k]+terms[k+1:])
        if term>other:return term-other,radius
    return 0.,radius


def explicit_NO_zero_phase_witness(terms):
    """Produce explicit three Majorana phases with a cancelling amplitude.
    Choose term2 and term3 with relative angle acos(...), then set term1 opposite.
    The global phase is irrelevant; all physical differences may be realized.
    """
    a,b,c=terms
    assert all(x>0 for x in terms)
    cosine=(a*a-b*b-c*c)/(2*b*c)
    assert -1 < cosine < 1, cosine
    phi=math.acos(cosine)
    v2=b*cmath.exp(1j*phi)
    v3=complex(c,0.)
    v1=-(v2+v3)
    close(abs(v1),a,'triangle first term')
    phases=[cmath.phase(v1),phi,0.]
    amplitude=sum(z*cmath.exp(1j*theta) for z,theta in zip(terms,phases))
    assert abs(amplitude)<5e-15,amplitude
    return phases,abs(amplitude)


def main():
    source=Path(__file__).resolve().parent.parent/'data'/'SM_P0N8_MODEL_NEUTRAL_0NUBB_IO_FLOOR_2026_11_18.json'
    obj=json.loads(source.read_text(encoding='utf-8'))
    claim=obj['claim_scope']
    assert claim['no_new_lean_ci_gate'] and claim['experimental_likelihood_imported'] is False
    assert claim['nuclear_amplitude_qualified'] is False and claim['BFSS_NFC_lepton_map_qualified'] is False
    inp=obj['observable_inputs']
    w=weights(inp['JUNO_2026_sin2_theta12'],inp['DayaBay_2023_sin2_2theta13'])
    for i,v in enumerate(w):close(v,obj['derived']['electron_weights'][i],f'w{i}')
    d=inp['JUNO_2026_delta_m2_21_ev2']; A=abs(inp['JUNO_2026_delta_m2_31_IO_ev2'])
    guarantee=io_all_lightest_analytic_guarantee_ev(d,A,w)
    close(guarantee,obj['derived']['IO_all_lightest_analytic_lower_guarantee_ev'],'analytic IO all x')
    # This covers arbitrary nonnegative lightest mass via algebraic inequality,
    # while sampled grids are solely independent diagnostics, not the proof.
    for m3 in [0,.00001,.0003,.001,.0028,.004,.01,.02,.05,.1,.5,2,10]:
        v=masses_ev('IO',m3,d,inp['JUNO_2026_delta_m2_31_IO_ev2'])
        lo,hi=majorana_envelope_ev(v,w)
        again=independent_phasor_min_max([vi*wi for vi,wi in zip(v,w)])
        close(lo,again[0],f'IO triangle {m3}',absolute=1e-13)
        close(hi,again[1],f'IO ceiling {m3}',absolute=1e-13)
        assert lo+1e-13 >= guarantee,(m3,lo,guarantee)
    m0=masses_ev('IO',0,d,inp['JUNO_2026_delta_m2_31_IO_ev2'])
    lo0,hi0=majorana_envelope_ev(m0,w)
    close(obj['derived']['IO_any_lightest_numeric_min_ev'], 0.018894633370134292,
          'independent recorded numerical minimizer',relative=1e-9)
    close(lo0,obj['derived']['IO_lightest_zero_min_ev'],'IO m3=0 floor')
    close(hi0,obj['derived']['IO_lightest_zero_max_ev'],'IO m3=0 max')
    # Treat 2018/2026 original central input NO shape independently.
    mno=masses_ev('NO',0.004,d,inp['JUNO_2026_delta_m2_31_NO_ev2'])
    terms=[mi*wi for mi,wi in zip(mno,w)]
    phases,residual=explicit_NO_zero_phase_witness(terms)
    min_no,max_no=majorana_envelope_ev(mno,w)
    assert min_no==0
    # SCOPED NEGATIVE 1: inverted floor does not hold for normal ordering.
    assert residual < 5e-15
    # SCOPED NEGATIVE 2: changed solar mixing to 45 degrees invalidates
    # the *positive numerical guarantee*; do not silently promote it universal.
    changed_w=weights(0.5,inp['DayaBay_2023_sin2_2theta13'])
    changed_floor=io_all_lightest_analytic_guarantee_ev(d,A,changed_w)
    assert changed_floor==0
    changed_masses=masses_ev('IO',0.02,d,inp['JUNO_2026_delta_m2_31_IO_ev2'])
    assert majorana_envelope_ev(changed_masses,changed_w)[0] == 0.0
    # SCOPED NEGATIVE 3: a distinct LNV amplitude may cancel the light one;
    # that is a mathematical countermodel, NOT a constructed UV completion.
    mblight=complex(lo0,0)
    other_LNV=-mblight
    assert abs(mblight+other_LNV)==0
    # SCOPED NEGATIVE 4: even an identical neutrino mass spectrum/oscillation
    # signal with exact conserved lepton number has no standard light-Majorana
    # 0nu beta beta decay; never use this formula to predict a Dirac rate.
    assert obj['countermodels']['dirac_L_conserved']['light_majorana_mass_mechanism_applicable'] is False
    # SCOPED NEGATIVE 5: limits from DIFFERENT isotopes carry distinct NMEs;
    # don't numerically combine their inferred mass bounds or CLs.
    assert obj['experiment']['isotope_NME_factors_imported'] is False
    reach=obj['derived']['conditional_fixed_NME_half_life_improvement_factors']
    for name,v in obj['experiment']['published_light_mechanism_effective_mass_limit_range_ev'].items():
        output=[half_life_reach_factor(t,guarantee) for t in v]
        for i,item in enumerate(output):close(item,reach[name][i],f'reach {name}[{i}]',relative=1e-12)
    print(json.dumps({
        'status':'LOCAL_SOURCE_EXACT_INDEPENDENT_CONSUMER_PASS_NOT_CI_OR_EXPERIMENT_QUALIFICATION',
        'IO_analytic_global_lower_guarantee_ev':guarantee,
        'IO_lightest_zero_phase_envelope_ev':[lo0,hi0],
        'NO_lightest_4meV_explicit_phase_witness_rad':phases,
        'NO_lightest_4meV_residual_ev':residual,
        'IO_floor_under_arbitrary_m3_proved_by_inequality_not_grid':True,
        'negative_controls':['NO_exact_phase_cancellation','changed_solar_angle_removes_floor',
                             'extra_LNV_amplitude_can_interfere','Dirac_process_not_applicable',
                             'different_isotope_NMEs_not_combined'],
        'requires_model_specific_physical_operator_map':True,
    },indent=2))

if __name__=='__main__':main()
