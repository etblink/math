#!/usr/bin/env python3
"""RHOPF-P6: two-component Gross-Pitaevskii configuration/charge countermodel.

This is NOT a time-dependent GP solution, original BFSS Fock Hamiltonian,
physical proton, or original 3+1D quantum field theory. Only a finite-energy
configuration space comparison, source Hopf-coordinate crosswalk, and Noether
charge admissibility diagnostics. All quantities dimensionless.
"""
import math
import json
from pathlib import Path
import numpy as np
from scipy.optimize import brentq

HERE=Path(__file__).resolve().parent
FIXTURE=HERE.parent/'data'/'BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json'
GAMMA_SOURCE_BLOB='b9b8192055c70f0d001d7982669b9823c55562ed'
SOURCED_COORDINATES=(0,1,8,9)


def exact_source_gamma_restriction():
    j=json.loads(FIXTURE.read_text(encoding='utf-8'))
    assert j.get('source_git_blob_sha',j.get('source_sha'))==GAMMA_SOURCE_BLOB
    p,s=j['perm'],j['sign']
    assert len(p)==len(s)==9 and all(len(a)==16 for a in p+s)
    for k in range(9):
        if k not in (0,7,8):
            assert all(p[k][i] not in SOURCED_COORDINATES for i in SOURCED_COORDINATES)
    return p,s


def make_mesh(N=41, halfwidth=2.5):
    axis=np.linspace(-halfwidth,halfwidth,N)
    d=float(axis[1]-axis[0])
    coords=np.meshgrid(axis,axis,axis,indexing='ij')
    return coords,d


def integrate3(values,dx):
    """3D tensor-product trapezoid quadrature, exact for constants on the cube."""
    assert values.ndim==3 and values.shape[0]==values.shape[1]==values.shape[2]
    m=values.shape[0]
    w=np.ones(m)
    w[0]=w[-1]=.5
    return float(np.einsum('i,j,k,ijk->',w,w,w,values,optimize=True)*dx**3)


def source_hopf_profile(x,y,z,R=2.):
    """Continuous C2 compact-support degree-one S3 map, boundary (0,1).
    f(r)=pi*(1-6u^5+15u^4-10u^3), u=min(r/R,1), f(0)=pi,f(R)=0.
    """
    r=np.sqrt(x*x+y*y+z*z)
    u=np.minimum(r/R,1)
    f=np.pi*(1-(6*u**5-15*u**4+10*u**3))
    sf=np.sin(f)
    factor=np.divide(sf,r,out=np.zeros_like(r),where=r>1e-12)
    one=factor*(x+1j*y)
    two=np.cos(f)+1j*factor*z
    # Exact source map at origin: (z1,z2)=(0,-1).
    assert np.max(np.abs(np.abs(one)**2+np.abs(two)**2-1))<2e-12
    assert np.max(np.abs(one[r>=R]))<1e-12
    assert np.max(np.abs(two[r>=R]-1))<1e-12
    return one,two,r


def field_grad_energy(psi1,psi2,dx,g=2.):
    """Dimensionless GP E=1/2 integral (sum |grad psi|²)+g/2 integral (n-1)²."""
    grad=[np.gradient(q,dx,edge_order=2) for q in (psi1,psi2)]
    e_kin=.5*sum(integrate3(np.abs(der)**2,dx) for triple in grad for der in triple)
    n=np.abs(psi1)**2+np.abs(psi2)**2
    e_pot=.5*g*integrate3((n-1)**2,dx)
    return {'kinetic':e_kin,'density_potential':e_pot,'total':e_kin+e_pot,'min_density':float(n.min())}


def noether_populations(psi1,psi2,dx):
    return np.array([integrate3(np.abs(psi1)**2,dx),integrate3(np.abs(psi2)**2,dx)])


def source_hopf_target(psi1,psi2):
    cross=psi1*np.conj(psi2)
    return np.stack([2*cross.real,-2*cross.imag,np.abs(psi1)**2-np.abs(psi2)**2],axis=-1)


def faddeev_skyrme_base(psi1,psi2,dx):
    """Compute strict S2 target E2 and E4 for the compact radial profile."""
    q=source_hopf_target(psi1,psi2)
    assert np.max(np.abs(np.sum(q*q,axis=-1)-1))<5e-12
    grads=[np.gradient(q,dx,axis=a,edge_order=2) for a in range(3)]
    sq=sum(np.sum(v*v,axis=-1) for v in grads)
    wedge=0.
    for a in range(3):
        for b in range(a+1,3):
            va,vb=grads[a],grads[b]
            cross=np.cross(va,vb)
            wedge=wedge+np.sum(cross*cross,axis=-1)
    return {'E2_base':.5*integrate3(sq,dx),
            'E4_base':.5*integrate3(wedge,dx)}


def charge_preserving_path(psi1,psi2,r,dx,t,compensator_radius=2.35):
    """Adversarial configuration-space path with BOTH Nj fixed and fixed Dirichlet boundary.

    Component1 remains exactly unchanged. Component2 starts as psi2 and is
    interpolated to constant 1, then locally modulated by exp(lambda*g(r))
    where g>=0 is supported strictly inside the domain and g(0)=0.
    The scalar lambda is solved to preserve N2, so BOTH U(1) charges stay
    constant. The full field is allowed to vanish at r=0, t=1/2, hence its
    normalized Hopf degree can change despite exactly fixed Nj and boundary.

    This path is NOT a solution of the GP evolution or on a fixed energy shell.
    """
    target=float(noether_populations(psi1,psi2,dx)[1])
    raw=(1-t)*psi2+t
    support=np.maximum(0,1-(r/compensator_radius)**2)
    bump=((r*r)/(r*r+.04))*support**4
    def integral(lam):
        return integrate3(np.abs(raw)**2*np.exp(2*lam*bump),dx)
    fminus=integral(-100)-target
    fplus=integral(100)-target
    assert fminus<=1e-8 and fplus>=-1e-8,('no local charge compensation',t,fminus,fplus)
    lam=float(brentq(lambda z:integral(z)-target,-100,100,xtol=1e-13))
    out2=raw*np.exp(lam*bump)
    out1=psi1.copy()
    check=noether_populations(out1,out2,dx)
    assert abs(check[1]-target)<5e-10
    return out1,out2,lam


def profile_degree_magnitude(R=2.):
    """S3 hedgehog degree magnitude using f endpoints, orientation declared separately."""
    from scipy.integrate import quad
    def radial(q):
        # u=q/R, f'=-(30*pi/R)u²(1-u)²
        u=q/R
        f=np.pi*(1-6*u**5+15*u**4-10*u**3)
        fp=-(30*np.pi/R)*u*u*(1-u)**2
        return -(2/np.pi)*np.sin(f)**2*fp
    degree,err=quad(radial,0,R,epsabs=1e-12)
    return degree,err
