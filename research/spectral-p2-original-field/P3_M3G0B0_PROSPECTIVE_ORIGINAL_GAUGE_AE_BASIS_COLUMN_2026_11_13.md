# P3-M3G0B0 — prospective original SU(2) a.e. basis-column source action
**Date:** 2026-11-13 Pacific. **State:** PROSPECTIVE RECEIPT; no new Lean declaration has been accepted or compiled at receipt time.
**Branch:** `integration/bfss-unified-research-20261108`. **Immutable evidence baseline:** `a65b598d705eb5e7211cc0ea18b2b64ec2b7deeb`.
**Milestone:** M3 / umbrella M3G0B (source pointwise gauge and basis independence). This first B0 microgate proves only original source a.e. *basis-column* action.

## Observation / question / testable prediction
M3G0A strictly proved `C_b Γ_b(g) f = Δ_g (C_b f)`, with `C_b` the continuous original bounded-operator Lp → genuine Fock-vector Lp finite-column equivalence. However the ambient `≃L[ℂ]` is not original operator-norm isometric and does not, by itself, prove pointwise operator action.
L6G7U/Z supplies genuine `U_g : FullL2 2 ≃ₗᵢ[ℂ] FullL2 2`; L6G7Y already proves boson/fermion Lp a.e. interchange using exact pinned Mathlib APIs. Predict that for each finite Fock basis index `i`, and a.e. original bosonic point `x`:
`(Γ_b(g) f)(x) (b i) = pairedGaugeData.fermion g ((f (pairedGaugeData.boson g⁻¹ x)) (b i))`.
This is left output (not conjugation) and EXACT inverse boson pullback.

## Exact immutable primary sources
- `P3M3G0AOriginalFockGaugeColumnTransport.lean`: `cc40839076eb980dab54f57af9c95b9d9e33da2c`; strict [#43391099205](https://github.com/etblink/math/actions/runs/43391099205), tested `f5fffd4aa3ad0ddfda499f87a5e358cf83e83b2f`; original 459 distinct pins, original consumer and allowed axiom audit.
- `P3M2C0OriginalFockOperatorLpColumns.lean`: `db2bf9530b1fad0bd539a37cc7ef15fba798a409`, strict [#43375482588](https://github.com/etblink/math/actions/runs/43375482588): `originalFockOperatorLpColumnsEquiv_apply_ae` applied to `f` AND `Γ_b(g)f`.
- Original L6G7U `SU2BFSSPhysicalDomainL6G7UActualSourceFullL2GaugeContractionProbe.lean` blob `8903dfae1caf144ec63e32d05e7cf1001d75e029`: `actualOriginalFullL2GaugePairCLM` definitionally equals `pairedGaugeData.fiberAction g (pairedGaugeData.bosonPullback g⁻¹ v)`.
- Original L6G7Z `SU2BFSSPhysicalDomainL6G7ZActualSourceFullL2UnitaryGaugeRepresentationProbe.lean` blob `7f42aab817da8061aa76b251e4e2ba7c3b8379ed`: `actualOriginalFullL2GaugeUnitaryHom`, exact source action.
- Exact old L6G7Y `SU2BFSSPhysicalDomainL6G7YActualSourceFullL2CombinedGaugeGroupLawProbe.lean` blob `a402183a963f4c334da93c32257941e1b92a0e62`: **source-qualified proof recipe** `ContinuousLinearMap.coeFn_compLp`, `Lp.coeFn_compMeasurePreserving`, and `EventuallyEq.comp_tendsto` via `(pairedGaugeData.boson g⁻¹).measurePreserving.quasiMeasurePreserving.tendsto_ae`.
- Pin Lean `4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Never upgrade silently.

## Minimal B0 theorem contract and proof steps
1. `actualOriginalFullL2GaugeUnitaryHom_apply_ae`: genuine original FullL2 unitary (on `Fermion 2` above `Boson 2`) has a.e. representative `x ↦ pairedGaugeData.fermion g (v (pairedGaugeData.boson g⁻¹ x))`. Use the exact source defeq + qualified L6G7Y elementary Mathlib lemmas; no new operator model.
2. `originalFockOperatorGaugeEquiv_source_column_ae`: transport the first theorem across qualified M3G0A `originalFockOperatorGaugeEquiv_column_apply`, still phrased in the genuine `FullL2 2` column Lp class.
3. `originalFockOperatorGaugeEquiv_source_basis_ae`: apply accepted M2C0 `originalFockOperatorLpColumnsEquiv_apply_ae` at both `f` and `Γ_b(g) f`; precompose the former a.e. identity with the original boson (g^{-1}) map using `EventuallyEq.comp_tendsto`. Combine via `filter_upwards`. Final proposition is actual bounded original Fock operator applied to actual basis vector, no invented Fock identification.

**STOP if** the source does not elaborate definitionally, `Lp` pullback is not a.e. valid, orientation swaps, a.e. null sets are silently omitted, or an unqualified group/Fock model is substituted. Repair only the exact initial type/AE failure; do not relax the pinned carrier or axioms.

## Mandatory B0 independent consumer and CI
- Source file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0B0OriginalGaugeAEBasisColumn.lean` imports only qualified M3G0A (which transitively includes original L6G7Z/Y and M2C0).
- Separate `lean/diagnostics/BFSSP3M3G0B0OriginalGaugeAEBasisColumnIndependentConsumer.lean` checks literal `OriginalFockOperatorLp`, `Boson 2`, `Fermion 2`, `GaugeGroup 2`, `EuclideanSpace.basisFun (Fin (2 ^ (8 * colorDim 2))) ℂ`, and consumes all three named theorems without axioms/sorries.
- Original M3G0A 459-path exact manifest is source-closed for imported B0 APIs. Add only the *new* source/consumer paths if their declared imports remain unchanged; the anticipated distinct count is **461**, to be generated, deduplicated and checked from Git, not assumed. Never weaken M3G0A's frozen hashes or original 96-pin M2 inventory.
- Strict CI must cold-compile the exact source, run the independent consumer, audit all three declarations against only `propext`, `Classical.choice`, `Quot.sound`, preserve logs and exact tested head SHA. Workflow status, not source existence, qualifies the theorem.

## Exclusions / later bounded microgates
- **B1:** combine all `i : ι` equalities into a *single* finite-intersection a.e. set, then prove original bounded-operator equality using complete ONB extensionality. Show `Γ_b` is independent of basis only after the explicit RHS has been constructed with source-valid measurable/strongly measurable field.
- **B2:** prove original pointwise operator-norm preservation and original operator-valued Lp norm isometry using *unitary left multiplication* and measure-preserving inverse bosonic pullback, not `C_b` norm identity (which is false).
- **C:** use L6G7V original FullL2 physicalSpace fixedness to obtain iff all genuine output columns are physical.
- M3-W0 physical nonzero witness and rank-one embedding, M4 Spin9, M5 original H domain, M6–M8 spectrum remain separate; this B0 gate does not prove any of them.

**Disposition:** exact source API review PASSED as a pre-gate *research* result. GO a single source+consumer B0 candidate only after the prospective receipt is committed; HOLD B1/B2/C and physical claims until independent qualification.
