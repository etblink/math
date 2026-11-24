"""Independent finite replication of D1G/I/L and auxiliary-margin arithmetic.
Source convention donor: D1G, D1I, D1L notes dated 2026-11-21.
Fixed seed 20261124, atol 1e-10 for dimensionless algebra (scaled spectral error).
No claim of original smooth-core admissibility or companion witness evaluation.
"""
import json, math, platform
from pathlib import Path
import numpy as np
import scipy
from scipy.special import roots_jacobi, gammaln
from numpy.polynomial.legendre import leggauss
from scipy.integrate import quad
import sympy as sp
rng=np.random.default_rng(20261124)
I=np.eye(2); X=np.array([[0,1],[1,0]]); Z=np.diag([1,-1]); J=np.array([[0,1],[-1,0]])
def word(w):
    m=np.ones((1,1))
    for c in w: m=np.kron(m,dict(I=I,X=X,Z=Z,J=J)[c])
    return m
G=np.array([word(w) for w in ['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']]); eye=np.eye(16)
eps=np.zeros((3,3,3))
for a,b,c in [(0,1,2),(1,2,0),(2,0,1)]:eps[a,b,c]=1;eps[a,c,b]=-1
sq2=np.sqrt(2)
cliff=max(np.max(abs(G[i]@G[j]+G[j]@G[i]-2*(i==j)*eye)) for i in range(9) for j in range(9))
def k(x):return sq2*np.einsum('ia,ipq,abc->pbqc',x,G,eps).reshape(48,48)
def gram(x):
    z=x.T@x;return .5*(np.trace(z)**2-np.trace(z@z))
def bracket(x):return np.sum(np.cross(x[:,None,:],x[None,:,:])**2)/2
# Hessian at a rank-one valley from differential of cross products.
def hess(x):
    e=np.eye(27).reshape(27,9,3);d=np.cross(e[:,:,None,:],x[None,None,:,:])+np.cross(x[None,:,None,:],e[:,None,:,:]); d=d.reshape(27,-1)
    return d@d.T
rows=[]; max_gram=0.
for R in [.5,1,2,5,10,30]:
    for repeat in range(4):
        u=rng.normal(size=9);u/=np.linalg.norm(u); n=rng.normal(size=3);n/=np.linalg.norm(n)
        x=R*np.outer(u,n);h=np.linalg.eigvalsh(hess(x));f=np.linalg.eigvalsh(1j*k(x)); eb=np.sqrt(np.maximum(h[-16:],0)).sum()/2;ef=-f[-16:].sum()/2
        rows.append(dict(R=R,zero_b=int(np.sum(abs(h)<1e-10*max(R*R,1))),zero_f=int(np.sum(abs(f)<1e-10*max(R,1))),cancellation=float(eb+ef),relative_hessian_error=float(np.max(abs(h[-16:]-2*R*R))/(2*R*R)),relative_fermion_error=float(np.max(abs(f[-16:]-sq2*R))/(sq2*R))))
        y=rng.normal(size=(9,3));max_gram=max(max_gram,abs(gram(y)-bracket(y)))
# Local 3-mode exact occupation ordering. theta labels spin-major, then color.
def creation(m):
    A=np.zeros((8,8),complex)
    for b in range(8):
        if not b>>m&1:A[b|1<<m,b]=(-1)**((b&((1<<m)-1)).bit_count())
    return A
c=np.array([creation(m) for m in range(3)]); a=c.conj().transpose(0,2,1)
theta=np.concatenate([(c+a)/sq2,1j*(c-a)/sq2]); vac=np.eye(8)[:,0]; signs=np.diag(G[8])[::2]
car=max(np.max(abs(theta[i]@theta[j]+theta[j]@theta[i]-(i==j)*np.eye(8))) for i in range(6) for j in range(6)); cov=[]; norms=[]
P=np.diag([1.,0,0]);Jn=eps[0];
for s in signs:
    v=(c[1]+1j*s*c[2])@vac/sq2
    C=np.array([[0 if i==j else (2j*np.vdot(v,theta[i]@theta[j]@v)).real for j in range(6)] for i in range(6)])
    cov.append(float(np.max(abs(C-(-s*np.kron(I,Jn)-np.kron(J,P))))));norms.append(abs(np.vdot(v,v)-1))
angles=np.linspace(0,2*np.pi,257); phase=np.max(abs(np.prod(np.exp(1j*angles[:,None]*signs),axis=1)-1));badphase=np.max(abs(np.exp(8j*angles)-1))
# Full covariance on reference and rotated axes; wrong one-color rotation as negative control.
C0=-np.kron(G[8],Jn)-np.kron(np.kron(np.eye(8),J),P)
# D1I paired order has J_pair=I_8 tensor J. gamma rotor only transverse.
rot=[];bad=[]
for _ in range(25):
    u=rng.normal(size=9);u/=np.linalg.norm(u); gu=np.einsum('i,ijk->jk',u,G); S=(eye+gu@G[8])/np.sqrt(2*(1+u[8])); T=np.kron(eye,P)+np.kron(S,np.eye(3)-P); target=-np.kron(gu,Jn)-np.kron(np.kron(np.eye(8),J),P)
    rot.append(np.max(abs(T@C0@T.T-target))); B=np.kron(S,np.diag([0,1,0]))+np.kron(eye,np.diag([1,0,1]));bad.append(np.max(abs(B@C0@B.T-target)))
# Independent quadrature for D1L model, with fixed tube kappa=.5 and flat smooth step.
def smooth(x):
    x=np.asarray(x); y=np.clip(x,1e-12,1-1e-12); z=np.clip(1/y-1/(1-y),-700,700); v=1/(1+np.exp(z)); dv=v*(1-v)*(1/y**2+1/(1-y)**2);return np.where(x<=0,0,np.where(x>=1,1,v)),np.where((x>0)&(x<1),dv,0)
def chi(s):return np.exp(-1/(s-1)-1/(2-s)),1/(s-1)**2-1/(2-s)**2
def bcoef():
    def parts(z):
        b,d=smooth((z-.15)/.45);return b,d/.45
    return quad(lambda z:(1-z*z)**4*parts(z)[1]**2,-1,1,points=[.15,.6],epsabs=1e-11)[0]/quad(lambda z:(1-z*z)**3*parts(z)[0]**2,-1,1,points=[.15,.6],epsabs=1e-11)[0]
cb=bcoef()
def calc(R,ratio=1,p=0,nx=160):
    alpha=sq2*ratio; kap=.5*R**(-p);z,w=leggauss(64);ss=1.5+z/2;ws=w/2;zx,wx=leggauss(nx);zw,ww=roots_jacobi(24,2.5,0);ww/=sum(ww);shape=np.sqrt((zw+1)/2); den=0.; num=0.
    for s,wr in zip(ss,ws):
        r=R*s; ch,dl=chi(s); W=wr*s**10*ch**2; xmax=min(120,alpha*kap**2*r**3); x=(zx+1)*xmax/2; m=wx*xmax/2*np.exp(7*np.log(x)-x-gammaln(8)); t=x/(alpha*r); rho=np.sqrt(t); zeta=rho/(kap*r); step,ds=smooth(2*zeta-1); eta=1-step; d=-2*ds
        l=t[:,None]*(1+shape)/2; h=t[:,None]*(1-shape)/2; jac=(1-l/r**2)*(1-h/r**2); measure=m[:,None]*ww*jac
        radial=.5*(eta*(dl/R+4/r-alpha*t/2)-d*zeta/r)**2; trans=.5*t*(-alpha*r*eta+d/(kap*r*rho))**2
        metric=(r*r+l)/(r*r-l)**2+(r*r+h)/(r*r-h)**2
        integrand=(radial+trans)[:,None]+eta[:,None]**2*(r*r*t[:,None]+l*h-8*sq2*r+6/r**2+3*metric+(cb/16)*(6/r**2+metric));den+=W*np.sum(measure*eta[:,None]**2);num+=W*np.sum(measure*integrand)
    return float(R*R*num/den)
width=[dict(R=40,ratio=a,R2E=calc(40,a)) for a in [.99,1,1.01]]
scaling=[dict(R=R,fixed=calc(R),adaptive=calc(R,1+0.1*(10/R)**1.5),critical=calc(R,p=1.5)) for R in [10,20,40,80]]
# Fidelity bounds: interval-independent conservative rational comparisons and numeric margins.
kap=(36+8*sp.sqrt(14))/25; threshold=1/kap
witness=[]
for n,q,b in [(104,'0.3643611475',sp.Rational(3,8)),(206,'0.3321696830',sp.Rational(1,3)),(1542,'0.0089725410',sp.Rational(1,100))]:
    q=sp.Rational(q);witness.append(dict(n=n,q=float(q),nominal_fidelity=float(1-kap*q),threshold_headroom=float(threshold-q),headroom_from_rational_bound=float(threshold-b),conservative_rational_fidelity=float(1-sp.Rational(66,25)*b)))
res=dict(versions=dict(python=platform.python_version(),numpy=np.__version__,scipy=scipy.__version__,sympy=sp.__version__),seed=20261124,clifford=cliff,gram_residual=max_gram,rank1=rows,car=car,block_covariance=max(cov),normalization=float(max(norms)),stabilizer=float(phase),bad_stabilizer=float(badphase),rotor=float(max(rot)),bad_rotor=float(max(bad)),beta_coefficient=cb,width=width,scaling=scaling,quadrature_convergence=dict(R40_n96=calc(40,nx=96),R40_n240=calc(40,nx=240)),threshold=float(threshold),witness=witness)
Path(__file__).with_name('results.json').write_text(json.dumps(res,indent=2)+'\n'); print(json.dumps({**res,'rank1':dict(samples=len(rows),max_cancellation=max(abs(x['cancellation']) for x in rows),zero_counts=sorted(set((x['zero_b'],x['zero_f']) for x in rows)))},indent=2))
