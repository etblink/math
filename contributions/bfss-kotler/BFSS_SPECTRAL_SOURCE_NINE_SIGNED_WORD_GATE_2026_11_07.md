# C0-A4b: actual two-sign recovery and bounded signed Clifford words

Status: **candidate; unqualified** until its dedicated strict run and
retained evidence pass review. Parent is
`b523a73843d1d89e771d298ca0f46d851eed9bed`, the exact tested source for
qualified C0-A4a in [run #42370342498](https://github.com/etblink/math/actions/runs/42370342498).

## Proposed source statements

`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineSignedWord.lean`
imports only the accepted even-list source and the original F10CU
`NaturalActionTwoSignFibers` source. It introduces four roots in
`FCP.BFSSSourceNineSignedWord`:

| Root | Intended result |
| --- | --- |
| `source9NaturalMatrix_eq_of_action_eq` | Equality of the original actions on all original vectors gives equality of their attained original natural matrices |
| `source9Action_eq_iff_two_sign_fiber` | Pointwise equality of those actions iff g = h or g = source9NegativeCentral * h |
| `source9Spin_sourceUnitCartan_two_sign_lift` | A Q-unit even list of length at most eight and an actual Spin lift h whose literal word recovers g up to exactly those two source signs |
| `source9Spin_sourceUnitCartan_signed_word` | The original Clifford value of arbitrary g equals the ordered word or its negative |

The matrix comparison uses F10BR's exact mulVec/action bridge and the
native injectivity of matrix mulVec as a function of the matrix. Source
sign recovery invokes the original F10CU attained-fiber theorem. No
faithfulness of the natural source action, target surjectivity or covering
is assumed. The negative central Clifford value is the original -1;
coercion of source group multiplication and `neg_one_mul` give the signed
word. All quadratic forms, coordinate labels and representations are
unchanged.

The resulting list still has even length **at most eight**, with an explicit
external sign. Neither sign absorption nor an exact-length-eight word is
asserted. In particular, the empty word may represent either source sign;
that boundary is exercised independently.

## Strict source and consumer qualification

`lean/diagnostics/BFSSSpectralSourceNineSignedWordIndependentAudit.lean`
contains eight consumers: all four complete public statement types, equal
natural actions of the actual negative central element and identity,
their source distinctness and the negative empty word, the positive empty
word, and the reverse fiber-to-action implication on every original vector.
It reprints the four source-root axiom reports.

The separate strict workflow is
`.github/workflows/bfss-spectral-source-nine-signed-word-strict.yml`.
Its exact imported closure includes **125 unchanged original modules**,
all matched by Git blob to preserved parent
`4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`. The 31 additional original
modules are transitive dependencies of F10CU, including its previously
established local recovery infrastructure. Rebuilding them admits no new
chart, topology or covering conclusion.

Five already qualified spectral source modules and the two new candidates
bring the cold inventory to **132 objects**. Thirty controls give **162
input pins**. Expected strict output is **67 exact reports** and **seven
completion markers**, including the independent consumer. The accepted
spectral source modules are freshly rebuilt under the same strict warning
policy. Only `propext`, `Classical.choice` and `Quot.sound` are permitted.
Nonzero compilation, diagnostics, recovery/foreign axioms, inventory or
hash mismatches, and missing/duplicate markers reject qualification.

Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, all
package pins, default proof budgets, artifact retention and no-BFSS-cache
policy are unchanged. Local exact pin/closure checks, ten adversarial
report tests, YAML parsing and Bash syntax checks pass before publication.
Local Lean cannot start; the dedicated CI remains the compiler test.

## Next obligations and exclusions

After qualification, pad the signed word by repeated original Q-unit axis
pairs to exactly eight factors, preserving its literal Clifford product.
Then absorb a negative sign by negating the first factor of the now
nonempty word. Verify Q preservation, order and actual equality to g,
including identity and negative central cases; preserve order when
converting the witnesses to `Fin 8`.

Only a later gate may prove compactness of the original Q-unit parameter
space and continuity of the fixed eight-factor map in the existing PBW
topology. No continuous choice of factorization is required. Source
compactness, Fock/gauge action, physical closed domains, branching,
coercivity and spectral existence remain unresolved. Original branch and
upstream PRs remain untouched.


## Run #42371904867 — scoped C0-A4b acceptance

The [strict signed-word run](https://github.com/etblink/math/actions/runs/42371904867)
is green at exact tested commit `e0687c52c39c3e632784c67deab4716c9e3011e4`.
Downloaded retained artifact 13574831606 has ZIP SHA-256
`e34b8d6b7b9c00c285581ad27af03808bd331446a7a38c8c1c52aa770a1af27d`.
Full review verifies all 162 archived input pins against the manifest and
exact tested checkout, 132 cold successful builds and matching log digests,
67 exact strict reports, seven markers, all eight independent consumers,
42 locked package revisions, compiler identity and Lake environment digest.
No Lean diagnostic, recovery axiom or foreign assumption occurs.

C0-A4b is qualified: pointwise original action equality gives equality of
attained original natural matrices; actual source signs classify those
fibers; every original source Spin element is a Q-unit even word of length
at most eight or its negative. Source distinctness of the negative central
element and signed empty-word boundary remain explicit. This acceptance
still does not give exact-eight source words or compactness.

The [acceptance JSON](evidence/spectral-confinement-2026-11-06/source-nine-signed-word-42371904867-acceptance.json),
receipt and all source/consumer/compiler logs are retained alongside the
record. The [exact-eight gate](BFSS_SPECTRAL_SOURCE_NINE_EXACT_EIGHT_WORD_GATE_2026_11_07.md)
is the next independently unqualified candidate.
