# K1D18V10A Gate 2 — strict qualification acceptance (2026-10-31)

**Disposition: ACCEPTED for exactly two Lean source declarations; no Spin(9) group lift.**

## Exact provenance and independent verification

- Green strict gate: [run #41248364643](https://github.com/etblink/math/actions/runs/41248364643), job `124676478224`, attempt 1, **completed success** on commit `22745bf22de4a14f22e329e06ce9fe4a4bb1e727`.
- Qualifying source module: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SpecialOrthogonalExponentialProbe.lean`, exact Git blob `2875f6ad5b6664438897e37a112a3269af6634c0`.
- Pinned toolchain Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; V9Z ancestry rebuilt successfully at its original accepted source SHA.
- Fresh `lake env lean -DwarningAsError=true` source compilation **success**; independent seven? **two** exact typed V10A examples and two `#print axioms` checks **success**.
- Both exact declarations show only `[propext, Classical.choice, Quot.sound]`, with **no `sorryAx`**:
  1. `FCP.BFSSPairedSpin9Plane.pairedSkewExp_det_one`: any real skew matrix `X` on original `Source48Label := Fin 24 × Fin 2` has `det (exp (t • X)) = 1` for each `t : ℝ`.
  2. `FCP.BFSSPairedSpin9Plane.pairedSkewExp_mem_specialOrthogonalGroup`: the same matrix lies in `Matrix.specialOrthogonalGroup Source48Label ℝ`.
- Immutable green artifact: [#13059699881](https://github.com/etblink/math/actions/runs/41248364643/artifacts/13059699881), SHA-256 `bd71dc646b8418e6af0a4deee7a1623d5942b15d860731399341c15b4a7f2a03`, nonexpired at qualification review.
- The failed first attempt is **not overwritten or reclassified**: red [#41247413084](https://github.com/etblink/math/actions/runs/41247413084), commit `2aa27fde073a64b939c7c8932f755c43b5c2edec`, artifact `13060187093`. The immutable local Lean interface corrections are explained in `FCP_K1D18V10A_GATE1_RED_CAUSAL_REVIEW_2026_10_31.md`.

## What changed mathematically

V10A proves a determinant-one bridge from previously strict-qualified skew orthogonality (V9V), real-parameter continuity (V9Y), and exponential identity (V9W), using the **actual pinned** `IsPreconnected.eq_of_sq_eq` continuity-and-sign theorem from `Mathlib/Topology/Algebra/Field.lean`. It does not assert the full general `det(exp A) = exp(trace A)` identity (marked TODO in the pinned `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean`). Exact original Fock-paired labels, source LieHom and quadratic form were preserved.

This proves per-generator orientation in **SO(48)**. It does **not** prove an integrated `Spin(9) → SO(48)` map, a `Spin(48) → SO(48)` topological double covering, a Spin(9) lift through it, Fock CAR group action, SU(2) gauge invariance, or BFSS spectral/eigenstate existence. Those remain **OPEN**.

## Next bounded obligation: V10B

Construct the true continuous monoid homomorphism from `Multiplicative ℝ` to the actual `Matrix.specialOrthogonalGroup Source48Label ℝ`, first for arbitrary skew `X`, then for the normalized original plane and the exact V9T canonical skew LieHom image. Verify original matrix evaluation for each. **V10B is a new candidate**, not part of this V10A acceptance; qualify only after a distinct green strict gate and declaration-level independent audit.

**Preservation:** This record changes no previously qualified Lean sources or workflows and makes no claim about FCP's frozen empirical finding status.
