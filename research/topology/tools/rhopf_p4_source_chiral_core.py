#!/usr/bin/env python3
"""RHOPF-P4 source-gamma chiral-family comparison, not physical BFSS dynamics.

Exact original 9x16 BFSS Clifford coefficients are read from the immutable
research fixture. The 4x4 positive-control Dirac block is NEW, not original.
No claim that these one-particle families are original 48-CAR BFSS operators,
gauge covariant, closed spatial Dirac operators, or particle Hamiltonians.
"""
import json
from pathlib import Path
import numpy as np

ORIGINAL_GAMMA_BLOB='b9b8192055c70f0d001d7982669b9823c55562ed'
FIXTURE=Path(__file__).resolve().parent.parent/'data'/'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'


def original_gamma():
    obj=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert obj.get('source_git_blob_sha', obj.get('source_sha'))==ORIGINAL_GAMMA_BLOB
    p,s=obj['perm'],obj['sign']
    assert len(p)==len(s)==9 and all(len(row)==16 for row in p+s)
    G=np.zeros((9,16,16),dtype=np.int64)
    for a in range(9):
        for i in range(16):
            assert 0<=p[a][i]<16 and abs(s[a][i])==1
            G[a,i,p[a][i]]=s[a][i]
    I=np.eye(16,dtype=np.int64)
    for a in range(9):
        assert np.array_equal(G[a],G[a].T)
        assert np.trace(G[a])==0
        for b in range(9):
            assert np.array_equal(G[a]@G[b]+G[b]@G[a],2*I if a==b else np.zeros((16,16),dtype=np.int64))
    return G


def minimal_gamma():
    """A newly specified, independent complex 4x4 Cl4 family, not BFSS."""
    I=np.eye(2,dtype=complex)
    zero=np.zeros((2,2),dtype=complex)
    sx=np.array([[0,1],[1,0]],dtype=complex)
    sy=np.array([[0,-1j],[1j,0]],dtype=complex)
    sz=np.diag([1,-1]).astype(complex)
    g=[np.block([[zero,I],[I,zero]])]
    for sigma in (sx,sy,sz):
        g.append(np.block([[zero,1j*sigma],[-1j*sigma,zero]]))
    S=np.diag([1,1,-1,-1]).astype(complex)
    for a in range(4):
        assert np.allclose(g[a],g[a].conj().T)
        assert np.allclose(S@g[a]+g[a]@S,0)
        for b in range(4):
            assert np.allclose(g[a]@g[b]+g[b]@g[a],2*np.eye(4) if a==b else np.zeros((4,4)))
    return np.array(g),S


def sphere_map(x):
    """Stereographic R3∪infty ≅ S3; orientation degree -1 in our order."""
    r2=float(sum(v*v for v in x))
    v=np.asarray([(r2-1)/(r2+1)]+[2*float(t)/(r2+1) for t in x])
    assert abs(np.dot(v,v)-1)<1e-12
    return v


def block_diag(A,B):
    result=np.zeros((A.shape[0]+B.shape[0],A.shape[1]+B.shape[1]),dtype=complex)
    result[:A.shape[0],:A.shape[1]]=A
    result[A.shape[0]:,A.shape[1]:]=B
    return result


def chiral_24_family(kind, y, G=None):
    """Two 24-orbital number-conserving toy families; not source Fermion 2 maps."""
    y=np.asarray(y,dtype=float)
    assert y.shape==(4,) and abs(np.linalg.norm(y)-1)<1e-12
    if kind=='source16_plus_8':
        assert G is not None
        h=np.einsum('k,kij->ij',y,G[:4]).astype(complex)
        chir=G[4].astype(complex)
        size=4
    elif kind=='minimal4_plus_20':
        mats,chir=minimal_gamma()
        h=np.einsum('k,kij->ij',y,mats)
        size=10
    else:
        raise ValueError('unknown comparison case')
    ident=np.eye(size,dtype=complex)
    zero=np.zeros((size,size),dtype=complex)
    trivial=block_diag(zero,zero)
    trivial[:size,size:]=ident
    trivial[size:,:size]=ident
    grading=np.diag([1.]*size+[-1.]*size).astype(complex)
    h24=block_diag(h,trivial)
    S24=block_diag(chir,grading)
    assert h24.shape==S24.shape==(24,24)
    assert np.allclose(h24.conj().T,h24)
    assert np.allclose(h24@h24,np.eye(24))
    assert np.allclose(S24@S24,np.eye(24))
    assert np.allclose(S24@h24+h24@S24,0)
    return h24,S24


def symmetry_breaking_escape(h,S,theta):
    """Flat-gap path h_t=cos(t)h+sin(t)S; explicitly breaks chiral S."""
    H=np.cos(theta)*h+np.sin(theta)*S
    assert np.allclose(H@H,np.eye(H.shape[0]),atol=1e-12)
    assert np.allclose(H.conj().T,H)
    return H


def fock_ground_data(H):
    """Occupation filling by exterior second quantization, no dense 2^24 matrix."""
    evals=np.linalg.eigvalsh(H)
    negative=int(np.sum(evals<0))
    positive=int(np.sum(evals>0))
    assert negative+positive==24 and np.max(np.abs(np.abs(evals)-1))<1e-11
    return {'negative_modes':negative,'positive_modes':positive,
            'ground_energy':float(np.sum(evals[evals<0])),
            'ground_parity':int((-1)**negative),
            'excitation_gap':float(np.min(np.abs(evals)))}


def based_gap_preserving_escape(h,S,reference,theta):
    """Boundary-FIXED class-A escape, not a chiral-preserving homotopy.

    E=H(infinity); {E,S}=0. K=S E, U=cos(t/2)I-sin(t/2)K
    rotates the MOVING boundary cos(t)E+sin(t)S back to E.
    H'_t(y)=U[cos(t)h(y)+sin(t)S]U† starts h(y), ends E,
    and H'_t(infinity)=E for EVERY t, while its gap stays one.
    """
    I=np.eye(24,dtype=complex)
    assert np.allclose(reference@reference,I)
    assert np.allclose(reference@S+S@reference,0)
    K=S@reference
    assert np.allclose(K.conj().T,-K) and np.allclose(K@K,-I)
    U=np.cos(theta/2)*I-np.sin(theta/2)*K
    assert np.allclose(U@U.conj().T,I)
    H=U@symmetry_breaking_escape(h,S,theta)@U.conj().T
    assert np.allclose(H@H,I)
    return H
