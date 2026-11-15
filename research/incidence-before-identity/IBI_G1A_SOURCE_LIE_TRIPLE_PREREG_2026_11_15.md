# IBI-G1A — preregister source-exact Lie-triple incidence invariance

Pacific date 2026-11-15. Branch `research/bfss-incidence-unified-20261114`.
Status **P0, prospective, not yet Lean qualified**.

## New short source route (after G0A and G0B0 GREEN)

The *original BFSS* `GaugeGeometry.lean` already provides
`AlgebraData.colorConjugate_lie` and
`AlgebraData.spatialColor_gaugeConjugate`.
`GaugeOrbits.lean` provides `AlgebraData.colorConjugate_inner`.
G2A's `bosonGauge` is source-exact SU(2) conjugation and
G0A GREEN #43689689837 already binds this action to an original
`Boson 2` incidence theorem.

**Primary new original-carrier definition**
```text
L_ijk(x) = inner_R(
    pairedAlgebraData.colorLie(spatialColor x i, spatialColor x j),
    spatialColor x k).
```
This uses the original color Lie bracket and original normalized color
inner product; it does not invent an abstract SO(3) group or import a
new unverified quaternion crosswalk.

**G1A obligation**:
```text
L_ijk(G2A.bosonGauge g x) = L_ijk(x)
```
and the arrow consequence for `∃ g, bosonGauge g x = y`.
Prove by source `colorConjugate_lie`,
`colorConjugate_inner` and
`spatialColor_gaugeConjugate`. A separately compiled consumer must
instantiate both source laws on literal original bosonic carriers.

**Why order G1A before complete G0B1?** This triple's invariance follows
from the original adjoint Lie bracket and inner product. It is
independent of any newly qualified original-source quaternion
determinant-one theorem or an SO(3) image-surjectivity theorem.
We still require those for a final conventional SO(3) orbit
classification. This is an economical representation-free source
incidence test, not an ontological result.

## Explicit excluded claims and subsequent G1B

- This gate alone does NOT prove the signed nonzero source normalization
  `L_ijk = c D_ijk`, or any determinant classification.
  G1B must derive that original-source equality with the literal
  Pauli structure constants and a proven `c != 0` in the chosen
  orientation. A color-basis sign-flip witness and rank-three
  counterexample also remain separate.
- This does NOT establish image of G3A equals SO(3), orbit separation,
  quotient Jacobians, the original Fock gauge action or quantum states.
  G0B1 determinant +1 native bridge and G0C surjectivity stay open.

## Strict gate contract

Frozen original G0A/G2A/G3A source imports; Lean 4.34.1,
Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
One new original-source module, a separately compiled native
consumer and an independently pinned GitHub CI workflow.
Cold source build, fresh warning-as-error source, independent
consumer, named `#print axioms` roots; allow only
`propext`, `Classical.choice`, `Quot.sound`.
No `sorryAx`, new axiom, `admit`, `unsafe`, linter masking or
silent normalization changes.
If RED, stop at the first causal failure and preserve its
exact tested source and consumer. Do not alter any accepted prior
gate, the original integration G9 branch, main or FCP.
