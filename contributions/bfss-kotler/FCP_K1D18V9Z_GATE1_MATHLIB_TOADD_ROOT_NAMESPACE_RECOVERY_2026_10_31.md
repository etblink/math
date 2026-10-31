# K1D18V9Z — first strict red: pinned Mathlib root namespace continuity bridge

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Original V9Z tested commit: `6ea7b35ee6ef3b6ec4bb8f8c49f3bc482fac6fa5`
Original V9Z source blob: `75718ac510f63ffe71db9513e6b0a16b1b2d6b0e`
Original strict workflow blob: `134b1c4775236d9938113372a6b4b2eccc87e009`
Prior accepted V9Y source: `8a09e7db98b842da215d7bc2e23d651d8b3e03ca`
First V9Z strict gate [Run #41239583476](https://github.com/etblink/math/actions/runs/41239583476), **RED**, job `124650478887`.
Preserved compiler evidence artifact: `bfss-v9z-original-paired-continuous-typed-orthogonal-hom-6ea7b35ee6ef3b6ec4bb8f8c49f3bc482fac6fa5-1`, artifact ID `13057062759`, digest `sha256:6103dde3ca0b6d93fd96da885fdb230707a43ad6f1efdb90e477e647c02ad106`.

## Verifiable failure boundary

The exact source hash, theorem-shape preflight, pinned Lean `leanprover/lean4:v4.34.1`/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and all accepted V9Y ancestry compiled successfully. Fresh V9Z source compilation under `-DwarningAsError=true` **failed** before the independent audit.

Three exact compiler diagnostics in proposed continuous hom definitions at source lines 36, 56 and 78:
`Unknown constant Multiplicative.continuous_toAdd`. Resulting unsolved goals were the three continuous `MonoidHom.toFun` obligations, and failed V9Z declarations printed `sorryAx`, so none qualify.

The pinned Mathlib file `Mathlib/Topology/Constructions.lean` has `open Additive Multiplicative` in a root-level section and declares `theorem continuous_toAdd : Continuous (toAdd : Multiplicative X → X) := continuous_id`. Opening the namespace to interpret `toAdd` does **not** place the theorem itself in `Multiplicative`. The erroneous fully-qualified name was a source API misunderstanding, not a counterexample to the mathematical continuity statement.

## Bounded correction hypothesis

Exactly three proof references in the V9Z original Lean file change:

```lean
(Multiplicative.continuous_toAdd (X := ℝ))
```

to

```lean
(continuous_toAdd (X := ℝ))
```

and the strict workflow changes only its frozen source hash and source-string preflight accordingly. No declarations' statements, original 48 paired-Fock labels or basis, preexisting accepted V9X/V9Y sources, mathematical assumptions, pinned versions, limits, warningAsError, or independent elaboration/axiom conditions change.

This corrects the first evidenced cause only. All remaining elaboration and typechecking still require a fresh strictly green gate with six independent declaration axiom audits, permitted only `propext`, `Classical.choice` and `Quot.sound`, and no `sorryAx`.

Even fully qualified V9Z would yield only fixed-generator continuous homs from `(ℝ,+)` into the literal source-native `O(48)`; not determinant one, global `Spin(9)→SO(48)`, a `Spin(48)` lift, covering, or BFSS physical result. Preserve both reds and greens. No main/FCP/upstream changes.
