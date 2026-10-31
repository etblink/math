# K1D18V9V — strict acceptance of genuine original paired orthogonal-group membership

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
V9V accepted commit: `3c6281324d1610579d13050a6d8aab5e0de44b03`
V9V frozen source hash: `b471ebb2da441c4be099bed168f6fa3651e24a99`
Pinned Lean: `leanprover/lean4:v4.34.1`
Pinned Mathlib SHA: `d13f23b723b8a846827a245b89c10fc7d3f11612`
Accepted strict run: [#41233247073](https://github.com/etblink/math/actions/runs/41233247073) — **GREEN**.
Accepted run job: `124631621436`.
Preserved evidence artifact: `bfss-v9v-original-paired-orthogonal-group-membership-3c6281324d1610579d13050a6d8aab5e0de44b03-1`, id `13054198328`, digest `sha256:1e360baf31182a1e4e440c6bc423924453f7406f61b445e55b02de31d501e49d`.

## Exact accepted statements

Fresh source compilation with `-DwarningAsError=true`, exact source/hash preflight, pinned toolchain and Mathlib restore, V9U ancestry, independent specialization and `#print axioms` all passed.

1. `pairedSkewExp_mem_orthogonalGroup` proves `exp(t • X)` lies in `Matrix.orthogonalGroup Source48Label ℝ` for arbitrary original paired-Fock skew `X`.
2. `coordinateToPairedCanonicalSkewLieHom_exp_mem_orthogonalGroup` proves orthogonal membership for every exponential of the genuine V9T LieHom image.
3. `normalizedPairedPlane_exp_mem_orthogonalGroup` proves membership for every original normalized paired-Fock plane generator and all real parameters.

Each declaration reports precisely the permitted `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx`. In pinned Mathlib, `Matrix.orthogonalGroup` is the actual submonoid/group of transpose-orthogonal matrices, not a surrogate set predicate.

## Preserved negative knowledge

Original red [#41232312032](https://github.com/etblink/math/actions/runs/41232312032) failed in fresh compilation after all source/ancestry preflight checks passed. All three proposed theorem bodies called `Matrix.mul_nonsing_inv hdet`, omitting the explicit matrix argument. Actual Lean error expected a matrix but received `hdet : IsUnit (exp ...).det` of sort `Prop`, and `sorryAx` appeared in failed declarations. Corrective commit `3c6281324d1610579d13050a6d8aab5e0de44b03` added only the inferred matrix first parameter, `Matrix.mul_nonsing_inv _ hdet`, to each of the three proof bodies and updated the preflight hash. All mathematical statements and original label types remain unchanged.

## Next exact bounded frontier — V9W experimental

Pinned `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean` exposes `Matrix.exp_add_of_commute (A B) (h : Commute A B)`. Pinned `Mathlib/Algebra/Group/Action/Defs.lean` supports `((Commute.refl X).smul_left s).smul_right t` for scalar multiples of one matrix, and `add_smul` transforms `(s+t) • X` into the sum. This provides a source-exact, testable **one-parameter exponential composition law** `exp ((s+t) • X) = exp(s • X) * exp(t • X)`. Proposed V9W checks five declarations: the original Fock-paired 48-matrix composition law, zero identity, negative parameter inverse, exact V9T LieHom-image specialization, and original normalized paired generator specialization.

This is not a typed `Spin(9) → SO(48)` homomorphism, a global integration theorem, or a source-exact Spin(48) group lift. V9W must pass its own independent strict gate before any qualification.

## Open mathematical frontier

Orthogonal membership alone does not prove `det = 1` or membership in `Matrix.specialOrthogonalGroup`; no global Spin(9) action, Spin(48) lift, covering, gauge covariance, Fock Hilbert operator, or BFSS spectral theorem is established by these Lie-algebra and one-parameter identities. Preserve the exact source ordering and all red evidence. No changes to main, FCP, or mathcommunity upstream.
