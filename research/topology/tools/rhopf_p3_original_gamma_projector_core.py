#!/usr/bin/env python3
"""RHOPF-P3: original-gamma rank-eight spectral projector math.

The original signed-permutation gamma fixture is a research cache of the
unaltered BFSS Lean source. This script does not identify the 16-spinor with
the original 48-Majorana Fock operator or establish a physical Dirac index.
"""
import json
from pathlib import Path
import numpy as np

HERE = Path(__file__).resolve().parent
FIXTURE = HERE.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
ORIGINAL_GAMMA_SHA = 'b9b8192055c70f0d001d7982669b9823c55562ed'


def original_gamma():
    v=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert v.get('source_sha',v.get('source_git_blob_sha')) == ORIGINAL_GAMMA_SHA
    p=np.asarray(v['perm'],dtype=int)
    s=np.asarray(v['sign'],dtype=int)
    assert p.shape == s.shape == (9,16)
    gamma=np.zeros((9,16,16),dtype=int)
    for k in range(9):
        for i in range(16):gamma[k,i,p[k,i]]=s[k,i]
    I=np.eye(16,dtype=int)
    for k in range(9):
        assert np.array_equal(gamma[k],gamma[k].T)
        assert int(np.trace(gamma[k]))==0
        for l in range(9):
            assert np.array_equal(gamma[k]@gamma[l]+gamma[l]@gamma[k],
                                  2*I if k==l else np.zeros((16,16),dtype=int))
    return gamma


def hopf_Q(spin,gamma):
    assert spin.shape==(16,)
    assert abs(np.dot(spin,spin)-1)<1e-12
    result=np.einsum('i,kij,j->k',spin,gamma,spin)
    assert abs(np.dot(result,result)-1)<1e-11
    return result


def occupied_projector(q,gamma):
    assert q.shape==(9,)
    h=np.einsum('k,kij->ij',q,gamma).astype(float)
    assert np.max(np.abs(h@h-np.eye(16)))<1e-11
    assert abs(np.trace(h))<1e-11
    P=(np.eye(16)-h)/2
    assert np.max(np.abs(P@P-P))<1e-11
    assert np.max(np.abs(P-P.T))<1e-11
    assert abs(np.trace(P)-8)<1e-11
    return P


def based_escape(phi,theta):
    """Explicit 4-coordinate spinor deformation through original e2.

    Input phi in span(e0,e1,e8,e9), vacuum is e0. Output lives in S15.
    """
    assert phi.shape==(16,)
    assert abs(np.dot(phi,phi)-1)<1e-12
    assert np.max(np.abs(phi[[k for k in range(16) if k not in (0,1,8,9)]]))<1e-12
    c,s=np.cos(theta),np.sin(theta)
    a=phi[0]
    out=c*phi.copy()
    out[0]=c*c*a+s*s
    out[2]=s*c*(1-a)
    assert abs(np.dot(out,out)-1)<1e-12
    return out
