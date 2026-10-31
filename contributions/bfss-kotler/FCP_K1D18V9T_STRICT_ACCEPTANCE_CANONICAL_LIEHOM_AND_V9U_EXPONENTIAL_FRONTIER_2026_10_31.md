# K1D18V9T — strict acceptance of canonical LieHom transport; V9U analytic frontier

Date: 2026-10-31 UTC
Accepted branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Qualified V9T commit: `4d4a148ec9ecc797cab0c828157b788dd02f498e`
V9T exact source blob: `2b350ed73e1f831532d1200f1a0ab148ee53dacf`
V9S prior accepted source blob: `ee038db09af741bdd1af4b811d8daf79bb70ed37`
Strict evidence: [Run #41227650721](https://github.com/etblink/math/actions/runs/41227650721) — **PASS**.

## Qualified result and evidence

Two V9T declarations were freshly compiled under `leanprover/lean4:v4.34.1` and pinned Mathlib revision `d13f23b723b8a846827a245b89c10fc7d3f11612`:

1. `coordinateToPairedCanonicalSkewLieHom` — a genuine `LieHom` between the canonical real skew-adjoint matrix Lie subalgebras with exact `SpaceIndex` input and original `Source48Label` target, obtained by transporting the accepted V9R map through V9S carrier equalities.
2. `coordinateToPairedCanonicalSkewLieHom_map_lie` — concrete bracket compatibility over these canonical Mathlib carriers.

The independent audit reconstructed the exact bracket theorem and checked the declaration-level axioms for each result, exactly `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. Full CI source/hash preflight, warning-as-error compilation, ancestor build, independent audit and artifact preservation passed. CI artifact: `bfss-v9t-original-mathlib-canonical-skew-liehom-4d4a148ec9ecc797cab0c828157b788dd02f498e-1`, id `13052218742`, digest `sha256:5347ce2e2f7ab9e087e8a953692f0295f200e2dc46c865fe22733eb33a385836`.

This is *canonical type transport* of a previously established algebraic homomorphism, not independent evidence of a new representation or a continuous group homomorphism. Treat its value as interface readiness and formal reproducibility, not as a new physical result.

## Pinned-library next dependency: exponential

The exact pinned `Mathlib/Analysis/Normed/Algebra/MatrixExponential.lean` provides `Matrix.exp_transpose` and `Matrix.exp_neg`. These make a directly testable analytic statement: the matrix exponential of any real skew matrix in the original 48-label basis has transpose equal to its inverse, including matrices obtained by the accepted canonical V9T map and the original normalized plane generators.

**Next bounded experiment: V9U**, strict and unqualified until independently compiled. It tests three concrete theorems (generic source-label skew exponential, V9T homomorphism image exponential, original normalized paired generator exponential). This is an orthogonal matrix-flow identity, not a proof of determinant-one orientation, `Spin(9) → SO(48)` integration, a source-exact `Spin(48)` group lift, or any Fock/physical operator theorem.

## Remaining integration obligations

1. Provide an actual topological/smooth source `Spin(9)` group and source-exact differentiable identification of its `GroupLieAlgebra` with the nine-dimensional skew matrices; the accepted `LieHom` is not automatically this differential.
2. Establish a globally well-defined, continuous `Spin(9) → SO(48)` homomorphism with exact normalized infinitesimal generators; local matrix exponentials by themselves are insufficient to establish global factorization or path independence.
3. Construct and verify the actual continuous lift into the original `Spin(48)`, its central signs and basis orientation, and covering properties. The algebraic Clifford group in pinned Mathlib does not automatically supply the needed topological covering.
4. Keep gauge/color covariance, Fock Hilbert-space implementation, domain, spectral existence and scientific interpretations as separate, open questions.

The research branch remains separate from main, frozen FCP, and upstream mathcommunity. Do not raise Lean limits or introduce unstated axioms; preserve first red failures as diagnostic evidence.
