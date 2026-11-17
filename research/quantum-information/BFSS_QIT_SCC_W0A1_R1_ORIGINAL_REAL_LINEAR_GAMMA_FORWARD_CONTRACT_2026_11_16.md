# BFSS × QIT × SCC W0A1 R1 — original all-vector real gamma transport, pre-gate contract

Date: 2026-11-16 Pacific. **W0A1 prospective; no result qualified by this document.** This exact contract precedes any new W0A1 Lean source, consumer, or CI workflow. Remain on `integration/bfss-unified-research-20261108`; never modify `main`.

## Mathematical target and boundary

Following source-exact W0A0 R2 [#44039594189](https://github.com/etblink/math/actions/runs/44039594189) GREEN, investigate the true original `Source48Vector := Source48Label → ℝ` and the original complex Fock `Fermion 2 →L[ℂ] Fermion 2`.

Two distinct named source roots only:

1. **W0A1-A — exact all-label donor/active Majorana equality**: for every `p : Source48Label`,
   `originalNormalizedFockMajorana (sourceBlockColorEquiv.symm p).1 (sourceBlockColorEquiv.symm p).2 = sourceNormalizedGamma p`.
   Use `q := sourceBlockColorEquiv.symm p`, `sourceBlockColorEquiv.apply_symm_apply p`, and qualified OP3-A1 `donor_normalized_eq_active_source_axis`; do not unfold `majoranaCandidate` or CAR.
2. **W0A1-B — exact original real-linear map equality**:
   `FCP.BFSSS1V52L9E4.originalFockGammaRealLinear = FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear`.
   The two definitions are finite sums over the same original 48 labels. Apply `LinearMap.ext`, then **explicit typed `change` to the two sums**, then `Finset.sum_congr` and W0A1-A. No basis induction, no large Fock extensionality and no native `K(A)` adapter.

The source must have two public theorems, precisely two permitted `#print axioms` source reports, a separately importing consumer with two theorems and two reports, and at least three independent controls including arbitrary label and arbitrary real vector. Strict cold source build, original consumer and approved-axiom audit, original artifact ZIP rehash, all six auditor negative mutants, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Exact prior mathematical donors

- W0A0 qualified original 48-label Clifford/Fock source Git blob `175cd63e2ef031818b61a51b73eb59782fe38add`; independent consumer `c58f6d3e49bbcb4b7d2c88a08f57f7e07b61ce63`; original R2 archive `3ddc359754cab20045315a4167a9e5d15e316f80`; original RED R1 archive `f356fec7fbb63bd660712f043503bc70b1eae673`.
- OP3-A1 `OP3AOriginalCliffordFockGeneratorAxisCrosswalk.lean` Git blob `b3f032e8d2bc99901b659c323d982a29a926cd47`: exact donor `donor_normalized_eq_active_source_axis`.
- Original donor real-linear construction `OperatorDependencies/SU2BFSSPhysicalDomainS1V52L9E4OriginalFockRealLinearCliffordGeneratorMapProbe.lean` Git blob `d1a6194ac68fef46ca99de45beb46d15ccb32c79`.
- Active source real-linear construction `SU2BFSSSource48RealLinearGammaProbe.lean` Git blob `a9f446ea7986ca796c2f4b222a5ab710d98590cc`.
- Exact 8×2×3 coordinate enumeration `SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe.lean` Git blob `fad0eab5014aa038ddb0bf8411b0e81c358e7908`.

## Guardrails and next bridge

No rewrite to donor modules, no new axioms, no increase in Lean recursion/heartbeat budgets, and no unqualified source-specific normalized Majoranas. Preserve W0A0 R1 dependent-`Pi.single` failure and its R2 typed `congrArg` lesson. Two analogous native source failures trigger STOP and a new architecture rather than an R3 retry.

**W0A1 does not prove full complex Clifford generation or W0 witness completeness.** After W0A1 independently qualifies, an opaque W0A2 wrapper can combine `originalComplexEquiv_generator_eq_donor v` from OP3-A2 with W0A1-B for arbitrary original real `v`. Separate obligations then extend to complex tensor generators, apply pinned Mathlib `CliffordAlgebra.adjoin_range_ι`, build a true source commutant adapter to M3C, and finally use original trace. QTC1G1/QTC2/CT1 paused; original physical Spin(9), gauge, spectrum and SCC ontology unproved.

Stop condition: do not continue W0A2 merely because a generic finite-sum theorem compiles; require source-exact W0A1 R1 independent consumer, original provider artifact and archive acceptance.
