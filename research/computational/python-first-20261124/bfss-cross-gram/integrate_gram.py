"""Four actual witness rows (S,Y S at two widths), direct charge kernel integration.
No companion contraction code. Two independent Gaussian moment implementations.
"""
import json, math
from pathlib import Path
import numpy as np
from scipy.linalg import eigh
from scipy.special import roots_legendre
import mpmath as mp
D=Path(__file__).resolve().parent
w=json.loads((D/'trial-104.json').read_text());labels=[0,1,424,425];assert all(x in w['labels'] for x in labels)
widths=[tuple(float(mp.mpf(z.split('/')[0])/mp.mpf(z.split('/')[1])) if '/' in z else float(z) for z in x) for x in w['physical_widths']]
# normalized reduced trial functions b**1/4*pi**(-27/4)*f*P.
# g=tr(A B G), T=sG-G^2; Y=Z/sqrt(2), norm(Y S)^2=(80/3)*s.
# K=(A+B)/2. Gaussian integrands for real Gram: M00=1,M11=k*s,
# A00=(1+s)*(g/2+u), A11=k*s*(1+s)*(g/2+u),
# A01=(5/3)*(1+s)*tr((A+B)T); IBP cross=(5/3)*(16*(s+s²)+4*u).
k=80/3

def moments_eig(A,B):
    K=(A+B)/2;lam,O=np.linalg.eigh(K);r=1/lam
    def mom(ex):
        return math.prod(math.prod((4.5+j)*r[i] for j in range(e)) for i,e in enumerate(ex))
    def sm(p,base=(0,0,0)):
        return sum(math.factorial(p)/math.prod(math.factorial(j) for j in (a,b,p-a-b))*mom(tuple(x+y for x,y in zip(base,(a,b,p-a-b)))) for a in range(p+1) for b in range(p-a+1))
    s=[sm(p) for p in range(4)];u=[8/9*sum(sm(p,tuple(int(t==i or t==j) for t in range(3))) for i,j in [(0,1),(0,2),(1,2)]) for p in range(3)]
    AB=np.diag(O.T@A@B@O);g=[sum(AB[i]*sm(p,tuple(int(j==i) for j in range(3))) for i in range(3)) for p in range(3)]
    # Direct mixed term: A+B=2K diagonal in eigenbasis; sG-G² expectation with s^p.
    t=[2*8/9*sum((lam[i]+lam[j])*sm(p,tuple(int(q==i or q==j) for q in range(3))) for i,j in [(0,1),(0,2),(1,2)]) for p in range(2)]
    assert np.allclose(t,[16*s[1],16*s[2]+4*u[0]],rtol=1e-12)
    return s,u,g,t,float(np.prod(lam)**(-4.5))

def gauss(n,wa,wb):
    x,wt=roots_legendre(n);out=np.zeros(8)
    for z,weight in zip((x+1)/2,wt/2):
        a,b=wa;c,d=wb;v=np.array([z,np.sqrt(1-z*z),0]);A=np.diag([b,a,a]);B=c*np.eye(3)-(c-d)*np.outer(v,v)
        s,u,g,t,vol=moments_eig(A,B);base=(b*d)**.25*vol
        out+=weight*base*np.array([1,k*s[1],g[0]/2+u[0],k*(g[1]/2+u[1]),5/3*t[0],(g[0]+g[1])/2+u[0]+u[1],k*((g[1]+g[2])/2+u[1]+u[2]),5/3*sum(t)])
    return out
# Independent high precision via cumulant expansion and inverse traces, not row eigenvalues.
mp.mp.dps=50

def high(wa,wb):
    a,b=map(mp.mpf,wa);c,d=map(mp.mpf,wb);I=mp.eye(3)
    def tr(M):return sum(M[i,i] for i in range(3))
    def integrand(z):
        v=mp.matrix([z,mp.sqrt(1-z*z),0]);A=mp.diag([b,a,a]);B=c*I-(c-d)*(v*v.T);K=(A+B)/2;R=K**-1;AB=A*B
        r=[R**i for i in range(1,5)];p=[tr(x) for x in r]
        s=[mp.mpf(1),mp.mpf('4.5')*p[0]];s.append(s[1]**2+mp.mpf('4.5')*p[1]);s.append(s[1]**3+mp.mpf('13.5')*p[1]*s[1]+9*p[2]);
        # derivatives at t=0: e2(R(t))=(tr(R(t))²-tr(R(t)²))/2
        u0=9*(p[0]**2-p[1]);ud=18*(p[0]*p[1]-p[2]);udd=18*(p[1]**2+2*p[0]*p[2]-3*p[3]);u=[u0,u0*s[1]+ud,u0*s[2]+2*ud*s[1]+udd]
        g0=mp.mpf('4.5')*tr(AB*r[0]);gd=mp.mpf('4.5')*tr(AB*r[1]);gdd=9*tr(AB*r[2]);g=[g0,g0*s[1]+gd,g0*s[2]+2*gd*s[1]+gdd]
        t=[16*s[1],16*s[2]+4*u0];base=(b*d)**mp.mpf('.25')*mp.det(K)**mp.mpf('-4.5');k=mp.mpf(80)/3
        return [base*j for j in [1,k*s[1],g[0]/2+u[0],k*(g[1]/2+u[1]),mp.mpf(5)/3*t[0],(g[0]+g[1])/2+u[0]+u[1],k*((g[1]+g[2])/2+u[1]+u[2]),mp.mpf(5)/3*sum(t)]]
    # Gauss-Legendre nodes evaluated at arbitrary precision via mpmath, independent of scipy implementation.
    nodes,weights=mp.gauss_quadrature(32,'legendre');return [sum(weights[i]/2*integrand((nodes[i]+1)/2)[j] for i in range(len(nodes))) for j in range(8)]

M=np.zeros((4,4));A0=M.copy();A1=M.copy();checks=[]
for i in range(2):
    for j in range(i,2):
        wa,wb=widths[i],widths[j];lo=gauss(32,wa,wb);hi=gauss(128,wa,wb);ref=high(tuple(map(str,wa)),tuple(map(str,wb)));err=max(abs(float(a-b))/max(abs(float(b)),1e-30) for a,b in zip(hi,ref));conv=max(abs(lo-hi)/np.maximum(abs(hi),1e-30));assert err<1e-11 and conv<1e-11
        print(i,j,'err',err,'conv',conv,flush=True)
        checks.append({'pair':[i,j],'relative_32_vs_128':conv,'relative_eigen_vs_inverse_trace':err,'mp50_values':[mp.nstr(v,35) for v in ref]})
        for mat,values in [(M,[hi[0],0,hi[1]]),(A0,[hi[2],hi[4],hi[3]]),(A1,[hi[5],hi[7],hi[6]])]:
            block=np.array([[values[0],values[1]],[values[1],values[2]]]);mat[2*i:2*i+2,2*j:2*j+2]=block;mat[2*j:2*j+2,2*i:2*i+2]=block.T
# independent scalar Gaussian control, reduced normalization cancels.
v=gauss(32,(2.,2.),(2.,2.));assert abs(v[5]/v[0]-(27*2/4+54/4+783/8+837/8))<1e-10
q,vec=eigh(A1,M);q0,_=eigh(A0,M);C=np.array([float(w['reduced_basis_coefficients'][w['labels'].index(z)]) for z in labels]);trunc=float(C@A1@C/(C@M@C));diag=np.diag(A1)/np.diag(M);bad=A1.copy();bad[::2,1::2]=0;bad[1::2,::2]=0;no,_=eigh(bad,M);assert np.all(np.linalg.eigvalsh(M)>0) and np.all(q>0)
report={'labels':labels,'widths':w['physical_widths'],'mass':M.tolist(),'H':A0.tolist(),'q1':A1.tolist(),'per_row_q1':diag.tolist(),'q1_generalized_eigenvalues':q.tolist(),'q0_generalized_eigenvalues':q0.tolist(),'truncated_released_coefficients':C.tolist(),'truncated_q1':trunc,'no_cross_min_q1':float(no[0]),'mass_condition':float(np.linalg.cond(M)),'quadrature_checks':checks,'isotropic_control_q1':float(v[5]/v[0]),'scope':'Four actual rows only; reconstructed finite representation, no rigorous interval bound, no full witness quotient or typed physical domain claim.'};(D/'integrated_results.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
