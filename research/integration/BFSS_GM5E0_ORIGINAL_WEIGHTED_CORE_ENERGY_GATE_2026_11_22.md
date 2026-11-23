# GM5E0 — original weighted kinetic-plus-bosonic core energy gate (candidate)

**Status:** Staged for exact original-source independent strict CI. This memo does not promote GM5E0 before the original test result and independently audited artifact.

## Contract

For the literal original `M : AlgebraData 2`, `G : M.GaugeData`, and `f : G.invariantCore`, prove:

```text
kineticPotentialCoreEnergy M f.val ≤
  (1/16)*‖originalMinimalPhysicalHilbertChargeColumn M G
    (closedChargeCoreInput M G f)‖²
  + M.fermionGrowthConstant * coreRadialMoment f.val.
```

This is **only on original invariant smooth-core inputs**. It follows from the **lower** half of qualified GM5C `abs_le` for `nativeCoreEnergy_difference_le` and one `linarith` step; it does not assume a global first moment or expand the original Fock quantizer. The native charge is the actual original physical sixteen-charge column, not a proxy. Independent consumer states the same result with actual `pairedAlgebraData`, `pairedGaugeData`, and original source charge column.

## Source-exact rules

- Pinned Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
- Freeze original GM5C, GM5B, original paired Fock/gauge data, original potential/core source dependencies by exact blob hash.
- One source theorem; one independent paired consumer theorem; each must report only accepted `propext`, `Classical.choice`, and `Quot.sound`.
- Original native `lake build` and standalone independent consumer under warning-as-error and no autoImplicit; independent source and tested Git blobs recorded; provider ZIP preserved even on RED.
- No `sorry`, `admit`, new axioms, unsafe, or expanded recursion/heartbeat budgets.
- The earlier GM5D R3 is accepted independently under [run #45107140917](https://github.com/etblink/math/actions/runs/45107140917). This gate *imports only GM5C*, and does not change GM5D.

## Stop rule and next scientific obligation

The estimate controls kinetic-plus-bosonic original core energy only with an **extra first radial moment**. It does not establish finite radial moment on all `Dom(T)`, a closed weighted graph, a global coercive inequality, compact resolvent, a ground state, mass gap, Hopfion, GUT, or a Standard Model prediction. The next obligations are **weighted graph convergence** and original physical cutoff/density adapters; consult [GM5E forward research](BFSS_GM5E_WEIGHTED_CORE_ENERGY_FORWARD_RESEARCH_2026_11_22.md).
