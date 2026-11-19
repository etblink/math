#!/usr/bin/env python3
"""Model-neutral 0nu beta-beta kinematics, strict light-3-Majorana mechanism ONLY.

Pure Python standard library, no experimental likelihood or nuclear isotope map.
Use separate independent consumer for alternative triangle and matrix checks.
"""
import math


def weights(sin2_theta12, sin2_2theta13):
    assert 0 < sin2_theta12 < 1 and 0 < sin2_2theta13 < 1
    s13sq = (1 - math.sqrt(1 - sin2_2theta13)) / 2  # physical small-reactor-angle branch
    c13sq = 1 - s13sq
    result = ((1 - sin2_theta12)*c13sq, sin2_theta12*c13sq, s13sq)
    assert abs(sum(result)-1.0) < 1e-14
    return result


def masses_ev(ordering, lightest_ev, solar_delta_ev2, atm_delta31_ev2):
    assert lightest_ev >= 0 and solar_delta_ev2 > 0
    m=lightest_ev
    if ordering == 'NO':
        assert atm_delta31_ev2 > 0
        return (m,math.sqrt(m*m+solar_delta_ev2),math.sqrt(m*m+atm_delta31_ev2))
    if ordering == 'IO':
        assert atm_delta31_ev2 < 0
        return (math.sqrt(m*m-atm_delta31_ev2),
                math.sqrt(m*m-atm_delta31_ev2+solar_delta_ev2),m)
    raise ValueError('Unknown ordering')


def majorana_envelope_ev(masses, electron_weights):
    """Exactly optimized over two relative Majorana phases (vector polygon)."""
    assert len(masses)==len(electron_weights)==3
    assert all(x>=0 for x in masses) and all(w>=0 for w in electron_weights)
    terms=[mass*weight for mass,weight in zip(masses,electron_weights)]
    hi=sum(terms)
    lo=max(0., 2*max(terms)-hi)
    return lo,hi


def io_all_lightest_analytic_guarantee_ev(solar_delta_ev2, abs_atm_delta31_ev2, electron_weights):
    """Globally valid algebraic lower bound with fixed measured central inputs.

    m2-m1 = d21/(m2+m1) <= d21/(2 sqrt(A));
    w1*m1-w2*m2-w3*x >= (w1-w2)*sqrt(x^2+A)-w3*x
                                   -w2*d21/(2sqrt(A)).
    If w1-w2>w3, its infimum over x>=0 is
    sqrt(A)*sqrt((w1-w2)^2-w3^2) - w2*d21/(2sqrt(A)).
    This is NOT a statistical interval or the full 0nu nuclear-decay amplitude.
    """
    d,A=solar_delta_ev2,abs_atm_delta31_ev2
    w1,w2,w3=electron_weights
    assert d>0 and A>0
    a=w1-w2
    if a<=w3:return 0.
    return max(0., math.sqrt(A)*math.sqrt(a*a-w3*w3)-w2*d/(2*math.sqrt(A)))


def half_life_reach_factor(current_effective_mass_limit_ev, hypothetical_floor_ev):
    """Same isotope, fixed NME, pure light-mass mechanism: rate ∝ m_bb^2.
    This is a scaling ratio, never a predicted CI or discovery sensitivity.
    """
    assert current_effective_mass_limit_ev>0 and hypothetical_floor_ev>0
    return (current_effective_mass_limit_ev/hypothetical_floor_ev)**2
