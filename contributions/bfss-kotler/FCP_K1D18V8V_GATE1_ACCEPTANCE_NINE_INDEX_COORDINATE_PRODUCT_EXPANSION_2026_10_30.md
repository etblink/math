# Project Lead — V8V Gate 1 ACCEPTED: all-indices nine-dimensional coordinate plane product expansion

**Research-local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T06:03:50Z. **Disposition:** `ACCEPTED_ONE_NATIVE_9X9_FOUR_TERM_PRODUCT_ROOT__SO9_INPUT_BRACKET_STILL_OPEN`.

## Exact immutable qualification

- [V8V strict Gate 1 #41174539260](https://github.com/etblink/math/actions/runs/41174539260), attempt **1**, **completed/success**, exact tested SHA **`50197a29b69e1ce53f564671c67189f8cb7d59b8`**, job **`124459253229`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinatePlaneProductExpansionProbe.lean`, original Git blob **`da60e25fe1e6f0c5bd29ea6db7754f27394974f5`**.
- Native input `SpaceIndex` plus exact original 48-real Fock-paired gamma/label, accepted V8S/V8T/V8U source ancestors, Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: pin preflight **PASS**.
- Pinned dependencies restored; accepted input ancestors compiled **PASS**. `Build completed successfully (8971 jobs)` refers to build jobs **not** qualified roots.
- Fresh V8V source compiled warnings-as-errors, `.olean` emitted, one source declaration-level `#print axioms` **PASS**.
- Independent imported Lean audit with an exact theorem-type `example`, `#check`, and `#print axioms` **PASS**, terminal marker **`K1D18V8V_FOUR_TERM_COORDINATE_PRODUCT_AXIOMS_PASS`**.
- Only axioms `[propext, Classical.choice, Quot.sound]`, no `sorryAx`, `sorry`, `admit`, new axioms, disabled lint, or raised proof limits.
- [Compiler/type/axiom artifact #13032354264](https://github.com/etblink/math/actions/runs/41174539260/artifacts/13032354264), name `bfss-v8v-original-paired-coordinate-plane-product-expansion-50197a29b69e1ce53f564671c67189f8cb7d59b8-1`, ZIP SHA256 **`904b59828dcc7a111bea43040ba1f8b0def40dd36ef2c933aeeac44ea800ee2f`**, size 971 bytes.

## Qualified theorem and source scope

`FCP.BFSSPairedSpin9Plane.coordinatePlane9_mul_expanded (r s t u : SpaceIndex)`:
```text
F_rs F_tu = (if s=t then E_ru else 0) - (if r=t then E_su else 0)
            - ((if s=u then E_rt else 0) - (if r=u then E_st else 0)).
```
Here `F_rs=coordinatePlane9 r s=E_rs-E_sr` and `E_rs=Matrix.single r s (1:ℝ)` on the **native 9×9 `SpaceIndex`**, *not* original paired `Source48Label`. All four-index coincidences included. This is the product expansion, not yet a matrix commutator formula or a 9-to-48 linear map.

The algebraic follow-on anticipated from this and its swapped case is
```text
[F_rs,F_tu] = -δ_su F_rt + δ_st F_ru - δ_rt F_su + δ_ru F_st.
```
This sign pattern matches accepted V8R's output `H` commutator, but **matching generator structure constants is not the same as constructing and verifying a typed Lie homomorphism**. A fully Lean-checked input bracket and linear span/extension on all skew 9×9 matrices are still required.

## Ledger, bounded next step, and preserved negative knowledge

V8A–V8U 44 accepted source-exact algebraic roots; **V8V adds one = 45 accepted**.

**V8W:** derive one source-exact all-four-index input bracket in native 9×9 `coordinatePlane9` from V8V, with a carefully typed matrix-unit-to-coordinate RHS transport lemma if needed. Split intermediate statement(s) into separate gates if symbolic conditional rewrite remains fragile. Prefer `simp only` for equality conditions under dependent `ite`, typed conditional bridges with explicit `Decidable` and pointwise scalar algebra over uncontrolled 16-case `simp` or changes to recursion limits. Verify actual pinned Mathlib lemmas and source-native types, and preserve any red evidence.

Only after input bracket: linear spanning for arbitrary skew 9×9, genuine linear extension `ρ` to original paired 48-real skew matrices, and arbitrary bracket preservation (not just generators). Global Spin(9) integration, source Majorana/Fock action, gauge covariance and BFSS physical results remain open. Keep prior V8J/V8L/V8O/V8R/V8S/V8U red runs as negative knowledge, frozen FCP, accepted Lean source blobs, `main` and mathcommunity upstream unchanged. No upstream PR without owner authorization.

This document is a strict acceptance record, not another Lean theorem.
