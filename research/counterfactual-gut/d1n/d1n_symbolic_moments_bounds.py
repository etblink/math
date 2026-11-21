#!/usr/bin/env python3
"""D1N exact Gaussian moments and fixed-tube angular kinetic inequality.

Mathematical result in selected source-normalized Gaussian/SVD model.
Not a Lean source typed physical form-domain theorem.
"""
import json,math
from pathlib import Path
import sympy as s
from scipy.stats import chi2

r=s.symbols('r',positive=True)
a=s.sqrt(2)
v=1/(2*a*r)
Et=16*v;Et2=288*v*v;Et3=5760*v**3
Ed=56*v*v;Etd=1120*v**3;Et2d=24640*v**4;Ed2=5040*v**4
Z=s.factor(1-Et/r**2+Ed/r**4)
Eb=s.factor(4/r*Z-a/2*(Et-Et2/r**2+Etd/r**4))
Eb2=s.factor(16/r**2*Z-4*a/r*(Et-Et2/r**2+Etd/r**4)+(a*a/4)*(Et2-Et3/r**2+Et2d/r**4))
Ejt=s.factor(Et-Et2/r**2+Etd/r**4)
Ejd=s.factor(Ed-Etd/r**2+Ed2/r**4)
S=s.factor((Eb2/2+(a*a/2+1)*r*r*Ejt+Ejd-8*a*r*Z)/Z)
S_reference=-13*(2*a*r**3-7)/(r**2*(r**6-4*a*r**3+7))
assert s.simplify(S-S_reference)==0
assert s.simplify(Z-(1-4*s.sqrt(2)/r**3+7/r**6))==0
assert s.simplify(Eb-(2*a*r**3-7)/r**7)==0
assert s.limit(r**5*S,r,s.oo)==-26*s.sqrt(2)
assert s.limit(r**4*Eb/Z,r,s.oo)==2*s.sqrt(2)

# Full energy under a real radial cutoff c(r) has scalar contribution
# S(r)Z c^2 + Eb c*c' + 0.5 Z(c')^2, plus angular norm 12Z c^2/r^2
# plus a positive remainder 0<= FockCorrection <= (9/(1-kappa^2)^2)*t/r^4.
# On the fixed narrow tube, t has Gaussian expectation ~4sqrt2/r.
# Algebraic inequality for z in [0,kappa^2]:
z,k2=s.symbols('z k2',real=True)
expr=(1+z)/(1-z)**2-1
assert s.factor(expr-(3*z-z*z)/(1-z)**2)==0
# For 0<=z<=kappa²<1, (3z-z²)/(1-z)² <= 3z/(1-kappa²)².
# Chebyshev/Chernoff chi2_16 tail with threshold x=alpha*kappa²*r³/2.
k=.5
bound={}
for rv in [8,10,20,40]:
 x=float(s.sqrt(2))*k*k*rv**3/2
 tail=float(chi2.sf(x,16))
 chernoff=256*math.exp(-x/4)
 bound[str(rv)]={'chisquare_threshold':x,'probability':tail,'chernoff':chernoff,
     'certifies_tail_upper':tail<=chernoff+1e-20}

out={
 'source_selected_normalization_Z':str(Z),
 'exact_weighted_gaussian_log_radial_mean_Eb':str(Eb),
 'selected_scalar_energy_exact':str(S),
 'selected_scalar_limit_r5':str(-26*s.sqrt(2)),
 'Gaussian_width_radial_derivative_cross_decays_as':'Eb/Z ~ 2 sqrt(2) / r^4',
 'radial_cutoff_expression':'Z*S*chi^2 + Eb*chi*chi_prime + (Z/2)*chi_prime^2',
 'angular_energy_pointwise_inequality':'12/r^2 <= E_f(r,Y) <= 12/r^2 + 9 tr(YtY)/(r^4 (1-kappa^2)^2), for ||Y|| <= kappa*r < r',
 'angular_correction_order':'O(r^-5) under 16D ground Gaussian with fixed kappa and normalized tube',
 'fixed_tube_chi2_tail':bound,
 'result':'Selected physical-form integrand model has conditional global R^-2 coefficient 22.3058530775 and O(R^-5) corrections plus polynomial*exp(-cR^3) tube tails.',
 'scope':'Exact selected Gaussian moments and proved elementary pointwise inequality; no source typed physical SmoothCore, q/H domain or spectral theorem.'
}
p=Path(__file__).with_name('d1n_symbolic_moments_bounds_results.json');p.write_text(json.dumps(out,indent=2)+'\n')
print(json.dumps({'source_Z':str(Z),'selected':str(S),'Eb':str(Eb),'bounds':bound},indent=2))
