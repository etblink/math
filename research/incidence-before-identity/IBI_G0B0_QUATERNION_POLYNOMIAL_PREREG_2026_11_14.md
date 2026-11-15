# IBI-G0B0 — preregistration: finite quaternion orientation polynomial

Date: 2026-11-14 Pacific / 2026-11-15 UTC. Status: P0 PROSPECTIVE, NOT LEAN QUALIFIED.
Branch: `research/bfss-incidence-unified-20261114`.
Qualified prerequisite: [IBI-G0A #43689689837](IBI_G0A_R1_GREEN_43689689837_ACCEPTANCE_2026_11_14.md).

## Why this subgate

The actual BFSS source's staged S1V52L9C1 module contains the 3x3
polynomial `originalQuaternionAdjointPolynomial`, with original
B=output/A=input color-index orientation. The separate C1 and L9C3
native-source bridge modules were historically described as
STAGED/UNQUALIFIED in their own source comments. No exact strict-green
L9C3 acceptance was found in the reviewed branch workflow inventory or
commit search; do not infer donor qualification from availability.

The small **mathematical** prerequisite can be proved without importing
those candidates: define the SAME 3x3 coefficient polynomial over
four freely varying real coordinates, and prove
`det(R)= (a²+b²+c²+d²)^3` by the literal 3x3 determinant formula and
ring normalization. This is a finite identity, not a replacement
SU(2) representation. A separately compiled consumer must test
unit-norm determinant +1 and a nontrivial quaternion coordinate
control. The old
[exact symbolic calculation](IBI_G0B_QUATERNION_DET_SYMBOLIC_CHECK_2026_11_14.md)
is a non-Lean positive control.

## What success establishes

Only the polynomial determinant identity. Even if GREEN, this does
NOT prove `Matrix.det (G3A.adjointColorMatrix g)=1`, as that conclusion
also needs source-exact native quaternion-coordinate normalization
and the original G3A-to-polynomial equality. It does NOT prove
surjectivity onto SO(3), oriented triple invariance, groupoid/Fock
descent, or any physical ontology.

## Test and stop contract

- Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- One mathematical source module, two or more genuinely separate
  downstream consumer tests, exact frozen Git blob pins, strict
  warning-as-error compilation, named `#print axioms` reports.
- Only `propext`, `Classical.choice`, `Quot.sound` or fewer. No
  `sorryAx`, `admit`, new axiom, `unsafe`, or tactic-limit masking.
- If polynomial normalization fails, record exact first-causal
  error and repair only the independent algebra module; do not
  edit original G2A/G3A or the spectral branch.
- Subsequent G0B1 must prove a full literal native original-source
  crosswalk and independently qualify the result, not simply import
  the unqualified L9C3 theorem as a trusted physical conclusion.

No existing accepted BFSS source, main, FCP, G9, or unified
integration files are changed by this research.
