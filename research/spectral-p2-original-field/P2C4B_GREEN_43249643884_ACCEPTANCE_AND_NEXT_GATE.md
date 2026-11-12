# P2-C4B strict-green acceptance — original smooth-core integrability

**Date:** 2026-11-12 (Pacific). **Repository/branch:** `etblink/math` / `integration/bfss-unified-research-20261108`.
**Status:** QUALIFIED at exact tested commit `e4b07eba3f64525d7f48206558a2f5e524d3644e`. This receipt does not qualify a separate spectral theorem.

## Exact evidence
- [Strict run #43249643884](https://github.com/etblink/math/actions/runs/43249643884), attempt 1, completed `success`. Single `source-and-independent-consumer` job green; checkout, source-pin/consumer contract, pinned Lean/Mathlib restore, cold source and independent consumer, and evidence preservation steps all green.
- [Artifact #13959447708](https://github.com/etblink/math/actions/runs/43249643884/artifacts/13959447708), name `bfss-p2c4b-original-integrability-e4b07eba3f64525d7f48206558a2f5e524d3644e-1`, GitHub digest `sha256:8a236116a7d35faf17d6ccf60be0e24a15670625a34f2e0918c309f83ee837f4`.
- Immutable blobs: source `63b1d610d3924f1a78c077e009046d3fd6f811a3`, independent consumer `ef776ac650d4a0a772da14798920cd09f0a82204`, workflow `093174a04403f09b71d9d8640274b68265c2bc94`.
- Toolchain pinned to Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. The accepted workflow explicitly checks six expected axiom reports against only `propext`, `Classical.choice`, and `Quot.sound`; fails on `sorryAx`, explicit admissions/unsafe or unexpected warnings. Success establishes these checks passed.
- Prior accepted [M0 run #43242308459](https://github.com/etblink/math/actions/runs/43242308459) at `7eac35443797bd00e9b9574f4199ea64a751c29f` qualified `originalActualDensity_eq_sourceSum`. C4B consumes it without reopening the large source definition.

## Mathematical scope

All six original `SmoothCore 2` declarations in `BFSSP2C4BOriginalSourceIntegrability.lean` are strict-green:
`originalPotentialDensity_integrable`, `originalFermionDensity_integrable`,
`originalLinearMoment_integrable`, `originalActualDensity_integrable`,
`originalLowerDensity_integrable`, `originalMasslessCoreForm_lower`.

The formerly obstructed actual-density integrability proof rewrites by the qualified M0 whole-function equality and applies the original `MassiveMoments` public `AlgebraData.bosonic_core_integrable 1 0 f` and `AlgebraData.fermion_core_integrable 1 0 f` theorems. It does not construct a new integrability argument, weaken the original operator, or rewrite historical original-source modules.

Consequently the exact original smooth-core lower-form inequality no longer assumes C4A's two additional integrability premises. The independent consumer separately proves lower-density integrability and the radial integral comparison with the source `coreForm` after dropping a nonnegative kinetic term.

**Scientific ceiling:** this is an inequality on the original smooth core, not a demonstration of a closed-domain spectral inequality, valley confinement, nonempty reducing Spin(9) sector, positive point eigenvalue, compact resolvent, BFSS mass gap, or GUT/ToE.

## Preserved negative knowledge

The earlier C4B reds are diagnostic: reduction of the huge `concreteAlgebraData` structure during generic function addition led to elaborator/recursion trouble, not a demonstrated mathematical failure. The successful approach was historical API search -> source-exact minimal M0 interface -> strict M0 qualification -> direct reuse of source `MassiveMoments` integrability. Retain earlier red receipts; do not revisit blanket simplification or raise recursion limits without new causal evidence.

## Next bounded milestone: P3-OP1A

Per `P3_OP1_TRACE_PAIRING_AND_C4B_FALLBACK_2026_11_12.md`, after C4B acceptance audit the existing `P2bB3OriginalFockStarAutomorphismAction.lean` and `T1OriginalFockTraceInvariance.lean` donors. Target only the original operator trace pairing
`Tr((α_g S)^* (α_g T)) = Tr(S^* T)`
for arbitrary original Fock operators `S,T`, using exact `map_star`, `map_mul` and source trace invariance. Require separate independent nontrivial consumer and exact cold source/consumer/axiom gate; source API and donor status must be inspected before code modifications.

P3-OP1B Hilbert–Schmidt positivity/isometry, Spin continuity, gauge projection/source covariance, physical form and operator graph identification, compact sector arguments and eventual eigenpair transfer are separate later gates. Do not confuse operator norm with HS norm or operator columns with a substitute physical Hamiltonian.

**Governance:** documentation-only acceptance of exact historical tested commit. Continue only on unified integration; no new routine branch, no changes to `main`, FCP, previous proof files, consumer, or strict workflow.
