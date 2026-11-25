"""Retrospective Python replay translation, not original executed JS.
Use from a scratch copy: python replay_matrix.py [mixed104 directory].
"""
import gzip, hashlib, json, sys
from fractions import Fraction as F
from pathlib import Path
if hasattr(sys, "set_int_max_str_digits"):
    sys.set_int_max_str_digits(0)
D = Path(sys.argv[1]) if len(sys.argv)>1 else Path(__file__).resolve().parent.parent / "bfss-mixed104"
def read(name, pin=None):
    b=(D/name).read_bytes()
    if pin:
        assert hashlib.sha1(b"blob "+str(len(b)).encode()+b"\0"+b).hexdigest()==pin
    return b
M=json.loads(gzip.decompress(read("mixed104_matrices.json.gz","07fb3c65e81b342034f2330d710bce400ab7ec05")))
rows=json.loads(read("mixed104_results.json"))["rows"]
w=json.loads(read("trial-104.json"))
pub=json.loads(read("published_witness104.json","491ee39a090df8ea0329875784831db105359e9d"))
lam=F(w["lambda_exact"])
coeff=dict(zip(w["labels"],map(F,w["reduced_basis_coefficients"])))
degrees=[r["power"]+(0 if r["seed"]=="S" else 3)+sum(2*(j+1)*x for j,x in enumerate(r["exponents"])) for r in rows]
c=[coeff[r["label"]]*lam**(d//2) for r,d in zip(rows,degrees)]
assert len(rows)==len(coeff)==104
pairs={}; symmetry=parity=0
for key in ("mass","H","q1"):
    A=M[key]; a=b=F(0)
    for i in range(104):
        for j in range(i,104):
            v=F(A[i][j]); assert v==F(A[j][i]); symmetry+=1
            p=(degrees[i]%2)+(degrees[j]%2)
            if key=="mass" and p==1: assert not v; parity+=1
            z=v*c[i]*c[j]*(1 if i==j else 2)
            if p==1: b+=z
            else: a+=z*lam**(p//2)
    pairs[key]=(a,b)
    assert pairs[key]==tuple(map(F,pub["quadratic_forms"][key]))
mass,odd=pairs["mass"]; assert mass>0 and odd==0
H=tuple(x/mass for x in pairs["H"]); Q=tuple(x/mass for x in pairs["q1"])
aux=tuple(x-y for x,y in zip(Q,H))
for k,pair in [("q_H",H),("q_aux",aux),("q1",Q)]:
    assert pair==tuple(map(F,pub["comparisons"][k]["exact_Q_sqrt_lambda"]))
lo,hi=map(F,pub["sqrt_lambda_bracket"]); assert lo*lo<lam<hi*hi
upper=max(Q[0]+Q[1]*lo,Q[0]+Q[1]*hi); assert upper<F(3,8)
bound=1-F(66,25)*upper
assert bound==F(pub["conditional_fidelity_lower_bound_rational"])
print(json.dumps({"symmetry_checks":symmetry,"mass_parity_checks":parity,"exact_matches":True,"conditional_fidelity":str(bound)},indent=2))
