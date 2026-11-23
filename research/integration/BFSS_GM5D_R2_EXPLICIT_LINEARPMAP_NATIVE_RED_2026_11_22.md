# GM5D R2 — explicit LinearPMap interface native RED (2026-11-22)

**Status:** R2 unqualified. R3 may be tested only as a bounded *source-exact* repair, not promoted by this record.

- [Original strict run #45104975857](https://github.com/etblink/math/actions/runs/45104975857), **failure**, attempt 1. Exact tested SHA: `2a4425ec1505cc59708cd70b671cdb4e7d748579`. Exact native job: `137464055960`.
- Pinned original dependency preflight **PASS**; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration **PASS**. Original source build **RED** at 9131/9131 jobs; independent consumer not reached.
- **First-causal native diagnostic:** `BFSSGM5DOriginalFixedRadiusGradientLimit.lean:70:8`, `failed to synthesize instance of type class FunLike (↥G.physicalSpace →ₗ.[ℂ] PiLp 2 ...) ↥(originalMinimalPhysicalHilbertChargeColumn M G).domain ?m.78`. The unqualified `exact map_sub (originalMinimalPhysicalHilbertChargeColumn M G) ...` elaborated using the generic `map_sub` interface rather than the original `LinearPMap` method.
- The previous R1 closed-Sobolev-graph type error did **not** recur. `coordinateDirection`, `sourceCoreGradient_norm_sq`, `fixedRadiusCoreGradient_sq_le` printed only `[propext, Classical.choice, Quot.sound]`. The final `fixedRadiusNativeGraph_gradientLimit` printed `[propext, sorryAx, Classical.choice, Quot.sound]` due to the blocked native proof. It is **not qualified**.
- Original provider [artifact #14787867184](https://github.com/etblink/math/actions/runs/45104975857/artifacts/14787867184), 17,148 bytes, original provider digest `sha256:3bed9c80c2ac5e1b8cd6f778d510d1b7b7a8166a6ab5ef4593d27b54a4a7244d`. Its ZIP was **not independently downloaded and CRC-verified** in this memo.
- Source R2 candidate blob `af4e57e7ae0bc7ddbfdf2fc9d4e044eb92179cf3`.

## R3 bounded response to the two-RED stop rule

Rather than rewrite the theorem or increase resource limits, inspect the exact **pinned Mathlib** `Mathlib/LinearAlgebra/LinearPMap.lean`: its namespace `LinearPMap` defines
`map_sub (f : E →ₛₗ.[σ] F) (x y : f.domain)`.
The accepted original GM5B `closedChargeCoreInput M G f` and `... g` are exactly inhabitants of that native `LinearPMap.domain` subtype.

Apply **one precise correction**: replace `exact map_sub (originalMinimalPhysicalHilbertChargeColumn M G)` by `exact LinearPMap.map_sub (originalMinimalPhysicalHilbertChargeColumn M G)`. No theorem statement, input/output carrier, consumer, source dependency, workflow, source pin, or elaboration budget changes. Re-run strict CI exactly once to test this explicit interface; if it is RED again, stop and reassess the proof structure before further writes.

Do not treat R1 or R2 as mathematical disproof; do not call R3 accepted before native build, independent consumer and artifact integrity verification.
