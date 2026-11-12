# P2-C0 strict-green qualification — Actions run #43169341680

**Date:** 2026-11-11 Pacific / 2026-11-12 UTC. **Disposition:** accepted original concrete Pauli/potential **source-and-independent-consumer qualification**, **NOT** physical-spectrum acceptance or unified branch integration.

- [Strict run #43169341680](https://github.com/etblink/math/actions/runs/43169341680)
- **Exact tested commit:** 9b3fd2eceebcf0aae07274956082f8db73aeb62a.
- **Job ID:** 131018692564; job source-and-independent-consumer, completed SUCCESS.
- [Uploaded evidence artifact](https://github.com/etblink/math/actions/runs/43169341680/artifacts/13921184695), name bfss-p2c0-original-pauli-9b3fd2eceebcf0aae07274956082f8db73aeb62a-1.
- **Original mathematical source blob:** 3a2aa136e97bb907ac0d36a7b1559523f42c4d14, lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSP2C0OriginalPauliPotentialBinding.lean.
- **Independent consumer blob:** 30c6ce85f2d073ec02bff54477c01ab9e0c9fc59, lean/diagnostics/BFSSP2C0OriginalPauliPotentialConsumer.lean.
- **Exact accepted workflow blob:** 4dc74687c1e9655bd3614465ca95f7e4511130d0, .github/workflows/bfss-p2c0-original-pauli-strict.yml.
- **Environment:** leanprover/lean4:v4.34.1; Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.

## Independently observed evidence

1. Verified live GitHub run API returns conclusion success at the exact expected tested SHA on the dedicated P2 branch; no manual re-run of a different commit was substituted.
2. All workflow steps completed successfully: checkout, ten exact source/environment blob preflight, Lean/Mathlib restoration, cold source compilation, strict independent-consumer elaboration, final axiom/log guard, artifact upload.
3. Job log records **Build completed successfully (8971 jobs)**, with the new source module the final compiled job.
4. Both originalPauli_structureConstant and originalPauli_masslessPotential_eq_wedge print exactly the standard allowed axioms propext, Classical.choice, Quot.sound. The final independent log audit emitted BFSS_P2C0_ORIGINAL_PAULI_STRICT_GREEN.
5. Harmless Lake dependency local-change warnings were recognized by a narrow anchored pattern. The guard still rejects other warnings, Lean errors, and sorryAx; the source compilation completed with -DwarningAsError=true in the explicit audit step.
6. The finite color-orientation checks and the original bosonic potential nonnegativity consumer compiled successfully; the consumer imports the source module and does not reproduce the source theorem proofs.

## Failure provenance retained, not discarded

- Original run #43167118082 RED: actual original source cold-built and printed allowed axioms; independent consumer failed to elaborate numeral instances OfNat(ColorIndex 2) 0/1/2. This was corrected using explicit (n : Fin 3) source-definitional indices. Read P2C0_RED_43167118082_DIAGNOSIS.md.
- Interim run #43169237761 CANCELLED automatically after the final anchored dependency-warning regex correction.
- Final run #43169341680 SUCCESS; exact source theorem body unchanged across all three runs. The repair affected the independent consumer and strict audit workflow, not the mathematical theorem.

## Exact scientific ceiling

Strictly qualified **only**:

    source.concreteAlgebraData.structureConstant a b c
      = sqrt(2) * epsilon3 a b c,

and the source-concrete original massless bosonic potential identity

    V_original(X) = sum_(spatial pairs j<k) ||colorVector_j cross colorVector_k||².

These are the literal original Pauli-color and bosonic potential formulas in the tested source. **No** newly qualified original fermionic-field bound, signed theta coefficient theorem, high-Spin vector reducing sector, operator closed-form transfer, eigenpair, compact-resolvent result, mass gap, or GUT/ToE claim follows.

## Promotion recommendation (not an actual write)

After auditing the full research branch diff and confirming zero behind unified, recommend a **non-force compare-and-swap fast-forward** to the latest documentary acceptance checkpoint after new explicit owner authorization. The commits after the tested SHA add or revise research documentation ONLY; the tested source, consumer, workflows and all pinned mathematical inputs retain identical Git blob hashes. Preserve the research branch and the independent incidence pilot. After the accepted fast-forward, **continue new C2 and physical source work directly on unified integration**, without creating another routine research branch.

The existing strict P2-C0 workflow only watches the dedicated historical P2 branch; future direct-unified mathematical gates need their own properly scoped strict workflows. No changes to FCP tested history, main or historical evidence.
