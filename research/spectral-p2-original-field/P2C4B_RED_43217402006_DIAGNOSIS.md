# P2-C4B fifth RED #43217402006 — parser obstruction in generic bridge

**Date:** November 12, 2026.
**Exact tested SHA:** `d8ba1d2e1e183921b0eb70ce969b37d1487e57d3` on `integration/bfss-unified-research-20261108`.
**Run:** https://github.com/etblink/math/actions/runs/43217402006
**Job:** `131180027610`. **Artifact:** https://github.com/etblink/math/actions/runs/43217402006/artifacts/13945271136
**Artifact SHA-256:** `d674191620820c976b2999d8f201208c18ce5ecf171a6967bc96393c4f8d4f13`.

## First causal evidence

The exact source-pin preflight and Lean 4.34.1 / Mathlib environment checks passed. The cold source build failed before compiling an independent consumer:

1. Line 72:49: `unexpected token '/--'; expected 'lemma'`. Investigation shows two contiguous `/-! ... -/`-style documentation comments immediately preceding `private theorem algebraData_actualDensity_integrable_of_parts`. The earlier descriptive `/-- The upper/original density...` comment was accidentally retained when inserting the more detailed `/-- A small generic AlgebraData interface ...` comment. This malformed stack of documentation comments triggers the FIRST parser error. No generic-bridge source qualification is therefore established by this run.
2. Line 109:8: `maximum recursion depth has been reached` at application of the generic bridge. Because the generic declaration had already encountered a parser error, this secondary elaboration error cannot safely be interpreted as a failed well-formed generic bridge until the parser issue is corrected.
3. Four original-source theorems (`originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, `originalLinearMoment_integrable`, `originalLowerDensity_integrable`) reported only `[propext, Classical.choice, Quot.sound]`. The incomplete `originalActualDensity_integrable` and dependent `originalMasslessCoreForm_lower` reported `sorryAx`; C4B is RED, unqualified.

## Minimal correction

Delete ONLY the obsolete first `/-- The upper/original density ... -/` comment, leaving the generic declaration, its proof, the complete original theorem statements, four clean source proofs, and independent consumer byte-identical. Update only the exact source Git blob pin in the strict workflow and run a fresh gate. Do not increase recursion limits or change mathematics in reaction to this syntax-masked error.

If the fixed generic source actually compiles yet the concrete specialization fails at source `exact`, the next investigation should isolate specialization into its own separately compiled source theorem or use a generic proof interface with an explicit source binding. Do not claim this step succeeded before a green independent consumer and full axiom report.

## Scientific boundary

Even future strict green C4B would provide only the original massless `SmoothCore 2` lower energy estimate without extra integrability premises; it would not establish high-Spin sectors, physical closed-domain coercivity, compact resolvent, point spectrum, or a mass gap. Keep P3 operator-column research and incidence research isolated from this repair. Do not modify `main` or FCP.
