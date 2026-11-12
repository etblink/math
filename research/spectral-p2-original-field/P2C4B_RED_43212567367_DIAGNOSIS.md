# P2-C4B strict third RED — #43212567367

**Date:** 2026-11-12 UTC/Pacific. **Scope:** original source SmoothCore 2 integrability only, no new physics.
**Run:** https://github.com/etblink/math/actions/runs/43212567367
**Job:** 131163620262. **Exact tested commit:** `c1546c59c9eeb04c847f1207fa38461fe6eaad8f`.
**Artifact:** https://github.com/etblink/math/actions/runs/43212567367/artifacts/13943115731 (zip SHA-256 must be read from the run artifact/log if needed; this memo makes no unverified digest assertion).
**Disposition:** RED, not source/consumer qualified. Do not promote downstream theorem or interpret red as counterexample.

## First causal evidence

Exact source/consumer pin preflight PASS, pinned Lean 4.34.1 and Mathlib environment restored, accepted original source ancestors compiled. Cold build of `BFSSP2C4BOriginalSourceIntegrability.lean` then failed at `line 75, column 53`:

    maximum recursion depth has been reached

This was the direct application:
`exact (originalPotentialDensity_integrable f).add (originalFermionDensity_integrable f)`
under target `Integrable (originalActualDensity f) volume`.

The earlier red #43207104792 failed at this SAME target using `simpa only [originalActualDensity]` and at lower-density function subtraction; red #43210317663 again failed on the actual-density target using `change`. Red #43212567367 confirms **three distinct conversion tactics repeatedly trigger deep elaborator definitional equality** at the original concrete `AlgebraData 2` record. This is a common expression-conversion bottleneck, not evidence of missing original integrability.

Four declarations emitted only standard axioms `propext, Classical.choice, Quot.sound` in the failed build: `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, `originalLinearMoment_integrable`, and `originalLowerDensity_integrable`. `originalActualDensity_integrable` and its downstream `originalMasslessCoreForm_lower` inherited `sorryAx` from failed elaboration, so P2-C4B is NOT accepted. Independent consumer was NOT run.

## Bounded formal repair, precisely staged

Follow the preserved research decision in `P3_OP1_TRACE_PAIRING_AND_C4B_FALLBACK_2026_11_12.md`: isolate a SINGLE reusable exact **function equality**, with `funext x` and `rfl`, between `originalActualDensity f` and the original pointwise operator-field density sum. Then `rw [hDensity]` the integrability target *once* and apply `Integrable.add` with its two already-compiled source witnesses. Do not ask the simplifier or the unifier to convert the composite `Integrable` types by deep reduction.

This candidate repair changes ONLY the `originalActualDensity_integrable` proof body. Preserve all six theorem signatures, all four clean proof bodies, original definitions, original P2-C4A integrability premises, consumer, and strict workflow except the candidate source blob pin. The lemma is new inline proof structure, not a substitute density. No `maxRecDepth` or `maxHeartbeats` increase, `sorry`, axiom, or downstream assumption relaxation.

**Stop condition after any further red:** if `funext x; rfl` also exhausts recursion, STOP repetitive direct equivalence attempts. Prefer a source-typed GENERIC `AlgebraData N` integrability aggregation proof at an abstract `M` before specializing to the large original concrete record; use the existing original `averaged_core_energy` generic hip/hif proofs and exact compact-support moments, or isolate the `originalActualDensity` abbreviation's delta unfolding in a separate minimal source consumer. This is a branchless research change only after inspecting the actual first failure.

## Scientific/operational ceiling

Even strict acceptance would establish only unconditional original smooth-core energy lower estimate using source-identical original bosonic potential and fermionic field, not a high Spin(9) reducing sector, closed physical operator, eigenpair or mass gap. Keep P3-OP1 operator trace pairing research separately documented and P2-C4B qualified only after cold source build, independent consumer and strict allowed-axiom audit green. Remain on unified integration, do not touch `main`, FCP, prior accepted source hashes or incidence research branch.
