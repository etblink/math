"""Independent Clifford transport, not native BFSS dynamics."""
import sympy as s
import numpy as np
from scipy.integrate import solve_ivp

def conj(a): return (a[0],)+tuple(-x for x in a[1:])
def add(a,b): return tuple(x+y for x,y in zip(a,b))
def mul(a,b):
    if len(a)==1:return (a[0]*b[0],)
    k=len(a)//2;x,y=a[:k],a[k:];u,v=b[:k],b[k:]
    return add(mul(x,u),tuple(-z for z in mul(conj(v),y)))+add(mul(v,x),mul(y,conj(u)))
E=[tuple(int(i==j) for i in range(8)) for j in range(8)]
L=[s.Matrix.hstack(*(s.Matrix(mul(e,v)) for v in E)) for e in E]
I=s.eye(8); O=s.zeros(8); Id=s.eye(16)
G=[O.row_join(M).col_join(M.T.row_join(O)) for M in L]+[I.row_join(O).col_join(O.row_join(-I))]
for i in range(9):
    for j in range(9):assert G[i]*G[j]+G[j]*G[i]==2*int(i==j)*Id
J=G[0]*G[1]*G[2]; Dx=G[3]*G[1]*G[2]; Dy=G[4]*G[1]*G[2]
assert J*J==-Id
comm=lambda A,B:A*B-B*A
Ax=-J*Dx/2; Ay=-J*Dy/2
for D,A in [(Dx,Ax),(Dy,Ay)]:
    assert A.T==-A and D+comm(A,J)==s.zeros(16)
    assert comm(A,J)==-D
F=-comm(Dx,Dy)/4
assert F==G[3]*G[4]/2 and comm(F,J)==s.zeros(16)
# Kato eigenspace connection P=(I-iJ)/2, A=[P,dP].
P=(Id-s.I*J)/2; dP=-s.I*Dx/2
assert P*P==P and P.conjugate().T==P and comm(P,dP)==Ax
# Orbital and spin covariance: infinitesimal rotation moving e0 to e3.
S=-G[0]*G[3]/2
assert comm(S,J)==Dx and S==-Ax
# Analytic latitude-loop expression in rotating frame.
a,b=s.symbols('a b',real=True) # cos(theta), sin(theta)
B=a*(b*G[0]*G[4]-a*G[3]*G[4])/2
assert s.simplify(B*B+a*a*(a*a+b*b)*Id/4)==s.zeros(16)
print('Clifford, Kato, curvature, rotation covariance, rotating-frame checks PASS')
g=[np.array(M,dtype=float) for M in G]; I16=np.eye(16); Q=g[1]@g[2]
for deg in (0,30,60,90,120,180):
    th=np.deg2rad(deg); c=np.cos(th); sn=np.sin(th)
    def data(t):
        N=c*g[0]+sn*(np.cos(t)*g[3]+np.sin(t)*g[4])
        dN=sn*(-np.sin(t)*g[3]+np.cos(t)*g[4]); return N@Q,dN@Q
    def ode(t,z):
        j,dj=data(t); A=-j@dj/2
        return (-A@z.reshape(16,16)).ravel()
    result=solve_ivp(ode,(0,2*np.pi),I16.ravel(),rtol=1e-10,atol=1e-12)
    assert result.success
    U=result.y[:,-1].reshape(16,16); j0,_=data(0)
    assert np.linalg.norm(U.T@U-I16)<1e-8
    assert np.linalg.norm(U@j0@U.T-j0)<1e-8
    tr=np.trace(U)/16; expected=-np.cos(np.pi*c)
    assert abs(tr-expected)<1e-8
    print(deg,round(tr,9),round(expected,9), 'orthogonality error',np.linalg.norm(U.T@U-I16))
    if deg==0:assert np.linalg.norm(U-I16)<1e-8
    if deg==90:assert np.linalg.norm(U+I16)<1e-8
print('PASS')
# Published rank-one valley projector: P_+(n)=(I+Gamma(n))/2.
# On the slice n in span(e0,e3,e4), the two connections coincide.
N=a*G[0]+b*G[3]; dN=G[4]; Qs=G[1]*G[2]
assert s.simplify(-(N*Qs)*(dN*Qs)/2-N*dN/2)==s.zeros(16)
# At n=e8, P+ is the upper 8-block. Curvature on the eight tangent directions
# spans all so(8), using the 28 distinct bivectors.
Pv=(Id+G[8])/2
assert Pv*Pv==Pv and s.trace(Pv)==8
curv=[(Pv*comm(G[i],G[j])*Pv/4)[:8,:8] for i,j in __import__('itertools').combinations(range(8),2)]
assert all(M.T==-M for M in curv)
flatten=s.Matrix([list(M) for M in curv]);assert flatten*flatten.T==2*s.eye(28)
print('rank-one projector: rank 8; 28 independent so(8) curvature matrices; common slice connection PASS')
