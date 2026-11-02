# K1D18V10H F10AV — Gate 5 ACCEPTED: original gamma coordinate LinearMap and skew image

**Date:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Repository:** `etblink/math`  
**Research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Disposition:** `ACCEPTED_EIGHT_SOURCE_GAMMA_MAP_AND_SKEW_IMAGE_ROOTS__BRACKET_PRESERVATION_PENDING`.

## Immutable strict qualification

- [F10AV Gate 5 run #41381629875](https://github.com/etblink/math/actions/runs/41381629875), attempt 1, terminal `completed/success`, exact tested source commit `e646bc5b9d21da7b357fbcb572dc399c519c9600`, job `125073484823`; run interval `2026-11-02T03:10:38Z`–`2026-11-02T03:24:38Z`.
- Candidate Lean source blob: `bc895ed60f03a3e2091ff11ebd0b87e456f4408c` at `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10AVOriginalGammaCoordinateLinearMapSkewImage.lean`.
- Strict workflow blob: `8e74cf59404178203e5e6e628159235f56bc7dad` at `.github/workflows/bfss-kotler-v10h-f10av-original-gamma-coordinate-linear-map-skew-image-strict.yml`.
- Exact Lean toolchain `leanprover/lean4:v4.34.1`; Mathlib pin `d13f23b723b8a846827a245b89c10fc7d3f11612`.

All required workflow stages passed: exact source/ancestry preflight; pinned dependency restore; accepted F10AU exhaustive original-gamma bracket ancestry rebuild; accepted V9F source-native skew-coordinate-plane spanning ancestry rebuild; fresh F10AV `lake env lean -DwarningAsError=true` compile and `.olean` generation; independent import and exact-type elaboration of all eight declarations; and declaration-level axiom audit.

The independent audit emitted marker `V10H_F10AV_EIGHT_ORIGINAL_GAMMA_LINEAR_MAP_SKEW_TYPES_AXIOMS_PASS`. All eight declarations report exactly `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, additional axiom, source warning, or source error. The independent audit's warning/error and `sorryAx` rejection checks passed.

Preserved artifact: [artifact #13113149849](https://github.com/etblink/math/actions/runs/41381629875/artifacts/13113149849), `bfss-v10h-f10av-original-gamma-linear-map-skew-image-e646bc5b9d21da7b357fbcb572dc399c519c9600-1`, 1,177 bytes, ZIP digest `sha256:9b20c44947d4b5e4ecef5783e45aacc4a1374eb9fcd47ce58c2b67d4f65a380e`.

`Build completed successfully (8982 jobs)` is the Lake dependency-build workload, not a theorem-root count. Lake emitted notices that some cached external package repositories had local changes; these were not Lean source warnings/errors and did not affect the successful pinned build. No dependency was modified.

## Exactly qualified declarations

1. `coordinateToOriginalGammaFiniteLift`
2. `coordinateToOriginalGammaLinearMap`
3. `coordinateToOriginalGammaLinearMap_apply`
4. `coordinateToOriginalGammaLinearMap_matrixUnit`
5. `coordinateToOriginalGammaLinearMap_coordinatePlane`
6. `coordinateToOriginalGammaLinearMap_coordinatePlane_transpose`
7. `coordinateToOriginalGammaLinearMap_image_transpose`
8. `coordinateToOriginalGammaLinearMap_image_mem_so`

## Exact mathematical content and scope

The map is defined on the full native real 9×9 matrix carrier by

```text
rho(A) = (1/4) * sum_{r,s : Fin 9} A_rs * (gamma_r * gamma_s).
```

It is a genuine real `LinearMap`. On the native coordinate plane `F_rs = E_rs - E_sr`, it gives zero when `r=s` and `(1/2) * gamma_r * gamma_s` when `r≠s`. Every skew-transpose source matrix is mapped to a skew-transpose original 16×16 gamma matrix, with membership in Mathlib's native `LieAlgebra.Orthogonal.so SpinIndex ℝ`.

This is an internally qualified finite-dimensional linear/skew-image result. It does **not** establish arbitrary bracket preservation, a source `so(9) → so(16)` `LieHom`, global Spin(9) integration, a Spin(48) lift or covering, an original Fock action, gauge/physical-domain compatibility, or BFSS spectral existence.

## Preserved negative evidence

Gate 4 [run #41379566948](https://github.com/etblink/math/actions/runs/41379566948) remains red and immutable. Its unused dependent-if binder was corrected in both the source theorem type and independent workflow restatement as `_hrs`, following the already successful F10AU `_hbd` / `_had` repair pattern. The workflow source pin was updated atomically. No theorem proposition, proof body, coefficient normalization, source generator, accepted ancestor, lint policy, proof limit, or axiom whitelist was weakened.

Earlier F10AV failures remain distinct and preserved in the preflight/publication causal review, Gate 2 compiler review, and Gate 3/Gate 4 review. In particular, validator false negatives, workflow-string serialization defects, Lean tactic/API errors, and strict-linter failures must not be merged into one undifferentiated 'math failure'.

## Next bounded mathematical obligation

Prove generator-pair bracket compatibility for the same source-native map. Reuse the accepted `coordinatePlane9_universal_four_index_bracket`, F10AU's exhaustive original-gamma pair bracket, and F10AV's exact coordinate-plane evaluation. The normalization is forced: each image contributes a factor `1/2`; their commutator contributes `1/4`; F10AU's gamma-pair bracket contributes `2`, leaving `1/2`, which matches the image of the source coordinate-plane bracket. Explicitly handle diagonal pairs and every index-coincidence case.

After generator-pair defect zero, define the raw matrix bracket defect `D(A,B) = rho([A,B]) - [rho(A),rho(B)]`. Reuse the successful typed sequence V9I/V9J (bilinearity), V9K (generator-pair zero), V9L (one coordinate plane against arbitrary skew input), and V9M (arbitrary skew pair), with V9F's exact ordered-pair half-scaled spanning. Adapt types to the original 16-real gamma target; do not copy the 48-real carrier or label ordering.

Only after the arbitrary-skew bracket identity is independently qualified should a genuine typed `LieHom` be built, using explicit source/target skew `LieSubalgebras` and the pinned Mathlib skew-adjoint interface, following V9P/V9R/V9S/V9T. Group integration, covering, Fock, and physical/spectral obligations remain separate.