# P3-OP1A — accepted importable original Fock trace pairing, and OP1B go/no-go

**Date:** 2026-11-12 (Pacific). **Repository/branch:** `etblink/math` / `integration/bfss-unified-research-20261108`.  
**Project Lead decision:** **ACCEPT** exact OP1A source export; **GO** for bounded OP1B original trace-to-orthonormal-columns source gate. Nothing in this document claims a spectral result.

## Exact qualified evidence

- [P3-OP1A strict run #43263788066](https://github.com/etblink/math/actions/runs/43263788066), attempt 1, `completed/success`, tested exact commit **`3e9a3e952f1c08253d2a1362ebef10c4d0fd26e4`**, job `131341786612`. Checkout, 57/57 source/consumer preflight, pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restore, cold source build, warning-as-error source + distinct consumer and axiom inspection, and evidence upload all **success**.
- [Artifact #13965528973](https://github.com/etblink/math/actions/runs/43263788066/artifacts/13965528973), `bfss-p3-op1a-original-fock-trace-3e9a3e952f1c08253d2a1362ebef10c4d0fd26e4-1`; digest **`sha256:1b306a69b9516d8d5ca6effd578d07533da0f8530d261e1d877605579d81a43c`**.
- Accepted source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3OP1AOriginalFockTracePairing.lean` blob **`b79f4230dc03670f4b3fffc425a0cc283688a7c6`**; independent consumer `lean/diagnostics/BFSSP3OP1AOriginalFockTracePairingIndependentConsumer.lean` blob **`f998b1cfe6c43a987f0ecec3eabe64303695d713`**.
- Donor T1 `T1OriginalFockTraceInvariance.lean` blob `3be6c9a6f2898484df66690f94fdfa1877660897`, donor B3 `P2bB3OriginalFockStarAutomorphismAction.lean` blob `b50ef04695587b267ad8519074b1293f98828749`, and the complete historical T1 source/consumer pins were unchanged.
- The new workflow's axiom contract permits **only `propext`, `Classical.choice`, `Quot.sound`**, and checks both source and independent consumer. Its green status establishes that the specified audit passed.

## Qualified mathematical result and genuine novelty

The source exports `originalFockTracePairing S T := originalFockTrace (star S * T)` for actual `Fermion 2 →L[ℂ] Fermion 2` and theorem `source9Spin_originalFockTracePairing_invariant g S T`, proving invariance under the original algebraic Spin9 physical-star automorphism for **arbitrary** `S,T`. The consumer checks the off-diagonal `S,T` instance and the diagonal `T,T` instance.

**This is a newly qualified reusable location of an OLD QUALIFIED proof**, not a newly invented theorem: historical T1 independent diagnostic `FCP.BFSST1OriginalFockTraceIndependentAudit.originalFock_trace_pairing_invariant` already passed [#42769361446](https://github.com/etblink/math/actions/runs/42769361446). The [pre-gate receipt](P3_OP1A_PRE_GATE_EXISTING_QUALIFIED_PROOF_EXPORT_2026_11_12.md) records exact precedent and negative evidence. No source Fock-vector implementer or replacement physical model is introduced.

## OP1B pre-gate source-reuse receipt — GO

**Mathematical contract:** for arbitrary `ι` with `[Fintype ι]`, actual `b : OrthonormalBasis ι ℂ (Fermion 2)`, and `T : Fermion 2 →L[ℂ] Fermion 2`, export exactly:
1. `originalFockTrace T = ∑ i, ⟪b i, T (b i)⟫_ℂ`;
2. `originalFockTrace (star T * T) = ∑ i, ⟪T (b i), T (b i)⟫_ℂ`.

**Sources inspected:** T1's exact `originalFockTrace_apply` and `originalFockEndAlgEquiv` on the original Fock carrier; pinned Mathlib `LinearMap.trace_eq_sum_inner` (Trace.lean 27-34); `Module.End.toContinuousLinearMap` (FiniteDimension.lean 314-320); `ContinuousLinearMap.star_eq_adjoint` (Adjoint.lean 258-275); `ContinuousLinearMap.adjoint_inner_right` (Adjoint.lean 123-128). Read active OP1A consumer and its accepted receipt, earlier T1/B3 red-to-green diagnostic notes, the November 10 evergreen, internal monograph Chapter 8, and OP1B forward memorandum. No exhaustive claim for all historical branches.

**Reuse classification:** `T1.originalFockTrace_apply` DIRECT; `LinearMap.trace_eq_sum_inner` DIRECT; `Module.End.toContinuousLinearMap` DIRECT; `ContinuousLinearMap.star_eq_adjoint` and `adjoint_inner_right` DIRECT; `P3OP1A` DIRECT imported source, though its pairing invariance is not necessary to prove the new trace sum. **Exact adapter needed:** show that evaluation of `originalFockEndAlgEquiv.symm T` at the original Fock basis is definitionally the actual `T` evaluation, and that continuous operator multiplication really is adjoint composition. These are narrow *typed* interfaces, not new Clifford or 48-Majorana calculations.

**Negative knowledge:** B3 [#42762309173](https://github.com/etblink/math/actions/runs/42762309173) generic `map_star` synthesis timing out, repaired by typed star; T1 [#42767247872](https://github.com/etblink/math/actions/runs/42767247872) redundant proof lines after solved goal. No new `maxRecDepth`, heartbeat bypass, generic `simp` over the 48-mode Fock implementation, basis enumeration or substitute finite matrix model.

**Gate scope:** import just pinned `Mathlib.Analysis.InnerProductSpace.Trace` and new OP1A export; retain existing 57 ancestor source/consumer blob pins, add new source and independent consumer, cold-compile source with warning-as-error, separate genuinely applied consumers, preserve exact source/consumer axiom reports and artifact. Only original two trace-to-column identities will be accepted on green. **HOLD** positivity, HS inner-product norm construction, topological Spin action and the physical `L²` finite-column/closed Hamiltonian match until their separate source gates.

**No-promotions ceiling:** a finite Fock endomorphism trace column identity does **not** give operator-norm invariance, Haar continuity, SU2 gauge-left-output fixedness, closed operator/form-domain identity, high-isotype coercivity, compact resolvent, original positive eigenpair or BFSS mass gap.
