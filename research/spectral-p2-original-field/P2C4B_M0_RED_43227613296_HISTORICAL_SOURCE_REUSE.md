# P2-C4B historical qualified-source recovery and M0 consumer red
Date: 2026-11-12 Pacific. Strict run: https://github.com/etblink/math/actions/runs/43227613296
Tested commit: af9f06173a2544ff8e708a3ae0ea29985a5b85bf; job 131214772091.
Artifact: https://github.com/etblink/math/actions/runs/43227613296/artifacts/13951020100
Artifact SHA-256: 9520eebd3dc0e2da90ad64be9a6f8f7832e19e444fb7124c198b4131be63af5e.

## Actual first failure and source success
The isolated M0 originalActualDensity_eq_sourceSum theorem compiled in a complete 8988-job cold source build. Its axiom audit printed ONLY propext, Classical.choice, Quot.sound. No sorryAx. The separate consumer failed at line 39 solely due to Lean style linter unnecessarySimpa, promoted to an error under warningAsError. This is a warning-only consumer RED, not a mathematical-source RED. Repair the consumer only by replacing simpa only [Pi.add_apply] using h with simp only [Pi.add_apply] at h; exact h. Keep the source proof and full P2-C4B candidate untouched. M0 is NOT strict-qualified until the consumer passes.

## Previously established ORIGINAL source lemmas overlooked
- MassiveMoments.lean (Git blob 2fd223d0da1a85c3be52bb2b9c68f4f12d10957e) publicly exports AlgebraData.bosonic_core_integrable and AlgebraData.fermion_core_integrable, exactly the original potential and fermionic integral-densities needed for arbitrary original AlgebraData N, h,m and SmoothCore N. Their types are source-exact and are not massive m>0 coercivity results.
- MassiveMoments.massive_core_gradient_moment uses the proven expression (M.bosonic_core_integrable h m f).add (M.fermion_core_integrable h m f), and then simp only [Pi.add_apply] at hint. This is the exact successful sum/function interface that our seven-red C4B cycle overlooked.
- ProfileEnergy.lean (blob 38e610cf0a0ee2168d73481418bf71b299f937d7) coreEnergyDensity_integral separately reuses BOTH public integrability lemmas under integral_add, establishing a second historical consumer.
- DeformedCharge.lean (blob c27c913c44090100f0c714e3eb34e25205f4d2d3) averaged_core_energy also contains local hip/hif proofs but those are NOT exported: use MassiveMoments public declarations rather than transcribing source blocks.
- SpectralMasslessCoreFormIdentity.lean (blob 3a8dd27bb573e62c8f86b79b83e0ab96f391602a) massless_coreForm_energy uses the genuine original normalized massless Hamiltonian coreForm and averaged_core_energy 1 0.
- Qualified P2-C4A originalActualDensity is the literal original sum. The M0 exact full-function equality is now compiled clean but awaits its distinct consumer green.
- The November 8 BFSS_LEAN_PROOF_REUSE_AND_FAILURE_PLAYBOOK and November 10 BFSS_PROJECT_LEAD_EVERGREEN_QUALIFIED_REUSE_LEDGER both instruct source retrieval before new proof creation; the playbook documents previous consumer-only strict warnings (OP2c). These reinforce a controlled consumer repair.
- The FCP repository is historical provenance for the original source/Hamiltonian rather than evidence of an exact same-named actual-density theorem. The current M0 source is the matching interface verified by compilation.

## Next bounded gate AFTER M0 strict green
Keep all six original P2-C4B public statements and already clean four source proof bodies unchanged. Import M0 and replace only originalActualDensity_integrable proof with the candidate:
    rw [originalActualDensity_eq_sourceSum]
    exact (FCP.BFSSSU2Full.concreteAlgebraData.bosonic_core_integrable 1 0 f).add
      (FCP.BFSSSU2Full.concreteAlgebraData.fermion_core_integrable 1 0 f)
Requalify whole P2-C4B with an updated exact source/consumer/ancestor pin manifest and independent consumer. This is not yet Lean-compiled. The original P2-C4B source, consumer, workflow are frozen until M0 green; no broad simplification, no new axioms, no model substitution, no spectral/mass-gap claim. Preserve all seven historical reds.

## Current mutation
Consumer-only linter proof repair, corresponding exact consumer blob in isolated M0 strict workflow, and this research/red ledger. No source theorem change, no main/FCP writes and no branch creation.
