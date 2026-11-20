# RHOPF-P9C3D2E1 R1 — missing original-phase namespace RED; R2 bounded recovery

**Date:** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`
**Original R1 strict run:** [#44641382472](https://github.com/etblink/math/actions/runs/44641382472), attempt 1, FAILURE.
**Exact tested commit:** `17a1a1fa2814d4c1b1c75a37cae6263931cc0c66`.
**Original CI job ID:** `135973009925`.
**Original artifact:** [#14586204090](https://github.com/etblink/math/actions/runs/44641382472/artifacts/14586204090), independently downloaded ZIP SHA-256 `8f44c4b430e78086bbd88033ca1818688d95f4ac938a0dc517a398232390d610` matching original GitHub digest. ZIP embedded `exact-tested-commit.txt` matches tested commit, and retains native failed Lean log, accepted original-source dependency build, original integer signed-permutation fixture, and toolchain manifest. Independent consumer log was not produced because its step was skipped.

## Strict failure classification

- Frozen original source hashes, exact import/declaration and section-scope preflight: PASS.
- Pinned Lean `4.34.1` / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted native Gamma9 dependencies and independent integer source fixture: PASS.
- Original **native fixed-point proof RED** at `RHOPFP9C3D2E1OriginalGammaCircleNonzeroFixedPointCriterion.lean:43:12` with `error(lean.unknownIdentifier): Unknown identifier 'relationalCirclePhase'`.
- The accepted `relationalCirclePhase` source definition is in `FCP.RHOPFP9C3A`. The R1 proof imported this definition transitively through accepted source modules but failed to open its namespace before using the unqualified name in the `change` statement.
- The unqualified native theorem axiom report therefore contained `sorryAx`; strict native compilation exited 1. The independent source-typed consumer was SKIPPED, not passed. This is a proof-script identifier scope failure, not evidence against the intended fixed-point result.

## R2 minimal correction

Insert precisely `open FCP.RHOPFP9C3A` in the existing native source file's `open` block. Change **no theorem statement, tactic body, imported source, native source math/physics definition, independent consumer, frozen core/Gamma9/Mathlib pins, CI warning or axiom policy, time limits or accepted predecessor proofs**. Update only the new native source's frozen Git blob SHA in the strict workflow.

The R2 follow-up must pass: exact frozen-source preflight; native warning-as-error original source compilation; independent imported source-typed consumer; both `#print axioms` root reports with at most `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`; and original ZIP digest plus embedded tested SHA integrity. R1 is preserved permanently as a RED and cannot count toward the P9C3D2E1 acceptance.

## Research boundary

The proposed `relationalCircleVector_fixed_point_implies_one` theorem states `Pv=v ∧ v≠0 ∧ rho(z)v=v → z=1`, using accepted original phase-action and real-linear coefficient uniqueness. Until native and independent strict GREEN, this is a candidate, not a proved Lean result. Even after qualification, a formally defined joint-continuous/free circle action on the intrinsic unit sphere of the rank-four original image, a `S³/S¹ ≅ S²` quotient, global Spin(9) covariance, physical BFSS 48-Majorana/24-complex-mode Fock implementer, SU(2) Gauss/Hamiltonian symmetry, topologically protected vortex/hopfion, or Standard Model empirical result remain independent unproved obligations.

Earlier P9C3D2B R1 native double-rewrite RED and P9C3D0 R1/R2/R3 strict interface REDs remain preserved alongside all previous negative observations.
