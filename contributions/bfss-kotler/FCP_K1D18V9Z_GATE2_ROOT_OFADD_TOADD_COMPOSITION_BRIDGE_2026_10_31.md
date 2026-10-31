# K1D18V9Z — second strict red: root-level ofAdd_toAdd and exact composition normalization

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Second V9Z tested SHA: `263c8610cebf47220122782b9e2c65e8d2ae11b4`
Second V9Z source blob: `b6bc88a939667ec15cedc9c7cf5e29875bdcb830`
Second V9Z workflow blob: `a5f4c4fda4d97090178abc444639d7b5483315e7`
Second red strict run: [#41240548627](https://github.com/etblink/math/actions/runs/41240548627), job `124653353474`, **RED**.
Preserved evidence artifact: `bfss-v9z-original-paired-continuous-typed-orthogonal-hom-263c8610cebf47220122782b9e2c65e8d2ae11b4-1`, ID `13057162515`, digest `sha256:769b3e74e235de4701a9d60a110fcc519f781015f5a95c4b642339059951aef0`.

## First/second failure separation

- **First RED** Run [#41239583476](https://github.com/etblink/math/actions/runs/41239583476) at `6ea7b35ee6ef3b6ec4bb8f8c49f3bc482fac6fa5` was due to naming the root-level `continuous_toAdd` as `Multiplicative.continuous_toAdd`. Source was corrected to the actual root-level `continuous_toAdd (X := ℝ)`.
- **Second RED** Run [#41240548627](https://github.com/etblink/math/actions/runs/41240548627) passes exact source/statement preflight, pinned Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, and accepted V9Y ancestry compile. Fresh V9Z `-DwarningAsError=true` compilation fails at lines 37, 57, 79. Each uses the nonexistent `Multiplicative.ofAdd_toAdd` while attempting to discharge a typed continuous hom `Continuous (↑hom).toFun`. The corresponding `h` term proves continuity of a function composition `(fun t => hom (Multiplicative.ofAdd t)) ∘ Multiplicative.toAdd`. Source declarations print `sorryAx` and independent type/axiom audit is skipped. Neither RED qualifies V9Z.

## Source-verified cause

At pinned Mathlib `Mathlib/Algebra/Group/TypeTags/Basic.lean`, `namespace Multiplicative` ends **before** the globally declared, tagged simplification lemma `@[simp] theorem ofAdd_toAdd (x : Multiplicative α) : ofAdd x.toAdd = x := rfl` (around source line 124). Thus the correct theorem name is root-level `ofAdd_toAdd`. The continuation from composed function to original hom evaluation also merits explicit simplification of `Function.comp_apply`.

## Minimal corrective experiment

Replace exactly three occurrences:
```lean
simpa only [Multiplicative.ofAdd_toAdd] using h
```
with
```lean
simpa only [Function.comp_apply, ofAdd_toAdd] using h
```
and re-pin the exact source blob in the strict workflow. All six mathematical statements, original `FCP.BFSSS1V0.Source48Label` 48-dimensional Fock-paired carrier, canonical V9T LieHom, normalized generators, three `ContinuousMonoidHom` targets, Lean/Mathlib pins, independent original typed examples, and declaration-level `#print axioms` remain untouched. No raised limits or weakened gates.

**No qualification claim** until new strict run compiles all source and independently elaborates all six declarations with only `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`.

Even if successful this is only fixed-generator real one-parameter continuous homs into `O(48)`, not determinant-one `SO(48)` nor a global `Spin(9) → SO(48)`, `Spin(48)` lift/covering, or BFSS spectral theorem. Do not touch main/FCP/upstream.
