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
