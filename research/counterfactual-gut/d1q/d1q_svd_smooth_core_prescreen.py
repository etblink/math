#!/usr/bin/env python3
"""D1Q: SVD quotient / source-color / smooth squared-tube cutoff prescreen.

This is a finite-dimensional differential/geometry test. It is NOT a Lean
TestFunction construction or proof of original BFSS physical form domain.
"""
import json
import math
from pathlib import Path
from functools import reduce
import numpy as np

I=np.eye(2); J=np.array([[0.,1.],[-1.,0.]]); X2=np.array([[0.,1.],[1.,0.]]); Z=np.diag([1.,-1.]);
WORDS=['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']
PART={'I':I,'J':J,'X':X2,'Z':Z}
G=np.stack([reduce(np.kron,(PART[q] for q in w)) for w in WORDS]); JP=np.kron(np.eye(8),J)
EPS=np.zeros((3,3,3));
for a,b,c in [(0,1,2),(1,2,0),(2,0,1)]: EPS[a,b,c]=1;EPS[a,c,b]=-1

def normalize(x): return x/np.linalg.norm(x)
def makeJ(n):return np.einsum('a,abc->bc',n,EPS)
def gamma(u):return np.einsum('i,ijk->jk',u,G)
def cov(u,n):return -np.kron(gamma(u),makeJ(n))-np.kron(JP,np.outer(n,n))
def dc(u,n,du,dn):
    return -np.kron(gamma(du),makeJ(n))-np.kron(gamma(u),makeJ(dn))-np.kron(JP,np.outer(dn,n)+np.outer(n,dn))
def chart(A):
    U,s,VT=np.linalg.svd(A,full_matrices=False)
    r=s[0];u=U[:,0];n=VT[0,:];Y=A-r*np.outer(u,n)
    return r,u,n,Y,s

def derivatives(A,H):
    r,u,n,Y,s=chart(A)
    B=np.block([[r*np.eye(9),-Y],[-Y.T,r*np.eye(3)]])
    aa=H@n-u*(u@H@n);bb=H.T@u-n*(u@H@n)
    z=np.linalg.solve(B,np.r_[aa,bb]);return z[:9],z[9:]

def random_so3(rng):
    U,R=np.linalg.qr(rng.normal(size=(3,3)));U=U@np.diag(np.sign(np.diag(R)))
    if np.linalg.det(U)<0:U[:,0]*=-1
    return U

def chart_rand(rng,ratio):
    u=normalize(rng.standard_normal(9));n=normalize(rng.standard_normal(3))
    Y=(np.eye(9)-np.outer(u,u))@rng.standard_normal((9,3))@(np.eye(3)-np.outer(n,n))
    Y*=ratio/np.linalg.norm(Y,ord='fro');r=7.7
    return r*np.outer(u,n)+r*Y

def flatstep(z):
    if z<=0:return 0.
    if z>=1:return 1.
    a=math.exp(-1/z);b=math.exp(-1/(1-z));return a/(a+b)

def flatstep_prime(z):
    if z<=0 or z>=1:return 0.
    ss=flatstep(z)
    return ss*(1-ss)*(1/z**2+1/(1-z)**2)

def cutoff_gradient(A,R=6.,k=.5):
    """Analytic gradient of the smooth scalar shell/tube multiplier."""
    r,u,n,Y,s=chart(A);tt=float(np.sum(Y*Y))
    rho=tt/(k*k*r*r)
    ss=r/R
    if 1<ss<2:
        chi=math.exp(-1/(ss-1)-1/(2-ss))
        chiprime=chi*(1/(ss-1)**2-1/(2-ss)**2)/R
    else:chi=0.;chiprime=0.
    zz=(rho-.25)/.75
    eta=1-flatstep(zz)
    etap=-flatstep_prime(zz)/.75
    dr=np.outer(u,n)
    gradrho=2*Y/(k*k*r*r)-2*tt/(k*k*r**3)*dr
    return eta*chiprime*dr+chi*etap*gradrho

def cutoff(A,R=6.,k=.5):
    r,u,n,Y,s=chart(A);tt=np.sum(Y*Y)/(k*k*r*r)
    ss=r/R
    chi=math.exp(-1/(ss-1)-1/(2-ss)) if 1<ss<2 else 0.
    eta=1-flatstep((tt-.25)/.75)
    return chi*eta,chi,eta,tt

def run():
    rng=np.random.default_rng(20261121);errors={key:0. for key in [
     'deck_C','gauge_C','gauge_scalar','reconstructed_X','C_finite_difference',
     'du_bound_excess','cutoff_zero_outside',
     'spectral_gap_lower_bound_excess','zero_on_degeneracy_neighborhood',
     'cutoff_gradient_finite_difference','gauge_cutoff_gradient',
     'covariance_derivative_upper_bound_excess']}
    ntest=70;K=.5
    for _ in range(ntest):
        A=chart_rand(rng,.01+.43*rng.random());r,u,n,Y,s=chart(A)
        errors['reconstructed_X']=max(errors['reconstructed_X'],np.linalg.norm(A-r*np.outer(u,n)-Y))
        errors['deck_C']=max(errors['deck_C'],np.linalg.norm(cov(u,n)-cov(-u,-n)))
        O=random_so3(rng);A2=A@O.T
        rr,uu,nn,YY,ss=chart(A2)
        T=np.kron(np.eye(16),O)
        errors['gauge_C']=max(errors['gauge_C'],np.linalg.norm(cov(uu,nn)-T@cov(u,n)@T.T))
        errors['gauge_scalar']=max(errors['gauge_scalar'],abs(cutoff(A,6.,K)[0]-cutoff(A2,6.,K)[0]))
        sigma=float(np.linalg.norm(Y,ord=2));assert sigma<K*r
        errors['spectral_gap_lower_bound_excess']=max(errors['spectral_gap_lower_bound_excess'],max(0.,(1-K)*r-(r-sigma)))
        H=rng.standard_normal((9,3));H/=np.linalg.norm(H)
        du,dn=derivatives(A,H)
        # Pair derivative bound from 12x12 SVD block matrix singular value >= r-sigma.
        bnd=math.sqrt(2)*np.linalg.norm(H)/(r-sigma)
        errors['du_bound_excess']=max(errors['du_bound_excess'],max(0.,np.linalg.norm(np.r_[du,dn])-bnd))
        eps=1e-5;Cplus=cov(*chart(A+eps*H)[1:3]);Cminus=cov(*chart(A-eps*H)[1:3])
        dcalc=dc(u,n,du,dn)
        c_bound=8*math.sqrt(5)*np.linalg.norm(H)/(r-sigma)
        errors['covariance_derivative_upper_bound_excess']=max(errors['covariance_derivative_upper_bound_excess'],max(0.,np.linalg.norm(dcalc)-c_bound))
        errors['C_finite_difference']=max(errors['C_finite_difference'],np.linalg.norm(dcalc-(Cplus-Cminus)/(2*eps)))
        grad=cutoff_gradient(A,6.,K)
        fd=(cutoff(A+eps*H,6.,K)[0]-cutoff(A-eps*H,6.,K)[0])/(2*eps)
        errors['cutoff_gradient_finite_difference']=max(errors['cutoff_gradient_finite_difference'],abs(fd-np.sum(grad*H)))
        errors['gauge_cutoff_gradient']=max(errors['gauge_cutoff_gradient'],np.linalg.norm(cutoff_gradient(A2,6.,K)-grad@O.T))
    # Check flat zero extension beyond tube and across r/R support, and near singular-value degeneracy.
    u=np.eye(9)[0];n=np.eye(3)[0];Y=np.zeros((9,3));Y[1,1]=1
    e=np.zeros((9,3));e[1,1]=1
    outer=np.outer(u,n)
    for rho in [1.001,1.02,1.10]:
        A=9*outer+(K*9*rho)*e
        errors['cutoff_zero_outside']=max(errors['cutoff_zero_outside'],abs(cutoff(A,6.,K)[0]))
    for rr in [0.99999*6,1.00001*12,2.0,50.]:
        A=rr*outer+0.1*e
        if not 6<rr<12:errors['cutoff_zero_outside']=max(errors['cutoff_zero_outside'],abs(cutoff(A,6.,K)[0]))
    for rr in [6.5,9.0,11.0]:
        # two large singular values: s0/r ~ s1/r => outside tube, identically zero
        A=rr*outer+rr*.85*e
        if abs(cutoff(A,6.,K)[0])>1e-14:errors['zero_on_degeneracy_neighborhood']+=1
    # Direct gradient continuity at the physical cutoff from two sides (sample near the tube face)
    amp_results=[]
    for d in [.04,.02,.01,.005]:
        Ain=9*outer+K*9*(1-d)*e
        Aout=9*outer+K*9*(1+d)*e
        amp_results.append({'relative_distance_to_tube_boundary':d,
                            'inside_amplitude':cutoff(Ain,6.,K)[0],
                            'outside_amplitude':cutoff(Aout,6.,K)[0]})
    assert errors['deck_C']<1e-12
    assert errors['gauge_C']<1e-12
    assert errors['gauge_scalar']<1e-12
    assert errors['C_finite_difference']<2e-8
    assert errors['cutoff_gradient_finite_difference']<2e-8 and errors['gauge_cutoff_gradient']<1e-12
    assert errors['du_bound_excess']<1e-12 and errors['cutoff_zero_outside']<1e-14
    assert errors['covariance_derivative_upper_bound_excess']<1e-12
    return {'status':'PASS','seed':20261121,'cases':ntest,'kappa':K,'max_errors':errors,
       'near_tube_face':amp_results,
       'analytic_geometry':'simple top SVD r,s; Y orthogonal u and n; ||Y||<kappa*r gives gap r-sigma2 >=(1-kappa)r; two orientations identified as (u,n,Y)~(-u,-n,Y)',
       'covariance_derivative_bound':'||dC_X(H)||_F <= 8 sqrt(5) ||H||_F / (r-sigma2) <= 8 sqrt(5) ||H||_F / ((1-kappa) r)',
       'squared_cutoff_gradient':'grad rho = 2Y/(kappa^2 r^2) - 2||Y||^2 un^T/(kappa^2 r^3), rho=||Y||^2/(kappa^2 r^2)',
       'analytic_support':'r in [R,2R], ||Y||<=kappa*r implies norm(X)^2=r^2+norm(Y)^2 <=4(1+kappa^2)R^2; zero extension near SVD degeneracy',
       'new_cutoff':'eta(norm(Y)^2/(kappa^2 r^2)) with eta identically 1 on [0,1/4], identically zero on [1,infinity), C_infinity flat endpoints',
       'qualification':'source-oriented bosonic geometry and scalar cutoff tests; does not implement source Fermion 2 smooth section or Lean TestFunction'}

if __name__=='__main__':
    out=run();Path(__file__).with_name('d1q_svd_smooth_core_prescreen_results.json').write_text(json.dumps(out,indent=2)+'\n');print(out['status'],out['max_errors'])
