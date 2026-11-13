# P3-M3G0B1 — prospective full original Fock operator a.e. gauge action
**Date:** 2026-11-13 Pacific. **State:** prospective proof receipt ONLY; no new B1 Lean source, consumer, strict CI or mathematical qualification is established by this receipt.
**Canonical branch:** `integration/bfss-unified-research-20261108`. **Exact accepted input:** M3G0B0 strict [#43422546945](https://github.com/etblink/math/actions/runs/43422546945) GREEN at `38017936230c959dc61dfb07c0e776d5ffc04ab5`, 461 pins, original consumer and three named permitted-axiom audited theorems. Initial receipt baseline `087a630bacbfce4ee4bfbe6683a1a099d8f1e9fc`.

## Observation and falsifiable question
B0 proves a.e. equality for the genuine original operator-valued `OriginalFockOperatorLp` applied to **each fixed** `b i`, where `b : OrthonormalBasis ι ℂ (Fermion 2)` and `ι` finite. Mathematical operators equal on an entire complete finite ONB should be equal. Can we establish one common a.e. event for all `i` and then promote the per-index equality to an a.e. equality of the actual source bounded Fock operators themselves?
Expected exact source identity for fixed `b,g,f`:
`(fun x : Boson 2 => ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)) =ᵐ[volume] (fun x : Boson 2 => ((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp (f (pairedGaugeData.boson g⁻¹ x)))`.
This is **LEFT output only** `ρ_F(g) ∘ f(β(g⁻¹)x)`, not adjoint conjugation or any right-input spin action. This theorem identifies an a.e. representative, not a newly constructed Lp source action.

## Exact pinned API review completed before source code
1. `Mathlib/Order/Filter/Finite.lean` at locked Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: line 247 has `Filter.eventually_all {ι : Sort*} [Finite ι] {l} {p : ι → α → Prop} : (∀ᶠ x in l, ∀ i, p i x) ↔ ∀ i, ∀ᶠ x in l, p i x`. Source **must** explicitly import `Mathlib.Order.Filter.Finite`, to avoid relying on transitive symbol availability.
2. B0 original `P3M3G0B0OriginalGaugeAEBasisColumn.lean` blob `ffffa9e8d8679577a5f32999dd36fe5c9e904a07`, theorem `originalFockOperatorGaugeEquiv_source_basis_ae` with literal original `Boson 2`, `Fermion 2`, `FullL2 2`, left fermion action and inverse boson map.
3. M2B2B0 `P3M2B2B0OriginalFockOperatorHSContinuousEquiv.lean` blob `3344283458bce762149d2ef00c445b1608bdb725`, theorem `originalFockOperatorHSContinuousEquiv_apply_basis b T i : (originalFockOperatorHSContinuousEquiv b T) i = T (b i)` and invertible `≃L[ℂ]`. This equivalence is injected **ONLY to prove T=S from all ONB evaluations**. It does **NOT** assert an equality of original operator norm and HS norm; M2C1 proves two-sided bounds instead.
4. Original gauge carrier remains `GaugeGroup 2` acting through existing `pairedGaugeData.fermion g : Fermion 2 ≃L[ℂ] Fermion 2` and `pairedGaugeData.boson g⁻¹`. Lean 4.34.1 and original source dependency versions remain frozen. No alternate theory/model.
5. Prior forward research: [B1 finite original operator extensionality memorandum](P3_M3G0B1_FORWARD_RESEARCH_FINITE_ORIGINAL_FOCK_OPERATOR_EXT_2026_11_13.md). Its prior “B0 pending” text is historical, superseded by accepted R3.

## Three bounded candidate declarations
- **B1-0: finite-index common full-measure event.** `originalFockOperatorGaugeEquiv_source_all_basis_ae`: use `Filter.eventually_all.mpr (fun i => originalFockOperatorGaugeEquiv_source_basis_ae b g f i)` and do not drop the `[Fintype ι]` precondition.
- **B1-1: pointwise original-operator equality from ONB evaluations.** `originalFockOperator_eq_of_basis` for actual `T S : Fermion 2 →L[ℂ] Fermion 2`, using `(originalFockOperatorHSContinuousEquiv b).injective`, `PiLp.ext`, and source-exact `originalFockOperatorHSContinuousEquiv_apply_basis` on both sides. No new ONB completeness lemma or enumerating `2^24` vectors.
- **B1-2: full original operator a.e. source action.** `originalFockOperatorGaugeEquiv_source_operator_ae`, using B1-0's common event and B1-1's pointwise injectivity. RHS is `((pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap).comp (f (pairedGaugeData.boson g⁻¹ x))` and uses the original `→L[ℂ]` norm source, not HS/trace. Avoid asserting any new separate `Lp` element of RHS: the a.e. identity against existing source `Lp` representative suffices.

## Mandatory independent consumer and strict controls
- New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0B1OriginalGaugeAEFullOperator.lean` with exactly `import Mathlib.Order.Filter.Finite`, accepted M3G0B0 and accepted M2B2B0, no import edits to historical sources.
- New consumer `lean/diagnostics/BFSSP3M3G0B1OriginalGaugeAEFullOperatorIndependentConsumer.lean` directly consumes all **three** declarations with actual `Fermion 2 →L[ℂ] Fermion 2`, `Boson 2`, `OriginalFockOperatorLp`, `GaugeGroup 2`, finite ONB `EuclideanSpace.basisFun (Fin (2 ^ (8 * colorDim 2))) ℂ`; check both original operator and source field identity.
- Exact B0 strict workflow's 461 pinned paths (459 prior plus B0 source/consumer) remain immutable, including original qualified B0 source `ffffa9e8d8679577a5f32999dd36fe5c9e904a07`. Add just two new B1 source/consumer blob paths if recursive import check confirms no other `OAI` files; **463 distinct pins anticipated, to be generated and independently checked, not assumed**. The new Mathlib import is part of already pinned Mathlib revision; not an `OAI` path.
- Use checkout depth sufficient for immutable `c6253c7c` baseline; R2's old depth=10 was inadequate, B0 R3 depth=96 passed. Preserve 461-pin predecessor preflight, cold Lean+real consumer and all 3 root axiom prints restricted to `propext`, `Classical.choice`, `Quot.sound`. Preserve all logs and immutable artifacts. NO Lean R1/B1 acceptance without exact strict GREEN.

## Explicit negative controls and STOP conditions
- Any `∀ i, ∀ᵐ x, ...` used as `∀ᵐ x, ∀ i, ...` without `Filter.eventually_all` (finite index) fails the experiment.
- Any assumed a.e. set **uniform in g** for all SU(2) elements is unproved; every theorem is for fixed `g,b,f`.
- Any original operator-norm isometry deduced solely from the M2 HS-equivalence is invalid. Use M2B2B0 for INJECTIVITY, not isometry.
- Any right action `T ↦ ρ(g) T ρ(g)^{-1}` instead of original left-output `ρ(g) T` is a source mismatch.
- Any unproved source RHS measurability/integrability or creation of new `Lp` value is excluded. Pointwise operator equality a.e. against the already existing `OriginalFockOperatorLp` is this gate's ceiling.
- **NEXT AFTER B1:** basis-independence as a separate B1-BI gate; then original bounded-operator norm isometry as B2; M3G0C physical fixedness and M3-W0 genuine square-integrable physical state remain separate; M4/5/6–8 no change.

**Project Lead disposition:** exact APIs reviewed; GO a bounded B1 source+consumer candidate after this receipt is committed. HOLD strict qualification and any basis-independence/norm/physical/spectral promotion until separate independently verified evidence.
