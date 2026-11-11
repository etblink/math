# NORM-0B fifth strict RED — independent consumer typed scalar and Gram namespace repair

**Date:** 2026-11-10 Pacific (CI finished 2026-11-11 UTC). **Disposition:** STRICT RED, consumer-only candidate repair, NOT qualified.

## Exact evidence
- Run: https://github.com/etblink/math/actions/runs/42967369254
- Tested commit: `fae9b0132cf2d74ff3eea3740dee04863cc3deeb`
- Job: `130347598004`; complete with failure 2026-11-11 05:56:58 UTC.
- Evidence artifact: ID `13832138896`, ZIP SHA256 `6daa7e1ce3b4b9c2f7f097fc4c254bf17b129e6cf06cd62deb42451a17eabfea`.
- Preflight checks of all 106 exact Git blobs and pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` passed.
- Full ORIGINAL NORM-0B source cold-build succeeded (9068 jobs). The four source roots `originalColorQuadratic_add`, `originalColorQuadratic_real_smul`, `originalColorQuadratic_zero`, `originalFockGramObservable_sum` reported only `propext, Classical.choice, Quot.sound`.

## First causal independent-consumer errors
1. `diagnostics/BFSSNORM0BOriginalFockQuadraticRealLinearGramSumConsumer.lean:29`: `simpa only [Complex.ofReal_neg, Complex.ofReal_one, neg_one_smul]` still leaves `Q(-J) = -1 • Q(J)` rather than `Q(-J) = -Q(J)`; no source defect established.
2. Diagnostic line 43: `originalSpatialGram` unknown identifier in the nested explicit `smul_zero` proof, because this consumer did not open `FCP.BFSSVLY0AOriginalBosonGramGaugeInvariant`.
- `sorryAx` occurred only in the two unsuccessfully elaborated consumers, not in any of the four source roots. Do not promote any candidate while red.

## Smallest repair candidate
- Consumer previous blob: `8cb24a936153d73c37e97a753a5e99daf34158d6`; new candidate blob: `e0785e77a84817b73b5cf6d0bba06eff9ca3e318`.
- Replace the failing single `simpa` with a **four-stage typed calc**: `-J = (-1 : ℝ) • J` by pinned `neg_one_smul ℝ`; apply the exact qualified-by-compilation `originalColorQuadratic_real_smul (-1 : ℝ) J`; prove cast `((-1 : ℝ) : ℂ) = (-1 : ℂ)` with `norm_num`; finish via pinned `neg_one_smul ℂ` on actual `Fermion 2 →L[ℂ] Fermion 2`.
- Open the already transitively imported VLY-0A namespace for `originalSpatialGram`, WITHOUT adding or changing imports. Keep both explicit `Finset.sum_eq_zero` stages and typed `smul_zero` unchanged.
- Only change one NORM-0B consumer pin in the strict 106-blob manifest. New workflow blob: `a6e24263f3432ee2ee77202d6bcfd7745ae3af71`.
- Source remains byte-identical `78cf0db748fc7d98bcd1f6c2629d75742c6d8097`; all 104 accepted ancestor blobs byte-identical; both exact consumer theorem statements, all six axiom-root controls, independent cold compilation, and toolchain pins unchanged.

## Acceptance and fallback
The new candidate is not locally Lean-compiled. **Require a fresh strict green** including all 106 exact pins, full cold source and independent downstream consumer compilation, zero diagnostics, and the six permitted-only axiom reports. If the scalar calc fails despite explicit types, fall back to the structurally stable original Q-additivity plus Q-zero proof of oddness; derive `Q(J)+Q(-J)=0` then cancel. Do not rework source or broaden simplification without the first causal diagnostic.

**Physics boundary:** This gate only concerns pointwise original finite Fock operators; no `FullL2 2` multiplier, unbounded original Hamiltonian-domain assertion, spectral confinement, or mass gap is proven.
