#!/usr/bin/env python3
"""P9 source-16-gamma Spin9/Hopf U(1) subgroup algebra, original fixture.

NO original BFSS Hamiltonian symmetry or 48-Majorana Fock-vector lift is
proved. The selected real 4-space is a mathematical Hopf subcarrier, not a
new dynamical or gauge constraint. All Clifford tests use exact int arrays.
"""
import json
from pathlib import Path
import numpy as np

SOURCE_GAMMA_BLOB = 'b9b8192055c70f0d001d7982669b9823c55562ed'
FIXTURE = Path(__file__).resolve().parent.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
SUBCARRIER = (0, 1, 8, 9)
BIVECTOR_PAIRS = ((1, 3, +1), (2, 5, -1), (4, 6, -1))


def source_gamma():
    d=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert d.get('source_git_blob_sha',d.get('source_sha'))==SOURCE_GAMMA_BLOB
    p,s=d['perm'],d['sign']
    assert len(p)==len(s)==9 and all(len(row)==16 for row in p+s)
    G=np.zeros((9,16,16),dtype=np.int64)
    for k in range(9):
        for i in range(16):
            assert 0<=p[k][i]<16 and s[k][i] in (-1,1)
            G[k,i,p[k][i]]=s[k][i]
    I=np.eye(16,dtype=np.int64)
    for k in range(9):
        assert np.array_equal(G[k],G[k].T)
        assert np.trace(G[k])==0
        for j in range(9):
            assert np.array_equal(G[k]@G[j]+G[j]@G[k],(2*I if k==j else np.zeros((16,16),dtype=np.int64)))
    return G


def source_bivector(G,i,j,sign=1):
    assert i!=j and 0<=i<9 and 0<=j<9 and sign in (-1,1)
    K=sign*(G[i]@G[j])
    assert np.array_equal(K.T,-K)
    assert np.array_equal(K@K,-np.eye(16,dtype=np.int64))
    return K


def common_phase_generator():
    J=np.zeros((16,16),dtype=np.int64)
    for a,b in ((0,1),(8,9)):
        J[a,b]=-1;J[b,a]=1
    return J


def spinor_rotation(K,t):
    return np.cos(t)*np.eye(16)+np.sin(t)*K


def hopf_Q(G,v):
    return np.array([v.T@G[k]@v for k in range(9)])


def original_48_label_actions(K, color_adjoint):
    """Color-by-spin tensor-coordinate model of original 48 real axes.

    Original source C48C0 includes the required paired-label REINDEX; our
    independent consumer tests its tensor Kronecker algebra only. This is
    NOT a 2^24-dimensional Fock-vector unitary, nor a physical Hamiltonian.
    """
    I3=np.eye(3,dtype=np.int64)
    I16=np.eye(16,dtype=np.int64)
    return np.kron(I3,K),np.kron(color_adjoint,I16)
