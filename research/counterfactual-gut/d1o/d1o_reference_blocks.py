#!/usr/bin/env python3
"""Exact SymPy 3-orbital BFSS per-spin-pair Gaussian/reference projector identity.

Source labels: spin pair j has two Majorana components r=0,1 for each
color a=0,1,2; Gamma8 diagonal gives s=+/- per spin pair.
The global eight-particle state is a graded tensor product of eight blocks;
this script certifies each 3-mode local block, not a 2^24 dense matrix.
"""
import json
from pathlib import Path
import sympy as S

I=S.I
z=S.Integer(0)
one=S.Integer(1)
Id=S.eye(2)
Z=S.diag(1,-1)
A=S.Matrix([[0,1],[0,0]])

def kron(mats):
    out=S.ones(1)
    for p in mats:out=S.kronecker_product(out,p)
    return out

m=3;cdag=[];gamma=[]
for j in range(m):
    c=kron([Z]*j+[A]+[Id]*(m-j-1))
    cdag.append(c.conjugate().T)
    gamma.extend([c+c.conjugate().T,-I*(c-c.conjugate().T)])
vac=S.zeros(8,1);vac[0,0]=1
J=S.Matrix([[0,1],[-1,0]])
Jc=S.Matrix([[0,0,0],[0,0,1],[0,-1,0]])
n=S.Matrix([1,0,0]);Pn=n*n.T

def calcc(s):
    psi=(cdag[1]+I*s*cdag[2])*vac/S.sqrt(2)
    assert S.simplify((psi.conjugate().T*psi)[0])==1
    C=S.zeros(6)
    for a in range(6):
      for b in range(a+1,6):
        C[a,b]=S.simplify(I*(psi.conjugate().T*gamma[a]*gamma[b]*psi)[0]);C[b,a]=-C[a,b]
    Csrc=S.zeros(6)
    for a in range(3):
      for b in range(3):
        for r in range(2):
          for t in range(2):
            Csrc[2*a+r,2*b+t]=-s*int(r==t)*Jc[a,b]-J[r,t]*Pn[a,b]
    assert C==Csrc,(C,Csrc)
    assert C*C==-S.eye(6)
    H=S.zeros(8)
    for a in range(6):
      for b in range(a+1,6):H+=(-I*S.Rational(1,2))*C[a,b]*gamma[a]*gamma[b]
    assert H==H.conjugate().T
    assert S.simplify(H*psi+S.Rational(3,2)*psi)==S.zeros(8,1)
    P=S.eye(8)
    for k in range(1,4):P=P*((S.Rational(-3,2)+k)*S.eye(8)-H)/k
    exact=S.simplify(P-psi*psi.conjugate().T)
    assert exact==S.zeros(8)
    # Exact stabilizer phase under 90 degree color rotation about e0.
    O=S.Matrix([[1,0,0],[0,0,-1],[0,1,0]])
    v=S.Matrix([0,1,I*s])/S.sqrt(2)
    assert S.simplify(O*v-(-I*s)*v)==S.zeros(3,1)
    return {'gamma8_sign':s,'covariance_matches_source':True,'covariance_purity_exact':True,
      'ground_energy':str((psi.conjugate().T*H*psi)[0]),'projector_matches_Slater_exact':True,
      'fourth_turn_stabilizer_character':str(-I*s),'state_occupied_orbital':[str(v[i]) for i in range(3)]}

def run():
    rows=[calcc(1),calcc(-1)]
    signs=[1]*4+[-1]*4
    # An entire stabilizer SO2 rotation has individual character exp(-i*s*theta).
    theta=S.symbols('theta',real=True)
    global_char=S.simplify(S.exp(-I*theta*sum(signs)))
    negative_char=S.exp(-I*theta*8)
    assert global_char==1 and negative_char!=1
    return {'qualification':'exact 8x8 local Fock block SymPy identity; eight-block tensor-product deduction, not compiled original Fermion 2 source',
       'gamma8_sign_balance':signs,'positive_negative_counts':[4,4],
       'local_blocks':rows,'eight_block_stabilizer_character':str(global_char),
       'wrong_all_plus_character':str(negative_char),
       '24_mode_reference_ground_energy':-12,
       '8_particle_reference_description':'prod_j[(c_j1^dag+i*s_j*c_j2^dag)/sqrt2]|vac>'}

if __name__=='__main__':
    r=run();Path(__file__).with_name('d1o_reference_blocks_results.json').write_text(json.dumps(r,indent=2)+'\n')
    print(json.dumps(r,indent=2))
