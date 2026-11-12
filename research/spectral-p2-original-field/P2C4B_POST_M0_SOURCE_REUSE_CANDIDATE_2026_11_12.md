# P2-C4B — post-M0 qualified source reuse gate staged

**Date:** 2026-11-12. **Status:** SOURCE CANDIDATE until new strict C4B run is fully GREEN.
**Pre-Gate Receipt:** `P2C4B_PRE_GATE_SOURCE_REUSE_RECEIPT_2026_11_12.md`.
**M0 full GREEN:** run #43242308459 at exact `7eac35443797bd00e9b9574f4199ea64a751c29f`, source blob `68b20c8d6cc0b752ceda20cfd3eb6bdba93c315f`, two consumers and only allowed axioms; [acceptance](P2C4B_M0_GREEN_43242308459_ACCEPTANCE.md).

## One mathematical change

New explicit imports: the *qualified* `BFSSP2C4BOriginalActualDensityInterfaceMicrogate` and the *existing original* `MassiveMoments`, whose public `AlgebraData.bosonic_core_integrable` and `fermion_core_integrable` are valid for arbitrary real h,m (in particular h=1,m=0). Retain the prior two imports.

Replace only the proof BODY of `originalActualDensity_integrable`:

    rw [FCP.BFSSP2C4BOriginalActualDensityInterfaceMicrogate.originalActualDensity_eq_sourceSum]
    exact
      (FCP.BFSSSU2Full.concreteAlgebraData.bosonic_core_integrable 1 0 f).add
        (FCP.BFSSSU2Full.concreteAlgebraData.fermion_core_integrable 1 0 f)

This is not a new generic integrability proof or another attempt to normalize the large concrete `AlgebraData` definition. It uses the exact accepted M0 function equality to expose the original two function densities; then reuses old source-public integrability. Source field names are **fully qualified** at specialization, avoiding private `M` record unfolding.

Original `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, `originalLinearMoment_integrable`, `originalLowerDensity_integrable` proof bodies and the final `originalMasslessCoreForm_lower` proof body are byte-identical. All six public signatures, source M, original `coreForm` (1/16 charges), accepted C4A, independent consumer and its assertions are unchanged. The earlier private generic lemma is temporarily retained unmodified, though no longer needed by the target: removal now would add unrelated proof churn.

Strict C4B workflow retains all older original source pins and adds exact new import paths/sha pins for qualified M0 and original MassiveMoments, with the candidate C4B source pin updated. A single new cold source+independent-consumer/axiom gate, without warning suppression or recursion-budget changes, determines success/failure.

**Failure disposition:** If C4B gate red, inspect FIRST causal error and classify preflight/import, source elaboration, consumer/linter, or axioms before altering any mathematical code. In particular, a source-specific type mismatch after M0 rewrite should be isolated to an explicit typed adapter; do not reopen already qualified density identity or existing generic original integrability proofs.

No new physical spectral theorem is claimed.
