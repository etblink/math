#!/usr/bin/env python3
"""Source-pinned exploratory JOIN-0 checks on original nine BFSS gammas.

Must be run from a checkout of etblink/math with the frozen original
SU2RealGammaProbe.lean Git blob present. Uses the existing independently
maintained source parser original_gamma() in the Kx checker next door.

Checks integer Gram/column algebra and finite-dimensional normalized
CAR toy trace identities. Does NOT test Lean compilation or 48-real-
Majorana Fock trace orthogonality and is not physical spectral evidence.
"""
import itertools as it
import json

import numpy as np

from bfss_kx_exact_moment_spectrum_check import original_gamma


def original_coefficient_checks(gamma):
    rng = np.random.default_rng(11010)
    maximum_ratio = 0.0
    assert gamma.shape == (9, 16, 16)
    for _ in range(12):
        x = rng.integers(-2, 3, size=(9, 3), dtype=np.int64)
        raw = rng.integers(-2, 3, size=(16, 16), dtype=np.int64)
        B = raw - raw.T
        M = x @ x.T
        cols = [
            sum((int(x[i,a]) * gamma[i] for i in range(9)),
                np.zeros((16,16), dtype=np.int64))
            for a in range(3)
        ]
        gram_k = sum(
            (int(M[i,j]) * (gamma[i] @ B @ gamma[j])
             for i in range(9) for j in range(9)),
            np.zeros((16,16), dtype=np.int64))
        column_k = sum(
            (ga @ B @ ga for ga in cols),
            np.zeros((16,16), dtype=np.int64))
        assert np.array_equal(gram_k,column_k)
        assert np.array_equal(gram_k.T,-gram_k)
        T = int(np.trace(M))
        assert T > 0
        assert np.array_equal(
            sum((int(M[i,j]) * (gamma[i] @ gamma[j])
                 for i in range(9) for j in range(9)),
                np.zeros((16,16), dtype=np.int64)),
            T*np.eye(16,dtype=np.int64))
        C = rng.integers(-2,3,size=(16,16),dtype=np.int64)
        general = sum(
            (int(M[i,j]) * (gamma[i] @ C @ gamma[j])
             for i in range(9) for j in range(9)),
            np.zeros((16,16), dtype=np.int64))
        assert int(np.trace(general)) == T*int(np.trace(C))
        rhs = float(T*np.linalg.norm(B))
        lhs = float(np.linalg.norm(gram_k))
        assert lhs <= rhs*(1+1e-12)
        maximum_ratio=max(maximum_ratio,lhs/rhs)
    return {"integer_configurations":12,"sharp_hs_bound_max_sample_ratio":maximum_ratio}


def kron(*blocks):
    result=np.array([[1.]],dtype=np.complex128)
    for block in blocks:
        result=np.kron(result,block)
    return result


def small_original_car_test():
    # Three original colors and two spin labels, a six-Majorana toy
    # with the SAME delta-one CAR normalization as the original 48.
    I=np.eye(2,dtype=np.complex128)
    X=np.array([[0,1],[1,0]],dtype=np.complex128)
    Y=np.array([[0,-1j],[1j,0]],dtype=np.complex128)
    Z=np.diag([1,-1]).astype(np.complex128)
    theta={}
    for a in range(3):
        theta[0,a]=kron(*([Z]*a+[X]+[I]*(2-a)))/np.sqrt(2)
        theta[1,a]=kron(*([Z]*a+[Y]+[I]*(2-a)))/np.sqrt(2)
    eye=np.eye(8,dtype=np.complex128)
    for p,q in it.product(theta,repeat=2):
        ant=theta[p]@theta[q]+theta[q]@theta[p]
        np.testing.assert_allclose(ant,eye if p==q else np.zeros((8,8)),atol=1e-12)
    def Q(J):
        return sum(
            (J[i,j]*(theta[i,a]@theta[j,a])
             for a in range(3) for i in range(2) for j in range(2)),
            np.zeros((8,8),dtype=np.complex128))
    S=np.array([[2.,3.],[3.,4.]])
    np.testing.assert_allclose(Q(S),1.5*np.trace(S)*eye,atol=1e-12)
    A=np.array([[0.,1.25],[-1.25,0.]])
    B=np.array([[0.,-2.],[2.,0.]])
    QA=Q(A)
    np.testing.assert_allclose(QA.conj().T,-QA,atol=1e-12)
    observed=np.trace(QA.conj().T@Q(B))
    expected=(3*8/2)*float(np.sum(A*B))
    np.testing.assert_allclose(observed,expected,atol=1e-10)
    return {"majorana_count":6,"fock_dimension":8,
            "trace_cross_observed":float(observed.real),
            "trace_cross_expected":expected,
            "trace_coefficient":3*8/2}


def main():
    gamma=original_gamma()  # hard-fails original Lean Git-blob drift
    result={"gamma_source_blob":"b9b8192055c70f0d001d7982669b9823c55562ed",
            "status":"exploratory_not_lean_qualified",
            "gram_and_hs":original_coefficient_checks(gamma),
            "toy_car":small_original_car_test()}
    print(json.dumps(result,indent=2,sort_keys=True))


if __name__=="__main__":
    main()
