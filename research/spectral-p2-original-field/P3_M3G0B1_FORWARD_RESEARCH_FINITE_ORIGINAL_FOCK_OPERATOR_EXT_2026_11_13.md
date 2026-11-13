# P3-M3G0B1 — forward research: full original operator equality from a.e. B0 source basis columns
**Date:** 2026-11-13 Pacific. **Status:** FORWARD RESEARCH ONLY. M3G0B0 strict [#43398003237](https://github.com/etblink/math/actions/runs/43398003237) is pending; this memo does not stage B1 or imply B0 is qualified.
**Working branch:** `integration/bfss-unified-research-20261108`. All accepted M3G0A/M2 proofs are immutable.

## Discovery: the old qualified M2B2B0 operator-to-HS-fiber equivalence is a direct extensionality tool
- `P3M2AOriginalFockHSFiber.lean`, blob `89543ae62bc971303cbb15d3a0c3207e114d57fa`, defines `OriginalFockHSFiber ι := PiLp 2 (fun _ : ι => Fermion 2)`. Its native carrier is *separately* Hilbert–Schmidt normed.
- `P3M2B2B0OriginalFockOperatorHSContinuousEquiv.lean`, blob `3344283458bce762149d2ef00c445b1608bdb725`, exports a **continuous complex-linear equivalence** `originalFockOperatorHSContinuousEquiv b : (Fermion 2 →L[ℂ] Fermion 2) ≃L[ℂ] OriginalFockHSFiber ι`, and specifically the proved `originalFockOperatorHSContinuousEquiv_apply_basis b T i : (originalFockOperatorHSContinuousEquiv b T) i = T (b i)`.
- Thus for any genuine original bounded operators `T,S : Fermion 2 →L[ℂ] Fermion 2`, pointwise agreement `∀ i, T (b i)=S (b i)` yields `T=S` by applying the injectivity of the *existing* continuous equivalence and componentwise extensionality of `PiLp`. We need **NO new orthonormal-basis completeness proof**, **NO finite 2^24 basis enumeration**, and **NO illicit HS-norm identity**. Use the equivalence only for its injectivity.

## Precise B1 prospective statement (not yet proved)
For fixed `g : GaugeGroup 2`, `b : OrthonormalBasis ι ℂ (Fermion 2)`, `f : OriginalFockOperatorLp`, seek:
`(fun x : Boson 2 => (originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x) =ᵐ[volume] fun x => ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp (f (pairedGaugeData.boson g⁻¹ x))`.
Here `.comp` is **left output** on the original continuous-linear Fock operator, not fermion adjoint conjugation. RHS is only a pointwise expression at the first theorem; do not assert an `Lp` element without a qualified measurability/integrability argument.

**Proposed proof obligations:**
1. Consume B0's third theorem (if and only if it becomes GREEN) for each `i : ι`: a.e. equality of literal original operator evaluation on `b i`.
2. Use `[Fintype ι]` to combine these a.e. predicates into **one common a.e. set for all** `i`. Verify the exact pinned Mathlib finite-index `Filter.Eventually` API before writing the Lean proof; do not assume a pointwise `∀ i` can be moved under the a.e. quantifier without this finite-intersection step.
3. At each point in that common a.e. set, define `T := (Γ_b(g) f) x`, `S := (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap.comp (f (pairedGaugeData.boson g⁻¹ x))`. Prove `T = S` using `(originalFockOperatorHSContinuousEquiv b).injective`, `PiLp` extensionality and the source-qualified `originalFockOperatorHSContinuousEquiv_apply_basis` applied to **both** operators. The algebraic equality evaluates `S (b i)=ρ_F(g)((f (β(g⁻¹)x))(b i))`, precisely the B0 RHS.
4. Conclude the original bounded-operator field equality almost everywhere. If the left side is already an `Lp` representative, this identifies its a.e. class without a new independent operator-field `MemLp` construction.

## Subsequent consequences, both separate unqualified theorems
- **B1 basis independence:** for two genuine original ONBs `b,c`, the above source-pointwise RHS is identical. Obtain `Γ_b(g)f=Γ_c(g)f` via two `=ᵐ[volume]` statements and `Lp.ext`. Null sets may differ: combine explicitly for each fixed `b,c,g,f`. No assertion of a uniform full-measure set over uncountably many SU(2) elements is needed.
- **B2 original operator-norm isometry:** left composition with the genuine `pairedGaugeData.fermion g` is pointwise norm-preserving for the **original bounded-operator norm**; its inverse is from the original source group homomorphism. Combine this with the original measure-preserving boson pullback to prove `‖Γ_g f‖_{Lp,op}=‖f‖_{Lp,op}`. M3G0A's `≃L` is NOT sufficient for that norm identity; the proof must use the *physical source action*. Seek exact mathlib `Lp.compMeasurePreserving` interface on the **operator-valued** Lp target, not a Hilbert–Schmidt surrogate.

## Falsifiers / guards
- B0 source-third-theorem RED or its a.e. formula remains unqualified: B1 cannot consume it as accepted.
- A full-measure set is claimed for every basis index without finite conjunction, or erroneously claimed for every uncountable SU(2) parameter simultaneously.
- A right `ρ_F(g)^{-1}` action is inserted (conjugation instead of left-output).
- Original operator norm is silently replaced by the HS-column norm; `originalFockOperatorHSContinuousEquiv` supplies **injectivity**, NOT isometry.
- A putative pointwise field is declared in `Lp` without a proof of a.e. equivalence to an existing valid `Lp` field, or without measurable/integrable source construction.

## Project Lead decision
**Read-only B1 design is sufficiently concrete; STOP before source/consumer staging.** First verify exact B0 #43398003237 verdict, remedy any first-causal B0 failure, and update the canonical `BFSS_GATE_STATE.json` checkpoint. Only if B0 qualifies, preregister B1 separately and build a strict original-operator-field consumer. M3G0C physical fixedness, M3-W0 witness, M4 Spin9, M5 Hamiltonian and M6–M8 spectrum remain independent.
