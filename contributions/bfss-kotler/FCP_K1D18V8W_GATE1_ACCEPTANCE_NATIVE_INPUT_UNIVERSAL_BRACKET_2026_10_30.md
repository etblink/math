# Project Lead — V8W Gate 1 ACCEPTED: native 9×9 input universal coordinate bracket

**Research-local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T06:14:35Z. **Disposition:** `ACCEPTED_TWO_SOURCE_EXACT_INPUT_BRACKET_ROOTS__ARBITRARY_SKEW_LIE_HOMOMORPHISM_OPEN`.

## Strict qualification certificate

- [V8W strict Gate 1 #41175164112](https://github.com/etblink/math/actions/runs/41175164112), attempt **1**, terminal **completed/success**, job **`124461091196`** **completed/success**; exact tested SHA **`8905b702f83abbec742e24e9bd6ae98200f9ac12`**.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinateUniversalBracketProbe.lean`, original exact Git blob **`6d77516897cfbc229652fa779647da95150756c3`**.
- Exact original 48-real paired-Fock source-label and gamma hashes and accepted native nine-index ancestors, pinned Lean **`leanprover/lean4:v4.34.1`**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`** checked **PASS**.
- Pinned dependency restoration and accepted V8T/V8U/V8V module builds **PASS**. Log `Build completed successfully (8972 jobs)` is build workload, **not** accepted root count.
- Fresh exact V8W source compiled `-DwarningAsError=true` with `.olean` and two exact source `#print axioms` reports **PASS**.
- Independent fresh imported Lean audit independently instantiated **two exact theorem-type examples**, two `#check`, two `#print axioms` **PASS**; terminal marker **`K1D18V8W_TWO_NATIVE_SO9_BRACKET_ROOTS_AXIOMS_PASS`**.
- Both roots use exactly **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, `sorry`, `admit`, extra axiom, raised proof limit or disabled linter.
- [Preserved compiler and independent axiom artifact #13033280246](https://github.com/etblink/math/actions/runs/41175164112/artifacts/13033280246), name `bfss-v8w-original-paired-coordinate-universal-bracket-8905b702f83abbec742e24e9bd6ae98200f9ac12-1`, SHA256 **`bf02010ba7174014ea3ea1eedaf63fe767ac68b9c199f34cb5f9f55efe93ee73`**, size **1074 bytes**.

## Exact accepted roots

Native `F_rs=coordinatePlane9 r s : Matrix SpaceIndex SpaceIndex ℝ` and `E_rs=Matrix.single r s (1:ℝ)`:

1. `FCP.BFSSPairedSpin9Plane.coordinatePlane9_conditional_single_sub_single` (with `(p : Prop) [Decidable p] (r s : SpaceIndex)`) proves exact `if p then F_rs else 0 = (if p then E_rs else 0)-(if p then E_sr else 0)`, preserving decidable typeclass evidence and all index degeneracies.
2. `FCP.BFSSPairedSpin9Plane.coordinatePlane9_universal_four_index_bracket (r s t u : SpaceIndex)` proves
```text
F_rs F_tu - F_tu F_rs =
  -(if s=u then F_rt else 0)
  + (if s=t then F_ru else 0)
  - (if r=t then F_su else 0)
  + (if r=u then F_st else 0)
```
i.e. `[F_rs,F_tu]= -δ_su F_rt+δ_st F_ru-δ_rt F_su+δ_ru F_st`.

The four-index structure coefficients **match** accepted V8R on `H_rs=normalizedPairedPlane r s=-(1/2)•L_rs` on *original Fock-paired 48-real labels* `Source48Label`. We have checked **generator brackets** in their respective different carrier types. This is not a typed map `so(9) → so(48)`, not a proof of linear extension or bracket preservation on arbitrary inputs, and not a global Spin(9) lift or physical BFSS result.

## Ledger and mathematically sound successor program

V8A–V8V: **45 accepted roots**. V8W: **2 accepted**, so **47 source-exact accepted algebraic roots**.

**V8X:** define a typed *candidate* finite-index linear extension, e.g. `ρ(A)=(1/2)•∑_{r,s:SpaceIndex}(A r s)•H_rs` for native 9×9 real coefficient matrices. Establish its source-native well-typedness, zero, addition and scalar homogeneity in small strict gates. This formula gives `ρ(F_rs)=H_rs` only after an independently verified basis-evaluation gate. Do not assert generator agreement, skew-carrier membership or Lie bracket preservation before proofs. Prefer `Finset.sum` and typed scalar-transport lemmas; avoid guessed `Matrix` coercions or reordered original Fock labels. After linearity, prove `ρ(F_rs)=H_rs`, spanning/decomposition for arbitrary skew 9×9 matrices and arbitrary bracket preservation. A `LinearMap` structure and exact `so(9)` carrier should be constructed only with the necessary field proofs. Then any global Spin(9) integration is separate.

Preserve negative knowledge: V8J unreachable tactic, V8L unused simp, V8O rewrite loop, V8R conditional goals and `Decidable` mismatch/deprecation, V8S dependent if rewrite, V8U unnecessary `simpa`; all exact reds and green repairs remain in repository. No modifications to accepted Lean source Git blobs, frozen FCP, `main`, or mathcommunity upstream; no upstream PR without explicit authorization.

This acceptance note qualifies precisely two Lean declaration roots and makes no new mathematical claims.
