# Project Lead — V9A Gate 4 ACCEPTED: source-native matrix-unit evaluation of typed real 9-to-48 LinearMap

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T07:41:22Z. **Disposition:** `ACCEPTED_ONE_EXACT_MATRIX_UNIT_EVALUATION_ROOT__COORDINATE_GENERATOR_AGREEMENT_OPEN`.

## Strict qualification

- [V9A strict Gate 4 #41180942751](https://github.com/etblink/math/actions/runs/41180942751), attempt **1**, **completed/success** on exact tested SHA **`b2ff2e2c5767a3b4d97ec996343928defba01552`**, job **`124478037075`** completed/success.
- Qualified Lean file `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LinearMapMatrixUnitEvaluationProbe.lean`, exact Git source blob **`480a43155cb709cb549a19513ad99183a203afe4`**.
- Exact original Fock-paired 48-real gamma and label pins, native 9-index input, accepted V8Z typed LinearMap and all ancestor hashes, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: preflight and restore **PASS**.
- Accepted V8Z ancestor compiled **PASS**; `Build completed successfully (8976 jobs)` refers to build workload, **not** mathematical theorem roots.
- Fresh V9A source compilation with `-DwarningAsError=true`, checked `.olean` file, source declaration `#print axioms`: **PASS**.
- Fresh independent imported Lean theorem-type example, `#check` and `#print axioms` **PASS**, terminal marker **`K1D18V9A_NATIVE_MATRIX_UNIT_EVALUATION_AXIOMS_PASS`**.
- Allowed and actual axiom dependencies only **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, `sorry`, `admit`, custom axioms, disabled linter, or raised proof limits.
- [Preserved compiler and axiom artifact #13035316701](https://github.com/etblink/math/actions/runs/41180942751/artifacts/13035316701), `bfss-v9a-original-paired-linear-map-matrix-unit-evaluation-b2ff2e2c5767a3b4d97ec996343928defba01552-1`, ZIP SHA256 **`3747b39d2aca6678735de61cc73d7c9d5523352f72949b58851ba1f21631e8ca`**, size **970 bytes**.

## Exactly qualified root and mathematical boundary

`FCP.BFSSPairedSpin9Plane.coordinateToPairedLinearMap_matrixUnit (r s : SpaceIndex)`:
```lean
coordinateToPairedLinearMap
  (Matrix.single r s (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ) =
  (1 / 2 : ℝ) • normalizedPairedPlane r s
```
This is a theorem on all spatial pairs including r=s. It is **not** yet the full generator evaluation, which additionally requires the exact source-native identity `F_rs=E_rs-E_sr` and normalized output antisymmetry `H_sr=-H_rs`. Note that the input carrier is `SpaceIndex` (9) and output carrier `Source48Label` (original Fock-paired 48), without color-major reindexing.

**V8A–V8Z 51 accepted roots; V9A +1 = 52 accepted exact source algebraic theorem roots.**

## Four-stage negative knowledge

1. [V9A Gate 1 RED #41179406622](https://github.com/etblink/math/actions/runs/41179406622): source proof stuck at nested real matrix-unit selector sum and unused `Finset.sum_ite_eq'`, `sorryAx`; artifact `13034825741`, digest `aa4c0fe2cf0f3aeb85d7723c01602244e7c6a3d01e671276b1ede296f068bc39`.
2. [V9A Gate 2 RED #41180215128](https://github.com/etblink/math/actions/runs/41180215128): script preflight expected removed proof-shape `sum_ite`; no Lean compilation or artifact. This was synchronization/configuration failure, not mathematical contradiction.
3. [V9A Gate 3 RED #41180290050](https://github.com/etblink/math/actions/runs/41180290050): source proof mathematically closed and axiom-clean, but `Matrix.single_apply` three unused simp arguments rejected; artifact `13035075927`, digest `ffd89a082fda224c4b4608c4dea770f26ad4f67828b130a31acaadfc79d8d834`.
4. **V9A Gate 4 accepted** with exactly three unnecessary simp arguments removed; exact `Finset.sum_eq_single` selector proof and strict pin checks retained. Prior separate red audits retained: `FCP_K1D18V9A_GATE1_PROOF_RED_GATE2_STALE_PREFLIGHT_RED_GATE3_RECOVERY_2026_10_31.md` and `FCP_K1D18V9A_GATE3_RED_UNUSED_MATRIX_SINGLE_APPLY_GATE4_RECOVERY_2026_10_31.md`.

## Next bounded mathematical test

**V9B**: source-exact `ρ(F_rs)=H_rs` for **all** spatial pairs, with no r≠s assumption. Import accepted V9A matrix-unit evaluation, accepted V8T source input basis identity, and V8O output normalized generator antisymmetry. Prefer typed `map_sub` on accepted V8Z LinearMap, two exact V9A evaluations, `normalizedPairedPlane_swap`, scalar combination `(1/2)+(1/2)=1`. Use one small independent strict gate, no failed source shape checks, no raised limits. Check actual source labels and theorem signatures before constructing workflow.

After generator agreement, separate obligations remain: skew-carrier membership of the full image, spanning of skew 9×9 matrices by `F_rs`, arbitrary bracket preservation and genuine `so(9)→so(48)` Lie algebra homomorphism, global Spin(9) integration, and BFSS physical claims. Matching structure constants alone did not prove a Lie map.

Frozen FCP, accepted source blobs, `main`, mathcommunity upstream unchanged; no upstream PR without owner authorization. The audit is documentary rather than another theorem root.
