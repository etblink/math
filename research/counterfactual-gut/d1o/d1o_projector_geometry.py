#!/usr/bin/env python3
"""D1O 6-complex-mode (two spin pairs × three colors) finite-CAR geometry.

Reduced original Gamma7/Gamma8 block checks D1M covariance metric against
rank-one Fock projector derivatives. It cannot establish full 24-mode result.
"""
import json
from pathlib import Path
import numpy as np
from d1o_clifford_projector import operators, covariance, quadratic, ground_polynomial

m=6
a,create,gamma=operators(m)
SQ2=np.sqrt(2.0)
J=np.array([[0,1],[-1,0]],float)
Jpair=np.kron(np.eye(2),J)
Gbase=np.diag([1.,1.,-1.,-1.])
Gt=np.block([[np.zeros((2,2)),np.eye(2)],[np.eye(2),np.zeros((2,2))]])
assert np.linalg.norm(Gbase@Gt+Gt@Gbase)==0
Eps=np.zeros((3,3,3))
for i,j,k in [(0,1,2),(1,2,0),(2,0,1)]:Eps[i,j,k]=1;Eps[i,k,j]=-1

def matJ(n):return np.einsum('a,abc->bc',n,Eps)

def Cgeom(ang,n):
    Gu=np.cos(ang)*Gbase+np.sin(ang)*Gt
    jc=matJ(n)
    C=np.zeros((12,12))
    for jr in range(4):
      for js in range(4):
        for x in range(3):
          for y in range(3):
            for q in range(2):
              for w in range(2):
                i=2*(3*(jr//2)+x)+q
                k=2*(3*(js//2)+y)+w
                if jr%2==q and js%2==w:
                    C[i,k]=-Gu[jr,js]*jc[x,y]-Jpair[jr,js]*n[x]*n[y]
    return C

def Cder(ang,n,du,dn):
    Gu=np.cos(ang)*Gbase+np.sin(ang)*Gt
    dGu=(-np.sin(ang)*Gbase+np.cos(ang)*Gt)*du
    dJ=matJ(dn);jc=matJ(n)
    C=np.zeros((12,12))
    for jr in range(4):
      for js in range(4):
        for x in range(3):
          for y in range(3):
            for q in range(2):
              for w in range(2):
                i=2*(3*(jr//2)+x)+q
                k=2*(3*(js//2)+y)+w
                if jr%2==q and js%2==w:
                    C[i,k]=-dGu[jr,js]*jc[x,y]-Gu[jr,js]*dJ[x,y]-Jpair[jr,js]*(dn[x]*n[y]+n[x]*dn[y])
    return C

def run():
    n=np.array([1.,0.,0.])
    C=Cgeom(0,n)
    vac=np.zeros(2**m,complex);vac[0]=1
    b0=(create[1]+1j*create[2])/SQ2
    b1=(create[4]-1j*create[5])/SQ2
    psi=b0@b1@vac
    assert abs(np.vdot(psi,psi)-1)<1e-12
    Cstate=covariance(gamma,psi)
    P=ground_polynomial(quadratic(C,gamma),m)
    H=quadratic(C,gamma)
    Ptrue=np.outer(psi,psi.conj())
    assert np.linalg.norm(C-Cstate)<1e-12
    assert np.linalg.norm(P-Ptrue)<1e-12
    h=5e-5
    def Px(angle,n):return ground_polynomial(quadratic(Cgeom(angle,n),gamma),m)
    nu=np.array([0.,1.,0.]);nw=np.array([0.,0.,1.])
    def sp(x):return np.cos(x)*n+np.sin(x)*nu
    def sw(x):return np.cos(x)*n+np.sin(x)*nw
    dPu=(Px(h,n)-Px(-h,n))/(2*h)
    dPn=(Px(0,sp(h))-Px(0,sp(-h)))/(2*h)
    dPw=(Px(0,sw(h))-Px(0,sw(-h)))/(2*h)
    dCu=Cder(0,n,1,np.zeros(3))
    dCn=Cder(0,n,0,nu)
    dCw=Cder(0,n,0,nw)
    def fsg(Pd):return float(np.real(np.trace(Pd.conj().T@Pd))/2)
    def fsgC(Cd):return float(np.sum(Cd*Cd)/16)
    def cross(A,B):return float(np.real(np.trace(A.conj().T@B))/2)
    curvature=float(abs(1j*np.trace(P@(dPu@dPn-dPn@dPu))))
    errs=[abs(fsg(dPu)-fsgC(dCu)),abs(fsg(dPn)-fsgC(dCn)),abs(fsg(dPw)-fsgC(dCw))]
    out={'qualification':'finite exact-carrier reduced 6-mode Fock projector geometry finite-difference check; not full 24 modes or Lean',
       'source_analogue':'two original Gamma8 spin-pair signs + and -, and 3 color orbitals per pair',
       'reference_C_vs_Fock_error':float(np.linalg.norm(C-Cstate)),
       'reference_P_vs_Fock_error':float(np.linalg.norm(P-Ptrue)),
       'purity_error':float(np.linalg.norm(C@C+np.eye(12))),
       'H_ground_energy':float(np.real(np.vdot(psi,H@psi))),
       'source_C_FS_metric_spatial':fsgC(dCu),'projector_FS_metric_spatial':fsg(dPu),
       'source_C_FS_metric_color1':fsgC(dCn),'projector_FS_metric_color1':fsg(dPn),
       'source_C_FS_metric_color2':fsgC(dCw),'projector_FS_metric_color2':fsg(dPw),
       'max_FS_metric_difference':max(errs),
       'FS_mixed_term':cross(dPu,dPn),'Berry_curvature_spatial_color_abs':curvature,
       'P_smooth_finite_difference_norm':float(np.linalg.norm(dPu))}
    assert out['max_FS_metric_difference']<1e-7,out
    assert out['Berry_curvature_spatial_color_abs']<1e-7,out
    return out

if __name__=='__main__':
    out=run();Path(__file__).with_name('d1o_projector_geometry_results.json').write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps(out,indent=2))
