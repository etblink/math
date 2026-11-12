# P3-D5B2 strictly accepted; D5B3 finite source-Fock L² isometry pre-gate

**Date:** 2026-11-12 Pacific. **Branch:** `integration/bfss-unified-research-20261108`.

## D5B2 acceptance

- [Run #43318784891](https://github.com/etblink/math/actions/runs/43318784891), attempt 1, completed GREEN; exact source SHA `367a8272bae2afe94f732d12f60728832b732a56`.
- 73 pinned source/consumer Git blobs; Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold build 9180 jobs and independent consumer passed; allowed axioms only [propext, Classical.choice, Quot.sound].
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B2OriginalFockL2InnerSum.lean` blob `b7af3d8784eea4dbe55f105aba96f4d34d2494f5` and consumer `lean/diagnostics/BFSSP3D5B2OriginalFockL2InnerSumIndependentConsumer.lean` blob `56c79eea8448c83aca9b6a7f8d0701444accc668`.
- Preserved evidence artifact 13990901889, sha256:0ef89121aa20b16aec0316af6775f5950d84176385fa1457fb5f2ccd60fb79c9.
- Accepted `originalFockL2_inner_eq_sum_columns` identifies full L² complex Hilbert pairing with finite sum of the source-exact `Fermion 2` column L² pairings, with an independent `Boson 2` Lebesgue-base consumer.

## D5B3 narrowly bounded candidate

- Define a complex-linear map from `Lp (PiLp 2 (fun _ : ι => Fermion 2)) 2 μ` into `PiLp 2 (fun _ : ι => Lp (Fermion 2) 2 μ)`, by `LinearMap.pi` of D5B0 accepted continuous projections and the reverse `WithLp.linearEquiv` on the *target*.
- Prove each component is the accepted D5B0 projection and full cross-pairing is preserved via B2 and pinned `PiLp.inner_apply`.
- Apply pinned Mathlib `LinearMap.isometryOfInner` to construct an actual `→ₗᵢ[ℂ]` preserving the finite-Hilbert L² norm.
- Independent consumer: source exact evaluation, cross-inner product, norm preservation, injectivity, and original `Boson 2` specialization.
- Carry all 73 prior source/consumer pins byte-identically, add exactly two D5B3 candidate blobs to reach **75 pins**. The workflow explicitly cold builds D5B3 rather than a copied predecessor, and audits all declaration axioms and consumer warnings.
- **Not proved:** surjectivity onto all families of Fock-valued L² columns, a complete `≃ₗᵢ` onto, a Hilbert–Schmidt norm replacing the original operator norm, gauge-physical fixed-space equivariance, source-Hamiltonian graph/domain, or eigenpair existence.

**Follow-up after strict green:** analyze finite coordinate assembly/surjectivity via D5B0 `memLp_piLp_iff` and pinned `Lp` representative APIs. Do not bundle this with original source gauge/closed operators. Keep the independent quadratic-observable / Grok-derived threefold sector research as a separate exploratory track; no promotion to a physical-generation theorem.
