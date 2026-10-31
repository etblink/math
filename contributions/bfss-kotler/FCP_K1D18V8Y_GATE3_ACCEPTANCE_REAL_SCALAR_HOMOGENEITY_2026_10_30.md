# Project Lead — V8Y Gate 3 ACCEPTED: real scalar homogeneity of native finite 9-to-48 coefficient lift

**Research-local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T06:55:35Z. **Disposition:** `ACCEPTED_ONE_REAL_SCALAR_HOMOGENEITY_ROOT__TYPED_LINEAR_MAP_NEXT`.

## Exact tested SHA, compiler, and immutable evidence

- [V8Y strict Gate 3 #41178030849](https://github.com/etblink/math/actions/runs/41178030849), attempt **1**, terminal **completed/success** on exact tested commit **`947f508ec3fac69293767e2c8f589a8d7c7dc08b`**, job **`124469536953`** completed/success.
- Qualified exact source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FiniteCoefficientScalarProbe.lean`, Git blob **`c37cf40190b965c21da282aba49a37b07907530d`**.
- Original 48-real paired Fock source gamma/labels, accepted V8X source ancestor, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned in source preflight **PASS**. Dependency restore and exact accepted V8X builds **PASS**. `Build completed successfully (8974 jobs)` is the *build workload*, not a count of proof roots.
- Fresh warnings-as-errors `lake env lean -DwarningAsError=true`, emitted source `.olean`, and source declaration-level `#print axioms` **PASS**.
- Independent imported Lean audit with exact theorem-type `example`, `#check`, independent `#print axioms` **PASS**; marker **`K1D18V8Y_REAL_SCALAR_HOMOGENEITY_AXIOMS_PASS`**.
- Only **`[propext, Classical.choice, Quot.sound]`** dependencies. **No `sorryAx`**, `sorry`, `admit`, custom axiom, disabled linter, or proof-limit increase.
- [Preserved compiler and axiom artifact #13034315746](https://github.com/etblink/math/actions/runs/41178030849/artifacts/13034315746), `bfss-v8y-original-paired-finite-coefficient-scalar-947f508ec3fac69293767e2c8f589a8d7c7dc08b-1`, ZIP SHA256 **`cc5c1c692a4a866f4928555bc778769375422dc37d9783b0a4c15dbf1d295cd6`**, 951 bytes.

## Exact accepted theorem, scope, and root ledger

`FCP.BFSSPairedSpin9Plane.coordinateToPairedFiniteLift_smul (c : ℝ) (A : Matrix SpaceIndex SpaceIndex ℝ)`:
```lean
coordinateToPairedFiniteLift (c • A) =
  c • coordinateToPairedFiniteLift A
```
This holds for arbitrary real 9×9 input matrices and outputs in original Fock-paired real 48×48 matrices, without guessed reindexing.

V8X accepted `coordinateToPairedFiniteLift_zero` and `coordinateToPairedFiniteLift_add`. V8Y now accepts real `coordinateToPairedFiniteLift_smul`. Therefore `ρ` is proven zero/additive/real-homogeneous as a *function*; constructing a typed `LinearMap` is still the next separate Lean objective. Source-native `SpaceIndex` and original output `Source48Label=Fin 24 × Fin 2` are intentionally distinct carriers.

**V8A–V8X 49 qualified algebraic proof roots; V8Y +1 = 50 source-exact qualified roots.**

## Negative knowledge preserved precisely

- [V8Y Gate 1 RED #41176710019](https://github.com/etblink/math/actions/runs/41176710019) exact tested SHA `6c85e755421aa65163bdfbbd4df3a9326ea99265`, source blob `067ced713f55f8314985174a6c8082eb0b496722`, artifact `13033437165`, ZIP SHA256 `3065ec37a692061edecce296ff480ebba9254cb60492ea8a298060ee7e2d8096`: unsolved real `c • A r s` vs `c * A r s`, two unused `simp` arguments, `sorryAx`.
- [V8Y Gate 2 RED #41177398392](https://github.com/etblink/math/actions/runs/41177398392) exact tested SHA `1754372131bcaa9c164fb1caa33767d69ba001df`, source blob `bddba726d7daffbfd93c241a8e89aca8946eddeb`, artifact `13034120036`, ZIP SHA256 `d19d9e2c159806b88e8d769cd60ef836f4d314bf594a538bb537fec48656c978`: `smul_eq_mul` normalized coefficient type, but residual `1/2 * (c*a)` versus `c * (1/2*a)` remained, `mul_assoc` unused, `sorryAx`.
- Gate 3 explicitly uses nested `Finset.sum_congr` and `congrArg` with pointwise `by ring` for the exact source-native real scalar, instead of an uncontrolled global simplifier under finite sums. Red postmortems remain in separate `FCP_K1D18V8Y_GATE1_RED_MISSING_REAL_SMUL_NORMALIZATION_GATE2_REPAIR_2026_10_30.md` and `FCP_K1D18V8Y_GATE2_RED_SCALAR_FACTOR_ORDER_GATE3_POINTWISE_RECOVERY_2026_10_30.md`.

## Strict successor obligations

**V8Z:** introduce a *genuine typed* `LinearMap ℝ (Matrix SpaceIndex SpaceIndex ℝ) (Matrix Source48Label Source48Label ℝ)` using the 3 accepted field proofs `coordinateToPairedFiniteLift_zero/add/smul`; validate its application equals `coordinateToPairedFiniteLift A` and its typed linearity in a new independent strict gate. Avoid treating a constructor as a newly accepted theorem root without its exact Lean theorem checks.

After V8Z, separately prove `ρ(coordinatePlane9 r s)=normalizedPairedPlane r s` on **every original spatial label** with the necessary 1/2 ordered-pair factor. Then restrict to source-native 9×9 skew carrier and original paired 48×48 skew output, and establish bracket preservation on *arbitrary* skew inputs. Identical generator structure constants alone do not establish a full Lie algebra homomorphism. Global Spin(9) integration, original Fock/gauge action and BFSS physical claims remain open.

Frozen FCP, main, mathcommunity upstream and all accepted ancestor Lean source hashes unchanged. No upstream PR without owner authorization. Negative results remain evidence, not defects to conceal. This is an immutable acceptance record, not another Lean theorem.
