# Project Lead — V8U Gate 2 ACCEPTED: source-native 9-index matrix-unit multiplication

**Research local date:** 2026-10-30 PDT, GitHub Actions completed 2026-10-31T05:54:55Z. **Disposition:** `ACCEPTED_ONE_NATIVE_NINE_INDEX_MATRIX_UNIT_PRODUCT__INPUT_SO9_BRACKET_OPEN`.

## Immutable strict verification record

- [V8U strict Gate 2 #41173866620](https://github.com/etblink/math/actions/runs/41173866620), attempt **1**, **completed/success** on tested SHA **`4e591e61ece4ad99ef7855aa57d0add83613e326`**, job **`124457264670`** completed/success.
- Qualified source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinateMatrixUnitProductProbe.lean`, Git blob **`a84879ae64bf8341b403fccb61f33cbd5628cac8`**.
- Original Fock-paired 48-real source gamma/label pins, native `SpaceIndex`, accepted V8R/V8S/V8T ancestors, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` checked **PASS**.
- Pinned dependencies restored and accepted ancestors compiled **PASS**; `Build completed successfully (8970 jobs)` is a build workload count and must never be reported as number of theorem roots.
- Fresh source Lean compilation with `-DwarningAsError=true`, creation of `.olean`, source declaration-level `#print axioms` **PASS**.
- Fresh independent imported Lean type example, `#check`, and `#print axioms` **PASS**, terminal marker **`K1D18V8U_NATIVE_NINE_INDEX_MATRIX_UNIT_PRODUCT_AXIOMS_PASS`**.
- Axioms only **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, `sorry`, `admit`, new axioms or raised proof limits / disabled lint.
- [Compiler and independent audit artifact #13032158640](https://github.com/etblink/math/actions/runs/41173866620/artifacts/13032158640), name `bfss-v8u-original-paired-coordinate-matrix-unit-product-4e591e61ece4ad99ef7855aa57d0add83613e326-1`, ZIP SHA256 **`fe5f5111dbdf1a97083a47d9ce68bbd025eec952c4d14df8bc8bc62f683c42fe`**, 939 bytes.

## Qualified exact theorem and mathematical boundary

`FCP.BFSSPairedSpin9Plane.coordinateMatrixUnit9_mul (r s t u : SpaceIndex)`:
```lean
(Matrix.single r s (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ) *
  Matrix.single t u (1 : ℝ) =
if s = t then (Matrix.single r u (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ)
else 0
```
This is the exact native 9×9 real matrix-unit multiplication identity `E_rs E_tu = δ_st E_ru` **for all index coincidences**. The accepted V8T input basis theorem `F_rs=E_rs-E_sr` is separate; the V8R output-normalized `H_rs=-(1/2)L_rs` lives on original paired 48-real labels. No basis identification between their carriers has been assumed.

## Red lesson preserved and corrected

Earlier [V8U Gate 1 RED #41173279895](https://github.com/etblink/math/actions/runs/41173279895), exact tested SHA `e4f452173e918571326f7e3c1af902b9bf4c3bec`, source blob `2a82ec57adf73916a4f4a94ec2a3b533098ef167`, artifact `13032536321` digest `sha256:437eb32e5f9e4559c39760bdb67cf8367a6e441d22d4d1c3059b7f94be2d2d2b`: the single matrix-unit product theorem was already axiom-clean, but the strict linter rejected **two unnecessary `simpa`** at lines 30 and 36. Gate 2 uses `simp` in the matching branch, and `simp only [hst, ite_false]` plus `exact hzero` in the mismatching branch; preserves proof strength and strict compiler. Original causal report `FCP_K1D18V8U_GATE1_RED_UNNECESSARY_SIMPA_GATE2_RECOVERY_2026_10_30.md` is retained.

## Next bounded research obligation V8V

Do not rush into an arbitrary 9×9-to-48×48 Lie algebra map. First use V8T and V8U to prove a source-native **typed four-term product expansion** for `coordinatePlane9 r s * coordinatePlane9 t u` in terms of conditional `Matrix.single` entries, all index coincidences. Keep it separate from the full input bracket, which should be V8W and then match V8R's normalized `H` four-index structure signs. Prefer distributivity, `rw [coordinatePlane9_eq_single_sub_single]` and explicit `coordinateMatrixUnit9_mul` rewriters instead of uncontrolled finite-index simplification. Fresh warnings-as-errors and independent theorem-type/axiom gate with exact source SHA required for each step. The input `SpaceIndex` vs original paired output `Source48Label` boundary remains strict.

**Ledger:** V8A–V8T 43 accepted roots + V8U 1 = **44 accepted roots**. The full native input `so(9)` bracket, linear spanning/decomposition of arbitrary skew 9×9 matrices, typed `so(9)→so(48)` Lie homomorphism, global Spin(9) integration, Fock/gauge claims, and BFSS spectra remain **unproved**. Preserve V8J, V8L, V8O, V8R, V8S, V8U red failures as negative knowledge. Frozen FCP, accepted original sources, `main`, and mathcommunity upstream unchanged; no upstream PR without owner authorization.

This document is an immutable acceptance record, not a new mathematical root.
