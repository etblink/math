# RHOPF-P9C1C1B-D0 R1 — original single-gamma column diagnostic native RED; R2 recovery

**Date:** 2026-11-19.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**R1 original run:** [#44574592530](https://github.com/etblink/math/actions/runs/44574592530), native RED.
**Exact tested commit:** `eeccf6271ded5c0f02f9d98e4f00c9d8a22cbdab`.
**Archived artifact:** [#14557490685](https://github.com/etblink/math/actions/runs/44574592530/artifacts/14557490685), independently downloaded original ZIP SHA-256 `2b36de9a1387d878eeaea448df7b4b59ecfa8c2d1273bf98e0276b487153280e`, matching GitHub digest; verified embedded `exact-tested-commit.txt`.

## What passed and what failed

Original source/hash preflight passed, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` passed, predecessor source dependencies built, original signed-permutation independent integer fixture passed.

The source-native single-gamma microgate did not compile. At line 39:4 the `norm_num [gamma, Matrix.map_apply, Pi.single]` invocation attempted to unfold the full dependent `Pi.single` definition; Lean reported a dependent-function type mismatch:
`Pi.single 10 ?m.55 i` has type `?m.48 i` but a real scalar was expected.
`originalGamma3_on_basis0` therefore had `sorryAx` in its RED diagnostic. Independent Lean consumer step skipped. There is no native proof of `gamma 3 *ᵥ e0 = e10` from R1, and the prior coordinate-identification claim stays OPEN.

## Strictly bounded R2

Leave the theorem statement, original frozen `gamma`, selected original basis, `Matrix.mulVec_single_one` normalization, public source import, independent Lean consumer, resource budgets, CI workflow, and allowed axioms unchanged. Replace only the final tactic line:

- R1: `fin_cases i <;> norm_num [gamma, Matrix.map_apply, Pi.single]`.
- R2: `fin_cases i <;> norm_num [gamma, Matrix.map_apply, Pi.single_apply]`.

The latter uses a specifically typed simplification lemma for applying one coordinate vector rather than unfolding the general dependent `Pi.single` constructor. Update solely the exact source Git hash in the frozen strict workflow.

This tests whether an ordinary single original public gamma column can be proved with pinned Mathlib and no private original table copying, `import all`, source Gamma9 edits, or resource overrides. **R2 is unqualified unless the exact native and independent Lean consumer, both allowed-axiom reports and original archive pass**. If a residual source reduction error appears, preserve the R2 RED and rearchitect rather than increase limits or repeat earlier failed expansion.

The accepted P9C1C1A R3 equalizer [#44571452613](https://github.com/etblink/math/actions/runs/44571452613) remains strict GREEN; no result of the present single-column diagnostic is necessary to that mathematical theorem. Further work must still prove four source-original basis equalities before identifying the selected four-plane; BFSS Fock dynamics and conserved physical/SM observations remain separate.
