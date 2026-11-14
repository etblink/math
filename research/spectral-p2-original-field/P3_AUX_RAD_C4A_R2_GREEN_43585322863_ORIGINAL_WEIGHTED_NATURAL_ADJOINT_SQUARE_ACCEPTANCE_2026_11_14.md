# P3-AUX-RAD-C4A R2 — strict GREEN original weighted natural adjoint square

**Date:** 2026-11-14 Pacific. **Verdict:** LEAN_QUALIFIED, exact original SU2 physical Hilbert source.
[Strict #43585322863](https://github.com/etblink/math/actions/runs/43585322863), attempt 1, completed success at tested `c2ff95769d65b45e002118eac6e12f910866373f`; job `132418458073`.

## Independently checked exact evidence

- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4AOriginalWeightedNaturalAdjointSquare.lean`, blob `3202d27cbe9c27ea2d559cb0a1966c4a6d974920`.
- Unchanged actual paired SU2 consumer `lean/diagnostics/BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquareIndependentConsumer.lean`, blob `820ec0bd4a0255d2564dc05b72bc488b1dabf4d0`.
- Workflow `.github/workflows/bfss-p3-aux-rad-c4a-original-weighted-natural-adjoint-square-strict.yml`, blob `b725fb9350e75b4122b800b3661008c685eab70d`.
- Frozen preflight **212** transitive OAI candidate/donor files against reviewed `5d74a3b5abe74dae4d6ba181ae29f0cb76865414`, pin-manifest SHA256 `79b0adc2188b44158ed9299843477fa8afdc1d3d9a4e7043a49457b36e38f4e9`. Original Core/BB/BC/BD/C3/C3DC pins PASS; Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.
- Cold target build, fresh strict warning-as-error source compile, and independent literal pairedAlgebraData/pairedGaugeData consumer PASS.
- **Six** source root reports and **thirteen** independent consumer reports (six new + five BC/BD generic + accepted weighted closedness and density) checked in exact order; each uses only `[propext, Classical.choice, Quot.sound]`. No sorryAx or forbidden warnings in the accepted source/consumer. Terminal marker `BFSS_P3_AUX_RAD_C4A_ORIGINAL_WEIGHTED_NATURAL_ADJOINT_SQUARE_STRICT_GREEN` confirmed.
- [Artifact #14110173996](https://github.com/etblink/math/actions/runs/43585322863/artifacts/14110173996), 26,239 bytes, published digest `sha256:17c42c25a210522dc81c75dc060de6b49eff0755a5db3355f5d57c73adc96c4b` matches job logs and GitHub metadata; ZIP not independently rehashed. [Administrative #43585322835](https://github.com/etblink/math/actions/runs/43585322835) and binding-checkpoint #43585352808 were previously verified separately GREEN.

## Accepted mathematical scope

For every literal `M:AlgebraData 2`, `G:M.GaugeData`, `ε>0`, with the actual source physical Hilbert input E and original sixteen-FullL2 PiLp output K, let Sε be the accepted weighted physical charge and Aε=naturalComp Sε.adjoint Sε.
The exact six new roots are:
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_domain`
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_selfAdjoint`
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_closed`
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_domain_dense`
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_energy`
- `FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare.originalWeightedPhysicalAdjointSquare_nonneg`

They establish the full two-layer natural Aε domain, genuine self-adjointness, closedness, dense natural domain, exact energy Re⟨Aεu,u⟩=‖Sεu‖², and nonnegativity on that domain.

**Not yet qualified:** the 1/16-normalized weighted operator/full weak-form iff (C4B), zero-pair/kernel equality to the original H, smooth graph-core density, maximal radial multiplication-domain identity, positive-regulator form/domain stability, ε=0 behavior, source-paper equivalence, singlet Hardy gap, eigenstate or BFSS mass gap.

## Retained R1 and method lesson

R1 #43583785009 remains RED at `f7e6db3f05569403c47774655a17aabfaa4c656c`; [first-causal receipt](P3_AUX_RAD_C4A_R1_RED_43583785009_ENERGY_REWRITE_AND_INSTANCE_STYLE_2026_11_14.md) and timestamped diagnostics remain unchanged.
R2 kept all six public statements and the actual consumer fixed. It replaced the last concrete rewrite by explicitly complex-specialized generic theorem composition and changed six proposition-proof letI binders to let. No donor edits, model changes, warning suppression, new axioms or budget escalation.
**Reusable lesson:** use the exact typed generic scalar theorem via proof composition when the rewrite tactic's implicit transparency cannot type-check a semireducible native domain expression.

## Handoff

C4B is the next bounded priority: use accepted Aε and existing BE generic normalization/weak-representative lemmas to define (1/16)Aε on the same natural domain, then qualify the full-domain associated-vector iff. [Prospective C4B evidence receipt](P3_AUX_RAD_C4B_R1_PRE_GATE_NORMALIZED_WEIGHTED_OPERATOR_AND_WEAK_FORM_2026_11_14.md). No original H or accepted C4A source bytes change in this acceptance commit.
