#!/usr/bin/env python3
"""Independent algorithm for prospectively registered experiment E-M7-001-R1.

Reconstruct from pinned Lean source: 48x48 K0(X) = sum_{d,i}
X[d,i] kron(E_d,Gamma_i), with E_d the SU(2) epsilon matrices.

Unlike the pre-existing audit's basis construction and SVD singular
values, use Kronecker products and the Hermitian eigenvalues of i*K0.
Exact integer polynomial checks and source hash gate run independently.

Does NOT bind the unnormalized source fermion operator, its domain, or
physical coercivity. No full 2^24-dimensional Fock matrices.
"""
from __future__ import annotations
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import platform
import re
import numpy as np

ROOT = Path(__file__).resolve().parents[3]
GAMMA_PATH = ROOT/"lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean"
COLOR_PATH = ROOT/"lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2ColorCrossProbe.lean"
PINS = {
    GAMMA_PATH: "b9b8192055c70f0d001d7982669b9823c55562ed",
    COLOR_PATH: "209b3808222730ca5e817d83ed32253a67513f7f",
}
BOUND = 16*math.sqrt(2/3)
TOL = 3e-10

def check(condition, label):
    if not condition:
        raise AssertionError(label)

def get_source(path):
    b = path.read_bytes()
    obj = hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()
    check(obj == PINS[path], "pinned source changed: "+str(path))
    return b.decode("utf-8")

def gamma_from_source(content):
    section_a = content.split("private def perm",1)[1].split("private def sign",1)[0]
    section_b = content.split("private def sign",1)[1].split("private def gammaInt",1)[0]
    def rows(section):
        found = re.findall(r"\|\s*([0-8])\s*=>\s*!\[([^\]]*)\]",section)
        check(len(found)==9 and [int(k) for k,_ in found]==list(range(9)), "gamma source rows")
        arr = np.array([[int(v) for v in s.split(",")] for _,s in found], dtype=np.int64)
        check(arr.shape==(9,16),"gamma source dimensions")
        return arr
    p,s=rows(section_a),rows(section_b)
    gs=[]
    for j in range(9):
        check(sorted(p[j])==list(range(16)), "permutation pin")
        G=np.zeros((16,16), dtype=np.int64)
        for i in range(16):
            check(abs(s[j,i])==1,"sign pin")
            G[i,p[j,i]]=s[j,i]
        check(np.array_equal(G,G.T),"gamma symmetric")
        gs.append(G)
    eye=np.eye(16,dtype=np.int64)
    for j in range(9):
        check(np.array_equal(gs[j]@gs[j],eye),"gamma squares")
        for k in range(j):
            check(np.array_equal(gs[j]@gs[k]+gs[k]@gs[j],np.zeros((16,16),dtype=np.int64)),"gamma anticommutes")
    return gs

def epsilon_from_source(content):
    match=content.split("def epsilon3",1)[1].split("/--",1)[0]
    coeffs=re.findall(r"\|\s*([0-2]),\s*([0-2]),\s*([0-2])\s*=>\s*(-?1)",match)
    check(len(coeffs)==6 and "| _, _, _ => 0" in match,"epsilon source rows")
    e=np.zeros((3,3,3),dtype=np.int64)
    for d,a,c,v in coeffs:
        e[int(d),int(a),int(c)]=int(v)
    check(e[0,1,2]==1 and np.array_equal(e,-e.swapaxes(1,2)),"epsilon antisymmetry")
    return e

def make_components(gs,e):
    return [np.kron(e[d],gs[i]) for d in range(3) for i in range(9)]

def coefficient_matrix(components,x):
    z=np.zeros((48,48),dtype=np.int64 if np.issubdtype(x.dtype,np.integer) else np.float64)
    for n,m in enumerate(components):
        z+=x.reshape(-1)[n]*m
    return z

def direct_car_norm_from_hermitian(K):
    # i*K0 is Hermitian: its 48 real eigenvalues are the signed skew frequencies.
    # ||B_K|| = sqrt(2)/4 sum |eigval(i*K0)|, with theta_p^2=1/2.
    H=1j*K
    check(np.max(np.abs(H-H.conj().T))<1e-12,"Hermitian matrix")
    return float(math.sqrt(2)/4*np.abs(np.linalg.eigvalsh(H)).sum())

def determinant3(m):
    a,b,c=map(int,m[0]);d,e,f=map(int,m[1]);g,h,i=map(int,m[2])
    return a*(e*i-f*h)-b*(d*i-f*g)+c*(d*h-e*g)

def integer_poly_cases(components):
    seed=np.random.default_rng(20261112)
    preset={
        "rank1":np.diag([1,0,0]).astype(np.int64),
        "rank2":np.diag([2,1,0]).astype(np.int64),
        "rank3":np.diag([5,4,3]).astype(np.int64),
        "oblique":np.array([[1,2,0],[0,1,1],[2,0,1]],dtype=np.int64),
    }
    for i in range(12):
        preset["random_%02d"%i]=seed.integers(-2,3,(3,9),dtype=np.int64)
    answers=[]
    eye=np.eye(48,dtype=np.int64)
    for name,t in preset.items():
        x=np.pad(t,((0,0),(0,6))) if t.shape==(3,3) else t
        k=coefficient_matrix(components,x)
        q=int((x*x).sum())
        d=determinant3(x@x.T)
        k2=k@k;k4=k2@k2
        residual=k4@k2+2*q*k4+q*q*k2+4*d*eye
        mx=int(np.max(np.abs(residual)))
        check(mx==0,"integer polynomial counterexample "+name)
        answers.append({"configuration":name,"P":q,"D":d,"max_integer_residual":mx})
    return answers

def independent_cases(components):
    cases={
        "rank_one":np.diag([1.,0.,0.]),
        "rank_two_equal":np.diag([1.,1.,0.])/math.sqrt(2),
        "rank_three_equal":np.eye(3)/math.sqrt(3),
        "anisotropic":np.diag([7.,3.,1.])/math.sqrt(59),
        "near_valley":np.diag([100.,1.,0.])/math.sqrt(10001),
        "oblique":np.array([[1.,1.,1.],[0.,1.,1.],[1.,0.,2.]]),
    }
    rows=[]
    for name,t in cases.items():
        x=np.pad(t,((0,0),(0,6)))
        norm=np.linalg.norm(x)
        ratio=direct_car_norm_from_hermitian(coefficient_matrix(components,x))/norm
        check(ratio<=BOUND+TOL,"bound violated: "+name)
        rows.append({"configuration":name,"norm_ratio":ratio,"slack":BOUND-ratio})
    check(abs(rows[0]["norm_ratio"]-8*math.sqrt(2))<TOL,"rank-one control")
    check(abs(rows[2]["norm_ratio"]-BOUND)<TOL,"isotropic saturation")
    rng=np.random.default_rng(20261112)
    worst=0.
    for i in range(200):
        x=rng.normal(size=(3,9))
        ratio=direct_car_norm_from_hermitian(coefficient_matrix(components,x))/np.linalg.norm(x)
        check(ratio<=BOUND+TOL,"random norm bound violated: "+str(i))
        worst=max(worst,ratio)
    near={}
    for eta in (0.,.001,.01,.1,.25,.5,1.):
        x=np.pad(np.diag([1.,eta,eta]),((0,0),(0,6)))
        near[str(eta)]=direct_car_norm_from_hermitian(coefficient_matrix(components,x))/np.linalg.norm(x)
    # Two independent invariances: positive scaling and orthogonal color
    # mixing. The output is kept as a diagnostic, not an extra theorem.
    test=np.pad(np.array([[1.,2.,0.],[0.,1.,1.],[2.,0.,1.]]),((0,0),(0,6)))
    base=direct_car_norm_from_hermitian(coefficient_matrix(components,test))
    large=direct_car_norm_from_hermitian(coefficient_matrix(components,7*test))
    check(abs(large/7-base)<TOL, "homogeneity fails")
    rotation=np.array([[0.,-1.,0.],[1.,0.,0.],[0.,0.,1.]])
    rotated=direct_car_norm_from_hermitian(coefficient_matrix(components,rotation@test))
    check(abs(base-rotated)<TOL,"SO3 covariance under color rotation fails")
    # Deliberate false bound / wrong theta normalization must be rejected.
    check(rows[0]["norm_ratio"] > BOUND/2, "factor-two CAR negative control failed")
    return {"geometric_fixtures":rows, "random_count":200,
            "max_random_norm_ratio":worst,"near_valley":near,
            "scale_covariance_error":abs(large/7-base),
            "color_rotation_covariance_error":abs(base-rotated),
            "negative_wrong_half_bound_rejected":True}

def main():
    ap=argparse.ArgumentParser();ap.add_argument("--output",type=Path,required=True)
    args=ap.parse_args()
    gs=gamma_from_source(get_source(GAMMA_PATH))
    e=epsilon_from_source(get_source(COLOR_PATH))
    basis=make_components(gs,e)
    f=np.stack([b.reshape(-1) for b in basis])
    check(np.array_equal(f@f.T,32*np.eye(27,dtype=np.int64)),"Gram not 32 I")
    check(all(np.array_equal(b,-b.T) for b in basis),"skew basis")
    cases=integer_poly_cases(basis)
    nums=independent_cases(basis)
    result={"experiment":"E-M7-001-R1","status":"INDEPENDENT_FINITE_TESTS_ONLY_NOT_LEAN",
      "source_pins":{str(k.relative_to(ROOT)):v for k,v in PINS.items()},
      "method":"Kronecker coefficient reconstruction + eigenvalues of Hermitian i*K0",
      "python":platform.python_version(),"numpy":np.__version__,
      "bound":BOUND,"tolerance":TOL,
      "integer_polynomial_fixtures":cases,"numerical":nums,
      "physical_claim":False}
    args.output.parent.mkdir(parents=True,exist_ok=True)
    args.output.write_text(json.dumps(result,indent=2,sort_keys=True)+"\n")
    print("BFSS_E_M7_001_R1_INDEPENDENT_REPLICATION_PASS")
    print("bound:",BOUND,"max random ratio:",nums["max_random_norm_ratio"])

if __name__=="__main__":
    main()
