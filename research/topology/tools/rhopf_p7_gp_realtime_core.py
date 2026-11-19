#!/usr/bin/env python3
"""RHOPF-P7: actual two-component GP time integration, no BFSS dynamics.

Split-step Strang Fourier on T^3 (periodic box), fixed independent U(1)
species charges and near-preserved Hamiltonian energy. Compares equal-coupling
GP with immiscible g12>sqrt(g11*g22). No claim of topological stability,
trapped equilibrium, original 48-Majorana Fock coupling or physical proton.
"""
import numpy as np
from rhopf_p6_gp_dynamics_core import source_hopf_profile, GAMMA_SOURCE_BLOB


def setup(N=48,L=5.,R=2.):
    assert N%2==0 and N>=24 and L>2*R
    dx=2*L/N
    axis=np.arange(N)*dx-L
    xyz=np.meshgrid(axis,axis,axis,indexing='ij')
    a,b,r=source_hopf_profile(*xyz,R=R)
    k=2*np.pi*np.fft.fftfreq(N,d=dx)
    k3=np.meshgrid(k,k,k,indexing='ij')
    k2=sum(t*t for t in k3)
    return (a,b), (dx,k3,k2,xyz,r)


def gp_energy(a,b,dx,k2,g=2.,g12=2.):
    # Ekin = (dV/(2*Npoints)) Σ k²(|FFT a|²+|FFT b|²).
    N=a.shape[0]
    fa=np.fft.fftn(a);fb=np.fft.fftn(b)
    kinetic=.5*dx**3/N**3*float(np.sum(k2*(np.abs(fa)**2+np.abs(fb)**2)))
    n1=np.abs(a)**2;n2=np.abs(b)**2
    density=n1+n2
    pot=(g/2)*(density-1)**2+(g12-g)*n1*n2
    return {'kinetic':kinetic,'potential':float(np.sum(pot)*dx**3),
      'energy':kinetic+float(np.sum(pot)*dx**3),
      'N1':float(np.sum(n1)*dx**3),'N2':float(np.sum(n2)*dx**3),
      'min_density':float(np.min(density)),'max_density':float(np.max(density)),
      'overlap':float(np.sum(n1*n2)*dx**3)}


def strang_step(a,b,dt,k2,g=2.,g12=2.):
    # Each phase step individually preserves species L2, and Fourier kinetic
    # evolution is unitary. This is a time-discretized solution of the GP PDE,
    # NOT an exactly energy-conserving algorithm.
    kinphase=np.exp(-0.25j*dt*k2)
    a=np.fft.ifftn(kinphase*np.fft.fftn(a))
    b=np.fft.ifftn(kinphase*np.fft.fftn(b))
    n1=np.abs(a)**2;n2=np.abs(b)**2
    common=g*(n1+n2-1)
    delta=g12-g
    a=a*np.exp(-1j*dt*(common+delta*n2))
    b=b*np.exp(-1j*dt*(common+delta*n1))
    a=np.fft.ifftn(kinphase*np.fft.fftn(a))
    b=np.fft.ifftn(kinphase*np.fft.fftn(b))
    return a,b


def winding_estimate(a,b,dx,k3):
    """Approximate (1/vol S3)∫det(n,dx n,dy n,dz n) dV for T3→S3.

    Only meaningful if min total density is safely away from zero. Uses
    Fourier spectral derivatives; convergence must be assessed separately.
    """
    d=np.abs(a)**2+np.abs(b)**2
    if float(np.min(d))<1.e-4:
        return None
    norm=np.sqrt(d)
    v=np.stack([a.real/norm,a.imag/norm,b.real/norm,b.imag/norm],axis=-1)
    derivatives=[]
    for j in range(3):
        derivatives.append(np.stack([np.fft.ifftn(1j*k3[j]*np.fft.fftn(v[...,i])).real
          for i in range(4)],axis=-1))
    mat=np.stack([v,*derivatives],axis=-2)
    signed=float(np.sum(np.linalg.det(mat))*dx**3/(2*np.pi**2))
    return signed


def boundary_deviation(a,b,r,halfwidth=5.):
    N=a.shape[0]
    mask=np.zeros(a.shape,dtype=bool)
    for axis in range(3):
        sl=[slice(None)]*3
        sl[axis]=0;mask[tuple(sl)]=True
        sl[axis]=-1;mask[tuple(sl)]=True
    return float(max(np.max(np.abs(a[mask])),np.max(np.abs(b[mask]-1))))


def run_case(N=48,L=5.,dt=.005,t_end=.6,g12=2.,output_every=20):
    (a,b),(dx,k3,k2,xyz,r)=setup(N=N,L=L)
    steps=round(t_end/dt)
    assert abs(steps*dt-t_end)<1e-12
    diagnostics=[]
    baseline=None
    for k in range(steps+1):
        if k%output_every==0 or k==steps:
            e=gp_energy(a,b,dx,k2,g12=g12)
            if baseline is None:baseline=e
            e['t']=float(k*dt)
            e['relative_energy_error']=(e['energy']-baseline['energy'])/baseline['energy']
            e['relative_N1_error']=(e['N1']-baseline['N1'])/baseline['N1']
            e['relative_N2_error']=(e['N2']-baseline['N2'])/baseline['N2']
            e['signed_S3_degree_approx']=winding_estimate(a,b,dx,k3)
            e['periodic_face_deviation_from_vacuum']=boundary_deviation(a,b,r)
            diagnostics.append(e)
        if k!=steps:a,b=strang_step(a,b,dt,k2,g12=g12)
    return {'N':N,'L':L,'dt':dt,'steps':steps,'t_end':t_end,
      'g11':2.,'g22':2.,'g12':g12,'grid_dx':dx,'diagnostics':diagnostics}
