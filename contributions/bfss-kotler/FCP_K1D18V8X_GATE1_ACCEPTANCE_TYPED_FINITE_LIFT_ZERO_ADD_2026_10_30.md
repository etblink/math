# Project Lead — V8X Gate 1 ACCEPTED: typed finite 9-to-48 coefficient candidate, zero and additivity

**Research-local date:** 2026-10-30 PDT; GitHub Actions completed 2026-10-31T06:25:54Z. **Disposition:** `ACCEPTED_TWO_TYPED_FINITE_LIFT_ADDITIVE_ROOTS__REAL_LINEARITY_AND_LIE_HOM_OPEN`.

## Exact immutable qualification

- [V8X Gate 1 #41175933517](https://github.com/etblink/math/actions/runs/41175933517), attempt **1**, terminal **completed/success** on exact tested SHA **`1423740233cef95c84ecbd91d5bff723ddd3d4bd`**, job **`124463376459`** completed/success.
- Qualified Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FiniteCoefficientLiftProbe.lean`, exact Git blob **`b2c44f16a5acfb63d78ff8cc5c59c596fd41be0e`**.
- Exact original 48-real Fock-paired source gamma/label pins, accepted V8R output and V8W input ancestors, Lean `leanprover/lean4:v4.34.1`, Mathlib rev `d13f23b723b8a846827a245b89c10fc7d3f11612` preflight **PASS**. Pinned dependency restoration and ancestor builds **PASS**. The log `Build completed successfully (8973 jobs)` is build workload, **not theorem count**.
- Fresh V8X source `lake env lean -DwarningAsError=true` with source `.olean` and two source `#print axioms` reports **PASS**.
- Fresh independent imported Lean type examples for both declarations, two `#check` and two `#print axioms` reports **PASS**, exact marker **`K1D18V8X_TWO_TYPED_FINITE_COEFFICIENT_ROOTS_AXIOMS_PASS`**.
- Both declarations depend exactly on **`[propext, Classical.choice, Quot.sound]`**; **no `sorryAx`**, additional axiom, `sorry`, `admit`, relaxed linter or raised proof limits.
- [Preserved compiler and independent audit artifact #13033576865](https://github.com/etblink/math/actions/runs/41175933517/artifacts/13033576865), name `bfss-v8x-original-paired-finite-coefficient-lift-1423740233cef95c84ecbd91d5bff723ddd3d4bd-1`, ZIP SHA256 **`48fa1b4cbfac121ec5bd2abc2e1e6b483b370d2aa72399392260611d3b63d802`**, size 969 bytes.

## Qualified declarations, exact source carrier and scope

Definition `coordinateToPairedFiniteLift` has type
```lean
Matrix SpaceIndex SpaceIndex ℝ →
  Matrix Source48Label Source48Label ℝ
```
and value `ρ(A)=(1/2:ℝ) • (∑ r : SpaceIndex, ∑ s : SpaceIndex, (A r s) • normalizedPairedPlane r s)`. Both domains are explicit; `Source48Label = Fin 24 × Fin 2` is the original paired 48-real Fock carrier, with no color-major or guessed source basis reindexing.

1. `coordinateToPairedFiniteLift_zero`: `ρ(0)=0`.
2. `coordinateToPairedFiniteLift_add (A B)`: `ρ(A+B)=ρ(A)+ρ(B)` for **arbitrary input real 9×9 matrices**.

**V8A–V8W: 47 accepted exact-source algebra roots; V8X adds 2 = 49 accepted roots.** This establishes an additive map, not a Lean `LinearMap`, `LieHom`, representation, or group lift.

## Bounded successor obligations

**V8Y**: separately verify scalar homogeneity `ρ(c • A)=c • ρ(A)` for **all `c:ℝ` and arbitrary native input matrices**; use `smul_sum`/`smul_smul`, `Matrix.smul_apply`, and scalar commutativity as needed. Preserve Lean warning-as-error and axiom whitelist, source pins and independent type/audit artifact. Then construct the genuine typed `LinearMap` only after zero/add/scalar proofs; verify `ρ(F_rs)=H_rs` in a distinct exact basis-evaluation gate (the factor `1/2` exists to account for ordered-pair antisymmetry). A final Lie algebra homomorphism requires a proof of bracket preservation on arbitrary skew 9×9 input and appropriate skew 48×48 output, not merely V8R/V8W matching generator structure constants; source-exact skew span/decomposition is still open.

Global Spin(9) integration, original Majorana/Fock action, gauge covariance and BFSS physical results remain separate unproved obligations. Keep frozen FCP, accepted source blobs, `main`, and mathcommunity upstream unchanged; no upstream PR without owner authorization. Preserve V8J/V8L/V8O/V8R/V8S/V8U negative-knowledge records and never conflate build jobs with qualified roots.

This acceptance is documentary, not an additional theorem root.
