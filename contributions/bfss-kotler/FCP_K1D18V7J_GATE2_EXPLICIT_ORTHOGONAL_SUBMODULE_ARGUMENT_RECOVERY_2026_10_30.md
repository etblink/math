# K1D18V7J Gate 2 failure and bounded Gate 3 recovery

Project Lead, 2026-10-30 UTC. Preserve negative knowledge. V7J is not accepted until independent strict terminal green.

## Immutable red evidence
- Run #41056042081: https://github.com/etblink/math/actions/runs/41056042081
- Tested SHA: d62ecb79859fd9353ab6a6fc0538e27918c5b7ec; job 124063700942; completed failure 2026-10-30T12:41:40Z.
- Failed original source blob: fb7679d90f1dcce56dae7c2fa7090fb65e6ca6fe.
- Evidence artifact 12977142442, SHA256 8a83037bc811a241e48021c20bdf8858770cca692ebc34403170f7f3f37df349.
- Exact source pins and declaration lexeme checks, pinned dependencies, and 81 sealed ancestry roots all passed. Fresh warning-as-error compilation failed; independent 137-root audit was skipped.
- First error: V7J line 60:4, bare Submodule.orthogonal_orthogonal has type forall K [K.HasOrthogonalProjection], Kᗮᗮ=K, but expected (ℝ ∙ u)ᗮᗮ = ℝ ∙ u. The missing explicit argument is the causal error.
- The two precursor roots show only propext, Classical.choice, Quot.sound. The determinant root printed sorryAx only as failed elaboration; this is not qualified.
- Earlier Gate 1 red #41040596922 at SHA 491fbabb5a7bcf312cbd63888f756d96f10e8ba2 failed implicit double-orthogonal finrank simplification. Gate 2 exposed a distinct missing argument. Both reds remain preserved.

## Exact Gate 3 candidate repair
- Replace the unique proof term Submodule.orthogonal_orthogonal with Submodule.orthogonal_orthogonal (ℝ ∙ u : Submodule ℝ Euc48).
- New source blob: 5705f732166cce1bb37ed0fedbdf9a2eeb0f4a8d. Only the matching source hash pin changes in .github/workflows/bfss-kotler-k1d18v7j-native-unit-hyperplane-determinant-strict.yml. No theorem statements, imports, math definitions, source Clifford matrices, original 48 labels or accepted ancestors changed.
- Strict gate unchanged: 39 fresh warning-as-error modules, 137 independent types/axioms, 81 sealed ancestor roots, pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, only propext/Classical.choice/Quot.sound allowed, no sorryAx, no proof limit or linter modifications.
- The replacement specializes the exact pinned Mathlib orthogonal_orthogonal theorem to the actual source-label Euclidean span. HasOrthogonalProjection is supplied by accepted finite-dimensional setup, not an added unproved assumption.
- Gate 3 is unaccepted until exact tested SHA passes the full strict compiler and independent declaration audit. If red, preserve the first error and new failed SHA and artifact.

## Unproved obligations
Determinant of the full ordered unit-normal Cartan list, parity, pulling factors into original source Q unit vectors, genuine sourceSO generation, unconditional Spin48 image surjectivity, covering, global Spin9 and physical BFSS spectra remain unproved.
No changes to main, accepted source files, FCP canonical provenance or upstream community.