# BFSS OP3-C2 — original real Clifford identity and same-order composition gate

**Date:** 2026-11-09
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent:** `83c29d7a51689773ce3cb4a0f55691b4e23c7a0f`
**Status:** OP3-C1 STRICTLY QUALIFIED; OP3-C2 CANDIDATE pending independent cold gate.
**Toolchain:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. OP3-C1 accepted receipt

[Strict run #42688692337](https://github.com/etblink/math/actions/runs/42688692337) concluded **SUCCESS**, attempt 1, on tested commit `83c29d7a51689773ce3cb4a0f55691b4e23c7a0f`, job `129402354083`. GitHub completed the original pinned source and toolchain preflight, cold OP3-B1/C0/C1 build, the independently checked original-carrier consumer and two exact **three-root** axiom audits. The reported axioms for all three source roots and all three consumer roots were only `propext`, `Classical.choice`, `Quot.sound`; the receipt marker is `OP3C1_ORIGINAL_REAL_CLIFFORD_UNIVERSAL_LIFT_INDEPENDENT_STRICT_PASS`. Retained [artifact #13707285618](https://github.com/etblink/math/actions/runs/42688692337/artifacts/13707285618) with GitHub-reported ZIP SHA256 `4c63b733bfdbe59897f3e5c3740db1f482e5e29050f499337d5c897572f6f7c9` (not independently downloaded). It qualifies exactly the real AlgHom family and its original generator covariance; it does **not** qualify a group law or inverse.

## 2. The first missing interface

For the exact original `CliffordAlgebra source48Quadratic` and existing `source9Spin_originalRealCliffordAlgHom`, prove:

1. `source9Spin_originalRealCliffordAlgHom_one`: `Φ(1) = AlgHom.id ℝ C`.
2. `source9Spin_originalRealCliffordAlgHom_mul`: `Φ(g*h) = (Φ g).comp (Φ h)` with the original source group and **same-order** multiplication.

Use the pinned `CliffordAlgebra.hom_ext` to reduce AlgHom equality to generator equality, accepted OP3-C1 covariance, `map_one`/`map_mul` on the exact source `source9SpinOriginalPaired48OrthogonalHom`, and `Matrix.one_mulVec`/`Matrix.mulVec_mulVec`. The latter's orientation is `M.mulVec (N.mulVec v) = (M*N).mulVec v`.

No new model or source conventions. Avoid the twice-red OP3-B2 `IsometryEquiv` wrapper and huge finite-sum unfolding. The new source imports only OP3-C1, and the new consumer imports only OP3-C2. The two new roots are checked against the original typed carrier and inspected source group.

## 3. Acceptance and failure branches

The dedicated workflow `.github/workflows/bfss-op3c2-original-real-clifford-group-law-strict.yml` pins exact parent/new Git blobs, toolchain and root names; executes cold source and independent consumer builds; checks exactly two root axiom reports in each; rejects `sorryAx`, compiler errors and original-source warnings; preserves an audit artifact. Only the permitted foundational axioms may appear.

- **GREEN:** admit exactly the original real Clifford identity and same-order composition. Then separately prove two-sided inverse with `g⁻¹`, package `AlgEquiv`, and only afterward consider the original complex base change and M3I Fock-operator transport.
- **RED:** read the **first causal compiler diagnostic**. If it is a coercion/API boundary, repair only the newly staged proof, keeping its statements unchanged. If deep reduction repeats, stop per interface-first protocol; do not increase recursion/heartbeat budgets or alter accepted parents.

**Never infer** an original Fock-vector Spin(9) unitary lift, continuous star action, central phase, SU(2) gauge compatibility, Hamiltonian-domain equality, coercivity, positive eigenstates, or mass gap from this algebraic group-law gate. The parallel analytical whole-operator fiber bound remains `M=12` and is conditional.

## 4. Reproducibility record

- Parent branch commit: `83c29d7a51689773ce3cb4a0f55691b4e23c7a0f`
- Accepted prerequisite OP3-C0: [#42685719690](https://github.com/etblink/math/actions/runs/42685719690)
- Accepted prerequisite OP3-C1: [#42688692337](https://github.com/etblink/math/actions/runs/42688692337)
- Preserved OP3-B2 HOLD: [#42678500270](https://github.com/etblink/math/actions/runs/42678500270), [#42680558526](https://github.com/etblink/math/actions/runs/42680558526)
- Current status: **candidate until exact source/consumer gate returns terminal success**.

Apply [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md) and [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md).
