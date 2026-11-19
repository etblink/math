#!/usr/bin/env python3
"""RHOPF-P2: source-pinned gamma, bosonic escape and Fock toy adapter.

This is NOT the BFSS fermion Hamiltonian, its gauge-singlet sector, or an
experimental prediction. Fock adapter dGamma(h(Q) direct_sum I_8) is a NEW
one-particle model on C^24, not a map from original 48 CAR generators.
Requires numpy; tested with Python 3.13 / numpy 2.3.5.
"""
import json
import math
from pathlib import Path
import numpy as np

HERE = Path(__file__).resolve().parent
FIXTURE = HERE.parent / 'data' / 'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
SHA = 'b9b8192055c70f0d001d7982669b9823c55562ed'
SELECTED = (0, 1, 8, 9)
EXTRA = 2  # exact source coordinate OUTSIDE the selected 4-real space


def gamma_source():
    src=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert src.get('source_git_blob_sha',src.get('source_sha')) == SHA
    p=np.asarray(src['perm'],dtype=np.int64)
    s=np.asarray(src['sign'],dtype=np.int64)
    assert p.shape == s.shape == (9,16)
    g=np.zeros((9,16,16),dtype=np.float64)
    for k in range(9):
        for i in range(16):g[k,i,p[k,i]]=s[k,i]
    I=np.eye(16)
    for k in range(9):
        assert np.array_equal(g[k],g[k].T)
        assert np.trace(g[k]) == 0
        for l in range(9):
            assert np.array_equal(g[k]@g[l]+g[l]@g[k],2*I if k==l else np.zeros((16,16)))
    return g


def hopf_Q(phi,g):
    assert phi.shape[-1]==16
    q=np.einsum('...a,kab,...b->...k',phi,g,phi,optimize=True)
    return q


def hedgehog_field(grid=21,scale=1.4,extent=2.0):
    assert grid%2==1 and grid>=9 and 0<scale<extent
    axis=np.linspace(-extent,extent,grid)
    dx=float(axis[1]-axis[0])
    xx,yy,zz=np.meshgrid(axis,axis,axis,indexing='ij')
    r=np.sqrt(xx*xx+yy*yy+zz*zz)
    # Smooth enough for a finite-energy model; fixed boundary q0=e0 exactly.
    t=np.minimum(r/scale,1.0)
    f=np.pi * (1-t)**3
    q=np.zeros((grid,grid,grid,16),dtype=np.float64)
    q[...,0]=np.cos(f)
    sinf=np.sin(f)
    for slot,coord in zip((1,8,9),(xx,yy,zz)):
        q[...,slot]=np.where(r>0,sinf*coord/np.where(r==0,1,r),0)
    assert np.max(np.abs(np.sum(q*q,axis=-1)-1))<1e-12
    assert np.max(np.abs(q[0,...,0]-1))<1e-12
    return q,dx


def escape(q,theta):
    c,s=np.cos(theta),np.sin(theta)
    a=q[...,0]
    result=c*q
    # Formula H_t=(c² a+s²)e0 + c (q-a e0)+ sc(1-a)e_EXTRA.
    result[...,0]=c*c*a+s*s
    result[...,EXTRA]=s*c*(1-a)
    assert np.max(np.abs(np.sum(result*result,axis=-1)-1))<1e-12
    return result


def full_extended_energy(phi,g,dx,kappa=10.,a=1.,b=1.):
    q=hopf_Q(phi,g)
    assert np.max(np.abs(np.sum(q*q,axis=-1)-1))<1e-11
    grad=np.stack([np.gradient(q,dx,axis=i,edge_order=2) for i in range(3)])
    grad2=sum(np.sum(grad[i]*grad[i],axis=-1) for i in range(3))
    wedge=np.zeros_like(grad2)
    for i in range(3):
        for j in range(i+1,3):
            ni=np.sum(grad[i]*grad[i],axis=-1)
            nj=np.sum(grad[j]*grad[j],axis=-1)
            cross=np.sum(grad[i]*grad[j],axis=-1)
            wedge += np.maximum(0.,ni*nj-cross*cross)
    mask=[k for k in range(16) if k not in SELECTED]
    violation=np.sum(phi[...,mask]**2,axis=-1)
    factors=dx**3*np.array([np.sum(grad2),np.sum(wedge),np.sum(violation)])
    total=a*factors[0]+b*factors[1]+kappa*factors[2]
    return {'E2':float(factors[0]),'E4':float(factors[1]),
            'anisotropy_integral':float(factors[2]),'E_total':float(total)}


def one_particle_spectrum(q,g):
    assert q.shape==(9,)
    assert abs(np.linalg.norm(q)-1)<1e-10
    h=np.einsum('k,kij->ij',q,g)
    assert np.max(np.abs(h@h-np.eye(16)))<1e-11
    assert abs(np.trace(h))<1e-11
    eig=np.linalg.eigvalsh(h)
    assert np.max(np.abs(np.sort(eig)-np.array([-1.]*8+[1.]*8)))<1e-10
    # Toy 24-mode exterior Fock space: h16 plus 8 spectator +1 modes.
    # H_F=dGamma(h16+I8). Unique filled-negative orbitals (8), parity +.
    return {'one_particle_negative_count':8, 'one_particle_positive_count':16,
            'many_body_ground_energy':-8,'many_body_ground_fermion_number':8,
            'many_body_ground_parity':1,'many_body_excitation_gap':1.0,
            'one_particle_min_abs_eigenvalue':float(np.min(np.abs(eig)))}
