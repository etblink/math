# K1D18V9Z — gate 3 red: expose the composed time-tag function before type-level simplification

Date: 2026-10-31 UTC.
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
Third tested commit: `b18429e4dc79c5b53ced2a46b7f7721742d1e3a3`.
Third original source blob: `c04316c649788c754a6e7f51a87bffab35007875`.
Third original workflow blob: `99e3e47275e7cc47ea84e9106f99838d84cc7285`.
Third strict run: [#41241412956](https://github.com/etblink/math/actions/runs/41241412956) — **RED**. Job `124655921028`.
Preserved failure artifact ID `13058300696`, digest `sha256:f894ee0fb4343872a556ea21eafd6431e72b808c4bdb32d4bf5f920a3f139cac`.
Pinned Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Three consecutive failures — separate evidence, not averaged successes

1. V9Z Gate 1 [#41239583476](https://github.com/etblink/math/actions/runs/41239583476), SHA `6ea7b35ee6ef3b6ec4bb8f8c49f3bc482fac6fa5`: mistook root-level `continuous_toAdd` for `Multiplicative.continuous_toAdd`; all three typed hom constructs failed.
2. V9Z Gate 2 [#41240548627](https://github.com/etblink/math/actions/runs/41240548627), SHA `263c8610cebf47220122782b9e2c65e8d2ae11b4`: scope of `continuous_toAdd` corrected, but used nonexistent `Multiplicative.ofAdd_toAdd` rather than pinned root-level `ofAdd_toAdd`; all three continuous function goals failed.
3. V9Z Gate 3 [#41241412956](https://github.com/etblink/math/actions/runs/41241412956), SHA `b18429e4dc79c5b53ced2a46b7f7721742d1e3a3`: both theorem names now recognized, but `simpa only [Function.comp_apply, ofAdd_toAdd] using h` does not normalize a **bare function composition** inside `Continuous`. `Function.comp_apply` applies when the composed function is *applied to an argument*, not merely when it is seen as an unapplied function. The resulting h type remains `Continuous ((fun t => f (ofAdd t)) ∘ toAdd)`, versus the required `Continuous f`. Exact fresh V9Z compilation failed at lines 37, 57 and 79, declarations printed `sorryAx`; independent six-declaration audit skipped.

Every run passed exact ancestry preflight, pinned Lean/Mathlib restore, and accepted V9Y ancestry compile before failing at fresh V9Z source compilation under `-DwarningAsError=true`.

## Bounded gate 4 correction hypothesis

For each of three continuous hom proofs, keep the source-exact existing V9Y continuity and composition `h`, but **expose the pointwise lambda explicitly** through definitional equality:

```lean
change Continuous (fun u : Multiplicative ℝ =>
  f (Multiplicative.ofAdd (Multiplicative.toAdd u))) at h
simpa only [ofAdd_toAdd] using h
```

In the actual three statements `f` is respectively `pairedSkewOneParameterOrthogonalHom X hX`, `normalizedPairedPlaneOneParameterOrthogonalHom r s`, `coordinateToPairedCanonicalOneParameterOrthogonalHom A`. The pinned `Mathlib/Algebra/Group/TypeTags/Basic.lean` declares the root-level `@[simp] theorem ofAdd_toAdd`. This changes only the local proof bridge: no theorem statements, index-label carrier, canonical LieHom, mathematical assumptions or type-redefined group structures change.

Update the exact source blob hash in the frozen strict workflow. Retain fresh original source compilation, independent full-qualified original `Source48Label` examples, six named axiom audits with only `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`, and all pinned dependencies. No raising limits. This is a **hypothesis** and must pass a distinct new green run before any V9Z acceptance.

Even qualified V9Z would only construct fixed-generator continuous real one-parameter homomorphisms into the actual source-native `O(48)`. Determinant-one, global `Spin(9)→SO(48)` integration, exact `Spin(48)` lift and covering, and BFSS physical/spectral consequences remain unproved. Preserve red evidence. Do not touch main, FCP provenance or upstream mathcommunity.
