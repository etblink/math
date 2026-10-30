# Project Lead — V8D Gate 1 accepted: source-original paired orientation swap

**Date:** 2026-10-30 UTC. **Disposition:** `ACCEPTED_1_SOURCE_EXACT_ROOT__NO_GLOBAL_SPIN9_ACTION`.

## Strict acceptance

- [V8D Gate 1 #41145356613](https://github.com/etblink/math/actions/runs/41145356613), job **124369052531**, attempt 1; both completed **success**, GitHub run updated **2026-10-30T23:42:59Z**.
- **Exact tested SHA** `eb3ef011b0e20d0517c9b7cfe331dd7493cdffdd`.
- Candidate `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9OrientationSwapProbe.lean`; **exact tested Lean blob** `58cd7bbd6d1314dc684309b0fe4724688d00e59f`.
- Source/toolchain pin preflight, Mathlib restore, accepted V8A ancestors, strict fresh Lean compilation and independent source-exact `example` all passed. `lake build` printed `Build completed successfully (8951 jobs)`; the count is dependency build jobs, not accepted theorem roots.
- Exactly one fresh theorem root printed `'FCP.BFSSPairedSpin9Plane.originalPairedPlane_swap_order' depends on axioms: [propext, Classical.choice, Quot.sound]`. No `sorryAx`; no resource limits were raised.
- Independent Lean audit passed `#check` and the exact proposition `originalPairedPlane s r = -(originalPairedPlane r s)`, tested for `r ≠ s`. The terminal marker was `K1D18V8D_EXACT_ONE_ORIGINAL_SOURCE_DISJOINT_ROOT_AXIOMS_PASS`. **This text marker retained a stale 'DISJOINT' label from the workflow template; it is a label-only mistake, not a proof of a disjoint bracket.** The actual Lean theorem and audit both checked orientation swap, exactly. Future gate templates should correct this descriptive marker; do not revise the accepted original tested artifact.
- [Retained compiler/audit artifact #13020961569](https://github.com/etblink/math/actions/runs/41145356613/artifacts/13020961569), `bfss-v8d-original-paired-orientation-eb3ef011b0e20d0517c9b7cfe331dd7493cdffdd-1`, SHA256 **`2c8ef31419f1d01c58e0113c8d6a13e91490035b0c55f47c4431b74211405a6d`**, size 925 bytes.

## Qualified mathematical scope

```lean
FCP.BFSSPairedSpin9Plane.originalPairedPlane_swap_order
  (r s : SpaceIndex) (hrs : r ≠ s) :
  originalPairedPlane s r = -(originalPairedPlane r s)
```

The matrix is the **actual native paired-label 48 × 48** transported `1 ⊗ₖ (-(gamma r * gamma s))` through the accepted `pairedColorSpinEquiv`. The identity is a sign check arising from original source Clifford anticommutation. No fake color-major label identification. Neither V8D nor its source proves a global Spin(9) group action, Fock operator implementation, or physics.

## Qualified roots and immediate next theorem

- V8A: skewness and squared-negative-identity (2 roots), strict [#41141833097](https://github.com/etblink/math/actions/runs/41141833097).
- V8B: adjacent plane `[K_rs, K_st]=-2K_rt` (1 root), strict [#41143495333](https://github.com/etblink/math/actions/runs/41143495333).
- V8C: disjoint planes `[K_rs, K_tu]=0` (1 root), strict [#41144471425](https://github.com/etblink/math/actions/runs/41144471425).
- V8D: orientation reversal `K_sr=-K_rs` (1 root), strict [#41145356613](https://github.com/etblink/math/actions/runs/41145356613).

**Cumulative V8A–V8D accepted new roots: 5.** Older certified Clifford/Spin48 work remains separate.

**Highest-value next bounded obligation:** derive from accepted V8B and V8D the alternate shared-right-end bracket `[K_rs, K_ts]=+2K_rt` for pairwise distinct `r,s,t`. Require the literal source-original 48-label theorem and strict independent Lean proof/type/axiom gate; do not claim this exhausts the full Lie algebra. Next derive other orientations and then the fully antisymmetric-index so(9) bracket. Preserve all accepted previous sources, FCP, canonical `main`, and upstream.

**Research record only:** acceptance write follows tested SHA and is not itself a new qualified Lean theorem.
