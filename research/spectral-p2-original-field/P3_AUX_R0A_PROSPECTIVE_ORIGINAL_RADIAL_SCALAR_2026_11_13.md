# P3-AUX-R0A — prospective scalar weight microgate (not full R0)

**Date:** 2026-11-13 Pacific. **Status:** STAGED FOR STRICT CI; UNQUALIFIED.
**Last qualified result:** M5BF0 [#43498649514](https://github.com/etblink/math/actions/runs/43498649514). M5BG0 not staged.

## Proposed source-exact result

On the literal original `Boson 2` configuration space, define the scalar
`w_epsilon(x)=sqrt(||x||^2+epsilon^2)` for real `epsilon>0`.
Five proposed source declarations prove the squared-weight identity,
strict positivity, `epsilon <= w_epsilon`, reciprocal bound
`1/w_epsilon <= 1/epsilon`, and cancellation of the complex scalar
weight against its inverse. The native output carrier is explicitly
`PiLp 2 (fun _ : SpinIndex => FullL2 2)`.

**What this does not prove:** There is as yet NO new multiplier
`W_epsilon` on that output Hilbert space, NO bounded reciprocal
continuous linear map, NO weighted charge partial operator or closure,
NO physical-domain density theorem, and NO auxiliary Hamiltonian or
spectral gap claim. This is the smallest source-typed scalar obligation,
not promotion of the full R0 contract.

## Qualification discipline

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxR0AOriginalRadialScalar.lean`
- Independent consumer: `lean/diagnostics/BFSSP3AuxR0AOriginalRadialScalarIndependentConsumer.lean`
- Strict workflow: `.github/workflows/bfss-p3-aux-r0a-original-radial-scalar-strict.yml`
- Frozen prior accepted original `Core.lean` blob: `9882359ced78b0a3bd7e2f057974bd0a031b3e60`
- Lean: 4.34.1; Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`
- New roots under review: five, as printed in source and independent consumer.
- This memo does not count as a GREEN receipt. On RED: diagnose first causal error without weakening the target. On GREEN: verify exact tested commit, consumer and permitted axioms; then add immutable accepted receipt and keep original M5BF0 qualification separately recorded.

Next phase (not yet implemented): a *genuine* coordinatewise `L²` multiplier and bounded reciprocal on the exact original sixteen-component `PiLp` output, followed by `S_epsilon=M_w T` and the density bridge from the original invariant `SmoothCore`.

See [source-exact research contract](P3_AUXILIARY_RADIAL_CHARGE_RESEARCH_CONTRACT_2026_11_13.md).
