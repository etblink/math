# C0-A2: original nine-vector determinant and algebraic SO(9) packaging

**Status: candidate, pending strict compilation and retained-evidence review.**
The accepted Lipschitz action/restriction bridge supplies the actual source
representation. This gate attempts the remaining orientation argument from
memorandum K. It does not yet establish compactness or any spectral claim.

## Exact intended result

For every `g : spinGroup source9Quadratic`, prove

\[
 \det(R_9(g))=1,
 \qquad
 R_9=\texttt{source9SpinVectorMatrixHom}.
\]

The statement names the existing F10BR matrix on **original nine-vectors**.
It is not the determinant theorem for gamma16 or paired48. A new algebraic
`source9SpinVectorSpecialOrthogonalHom` would package the same existing
matrix into `Matrix.specialOrthogonalGroup SpaceIndex ℝ`; its action on
every original vector is explicitly identified with F10BP. No source
carrier, vector labels, topology, Clifford form or original action changes.

## Source-exact proof architecture

The [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineOrientation.lean)
proposes sixteen public roots in the following accountable stages:

1. Derive the original quadratic polarization as twice the real dot
   product, define its normalized polar row, and prove the actual row
   evaluates to normalized polarization and satisfies ell(a)=2.
2. Compute the exact rank-one matrix action `ell(z) a - z`. The matrix is
   `-(I - a ell^T)`, a line reflection. The determinant lemma gives
   `(-1)^9 (1-2) = +1`. The source48 determinant -1 is a proof pattern,
   not the nine-dimensional conclusion.
3. For every invertible source Clifford vector, construct its actual
   Lipschitz generator unit. Derive invertibility of its source quadratic
   value with `CliffordAlgebra.invertibleOfInvertibleι`; do not add it as
   an independent generator assumption. Identify its **actual accepted**
   linear action with the normalized rank-one matrix by the original
   Clifford conjugation law. Infer the actual determinant-unit value 1.
4. Propagate that character value through the literal algebraic Lipschitz
   subgroup using `Subgroup.closure_induction''`: generator, inverse
   generator, identity and product cases. No finite-word factorization,
   even-word premise, connectedness or topological closure is assumed.
5. Restrict along the accepted exact Spin-to-Lipschitz inclusion and use
   the accepted equality with the original F10BP representation. Transfer
   its determinant to the existing F10BR matrix via its actual `mulVec`
   identity. Package that matrix, unchanged, in the algebraic SO(9) group.

One private helper records the normalized row with quadratic invertibility
derived from Clifford-vector invertibility. Its code is pinned and its
axioms are covered transitively by public roots. The independent consumer
uses the explicit derived `letI` expression, not a guessed private name.

## Inputs inspected and successful/failed methods retained

The exact Lipschitz bridge at `ce15a36619804d51aff1c958ff3dd5f398ba416e`
qualified in [#42344283019](https://github.com/etblink/math/actions/runs/42344283019)
after full retained-evidence review. Its earlier source elaboration failure
and typed scalar/inverse repair remain documented. This gate reuses its
named interfaces without modifying them or adding scalar-action instances.

The source48 S1V37/K1D18B/C/I/L/O modules were inspected for rank-one
normalization, the actual Clifford-unit action, closure induction and exact
restriction. None is newly imported here. The original source9 F10BQ/BR
files are reused unchanged. Avoid giant original-form reductions and
uninstantiated scalar rewrites; keep the actual maps and inverse carriers
explicit. Default candidate proof budgets remain in force.

Pinned Mathlib at `d13f23b723b8a846827a245b89c10fc7d3f11612` was checked:

- `CliffordAlgebra/Inversion.lean`, blob
  `9b54663a469e5160c96b466c80e6f8b05ecc6ef2`, provides the actual
  `ι_mul_ι_mul_invOf_ι` conjugation formula under the displayed invertibility
  instances, with the multiplication order used here.
- `Matrix/SchurComplement.lean`, blob
  `5badd3a718bd2231da1e416e688a3d0265e8c819`, provides
  `det_one_add_replicateCol_mul_replicateRow`. The auxiliary row/column
  label is `Fin 1`, while the determinant's true carrier remains `Fin 9`.

## Verification contract

The [consumer](../../lean/diagnostics/BFSSSpectralSourceNineOrientationIndependentAudit.lean)
has sixteen explicitly typed examples: actual polarization/row evaluation,
normalization, genuine generator membership, matrix action/determinant,
actual generator-map equality with derived quadratic invertibility,
generator and whole-subgroup character values, inverse and Spin
specializations, original linear/matrix determinants, SO(9) homomorphism
type, original-vector action and equality with the existing F10BR matrix.
No covariance, generator value or whole-group orientation hypothesis is
added to the final all-source-element statements.

The [manifest](BFSS_SPECTRAL_SOURCE_NINE_ORIENTATION_MANIFEST_V1.json),
[qualifier](tools/qualify_spectral_source_nine_orientation.py),
[tests](tools/test_spectral_source_nine_orientation.py) and
[workflow](../../.github/workflows/bfss-spectral-source-nine-orientation-strict.yml)
pin 127 inputs: 94 original modules, one accepted source, two candidates
and 30 controls. Every original module matches preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`. BQ/BR add two unchanged
originals to the previous 92-module closure.

Delete and cold-rebuild all 97 controlled objects. Reaudit the accepted
Lipschitz source's ten roots under warnings as errors, plus the new source
and independent consumer's sixteen roots each: 42 reports across three
strict files. Only `propext`, `Classical.choice`, `Quot.sound` are allowed.
Retain exact inputs, complete compiler logs, compiler/dependency provenance,
object/log digests and a tested-commit receipt. The new wrapper extends the
qualified compiler procedure to an explicit accepted-source inventory;
it does not mutate an accepted helper's globals or change any old workflow.

Local source/dependency preflight, ten adversarial report tests and workflow
syntax checks precede submission. They are not Lean acceptance. Require a
complete fresh compiler gate and retained-evidence review. No BFSS proof
cache, axiom, linter waiver, new global instance or increased proof limit
is introduced. Failure classification and evidence retention remain mandatory.

## Admission boundary and next obligation

Only after the complete gate and evidence review pass may C0-A2 orientation
and the algebraic original SO(9) packaging be accepted. In particular the
all-Lipschitz character theorem would concern **untwisted** nine-vector
conjugation; it is not a claim about the standard twisted Pin reflection
map in arbitrary dimensions.

Next combine source orientation with native Cartan--Dieudonne factorization,
the separately qualified reflection-pair identity and source two-sign
fibers to test a bounded normalized word. The source quadratic unit locus,
fixed-eight padding/sign correction, continuity in the unchanged PBW
topology and compact-image surjectivity still require their own gates.
An SO(9)-valued homomorphism alone proves neither source compactness nor
covering, Fock/gauge implementation, closed-domain covariance or spectra.
