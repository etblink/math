#!/usr/bin/env python3
"""SM-P0N7 math layer: GIM subtraction and source-conditional upper envelope.

No experimental exclusion, no treatment of heavy-neutrino loops, and no claim
of higher-loop precision. Inputs use eV^2 for splittings and eV for W mass.
"""
import cmath
import math


def unitary_row_pair(e_row, mu_row, tolerance=1e-12):
    assert len(e_row) == len(mu_row) == 3
    ne = sum(abs(x)**2 for x in e_row)
    nm = sum(abs(x)**2 for x in mu_row)
    overlap = sum(x.conjugate()*y for x, y in zip(e_row, mu_row))
    assert abs(ne-1) < tolerance and abs(nm-1) < tolerance
    assert abs(overlap) < tolerance
    return True


def gim_weighted_sum(m2_eV2, e_row, mu_row, shift_eV2=0.0):
    assert len(m2_eV2) == 3
    unitary_row_pair(e_row, mu_row)
    return sum(e.conjugate()*mu*(mass2+shift_eV2)
               for mass2, e, mu in zip(m2_eV2, e_row, mu_row))


def centered_spectral_bound(m2_eV2):
    """Off-diagonal bound: |(U diag(m^2) U†)_eμ| <= diameter/2.

    Subtract c=(min+max)/2; row orthogonality kills c. Apply
    |sum conjugate(e_i) mu_i (m_i^2-c)| <= ||m^2-c||∞ · sum|e_i mu_i|
    <= (max-min)/2 by Cauchy-Schwarz and normalized rows.
    """
    assert len(m2_eV2) == 3
    return (max(m2_eV2)-min(m2_eV2))/2


def light_only_br(amplitude_eV2, mw_eV, alpha):
    assert 0 < alpha < 1 and mw_eV > 1e9
    return 3*alpha/(32*math.pi) * abs(amplitude_eV2/(mw_eV*mw_eV))**2


def conditional_br_envelope(m2_eV2, mw_min_eV, alpha_max):
    assert mw_min_eV > 1e9 and 0 < alpha_max < 1
    return light_only_br(centered_spectral_bound(m2_eV2), mw_min_eV, alpha_max)
