#!/usr/bin/env python3
"""D1O finite-CAR source-convention Gaussian projector validation.

48 Majoranas live on true original Fermion 2; matrices here only for m<=4
modes, checking the universal CAR algebraic polynomial and normalization.
Not a Lean theorem or closed-operator spectral qualification.
"""
import argparse
import json
from pathlib import Path
import numpy as np

I=np.eye(2,dtype=complex)
Z=np.diag([1,-1]).astype(complex)
A=np.array([[0,1],[0,0]],complex)

def kron_all(mats):
    out=np.array([[1]],complex)
    for p in mats:out=np.kron(out,p)
    return out

def operators(m):
    create=[]; annih=[]; gam=[]
    for j in range(m):
        c=kron_all([Z]*j+[A]+[I]*(m-j-1))
        annih.append(c)
        create.append(c.conj().T)
        gam.extend([c+c.conj().T,-1j*(c-c.conj().T)])
    return annih,create,gam

def covariance(gam,psi):
    mm=len(gam)
    C=np.zeros((mm,mm),float)
    for a in range(mm):
        for b in range(a+1,mm):
            z=1j*np.vdot(psi,gam[a]@gam[b]@psi)
            assert abs(z.imag)<1.e-10
            C[a,b]=z.real;C[b,a]=-z.real
    return C

def quadratic(C,gam):
    dim=gam[0].shape[0]
    H=np.zeros((dim,dim),complex)
    for a in range(len(gam)):
        for b in range(a+1,len(gam)):
            H+=(-.5j)*C[a,b]*(gam[a]@gam[b])
    return H

def ground_polynomial(H,m):
    dim=H.shape[0]
    eye=np.eye(dim,dtype=complex)
    # fermionic flat quadratic Hamiltonian has levels -m/2+k, k=0,...,m
    # projector to level -m/2 is prod_{k=1}^m [(-m/2+k)*I-H]/k
    P=eye.copy()
    for k in range(1,m+1):P=P@((k-m/2)*eye-H)/k
    return (P+P.conj().T)/2

def test_mode(m,rng):
    ann,create,gam=operators(m)
    vacuum=np.zeros(2**m,complex);vacuum[0]=1
    ident=np.eye(2**m,dtype=complex)
    car=max(np.linalg.norm(gam[a]@gam[b]+gam[b]@gam[a]-2*(a==b)*ident,ord='fro')
            for a in range(2*m) for b in range(2*m))
    # Complex Haar unitary one-particle orbital gives normalized 1-fermion Slater.
    M=rng.normal(size=(m,m))+1j*rng.normal(size=(m,m))
    Q,R=np.linalg.qr(M)
    Q=Q*np.conj(np.diag(R)/abs(np.diag(R)))[None,:]
    psi=sum(Q[j,0]*(create[j]@vacuum) for j in range(m))
    psi=psi/np.linalg.norm(psi)
    C=covariance(gam,psi)
    H=quadratic(C,gam)
    P=ground_polynomial(H,m)
    desired=np.outer(psi,psi.conj())
    w=np.linalg.eigvalsh(H)
    levels=sorted(set(np.round(w,9)))
    return {'modes':m,'car_fro_error':float(car),'purity_error':float(np.linalg.norm(C@C+np.eye(2*m),ord='fro')),
      'H_hermiticity_error':float(np.linalg.norm(H-H.conj().T,ord='fro')),
      'H_spectrum':levels,'ground_level':-m/2,'ground_multiplicity':int(sum(np.abs(w+m/2)<1e-7)),
      'P_projector_error':float(np.linalg.norm(P@P-P,ord='fro')),
      'P_trace':float(np.trace(P).real),'P_vs_Slater_error':float(np.linalg.norm(P-desired,ord='fro')),
      'ground_energy_error':float(abs(np.vdot(psi,H@psi)+m/2)),
      'C_antisymmetry_error':float(np.linalg.norm(C+C.T,ord='fro'))}

def run():
    rng=np.random.default_rng(20261121)
    data=[test_mode(m,rng) for m in range(1,5)]
    for d in data:
        for key in ['car_fro_error','purity_error','H_hermiticity_error','P_projector_error','P_vs_Slater_error','ground_energy_error','C_antisymmetry_error']:
            assert d[key]<1e-11,(d['modes'],key,d[key])
        assert d['ground_multiplicity']==1 and abs(d['P_trace']-1)<1e-11
    return {'qualification':'finite-dimensional numerical CAR algebra sanity check, not Lean and not 24-mode dense realization',
     'Majorana_convention':'gamma=sqrt(2) theta; C_ab=(i/2)<[gamma_a,gamma_b]>; real C^2=-I',
     'quadratic_definition':'H(C)=-(i/4)*sum_ab C_ab gamma_a gamma_b = -(i/2)*sum_(a<b) C_ab gamma_a gamma_b',
     'fixed_spectrum':'-m/2+k, k=0,...,m; ground level -m/2 unique by irreducibility',
     'polynomial':'P(C)=prod_(k=1)^m[((k-m/2) I -H(C))/k]',
     'cases':data}

if __name__=='__main__':
    ans=run();p=Path(__file__).with_name('d1o_clifford_projector_results.json');p.write_text(json.dumps(ans,indent=2)+'\n')
    print(json.dumps(ans,indent=2))
