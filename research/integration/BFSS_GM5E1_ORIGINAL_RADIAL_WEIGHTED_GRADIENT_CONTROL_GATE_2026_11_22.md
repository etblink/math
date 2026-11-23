# GM5E1 — exact original first radial weighted Hilbert gradient control

**Status:** candidate, awaiting native original-source and independent paired SU(2) strict verification. Never promote from source existence or proof text alone.

## Contract

Source `radialWeightedCore f` uses exactly `BFSSSliceSobolev.weightedToL2` and weight `√‖x‖` on the original Fock smooth core. Prove `‖radialWeightedCore f‖² = coreRadialMoment f` by the source `weightedToL2_norm_sq` and real square-root identity.

Combining strictly qualified GM5E0, GM5D's exact source gradient norm identity, and the nonnegative original bosonic potential, prove for `f:G.invariantCore`:

```text
‖sourceCoreGradient f.val‖² ≤ (1/8)‖nativeCoreChargeValue M G f‖²
  + 2*M.fermionGrowthConstant*‖radialWeightedCore f.val‖².
```

Require separate source-exact CI and the literal paired SU(2) independent consumer under the existing pinned toolchain, original frozen imports, and two standard-only axiom reports per file.

## Limitations and next gate

This is a **smooth-core** energy-norm bridge, not a theorem about every element of the completed physical charge domain. GM5E2 should prove additivity of `radialWeightedCore` on original smooth-core differences via `BFSSSliceSobolev.weightedToL2_ae`, then use the GM5D gradient-Cauchy method for a weighted joint graph-Cauchy sequence.

`BFSSSliceSobolev.weightedClosure` in the original `FormClosure.lean` is defined over **all** smooth-core triples; identifying its physical-invariant restriction or any operator domain needs an additional source-exact argument. Do not infer unrestricted density, global first-moment coercivity, separate potential/fermionic multiplier convergence, compact resolvent, gap, ground state, Hopfion, GUT or SM claims. Preserve historical M4 anchors and GM5D R1/R2 REDs.
