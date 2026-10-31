# Project Lead — V8Z Gate 1 ACCEPTED: genuine typed real nine-to-forty-eight LinearMap

**Research-local date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T07:05:37Z. **Disposition:** `ACCEPTED_ONE_TYPED_LINEAR_MAP_EVALUATION_ROOT__GENERATOR_AGREEMENT_PENDING`.

## Exact immutable qualification

- [V8Z strict Gate 1 #41178646430](https://github.com/etblink/math/actions/runs/41178646430), attempt **1**, terminal **completed/success** at exact tested SHA **`1134c2e5f148f6856b7b932cbd3d3701b1c5c9dc`**, job **`124471322646`** completed/success.
- Qualified Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9TypedLinearMapProbe.lean`, Git source blob **`3d83bef542ac264faf11506d2484fd656017b8cf`**.
- Exact original paired-Fock 48-real gamma/label sources pinned, native input `SpaceIndex`, accepted V8X/V8Y source and Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: preflight **PASS**. Pinned dependency restore and source-exact accepted ancestors compiled **PASS**. `Build completed successfully (8975 jobs)` is build workload, **not** accepted proof count.
- Fresh V8Z source compiled `-DwarningAsError=true`, source `.olean` and declaration-level `#print axioms` **PASS**.
- Independent new Lean import `#check` of the *actual* `Matrix SpaceIndex SpaceIndex ℝ →ₗ[ℝ] Matrix Source48Label Source48Label ℝ` type; independently stated theorem-type `example`, `#check` and `#print axioms` **PASS**. Terminal marker `K1D18V8Z_TYPED_LINEAR_MAP_APPLY_AXIOMS_PASS`.
- Exact axiom dependencies `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, `sorry`, `admit`, custom axiom, bypassed linter or raised proof limit.
- [Preserved exact compiler/type/axiom artifact #13034177180](https://github.com/etblink/math/actions/runs/41178646430/artifacts/13034177180), name `bfss-v8z-original-paired-typed-linear-map-1134c2e5f148f6856b7b932cbd3d3701b1c5c9dc-1`, ZIP SHA256 **`d3adafeeeaa2108ce219fcafd451e3014a76e28778061953da2cd2a06979903a`**, 980 bytes.

## Exact accepted declaration, carrier and boundary

```lean
noncomputable def coordinateToPairedLinearMap :
    Matrix SpaceIndex SpaceIndex ℝ →ₗ[ℝ]
      Matrix Source48Label Source48Label ℝ where
  toFun := coordinateToPairedFiniteLift
  map_add' := coordinateToPairedFiniteLift_add
  map_smul' := coordinateToPairedFiniteLift_smul
```
The typed field construction uses **already accepted** V8X/V8Y proofs. Accepted theorem `coordinateToPairedLinearMap_apply` asserts `coordinateToPairedLinearMap A = coordinateToPairedFiniteLift A` for arbitrary input real 9×9 matrices and output original paired 48-real matrices. The definition itself is not counted separately as another theorem root.

**Root ledger:** V8A–V8Y **50** qualified algebraic theorem roots; V8Z adds **one** exact theorem = **51**. The actual map type was independently checked.

This is an ℝ-linear map on **all 9×9 matrices**, not a typed `so(9)` Lie algebra homomorphism and not even a proof that the output is always skew symmetric. The accepted V8R and V8W brackets have matching structure constants on generators but are still in *different source-native carrier types*.

## Bounded next obligations

**V9A:** prove source-exact matrix-unit evaluation `coordinateToPairedLinearMap (Matrix.single r s (1:ℝ)) = (1/2) • normalizedPairedPlane r s` via `Matrix.single_apply` and nested finite sums at the original `SpaceIndex` type. Keep the 1/2 factor and source-native paired output order exact, even in diagonal cases. Confirm the pinned Mathlib matrix-unit and finite-sum selector lemmas before using them; do not mask type coercions. Then **V9B**: combine V9A and accepted `F_rs=E_rs-E_sr`, `H_sr=-H_rs` to prove `ρ(F_rs)=H_rs` for all indices, including r=s.

Only after generator agreement, define the genuine skew subspaces, prove 9×9 skew spanning or antisymmetric basis decomposition, and verify arbitrary Lie bracket preservation on that source-exact skew carrier; global Spin(9) integration and BFSS physical claims remain separate open obligations. Preserve all V8Y Gate1/2 reds and Gate3 green evidence, prior V8J/V8L/V8O/V8R/V8S/V8U negative knowledge. Frozen FCP, accepted sources, `main`, and mathcommunity upstream unchanged; no upstream PR without owner authorization.

This is an immutable strict acceptance audit, not a new theorem.
