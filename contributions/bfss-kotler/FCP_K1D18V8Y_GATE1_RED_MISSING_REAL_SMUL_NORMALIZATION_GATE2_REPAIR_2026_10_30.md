# Project Lead — V8Y Gate 1 RED: missing real scalar-smul normalization and unused simplification lemmas

**Research-local date:** 2026-10-30 PDT; GitHub Actions red completed 2026-10-31T06:36:20Z. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`.

## Exact immutable Gate 1 failure

- [V8Y Gate 1 #41176710019](https://github.com/etblink/math/actions/runs/41176710019) **completed/failure**, attempt 1, exact tested commit **`6c85e755421aa65163bdfbbd4df3a9326ea99265`**, job **`124465663013`**.
- Failed source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FiniteCoefficientScalarProbe.lean`, original Git blob **`067ced713f55f8314985174a6c8082eb0b496722`**.
- Original Fock-paired 48-real source gamma/label pins, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, dependency restoration and accepted V8X additive ancestor compilation all passed. Failed at `Fresh compile exact V8Y source with warnings as errors`; independent imported theorem-type/axiom check **SKIPPED**.
- Lean at source **28:44**: **`error: unsolved goals`**, specifically
```text
⊢ ∑ x, ∑ x_1, (c • A x x_1 * (1 / 2)) • normalizedPairedPlane x x_1 =
    ∑ x, ∑ x_1, (c * (A x x_1 * (1 / 2))) • normalizedPairedPlane x x_1
```
- Lean at source **31:23** and **31:38**: strict-linter errors `This simp argument is unused: mul_left_comm` and `This simp argument is unused: mul_assoc`. The attempted second `simp only [mul_comm, mul_left_comm, mul_assoc]` could not finish while `c • A x x_1` remained scalar multiplication of real numbers rather than ordinary multiplication.
- Compiler `#print axioms coordinateToPairedFiniteLift_smul` displayed `[propext, sorryAx, Classical.choice, Quot.sound]`. This is an *unfinished theorem proof*, so no V8Y theorem was qualified by Gate 1; the red is not evidence that the scalar identity is mathematically false.
- [Preserved failure artifact #13033437165](https://github.com/etblink/math/actions/runs/41176710019/artifacts/13033437165), `bfss-v8y-original-paired-finite-coefficient-scalar-6c85e755421aa65163bdfbbd4df3a9326ea99265-1`, ZIP SHA256 **`3065ec37a692061edecce296ff480ebba9254cb60492ea8a298060ee7e2d8096`**, size 786 bytes.

## Minimal bounded repair, strictly pending

The unchanged declaration is
```lean
theorem coordinateToPairedFiniteLift_smul
    (c : ℝ) (A : Matrix SpaceIndex SpaceIndex ℝ) :
    coordinateToPairedFiniteLift (c • A) =
      c • coordinateToPairedFiniteLift A := by
  ...
```

Original proof tried:
```lean
simp only [coordinateToPairedFiniteLift, Matrix.smul_apply,
  Finset.smul_sum, smul_smul]
simp only [mul_comm, mul_left_comm, mul_assoc]
```
Gate 2 candidate replaces both lines with a single explicit source-type-compatible normalization:
```lean
simp only [coordinateToPairedFiniteLift, Matrix.smul_apply,
  Finset.smul_sum, smul_smul, smul_eq_mul, mul_assoc]
```
The **`smul_eq_mul`** rule converts the previously unresolved `c • A r s` (with `A r s : ℝ`) to `c * A r s`; `mul_assoc` then aligns `(c * A r s) * (1/2)` with `c * (A r s * (1/2))` under each finite sum. This directly targets the exact goal, removes unused orientation/commutation simp arguments, and preserves the full theorem statement. It remains a **CI hypothesis until Gate 2 is strict green**.

- Corrected V8Y source Git blob **`bddba726d7daffbfd93c241a8e89aca8946eddeb`**, updated workflow source-pin-only blob **`294b603c8ce70a5d41640ec9c3b2e3d8e90fab25`**.
- Atomic two-file verified fast-forward commit **`1754372131bcaa9c164fb1caa33767d69ba001df`**. Exact parent-to-repair diff confirmed **only V8Y Lean proof and corresponding pinned hash changed**, no accepted ancestors, warning settings or proof limits.
- [V8Y Gate 2 #41177398392](https://github.com/etblink/math/actions/runs/41177398392), exact tested repair SHA, launched. **PENDING**; complete proof compilation with `-DwarningAsError=true`, one exact independent type specialization, `#print axioms` permitted whitelist with **no `sorryAx`**, and retained artifact/digest are required before acceptance.

## Ledger and next mathematical boundary

**V8A–V8X: 49 accepted algebraic roots; V8Y: 0 qualified pending Gate 2.** Accepted V8X proves `ρ(0)=0` and `ρ(A+B)=ρ(A)+ρ(B)` on arbitrary native 9×9 real input matrices into the 48-real original paired Fock output. V8Y is only the missing `ℝ`-scalar law, **not** yet a constructed `LinearMap`, `ρ(F_rs)=H_rs`, skew-carrier preservation or a Lie bracket preserving homomorphism on arbitrary skew matrices. No global Spin(9) or physical BFSS assertion.

Method lesson: normalize **types first** (`smul_eq_mul` for real-on-real scalars), then associate products. Never mask unsolved goals, unused simp, `sorryAx`, or dependently typed conditional rewrite problems by raising proof limits, disabling linters, modifying accepted source modules or declaring success from partial compilation. Frozen FCP, `main`, mathcommunity upstream, and accepted source blobs unchanged. No upstream PR without owner authorization.

This document is a negative-knowledge ledger and repair experiment, **not** a new qualified root.
