# TD-C1A R4 P0/P1 — focused operator-interface feasibility contract

**Date:** November 13, 2026 Pacific. **Status:** preregistered feasibility probe, NOT TD-C1A acceptance. **Branch:** integration/bfss-unified-research-20261108.

## Evidence and corrected checkpoint

R1 #43536957727, R2 #43539398734 and R3 #43541591975 remain RED/UNQUALIFIED. R3 tested ffb2e6b9f5e305d99a09ebedfaa7ec1864626a68; its artifact #14092038960 and SHA-256 e22edbecb253e554691738b362277ca0c80869c5f4fa5f1d693c986a1d51fe5a remain authoritative. The original source, consumer and full strict workflow are unchanged.

Checkpoint correction commit 7c9b4f29f0e64841ae3948e789cb15c2fa315f58 fixes the top-level strict_tested_sha, which still named R1 while strict_run_id named R3. Administrative run #43546237886 is GREEN at that exact correction commit. Earlier architecture-record run #43543543429 is GREEN at a1ed444e8bd903f2dda6338e80f9b95b55cd1c27. Neither administrative GREEN proves a mathematical result.

## Focused source review

- Accepted OP3C6C source blob 2d6f777568b0026737112ff8256e5ed50fc9e6e6 proves all-vector equality by Pi.basisFun at an operator-valued codomain.
- Accepted C48C1A1d0 source blob 4d418ade58f8c3c1d998f623f5a5697723cb3d29 supplies the actual G4E/S1J pointwise axis theorem.
- Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, Mathlib/Algebra/Module/LinearMap/Defs.lean, defines LinearMap.mulLeft and mulRight using mul_smul_comm and smul_mul_assoc. They already supply the real scalar compatibility that R1-R3 repeatedly rebuilt after Fock evaluation.
- Pinned ContinuousLinearMap/Basic.lean supplies composition multiplication, mul_apply_eq_comp and the scalar algebra instance on complex continuous endomorphisms.
- Edition 0.7 Chapter 9 at b603f4c1715e15f5f92c69d7fb071992dbaa9f40 was consulted. Its label commutation and conditional physical symmetry discussion do not fill the missing source gauge-unitary theorem.

**Substantive change:** prove the basis extension for an arbitrary real algebra A before instantiating A with original Fock operators. Let L=(LinearMap.mulLeft ℝ U).comp Γ and R=(LinearMap.mulRight ℝ U).comp (Γ.comp C). Their linearity is supplied by Mathlib and never requires a vector-valued Fock scalar calculation. Extend axis equality abstractly, then instantiate with the genuine G4E U, sourceGammaRealLinear and literal S1J matrix. Only at the last step evaluate on ψ.

## Preregistered feasibility experiment

**ID:** E-TD-C1A-R4-P0P1. **Hypothesis:** abstract multiplication-map basis extension and a single direct native axis operator bridge compile under existing Lean limits without unfolding the original finite gamma sum or constructing Source48Vector-to-Fermion real-linear L/R maps.

1. P0: compile lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/TDC1AR4OperatorBasisExtensionInterface.lean before loading original Fock modules. One abstract theorem root, operator_covariance_of_basis.
2. Compile the frozen accepted original C48C1A1d0 prerequisite. This is the unavoidable cold dependency cost, separate from testing the new proof.
3. P1: compile lean/diagnostics/BFSSTDC1AR4NativeOperatorInterfaceProbe.lean. Audit three roots: original_axis_operator, original_allVector_operator, original_allVector_pointwise.
4. Give P0 and P1 at most 120 seconds each after their dependencies, with no new maxRecDepth or maxHeartbeats settings. Reject all errors, sorryAx, unexpected root sets, nonstandard axioms or unapproved warnings. Allowed axioms remain propext, Classical.choice and Quot.sound.
5. Preserve tested SHA, probe sources, exact source pins, separate P0/predecessor/P1 logs and artifact on every outcome. A failure must identify the stage before any repair.
6. The original failed TD-C1A source, original independent consumer and original strict workflow are frozen by hash in this separate probe. No old RED is overwritten, no original strict run is dispatched by the new files.

**Workflow:** .github/workflows/bfss-td-c1a-r4-operator-interface-probe.yml. The full R4 strict theorem run remains unstaged.

**Controls:** exact Lean 4.34.1 and Mathlib pins; original source axis theorem; literal original real48, Fermion 2, G4E, S1J and gamma; original TD-C1A source/consumer/workflow immutable. No F13/F18B/F18C import is admitted.

**Falsifiers:** P0 multiplication/typeclass/basis interface fails; native G4E continuous operator coercion fails; native axis bridge still recurses; native source label transport fails; final evaluation fails; timeout, pin drift or root/axiom audit failure. A compiler failure makes this implementation inconclusive and requires its own first-causal ledger; it does not falsify the mathematical covariance statement.

## Decision and qualification boundary

If P0/P1 are GREEN, record INTERFACE_FEASIBLE_ONLY. Then prepare a separately reviewed R4 change to the original theorem source, preserving its theorem statement and original independent consumer, and require its full strict source/consumer/axiom GREEN before TD-C1A acceptance. If RED, preserve raw first-causal evidence and do not start a cosmetic full strict retry or raise recursion limits.

P3-M5BF0 remains accepted. P3-AUX-G0B2 remains accepted; G0B3 remains the separate proposed original physicalSpace-preservation gate. F13/F18B/F18C historical qualification audit remains open; source presence and prospective comments do not qualify them. TD-C1B genuine gauge fixedness, Spin9 Fock-vector implementation, original Hamiltonian covariance and auxiliary spectral results remain separate obligations.

No ground state, gap, new unification or NFC result is claimed.
