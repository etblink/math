# IBI-G0B exact symbolic quaternion determinant check — not a Lean theorem

Date: 2026-11-14 Pacific. Scope: bounded exact-algebra calculation
using the **existing source** coefficient polynomial; no replacement
source BFSS model, no physical or ontology claim.

**Input:** the literal nine-entry formula in
`SU2BFSSPhysicalDomainS1V52L9C1OriginalPauliQuaternionTracePolynomialProbe.lean`
for `originalQuaternionAdjointPolynomial`, with original
output-row/input-column conventions.

**Reproduction (SymPy 1.14.0):**
```python
import sympy as s
a,b,c,d=s.symbols('a b c d',real=True)
R=s.Matrix([
 [a*a-b*b-c*c+d*d, 2*a*b+2*c*d, -2*a*c+2*b*d],
 [-2*a*b+2*c*d, a*a-b*b+c*c-d*d, 2*a*d+2*b*c],
 [2*a*c+2*b*d, -2*a*d+2*b*c, a*a+b*b-c*c-d*d]])
q=a*a+b*b+c*c+d*d
assert s.expand(R.det()-q**3)==0
# Explicit negative orientation control:
F=s.diag(1,1,-1)
assert s.expand((F*R).det()+q**3)==0
print("IBI_G0B_SYMBOLIC_DET_AND_REFLECTION_CONTROL_PASS")
```

The calculation completed with exact symbolic arithmetic. It reduces
`det R(p) - (a²+b²+c²+d²)³` to the zero polynomial. A one-row
reflection changes the sign of that determinant and is an explicit
negative orientation control.

**Claim ceiling:** This is an exact computational polynomial identity
for an existing coefficient formula, *not* a kernel-checked Lean theorem.
Crucially, it does **not** independently show the existing original
SU(2) source action has this matrix: native source G3A-to-quaternion
transport and native quaternion norm-one must separately qualify.
It also does **not** show surjectivity onto SO(3). Those are the named
IBI-G0B and G0C proof obligations. A strict axiom audit must use the
original source carriers and preserved signed Pauli normalization.
