# P2-C4B M0 second strict red — consumer hypothesis simplified to True

**Date:** 2026-11-12. **Branch:** integration/bfss-unified-research-20261108.
**Run:** https://github.com/etblink/math/actions/runs/43232000116
**Job:** 131229438647. **Exact tested commit:** e605730fe591c24b6ef089f33dd34d890974a9c4.
**Evidence artifact:** https://github.com/etblink/math/actions/runs/43232000116/artifacts/13950423796
**Artifact SHA-256:** 06cdf0b2433c1a511c09c13e16570cb03f844e8644c0191762f32ce02baed184.
**Disposition:** RED strict gate. Source mathematical theorem compiled with clean permitted axioms; only independent consumer rejected; full M0 not qualified and P2-C4B remains unqualified.

## Exact first causal failure

The 8988-job cold source build completed successfully. Source theorem `originalActualDensity_eq_sourceSum` has only [propext, Classical.choice, Quot.sound]. The separate consumer then failed at line 40:

    error: Type mismatch
      h : True
    but is expected to have type
      originalActualDensity f x = V_original(x)*||f x||²
        + inner_R(f x, B_original(x) f x)

The previous M0 red #43227613296 was only linter.unnecessarySimpa on `simpa only [Pi.add_apply] using h`. The attempted consumer-only repair `simp only [Pi.add_apply] at h; exact h` was logically inappropriate: simplification of a reflexive pointwise equality closed the proposition **inside the hypothesis** (yielding `True`) instead of proving the still-unmodified goal. It is a consumer expression-management error, not any issue with M0 source proof, original density or FCP physics.

## Bounded consumer-only correction

Keep the exact source theorem `originalActualDensity_eq_sourceSum` frozen. The pointwise consumer's goal is definitionally the result of applying the proven whole-function equality at `x`. Use the source theorem directly:

    exact congrFun (originalActualDensity_eq_sourceSum f) x

This replaces the two unnecessary local tactic steps and avoids simplification of a hypothesis. The existing whole-function consumer remains unchanged. Do not suppress lint warnings, change strict workflow semantics, expand a large concrete AlgebraData value, alter source field models, introduce axioms/sorries, or raise recursion limits.

**Pre-Gate Evidence Receipt rule:** This is a consumer-only repair under an existing tested mathematical source root, not a proposal for another new source theorem. The November 12 pre-gate receipt already records original MassiveMoments public bosonic_core_integrable and fermion_core_integrable, ProfileEnergy.coreEnergyDensity_integral and the M0 exact source-equality route; consult it before future C4B mathematical edits.

If new strict M0 succeeds, preserve exact green run/commit/source/consumer/digest acceptance; only then modify P2-C4B's integrability theorem to reuse M0 plus old MassiveMoments declarations under a separately pinned independent gate. If another M0 consumer red persists, inspect the precise elaborated goal before another edit, rather than repeating simplifier tactics.

No original physical closed-Hamiltonian reduction, Spin9 oscillator exclusion, positive eigenpair or mass gap follows from M0 or C4B alone.
