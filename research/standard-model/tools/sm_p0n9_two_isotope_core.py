#!/usr/bin/env python3
"""Structural identifiability for a DECLARED noninterfering two-isotope toy.

NOT nuclear NME numbers or an experimental likelihood. All coefficients are
symbolic/input-defined nonnegative, rate factors included in coefficients.
"""
import math


def determinant(L_xe, H_xe, L_ge, H_ge):
    return L_xe * H_ge - L_ge * H_xe


def normalized_separation(L_xe, H_xe, L_ge, H_ge):
    """|det|/(||light column|| ||heavy column||), 0 for collinear."""
    ln = math.hypot(L_xe, L_ge)
    hn = math.hypot(H_xe, H_ge)
    assert ln > 0 and hn > 0
    return abs(determinant(L_xe, H_xe, L_ge, H_ge)) / (ln * hn)


def noninterfering_rates(L_xe, H_xe, L_ge, H_ge, x, y):
    assert all(t >= 0 for t in (L_xe, H_xe, L_ge, H_ge, x, y))
    return L_xe * x + H_xe * y, L_ge * x + H_ge * y


def recover_if_identifiable(L_xe, H_xe, L_ge, H_ge, R_xe, R_ge):
    assert all(t >= 0 for t in (L_xe, H_xe, L_ge, H_ge, R_xe, R_ge))
    d = determinant(L_xe, H_xe, L_ge, H_ge)
    if abs(d) <= 1e-13 * max(1., abs(L_xe * H_ge), abs(L_ge * H_xe)):
        return None
    x = (R_xe * H_ge - R_ge * H_xe) / d
    y = (L_xe * R_ge - L_ge * R_xe) / d
    if x < -1e-12 or y < -1e-12:
        return None  # one nonnegative-parameter hypothesis is rejected
    return max(x, 0.), max(y, 0.)


def coherent_rates(a_xe, b_xe, a_ge, b_ge, eta_a, eta_b):
    """Toy coherent mode with real isotope amplitudes, two complex couplings."""
    return abs(a_xe * eta_a + b_xe * eta_b) ** 2, abs(a_ge * eta_a + b_ge * eta_b) ** 2


def coefficient_free_upper_limits_admit_zero(upper_xe, upper_ge):
    """Upper limits alone always admit both couplings zero."""
    assert upper_xe >= 0 and upper_ge >= 0
    return 0 <= upper_xe and 0 <= upper_ge
