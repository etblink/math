# P2-C4B sixth RED — #43219669093: generic result, concrete interface

**Date:** 2026-11-12. **Run:** https://github.com/etblink/math/actions/runs/43219669093
**Job:** 131187670206. **Tested commit:** `d788d4d129f8b4654da81f6cbd1342f02350548e`.
**Artifact:** https://github.com/etblink/math/actions/runs/43219669093/artifacts/13944773772
**GitHub-reported zip SHA-256:** `1b7ed9dae8c4c63a3d4d683f3252e93f196b5fb2209b199f644fd2ca1bf4b973`.
**Status:** RED, NOT source/consumer/axiom qualified.

## First causal error

Preflight and pinned toolchain restored. The first and only source compiler error was
`BFSSP2C4BOriginalSourceIntegrability.lean:107:8: maximum recursion depth has been reached`, at

    exact algebraData_actualDensity_integrable_of_parts M 1 0 f
      (originalPotentialDensity_integrable f)
      (originalFermionDensity_integrable f)

The generic private lemma parsed and was accepted without a reported error; the failure arose at the point of *specializing* its type against `Integrable (originalActualDensity f)`. The first four source integrability theorems continued to print only `[propext, Classical.choice, Quot.sound]`. `originalActualDensity_integrable` and downstream `originalMasslessCoreForm_lower` printed `sorryAx` because they were not elaborated. The independent consumer did NOT run.

Prior C4B reds #43207104792, #43210317663, #43212567367, #43214884008, #43217402006 and this run preserve distinct failure evidence. No paper or scientific theorem is promoted based on them.

## Bounded next interface repair

Keep the generic lemma, all six public theorem signatures and the four proven source lemmas byte-identical. Use a typed intermediate proof `hIntegrated` with the exact abstract/concrete field notation `M.deformedBosonicPotential 1 0` and `M.deformedFermionField 1 0`, so invoking the generic lemma no longer requires unification against the original C4A abbreviation. Then prove a **single pointwise function equality** `originalActualDensity f = (fun x => M.potential ... + inner ...)` using `funext x; change [identical symbolic expressions]; rfl`. This mirrors the actual source `originalLowerDensity_integrable` proof which has compiled clean, and avoids converting the full `Integrable` type or using broad simplification. Rewrite the original density once and apply hIntegrated.

This is a candidate microrepair, **not verified until strict source, independent consumer and axiom audit pass**. No global recursion/heartbeat limit increase, no surrogate Hamiltonian or alternate Fock operator, and no weakening of hypotheses. Consumer stays unchanged.

If a subsequent run still fails at a local pointwise conversion, stop further tactic variants. Isolate this one density abbreviation in a dedicated microgate with an explicit *fully qualified concrete field* equality, checking one interface at a time; alternatively rebuild the generic original `AlgebraData` integral identity with the precise original source field and replace the abbreviation on the downstream side only after an independent proof. Do not hide the burden by redefining the accepted P2-C4A density.

The physics ceiling is unchanged: source smooth-core integrated lower form only; no original closed physical reducing sector, high-Spin whole-sector exclusion or eigenpair.
