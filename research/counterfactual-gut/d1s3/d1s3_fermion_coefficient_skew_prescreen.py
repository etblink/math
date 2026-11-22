#!/usr/bin/env python3
"""D1S3 finite matrix prescreen for the ORIGINAL BFSS fermionCoefficient formula.

Tests coefficient form, NOT original gamma data: massT = skew real 16x16,
gamma[j] = symmetric real 16x16, structure constants = epsilon_ABC,
source-style x[j,C] real for j=0..8, color C=0..2. No Lean result.
"""
import json
import numpy as np
from pathlib import Path

rng = np.random.default_rng(20261123)
N_SPIN, N_COLOR, N_SPACE = 16, 3, 9

def color_so3():
    q, r = np.linalg.qr(rng.normal(size=(3,3)))
    q = q @ np.diag(np.where(np.diag(r)<0, -1.0, 1.0))
    if np.linalg.det(q)<0: q[:,0] *= -1
    return q

def epsilon3():
    e = np.zeros((3,3,3), float)
    e[0,1,2]=e[1,2,0]=e[2,0,1]=1.0
    e[2,1,0]=e[1,0,2]=e[0,2,1]=-1.0
    return e

EPS=epsilon3()

def coeff(mass, gam, x, f=EPS):
    # r=(a,A), s=(b,B), original: delta[A,B]*(3/2)*mass[a,b]
    #                  - sum_j,C f[B,A,C]*x[j,C]*gam[j,a,b]
    term_mass=(1.5*mass[:,None,:,None]*np.eye(3)[None,:,None,:])
    interaction=np.einsum('BAc,jc,jab->aAbB', f, x, gam, optimize=True)
    return (term_mass-interaction).reshape((48,48))

errs={"source_skew":0.0,"source_trace":0.0,"source_gauge_covariance":0.0,
      "source_skew_gauge_transport":0.0,"source_trace_gauge_transport":0.0}
controls={"nonsymmetric_gamma_min":float('inf'),"nonskew_mass_min":float('inf'),
          "wrong_color_transpose_min":float('inf'),"physical_nonzero_norm_min":float('inf')}
for _ in range(40):
    m=rng.normal(size=(16,16));m=(m-m.T)/2
    raw=rng.normal(size=(9,16,16));g=(raw+raw.transpose(0,2,1))/2
    x=rng.normal(size=(9,3))
    o=color_so3();t=np.kron(np.eye(16),o)
    c=coeff(m,g,x)
    cp=coeff(m,g,x@o.T)
    ct=t@c@t.T
    errs['source_skew']=max(errs['source_skew'],float(np.linalg.norm(c+c.T)))
    errs['source_trace']=max(errs['source_trace'],abs(float(np.trace(c))))
    errs['source_gauge_covariance']=max(errs['source_gauge_covariance'],float(np.linalg.norm(cp-ct)))
    errs['source_skew_gauge_transport']=max(errs['source_skew_gauge_transport'],float(np.linalg.norm(ct+ct.T)))
    errs['source_trace_gauge_transport']=max(errs['source_trace_gauge_transport'],abs(float(np.trace(ct))))
    # Falsifier families deliberately violate one source hypothesis at a time.
    antisymmetric_extra=rng.normal(size=(9,16,16));antisymmetric_extra=antisymmetric_extra-antisymmetric_extra.transpose(0,2,1)
    controls['nonsymmetric_gamma_min']=min(controls['nonsymmetric_gamma_min'],float(np.linalg.norm(coeff(m,g+0.3*antisymmetric_extra,x)+coeff(m,g+0.3*antisymmetric_extra,x).T)))
    symmetric_extra=rng.normal(size=(16,16));symmetric_extra=(symmetric_extra+symmetric_extra.T)/2
    controls['nonskew_mass_min']=min(controls['nonskew_mass_min'],float(np.linalg.norm(coeff(m+0.3*symmetric_extra,g,x)+coeff(m+0.3*symmetric_extra,g,x).T)))
    controls['wrong_color_transpose_min']=min(controls['wrong_color_transpose_min'],float(np.linalg.norm(cp-t.T@c@t)))
    controls['physical_nonzero_norm_min']=min(controls['physical_nonzero_norm_min'],float(np.linalg.norm(c)))
assert max(errs.values())<1e-10,errs
assert min(controls.values())>1,controls
result={"passed":True,"seed":20261123,"trials":40,"n_spin":16,"n_color":3,"n_space":9,
        "coeff_matrix_shape":[48,48],"max_residuals":errs,
        "negative_controls_min_residuals":controls,
        "source_formula":"C[(a,A),(b,B)] = 1.5*delta[A,B]*massT[a,b]-sum_j,c f[B,A,c]*x[j,c]*gamma[j,a,b]",
        "limitations":"Random skew massT and symmetric gamma satisfy the identities used in source skewness proof but do NOT realize original Clifford/gamma data; epsilon3 tests an SU2-style color algebra, not source construction; 48-index coefficient tests only, no 2**24 source Fock or Lean theorem."}
print(json.dumps(result,indent=2))
Path(__file__).with_suffix('.json').write_text(json.dumps(result,indent=2)+'\n')
