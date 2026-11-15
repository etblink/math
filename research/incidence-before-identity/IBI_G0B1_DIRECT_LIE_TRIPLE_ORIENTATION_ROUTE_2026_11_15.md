# IBI-G0B1 — source-native orientation shortcut using Lie triple, not quaternion reconstruction

Date: 2026-11-15 Pacific. Status: forward research / preregistered alternative,
**no new source determinant theorem accepted**.
Isolated branch: `research/bfss-incidence-unified-20261114`.

## High-value deduction from accepted original-source infrastructure

G3A proves exact original real 3×3 color coefficient matrix
`R(g) B A = pairedAlgebraData.adjointCoefficient g A B`
(rows B=output, columns A=input), with
`adjointCoefficient_on_basis` and
`adjointColorMatrix_orthogonal`.
G1A strict GREEN #43693100174 proves the actual original
gauge conjugation preserves the original color-Lie inner triple.
G1B's PENDING source candidate #43695261997 attempts to normalize
that signed triple to `+sqrt(2) * colorCross·w`, grounded in
qualified P2-C0 original normalized Pauli structure constants.

**Observation:** These source objects give a potential *direct*
proof that `Matrix.det (G3A.adjointColorMatrix g)=1`
without importing staged quaternion normalization/whole-matrix
source bridges. Surjectivity onto SO3 still remains entirely separate.

## Explicit finite mathematical argument

Let `e_A` denote G3A's **actual** original `colorUnit A`.
Let `c_A = pairedAlgebraData.colorConjugate g e_A`.
G3A's exact basis lemma gives `(c_A)_B = R(g) B A`.
Define the signed triple
`T(u,v,w) = <sourceCross u v, w>`.

For any real 3×3 matrix `R`, the finite identity
```text
det R = T(column_0 R, column_1 R, column_2 R)
```
is an explicit nine-entry polynomial identity, provable by
`Matrix.det_fin_three`, source `colorCross`,
`PiLp.inner_apply`, finite sum expansion and `ring`.
The same identity evaluated at `R=I` gives
`T(e_0,e_1,e_2)=+1`.

Once G1B's source cross-triple invariance is **strictly GREEN**,
color conjugation on `e_A` gives
```text
T(c_0,c_1,c_2) = T(e_0,e_1,e_2) = +1.
```
By G3A basis/column identification the LHS is literally
`det (G3A.adjointColorMatrix g)`. Thus det=+1.
No generic `SU2→SO3` theorem, connectedness shortcut,
unqualified quaternion bridge, or sign assumption is used.

An alternate proof uses G1A directly:
```text
<L(c_0,c_1),c_2> =
<L(e_0,e_1),e_2> = +sqrt(2).
```
Normalize the two sides using source P2-C0 Pauli
structure constants; cancel nonzero `sqrt(2)`; obtain
the same determinant result.

## Lean gate DAG (bounded)

1. **FIN-DET3:** Prove generic matrix determinant equals the
   source `colorCross` of **columns** dotted with third column.
   Include an improper-reflection independent consumer returning -1
   to catch row/column transpositions and source sign errors.
2. **SOURCE-COLUMNS:** Prove `colorConjugate g (colorUnit A)`
   is exactly column A of `adjointColorMatrix g`, via preexisting
   G3A `adjointCoefficient_on_basis`; do not infer from textbook
   conventions.
3. **SOURCE-TRIPLE:** Consume G1B **strict-qualified** source
   cross-triple invariance (or G1A + explicit positive
   Pauli normalization) on three source color-unit vectors.
   If G1B is red, do not promote this gate or patch over an
   unqualified import.
4. **NATIVE-DET1:** Conclude
   `∀ g : GaugeGroup 2, (G3A.adjointColorMatrix g).det=1`
   with separate original-source consumer and `#print axioms`
   reports. Require Lean 4.34.1, pinned Mathlib,
   standard-only axiom policy, cold verified imported bytes and
   strict source+consumer GREEN on a tested exact SHA.
5. **G0C remains OPEN:** Containment of `R(g)` in SO3 is
   not equivalent to surjectivity; prove exact native covering
   separately. No rank-split G2 orbit classification before G0C.

## Strategic value and stop rule

This direct route is shorter and potentially lower-risk than
the previously staged S1V52 C1/C2C/L9C3 quaternion whole-matrix
crosswalk. Keep the accepted generic quaternion polynomial G0B0
as useful independent finite evidence; do not falsely equate it
with the exact original BFSS determinant theorem.

If two analogous native Lean reds arise, stop and inspect type
or coordinate coercion rather than doubling tactic resources.
If the original source fails to satisfy the required signed
column and triple statements, preserve the counterexample,
abandon the proposed bridge and re-open original source
normalization. Green proof of native det+1 would be eligible
as a future coherent **mathematics** package, not evidence that
Incidence Before Identity is fundamental or the BFSS
physical certificate is proved.

No modification to original G2A/G3A or integration/G9, main,
FCP or the frozen pilot.
