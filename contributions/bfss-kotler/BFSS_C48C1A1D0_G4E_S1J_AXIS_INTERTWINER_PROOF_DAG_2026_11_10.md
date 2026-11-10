# FCP–BFSS C48-1A1d0 — original G4E/S1J source-axis Fock unitary intertwiner

**Date:** 2026-11-10 (Pacific)  
**Repository/branch:** `etblink/math` / `integration/bfss-unified-research-20261108`  
**Status:** NEW SOURCE AND INDEPENDENT-CONSUMER STRICT GATE **CANDIDATE**, NOT MATHEMATICALLY QUALIFIED UNTIL GREEN. No empirical or spectral promotion.  
**Source discipline:** Original real `Source48Label = Fin 24 × Fin 2`, original `Fermion 2`, actual G4E SU(2) Fock unitary, actual S1J source matrix, original G1A axes and original normalized gamma operators. No convenient replacement representation, changed CAR/sqrt(2), swapped color axes, or new assumptions.

## 1. Source review: substantial prior work is ALREADY qualified

The key discovery is that the requested G4E Fock-gauge axis theorem's complex-color-sum half was **already strictly accepted** as C48-1A1a. Re-proving G4H covariance would waste effort.

| DAG atom | Exact source theorem / receipt | State |
| --- | --- | --- |
| D0-P0 | [C48-1A1a original gauge Fock Majorana axis](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C1A1aOriginalGaugeFockMajoranaAxisCovariance.lean): `originalGaugeUnitary_sourceGammaAxis_covariant`. [Strict green #42813706857](https://github.com/etblink/math/actions/runs/42813706857), SHA `93a061c4870ab4be353f5128e683a9dbf37f166c`; source blob `e04fafcb831df875623c744e015adfa6f078bc9a`. Exact positive sqrt(2), true G4E unitary and true original G4H paired-theta action. | ACCEPTED |
| D0-P1 | [C48-1A1b1 original S1J axis matrix](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C1A1b1OriginalS1JAxisMulVecSource.lean) with independent consumer, [strict green #42884218851](https://github.com/etblink/math/actions/runs/42884218851), SHA `420671d8cdf6e05fd34be4f923cfbf512c9c490c`. | ACCEPTED |
| D0-P2 | [C48-1A1c0 original S1J gamma real color column](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C1A1c0OriginalS1JAxisGammaColorSum.lean), independent consumer, [strict green #42887781946](https://github.com/etblink/math/actions/runs/42887781946), SHA `8a93f8a2044fe63b9a424f12d4e2047d8f3a0b1f`; source blob `27d5b3f9da9f0253ce29aa17495cb26c85a63b00`. | ACCEPTED |
| D0-P3 | `Complex.coe_smul` for real coefficients on a complex module, independently inspected at pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` in `Mathlib/LinearAlgebra/Complex/Module.lean`. | EXISTING GENERIC LEMMA; exact Lean use pending source gate |
| D0-N0 | [New C48-1A1d0 importable source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C1A1d0OriginalGaugeUnitaryS1JAxisIntertwiner.lean): combine D0-P0 + P2 via `Complex.coe_smul`, `Finset.sum_apply`, `Pi.smul_apply`. | NEW CANDIDATE |
| D0-C0 | [New independent norm consumer](../../lean/diagnostics/BFSSC48C1A1d0OriginalGaugeUnitaryS1JAxisNormConsumer.lean): use D0-N0 plus genuine G4E `LinearIsometryEquiv.norm_map` to prove a *distinct* Fock norm preservation theorem. | NEW CANDIDATE |
| D0-GATE | [New original 84-blob strict workflow](../../.github/workflows/bfss-c48c1a1d0-original-gauge-unitary-axis-strict.yml), with both source and separate consumer, frozen Lean and Mathlib, warnings-as-error, explicit axiom reports, retained logs. | PENDING CI |

## 2. The exact one-axis scientific statement

For `q : GaugeGroup 2`, `j : Fin 8`, `s : Fin 2`, `A : ColorIndex 2`, and `ψ : Fermion 2`, with `e(j,s,A)=sourceBlockColorAxis (j,s) A`,

    U(q) (Gamma(e(j,s,A)) ψ)
      = Gamma((sourceRealMajoranaMatrix q).mulVec e(j,s,A)) (U(q) ψ).

Here `Gamma=sourceGammaRealLinear` and `U=fermionGaugeUnitaryHom` are the literal original bounded Fock operators; the gauge matrix is the actual S1J one. The proof is the composition of the two already-proved **different color-field** sums:

    U(q) Gamma(e_A) ψ = Σ_B (R(q)[B,A] : ℂ) • Gamma(e_B) (U(q)ψ)
    Gamma(C(q)e_A) = Σ_B (R(q)[B,A] : ℝ) • Gamma(e_B).

These agree because source R(q) is REAL, and the canonical complex-restriction scalar action satisfies `(r : ℂ) • v = (r : ℝ) • v`. No new representation or source transformation is defined.

**Independent consumer:** `‖Gamma(C(q)e_A)(U(q)ψ)‖ = ‖Gamma(e_A)ψ‖`, a separate norm identity on the real original `Fermion 2` Hilbert space. It is not merely a syntactic restatement of the source theorem.

## 3. Strict acceptance contract

- Pin **84 exact Git blobs**: the original C48-1A1a's strict eighty-blob source/consumer ancestry plus C48-1A1b1, C48-1A1c0 and both new source/consumer blobs. No changes to those 80 accepted inputs.
- Pin Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold-build actual source in the correct `OAI.MathematicalPhysics.BFSS.Contrib.Kotler` module path, then separately compile the consumer under `-DautoImplicit=false -DwarningAsError=true`.
- Compare the two exact `#print axioms` roots and reject `sorryAx`, `Lean.ofReduceBool`, new axioms or unexpected warnings. Only `propext`, `Classical.choice`, `Quot.sound` allowed.
- On red, investigate the **first causal diagnostic** and make one bounded fix. Preserve negatives and tested SHA; don't change theorem statement, weaken manifest, modify source CAR normalization, or add unbounded tactics.
- On green, preserve workflow ID, exact tested commit, manifest pin closure, source/consumer qualification and artifact; only then advance to all-48-vector covariance.

## 4. Next, and not earlier

The **next mathematical gate**, after independent source+consumer acceptance, is a real-linear extension from the full exact source-axis spanning set to all `Source48Vector`:

    ∀ q v ψ, U(q) (Gamma(v) ψ) = Gamma(C(q).mulVec v) (U(q)ψ).

This will require a small separately audited basis/real-linear map interface, not a 48×48 expansion or a new Fock Hilbert implementation. Physical gauge-fixed FullL2, Spin(9) operator-algebra commutation, original closed Hamiltonian domains and spectral sectors remain separate proofs.

The parallel original-Majorana-bilinear and RP8 topology findings are preserved in [the exploratory memorandum](../../research/unification/BFSS_ORIGINAL_MAJORANA_BILINEARS_RP8_TWISTED_QUADRATIC_BUNDLES_2026_11_10.md). They are not prerequisites for this exact original Fock gauge theorem and must not receive new physical status from its mathematical success.
