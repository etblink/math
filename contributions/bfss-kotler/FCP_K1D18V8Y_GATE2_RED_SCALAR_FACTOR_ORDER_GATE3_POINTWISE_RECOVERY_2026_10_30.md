# Project Lead — V8Y Gate 2 RED: real factor order survives scalar normalization

**Research-local date:** 2026-10-30 PDT; GitHub workflow completed 2026-10-31T06:46:10Z. **Disposition:** `GATE2_RED_PRESERVED__GATE3_PENDING`.

## Immutable failed strict run

- [V8Y Gate 2 #41177398392](https://github.com/etblink/math/actions/runs/41177398392), attempt 1, **completed/failure** on **exact tested SHA `1754372131bcaa9c164fb1caa33767d69ba001df`**, job **`124467679231`**.
- Qualified-source candidate was **NOT accepted**: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FiniteCoefficientScalarProbe.lean` Git blob **`bddba726d7daffbfd93c241a8e89aca8946eddeb`**.
- Exact original paired-Fock 48-real gamma and labels, Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, dependency restore and accepted V8X parent compilation all **PASS**. Failed only at fresh V8Y `lake env lean -DwarningAsError=true` stage. Independent imported theorem-type/axiom audit **SKIPPED**.
- Exact compiler problem `SU2BFSSPairedSpin9FiniteCoefficientScalarProbe.lean:28:44: error: unsolved goals`. Remaining obligation after `simp only [..., smul_eq_mul, mul_assoc]`:
```text
⊢ ∑ x, ∑ x_1, ((1 / 2) * (c * A x x_1)) • normalizedPairedPlane x x_1 =
    ∑ x, ∑ x_1, (c * ((1 / 2) * A x x_1)) • normalizedPairedPlane x x_1
```
The change from Gate 1 converted real `c • A r s` to `c * A r s` as intended. However, `mul_assoc` *alone* cannot commute the coefficient order `1/2 * c` vs `c * 1/2`.
- Source **30:45** strict linter `This simp argument is unused: mul_assoc`. The source of the remaining failure is **factor commutativity with a nested finite sum**, not the underlying theorem being false.
- Unfinished `#print axioms coordinateToPairedFiniteLift_smul` includes **`sorryAx`**; no new V8Y root qualified. Accepted count remains **49** (V8A–V8X).
- [Preserved exact compiler artifact #13034120036](https://github.com/etblink/math/actions/runs/41177398392/artifacts/13034120036), name `bfss-v8y-original-paired-finite-coefficient-scalar-1754372131bcaa9c164fb1caa33767d69ba001df-1`, ZIP SHA256 **`d19d9e2c159806b88e8d769cd60ef836f4d314bf594a538bb537fec48656c978`**, size 786 bytes.

## Gate 3 bounded repair

Gate 3 keeps the **exact same theorem type**:
```lean
coordinateToPairedFiniteLift_smul
    (c : ℝ) (A : Matrix SpaceIndex SpaceIndex ℝ) :
    coordinateToPairedFiniteLift (c • A) =
      c • coordinateToPairedFiniteLift A
```
and the previously useful real coefficient normalization:
```lean
simp only [coordinateToPairedFiniteLift, Matrix.smul_apply,
  Finset.smul_sum, smul_smul, smul_eq_mul]
```
It then uses two explicit native `Finset.sum_congr` obligations and an exact typed real arithmetic witness at each `(r,s)`:
```lean
apply Finset.sum_congr rfl
intro r hr
apply Finset.sum_congr rfl
intro s hs
exact congrArg (fun z : ℝ => z • normalizedPairedPlane r s)
  (show (1 / 2 : ℝ) * (c * A r s) =
    c * ((1 / 2 : ℝ) * A r s) by ring)
```
This neither depends on global commutative simp normalization under nested sums nor alters any source-native matrix basis. The proposed root remains **unqualified pending strict Gate 3**.

- Atomic source/strict-workflow only repair commit: **`947f508ec3fac69293767e2c8f589a8d7c7dc08b`**, fast-forward published after existing post-Gate1 documentary HEAD.
- Corrected source blob **`c37cf40190b965c21da282aba49a37b07907530d`**, strict workflow source-pin-only blob **`bae4805fd55dfa74be93ee8fc5fe67c310f33597`**.
- Exact prior HEAD to repair diff checked: **only V8Y Lean proof** (10 lines inserted, one removed) **and its workflow source SHA** (one-line substitution). No change to original 9-index `SpaceIndex`, original 48-real paired label `Source48Label`, theorem statement, accepted modules, pinned Lean/Mathlib, axioms or strict proof limits.
- [V8Y Gate 3 #41178030849](https://github.com/etblink/math/actions/runs/41178030849), exact tested SHA **`947f508ec3fac69293767e2c8f589a8d7c7dc08b`**, queued at observation. **PENDING** a completed successful job, source compilation with warning-as-error, independent theorem-type `example`, permitted declaration-level `#print axioms` *without `sorryAx`*, and preserved evidence digest.

## Research integrity and follow-on boundary

**Gate 1 RED:** missing `smul_eq_mul` caused a real-scalar/real-multiplication mismatch *and* two unused simps (see `FCP_K1D18V8Y_GATE1_RED_MISSING_REAL_SMUL_NORMALIZATION_GATE2_REPAIR_2026_10_30.md`).
**Gate 2 RED:** the real type conversion worked but factor-order commutativity was still unproved, and `mul_assoc` was a strict-linter failure. The Gate 3 approach follows earlier lessons: normalize source/target types first, prove bounded scalar algebra pointwise, avoid unnecessary `simp` and preserve red evidence.

Only **49** V8A–V8X theorem roots are accepted. V8Y scalar homogeneity, a genuine `ℝ`-linear map, agreement on every `F_rs` generator, an arbitrary input-skew bracket-preserving homomorphism, and global Spin(9) / BFSS physical results are **not** yet qualified. Never infer full Lie-map validity from matched V8R/V8W generator structure constants. Accepted sources, frozen FCP, `main`, and mathcommunity upstream untouched; no upstream PR without owner permission.

This is a red audit and recovery experiment, not a mathematical acceptance.
