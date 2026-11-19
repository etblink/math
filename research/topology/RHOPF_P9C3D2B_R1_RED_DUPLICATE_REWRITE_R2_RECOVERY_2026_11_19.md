# RHOPF-P9C3D2B R1 — native source-original projector commutation RED; R2 bounded repair

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original R1 strict run:** [#44629640776](https://github.com/etblink/math/actions/runs/44629640776), attempt 1, FAILURE.
**Exact tested commit:** `8fd45a352d9fc8ee023c8642ba6e23307449be07`.
**Original CI job:** `135932538974`.
**Original artifact:** [#14582610477](https://github.com/etblink/math/actions/runs/44629640776/artifacts/14582610477), independently downloaded ZIP SHA-256 `b80799ec7c1cfa1c2a88746f173df7b664933ab555e1a06584630c01e15f6df9`, matching original GitHub digest; embedded `exact-tested-commit.txt` matches tested SHA.

## Native failure and qualification decision

- Checkout, exact source hashes and declaration contract, Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, signed-permutation original Gamma9 fixture and original dependency build: PASS.
- Original native source warning-as-error Lean compilation: RED at `RHOPFP9C3D2BOriginalGammaCircleProjectorImageInvariance.lean:38:4`, tactic `rewrite` failed because it could not find an occurrence of `relationalCirclePhase`.
- The source script attempted `rw [relationalCirclePhase_eq_complement_sum, relationalCirclePhase_eq_complement_sum]` after changing the goal to `P*R(z)=R(z)*P`. Lean's **first rewrite replaced both occurrences** of `R`, so the second rewrite had no target.
- Both unqualified theorem reports included `sorryAx` as a consequence of the failed native proof. Do NOT promote either theorem. The independent imported consumer was SKIPPED, not passed.
- Original artifact preserves original preflight/source fixture, original dependency build, native failed proof/axiom transcript and exact toolchain SHA manifest. Negative outcome is a genuine Lean proof-script failure, not an infrastructure or physical counterexample.

## R2 minimal source proof repair

Replace precisely:
```lean
  rw [relationalCirclePhase_eq_complement_sum,
    relationalCirclePhase_eq_complement_sum]
```
with
```lean
  rw [relationalCirclePhase_eq_complement_sum]
```

No changes to either original-source theorem statement, the separate vector invariance proof, independently imported type consumer, original Gamma9 matrix source, P/J/Q lemmas, real-spinor carrier, physical Fock/Hamiltonian source, warnings-as-errors, root axiom policy, CI resources or workflow logic. Update only the frozen hash pin of the modified P9C3D2B source in the existing strict workflow. A new exact-tested strict native AND independent consumer GREEN is required for qualification.

## Larger research boundary

This gate checks only `P*rho(z)=rho(z)*P` and invariant real spinor sector `P v=v` under the Circle action. It does not establish action freeness on the unit sphere of the four-dimensional relational image, a (S^3/S^1) Hopf quotient, a full Spin(9)-equivariant action, BFSS Fock implementation, gauge invariance, Hamiltonian symmetry, physical vortex stability or Standard Model observational claims. These require separately verifiable hypotheses and native gates. Preserve the R1 original failing proof and all earlier RED/GREEN qualified evidence.
