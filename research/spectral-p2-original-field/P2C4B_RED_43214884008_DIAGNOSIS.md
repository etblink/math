# P2-C4B fourth strict RED — #43214884008

**Date:** 2026-11-12 UTC/Pacific.
**Run:** https://github.com/etblink/math/actions/runs/43214884008
**Failed job:** 131171457295.
**Exact source-tested commit:** `a5dce4275a1abedf656d850bdc0e89bfe5794227`.
**Preserved artifact:** https://github.com/etblink/math/actions/runs/43214884008/artifacts/13943118125
**GitHub-reported artifact SHA-256:** `73b5258b7d984a0401be1dce4bb7597da165312a5a60be600b07eef425f9129d`.
**Disposition:** Strict source red; P2-C4B unqualified; independent consumer not run.

## Causal finding

Source preflight and pinned Lean 4.34.1 / Mathlib environment restored successfully. The source cold build then failed at `BFSSP2C4BOriginalSourceIntegrability.lean:81:4`: `maximum recursion depth has been reached` at the exact `funext x; rfl` step of the proposed original concrete pointwise equality `originalActualDensity f = potentialDensity f + fermionDensity f`. This demonstrates that even a local concrete pointwise definitional-equality comparison can unfold the enormous concrete SU(2) `AlgebraData 2` record deeply enough to exhaust elaboration recursion. It does NOT indicate a mathematical counterexample.

The proof bodies of `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, `originalLinearMoment_integrable` and `originalLowerDensity_integrable` compiled with only the allowed axiom set `[propext, Classical.choice, Quot.sound]`. The two other declarations (`originalActualDensity_integrable` and dependent `originalMasslessCoreForm_lower`) contained elaboration-recovery `sorryAx`; the full module and consumer remain unqualified.

This is the FOURTH source gate failure of C4B. Earlier red runs #43207104792, #43210317663, #43212567367 tried broad `simpa`, `change`, direct `exact`. None worked on the concrete-level sum/abbreviation conversion. Do not repeat these approaches or raise global recursion budgets by default.

## Structural repair following pre-agreed stop rule

Move ONLY the additive-combination conversion to a lemma quantified over a symbolic `A : AlgebraData N`, `h m : ℝ`, `f : SmoothCore N` with explicit hypotheses `Integrable` for its individual original-type potential and fermionic densities. The generic lemma proves integrability of the POINTWISE sum via `hPotential.add hFermion` and `funext x; rfl` while **A remains opaque**. The source-specialized `originalActualDensity_integrable` then applies this generic theorem with `A = FCP.BFSSSU2Full.concreteAlgebraData`, `h=1`, `m=0`, and its two already-compiled exact original-source integrability witnesses.

This is a genuine abstraction boundary (different elaboration terms), not merely a fourth different simplifier tactic. The generic expression is the EXACT original `AlgebraData` energy density: no surrogate field or altered Hamiltonian. The accepted P2-C4A signature and every original P2-C4B public theorem signature remain untouched. Preserve four already-clean proofs verbatim, consumer unchanged, and update only source Git hash in strict workflow. Strict run must still compile all sources/consumer and verify standard axioms before any acceptance.

## Hard stop after new run if red

If an actual C4B generic bridge still recurses when specialized, do NOT cycle back to concrete `rfl` or `simp`. Inspect the exact error location; split generic aggregation into a separate microgate or use the already generic `AlgebraData.averaged_core_energy` proof context, with a source-exact independent consumer. Do not assume this candidate is qualified, substitute an alternative Hamiltonian, or modify main/FCP or the separate incidence branch.

Regardless of formal qualification, the scalar lower bound along commuting valleys is nonconfining and is not physical spectral existence. The P3 operator trace-pairing forward plan remains separate.
