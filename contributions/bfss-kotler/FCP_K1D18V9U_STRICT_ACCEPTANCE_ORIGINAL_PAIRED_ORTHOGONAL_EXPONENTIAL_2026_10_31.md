# K1D18V9U — strict acceptance of the original paired-Fock orthogonal-exponential theorem

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
V9U strict acceptance commit: `99d9ffc3a28bfe91e57a0c06ecdb22cb09a18c72`
V9U original Lean source blob (unchanged throughout correction): `cb27bc0755dc7f64bed51943ae18c24a00cba912`
Pinned Lean: `leanprover/lean4:v4.34.1`
Pinned Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`
Evidence: [Strict Run #41231276382](https://github.com/etblink/math/actions/runs/41231276382) — **SUCCESS**
Evidence artifact: `bfss-v9u-original-mathlib-canonical-skew-liehom-99d9ffc3a28bfe91e57a0c06ecdb22cb09a18c72-1`, id `13053669230`, sha256 `1ca7757f39aa0c7e601750f557271eaa82cb57e324cf55b3d7ecf8d720d22da4`.

## Accepted mathematical statements

Exactly three V9U declarations passed the original frozen-source hash checks, full V9T ancestry build, freshly compiled with `-DwarningAsError=true`, then individually elaborated in a standalone independent audit with exact original fully-qualified 48-label type and exact original real parameters.

- `pairedSkewExp_transpose_eq_inv`: for an arbitrary skew matrix on literal `FCP.BFSSS1V0.Source48Label`, the exponential of `t • X` obeys `(exp (t • X)).transpose = (exp (t • X))⁻¹` for all real t.
- `coordinateToPairedCanonicalSkewLieHom_exp_transpose_eq_inv`: the same matrix identity holds for images of the qualified canonical real LieHom from V9T.
- `normalizedPairedPlane_exp_transpose_eq_inv`: the same holds for the actual normalized original paired-Fock plane generators for all `r,s : SpaceIndex` and real t.

All three declarations reported only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`; independent specialization and compiler/audit outputs preserved.

## Negative knowledge (retain both reds)

- [Run #41228863049](https://github.com/etblink/math/actions/runs/41228863049) — original V9U source compiled; independent audit used an elaboration-sensitive subtype-to-matrix coercion and failed typechecking.
- [Run #41229839938](https://github.com/etblink/math/actions/runs/41229839938) — adding explicit `.val` corrected the subtype projection, but independent audit's unqualified `Source48Label` resolved to a non-source-identity type, and typechecking still failed.
- [Run #41231276382](https://github.com/etblink/math/actions/runs/41231276382) — strict success after both audit type bridges became explicit. The theorem source itself **never changed** across these attempts.

These were validator/type-identity failures, not mathematical counterexamples. Keep the red runs and first-failure reports as negative engineering knowledge.

## Next bounded source-exact V9V experiment (NOT YET QUALIFIED)

Pinned `Mathlib/LinearAlgebra/UnitaryGroup.lean` exposes `Matrix.orthogonalGroup` and `Matrix.mem_orthogonalGroup_iff`, and pinned `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean` exposes `Matrix.isUnit_exp`. Combine those with the accepted V9U transpose-inverse equation and `Matrix.mul_nonsing_inv` to verify **actual orthogonal-group membership**, not just a group-like matrix identity, for (i) arbitrary source-exact skew matrices, (ii) the genuine V9T LieHom images and (iii) the normalized original paired planes. Strict independent source/axiom audit required before acceptance.

Orthogonal membership alone does not establish determinant one, a full continuous homomorphism `Spin(9) → SO(48)`, a Spin(48) lift, a covering map, or any BFSS physical statement. Continue to treat all these as separately unproved. No changes to main, FCP, or upstream mathcommunity.
