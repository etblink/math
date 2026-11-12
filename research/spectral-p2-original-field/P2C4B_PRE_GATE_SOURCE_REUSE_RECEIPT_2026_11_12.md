# P2-C4B — completed pre-gate source reuse receipt (retrospective recovery)

**Date:** November 12, 2026. **Project Lead decision:** HOLD new P2-C4B proof edits until M0 strict GREEN; then GO for a single original-source reuse repair.
**Repo/branch:** etblink/math / integration/bfss-unified-research-20261108.
**Audit scope:** actual original BFSS source declarations and historical source notes inspected; not claimed exhaustive over all FCP branches. This receipt documents why the previous seven-red proof loop should not recur.

## Target and exact source identity

Target: FCP.BFSSP2C4BOriginalSourceIntegrability.originalActualDensity_integrable, i.e., Integrable (originalActualDensity f) volume for all literal original SmoothCore 2 states f. Paired target: originalLowerDensity_integrable, then originalMasslessCoreForm_lower for the original 1/16-normalized SU(2) BFSS core form. The four other declarations in the current P2-C4B source compiled with standard allowed axioms in the preceding reds. None of this proves a physical closed-domain coercivity estimate, reducing high Spin(9) sector, eigenpair or mass gap.

## Source search completed, with evidence classifications

| Candidate | Exact inspected evidence | Reuse decision and caveat |
| --- | --- | --- |
| AlgebraData.bosonic_core_integrable | lean/OAI/MathematicalPhysics/BFSS/MassiveMoments.lean, blob 2fd223d0da1a85c3be52bb2b9c68f4f12d10957e | DIRECT SOURCE REUSE. Generic original source h,m,N; no massive m>0 coercivity hypothesis. |
| AlgebraData.fermion_core_integrable | Same MassiveMoments blob | DIRECT SOURCE REUSE. Exact original deformedFermionField inner density. |
| AlgebraData.massive_core_gradient_moment | Same MassiveMoments source, proof body uses Integrable.add and Pi.add_apply | METHOD ONLY for massless m=0. Its coercivity theorem assumes m>0; use only the density-integrability proof pattern. |
| AlgebraData.coreEnergyDensity_integral | lean/OAI/MathematicalPhysics/BFSS/ProfileEnergy.lean, blob 38e610cf0a0ee2168d73481418bf71b299f937d7 | METHOD/SECOND CONSUMER: integral_add reuses the two original MassiveMoments integrability theorems. |
| AlgebraData.averaged_core_energy | lean/OAI/MathematicalPhysics/BFSS/DeformedCharge.lean, blob c27c913c44090100f0c714e3eb34e25205f4d2d3 | METHOD ONLY: its hip/hif are local, not importable declarations; no need to copy them. |
| AlgebraData.massless_coreForm_energy | lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean, blob 3a8dd27bb573e62c8f86b79b83e0ab96f391602a | EXACT ORIGINAL FORM LINK; establishes correspondence of original coreForm to potential and fermion source densities, not an automatic full C4B integrability qualification. |
| originalActualDensity_eq_sourceSum | New M0 source blob 68b20c8d6cc0b752ceda20cfd3eb6bdba93c315f; run #43227613296 at af9f06173a2544ff8e708a3ae0ea29985a5b85bf | SOURCE-COMPILED + CLEAN AXIOMS; consumer-only linter RED; fully unqualified until replacement #43232000116 green. |

Other retrieval layers inspected: November 8 BFSS Lean proof reuse/failure playbook (blob 03b20bb6d753bd95dfd921d2b30146178292a2c0), November 10 evergreen qualified reuse ledger (4a8604acb431247694eb0a34bef1086a66e27af7), historical gate notes and source references. FCP historical original-Hamiltonian provenance was cross-compared at branch/top-level scope; no claim of exhaustive file-by-file FCP search. Default GitHub code search returned no relevant hits across both repositories and is NOT treated as absence evidence. Verified source files via exact repository path/tree instead.

## Negative knowledge / causal red classification

Seven full C4B reds #43207104792, #43210317663, #43212567367, #43214884008, #43217402006, #43219669093, #43222588590 were dominated by concrete SU(2) AlgebraData abbreviation conversion/recursion while assembling the existing density sum (with a separate doc-comment parsing red that obscured the generic proof). Their first errors, commits, logs and receipts are preserved in research/spectral-p2-original-field. Another attempt to vary simpa/change/rfl against the concrete record without new source-interface evidence is **NO GO**.

The first M0 red #43227613296 was different: full 8988-job cold source build + clean allowed axiom audit PASS, independent consumer line 39 raised linter.unnecessarySimpa under strict warnings-as-errors. Only the consumer, its exact workflow source hash pin, and red memo were changed for replacement run #43232000116; original M0 theorem source byte-identical.

## Actual missing interface and bounded plan

The only remaining source-level task identified for the full C4B current target is transporting the existing original potential+fermion Integrable.add witness through the exact P2-C4A originalActualDensity function equality. M0 proves that equality but requires strict consumer qualification before reuse.

After M0 GREEN: import the M0 exact theorem, explicitly rewrite the originalActualDensity integrability goal, directly apply (concreteAlgebraData.bosonic_core_integrable 1 0 f).add (concreteAlgebraData.fermion_core_integrable 1 0 f). Keep originalLowerDensity_integrable and all four clean source proofs and six theorem signatures unchanged. Update only the necessary new M0 import/source blob pins and full C4B workflow contract; distinct consumer must pass with warnings as errors and only propext, Classical.choice, Quot.sound. This is an uncompiled candidate until its own strict GREEN.

If M0 replacement is RED: first locate actual failure layer. If full C4B reuse is RED after M0 GREEN: test only the exact function-add adapter; do not return to huge-record direct conversion, assume M0 qualification extends to C4B, or silently substitute a massive Hamiltonian.

## Project Lead enforcement check

**No new P2-C4B mathematical proof edits until M0 qualified.** This receipt fulfills the new pre-gate evidence checkpoint for the next targeted C4B reuse, and should be consulted at exact commit before any write. Next P3-OP1A trace-pairing gate must complete its own receipt, inspecting B3/T1 original star/trace modules and pinned Mathlib trace theorem before new Lean source is written.
