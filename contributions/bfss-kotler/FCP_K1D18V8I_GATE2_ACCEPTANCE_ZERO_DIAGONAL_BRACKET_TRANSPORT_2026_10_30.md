# Project Lead — V8I Gate 2 ACCEPTED: five exact original paired zero-diagonal Lie-bracket bridges

**Research-local date:** 2026-10-30 PDT; terminal GitHub Actions run completed 2026-10-31T02:49:19Z. **Disposition:** `ACCEPTED_5_SOURCE_EXACT_LEAN_ROOTS__UNIVERSAL_SO9_STILL_OPEN`.

## Immutable strict acceptance certificate

- [Corrected V8I strict Gate 2 run #41161070164](https://github.com/etblink/math/actions/runs/41161070164), attempt **1**, **completed/success**, job **124418521148** **completed/success**.
- **Exact tested Git SHA:** `c9a2640d581a9a83a9943c04bc52aac5dc16ea3e` on research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- **Exact tested candidate:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9ZeroDiagonalBracketsProbe.lean` with Git blob **`d9c453029eed5ffba4d498bb333a9d5302261aa3`**. This module derives five results from accepted V8A–V8H theorem roots. It does not replace original 48-real label space or mutate pinned gamma matrices.
- Original pinned source gamma, original paired Fock label crosswalk, V8A generator, original source brackets V8B/C/E/F/G, orientation theorem V8D and zero-diagonal V8H, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: source/toolchain pin preflight **PASS**.
- Pinned dependency restore **PASS**; six exact original source accepted ancestor targets built, log **`Build completed successfully (8958 jobs)`**, which counts dependency jobs, *not* new theorem roots.
- Fresh source `lake env lean -DwarningAsError=true` **PASS**, emitted actual `.olean`, **five exact `#print axioms` records**. No `sorryAx` or raised limits.
- Independent imported Lean audit **PASS**: five fresh kernel-checked `example` propositions independently restating each typed theorem, plus five `#check` and five `#print axioms`; each declaration reports **`[propext, Classical.choice, Quot.sound]`** only.
- Exact terminal marker **`K1D18V8I_EXACT_FIVE_ZERO_DIAGONAL_BRACKETS_TYPE_AXIOMS_PASS`**.
- Immutable compiler and independent audit [artifact #13028065036](https://github.com/etblink/math/actions/runs/41161070164/artifacts/13028065036), named `bfss-v8i-original-paired-zero-diagonal-c9a2640d581a9a83a9943c04bc52aac5dc16ea3e-1`, SHA256 **`7728a286474f3f9f5bf5374e0b9d830dbac6637d273ba96ffb3c8398ff6c7433`**, size **1170 bytes**.

## Exactly accepted mathematical scope

Namespace `FCP.BFSSPairedSpin9Plane`; all matrices are `Matrix Source48Label Source48Label ℝ` on actual original Fock-paired 48 labels.

- `zeroDiagonalPairedPlane_adjacent_bracket`: `[L_rs,L_st] = -(L_rt+L_rt)` for pairwise distinct r,s,t.
- `zeroDiagonalPairedPlane_disjoint_bracket`: `[L_rs,L_tu] = 0` for four pairwise distinct r,s,t,u.
- `zeroDiagonalPairedPlane_shared_right_bracket`: `[L_rs,L_ts] = L_rt+L_rt` for pairwise distinct r,s,t.
- `zeroDiagonalPairedPlane_shared_left_bracket`: `[L_rs,L_rt] = L_st+L_st` for pairwise distinct r,s,t.
- `zeroDiagonalPairedPlane_cross_right_bracket`: `[L_rs,L_tr] = -(L_st+L_st)` for pairwise distinct r,s,t.

These theorems transfer exact accepted original K brackets via V8H `zeroDiagonalPairedPlane_of_ne`. The raw original doubled generator `K_rr=-I`, while `L_rr=0` is an explicitly proved correction. Never silently use a zero-diagonal convention for raw `K`.

## Earlier same-source gate and negative knowledge

The uncorrected initial V8I run [#41161039741](https://github.com/etblink/math/actions/runs/41161039741) also completed **green**, tested SHA `5af4dd80114c4842ac1b23c9fc2a6d1e9115aa38`; however its preflight anti-admit regex was double-escaped, weakening that one static screen. Before relying on it, workflow-only commit corrected the scanner to actual regex word boundaries, without changing the `V8I` theorem blob. **For formal acceptance use the stronger complete Gate 2 run #41161070164**. No need to retry the unchanged accepted Lean source or change limit settings.

Historical source-presentation false negatives in V8A had brittle regular expressions of Lean pretty-printed theorem types. V8I uses **independently type-checked Lean examples** instead of parsing Lean's namespace abbreviations, and parses only machine-checkable named `#print axioms` records.

## Cumulative acceptance and next source-exact frontier

V8A 2 roots + V8B 1 + V8C 1 + V8D 1 + V8E 1 + V8F 1 + V8G 1 + V8H 3 + V8I **5** = **16 newly qualified source-exact roots**.

A **single universal four-index bracket on L**, valid even when the indices coincide, remains **UNPROVED IN LEAN**. The proposed statement, independently checked by exact source gamma matrix integer arithmetic on all **9⁴=6561** ordered index quadruples, is

```text
[L_rs,L_tu] =
  2*(δ_su L_rt - δ_st L_ru + δ_rt L_su - δ_ru L_st)
```

where `δ_ab` is a typed Kronecker delta, not a comparison of source Fock basis with color-major ordering. This finite integer verification corroborates sign/factor only and cannot qualify the Lean theorem.

**Next bounded proof:** first implement exact source-native typed delta and four-index RHS; separately prove the RHS vanishes for either generator's diagonal index pair, and matches zero for matching or reversed pair cases. Handle all equalities explicitly using the accepted V8H zero/swap results. Only then combine accepted V8I five distinct-index bracket cases into one general theorem under an exact independent strict gate.

Do not misstate this as a full matrix Lie algebra homomorphism, a continuous group lift, original Fock group action, topological covering, gauge covariance or BFSS spectral/physical result. These remain distinct and unproved.

**Repository controls:** do not edit V8A–V8I strictly qualified source blobs, frozen FCP, `main`, or upstream mathcommunity; no upstream PR without explicit owner authorization. This handoff commit is documentary, not a new accepted Lean root.
