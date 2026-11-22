# MASSLESS-D0a — first genuine FullL2 input-domain bridge for the exact original massless Fock quantizer

**Date:** 2026-11-21 Pacific. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Initial state:** UNQUALIFIED candidate. **Project Lead judgment:** test one new functional-analysis interface, not another CAR/finite-sum identity or a full operator-domain proclamation.

## Why this gate, after unified/source crosswalk

[Unified source reconciliation](./UNIFIED_MASSLESS_SOURCE_PHYSICAL_DOMAIN_RECONCILIATION_2026_11_21.md) found exact original `CovariantFields.GaugeData.deformedFermionField_covariant` and `MixedEnergy.field/remainderCore` already. Thus do NOT reprove pointwise massless gauge covariance or smooth-core source regularity; connect **the independently strict-qualified original complex-linear Fock quantizer** (M1a/M1b) to a bona fide `MemLp` output on actual bosonic `FullL2 N`.

Frozen exact original donor blobs: `Core.lean` 9882359ced78b0a3bd7e2f057974bd0a031b3e60, `MixedEnergy.lean` cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e, `DeformedCharge.lean` c27c913c44090100f0c714e3eb34e25205f4d2d3, `FermionQuantization.lean` c6b72d030225c707ef54f5285a18a7a8175ee280, accepted M0 948671c8173dd69bba380a1b08fd46c7b63efb57, M1a 93e11616d37a3bfac44320e7518027d8883c6072, M1b fc2994f932cc13bbade9735f74a97390a4ea224d, M1c 749992dec67bf4bca28ab957890191aeb8c78fb8, actual paired source 152204ef15a6569534e0503824a697cb9ae8e4ce. Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Exactly scoped theorem and definitions

New `BFSSMasslessD0aOriginalSmoothCoreLpAction.lean`, two direct imports only: accepted M1c and original DeformedCharge. First generic root for every **original** `M : AlgebraData N`, `f : SmoothCore N`:

```lean
MemLp (fun x : Boson N =>
  M.quantizeFrequency (FCP.BFSSMasslessM1a.masslessSourceFrequency M x) (f x))
  2 (volume : Measure (Boson N))
```

**Proof strategy:** let `R := MixedEnergy.remainderCore M.kineticSkewSymbol (M.deformedRealField 1 0) (M.deformedRealField_contDiff 1 0) f : SmoothCore N`. Original `remainderCore_apply` with `M.deformedRealField_anticommutator 1 0` identifies `(1/16) • R x = M.deformedFermionField 1 0 x (f x)`. Strict-qualified M1b, evaluated at `f x`, identifies this with the original **complex-linear** `M.quantizeFrequency (masslessSourceFrequency M x) (f x)`. Since `R` is the genuine smooth compactly supported original core, `(1/16) • R` is continuous, compactly supported and consequently `MemLp` in actual original **infinite-volume** bosonic space. No operator-valued unweighted L² assumption, no surrogate carrier, no `IsFiniteMeasure volume`, no new axioms.

Bind this exact `MemLp` proof into an **actual `FullL2 N` output** by `MemLp.toLp` and verify its exact a.e. action using `MemLp.coeFn_toLp`; add literal paired SU(2) 48-Majorana `pairedAlgebraData` `MemLp` consumer, with its independent axiom report. This is a **core-domain inclusion only**, not yet the maximal `Dom(V)` submodule, graph closure, or gauge-domain stability.

## Strict acceptance and stop

New path-scoped original-source strict workflow, frozen source/donor blobs and exact imports/roots, pinned Lean/Mathlib, one native source-only build and standalone warning-as-error recompile, exact allowed axiom roots `[propext, Classical.choice, Quot.sound]`, and required `BFSS_MASSLESS_D0A_ORIGINAL_CORE_LP_STRICT_GREEN`; unconditional six-file preflight/cache/native/strict/environment/tested-SHA evidence ZIP. Independently download and recompute ZIP SHA-256 before promoting, retain all historical RED archives and source blobs.

First native or strict R1 RED => archive exact first error and allow only one evidence-driven proof-only repair. Second native/strict RED => STOP and record an architecture correction, no R3 and no maximal-multiplier D0b assumption. No changes to `main`, unified integration, original BFSS or M0–M1c files, nor CI linter, warnings or resource limits.

After accepted D0a: explicit `Dom(V)={ψ∈FullL2 | MemLp (x↦V(x)(ψ x)) 2 volume}` as a complex `Submodule`, a.e. representative independence, source complex linearity, gauge *domain* invariance and original physical charge-form join. A successful D0a alone says nothing about a closed/maximal/self-adjoint global multiplier, physical energies, spectrum, Hopfion, SM or GUT.


## Implementation and exact first original strict R1 receipt

Initial source-only implementation [`815f4b9999d9b74486e93c39bdf2bb2b455c8efc`](https://github.com/etblink/math/commit/815f4b9999d9b74486e93c39bdf2bb2b455c8efc) uses actual original `MixedEnergy.remainderCore`, accepted M1b `restrictScalars ℝ` equality, genuine `MemLp` and exact a.e. consumer; no new axioms. Frozen strict four-root workflow source originally committed [`fbe6f642674bdc91d97e9c12774daa658d430ce5`](https://github.com/etblink/math/commit/fbe6f642674bdc91d97e9c12774daa658d430ce5). Its initial [run #44996306030](https://github.com/etblink/math/actions/runs/44996306030) was **canceled at checkout before preflight or native Lean** by one explicit `open OAI` namespace visibility addition to the new source; zero theorem/proof edits, no source pin/workflow linter changes. Corrected source blob `1bf49640d543635313495c505a4a4dbc64583ae2` tested commit [`82c1f4fac8eed17abae105e20596a68936890438`](https://github.com/etblink/math/commit/82c1f4fac8eed17abae105e20596a68936890438). **Canonical first actual original strict R1 [#44996343676](https://github.com/etblink/math/actions/runs/44996343676) in progress / unqualified at dispatch.** Native compiler/source proof/strict axiom roots and full original archived artifact have not yet been independently accepted. If actual R1 RED, inspect first cause and original archive; at most one evidence-driven proof-only retry, then two-RED STOP. No D0b gate before D0a exact strict qualification.


## D0a R1 independently verified strict GREEN

Original [strict run #44996343676](https://github.com/etblink/math/actions/runs/44996343676), job `137128089298`, exact tested commit `82c1f4fac8eed17abae105e20596a68936890438`, original source blob `1bf49640d543635313495c505a4a4dbc64583ae2`, **SUCCESS**. Source frozen BFSS and accepted M0/M1a/M1b/M1c/literal paired SU2 preflight PASS, Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS, **8,998 native jobs PASS**, standalone strict warning-as-error compile PASS, exactly four `#print axioms` roots `FCP.BFSSMasslessD0a.originalMasslessQuantizer_core_memLp`, `originalMasslessQuantizer_core_output`, `originalMasslessQuantizer_core_output_ae`, `pairedOriginalMasslessQuantizer_core_memLp` each only `[propext, Classical.choice, Quot.sound]`, **no `sorryAx`**, required sentinel `BFSS_MASSLESS_D0A_ORIGINAL_CORE_LP_STRICT_GREEN` PASS. Original [artifact #14744651063](https://github.com/etblink/math/actions/runs/44996343676/artifacts/14744651063), 8,379-byte six-file ZIP, original archive SHA-256 **`3bd0106e8853e529bf7a38796f5a47c82d2e43715b5e1f88ad9088ffc7a761ad`**, independently recomputed and matched GitHub. Archived `tested-sha.txt` matches tested SHA, preflight and strict report checked. Original [#44996306030](https://github.com/etblink/math/actions/runs/44996306030) CANCELLED at checkout before preflight/Lean, not a RED. **D0a accepted**: original exact massless complex Fock (x)-dependent quantizer takes each source compact `SmoothCore N` input to a genuine original bosonic `FullL2 N` output; exact a.e. action and independent literal paired SU2 consumer. Not accepted: maximal unbounded multiplication `Dom(V)`, gauge domain stability, full H-domain or spectral claims. Future select file-only import into a separate candidate based on latest unified HEAD, with new strict integrated CI; no silent automatic merge.
