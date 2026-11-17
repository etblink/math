#!/usr/bin/env python3
"""Independent 4-gamma complex-Clifford witness control, NOT a BFSS proof.
Requires numpy. All input matrices have integer/complex-integer entries.
"""
import numpy as np

I2 = np.eye(2, dtype=complex)
X = np.array([[0, 1], [1, 0]], dtype=complex)
Y = np.array([[0, -1j], [1j, 0]], dtype=complex)
Z = np.diag([1, -1]).astype(complex)
I4 = np.eye(4, dtype=complex)
G = [np.kron(X, I2), np.kron(Y, I2), np.kron(Z, X), np.kron(Z, Y)]


def comm(a, b):
    return a @ b - b @ a


def k_gen(a):
    return sum((a[p, q] / 4) * (G[p] @ G[q])
               for p in range(4) for q in range(4))


def signature_ranks(gammas):
    basis = [np.outer(I4[:, i], I4[j, :]) for i in range(4) for j in range(4)]
    ad = np.stack([np.concatenate([comm(e, g).reshape(-1) for g in gammas])
                   for e in basis], axis=1)
    with_trace = np.vstack([ad, [np.trace(e) for e in basis]])
    return (int(np.linalg.matrix_rank(ad, tol=1e-10)),
            int(np.linalg.matrix_rank(with_trace, tol=1e-10)))


def main():
    a = np.array([[0, 1, -2, 3], [-1, 0, 4, -1],
                  [2, -4, 0, 2], [-3, 1, -2, 0]], dtype=float)
    b = np.array([[0, -3, 2, 1], [3, 0, -1, 5],
                  [-2, 1, 0, -2], [-1, -5, 2, 0]], dtype=float)
    assert np.allclose(a.T, -a) and np.allclose(b.T, -b)
    car = max(np.linalg.norm(G[i] @ G[j] + G[j] @ G[i]
                 - 2 * int(i == j) * I4) for i in range(4) for j in range(4))
    covariance = max(np.linalg.norm(comm(k_gen(a), G[k])
                         - sum(a[p, k] * G[p] for p in range(4)))
                     for k in range(4))
    bracket = np.linalg.norm(comm(k_gen(a), k_gen(b)) - k_gen(a @ b - b @ a))
    trace = abs(np.trace(k_gen(a)))
    assert max(car, covariance, bracket, trace) < 1e-11
    expected = {1: (8, 9), 2: (12, 13), 3: (14, 15), 4: (15, 16)}
    for m in range(1, 5):
        result = signature_ranks(G[:m])
        assert result == expected[m], (m, result)
        print(f"{m} gamma(s): commutator rank {result[0]}/16; plus trace {result[1]}/16")
    assert all(np.allclose(comm(1.5 * I4, g), 0) for g in G)
    assert np.isclose(np.trace(1.5 * I4), 6)
    print(f"CAR/covariance/bracket/trace residuals: {car:.1g}, {covariance:.1g}, {bracket:.1g}, {trace:.1g}")
    print("Scalar 1.5 I4 invisible to every commutator, but has trace 6. PASS")


if __name__ == "__main__":
    main()
