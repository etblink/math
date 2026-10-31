# Project Lead — V8T Gate 1 ACCEPTED: exact native so(9) coordinate-to-matrix-unit bridge

**Research local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T05:35:00Z. **Disposition:** `ACCEPTED_ONE_NATIVE_NINE_INDEX_MATRIX_UNIT_BRIDGE_ROOT__MATRIX_UNIT_PRODUCT_AND_LIE_MAP_OPEN`.

## Exact tested SHA, compiler and evidence

- [V8T strict Gate 1 #41172688222](https://github.com/etblink/math/actions/runs/41172688222), attempt **1**, **completed/success**; job **`124453813914`** completed/success. Exact tested commit **`c2d3cb530216755eeabd42c30761614dcd5b948f`**.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinateMatrixUnitBridgeProbe.lean`, exact Git blob **`d80001bbe5052357dbca559232d81cc01c56fb34`**.
- Exact original paired Fock source gamma/labels, native `SpaceIndex`, V8R/V8S accepted ancestors, pinned Lean `leanprover/lean4:v4.34.1`, pinned Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`, Git blob preflight **PASS**.
- Dependency restore **PASS**. V8R/V8S ancestors compiled **PASS**. `Build completed successfully (8969 jobs)` is build workload, **not** root count.
- Fresh exact V8T source `lake env lean -DwarningAsError=true` emitted `.olean` and a declaration-level `#print axioms`, **PASS**.
- Independent fresh Lean import audit with one separately stated theorem-type `example`, one `#check`, one `#print axioms`, terminal marker `K1D18V8T_NATIVE_NINE_INDEX_MATRIX_UNIT_BRIDGE_AXIOMS_PASS`: **PASS**.
- Only `[propext, Classical.choice, Quot.sound]` axioms. No `sorryAx`, `sorry`, `admit`, new axioms, proof-limit increases or disabled warning-as-error.
- [Preserved compiler and independent audit artifact #13032425776](https://github.com/etblink/math/actions/runs/41172688222/artifacts/13032425776), `bfss-v8t-original-paired-coordinate-matrix-unit-bridge-c2d3cb530216755eeabd42c30761614dcd5b948f-1`, zip SHA256 **`07914720ecdd4d711983fed2e3b465b5b092733f7ea139f3bceea046533a215c`**, size 934 bytes.

## Exact accepted theorem and boundary

`FCP.BFSSPairedSpin9Plane.coordinatePlane9_eq_single_sub_single (r s : SpaceIndex)`:
```lean
coordinatePlane9 r s =
  (Matrix.single r s (1 : ℝ) : Matrix SpaceIndex SpaceIndex ℝ) -
    Matrix.single s r (1 : ℝ)
```
This uses **native 9×9 spatial-index matrices**, with both entries given by actual pinned Mathlib `Matrix.single` definitions. The separately accepted output `normalizedPairedPlane r s` is a **48×48** original Fock-paired matrix on `Source48Label=Fin 24×Fin 2`. No hidden basis reindexing or 9-to-48 linear-map coercion is assumed.

## Ledger, next strict research obligation, and negative knowledge

V8A–V8S **42 qualified source-exact roots**; V8T adds **1**: **43 strict roots total**.

**V8U:** prove one general native-index matrix-unit product with the exact Mathlib `Matrix.single_mul_single_same` and `Matrix.single_mul_single_of_ne` theorems at the pinned Mathlib revision, with the correct source `SpaceIndex` typing:
```text
E_rs * E_tu = if s=t then E_ru else 0
```
for all four spatial indices, including equality and inequality cases. Confirm pinned Mathlib signatures before construction. Then, in a separately verified V8V gate, derive `[F_rs,F_tu]=-δ_su F_rt+δ_st F_ru-δ_rt F_su+δ_ru F_st` and compare with the accepted V8R normalized output bracket. Afterward, construct a **genuine typed linear extension** from all skew 9×9 matrices and prove its bracket preservation on arbitrary inputs in a distinct gate. Do **not** infer the full homomorphism from generator commutators alone; a basis-spanning theorem and linear extension must be established.

Preserve prior V8J, V8L, V8O, V8R, V8S red diagnostics separately, and use small typed bridges rather than guessed matrix conversion rules, indiscriminate simp rewrites, or raised limits. No modification to accepted source blobs, frozen FCP, `main`, or mathcommunity upstream; no upstream PR without owner authorization. Global Spin(9) lift, Fock action, topology and BFSS physical claims remain open. This is an immutable documentary acceptance, not another Lean theorem.
