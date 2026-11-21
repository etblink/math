#!/usr/bin/env python3
"""D1Q: direct finite-CAR Kato Fock-vector gauge equivariance prescreen.

Reduced original Gamma7/Gamma8 two-spin-pair / six-orbital carrier.
Checks normalized *vectors* (not merely rank-one projectors), with
source rows=output/cols=input color gauge. No 24-mode Lean typing.
"""
import json
import math
from pathlib import Path
from itertools import combinations
import numpy as np
from scipy.spatial.transform import Rotation

m=6;DIM=2**m
I2=np.eye(2,dtype=complex);Z=np.diag([1.,-1.]).astype(complex)
ANN=np.array([[0.,1.],[0.,0.]],complex)

def kron(seq):
    out=np.ones((1,1),complex)
    for v in seq:out=np.kron(out,v)
    return out

cre=[];gam=[]
for j in range(m):
    a=kron([Z]*j+[ANN]+[I2]*(m-j-1));cre.append(a.conj().T)
    gam.extend([a+a.conj().T,-1j*(a-a.conj().T)])
# gamma8 and gamma7 on four original spin labels (two paired modes); antisymmetry in spin pair j
G8=np.diag([1.,1.,-1.,-1.]);G7=np.block([[np.zeros((2,2)),np.eye(2)],[np.eye(2),np.zeros((2,2))]])
JP=np.kron(np.eye(2),np.array([[0.,1.],[-1.,0.]]))
EPS=np.zeros((3,3,3));
for a,b,c in [(0,1,2),(1,2,0),(2,0,1)]: EPS[a,b,c]=1;EPS[a,c,b]=-1

def J(n):return np.einsum('a,abc->bc',n,EPS)

def C(theta,n):
    G=np.cos(theta)*G8+np.sin(theta)*G7
    Cspin=-np.kron(G,J(n))-np.kron(JP,np.outer(n,n))
    # original Majorana labels: (j=0,1, color=0,1,2, parity=0,1)
    out=np.zeros((12,12))
    for sp1 in range(4):
      for sp2 in range(4):
        for c1 in range(3):
          for c2 in range(3):
            out[2*(3*(sp1//2)+c1)+(sp1%2),2*(3*(sp2//2)+c2)+(sp2%2)]=Cspin[3*sp1+c1,3*sp2+c2]
    return out

def H(C):
    Q=np.zeros((DIM,DIM),complex)
    for a in range(12):
      for b in range(a+1,12):Q-=.5j*C[a,b]*(gam[a]@gam[b])
    return Q

def projector(theta,n):
    h=H(C(theta,n));eye=np.eye(DIM,dtype=complex);p=eye.copy()
    for k in range(1,m+1):p=p@(((k-m/2)*eye-h)/k)
    return (p+p.conj().T)/2

vac=np.zeros(DIM,complex);vac[0]=1.
psi0=((cre[1]+1j*cre[2])/math.sqrt(2))@((cre[4]-1j*cre[5])/math.sqrt(2))@vac
psi0/=np.linalg.norm(psi0)
assert np.linalg.norm(projector(0.,np.array([1.,0.,0.]))@psi0-psi0)<1e-11

def transport(theta,ntarget,steps=48):
    e0=np.array([1.,0.,0.]);ntarget=np.asarray(ntarget,float);ntarget/=np.linalg.norm(ntarget)
    angle=math.acos(np.clip(e0@ntarget,-1,1));axis=np.cross(e0,ntarget)
    if np.linalg.norm(axis)<1e-10:
       if angle>math.pi/2:axis=np.array([0.,0.,1.])
       else:axis=np.array([0.,1.,0.])
    axis/=np.linalg.norm(axis)
    psi=psi0.copy();lowest=1.
    # First move along color orbit, then spatial Gamma7/8 great-circle.
    for k in range(1,steps+1):
       n=Rotation.from_rotvec(axis*angle*k/steps).apply(e0)
       nxt=projector(0.,n)@psi;amp=np.linalg.norm(nxt)
       if amp<.8:raise RuntimeError("Projection path under-resolved")
       lowest=min(lowest,amp);psi=nxt/amp
    for k in range(1,steps+1):
       nxt=projector(theta*k/steps,ntarget)@psi;amp=np.linalg.norm(nxt)
       if amp<.8:raise RuntimeError("Spatial path under-resolved")
       lowest=min(lowest,amp);psi=nxt/amp
    return psi,lowest

# Explicit exterior-power color representation on the original six orbital labels.
occupations=[tuple(j for j in range(m) if (p>>(m-1-j))&1) for p in range(DIM)]

def exterior(U):
    W=np.zeros((DIM,DIM),complex)
    for p,out in enumerate(occupations):
       for q,inp in enumerate(occupations):
          if len(out)==len(inp):W[p,q]=np.linalg.det(U[np.ix_(out,inp)]) if len(out)>0 else 1.
    return W

def sample():
    rng=np.random.default_rng(20261121)
    errors={'C_source_gauge':0.,'P_source_gauge':0.,'W_unitarity':0.,'W_creator_covariance':0.,
            'Kato_vector_gauge':0.,'Kato_vector_identity_phase':0.,'wrong_transpose_min_error':float('inf'),
            'Kato_projector_range':0.}
    cases=[]
    for k in range(10):
        O=Rotation.from_rotvec(rng.normal(size=3)*rng.uniform(.2,1.9)).as_matrix()
        theta=float(rng.uniform(-1.3,1.3))
        n=Rotation.from_rotvec(rng.normal(size=3)*rng.uniform(.2,1.2)).apply([1.,0.,0.])
        Oorb=np.kron(np.eye(2),O)
        W=exterior(Oorb)
        T=np.kron(Oorb,np.eye(2))
        Ca=C(theta,n);Cb=C(theta,O@n)
        errors['C_source_gauge']=max(errors['C_source_gauge'],np.linalg.norm(Cb-T@Ca@T.T))
        Pa=projector(theta,n);Pb=projector(theta,O@n)
        errors['P_source_gauge']=max(errors['P_source_gauge'],np.linalg.norm(Pb-W@Pa@W.conj().T))
        errors['W_unitarity']=max(errors['W_unitarity'],np.linalg.norm(W@W.conj().T-np.eye(DIM)))
        for j in [0,1,3]:
           target=sum(Oorb[i,j]*cre[i] for i in range(m))
           errors['W_creator_covariance']=max(errors['W_creator_covariance'],np.linalg.norm(W@cre[j]@W.conj().T-target))
        ps,lo1=transport(theta,n,steps=48)
        pt,lo2=transport(theta,O@n,steps=48)
        check= W@ps
        vecerr=np.linalg.norm(pt-check)
        errors['Kato_vector_gauge']=max(errors['Kato_vector_gauge'],vecerr)
        errors['Kato_vector_identity_phase']=max(errors['Kato_vector_identity_phase'],abs(np.vdot(pt,check)-1))
        errors['Kato_projector_range']=max(errors['Kato_projector_range'],np.linalg.norm(Pa@ps-ps),np.linalg.norm(Pb@pt-pt))
        Wwrong=exterior(np.kron(np.eye(2),O.T))
        errors['wrong_transpose_min_error']=min(errors['wrong_transpose_min_error'],float(np.linalg.norm(pt-Wwrong@ps)))
        cases.append({'case':k,'theta':theta,'Fock_vector_error':float(vecerr),
                      'wrong_transpose_error':float(np.linalg.norm(pt-Wwrong@ps)),
                      'source_group_unitarity_error':float(np.linalg.norm(W@W.conj().T-np.eye(DIM))),
                      'min_path_projection_overlap':float(min(lo1,lo2))})
    # 2pi physical SO3 color orbit is a nontrivial loop in SO3, but source exterior Fock U(2pi)=I.
    loop=[]
    for steps in [24,48,96]:
        psi=psi0.copy();minimum=1.
        for j in range(1,steps+1):
           n=Rotation.from_rotvec([0.,0.,2*math.pi*j/steps]).apply([1.,0.,0.])
           nxt=projector(0.,n)@psi;z=np.linalg.norm(nxt);minimum=min(minimum,z);psi=nxt/z
        loop.append({'steps':steps,'return_phase':complex(np.vdot(psi0,psi)).real,
                     'return_phase_imag':complex(np.vdot(psi0,psi)).imag,
                     'minimum_projection_overlap':float(minimum)})
    for key in ['C_source_gauge','P_source_gauge','W_unitarity','W_creator_covariance','Kato_vector_gauge','Kato_vector_identity_phase','Kato_projector_range']:
        assert errors[key]<2e-8,(key,errors[key])
    assert errors['wrong_transpose_min_error']>.02
    assert max(abs(x['return_phase']-1)+abs(x['return_phase_imag']) for x in loop)<1e-8
    return {'status':'PASS','random_seed':20261121,'cases':len(cases),
         'max_errors_except_transposed_negative':{k:float(v) for k,v in errors.items() if k!='wrong_transpose_min_error'},
         'wrong_transpose_min_error':float(errors['wrong_transpose_min_error']),
         'reduced_2pair_6mode_cases':cases,
         'full_SO3_color_loop_kato':loop,
         'qualification':'six-mode reduced CAR projector/actual exterior color lift; full 24-mode carrier Kato vector and original Lean physical invariantCore not yet compiled'}

if __name__=='__main__':
    d=sample();Path(__file__).with_name('d1q_kato_source_gauge_prescreen_results.json').write_text(json.dumps(d,indent=2)+'\n');print(d['status'],d['max_errors_except_transposed_negative'],'wrong_transpose_min',d['wrong_transpose_min_error'])
