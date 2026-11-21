#!/usr/bin/env python3
"""Numerical Berry/Kato projector transport for the D1O 6-mode reduced source model.
Check deck loop and color loop; no full 24-mode or Lean qualification.
"""
import json
import numpy as np
from pathlib import Path
from d1o_projector_geometry import Cgeom,gamma,create,SQ2,m
from d1o_clifford_projector import quadratic,ground_polynomial

vac=np.zeros(2**m,complex);vac[0]=1
psi0=((create[1]+1j*create[2])/SQ2)@((create[4]-1j*create[5])/SQ2)@vac
psi0=psi0/np.linalg.norm(psi0)

def projector(t,kind):
    if kind=='deck':
        uangle=t
        nn=np.array([np.cos(t),np.sin(t),0.])
    elif kind=='color':
        uangle=0
        nn=np.array([np.cos(t),np.sin(t),0.])
    else:raise ValueError(kind)
    C=Cgeom(uangle,nn)
    return ground_polynomial(quadratic(C,gamma),m)

def transport(kind,steps):
    final=np.pi if kind=='deck' else 2*np.pi
    psi=psi0.copy();minimum=1
    for k in range(1,steps+1):
        P=projector(final*k/steps,kind)
        nxt=P@psi
        amp=np.linalg.norm(nxt)
        assert amp>.95,(kind,k,amp)
        minimum=min(minimum,amp)
        psi=nxt/amp
    overlap=np.vdot(psi0,psi)
    target=1.0+0j
    return {'path':kind,'steps':steps,'final_P_minus_P0':float(np.linalg.norm(projector(final,kind)-projector(0,kind))),
        'parallel_overlap_real':float(overlap.real),'parallel_overlap_imag':float(overlap.imag),
        'parallel_phase_error_from_plus_one':float(abs(overlap-target)),
        'min_adjacent_projection_norm':float(minimum)}

def run():
    output=[transport(k,s) for k in ('deck','color') for s in (24,48,96)]
    for o in output:assert o['final_P_minus_P0']<1e-10
    assert max(o['parallel_phase_error_from_plus_one'] for o in output)<1e-7,output
    return {'qualification':'reduced 6-mode Kato transport numerical check only','scheme':'psi_next=P(C_next) psi_current / ||P(C_next) psi_current||',
     'deck':'u angle 0->pi, color n half-turn, endpoints C identical',
     'color':'u fixed, color n full great-circle, endpoints identical',
     'results':output}

if __name__=='__main__':
    ans=run();Path(__file__).with_name('d1o_kato_transport_results.json').write_text(json.dumps(ans,indent=2)+'\n')
    print(json.dumps(ans,indent=2))
