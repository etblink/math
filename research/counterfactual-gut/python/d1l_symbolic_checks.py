#!/usr/bin/env python3
"""Independent D1L symbolic and finite-difference checks (no BFSS Lean claims)."""
import json, math
import numpy as np
import sympy as s
import d1l_full_energy as d

r,a=s.symbols('r a',positive=True,real=True)
v=1/(2*a*r)
T,T2,T3=16*v,288*v**2,5760*v**3
D,TD,D2,T2D=56*v**2,1120*v**3,5040*v**4,24640*v**4
Z=1-T/r**2+D/r**4
Eb2=16/r**2*Z-4*a/r*(T-T2/r**2+TD/r**4)+a**2/4*(T2-T3/r**2+T2D/r**4)
Ejt=T-T2/r**2+TD/r**4
Ejd=D-TD/r**2+D2/r**4
S=s.factor((Eb2/2+(a*a/2+1)*r*r*Ejt+Ejd-8*s.sqrt(2)*r*Z)/Z)
target=-13*(2*s.sqrt(2)*r**3-7)/(r*r*(r**6-4*s.sqrt(2)*r**3+7))
assert s.simplify(S.subs(a,s.sqrt(2))-target)==0
lead=s.simplify(s.limit(S/r,r,s.oo))
assert s.simplify(lead-(4*a+8/a-8*s.sqrt(2)))==0

delta=s.symbols('delta',positive=True)
assert s.simplify(lead.subs(a,s.sqrt(2)*(1+delta))-4*s.sqrt(2)*delta**2/(1+delta))==0

rng=np.random.default_rng(20261121)
max_metric=max_beta=max_jac=0.
for _ in range(32):
    rad=rng.uniform(3.5,11)
    Y=rng.normal(size=(8,2))*0.27
    lam=np.linalg.eigvalsh(Y.T@Y)
    if lam.max()>=rad*rad:continue
    A=rad*rad*np.eye(8)+Y@Y.T
    B=-2*rad*Y
    Dmat=rad*rad*np.eye(2)+Y.T@Y
    G=np.block([[A,B],[B.T,Dmat]])
    inv=np.linalg.inv(G)
    fs=np.diag([2.]*8+[4.]*2)
    direct=.5*np.trace(inv@fs)
    terms=np.sum((rad*rad+lam)/(rad*rad-lam)**2)
    compact=6/rad**2+3*terms
    beta_direct=np.trace(inv[:8,:8])/8
    beta_compact=(6/rad**2+terms)/8
    Jacobian=np.sqrt(np.linalg.det(G))/rad**10
    directJ=np.linalg.det(np.eye(2)-Y.T@Y/rad**2)
    max_metric=max(max_metric,abs(direct-compact))
    max_beta=max(max_beta,abs(beta_direct-beta_compact))
    max_jac=max(max_jac,abs(Jacobian-directJ))
assert max_metric<1e-12 and max_beta<1e-12 and max_jac<1e-12

# Check analytic derivatives of smooth tube cutoff and Gaussian against finite differences.
R=6.;rad=10.;kappa=.4;alpha=math.sqrt(2.)
Y=np.zeros((8,2));Y[0,0]=.73*kappa*rad

def logamp(radius,Y):
    chi,dl=d.radial_profile(radius/R)
    rr=np.linalg.norm(Y)
    eta,_=d.smooth01(2*rr/(kappa*radius)-1)
    return math.log(chi)+4*math.log(alpha*radius/math.pi)-alpha*radius*np.sum(Y*Y)/2+math.log(float(1-eta))

slope=d.radial_profile(rad/R)[1]/R
tr=np.sum(Y*Y)
x=np.sqrt(tr)/(kappa*rad)
sm,spd=d.smooth01(2*x-1)
eta=1-float(sm);deta=-2*float(spd)
b=slope+4/rad-alpha*tr/2-deta*x/(rad*eta)
y=-alpha*rad*Y[0,0]+deta*Y[0,0]/(kappa*rad*np.sqrt(tr)*eta)
h=1e-5
br=(logamp(rad+h,Y)-logamp(rad-h,Y))/(2*h)
Yr=Y.copy();Yr[0,0]+=h
Yl=Y.copy();Yl[0,0]-=h
by=(logamp(rad,Yr)-logamp(rad,Yl))/(2*h)
assert abs(b-br)<1e-7,(b,br)
assert abs(y-by)<1e-7,(y,by)

out={"exact_selected_D1H_identity":True,"general_width_leading":"4*a + 8/a - 8*sqrt(2)",
    "width_delta_identity":"4*sqrt(2)*delta^2/(1+delta)",
    "max_svd_metric_formula_residual":max_metric,
    "max_spatial_inverse_trace_residual":max_beta,
    "max_svd_jacobian_residual":max_jac,
    "cutoff_r_derivative_residual":abs(b-br),
    "cutoff_Y_derivative_residual":abs(y-by)}
with open('/mnt/data/d1l/d1l_symbolic_validation.json','w') as f:json.dump(out,f,indent=2)
print(json.dumps(out,indent=2))
