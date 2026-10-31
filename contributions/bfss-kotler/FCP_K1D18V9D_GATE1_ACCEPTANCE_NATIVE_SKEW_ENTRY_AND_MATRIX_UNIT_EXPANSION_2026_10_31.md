# Project Lead — V9D Gate 1 ACCEPTED: nine-index skew entry and exact finite matrix-unit coefficient expansion

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T08:27:37Z. **Disposition:** `ACCEPTED_TWO_NATIVE_NINE_INDEX_MATRIX_ROOTS__SKEW_COORDINATE_SPANNING_PENDING`.

## Exact strict qualification

- [V9D Gate 1 #41184111523](https://github.com/etblink/math/actions/runs/41184111523), attempt **1**, terminal **completed/success** at exact tested SHA **`e9b77ad48c6c9b147fc1b1470ab601bf5210b8ac`**, job **`124487385153`** completed/success.
- Qualified exact source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9InputSkewMatrixUnitBridgeProbe.lean`, Git blob **`da4020a35b3784a90ce76c03798061993fc6275b`**.
- Original 48-real paired-Fock label and gamma source pins, accepted V9C output skew ancestor and earlier exact source modules, pinned `leanprover/lean4:v4.34.1` and Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, preflight **PASS**. Pinned restore and source-exact ancestor compilation **PASS**. `Build completed successfully (8979 jobs)` is build workload, *not* a count of theorem roots.
- Fresh V9D source compilation `-DwarningAsError=true` and source `#print axioms` for both theorems **PASS**.
- Independent imported type-specialization `example` for each theorem, two `#check`, two `#print axioms` **PASS**, terminal marker **`K1D18V9D_NATIVE_SKEW_ENTRY_AND_MATRIX_UNIT_EXPANSION_AXIOMS_PASS`**.
- Both declaration-level axiom reports depend only on **`[propext, Classical.choice, Quot.sound]`**, no `sorryAx`, `sorry`, `admit`, custom axioms, suppression of warnings or proof-limit increase.
- [Compiler and independent axiom artifact #13036437379](https://github.com/etblink/math/actions/runs/41184111523/artifacts/13036437379), name `bfss-v9d-original-paired-input-skew-matrix-unit-bridge-e9b77ad48c6c9b147fc1b1470ab601bf5210b8ac-1`, ZIP SHA256 **`5a1d57542bbb353f9c548c0cdf52a8ff3155e0aa36366d7cc6e585e92e653a05`**, size 1043 bytes.

## Exact accepted roots and scope

1. `coordinateSkewInput_entry (A : Matrix SpaceIndex SpaceIndex ℝ) (hA : A.transpose=-A) (r s : SpaceIndex)`: `A s r = -(A r s)`. This includes diagonal index coincidences. Source exact 9-index carrier, no imported color-major indexing.
2. `coordinateMatrix9_coefficients_on_units (A : Matrix SpaceIndex SpaceIndex ℝ)`: `A = ∑ r : SpaceIndex, ∑ s : SpaceIndex, (A r s) • (Matrix.single r s (1:ℝ) : Matrix SpaceIndex SpaceIndex ℝ)` for **all** real 9×9 matrices. Uses pinned Mathlib `Matrix.matrix_eq_sum_single A` and source-exact `Matrix.smul_single`.

**V8A–V9C 54 qualified algebraic roots, V9D +2 = 56 qualified roots.** The two independent typed theorem statements were checked on exact pinned compiler and source; commit and blob match job artifacts.

## Next bounded, separate mathematical obligation

**V9E:** For any native 9×9 real matrix `A`, first establish the *full antisymmetric part* as a coordinate-plane sum:
```text
∑ r : SpaceIndex, ∑ s : SpaceIndex,
  (A r s) • coordinatePlane9 r s = A - A.transpose
```
Use accepted V8T `coordinatePlane9_eq_single_sub_single`, V9D `coordinateMatrix9_coefficients_on_units`, `Matrix.transpose_sum`, `Matrix.transpose_smul`, and pinned `Matrix.transpose_single`; avoid introducing skew assumptions prematurely. This is cleaner than proving the half-scaled identity directly.

**V9F, separate:** For `hA : A.transpose=-A`, deduce
```text
A = (1/2:ℝ) • ∑ r : SpaceIndex, ∑ s : SpaceIndex,
    (A r s) • coordinatePlane9 r s
```
via V9E and exact `(1/2)(A-(-A))=A` scalar arithmetic; all nine-dimensional source types explicit. This would produce true spanning evidence.

**Beyond that:** arbitrary Lie bracket preservation on skew inputs via V8W input/V8R paired output 4-index identities, bilinearity, and full skew spanning; a true typed Lie homomorphism, global Spin(9) lift, and BFSS physics remain separate, unproved obligations. No full bracket preservation is inferred from matching generator constants, verified 48-real skew image or map linearity.

Preserve previous negative evidence including V8Y Gates1/2 and V9A Gates1–3. Source hash pin and theorem type are sacred: no changes to accepted source modules, frozen FCP, `main`, or mathcommunity upstream; no upstream PR without owner authorization. This record is documentary, not another theorem root.
