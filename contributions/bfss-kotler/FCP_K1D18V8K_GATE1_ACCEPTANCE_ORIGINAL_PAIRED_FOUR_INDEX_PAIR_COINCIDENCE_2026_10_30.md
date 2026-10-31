# Project Lead — V8K Gate 1 ACCEPTED: original paired four-index same and reversed pair boundaries

**Research local date:** 2026-10-30 PDT; GitHub Actions completed **2026-10-31T03:16:24Z**. **Disposition:** `ACCEPTED_4_SOURCE_EXACT_LEAN_ROOTS__UNIVERSAL_FOUR_INDEX_STILL_OPEN`.

## Immutable strict qualification

- [V8K strict Gate 1 #41163119628](https://github.com/etblink/math/actions/runs/41163119628), attempt 1, **completed/success**, job `124424817829` **completed/success**.
- Exact tested commit: **`a8a30337833dd3a3d008d3b0af5aec081df092ce`** on `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Exact accepted source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FourIndexPairCoincidenceProbe.lean`; Git source blob **`10c1f7ea6bccece8003632d9fc43ace907dc27f1`**.
- Preflight source-original paired Fock label equivalence and gamma, source V8A generator, V8D orientation, V8H zero diagonal, V8J four-index RHS and exact candidate SHA pins **PASS**; Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned.
- Dependency restore and exact accepted V8J ancestor `lake build` **PASS**. `Build completed successfully (8954 jobs)` counts dependency build jobs, not accepted roots.
- Fresh V8K `lake env lean -DwarningAsError=true` source compile **PASS**, actual `.olean` and exactly four declaration-level `#print axioms` reports.
- Separately compiled exact-typed Lean audit checked four independent propositions via `example`, four `#check`s, four `#print axioms` with the terminal marker `K1D18V8K_FOUR_PAIR_COINCIDENCE_TYPES_AXIOMS_PASS`.
- Each of four declarations reports **`[propext, Classical.choice, Quot.sound]`** only; no `sorryAx` or proof-limit increases.
- Immutable compiler and audit [artifact #13027554843](https://github.com/etblink/math/actions/runs/41163119628/artifacts/13027554843): `bfss-v8k-original-paired-zero-diagonal-a8a30337833dd3a3d008d3b0af5aec081df092ce-1`, SHA256 **`a894623717bf27a9f797f3e86fc6adb9d198cafa73205b1f6042e3a31a5a6dd0`**, size 1063 bytes.

## Exact accepted statement set

All declarations in `FCP.BFSSPairedSpin9Plane` and actual `Matrix Source48Label Source48Label ℝ`. Let `L_rs=zeroDiagonalPairedPlane r s` and `R(r,s,t,u)=zeroDiagonalFourIndexRHS r s t u`.

1. `zeroDiagonalFourIndexRHS_same_pair`: `r≠s → R(r,s,r,s)=0`.
2. `zeroDiagonalFourIndexRHS_reverse_pair`: `r≠s → R(r,s,s,r)=0`.
3. `zeroDiagonalFourIndex_same_pair_bracket`: `r≠s → [L_rs,L_rs]=R(r,s,r,s)`.
4. `zeroDiagonalFourIndex_reverse_pair_bracket`: `r≠s → [L_rs,L_sr]=R(r,s,s,r)`.

V8J already established left- and right-diagonal plane cases. V8I established five distinct-index bracket relations. V8K's pair identities close the **same/reversed off-diagonal pair** cases, not the remaining shared-one-index or four-distinct RHS matching.

## Full ledger and next bounded work

V8A–V8I = 16 accepted roots, V8J = 4, V8K = **4**: **24 qualified source-exact algebraic roots**.

The proposed universal four-index statement remains **UNPROVED IN LEAN**:
```text
[L_rs,L_tu] =
  (if s=u then L_rt+L_rt else 0)
  - (if s=t then L_ru+L_ru else 0)
  + (if r=t then L_su+L_su else 0)
  - (if r=u then L_st+L_st else 0).
```
The independent exact original gamma finite-integer 9^4=6561 check of this formula corroborates signs/factors, not formal proof.

**Next proof architecture:** one bounded module establishing that the typed RHS specializes correctly for **four pairwise distinct indices**, plus each of the **four exactly one-shared-index orientations**. Use explicit `r≠s`, `t≠u`, and the other inequalities; reduce `if` conditions with source-exact Lean `simp`, then reuse the five V8I accepted bracket declarations. Keep each root small and independently type/axiom audited before attempting a universal four-index theorem. Do not manipulate raw `K_rr` as a zero generator; only `L_rr=0` is valid.

The `so(9)` all-index matrix bracket, actual Lie algebra homomorphism, continuous global Spin(9)→Spin(48) lift, source Majorana Fock action, gauge covariance and BFSS spectral claims remain distinct unfinished obligations. No changes to accepted Lean blobs, frozen FCP, `main`, or upstream; no external PR without explicit owner authorization. This document follows the exact tested SHA and is not itself mathematical qualification.
