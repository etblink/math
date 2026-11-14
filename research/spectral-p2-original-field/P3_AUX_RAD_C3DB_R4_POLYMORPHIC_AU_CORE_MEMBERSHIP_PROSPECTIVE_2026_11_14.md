# P3-AUX-RAD-C3D-B R4 — original polymorphic AU core witness prospective

**Date:** 2026-11-14 Pacific. **Status:** STAGED_UNQUALIFIED_PENDING_STRICT_CI. **Parent:** `9b290d4997f3d2b662f5ac4423f8caac387eaf58`.

**One-variable test:** Replace private helper binder `(M : AlgebraData 2)` with `{N : ℕ} (M : AlgebraData N)`, leaving its conclusion and original `exact ⟨f,rfl⟩` intact, just as H5E8AZ proves with generic N. Main source `originalWeightedChargeCoreGraph_mem` and its original sixteen-charge target remain **exactly N=2**. No change to accepted original fields, SU2 gauge, physical input, output Hilbert equivalence or exact four public theorem types.

R1 RED #43573922855 had unresolved imported identifier plus WHNF; R2 RED #43575336639 had core witness `whnf` in the main theorem; R3 RED #43576822333 moved witness into a private theorem but still had `whnf` at line 58. [R3 evidence receipt](P3_AUX_RAD_C3DB_R3_RED_43576822333_GENERIC_DIMENSION_DISCOVERY_2026_11_14.md). Difference now is **symbolic N** rather than merely a new declaration. This is informed by the source H5E8AZ donor, not a speculative heartbeat increase.

**Qualification contract:** Original Core/G4J/AU/AY/AZ/C2B/C3/C3DA pins, Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; independent concrete original paired SU2 consumer blob `f85bddd055a5e6b34a95833749a3e3f900e8029f`, workflow blob `60fce3dbc09aecf1d4b45f86e37033c5cc075e04`, four exact public declarations, axiom allowlist `[propext, Classical.choice, Quot.sound]`. No new workflow; changing the source triggers strict push qualification. Until green, nothing new about weighted graph/domain/density is qualified.
