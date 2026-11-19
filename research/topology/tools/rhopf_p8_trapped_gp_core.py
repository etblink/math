#!/usr/bin/env python3
"""RHOPF-P8: truly trapped GP fixed-population stationary-state numerical controls.

Independent 3D TWO-COMPONENT BOSONIC Gross--Pitaevskii field, not source BFSS
48-Majorana Fock dynamics, Spin(9) lift, protein/proton, or new atom model.

Uses an imaginary-time constrained minimization, not time evolution, to
prepare approximate stationary states, followed by real-time split-step GP
on a large periodic computational box. The harmonic trap confines densities
away from its periodic faces. All figures are dimensionless.
"""
import numpy as np
from scipy import fft as sfft


def domain(N=32, L=5.0, omega=.6):
    axis=(np.arange(N)-N//2)* (2*L/N)
    xyz=np.meshgrid(axis,axis,axis,indexing='ij')
    dx=2*L/N
    k=2*np.pi*sfft.fftfreq(N,dx)
    kmesh=np.meshgrid(k,k,k,indexing='ij')
    k2=sum(t*t for t in kmesh)
    V=.5*omega**2*sum(t*t for t in xyz)
    return xyz,dx,k2,V


def norm2(a,dx):return float(np.sum(np.abs(a)**2)*dx**3)

def normalize(a,dx,target):return a*np.sqrt(target/norm2(a,dx))


def init_two_lobes(xyz,dx,N1=50.,N2=50.,width=1.6,sep=.85):
    x,y,z=xyz
    a=np.exp(-((x-sep)**2+y*y+z*z)/(2*width**2)).astype(np.complex128)
    b=np.exp(-((x+sep)**2+y*y+z*z)/(2*width**2)).astype(np.complex128)
    return normalize(a,dx,N1),normalize(b,dx,N2)


def energy(a,b,dx,k2,V,g=2.,g12=3.5):
    n1=np.abs(a)**2;n2=np.abs(b)**2
    N=a.shape[0]
    fa=sfft.fftn(a,workers=1);fb=sfft.fftn(b,workers=1)
    T=float((np.sum(k2*(np.abs(fa)**2+np.abs(fb)**2)))*dx**3/(2*N**3))
    P=float(np.sum(V*(n1+n2))*dx**3)
    U=float(np.sum(.5*g*(n1*n1+n2*n2)+g12*n1*n2)*dx**3)
    ov=float(np.sum(n1*n2)*dx**3)
    face=np.zeros(a.shape,dtype=bool)
    for j in range(3):
        sl=[slice(None)]*3;sl[j]=0;face[tuple(sl)]=True
        sl[j]=-1;face[tuple(sl)]=True
    c1=float(np.sum(np.indices(n1.shape)[0]*n1)*dx**3/norm2(a,dx))
    c2=float(np.sum(np.indices(n2.shape)[0]*n2)*dx**3/norm2(b,dx))
    return {'E':T+P+U,'kinetic':T,'trap':P,'contact':U,'overlap':ov,
            'N1':norm2(a,dx),'N2':norm2(b,dx),'min_total_grid_density':float(np.min(n1+n2)),
            'boundary_max_abs_amplitude':float(max(np.max(np.abs(a[face])),np.max(np.abs(b[face])))),
            'separation_center_x_grid_steps':c1-c2}


def gp_operator(a,b,k2,V,g=2.,g12=3.5):
    Ta=sfft.ifftn(.5*k2*sfft.fftn(a,workers=1),workers=1)
    Tb=sfft.ifftn(.5*k2*sfft.fftn(b,workers=1),workers=1)
    n1=np.abs(a)**2;n2=np.abs(b)**2
    return Ta+(V+g*n1+g12*n2)*a,Tb+(V+g*n2+g12*n1)*b


def stationary_residual(a,b,dx,k2,V,g=2.,g12=3.5):
    ha,hb=gp_operator(a,b,k2,V,g,g12)
    mu1=float(np.vdot(a,ha).real*dx**3/norm2(a,dx))
    mu2=float(np.vdot(b,hb).real*dx**3/norm2(b,dx))
    e1=float(np.sqrt(norm2(ha-mu1*a,dx)/norm2(a,dx)))
    e2=float(np.sqrt(norm2(hb-mu2*b,dx)/norm2(b,dx)))
    return {'mu1':mu1,'mu2':mu2,'residual1':e1,'residual2':e2,'max_residual':max(e1,e2)}


def imaginary_time_step(a,b,dt,k2,V,dx,N1,N2,g=2.,g12=3.5):
    kinetic=np.exp(-.25*dt*k2)
    a=sfft.ifftn(kinetic*sfft.fftn(a,workers=1),workers=1)
    b=sfft.ifftn(kinetic*sfft.fftn(b,workers=1),workers=1)
    n1=np.abs(a)**2;n2=np.abs(b)**2
    a=a*np.exp(-dt*(V+g*n1+g12*n2))
    b=b*np.exp(-dt*(V+g*n2+g12*n1))
    a=sfft.ifftn(kinetic*sfft.fftn(a,workers=1),workers=1)
    b=sfft.ifftn(kinetic*sfft.fftn(b,workers=1),workers=1)
    return normalize(a,dx,N1),normalize(b,dx,N2)


def prepare_stationary(a,b,dx,k2,V,N1,N2,g=2.,g12=3.5,dt=.025,max_iter=1400,record_every=100):
    traces=[]
    for k in range(max_iter+1):
        if k%record_every==0 or k==max_iter:
            e=energy(a,b,dx,k2,V,g,g12)
            e.update(stationary_residual(a,b,dx,k2,V,g,g12))
            e['it']=k
            traces.append(e)
        if k<max_iter:
            a,b=imaginary_time_step(a,b,dt,k2,V,dx,N1,N2,g,g12)
    return a,b,traces


def real_step(a,b,dt,k2,V,g=2.,g12=3.5):
    kin=np.exp(-.25j*dt*k2)
    a=sfft.ifftn(kin*sfft.fftn(a,workers=1),workers=1)
    b=sfft.ifftn(kin*sfft.fftn(b,workers=1),workers=1)
    n1=np.abs(a)**2;n2=np.abs(b)**2
    a=a*np.exp(-1j*dt*(V+g*n1+g12*n2))
    b=b*np.exp(-1j*dt*(V+g*n2+g12*n1))
    a=sfft.ifftn(kin*sfft.fftn(a,workers=1),workers=1)
    b=sfft.ifftn(kin*sfft.fftn(b,workers=1),workers=1)
    return a,b


def evolve(a,b,dx,k2,V,dt=.005,t_end=.3,g=2.,g12=3.5,record_step=20):
    steps=round(t_end/dt)
    assert abs(steps*dt-t_end)<1e-12
    out=[]
    for i in range(steps+1):
        if i%record_step==0 or i==steps:
            e=energy(a,b,dx,k2,V,g,g12)
            e['t']=i*dt
            out.append(e)
        if i<steps:a,b=real_step(a,b,dt,k2,V,g,g12)
    return a,b,out


def amplitude_disturbance(a,b,xyz,dx,N1,N2,epsilon=.035):
    x,y,z=xyz
    bump=(x*z+y*z+.3*x*y)*np.exp(-.24*(x*x+y*y+z*z))
    ap=normalize(a*(1+epsilon*bump),dx,N1)
    bp=normalize(b*(1-epsilon*bump),dx,N2)
    return ap,bp


def opposite_periodic_displacement(a,b,xyz,L,dx,N1,N2,eps):
    """Smooth periodic anti-symmetric displacement; exactly fixes each Nj."""
    shape=np.sin(np.pi*xyz[0]/L)
    return (normalize(a*(1+eps*shape),dx,N1),
            normalize(b*(1-eps*shape),dx,N2))


def symmetric_mixture_curvature(phi,xyz,dx,k2,V,g=2.,g12=3.5):
    """EXACT analytic d²E/deps² at zero for an even phi and odd sine mode.

    The path is psi_(+/-) = phi*(1 +/- eps*f)/sqrt(1+eps²*q),
    q=integral(phi² f²)/integral(phi²). On a symmetric periodic grid the
    energy is a rational function of eps². Returns its exact second derivative
    in the discretized Fourier GP functional, not a full BdG/Hessian spectrum.
    """
    N=phi.shape[0]
    f=np.sin(np.pi*xyz[0]/(N*dx/2))
    integrate=lambda a:float(np.sum(a)*dx**3)
    spectral_grad2=lambda a:float(np.sum(k2*np.abs(sfft.fftn(a,workers=1))**2)*dx**3/N**3)
    n=np.abs(phi)**2
    q=integrate(n*f*f)/integrate(n)
    K0=spectral_grad2(phi)+2*integrate(V*n)
    K2=spectral_grad2(phi*f)+2*integrate(V*n*f*f)
    I0=(g+g12)*integrate(n*n)
    I2=(6*g-2*g12)*integrate(n*n*f*f)
    I4=(g+g12)*integrate(n*n*f**4)
    second=2*(K2-q*K0+I2-2*q*I0)
    return {'d2E_d_epsilon2':second,'q_population_normalizer':q,
            'kinetic_trap_K0':K0,'kinetic_trap_K2':K2,
            'contact_I0':I0,'contact_I2':I2,'contact_I4':I4,
            'E_at_zero':K0+I0}


def hopf_imprinted_trap(xyz,dx,N1=50.,N2=50.,profile_radius=2.,envelope_width=2.5):
    """Chosen source-gamma complex Hopf imprint, not BFSS source dynamics."""
    from rhopf_p6_gp_dynamics_core import source_hopf_profile
    a,b,r=source_hopf_profile(*xyz,R=profile_radius)
    amp=np.exp(-.5*(r/envelope_width)**2)
    return normalize(a*amp,dx,N1),normalize(b*amp,dx,N2),r


def axial_core_filling(a,b,r,dx,N1,N2,eps=.08,width=2.):
    """Challenge an axisymmetric vortex imprint by breaking its core zero."""
    bump=np.exp(-.5*(r/width)**2)
    return normalize(a+eps*bump,dx,N1), normalize(b,dx,N2)
