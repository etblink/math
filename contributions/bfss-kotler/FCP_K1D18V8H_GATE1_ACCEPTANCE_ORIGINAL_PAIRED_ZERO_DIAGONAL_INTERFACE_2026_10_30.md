# Project Lead — V8H Gate 1 ACCEPTED: source-original zero-diagonal paired Spin(9) interface

**Research-local date:** 2026-10-30 PDT; strict CI finished 2026-10-31T02:37:45Z. **Disposition:** `ACCEPTED_3_SOURCE_EXACT_LEAN_ROOTS__NOT_COMPLETE_SO9`.

## Exact immutable proof qualification

- [GitHub Actions V8H Gate 1 #41160260904](https://github.com/etblink/math/actions/runs/41160260904) completed **SUCCESS**, run attempt **1**, exact tested commit **`030196c9f7dfb4b361e582fa290a4d6c804864ed`**. Job **`124416061920`** completed **SUCCESS**.
- New candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9ZeroDiagonalInterfaceProbe.lean` exact **Git blob `8aa93c41a83164e3a99eca139de477d82842d589`**.
- Preflight checks pinned Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original gamma, original paired Fock crosswalk, V8A generator, V8D orientation-swap and exact candidate; all **PASS**.
- Pinned dependencies restored; V8D ancestor compiled. `Build completed successfully (8952 jobs)` is a dependency-build count, **not** new theorem count.
- Fresh module compilation via `lake env lean -DwarningAsError=true` **PASS** and emitted an actual `.olean`; exactly three root-level axiom reports.
- Independent fresh imported Lean module checked three exact original proposition `example`s, `#check` for each and `#print axioms` for each under warnings-as-errors **PASS**.
- Terminal marker `K1D18V8H_EXACT_THREE_ORIGINAL_PAIRED_ZERO_DIAGONAL_ROOTS_PASS`. Each root uses **only** `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, no raised proof resource limits.
- [Preserved compiler and independent audit artifact #13026937737](https://github.com/etblink/math/actions/runs/41160260904/artifacts/13026937737), name `bfss-v8h-original-paired-zero-diagonal-030196c9f7dfb4b361e582fa290a4d6c804864ed-1`, SHA256 **`a50e9bbf4dfcf1733073b33fa31c635db044e6aef6dc984ce4b56ba13f15da31`**, size 985 bytes.

## Exact accepted theorems

In namespace `FCP.BFSSPairedSpin9Plane`, define

```lean
noncomputable def zeroDiagonalPairedPlane (r s : SpaceIndex) :
    Matrix Source48Label Source48Label ℝ :=
  if r = s then 0 else originalPairedPlane r s
```

Three strictly qualified roots, all on the **original paired-label Source48Label**, not a surrogate color-major index:

1. `zeroDiagonalPairedPlane_self (r : SpaceIndex)`: `zeroDiagonalPairedPlane r r = 0`.
2. `zeroDiagonalPairedPlane_of_ne (r s : SpaceIndex) (hrs : r ≠ s)`: `zeroDiagonalPairedPlane r s = originalPairedPlane r s`.
3. `zeroDiagonalPairedPlane_swap (r s : SpaceIndex)`: `zeroDiagonalPairedPlane s r = -(zeroDiagonalPairedPlane r s)`.

This corrects the **real negative control**: the raw V8A gamma plane `originalPairedPlane r r` is `-I`, not zero. Do **not** replace raw K or assert all-indices `so(9)` relations for raw K.

## Cumulative strict-qualified root ledger and next theorem

- V8A = 2; V8B = 1; V8C = 1; V8D = 1; V8E = 1; V8F = 1; V8G = 1; V8H = **3**.
- **Cumulative V8A–H = 11 accepted roots**, all with terminal green CI and exact source/axiom records.
- V8B–G provide exact off-diagonal shared-index and disjoint cases, but do not independently establish one universal all-indices Lie-algebra theorem.
- Next source-exact target on `L=zeroDiagonalPairedPlane` (notation only for clarity), with `[A,B]=AB-BA` and Kronecker delta `δ`:
  ```text
  [L_rs, L_tu] = 2 * ( δ_su L_rt - δ_st L_ru + δ_rt L_su - δ_ru L_st )
  ```
  Confirm sign and factor from the original accepted V8B, V8E, V8F, V8G equations. Handle diagonal and coincident-index cases **explicitly**. First establish typed off-diagonal transport of each V8B–G bracket, then case-split the finite equalities, preserving full source label/index type. Avoid any "blanket so9 from K" shortcut, basis replacement, proof-limit escalation or regex of Lean pretty-printing.
- A complete matrix Lie algebra homomorphism and integrated global `Spin(9)` action remain **separate future obligations** even after an all-indices bracket. So do original 48-Majorana Fock implementation, full gauge/B tensor covariance, topology and BFSS spectral properties.

**Controls:** no changes to accepted V8A–H Lean source, frozen FCP, main or upstream mathcommunity without owner instruction. This documentation commit is not a new Lean proof gate.
