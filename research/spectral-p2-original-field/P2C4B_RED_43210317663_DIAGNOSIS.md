# P2-C4B repeat-red analysis — run #43210317663

**Date:** November 12, 2026 (UTC); **branch:** `integration/bfss-unified-research-20261108`.
**Run:** https://github.com/etblink/math/actions/runs/43210317663
**Job:** 131155939741; **tested commit:** `df594bd109c50e5bc02e01d00c09570d8253766a`.
**Artifact:** https://github.com/etblink/math/actions/runs/43210317663/artifacts/13942555348
**Artifact digest:** SHA-256 `ab81e919c2b122b5e13c8d43ad0780d1886dadaccd97e78c749639caf4030f13`.

## Causal red

The exact source preflight, Lean 4.34.1 / pinned Mathlib environment restore, and original ancestor modules passed. The P2-C4B source failed at line 75, **the explicit `change Integrable ((fun x => V...) + (fun x => B...)) volume` tactic** in `originalActualDensity_integrable`, with `maximum recursion depth has been reached`.

The preceding #43207104792 had failed twice: line 75 `simpa only [originalActualDensity]` recursion, and line 84 a pointwise/function difference mismatch. The bounded rewrite of the **lower** density using `funext x` and local `ring` has now succeeded: `originalLowerDensity_integrable` prints only `propext`, `Classical.choice`, `Quot.sound`. The existing source declarations `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, and `originalLinearMoment_integrable` are likewise clean. The `originalActualDensity_integrable` and dependent `originalMasslessCoreForm_lower` have `sorryAx` from failed elaboration and remain UNQUALIFIED. The consumer never ran.

## Smallest following action

Remove the single **`change` tactic** in the actual-density lemma. Keep its theorem statement and directly apply the already proved pair:

    exact (originalPotentialDensity_integrable f).add
      (originalFermionDensity_integrable f)

The original source `originalActualDensity` is an `abbrev` whose body is exactly the pointwise sum of the very same two densities. The direct `exact` lets kernel definitional reduction check that identity **without first elaborating another enormous explicit target through `change` or running simplifier recursion**.

This is a **candidate Lean repair only** until another actual strict source/consumer job passes. Do not increase maxRecDepth, copy the source Hamiltonian, alter previously clean theorems, change integrability hypotheses, use `sorry`, or bypass axiom audits. If direct exact still fails, stop repeating simplifier tactics: isolate the definitional interface with a standalone small zero-sorry lemma and inspect the failure for typeclass/abbreviation unfolding before further edits.

Update only P2-C4B exact source blob pin in its strict workflow and preserve this immutable red-run diagnosis. No new branch and no changes to main, FCP, P3 research or original qualified C4A.
