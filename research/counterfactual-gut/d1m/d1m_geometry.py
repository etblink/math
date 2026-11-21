#!/usr/bin/env python3
"""D1M original-Cl(9) 48-Majorana geometry checks, not a source-Lean proof."""
import numpy as np
from functools import reduce
I=np.eye(2,dtype=np.int64)
J=np.array([[0,1],[-1,0]],dtype=np.int64)
X=np.array([[0,1],[1,0]],dtype=np.int64)
Z=np.diag([1,-1]).astype(np.int64)
D={'I':I,'J':J,'X':X,'Z':Z}
words=['JIIJ','JIJX','JXJZ','JZJZ','JJIZ','JJXX','JJZX','XIII','ZIII']
G=np.stack([reduce(np.kron,(D[c] for c in w)) for w in words])
assert G.shape==(9,16,16)
assert all(np.array_equal(g,g.T) for g in G)
assert all(np.array_equal(G[i]@G[j]+G[j]@G[i],2*(i==j)*np.eye(16,dtype=np.int64)) for i in range(9) for j in range(9))
JP=np.kron(np.eye(8,dtype=np.int64),J)
assert np.array_equal(JP@JP,-np.eye(16,dtype=np.int64))
assert np.array_equal(G[8],np.diag([1]*8+[-1]*8))
EPS=np.zeros((3,3,3),dtype=np.int64)
for a,b,c in [(0,1,2),(1,2,0),(2,0,1)]:
    EPS[a,b,c]=1; EPS[a,c,b]=-1

def Jc(n):return np.einsum('a,abc->bc',n,EPS)
def Gamma(u):return np.einsum('i,ijk->jk',u,G)
def Cov(u,n):return -np.kron(Gamma(u),Jc(n))-np.kron(JP,np.outer(n,n))
def dCu(v,n):return -np.kron(Gamma(v),Jc(n))
def dCn(u,n,w):return -np.kron(Gamma(u),Jc(w))-np.kron(JP,np.outer(n,w)+np.outer(w,n))
def rotor(u):
    den=np.sqrt(2*(1+u[8]));assert den>0
    return (np.eye(16)+Gamma(u)@G[8])/den

def T(u,n):
    P=np.outer(n,n)
    return np.kron(np.eye(16),P)+np.kron(rotor(u),np.eye(3)-P)

def norm(v):return v/np.linalg.norm(v)
def random_tangent(rng,u):
    v=rng.normal(size=len(u));v-=v@u*u
    return norm(v)
def color_O(rng):
    A=rng.normal(size=(3,3));Q,R=np.linalg.qr(A)
    Q=Q@np.diag(np.sign(np.diag(R)))
    if np.linalg.det(Q)<0:Q[:,0]*=-1
    return Q

def curvature(C,A,B):
    return np.trace(C@(A@B-B@A))
def metric(A,B):
    return np.sum(A*B)/16

def geometry_tests():
    rng=np.random.default_rng(20261121)
    results={"gamma_source_pauli_words":words,"gamma_clifford_certified_integer":True,"gamma8_signs_even_pair":[int(G[8,2*j,2*j]) for j in range(8)],"tests":72}
    residuals={key:0. for key in ['purity','rotor','unitarity','transport','color_covariance','mixed_metric','u_metric','n_metric','u_u_curvature','n_n_curvature','mixed_curvature']}
    for k in range(72):
        u=norm(rng.normal(size=9));n=norm(rng.normal(size=3));a=random_tangent(rng,u);b=random_tangent(rng,u);v=random_tangent(rng,n);w=random_tangent(rng,n)
        c=Cov(u,n);C_u=dCu(a,n);C_b=dCu(b,n);C_n=dCn(u,n,v);C_w=dCn(u,n,w)
        r=rotor(u);O=color_O(rng);N=T(u,n)
        R=lambda E:float(np.max(np.abs(E)))
        residuals['purity']=max(residuals['purity'],R(c@c+np.eye(48)))
        residuals['rotor']=max(residuals['rotor'],R(r@G[8]@r.T-Gamma(u)))
        residuals['unitarity']=max(residuals['unitarity'],R(N.T@N-np.eye(48)))
        residuals['transport']=max(residuals['transport'],R(N@Cov(np.eye(9)[8],n)@N.T-c))
        residuals['color_covariance']=max(residuals['color_covariance'],R(Cov(u,O@n)-np.kron(np.eye(16),O)@c@np.kron(np.eye(16),O.T)))
        residuals['mixed_metric']=max(residuals['mixed_metric'],abs(metric(C_u,C_n)))
        residuals['u_metric']=max(residuals['u_metric'],abs(metric(C_u,C_u)-2))
        residuals['n_metric']=max(residuals['n_metric'],abs(metric(C_n,C_n)-4))
        residuals['u_u_curvature']=max(residuals['u_u_curvature'],abs(curvature(c,C_u,C_b)))
        residuals['n_n_curvature']=max(residuals['n_n_curvature'],abs(curvature(c,C_n,C_w)))
        residuals['mixed_curvature']=max(residuals['mixed_curvature'],abs(curvature(c,C_u,C_n)))
    results['max_abs_residuals']=residuals
    return results


def pole_stress():
    records=[]
    n=np.array([1.,0.,0.])
    basis1=np.eye(9)[1]
    for eps in (0.2,0.05,0.01,0.001,0.0001,0.000001):
        u=np.zeros(9);u[0]=np.sqrt(2*eps-eps*eps);u[8]=-1+eps
        v=basis1
        SU=rotor(u)
        dS=Gamma(v)@G[8]/np.sqrt(2*eps)
        P=np.outer(n,n)
        TN=T(u,n)
        dT=np.kron(dS,np.eye(3)-P)
        K=dT@TN.T
        c=Cov(u,n)
        dc=dCu(v,n)
        dcv=K@c-c@K
        records.append({"epsilon":eps,
           "raw_rotor_derivative_fro":float(np.linalg.norm(dS)),
           "raw_Majorana_generator_fro":float(np.linalg.norm(K)),
           "physical_covariance_derivative_fro":float(np.linalg.norm(dc)),
           "physical_Fock_FS_metric":float(metric(dc,dc)),
           "infinitesimal_covariance_residual":float(np.max(np.abs(dcv-dc))),
           "berry_generator_trace_abs":float(abs(np.trace(K@c)))})
    return records


if __name__ == "__main__":
    import json
    from pathlib import Path
    result=geometry_tests()
    result["pole_stress"]=pole_stress()
    output=Path(__file__).with_name("d1m_geometry_results.json")
    output.write_text(json.dumps(result,indent=2,default=float)+"\n")
    print(json.dumps({"results_file":output.name,"tests":result["tests"],"largest_purity_residual":result["max_abs_residuals"]["purity"],"deck_not_tested_here":True},indent=2))
