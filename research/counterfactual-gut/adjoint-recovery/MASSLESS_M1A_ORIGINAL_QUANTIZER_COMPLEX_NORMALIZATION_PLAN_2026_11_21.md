# MASSLESS-M1a — original massless complex-linear quantizer normalization

**Date:** 2026-11-21 America/Los_Angeles. **Status at creation:** candidate, not Lean-qualified.

## Accepted donor chain

- Frozen original source `FermionQuantization.lean`, blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, defines the original `AlgebraData.quantizeFrequency K` and `AlgebraData.cubicFermionComponent x`.
- MASSLESS-M0 original negative contraction independently strict GREEN [run #44988662078](https://github.com/etblink/math/actions/runs/44988662078) exact tested `aaf409edc3f388ce05d2f93fcf108a364382b8f1`, source blob `948671c8173dd69bba380a1b08fd46c7b63efb57`, artifact #14740759009 SHA-256 `a15207dead7b70611b865cfd78be80324a767b548f2721c11c0942c4625ae858`.
- The M0 source `FCP.BFSSMasslessM0.sourceBracketCoefficient M x` is the *positive* original structure-constant/gamma bracket frequency matrix. Its negative is the massless interaction `K_{1,0}(x)`.
- The original **mass-deformed** `fermionCoefficient x` includes `(3/2) massT`. M1a does **not** use that field, its `h=m=1` quantization theorem or failed D1F imports.

## One narrowly scoped theorem

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMasslessM1aOriginalComplexQuantizerNormalization.lean` imports **only** the qualified M0 source.

```lean
def masslessSourceFrequency {N : ℕ} (M : AlgebraData N)
    (x : Boson N) : FrequencyMatrix N :=
  fun r s => -(FCP.BFSSMasslessM0.sourceBracketCoefficient M x r s)

theorem originalMasslessQuantizer_eq_cubic {N : ℕ}
    (M : AlgebraData N) (x : Boson N) :
    M.quantizeFrequency (masslessSourceFrequency M x) =
      ((-Complex.I) / 2) •
        (∑ j : SpaceIndex, ∑ A : ColorIndex N,
          M.cubicFermionComponent x A j)
```

Use `change` to expand the **exact** original quantizer and local frequency definition without an uncontrolled rewrite of `K r s`. Apply M0 `sourceBracketCoefficient_negative_contraction M x` to the entire inner original finite sum, then finish only the complex scalar sign by `smul_neg`, `neg_div`, `neg_smul`. No `module`, `ring`, `simp <;> ring`, or unconstrained rewriting. The successful M0 two-level `Finset.sum_congr` proof is **not** duplicated.

`#print axioms originalMasslessQuantizer_eq_cubic` must show only `propext`, `Classical.choice`, `Quot.sound`. One strict root, exact file/import and source pins, no linter/heartbeat weakening, no `sorry`, `admit`, unsafe, or added axioms.

## Strict acceptance and stop contract

New path-scoped workflow must freeze source BFSS Core/FermionFrequency/FrequencyContraction/FermionQuantization and accepted M0 Git blobs, Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, native cold source build, strict warning-as-error standalone recompile, exact single axiom root and required `BFSS_MASSLESS_M1A_COMPLEX_SOURCE_ONLY_STRICT_GREEN` sentinel. Unconditionally archive original preflight/native/strict/environment/tested-SHA/cache evidence and independently verify artifact ZIP SHA-256.

R1 RED => inspect first causal and one evidence-driven proof-only repair at most; second RED => STOP and record both original archives. No changes to original sources, existing qualified M0/A0–A2d, failed D1F R1–R3 or frozen D1S4 R1/R2.

## Deferred boundaries

The massless source coefficient difference `M.fermionCoefficient x − M.fermionCoefficient 0` and the exact real-linear restriction
`M.deformedFermionField 1 0 x = (M.quantizeFrequency (masslessSourceFrequency M x)).restrictScalars ℝ` are M1b targets, requiring separate strict native/independent paired SU(2) consumer. If M1a qualifies, only a **fixed-x bounded complex-linear original Fock operator equality** has been proved. No full bosonic `FullL2` operator/domain, Gauss-law physics, spectrum, mass gap, Hopfion, SM chirality or GUT claim.


## Implementation and original strict test receipt

Source implementation `e0cd51c9eb8535a715b0f2000bed41416d476f0b`, only original M0 import and one theorem. Dedicated strict original source workflow `bfss-massless-m1a-original-complex-quantizer-strict.yml` committed at `afe03600eb5c20611c8cb1dcd493edd6b2c723ce`, [first run #44989415373](https://github.com/etblink/math/actions/runs/44989415373) **cancelled during checkout** before source preflight or any Lean compilation when the replacement source-comment-only commit was pushed. The lexical preflight excludes a literal `FullL2` substring; the source comment was changed to `bosonic Hilbert domain` (proof, theorem statements, imports, workflow, accepted donor pins completely unchanged). Corrected source blob `079651a873507c42fb215f848782970876fff141`, commit `e5bd36ccf926b4e3675666ec1e6b7f0129e92ff3`. Active original [strict R1 #44989442784](https://github.com/etblink/math/actions/runs/44989442784), at that exact SHA, **PENDING at launch**. Only full original native source, standalone strict warning-as-error, one permitted axiom root, source preflight and original archived SHA/digest can qualify M1a. No M1b source or CI before M1a acceptance.


## Original R1 native scalar normalization RED and bounded R2

[Run #44989442784](https://github.com/etblink/math/actions/runs/44989442784), exact tested `e5bd36ccf926b4e3675666ec1e6b7f0129e92ff3`, original job `137107080285`, source blob `079651a873507c42fb215f848782970876fff141`: frozen source and pinned Lean/Mathlib preflight PASS, 8,952 prerequisite jobs build PASS, new original source **NATIVE RED** at line 30:44. Accepted M0 contraction successfully rewrites the entire theta sum. `simp only [smul_neg, neg_div, neg_smul]` leaves goal
```lean
⊢ -((Complex.I / 2) • S) = -(Complex.I / 2) • S
```
with explicit unused-`neg_smul` warning. The source theorem's axiom report includes `sorryAx` because it failed; no strict source consumer or GREEN sentinel. Original [artifact #14741602016](https://github.com/etblink/math/actions/runs/44989442784/artifacts/14741602016) **6,084 bytes**, five archive files, independently recomputed SHA-256 `1ff0dfe599772619e124a73caff75b66ea4d7bd706f8a0e25dcb90c3e1463b12` matches GitHub, tested SHA confirmed.

**One bounded proof-only R2 decision:** replace `simp only [smul_neg, neg_div, neg_smul]` after the qualified M0 rewrite by explicit `rw [smul_neg, neg_div]` and `exact (neg_smul (Complex.I / 2) S).symm`, with `S` the original cubic sum. The exact source theorem, coefficient, carrier, imports, source pins, workflow and `#print axioms` remain unchanged; no new original BFSS assumptions, lint changes or resource changes. If R2 is native or strict RED, two-RED STOP and new architecture review; no M1a R3, M1b or D1F R4.


## Exact final R2 source repair and unqualified CI

Original candidate's final proof `simp only [smul_neg, neg_div, neg_smul]` was replaced with the one correction directly justified by original R1's displayed goal:

```lean
  rw [smul_neg, neg_div]
  exact (neg_smul (Complex.I / 2)
    (∑ j : SpaceIndex, ∑ A : ColorIndex N,
      M.cubicFermionComponent x A j)).symm
```

This is **only** a proof-body correction. Commit [`33bf69002d9227bbcd5eb1290c7363b4cd35b43d`](https://github.com/etblink/math/commit/33bf69002d9227bbcd5eb1290c7363b4cd35b43d), new source Git blob `93e11616d37a3bfac44320e7518027d8883c6072`. Original [strict R2 #44990226259](https://github.com/etblink/math/actions/runs/44990226259), exact tested `33bf69002d9227bbcd5eb1290c7363b4cd35b43d`, **PENDING/UNQUALIFIED** at launch. No change to theorem, source physics, imports, pinned original/accepted M0, warning-as-error, strict axiom restrictions, artifact retention or workflow. If second native/strict RED, mandatory two-RED STOP with original artifacts preserved and architecture reassessment. No M1b before an independently accepted strict M1a.


## M1a original strict R2 GREEN independently qualified

[Run #44990226259](https://github.com/etblink/math/actions/runs/44990226259), exact tested `33bf69002d9227bbcd5eb1290c7363b4cd35b43d`, job `137109435143`, source blob `93e11616d37a3bfac44320e7518027d8883c6072`, **GREEN**. Frozen original source and accepted M0 preflight, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original native build **8,953 jobs**, standalone strict warning-as-error compile, one exact axiom root with precisely `[propext, Classical.choice, Quot.sound]`, sentinel `BFSS_MASSLESS_M1A_COMPLEX_SOURCE_ONLY_STRICT_GREEN` all PASS. Original six-file [artifact #14741553517](https://github.com/etblink/math/actions/runs/44990226259/artifacts/14741553517), 5,762 bytes, SHA-256 `0823d7b2bbf0f4f29d3f982721d2b6320dac3a6b2d796c3f36ecd6b65091d2b6`, independently recomputed and matched GitHub; original strict single root and tested SHA independently checked. The original R1 native RED [#44989442784](https://github.com/etblink/math/actions/runs/44989442784) remains preserved. The accepted theorem is **only** the original fixed-x massless complex Fock quantizer normalization; source real-linear field restriction, coefficient subtraction and full physical Hilbert-space domain remain separate.
