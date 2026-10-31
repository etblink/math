# K1D18V9V — first strict red and source-preserving API argument bridge

Date: 2026-10-31 UTC
Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Original V9V experiment: `243ff6c79e99d2a9c71eb3feabd20f3189dcc2ad`
Original V9V source hash: `27f5d05e4d0134a84e2aa5099063ca753d05d113`
Prior V9U qualified run: [#41231276382](https://github.com/etblink/math/actions/runs/41231276382) at `99d9ffc3a28bfe91e57a0c06ecdb22cb09a18c72`
First V9V strict run: [#41232312032](https://github.com/etblink/math/actions/runs/41232312032) — **RED**, compiler failure, preserve.

## Verified first causal error

V9V passed exact source-pins/statement preflight, pinned Lean 4.34.1 and Mathlib SHA `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, and V9U ancestry compilation. Fresh V9V compilation under `-DwarningAsError=true` failed. The three proposed orthogonal-membership theorems had the same failure at source lines 35, 52, and 64:

```lean
exact Matrix.mul_nonsing_inv hdet
```

Lean reported that `hdet : IsUnit (exp ...).det` has sort `Prop` but the first explicit argument of `Matrix.mul_nonsing_inv` expects a `Matrix`. Pinned Mathlib's `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean` defines `theorem mul_nonsing_inv (h : IsUnit A.det) : A * A⁻¹ = 1` with `A` as an explicit surrounding variable, thus the call must supply `A` before `h`. Because elaboration failed, all three printed axiom reports included `sorryAx`, and the independent audit was skipped. None of the V9V theorems are qualified.

## Minimal corrective hypothesis

Only add the explicit inferred matrix parameter, in exactly three theorem bodies:

```lean
exact Matrix.mul_nonsing_inv _ hdet
```

No theorem statement, carrier, original paired-Fock label, normalized gamma generator, source-target LieHom, mathematical identity, limit, pinned dependency, or axiom allowance changes. Update only the source hash pin in the strict workflow. The independent audit remains unchanged, including the fully qualified `FCP.BFSSS1V0.Source48Label` and explicit `.val` bridge learned from V9U reds.

This is a Lean application/argument-order failure, not a counterexample to orthogonal-group membership. A fresh fully green compile plus independent declaration-level axiom audit is required before qualification. The real canonical LieHom, orthogonal exponentials, and even prospective orthogonal-group membership do **not** imply determinant-one orientation, global integration of Spin(9), a continuous Spin(48) lift or BFSS spectral claims. Do not alter main, FCP provenance or upstream mathcommunity.
