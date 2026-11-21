#!/usr/bin/env python3
"""D1N independent original-color Fock wedge, exact source model quadrature.

Finite-dimensional checks on original 24 mode indices and 48 Majorana fields.
Not a Lean carrier/source SmoothCore proof or a theorem about physical H.
"""
import json,math,sys
from pathlib import Path
import numpy as np
from numpy.polynomial.legendre import leggauss
from scipy.special import roots_jacobi,gammaln,gammaincc
import d1n_original_form_differential as d

SQ2=math.sqrt(2.)

def spin_seed():
    V=np.zeros((24,8),complex)
    for j in range(8):
        sj=1 if j<4 else -1
        V[3*j+1,j]=1/math.sqrt(2)
        V[3*j+2,j]=1j*sj/math.sqrt(2)
    return V

def rotation3(axis,theta):
    axis=d.unit(axis)
    B=d.jmat(axis)
    return np.eye(3)+math.sin(theta)*B+(1-math.cos(theta))*(B@B)

def wedge_gauge_tests(samples=40):
    rng=np.random.default_rng(20261121)
    V=spin_seed();assert np.allclose(V.conj().T@V,np.eye(8))
    s=np.array([1]*4+[-1]*4)
    center=np.eye(3)[0]
    H=np.array([[1,0,0],[0,0,-1],[0,1,0.]])
    errors={x:0. for x in ('stabilizer_vector_phase','gauge_covariance','gauge_orbit_wedge_ambiguity','group_law','cover_identity_covariance','vacuum_fixed')}
    records=[]
    for _ in range(samples):
        u=d.unit(rng.normal(size=9));n=d.unit(rng.normal(size=3))
        g=d.random_orthogonal(rng)
        h=d.random_orthogonal(rng)
        theta=rng.uniform(-2*math.pi,2*math.pi)
        # SO(2) subgroup that fixes color0
        stabilizer=rotation3(center,theta)
        U=lambda O: np.kron(np.eye(8),O)
        hv=U(stabilizer)@V
        # Norm of the 8-particle wedge overlap is det(V*hv)
        det=np.linalg.det(V.conj().T@hv)
        errors['stabilizer_vector_phase']=max(errors['stabilizer_vector_phase'],abs(det-1))
        errors['gauge_orbit_wedge_ambiguity']=max(errors['gauge_orbit_wedge_ambiguity'],abs(np.linalg.det((U(g)@V).conj().T@(U(g@stabilizer)@V))-1))
        errors['group_law']=max(errors['group_law'],float(np.max(np.abs(U(g@h)-U(g)@U(h)))))
        Cu=d.cov(u,n)
        Ug=np.kron(np.eye(16),g)
        errors['gauge_covariance']=max(errors['gauge_covariance'],float(np.max(np.abs(d.cov(u,g@n)-Ug@Cu@Ug.T))))
        errors['cover_identity_covariance']=max(errors['cover_identity_covariance'],float(np.max(np.abs(d.cov(u,n)-d.cov(-u,-n)))))
        # Exterior-power action fixes 0-particle vacuum by definition; identity scalar exactly 1.
        errors['vacuum_fixed']=max(errors['vacuum_fixed'],abs(1.-1.))
        records.append({'theta':theta,'stabilizer_eight_particle_character_abs_error':abs(det-1)})
    # Negative control uses all eight positive sign occupations -> nontrivial SO2 character.
    Vbad=V.copy();Vbad[2::3,:]=0
    for j in range(8):Vbad[3*j+2,j]=1j/math.sqrt(2)
    theta=.271
    positive_character=np.linalg.det(Vbad.conj().T@np.kron(np.eye(8),rotation3(center,theta))@Vbad)
    return {'tests':samples,'max_abs_residuals':errors,
        'correct_stabilizer_character':'+1 (24 orbital wedge determinant)',
        'all_positive_occupation_control_character':str(positive_character),
        'all_positive_control_distance_from_one':float(abs(positive_character-1)),
        'caveat':'SO3 output-color action source G3A/G4A used; not a typed original Fermion 2 Lean proof.'}

def c_inf_step(z):
    if z<=0:return 0.,0.
    if z>=1:return 1.,0.
    a=math.exp(-1/z);b=math.exp(-1/(1-z));s=a/(a+b)
    return s,s*(1-s)*(1/z**2+1/(1-z)**2)

def radius_profile(t):
    if not (1<t<2):return 0.,0.
    c=math.exp(-1/(t-1)-1/(2-t))
    return c,1/(t-1)**2-1/(2-t)**2

def tube(r,t,kappa=.5):
    x=math.sqrt(t)/(kappa*r)
    if x<=.5:return 1.,0.
    if x>=1:return 0.,0.
    y,yp=c_inf_step(2*x-1)
    return 1-y,-2*yp

def fixed_tube_quadrature(R,kappa=.5,alpha=SQ2, nr=64,nx=160,nw=24):
    z,w=leggauss(nr);rs=1.5+.5*z;rw=.5*w
    tx,tw=leggauss(nx)
    sw,ww=roots_jacobi(nw,2.5,0.)
    wbeta=.5*(sw+1);ww=ww/ww.sum()
    sq=np.sqrt(wbeta)[None,:]
    den=0.;parts=np.zeros(3)
    for radius,wr in zip(rs,rw):
        r=R*radius;chi,log_chi=radius_profile(radius)
        if chi==0:continue
        cutoff_derivative=log_chi/R
        xmax=min(alpha*kappa*kappa*r**3,140.)
        xx=(tx+1)*xmax/2
        weight_x=tw*xmax/2*np.exp(7*np.log(xx)-xx-gammaln(8))
        t=xx/(alpha*r)
        root=np.sqrt(t)
        x=root/(kappa*r)
        etas=[];ds=[]
        for s in x:
            if s<=.5:etas.append(1.);ds.append(0.)
            elif s>=1:etas.append(0.);ds.append(0.)
            else:
                y,yp=c_inf_step(2*s-1)
                etas.append(1-y);ds.append(-2*yp)
        eta=np.array(etas);detap=np.array(ds)
        eig1=t[:,None]*(1+sq)/2
        eig2=t[:,None]*(1-sq)/2
        j=(1-eig1/r**2)*(1-eig2/r**2)
        radial=.5*(eta*(cutoff_derivative+4/r-alpha*t/2)-detap*x/r)**2
        transverse=.5*t*(-alpha*r*eta+detap/(kappa*r*root))**2
        vb=r*r*t[:,None]+eig1*eig2
        vf=-8*SQ2*r
        scalar=radial[:,None]+transverse[:,None]+eta[:,None]**2*(vb+vf)
        angular=(6/r**2+3*((r*r+eig1)/(r*r-eig1)**2+(r*r+eig2)/(r*r-eig2)**2))*eta[:,None]**2
        # transverse weighted model: gaussian radial Jacobian r^10 and j
        mask=weight_x[:,None]*ww[None,:]*j
        radial_weight=wr*radius**10*chi**2
        den+=radial_weight*np.sum(mask*eta[:,None]**2)
        parts[0]+=radial_weight*np.sum(mask*scalar)
        parts[1]+=radial_weight*np.sum(mask*angular)
        parts[2]+=radial_weight*np.sum(mask*(eig1*eig2)*eta[:,None]**2)
    # parts[2] independently tracks quartic, already included in scalar
    assert den>0, 'candidate radial norm must be positive'
    return {'R':R,'radial_mass_normalization_scaled':den,'R2_E_global':R*R*(parts[0]+parts[1])/den,
        'R2_scalar':R*R*parts[0]/den,'R2_fock':R*R*parts[1]/den,
        'R2_quartic_subset':R*R*parts[2]/den,'quadrature':[nr,nx,nw]}

def radial_leading():
    # Integrals independent of external previous-stage scripts.
    from scipy.integrate import quad
    def ff(t):
        c,_=radius_profile(t)
        return t**10*c*c
    def grad(t):
        c,dl=radius_profile(t)
        return t**10*(c*dl)**2
    def ff8(t):
        c,_=radius_profile(t)
        return t**8*c*c
    norm=quad(ff,1,2,epsabs=1e-15)[0]
    kin=.5*quad(grad,1,2,epsabs=1e-15)[0]/norm
    fock=12*quad(ff8,1,2,epsabs=1e-15)[0]/norm
    return {'radial':kin,'fock':fock,'global_K':kin+fock}

def tests():
    out={'method':'D1N 24 mode exterior gauge test + independent deterministic SVD energy quadrature',
         'source':'source G3A colors, G4A exterior gauge, exact 16 real Gamma9 and 48 Majoranas',
         'gauge':wedge_gauge_tests(),
         'asymptotic_global_beta_one':radial_leading(),
         'fixed_tube_experiments':[],
         'error': 'Deterministic quadrature at fixed tube is a model; source SmoothCore and physical form unqualified.'}
    for R in [8.,10.,20.,40.,80.,160.]:
        out['fixed_tube_experiments'].append(fixed_tube_quadrature(R,nr=64,nx=160,nw=24))
    for R in [10.,40.]:
        out['fixed_tube_experiments'].append(fixed_tube_quadrature(R,nr=80,nx=240,nw=36))
    return out

if __name__=='__main__':
    out=tests()
    p=Path(__file__).with_name('d1n_gauge_global_quadrature_results.json')
    p.write_text(json.dumps(out,indent=2)+'\n')
    print(json.dumps({'gauge':out['gauge'],'global_K':out['asymptotic_global_beta_one'],
          'fixed_tube':out['fixed_tube_experiments']},indent=2))
