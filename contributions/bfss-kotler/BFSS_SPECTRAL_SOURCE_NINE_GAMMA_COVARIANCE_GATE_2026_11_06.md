# P1-gamma: global original-source gamma covariance

**Status: candidate, pending strict compilation and retained-evidence review.**
This is the independent microgate proposed in sections J.5/J.6 of the
[research memorandum](BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md).
It is distinct from source nine-vector determinant C0-A2 and compactness.

## Scientific question and exact boundary

Does the literal algebraic source Spin9 action on original nine-vectors
intertwine the original real gamma16 evaluation globally, for every group
element, with the exact multiplication and inverse conventions?

Writing `R9 = source9SpinVectorRepresentation`,
`G = source9SpinGammaSpecialOrthogonalHom` and
`gamma = gammaNineRealLinear`, the main candidate identity is

\[
 G(g)\,\gamma(z)\,G(g^{-1})=\gamma(R_9(g)z).
\]

The proposed source also proves the equivalent multiplication orientation
`G(g) gamma(z) = gamma(R9(g) z) G(g)` and the inverse orientation
`G(g⁻¹) gamma(R9(g) z) G(g) = gamma(z)`. The quantifiers use the **entire
literal** `spinGroup source9Quadratic`, original `SpaceIndex → ℝ`, original
`GammaMatrix` and actual existing homomorphisms. No covariance hypothesis,
replacement representation, one-parameter restriction or derivative is assumed.

Six proposed roots cover the Clifford AlgHom bridge, matrix-units covariance,
SO(16) covariance, both orientations, and specialization to the original
gamma product of an actual normalized source pair. The AlgHom is applied
directly to F10BO's embedded vector-conjugation identity; F10BP supplies
the exact original nine-vector representation. F10BC and the earlier matrix
units homomorphism supply named matrix presentations. The pair specialization
uses F10BH, with its two source-Q unit premises retained.

This establishes no Fock-vector/48-label implementation, gauge compatibility,
closed-core/form/operator covariance, continuity, Spin9 compactness, native
nine-vector determinant, confinement or spectral existence. In particular
this small algebraic P1-gamma component does **not** discharge all of P1.

## Why this bounded gate follows the green reflection-pair gate

Green [#42339266687](https://github.com/etblink/math/actions/runs/42339266687)
qualified C0-A1 after retained-artifact review. Its exact source/consumer
result is recorded separately; the present gamma gate does not require
or import that new reflection theorem.

The next C0-A2 audit inspected the old source48 Lipschitz action,
representation and closure-induction architecture, and the original
rank-one determinant proof. A possible odd-nine-dimensional simplification
is preserved in memorandum section K: single **untwisted** Clifford line
reflections already have determinant +1 in odd dimension. The full source9
Lipschitz representation, generator-matrix bridge, closure character and
restriction to the existing nine-vector action still need source-exact
proofs. No 48-dimensional theorem is silently reused as a nine-dimensional
conclusion, and the volume/normalized-word alternatives remain available.

The gamma identity resolves a different, smaller compatibility question
using interfaces already present in the same cold-build closure. Selecting
it now does not assert C0-A2, discard compactness, or assume a physical
action. It follows the evergreen preference for a small exact source law
before a larger new proof architecture.

## Verification contract

The [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean)
has six roots. The [independent consumer](../../lean/diagnostics/BFSSSpectralSourceNineGammaCovarianceIndependentAudit.lean)
has eight complete-type examples: original Clifford bridge, matrix-units
conjugation, SO conjugation, multiplication orientation, inverse orientation,
actual pair specialization, original vector-conjugation presentation and
function equality on all original nine-vectors. It reprints all six root
axiom dependencies, for twelve reports across the two strict files.

The [manifest](BFSS_SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_MANIFEST_V1.json),
[qualifier](tools/qualify_spectral_source_nine_gamma_covariance.py),
[tests](tools/test_spectral_source_nine_gamma_covariance.py) and
[workflow](../../.github/workflows/bfss-spectral-source-nine-gamma-covariance-strict.yml)
retain the successful reflection gate's verification method. The original
92-module closure is identical and matches preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`. All 124 inputs are pinned,
including two new candidates and 30 controls. The original environment
utility is reused unchanged; no accepted qualifier globals are mutated.
The new wrapper is adapted from the successful reflection gate with its
own manifest, declaration inventory and completion markers.

All 94 controlled objects are deleted and cold-rebuilt. Candidate and
consumer warnings are fatal; only `propext`, `Classical.choice`, `Quot.sound`
are permitted. Compiler exit status, exact roots/markers, complete logs,
input/object/log digests and all dependency revisions are checked and retained.
No BFSS object cache, new instance, proof-budget increase or linter waiver
is introduced. The known pinned Lean 4.34.1 / Mathlib
`d13f23b723b8a846827a245b89c10fc7d3f11612` environment is unchanged.

Local preflight, ten adversarial report tests, YAML/Bash checks and source
review must pass before submission. These are not local Lean compilation;
the compiler test is the dedicated GitHub gate. Require its full evidence
review before acceptance. Classify any earliest failure before editing;
preserve exact actions and use explicit named map equalities rather than
deep source expansion. Wrong signs/order or a source-action mismatch hold
the claim; syntax or resource failure alone does not refute it.

After qualification, return to bounded source9 determinant feasibility.
Do not infer fixed-eight factorization or compactness from gamma covariance
or from the compactness of its SO(16) target.
