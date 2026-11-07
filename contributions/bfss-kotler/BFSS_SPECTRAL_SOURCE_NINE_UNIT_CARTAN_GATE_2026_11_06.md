# Source-nine ordered Q-unit Cartan list of even length at most eight

**Status: candidate, pending strict compilation and retained-evidence review.**
C0-A1 reflection pairs and C0-A2 orientation are separately qualified. This
gate tests the next finite-dimensional factorization obligation. Its result
would be a reflection list for the actual source action, not an exact
Clifford-word factorization of the source group element or compactness.

## Exact intended statement

For every literal `g : spinGroup source9Quadratic`, find an ordered list
`l : List (SpaceIndex → ℝ)` such that every member satisfies the **original**
`source9Quadratic u = 1`, the length is even and at most eight, and

\[
 E\,R_9(g)\,E^{-1}
 =\prod_{u\in l}^{\mathrm{ordered}}(\mathbb R E(u))^\perp\!\operatorname{.reflection}.
\]

Here `E = source9ToEuclidean` is the already qualified same-label coordinate
equivalence into `EuclideanSpace ℝ SpaceIndex`, and `R9` is the original
F10BP representation. The Pi norm is not equated definitionally with L2
norm. The left side is explicitly constructed and identified with the
original action on every vector. The right side uses the native Mathlib
hyperplane reflections with their original list-product order.

## Source-exact stages

The [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineUnitCartan.lean)
proposes twenty public roots:

1. Conjugate the actual F10BQ quadratic isometry by the existing `E`,
   derive L2 norm preservation from the accepted original Q/norm-square
   identity, and package a native Euclidean isometry. Prove its exact
   action on original coordinates and transfer the qualified determinant
   +1 via `LinearEquiv.det_conj`.
2. Apply pinned native Cartan--Dieudonne, which initially gives arbitrary
   normals and length at most the actual finrank nine. For a zero normal,
   the native hyperplane factor is **identity**. Remove it. Normalize
   every nonzero normal by inverse norm, prove its line and native
   hyperplane reflection unchanged, and preserve the entire ordered product.
3. Prove the determinant of each retained unit hyperplane reflection is
   -1 using the native orthogonal-complement/span dimension theorem. Prove
   the list-product determinant is `(-1)^length`; determinant one gives
   evenness only **after** zero removal. Even length at most nine implies
   length at most eight.
4. Pull the unit normals back through the same `E.symm` and discharge
   original source Q-unit membership by its norm-square identity. Preserve
   length, parity and the exact native reflection product.

No single Clifford vector is asserted to belong to Spin. The source
element itself is not identified with a product of embedded vectors here;
the action's two-sign fiber remains relevant to that later lifting step.

## Reuse, API inspection and failure controls

Reuse the qualified original source orientation, reflection/Euclidean
bridge and Lipschitz source files unchanged. Inspect the older source48
V7C/E/H/I/J/K/L proof patterns for norm/determinant transport, zero-normal
handling, normalization, ordered products and parity, without importing
their 48-dimensional conclusions. Every new statement uses the actual
nine-label original representation and original Q.

Pinned Mathlib `Analysis/InnerProductSpace/PiL2.lean` at
`d13f23b723b8a846827a245b89c10fc7d3f11612`, blob
`2b67b8cc8a3eab5000f6646b8c9115c5b55a963f`, was inspected for the exact
`finrank_euclideanSpace` simplification. Native reflection and Cartan API
use follows the previously qualified source patterns at the same pin.
Do not assume arbitrary Cartan normals are nonzero/unit, or infer parity
from a raw list containing zero identity factors. Preserve composition
order. Distinguish actual source Q-unit membership from a Pi-unit claim.

Follow the evergreen's bounded source-specialization/composition method.
The previous orientation gate's style red remains retained; use ordinary
proof-local bindings and keep all linter and warning policies enabled.
No proof-resource increase, extra global instance or surrogate action is
introduced. Diagnose the earliest causal failure before any repair.

## Independent verification

The [consumer](../../lean/diagnostics/BFSSSpectralSourceNineUnitCartanIndependentAudit.lean)
contains twenty complete-type examples. Besides the construction,
normalization, product and parity interfaces, it checks both final
factorizations, original Q-unit witnesses, a pointwise equality on every
original vector, and deletion of the concrete singleton zero list.
All twenty roots are independently re-audited.

The [manifest](BFSS_SPECTRAL_SOURCE_NINE_UNIT_CARTAN_MANIFEST_V1.json),
[qualifier](tools/qualify_spectral_source_nine_unit_cartan.py),
[tests](tools/test_spectral_source_nine_unit_cartan.py) and
[workflow](../../.github/workflows/bfss-spectral-source-nine-unit-cartan-strict.yml)
pin 129 inputs: 94 unchanged originals, three qualified source modules,
two candidates and 30 controls. The exact imported closure is checked.
All 99 controlled objects are deleted and cold-rebuilt. The three accepted
sources contribute 35 strict root reports; new source and consumer add
twenty each, for 75 reports and five completion markers. Only the three
standard foundational axioms are permitted. Retain complete inputs/logs,
compiler/dependency provenance and exact-commit digest receipts.

Local preflight, ten adversarial report tests and workflow syntax checks
must pass before submission. They are not Lean acceptance. Require the
full compiler gate and retained-evidence review. Existing qualifiers and
workflows, guarded-cache contracts and all accepted Lean sources remain
unchanged; no BFSS proof-object cache is used by this new gate.

## Next obligation and limits

If this gate qualifies, next lift the even reflection list using the
qualified actual source unit-pair theorem. Establish exact ordered source
products, handle the source two-sign correction, and pad to **exactly**
eight Q-unit factors. An action-level reflection list alone does not
establish that exact source Clifford word.

Only then attempt compactness of the original Q-unit parameter space,
continuity of the fixed-word map in the unchanged PBW topology and its
surjectivity onto the literal source Spin group. A continuous choice of
factorization as a function of g is not assumed. Covering, Fock/gauge
implementation, physical closed domains, branching, coercivity and
spectral existence retain their separate obligations.


## Run #42352505826 — scoped acceptance of C0-A3 (2026-11-07)

The dedicated [Cartan strict gate](https://github.com/etblink/math/actions/runs/42352505826)
completed **green** on the exact tested source commit `b3bb2bd77498251dc6361e143ac7713b05d150a3`.
The downloaded retained artifact **13567145779** has ZIP SHA-256
`19d2ffd6a3d22efcbab9a2ca20d32d1b33721ed5074040920c5d86bb16ebcb19` and receipt SHA-256
`bbfb318022646fb86dbcf083480c4cdbcb5b269a91dd5269ddf6b9c924d1894b`; both match the reviewed bytes.

The receipt records 99 successful cold compilation exits, 99 matching log digests,
42 dependency revisions, five completion markers and 75 strict axiom reports.
All 75 report names and permitted axiom sets were independently replayed from the
retained logs; no candidate/ancestor build log has an error or warning diagnostic,
and no recovery axiom is present. The new source and its twenty independent
complete-type consumers passed. The original source, reflection pair, orientation,
Lipschitz interfaces, exact dependency pins and strict gate policy remain unchanged.
The tested repair was only the determinant coercion normalization using
`Units.val_one` plus its manifest integrity pins.

[Scoped acceptance JSON](evidence/spectral-confinement-2026-11-06/source-nine-unit-cartan-42352505826-acceptance.json)
records the run/commit identity, artifact digests, checks and explicit nonclaims.
This documentation-only acceptance does **not** change the tested proof source.
The original nine-vector action is now proved to admit an **ordered, even** list
of **at most eight** original Q-unit hyperplane-reflection factors.

**Next separate gate, C0-A4:** lift consecutive unit reflection pairs through
the already qualified source unit-pair Spin theorem, prove ordered equality of
their *original vector actions*, invoke the accepted two-sign fiber theorem to
recover the **actual source group element**, correct a negative fiber by the
appropriate sign change on one Q-unit factor, and pad by identity pairs to
**exactly eight** factors. Check the source Clifford sign, order, zero-length
case and pair-padding identity without using 48-dimensional conclusions.
No continuous choice of witnesses is required. Only after this exact fixed-word
gate may PBW-continuity of the fixed eight-factor map and compact-image
surjectivity be proposed. Full spectral existence remains open.
