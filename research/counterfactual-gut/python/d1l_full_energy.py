#!/usr/bin/env python3
"""D1L adversarial SVD-tube BFSS trial-form prescreen.

No huge Fock matrix. Uses source-anchored exact massless Gaussian expectation,
SVD metric/Jacobian, analytic Wishart control variates, Sobol gaussian samples.
Only a variational *model* until literal source GaugeData/SmoothCore qualification.
"""
import json, math
import numpy as np
from scipy.integrate import quad
from scipy.special import expit, ndtri
from scipy.stats import qmc
from numpy.polynomial.legendre import leggauss

SQ2=math.sqrt(2.0)

def smooth01(x):
    x=np.asarray(x)
    v=np.clip(x,1e-12,1-1e-12)
    eta=expit(-1/v+1/(1-v))
    derivative=eta*(1-eta)*(1/v**2+1/(1-v)**2)
    return np.where(x<=0,0.,np.where(x>=1,1.,eta)),np.where((x>0)&(x<1),derivative,0.)

def beta_coeff(lo=0.15,width=0.45):
    def beta(z):
        p,d=smooth01((z-lo)/width)
        return float(p),float(d/width)
    den=quad(lambda z:(1-z*z)**3*beta(z)[0]**2,-1,1,epsabs=2e-13,points=[lo,lo+width])[0]
    num=quad(lambda z:(1-z*z)**4*beta(z)[1]**2,-1,1,epsabs=2e-13,points=[lo,lo+width])[0]
    return num/den

def radial_profile(s):
    l=-1/(s-1)-1/(2-s)
    chi=math.exp(l)
    dlog=1/(s-1)**2-1/(2-s)**2
    return chi,dlog

def exact_moments(r,a):
    """Gaussian Y 8x2, var 1/(2*a*r); j=1-tr(YtY)/r^2+det(YtY)/r^4."""
    v=1/(2*a*r)
    t=16*v; t2=288*v*v; t3=5760*v**3
    d=56*v*v; td=1120*v**3; t2d=24640*v**4; d2=5040*v**4
    Z=1-t/r**2+d/r**4
    Eb=4/r*Z-a/2*(t-t2/r**2+td/r**4)
    Eb2=16/r**2*Z-4*a/r*(t-t2/r**2+td/r**4)+a*a/4*(t2-t3/r**2+t2d/r**4)
    Ejt=t-t2/r**2+td/r**4
    Ejd=d-td/r**2+d2/r**4
    return Z,Eb,Eb2,Ejt,Ejd

def make_samples(m=14,seed=20261121):
    x=qmc.Sobol(d=16,scramble=True,seed=seed).random_base2(m)
    y=ndtri(np.clip(x,1e-14,1-1e-14)).reshape((-1,8,2))
    aa=np.sum(y[:,:,0]**2,axis=1)
    bb=np.sum(y[:,:,1]**2,axis=1)
    cc=np.sum(y[:,:,0]*y[:,:,1],axis=1)
    trace=aa+bb
    disc=np.sqrt((aa-bb)**2+4*cc*cc)
    # Return eigenvalues of Y0^T Y0 with iid standard normals.
    return trace, (trace+disc)/2, (trace-disc)/2

def energy(R,alpha=SQ2,kappa=0.5,m=14,seed=20261121,radial_n=64,Cbeta=None, tube_power=0):
    # If tube_power>0, kappa(R)=kappa * R^(-tube_power), restricted <=1.
    if Cbeta is None:Cbeta=beta_coeff()
    trace0,l10,l20=make_samples(m,seed)
    nodes,ws=leggauss(radial_n)
    ss=1.5+0.5*nodes
    ww=0.5*ws
    kappa_eff=kappa*R**(-tube_power)
    den=0.; num_s=0.;num_f=0.;num_beta=0.;num_rad=0.
    n_tube=0
    for s,w in zip(ss,ww):
        r=R*s;chi,dl=radial_profile(s)
        wt=w*R**11*s**10*chi**2
        if wt==0:continue
        ar=dl/R
        v=1/(2*alpha*r)
        tr=trace0*v; l1=l10*v;l2=l20*v
        det=l1*l2
        j=(1-l1/r**2)*(1-l2/r**2)
        x=np.sqrt(tr)/(kappa_eff*r)
        eta,deta=smooth01(2*x-1)
        eta=1-eta
        deta=-2*deta
        troot=np.sqrt(np.maximum(tr,1e-200))
        b=4/r-alpha*tr/2
        A=ar+b
        kin_rad=0.5*(eta*A-deta*x/r)**2
        kin_y=0.5*tr*(-alpha*r*eta+deta/(kappa_eff*r*troot))**2
        scalar=kin_rad+kin_y+eta**2*(r*r*tr+det-8*SQ2*r)
        scalar0=0.5*A*A+(alpha*alpha/2+1)*r*r*tr+det-8*SQ2*r
        Z,Eb,Eb2,Ejt,Ejd=exact_moments(r,alpha)
        scalar0_expect=(0.5*Eb2+ar*Eb+0.5*ar*ar*Z+
                        (alpha*alpha/2+1)*r*r*Ejt+Ejd-8*SQ2*r*Z)
        scalar_expect=scalar0_expect+np.mean(j*(scalar-scalar0))
        Norm=Z+np.mean(j*(eta**2-1))
        # Avoid chart singularities when eta=0, by setting invalid denominators to 1.
        valid=eta>0
        f1=np.divide(r*r+l1,np.where(valid,(r*r-l1)**2,1),out=np.zeros_like(l1),where=valid)
        f2=np.divide(r*r+l2,np.where(valid,(r*r-l2)**2,1),out=np.zeros_like(l2),where=valid)
        E_f=np.mean(j*eta**2*(6/r**2+3*(f1+f2)))
        E_beta=np.mean(j*eta**2*(Cbeta/16)*(6/r**2+f1+f2))
        den+=wt*Norm
        num_s+=wt*scalar_expect
        num_f+=wt*E_f
        num_beta+=wt*E_beta
        num_rad+=wt*(0.5*ar**2*Z+ar*Eb) # for audit only, exact untruncated
        n_tube+=int(np.count_nonzero((eta>0)&(eta<1)))
    return {
      "R":R,"alpha_over_optimum":alpha/SQ2,"kappa_effective":kappa_eff,
      "E_total":(num_s+num_f+num_beta)/den,
      "R2_E_total":R**2*(num_s+num_f+num_beta)/den,
      "E_scalar":num_s/den,"E_fermion_angular":num_f/den,
      "E_spatial_cutoff":num_beta/den,
      "R2_scalar":R**2*num_s/den,
      "R2_fermion_angular":R**2*num_f/den,
      "R2_spatial_cutoff":R**2*num_beta/den,
      "tube_transition_samples_over_radial_nodes":n_tube,
      "samples_per_node":2**m
    }

def leading_coefficient(Cbeta):
    # Independent Gauss-Legendre on radial t and gaussian moments, not fitted.
    def i(power,typ):
      def ff(t):
        chi,dl=radial_profile(t)
        return t**power*chi**2*(dl**2 if typ=="cut" else 1)
      return quad(ff,1,2,epsabs=1e-13,epsrel=1e-12,limit=300)[0]
    i10=i(10,'n'); i8=i(8,'n')
    return {"I8_over_I10":i8/i10,
      "radial_cutoff":0.5*i(10,'cut')/i10,
      "fermionic_angular":12*i8/i10,
      "spatial_cutoff":0.5*Cbeta*i8/i10,
      "K":(0.5*i(10,'cut')+(12+Cbeta/2)*i8)/i10}

def run():
    C=beta_coeff()
    K=leading_coefficient(C)
    base=[energy(R,Cbeta=C) for R in (8.,10.,20.,40.,80.,160.)]
    offsets=[energy(40.,alpha=SQ2*(1+e),Cbeta=C,m=13) for e in (-.1,-.03,-.01,0.,.01,.03,.1)]
    tube=[energy(16.,kappa=k,Cbeta=C,m=14) for k in (.2,.3,.5,.7)]
    checks=[energy(20.,Cbeta=C,m=12,seed=7),energy(20.,Cbeta=C,m=14,seed=11),energy(20.,Cbeta=C,m=16,seed=13)]
    out={"kind":"D1L numerical scalar+angular SVD-tube model, not a source-qualified form bound",
      "source":"D1H-D1I Gamma9, 16 transverse, SVD Jacobian, original massless expectation",
      "Cbeta":C,"asymptotic":K,"R_scan":base,"width_scan_R40":offsets,
      "tube_scan_R16":tube,"qmc_convergence_R20":checks,
      "warning":"Do not use QMC for tubes with small surviving Gaussian mass; see deterministic eigenvalue quadrature."}
    with open('/mnt/data/d1l/d1l_results.json','w') as f:json.dump(out,f,indent=2)
    print(json.dumps(out,indent=2))
if __name__=='__main__':run()
