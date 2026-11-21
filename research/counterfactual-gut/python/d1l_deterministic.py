#!/usr/bin/env python3
"""Deterministic 2-eigenvalue Wishart quadrature for D1L SVD tube.
For real Gaussian 8x2 Y: x=alpha*r*tr(YtY) ~ Gamma(8,1),
w=((lambda1-lambda2)/(lambda1+lambda2))^2 ~ Beta(1,7/2), independent.
"""
import sys,json,math
from pathlib import Path
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import roots_jacobi,gammaln
import d1l_full_energy as d

def compute(R,alpha=d.SQ2,kappa=.5,tube_power=0.,nx=112,nw=24,nr=56,Cbeta=None):
    if Cbeta is None:Cbeta=d.beta_coeff()
    kn=kappa*R**(-tube_power)
    zr,wr=leggauss(nr); zr=1.5+zr/2;wr=wr/2
    zt,wt=leggauss(nx)
    zw,ww=roots_jacobi(nw,2.5,0.)
    wshape=(zw+1)/2;ww=ww/ww.sum()
    sqw=np.sqrt(wshape)[None,:]
    denom=0.;parts=np.zeros(3)
    for s,wrad in zip(zr,wr):
        r=R*s;chi,dl=d.radial_profile(s);a_cut=dl/R
        W=wrad*(r/R)**10*chi**2
        xmax=alpha*kn**2*r**3
        maxintegral=min(xmax,120.)
        x=(zt+1)*maxintegral/2
        w_x=wt*maxintegral/2*np.exp(7*np.log(x)-x-gammaln(8))
        t=x/(alpha*r)
        rho=np.sqrt(t)
        X=rho/(kn*r)
        eta,deta=d.smooth01(2*X-1)
        eta=1-eta;deta=-2*deta
        radial=0.5*(eta*(a_cut+4/r-alpha*t/2)-deta*X/r)**2
        trans=0.5*t*(-alpha*r*eta+deta/(kn*r*rho))**2
        l1=t[:,None]*(1+sqw)/2
        l2=t[:,None]*(1-sqw)/2
        det=l1*l2
        J=(1-l1/r**2)*(1-l2/r**2)
        f1=np.where(eta[:,None]>0,(r*r+l1)/(r*r-l1)**2,0.)
        f2=np.where(eta[:,None]>0,(r*r+l2)/(r*r-l2)**2,0.)
        scalar=radial[:,None]+trans[:,None]+eta[:,None]**2*(r*r*t[:,None]+det-8*d.SQ2*r)
        ferm=eta[:,None]**2*(6/r**2+3*(f1+f2))
        beta=eta[:,None]**2*(Cbeta/16)*(6/r**2+f1+f2)
        measure=w_x[:,None]*ww[None,:]*J
        Zn=np.sum(measure*eta[:,None]**2)
        scalarN=np.sum(measure*scalar)
        fermN=np.sum(measure*ferm)
        betaN=np.sum(measure*beta)
        denom+=W*Zn
        parts+=W*np.array([scalarN,fermN,betaN])
    return {"R":R,"alpha_ratio":alpha/d.SQ2,"kappa_eff":kn,
       "R2_E":R**2*sum(parts)/denom,
       "R2_parts":(R**2*parts/denom).tolist(),
       "quadrature":{"radial":nr,"trace":nx,"shape":nw}}

def main():
  C=d.beta_coeff()
  experiments=[]
  for r,p in [(10.,0.),(20.,0.),(40.,0.),(80.,0.),(160.,0.),
              (20.,1.),(40.,1.),(80.,1.),(160.,1.),
              (20.,1.5),(40.,1.5),(80.,1.5),(160.,1.5)]:
    for nx in (96,160,240):
      experiments.append(compute(r,tube_power=p,nx=nx,nw=24,nr=64,Cbeta=C))
  print(json.dumps(experiments,indent=2))
  with open(Path(__file__).resolve().parent / 'd1l_deterministic_results.json','w') as f:json.dump(experiments,f,indent=2)
if __name__=='__main__':main()
