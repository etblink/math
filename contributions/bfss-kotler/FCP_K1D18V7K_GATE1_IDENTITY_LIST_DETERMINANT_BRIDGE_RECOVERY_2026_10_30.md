# K1D18V7K Gate 1: identity list determinant base case — targeted Gate 2 recovery

Project Lead negative-knowledge and exact-source repair, 2026-10-30 UTC. V7J remains accepted; V7K is an unverified candidate until strict full success.

## Failed run #41072949742
- GitHub: https://github.com/etblink/math/actions/runs/41072949742
- Tested source commit 3a2da18f5f010bca49198e0c0ab29013deaca9a1, attempt 1, completed FAILURE 2026-10-30T14:47:55Z, job 124121500284.
- Source Git blob 5f95b179116e2f2e088713f2b1ce6ad9e5141dff. Immutable evidence artifact ID 12986063740; SHA-256 968733f9a71c6e093eb432e5feefdf271fd09db69fa669f2019f49bd84d8d3de.
- Exact source pins and 139-declaration lexeme checks, Lean 4.34.1 / Mathlib restoration and 37-module/81-root accepted ancestor revalidation all passed. Fresh warning-as-error compilation failed and the independent 139-root audit was SKIPPED.
- First causal compiler error: source K1D18V7KNativeCartanUnitFactorDeterminantProductProbe.lean:56:8, unsolved nil case: LinearMap.det ↑(LinearIsometryEquiv.toLinearEquiv 1) = 1. Plain simp reduced the ordered empty List.prod to native identity, but not the LinearMap determinant.
- Root euclideanIsometry_mul_det printed only propext, Classical.choice, Quot.sound. Root euclideanUnitReflectionList_det printed sorryAx after the failed nil proof: this is failed elaboration and NOT a qualified root. No error was reported in the induction step; do not infer strict qualification.

## Bounded source proof correction
- Source proof base case replaces two lines, `intro _; simp`, with `intro _; change LinearMap.det (LinearMap.id : Euc48 →ₗ[ℝ] Euc48) = 1; exact LinearMap.det_id`. Pinned Mathlib/LinearAlgebra/Determinant.lean contains the canonical LinearMap.det_id; Mathlib/Analysis/Normed/Operator/LinearIsometry.lean provides native Group.one = LinearIsometryEquiv.refl and underlying LinearEquiv.refl. This is only an explicit definitional identity-map bridge.
- New Git source blob 671dabe97cd9fd923f192228f6e8d0aa27f09bca. Exact V7K source-hash pin updated in .github/workflows/bfss-kotler-k1d18v7k-native-cartan-determinant-product-strict.yml. One workflow display label from 'one-hundred-forty declaration type/axiom audit' to 'one-hundred-thirty-nine' was corrected because the source registry, auditor and success markers all consistently count 139. No verification requirement was relaxed.
- Formal statements, same 48-label Euclidean target, actual native Mathlib reflection product, original Q and Clifford definitions, imports, pinned dependencies, 81 sealed ancestors, 40 fresh warning-as-error modules, 139 independent declaration root type/axiom checks, whitelisted propext/Classical.choice/Quot.sound, and proof limits are unchanged.
- Gate 2 is a CANDIDATE. Require complete terminal green, exact tested source SHA, 40 fresh compiler markers, 139 independent rooted axioms and artifact evidence to accept. On a red, read the first causal diagnostic and preserve a separate failure report.

## Still unproved
Evenness of Cartan list from transported original sourceSO determinant +1; source Q-unit pullback; sourceSO unit-pair generation; unconditional Spin48 image surjectivity; global Spin9, covering topology and BFSS spectral existence are not implied.

Governance: research branch only, preserving accepted sources, main, original FCP provenance and upstream community.