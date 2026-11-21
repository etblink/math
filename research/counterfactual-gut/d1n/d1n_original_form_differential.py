#!/usr/bin/env python3
"""D1N independent ambient-gradient/form-integrand audit (finite-dimensional model).

Original SU(2) color f_abc=sqrt(2) eps_abc, Gamma9 signed Pauli words,
48 original paired Majorana labels, 24 complex modes. This script does NOT
assert Lean SmoothCore/GaugeData membership nor the closed-operator theorem.
"""
import json
import math
import numpy as np
from functools import reduce
from pathlib import Path

I=np.eye(2,dtype=np.float64)
J=np.array([[0,1],[-1,0]],dtype=np.float64)
X=np.array([[0,1],[1,0]],dtype=np.float64)
Z=np.diag([1.,-1.])
WORDS=['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']
PARTS={'I':I,'J':J,'X':X,'Z':Z}
G=np.stack([reduce(np.kron,(PARTS[c] for c in word)) for word in WORDS])
JP=np.kron(np.eye(8),J)
EPS=np.zeros((3,3,3))
for a,b,c in [(0,1,2),(1,2,0),(2,0,1)]:EPS[a,b,c]=1;EPS[a,c,b]=-1
SQ2=np.sqrt(2.)

def unit(x):return x/np.linalg.norm(x)
def gmat(u):return np.einsum('i,ijk->jk',u,G,optimize=True)
def jmat(n):return np.einsum('a,abc->bc',n,EPS,optimize=True)
def cov(u,n):return -np.kron(gmat(u),jmat(n))-np.kron(JP,np.outer(n,n))
def d_cov(u,n,du,dn):
    return (-np.kron(gmat(du),jmat(n))-np.kron(gmat(u),jmat(dn))
            -np.kron(JP,np.outer(dn,n)+np.outer(n,dn)))
def gauss_fermion_expect(X,c):
    # Original massless FermionQuantization.deformedFermionField_bracket at h=1,m=0:
    # (-i/2) sum f_ABC X_iC gamma_i[beta,delta] theta_delta,B theta_beta,A
    # covariance definition C_rs=2i<theta_r theta_s> gives real factor -1/4.
    C=c.reshape(16,3,16,3)
    return float(-SQ2/4*np.einsum('abc,ic,ipq,qbpa->',EPS,X,G,C,optimize=True))

def top_chart(X):
    a,s,vh=np.linalg.svd(X,full_matrices=False)
    r=float(s[0]);u=a[:,0];n=vh[0,:]
    Y=X-r*np.outer(u,n)
    return r,u,n,Y,s

def first_differential(X,H,chart=None):
    if chart is None:chart=top_chart(X)
    r,u,n,Y,_=chart
    dr=float(u@H@n)
    a=H@n-u*(u@H@n)
    b=H.T@u-n*(n@H.T@u)
    mat=np.block([[r*np.eye(9),-Y],[-Y.T,r*np.eye(3)]])
    du_dn=np.linalg.solve(mat,np.r_[a,b]);du=du_dn[:9];dn=du_dn[9:]
    # The full SVD differential includes a Y-correction, never use du = (H n)/r.
    dt=2*float(np.sum(Y*H))
    return dr,dt,du,dn

def det_rank2(Y):
    """Product of TWO nonzero transverse eigenvalues, NOT 3x3 determinant."""
    eig=np.linalg.eigvalsh(Y.T@Y)
    return float(eig[-1]*eig[-2])

def metric_angular_formula(chart):
    r,u,n,Y,_=chart
    lam=np.linalg.eigvalsh(Y.T@Y)[-2:] # rank-two transverse color, omit zero n-eigenvalue
    return float(6/r**2+3*np.sum((r*r+lam)/(r*r-lam)**2))

def fock_energy_ambient(chart):
    r,u,n,Y,s=chart
    val=0.;norms=[]
    for i in range(9):
      for a in range(3):
        H=np.zeros((9,3));H[i,a]=1
        _,_,du,dn=first_differential(r*np.outer(u,n)+Y,H,chart)
        dc=d_cov(u,n,du,dn)
        val+=np.sum(dc*dc)/32 # kinetic 1/2 times covariance Fubini-Study 1/16
        norms.append(np.sum(dc*dc)/16)
    return float(val),norms

def gaussian_log_derivative(r,t):return 4/r-SQ2*t/2

def radial_shell(r,R):
    ss=r/R
    if not 1<ss<2:return 0.,0.
    ll=-1/(ss-1)-1/(2-ss)
    return math.exp(ll),(1/(ss-1)**2-1/(2-ss)**2)/R

def tube_eta(r,t,kappa=.5):
    x=math.sqrt(t)/(kappa*r)
    if x<=.5:return 1.,0.
    if x>=1:return 0.,0.
    z=2*x-1
    A=math.exp(-1/z);B=math.exp(-1/(1-z))
    s=A/(A+B)
    ds=s*(1-s)*(1/z**2+1/(1-z)**2)
    return 1-s,-2*ds

def scalar_kin_and_potential(r,t,det,R,kappa=.5):
    chi,lchi=radial_shell(r,R)
    eta,etap=tube_eta(r,t,kappa)
    x=math.sqrt(t)/(kappa*r)
    # amplitude = chi(r/R) * (sqrt2 r/pi)^4 e^{-sqrt2*r*t/2} * eta(x)
    # kinetic divided by chi^2 phi_r^2 (unweighted by j):
    Ar=lchi+gaussian_log_derivative(r,t)
    ykin=SQ2*r
    radial_term=.5*(eta*Ar-etap*x/r)**2
    trans_term=.5*t*(-ykin*eta+etap/(kappa*r*math.sqrt(t)))**2
    v_b=r*r*t+det
    v_f=-8*SQ2*r
    return radial_term+trans_term+eta**2*(v_b+v_f)

def independent_exact_point_energy(X,R,kappa=.5):
    chart=top_chart(X);r,u,n,Y,_=chart;t=float(np.sum(Y*Y));det=det_rank2(Y)
    a=gauss_fermion_expect(X,cov(u,n))
    val=scalar_kin_and_potential(r,t,det,R,kappa)
    eta,_=tube_eta(r,t,kappa)
    e_f, _=fock_energy_ambient(chart)
    return val+eta**2*e_f, val, eta**2*e_f, a

def random_chart(rng,r=12.,width=1., nref=None):
    u=unit(rng.normal(size=9));n=unit(rng.normal(size=3))
    P=np.eye(9)-np.outer(u,u);Q=np.eye(3)-np.outer(n,n)
    Y=width*P@rng.normal(size=(9,3))@Q
    # tighten to ensure strict chart
    if np.linalg.norm(Y,2)>.65*r:Y*=.65*r/np.linalg.norm(Y,2)
    return r*np.outer(u,n)+Y

def random_orthogonal(rng):
    M=rng.normal(size=(3,3));O,R=np.linalg.qr(M)
    O=O@np.diag(np.sign(np.diag(R)))
    if np.linalg.det(O)<0:O[:,0]*=-1
    return O

def run():
    rng=np.random.default_rng(20261121)
    counts={'point':12,'differential':8,'gauge':12}
    errors={key:0. for key in ['gamma_clifford','fermion_expect','fermion_angular_formula','dr_finite_difference','dt_finite_difference','du_finite_difference','dn_finite_difference','cov_finite_difference','scalar_gradient_finite_difference','gauge_color_covariance','gauge_point_energy','boson_potential']}
    for i in range(9):
      for j in range(9):
        errors['gamma_clifford']=max(errors['gamma_clifford'],float(np.max(np.abs(G[i]@G[j]+G[j]@G[i]-2*(i==j)*np.eye(16)))))
    worst=[]
    for k in range(counts['point']):
       r=10.+k*.8;X=random_chart(rng,r,1./np.sqrt(r))
       chart=top_chart(X);rr,u,n,Y,s=chart
       t=float(np.sum(Y*Y));det=det_rank2(Y)
       exp=gauss_fermion_expect(X,cov(u,n))
       errors['fermion_expect']=max(errors['fermion_expect'],abs(exp+8*SQ2*rr))
       val,norms=fock_energy_ambient(chart)
       formula=metric_angular_formula(chart)
       errors['fermion_angular_formula']=max(errors['fermion_angular_formula'],abs(val-formula))
       Vb=rr*rr*t+det
       # independent 2x2-minor potential from all row pairs in original X.
       minors=0.
       for a in range(9):
        for b in range(a+1,9):minors+=np.sum(np.cross(X[a,:],X[b,:])**2)
       errors['boson_potential']=max(errors['boson_potential'],abs(minors-Vb))
       R=.7*rr
       e_tot,e_s,e_f,e_frozen=independent_exact_point_energy(X,R)
       worst.append({'r':rr,'Y_fro':math.sqrt(t),'fermion_angular':val,'analytic_formula':formula,'fermion_expect':exp,'potential':Vb,'point_local_energy_model':e_tot})
       if k<counts['differential']:
          H=rng.normal(size=(9,3));H/=np.linalg.norm(H)
          dr,dt,du,dn=first_differential(X,H,chart)
          h=1.0e-5
          cp=top_chart(X+h*H);cm=top_chart(X-h*H)
          # Correct SVD sign ambiguity at the level of u,n only.
          if cp[1]@u<0:cp=(cp[0],-cp[1],-cp[2],cp[3],cp[4])
          if cm[1]@u<0:cm=(cm[0],-cm[1],-cm[2],cm[3],cm[4])
          errs={'dr_finite_difference':abs(dr-(cp[0]-cm[0])/(2*h)),
             'dt_finite_difference':abs(dt-(np.sum(cp[3]**2)-np.sum(cm[3]**2))/(2*h)),
             'du_finite_difference':float(np.max(np.abs(du-(cp[1]-cm[1])/(2*h)))),
             'dn_finite_difference':float(np.max(np.abs(dn-(cp[2]-cm[2])/(2*h)))),
             'cov_finite_difference':float(np.max(np.abs(d_cov(u,n,du,dn)-(cov(cp[1],cp[2])-cov(cm[1],cm[2]))/(2*h))))}
          for name,e in errs.items():errors[name]=max(errors[name],float(e))
          # Gaussian scalar/tube differential independent finite difference.
          def amplitude(A):
              ra,ua,na,Ya,_=top_chart(A);ta=np.sum(Ya**2)
              cc,d=radial_shell(ra,.7*rr)
              ea,ed=tube_eta(ra,ta)
              return cc*((SQ2*ra/math.pi)**4)*math.exp(-SQ2*ra*ta/2)*ea
          t2=t;xr=math.sqrt(t2)/(.5*rr)
          eta,etap=tube_eta(rr,t2)
          chi,lchi=radial_shell(rr,.7*rr)
          phi=chi*((SQ2*rr/math.pi)**4)*math.exp(-SQ2*rr*t2/2)
          gra=phi*(eta*(lchi+gaussian_log_derivative(rr,t2))-etap*xr/rr)*np.outer(u,n)
          gra+=phi*(-SQ2*rr*eta+etap/(.5*rr*math.sqrt(t2)))*Y
          h2=2.e-5
          fd=(amplitude(X+h2*H)-amplitude(X-h2*H))/(2*h2)
          errors['scalar_gradient_finite_difference']=max(errors['scalar_gradient_finite_difference'],abs(fd-np.sum(gra*H))/max(phi,1e-150))
       if k<counts['gauge']:
          O=random_orthogonal(rng)
          Xt=X@O.T
          chartt=top_chart(Xt)
          ct=cov(chartt[1],chartt[2]);c_expected=np.kron(np.eye(16),O)@cov(u,n)@np.kron(np.eye(16),O.T)
          errors['gauge_color_covariance']=max(errors['gauge_color_covariance'],float(np.max(np.abs(ct-c_expected))))
          et,es,ef,ff=independent_exact_point_energy(Xt,.7*rr)
          errors['gauge_point_energy']=max(errors['gauge_point_energy'],abs(et-e_tot))
    # Negative controls: a non-optimal Gaussian gives positive linear r term
    alphas=[SQ2*(1+x) for x in [-.02,0.,.02]]
    width_negative_control=[{'alpha':float(alpha),'coefficient_of_r':float(4*alpha+8/alpha-8*SQ2)} for alpha in alphas]
    return {'kind':'D1N independent exact original local integrand + SVD/ambient gradient tests',
        'source_contracts':{'Gamma9':'SU2RealGammaProbe.lean b9b8192055c70f0d001d7982669b9823c55562ed',
        'FermionQuantization':'FermionQuantization.lean c6b72d030225c707ef54f5285a18a7a8175ee280',
        'GaugeData':'G4J exact color source e20c76fb22bc09d16dbcd8657333227cb34ed1ea'},
        'counts':counts,'max_abs_residuals':errors,'sample_point_examples':worst[:4],
        'width_negative_control':width_negative_control,
        'limitations':'NOT a physical GaugeData or SmoothCore theorem; exact local finite-dimensional integrand, continuous extension not source typed.'}
if __name__=='__main__':
    obj=run()
    out=Path(__file__).with_name('d1n_original_form_differential_results.json')
    out.write_text(json.dumps(obj,indent=2)+'\n')
    print(json.dumps({'output':out.name,'max_abs_residuals':obj['max_abs_residuals']},indent=2))
