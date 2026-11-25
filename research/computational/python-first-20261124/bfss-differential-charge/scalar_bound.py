"""Scalar-only real profile obstruction in reconstructed finite source convention.
Gaussian f=exp(-alpha*r^2/2), density normalized in R^27.
Compare analytic moments to independent one-dimensional radial quadrature.
"""
import json,math
from pathlib import Path
from scipy.special import gammaln
from scipy.integrate import quad
from scipy.optimize import brentq
D=Path(__file__).resolve().parent;d=27;kappa=(36+8*math.sqrt(14))/25
# Conditional angular average of V_B at radius r from Wick moments: 216/(d*(d+2))*r^4.
coef=216/(d*(d+2))
def q1(a):return 27*a/4+54/a**2+783/8+837/a**3
def q0(a):return 27*a/4+54/a**2
root=brentq(lambda a:27/4-108/a**3-2511/a**4,1,20)
def integral(a):
    # z=alpha*r^2 ~ Gamma(d/2,1), no large dimensional numerical integration.
    return quad(lambda z:math.exp((d/2-1)*math.log(z)-z-gammaln(d/2))*(1+z/a)*(a*z/2+coef*(z/a)**2) if z else 0,0,math.inf,epsabs=1e-9)[0]
rows=[{'alpha':a,'q_H':q0(a),'q1_formula':q1(a),'q1_radial_quad':integral(a)} for a in [1,2,4,root,8]]
assert max(abs(r['q1_formula']-r['q1_radial_quad']) for r in rows)<1e-8
out={'dimension':d,'scalar_only_real_profile_lower_bound':d*d/8,'fixed_regulator_threshold':1/kappa,'gaussian_minimum_alpha':root,'gaussian_minimum_q1':q1(root),'rows':rows,'scope':'Analytic inequality on scalar-only real profiles in reconstructed finite singlet representation with adequate decay/integration by parts. Gaussian values independently quadrature-checked; no bound on mixed covariants or full S seed family.'}
(D/'scalar_bound_results.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
