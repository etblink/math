#!/usr/bin/env python3
"""D1S2: exact CAR projection and SU(2)-color coefficient prescreen.

Source contract: Q(K)=(i/2) Σ K[p,q] θ_p θ_q, {θ_p,θ_q}=δ[p,q] I,
θ_p†=θ_p. Matrix tests are full real 48x48; Fock tests are 3/6-mode
analogues (NOT original 2**24). No Lean or physical spectrum claim.
"""
import json
import numpy as np

rng = np.random.default_rng(20261123)

def norm(x):
    return float(np.linalg.norm(x))

def color():
    q, r = np.linalg.qr(rng.normal(size=(3, 3)))
    q = q @ np.diag(np.where(np.diag(r) < 0, -1., 1.))
    if np.linalg.det(q) < 0:
        q[:, 0] *= -1
    return q

def theta_ops(m):
    x = np.array([[0, 1], [1, 0]], complex)
    y = np.array([[0, -1j], [1j, 0]], complex)
    z = np.diag([1., -1.]).astype(complex)
    e = np.eye(2, dtype=complex)
    ops = []
    for j in range(m):
        for p in (x, y):
            op = np.array([[1. + 0j]])
            for k in range(m):
                op = np.kron(op, z if k < j else p if k == j else e)
            ops.append(op / np.sqrt(2.))
    return np.array(ops)

def quant(k, theta):
    return (0.5j) * np.einsum("pq,pab,qbc->ac", k, theta, theta,
                             optimize=True)

errors = {"skew_transport": 0., "trace_transport": 0.,
          "skew_spectrum_transport": 0., "CAR": 0.,
          "scalar_decomposition": 0., "traceless_symmetric_kernel": 0.,
          "selfadjoint_tracezero": 0., "antihermitian_trace": 0.}
negative_wrong_factor = []
nonzero_kernel = []

for trial in range(40):
    o = color()
    t = np.kron(np.eye(16), o)
    k = rng.normal(size=(48, 48)) + 0.8 * np.eye(48)
    a = (k-k.T)/2
    kp = t @ k @ t.T
    ap = t @ a @ t.T
    errors["skew_transport"] = max(errors["skew_transport"],
                                   norm((kp-kp.T)/2-ap))
    errors["trace_transport"] = max(errors["trace_transport"],
                                    abs(np.trace(kp)-np.trace(k)))
    errors["skew_spectrum_transport"] = max(
        errors["skew_spectrum_transport"],
        norm(np.sort(np.linalg.eigvalsh(1j*a)) -
             np.sort(np.linalg.eigvalsh(1j*ap))))

for m, reps in [(3, 6), (6, 3)]:
    theta = theta_ops(m)
    n, d = 2*m, 2**m
    eye = np.eye(d, dtype=complex)
    for p in range(n):
        for q in range(n):
            errors["CAR"] = max(errors["CAR"], norm(
                theta[p]@theta[q] + theta[q]@theta[p] -
                (float(p == q))*eye))
    for trial in range(reps):
        k = rng.normal(size=(n, n))
        a = (k-k.T)/2
        s = (k+k.T)/2
        s0 = s - np.trace(s)/n*np.eye(n)
        # Force a nonzero scalar trace term for the negative control.
        k = a+s0+0.8*np.eye(n)
        qk, qa = quant(k,theta), quant(a,theta)
        qtracezero = quant(a+s0,theta)
        trace = float(np.trace(k))
        errors["scalar_decomposition"] = max(
            errors["scalar_decomposition"],
            norm(qk-qa-0.25j*trace*eye))
        errors["traceless_symmetric_kernel"] = max(
            errors["traceless_symmetric_kernel"], norm(qtracezero-qa))
        errors["selfadjoint_tracezero"] = max(
            errors["selfadjoint_tracezero"],
            norm(qtracezero-qtracezero.conj().T))
        errors["antihermitian_trace"] = max(
            errors["antihermitian_trace"],
            abs(norm(qk-qk.conj().T)-abs(trace)*np.sqrt(d)/2))
        negative_wrong_factor.append(
            norm(qk-qa-0.50j*trace*eye))
        nonzero_kernel.append(norm(s0))

assert max(errors.values()) < 1e-10, errors
assert min(negative_wrong_factor) > 1
assert min(nonzero_kernel) > 1
print(json.dumps({
    "passed": True,
    "seed": 20261123,
    "full_48_coefficient_trials": 40,
    "reduced_fock_trials": 9,
    "reduced_fock_modes": [3,6],
    "maximum_residuals": errors,
    "negative_control_wrong_scalar_factor_min": min(negative_wrong_factor),
    "minimum_nontrivial_symmetric_traceless_norm": min(nonzero_kernel),
    "analytic_kernel_dimension_lower_bound": 48*49//2-1,
    "caveat": "Reduced CAR Fock analogues and proper SO3 colors only; not an original 2**24 source Lean theorem or BFSS spectral test."
}, indent=2))
