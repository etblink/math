"""Relative Z2 transport readout. Finite quantum model, not a derivation of QM."""
import numpy as np
from itertools import product
I=np.eye(2,dtype=complex)
X=np.array([[0,1],[1,0]],complex)
H=np.array([[1,1],[1,-1]],complex)/np.sqrt(2)
Z=np.diag([1,-1]).astype(complex)
K=np.kron(H,I)
zero=np.diag([1,0]).astype(complex)
plus=np.array([1,1])/np.sqrt(2)
minus=np.array([1,-1])/np.sqrt(2)
states={'localized':zero,'symmetric':np.outer(plus,plus),'antisymmetric':np.outer(minus,minus),'mixed':I/2}
def phase_transport(a, rep):
    return I if a==0 else rep

def readout(A,B,rho,v):
    # path register 0/1, transport matrices A/B, equal endpoints
    C=np.block([[A,np.zeros((2,2))],[np.zeros((2,2)),B]])
    R=C@K@np.kron(zero,rho)@K.conj().T@C.conj().T
    # discard path coherence with probability 1-v
    D=np.kron(Z,I)
    R=(1+v)/2*R+(1-v)/2*D@R@D
    R=K@R@K.conj().T
    p=float(np.trace(R[:2,:2]).real)
    predicted=(1+v*np.trace(rho@A.conj().T@B).real)/2
    assert np.isclose(p,predicted,atol=1e-12)
    assert np.isclose(np.trace(R),1) and np.min(np.linalg.eigvalsh(R))>=-1e-12
    return p

checks=0
for n in (3,4,5,6):
    # loop split into two paths with common origin 0 and endpoint 1.
    # Z2 inverse equals itself, so complementary path uses signs[1:].
    for signs in product((0,1),repeat=n):
        for g in product((0,1),repeat=n):
            changed=tuple(signs[i]^g[i]^g[(i+1)%n] for i in range(n))
            for rep in (X,-I):
                A=phase_transport(signs[0],rep); B=phase_transport(sum(signs[1:])%2,rep)
                AA=phase_transport(changed[0],rep); BB=phase_transport(sum(changed[1:])%2,rep)
                G=phase_transport(g[0],rep)
                # operator overlap transforms by conjugation at origin
                assert np.allclose(AA.conj().T@BB,G@A.conj().T@B@G.conj().T)
                checks+=1
print('gauge covariance checks',checks)
for name,rho in states.items():
    print('swap representation',name,[(v,round(readout(I,I,rho,v),6),round(readout(I,X,rho,v),6)) for v in (0,.25,.5,.75,1)])
print('sign representation',[(v,round(readout(I,I,zero,v),6),round(readout(I,-I,zero,v),6)) for v in (0,.25,.5,.75,1)])
# Bare unitary channels U and -U coincide, despite relative controlled action differing.
for rho in states.values():
    assert np.allclose(I@rho@I,-I@rho@(-I))
# Negative control: uncontrolled arm phase phi mimics a Z2 sign.
for phi in (0,np.pi/3,np.pi/2,np.pi):
    assert np.isclose(readout(I,np.exp(1j*phi)*I,zero,1),readout(I,np.exp(1j*(phi+np.pi))*(-I),zero,1))
print('all assertions passed')
