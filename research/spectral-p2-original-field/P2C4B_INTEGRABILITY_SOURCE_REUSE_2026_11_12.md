# P2-C4B forward research — extract source-original smooth-core density integrability

**Date:** 2026-11-12. **Status:** RESEARCH / SOURCE-INSPECTED PROOF PLAN; **NOT** NEW LEAN QUALIFICATION.  
**Branch:** integration/bfss-unified-research-20261108. **Separate live gate:** P2-C4A strict run #43204455519; its result is NOT assumed in this memorandum.
**Goal:** discharge both explicit P2-C4A original-source integrability premises for every actual `f : SmoothCore 2`, then apply its exact integral lower bound. Do not alter original operator definitions, normalization, FCP or main.

## 1. New reuse discovery: both densities are already integrated in original DeformedCharge.lean

The original `lean/OAI/MathematicalPhysics/BFSS/DeformedCharge.lean`, pinned Git blob `c27c913c44090100f0c714e3eb34e25205f4d2d3`, contains **inside the actual proof** of `AlgebraData.averaged_core_energy` two local facts:

- **Source original bosonic energy density**, at lines 129–136:
  `hip : Integrable (fun x : Boson N => M.deformedBosonicPotential h m x * ‖f x‖^2) volume`.
  Its proof is exactly the original potential/Fock trace identity `M.deformed_potential_average h m x (f x)`, rewritten as a finite sum of squared norms of original `MixedEnergy.field` test functions. It concludes using
  `(integrable_finsetSum _ (fun α _ => coreNormSq_integrable _)).const_mul _`.
- **Source original fermionic inner-density**, lines 137–146:
  `hif : Integrable (fun x : Boson N => inner ℝ (f x) (M.deformedFermionField h m x (f x))) volume`.
  It identifies the ordered source field with `MixedEnergy.remainderCore (M.kineticSkewSymbol) (M.deformedRealField h m) (M.deformedRealField_contDiff h m) f` using the **genuine source anticommutator theorem** `M.deformedRealField_anticommutator h m`, then applies `(MixedEnergy.inner_integrable _ _).const_mul _`.

These are **not exported declarations**: both are `have` terms inside `averaged_core_energy`. A new Contrib/Kotler Lean module can extract the original proof bodies into independent reusable lemmas, specializing at `M = FCP.BFSSSU2Full.concreteAlgebraData`, `h = 1`, `m = 0`. Doing so avoids editing a historical source file and avoids inventing a replacement potential or Fock model.

**Causal importance:** P2-C4B does **not** require proving `Continuous (M.deformedFermionField 1 0)` or a new operator-valued integrability theorem. The actual source already provides a finite-test-function representation of the original fermionic density.

## 2. Existing radial first-moment integrability proof, already in corpus

`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralLinearMomentCompactness.lean`, Git blob `17a279f2728dd566c711e04eca7596028f355983`, lines 25–27, proves precisely the needed pattern for any continuous compactly supported Hilbert-valued function `f`:

    have hg : Integrable (fun x => ‖x‖ * ‖f x‖^2) :=
      (continuous_norm.mul (hf.norm.pow 2)).integrable_of_hasCompactSupport
        (BFSSNormalMeasure.square_compact f hF).mul_left

With the **original** `f : SmoothCore 2`, instantiate `hf := f.continuous` and `hF := f.hasCompactSupport`. Import the exact already present source module if the parent imports do not expose `BFSSNormalMeasure.square_compact`. Alternative fully sourced syntax appears in `SpectralWeightedClosureCompactness.lean`, blob `68741955a806a30da7b0f9ff168c41b9c29d90cd`, lines 58–63, using `norm_sq_compact` and `.mul_left`.

This is **one continuous compact-support lemma**, not a global growth/integrability theorem, and has no dependence on a Spin(9) Fock-vector implementer or high-weight sector.

## 3. Minimal P2-C4B proof DAG (Lean API sketch, UNCOMPILED)

Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSP2C4AOriginalCoreIntegralTransfer.lean`, currently source blob `83dc6e4638e93188679defccb59771cdf55efb95`, on unified. Its definitions `originalLowerDensity` and `originalActualDensity` are mere transparent abbreviations of literal source field/potential expressions. Its **two-integrability-premise** theorem is being tested by #43204455519; no green claim before completed receipt.

Candidate separate source theorems on the original `SmoothCore 2`:
1. `originalPotentialDensity_integrable (f)`: specialize `hip` with `M0`, `h=1,m=0`.
2. `originalFermionicDensity_integrable (f)`: specialize `hif` with `M0`, `h=1,m=0`.
3. `originalLinearRadialMoment_integrable (f)`: use the existing compact-support norm-square `.mul_left` example.
4. `originalActualDensity_integrable (f)`: combine (1).add(2) by unfolding `originalActualDensity`.
5. `originalLowerDensity_integrable (f)`: combine (1).sub(3).const_mul the literal `M0.fermionGrowthConstant`, carefully matching `sub_mul`, scalar and product associations.
6. `originalMasslessCoreForm_lower (f)`: exact application of `originalMasslessCoreForm_lower_of_integrable f` to (4) and (5), after the P2-C4A strict gate qualifies.

**Suggested independent consumer:** On `f : SmoothCore 2`, show the lower radial integral is finite (via `originalLowerDensity_integrable`) and deduce
`(∫ x, originalLowerDensity f x) ≤ M0.coreForm f` using the nonnegative original kinetic term; do NOT assume either integrability statement. Test additionally `f=0` as a source normalization sanity check where convenient, but preserve distinct mathematical content.

**Source-honesty hard stops:** no `sorry`, `admit`, custom axioms, unimportable `lean/diagnostics` modules, artificial bounded-domain restrictions, or closed physical Hamiltonian substitutions. Preserve exact `1/2` kinetic factor and real-inner order of the source. Distinguish any Lean-local `have` from a public lemma to avoid nonexistent symbol imports.

## 4. Core inequality is necessary but demonstrably insufficient for spectral coercivity

After (6), for any original smooth-core `f` we would obtain

    M0.coreForm f
      >= (1/2)*Σ_p ‖coreToL2(coordinateDerivative_p f)‖²
           + ∫ (V_M0(X) - C0 ‖X‖) ‖f X‖² .

This remains a **lower bound with a nonconfining valley**. On rank-one commuting configurations, `V_M0(X)=0`, so the scalar expression `V_M0(X)-C0‖X‖` is nonpositive and generally decreases linearly along unbounded valleys. It does not itself give compact resolvent, positive point spectrum, or any mass gap. The exact original physical high-Spin(9) sector and transverse zero-mode exclusion remain the decisive missing ingredients.

The original source `coreForm_nonneg` provides independent global form nonnegativity; do not confuse it with positive confinement.

## 5. Operations / branch policy

This is **forward research documentation only**; do not edit P2-C4A source, consumer or strict workflow during run #43204455519. Once that run qualifies, implement the smallest source-exact integrability interface directly on unified integration, with a distinct consumer, cold build, standard-axiom report, and pinned strict CI. Preserve the P2-C4A red #43201920720 and the actual new green receipt; do not erase failed-history evidence. Leave the incidence-before-identity pilot on its separate branch. No new branch is warranted for routine proof atoms.
