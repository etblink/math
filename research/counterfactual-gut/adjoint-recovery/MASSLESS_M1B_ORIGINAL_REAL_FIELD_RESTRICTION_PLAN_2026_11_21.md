# MASSLESS-M1b — exact original massless fermionic field real restriction and paired SU(2) consumer

**Date:** 2026-11-21 (America/Los_Angeles). **Status at implementation:** candidate, NOT yet strict qualified.

## Accepted exact source boundary

- **Original** `FermionQuantization.lean` at frozen blob `c6b72d030225c707ef54f5285a18a7a8175ee280` has `M.deformedFermionField_bracket x`: `M.deformedFermionField 1 0 x = (((-Complex.I)/2) • ∑j,A M.cubicFermionComponent x A j).restrictScalars ℝ`.
- **MASSLESS-M0** original theta negative-sum and donor contraction strict GREEN [#44988662078](https://github.com/etblink/math/actions/runs/44988662078), source blob `948671c8173dd69bba380a1b08fd46c7b63efb57`.
- **MASSLESS-M1a** exact original complex-linear massless quantizer strict GREEN [#44990226259](https://github.com/etblink/math/actions/runs/44990226259), tested `33bf69002d9227bbcd5eb1290c7363b4cd35b43d`, source blob `93e11616d37a3bfac44320e7518027d8883c6072`, artifact #14741553517 SHA-256 `0823d7b2bbf0f4f29d3f982721d2b6320dac3a6b2d796c3f36ecd6b65091d2b6`.
- **Literal original** SU(2) paired Fock algebra `FCP.BFSSSU2GaugeG1A.pairedAlgebraData : AlgebraData 2` at `Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean`, blob `152204ef15a6569534e0503824a697cb9ae8e4ce`.
- **Reject non-sources:** D1F R1/R2/R3 are native RED/frozen; D1S4 R1/R2 native RED/frozen. Do not import, repair, reclassify or mask their artifacts.

## Exactly two new independent source/consumer theorem roots

New M1b source module `BFSSMasslessM1bOriginalRealFieldRestrictionConsumer.lean`, two and only two direct imports: accepted `BFSSMasslessM1aOriginalComplexQuantizerNormalization` and original `SU2BFSSG1APairedThetaProbe`.

1. Generic exact original source field identity `FCP.BFSSMasslessM1b.originalMasslessFermionField_eq_quantized`:
```lean
theorem originalMasslessFermionField_eq_quantized {N : ℕ}
  (M : AlgebraData N) (x : Boson N) :
  M.deformedFermionField 1 0 x =
    (M.quantizeFrequency (FCP.BFSSMasslessM1a.masslessSourceFrequency M x)).restrictScalars ℝ := by
  rw [M.deformedFermionField_bracket]
  rw [FCP.BFSSMasslessM1a.originalMasslessQuantizer_eq_cubic M x]
```
Use the working original source massless **bracket** lemma and strict-qualified M1a **complex** quantizer identity, comparing after `restrictScalars ℝ`. This is an equality of exact original **real-linear Fock operators**; do not confuse source `ComplexLinearMap` with real-linear restriction.
2. Literal original SU(2) paired-`AlgebraData` consumer `FCP.BFSSMasslessM1b.pairedOriginalMasslessFermionField_eq_quantized` on `Boson 2`, consuming the first theorem directly with `FCP.BFSSSU2GaugeG1A.pairedAlgebraData`. This uses the original exact 48 Majoranas / 24 complex Fock modes, no redefined CAR or unproved 3D Dirac field.

Check exactly two `#print axioms` roots, each limited to `[propext, Classical.choice, Quot.sound]`, and all Lean code with `set_option autoImplicit false`, no `sorry/admit/axiom/unsafe`, no linter/heartbeat weakening.

## Exact strict workflow

One path-scoped new workflow, frozen original Core/FermionFrequency/FrequencyContraction/FermionQuantization, qualified M0/M1a and original literal paired source blobs. Pin Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, build exact original sources natively, standalone strict warning-as-error recompile and exactly two axiom roots, required `BFSS_MASSLESS_M1B_REAL_SOURCE_CONSUMER_STRICT_GREEN`. Original preflight/cache/native/strict/environment/tested-SHA archived on success/failure, independent artifact SHA-256 verification required before promotion. Each native/strict RED preserves first-causal error and historical archive; one diagnosed proof-only retry permitted, two REDs STOP. A canceled checkout is not a native theorem RED.

## What this does **not** qualify

- The original **massless** coefficient `masslessSourceFrequency M x` is defined as minus source bracket coefficient. Equality to the **difference** `M.fermionCoefficient x - M.fermionCoefficient 0` is another (likely easy) typed source theorem and cannot be silently asserted as an independently checked Lean consumer merely from M1b's GREEN. The h=m=1 mass deformation must not be smuggled into an h=1,m=0 result.
- The massless **field** identity at each fixed boson x is a source-exact `Fermion N →L[ℝ] Fermion N` equality. The bosonic position-dependent multiplication operator on original `FullL2 N` may be unbounded; maximal domain, norm control, original gauge-physical invariance and the full closed self-adjoint BFSS Hamiltonian remain separate.
- No spectral discreteness, mass gap, protected Hopfion or SU(2) gauge-vortex wavefunction, four-dimensional fermion chirality, Standard Model or GUT follows.


## Candidate source implementation and original strict R1 launch

Original M1b source committed [`5d357b6a65dceb3ea335bd576bdbb1c0414f5ad8`](https://github.com/etblink/math/commit/5d357b6a65dceb3ea335bd576bdbb1c0414f5ad8): exactly two imported sources (accepted M1a and actual paired source SU2), exactly two public original real-linear field equality/paired SU2 source consumer roots, original source `M.deformedFermionField_bracket`, accepted source `FCP.BFSSMasslessM1a.originalMasslessQuantizer_eq_cubic`, explicit `restrictScalars ℝ`, no failed D1F/old D1S4/foreign Fock source. Dedicated strict warning-as-error frozen-source workflow committed at `b9826e3ce827f02f44bf64ab9372521c0ab9c47f`. Original [strict R1 #44990981706](https://github.com/etblink/math/actions/runs/44990981706), exact tested `b9826e3ce827f02f44bf64ab9372521c0ab9c47f`, **PENDING/UNQUALIFIED**. Original native build, two `#print axioms` roots with only allowed axioms, tested SHA/source pins, GREEN sentinel and independently verified archived original artifact are mandatory before any acceptance. Historical D1F native REDs, D1S4 REDs and M1a R1 scalar-sign RED remain preserved.
