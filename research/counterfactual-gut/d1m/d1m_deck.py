#!/usr/bin/env python3
"""D1M exact 24-orbital deck-involution sign check, original Gamma7/Gamma8 pairing."""
import json
import numpy as np
import sympy as s
from d1m_geometry import G

# Path spatial u(t)=sin(t)e7+cos(t)e8: endpoint S_pi=Gamma7 Gamma8.
S = s.Matrix((G[7]@G[8]).tolist())
assert (S.T*S)==s.eye(16)
assert S*S==-s.eye(16)
# S preserves the real/imag pairing exactly along THIS path.
S_c = s.zeros(8)
for j in range(8):
    for k in range(8):
        S_c[j,k] = S[2*j,2*k]
        assert S[2*j+1,2*k+1] == S_c[j,k]
        assert S[2*j,2*k+1] == 0 and S[2*j+1,2*k] == 0
assert S_c.T*S_c == s.eye(8)
assert S_c.det()==1

# Spatial map rotates BOTH transverse colors identically, keeps longitudinal color0 fixed.
Us=s.zeros(24)
for j in range(8):
    for k in range(8):
        for c in (1,2): Us[3*j+c,3*k+c]=S_c[j,k]
    Us[3*j,3*j]=1
assert Us.det()==1

# Color pi rotation about e2 sends e0 -> -e0 and e1 -> -e1.
Oc=s.diag(-1,-1,1)
Uc=s.kronecker_product(s.eye(8),Oc)
assert Uc.det()==1
Q=Uc*Us
assert Q.det()==1

V=s.zeros(24,8)
for j in range(8):
    sj=1 if j<4 else -1
    V[3*j+1,j]=1/s.sqrt(2)
    V[3*j+2,j]=s.I*sj/s.sqrt(2)
assert V.conjugate().T*V==s.eye(8)
A=s.simplify(V.conjugate().T*Q*V)
assert Q*V==V*A
assert A.conjugate().T*A==s.eye(8)
assert A.det()==1

# Along the half-turn path, the spatial and color generators are both
# number conserving, traceless, and have exactly zero occupied expectation.
Ksp=s.zeros(24)
for j in range(8):
    for k in range(8):
        for c in (1,2): Ksp[3*j+c,3*k+c]=S_c[j,k]/2
Kcolor=s.kronecker_product(s.eye(8),s.Matrix([[0,-1,0],[1,0,0],[0,0,0]]))
assert (V.conjugate().T*Ksp*V).trace()==0
assert (V.conjugate().T*Kcolor*V).trace()==0
assert Ksp.trace()==0 and Kcolor.trace()==0
# S8/S2 deck transformation is a four-pair permutation with determinant (+1).
blocks=[]
for j in range(4):
    block=A.extract([j,j+4],[j,j+4]);assert block==s.Matrix([[0,1],[-1,0]])
    blocks.append(block.tolist())

out={"spatial_generator":"Gamma7 Gamma8","endpoint_spatial_SO16_determinant":str(S.det()),
     "spatial_oneparticle_U8_determinant":str(S_c.det()),"spatial_U24_determinant":str(Us.det()),
     "color_U24_determinant":str(Uc.det()),"deck_U24_determinant":str(Q.det()),
     "occupied_subspace_max_abs_residual":"0 (SymPy exact)",
     "occupied_8x8_restriction_determinant":str(A.det()),
     "four_occupied_2x2_blocks":str(blocks),
     "deck_eight_particle_wedge_character":"+1",
     "spatial_path_occupied_Berry_generator_trace":"0 (SymPy exact)",
     "color_path_occupied_Berry_generator_trace":"0 (SymPy exact)",
     "qualification":"exact finite-dimensional source Gamma7/Gamma8 orbit; Spin48 path and source carrier not formally proved"}
print(json.dumps(out,indent=2))
