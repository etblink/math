#!/usr/bin/env python3
"""Independent mathematical consumer and negative tests; NO real isotope NME.

Fixture rates and coefficients are synthetic, deliberately kept out of physics
scoring. This validates source/interface semantics, not empirical mechanisms.
"""
import cmath
import json
import math
from pathlib import Path
from sm_p0n9_two_isotope_core import (
    determinant, normalized_separation, noninterfering_rates,
    recover_if_identifiable, coherent_rates,
    coefficient_free_upper_limits_admit_zero,
)


def near(a, b):
    assert math.isclose(a, b, rel_tol=1e-12, abs_tol=1e-12), (a, b)


def run():
    path = Path(__file__).resolve().parent.parent / 'data' / 'SM_P0N9_TWO_ISOTOPE_IDENTIFIABILITY_2026_11_18.json'
    obj = json.loads(path.read_text(encoding='utf-8'))
    assert obj['status'] == 'ABSTRACT_IDENTIFIABILITY_ONLY_NO_EMPIRICAL_NME_FIT'
    assert obj['experimental']['nonzero_0nubb_signal_observed'] is False
    assert obj['experimental']['isotope_NME_matrices_with_correlated_uncertainties_loaded'] is False
    assert obj['mechanism']['noninterfering_assumption_required_for_2x2_inversion'] is True
    assert obj['mechanism']['coherent_scenario_rate_model_differs'] is True
    a = obj['synthetic_fixtures']['full_rank']
    Lx,Hx,Lg,Hg = a['coefficients']
    x,y = a['strengths']
    rates = noninterfering_rates(Lx,Hx,Lg,Hg,x,y)
    for observed, expected in zip(rates,a['rates']):near(observed,expected)
    x2,y2 = recover_if_identifiable(Lx,Hx,Lg,Hg,*rates)
    near(x,x2);near(y,y2)
    assert determinant(Lx,Hx,Lg,Hg) != 0
    assert normalized_separation(Lx,Hx,Lg,Hg) > 0
    # An exact proportional-ratio different physics mixture is unidentifiable.
    Lx,Hx,Lg,Hg = obj['synthetic_fixtures']['rank_deficient']['coefficients']
    assert determinant(Lx,Hx,Lg,Hg) == 0
    assert normalized_separation(Lx,Hx,Lg,Hg) == 0
    assert recover_if_identifiable(Lx,Hx,Lg,Hg,4.,2.) is None
    # Strong but nearly collinear NME vectors: inversion is ill-conditioned.
    e = obj['synthetic_fixtures']['almost_parallel']['epsilon']
    assert 0 < normalized_separation(1,1,1,1+e) < 1e-4
    # Two complex relative couplings give 3 physical real parameters modulo
    # overall phase. Two exact rates cannot generically fix all three.
    amp1 = (complex(1.,0.),complex(0.,1.))
    # Construct a distinct mechanism mixture with same two exact rates [2,5].
    x,y,z = 1.2,1.1,-0.3  # x=|A|²,y=|B|²,z=2Re(A conj(B))
    phase = math.acos(z/(2*math.sqrt(x*y)))
    amp2 = (math.sqrt(x),math.sqrt(y)*cmath.exp(1j*phase))
    for a,b in (amp1,amp2):
        r = coherent_rates(1,1,1,2,a,b)
        near(r[0],2.);near(r[1],5.)
    assert abs(abs(amp1[0])**2 - abs(amp2[0])**2)>0.1
    assert abs(abs(amp1[1])**2 - abs(amp2[1])**2)>0.05
    # Bounds from zero detections cannot establish any nonzero contribution.
    assert coefficient_free_upper_limits_admit_zero(1.0, 0.4)
    # Rate ratio could be mimicked by unknown, free isotope-specific NME ratio.
    # This is an explicitly synthetic nuisance fixture, not an observed NME.
    rate_xe=2.0;rate_ge=1.0
    Lx,Lg=2.0,1.0
    Hx,Hg=4.0,2.0
    near(rate_xe/rate_ge,Lx/Lg)
    near(rate_xe/rate_ge,Hx/Hg)
    print(json.dumps({'status':'LOCAL_INDEPENDENT_MATH_CONSUMER_PASS_NOT_EXPERIMENTAL_QUALIFICATION',
        'independent_exact_noninterfering_inverse_verified':True,
        'rank_deficient_nonidentifiability_verified':True,
        'near_collinearity_warning_verified':True,
        'coherent_two_rates_multiple_parameter_solutions_verified':True,
        'null_upper_limits_allow_zero':True,
        'nuclear_response_values_are_synthetic_only':True},indent=2))


if __name__=='__main__':run()
