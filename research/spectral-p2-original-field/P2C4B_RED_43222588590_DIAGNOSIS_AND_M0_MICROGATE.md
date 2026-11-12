# P2-C4B seventh RED — isolate exact original actual-density abbreviation microgate

**Date:** 2026-11-12 Pacific/UTC. **Status:** RED; full P2-C4B NOT QUALIFIED.
**Tested run:** https://github.com/etblink/math/actions/runs/43222588590
**Job:** 131197586155; **exact tested commit:** `3d1026eb819ae1ce4cbcedac3de0ab775f005d73`.
**Evidence artifact:** https://github.com/etblink/math/actions/runs/43222588590/artifacts/13947126631; SHA-256 `4b92a356a28a891e45faef34019f11e9f048a32a282eeb70a2f468ae4e1eaf5d`.

## First causal compiler error

`BFSSP2C4BOriginalSourceIntegrability.lean:119:4: maximum recursion depth has been reached` at `change` within the local `hDensity : originalActualDensity f = (fun x => M.deformedBosonicPotential 1 0 x * ‖f x‖² + inner ℝ ...)` in `originalActualDensity_integrable`. The typed generic integrability witness `hIntegrated` preceded this, and the abstract `AlgebraData` lemma was parsed and compiled. The failure is a large-record concrete source abbreviation conversion, NOT evidence of a counterexample to actual-density integrability.

The first four public integrability declarations `originalPotentialDensity_integrable`, `originalFermionDensity_integrable`, `originalLinearMoment_integrable`, and `originalLowerDensity_integrable` emit only the allowed axioms `propext, Classical.choice, Quot.sound`. The still-failed `originalActualDensity_integrable` and `originalMasslessCoreForm_lower` are contaminated by elaboration-recovery `sorryAx`. The independent consumer did not compile; no C4B qualification.

## Governance stop and isolated new gate

Seven consecutive C4B source reds (#43207104792, #43210317663, #43212567367, #43214884008, #43217402006, #43219669093, #43222588590) have been documented. Stop changing the six-declaration C4B source and its pinned strict workflow for the next test. Preserve all four clean source proofs, exact six public theorem signatures and the previously accepted C4A theorem/hypotheses. No recursion-limit escalation.

Create a **separately compiled** P2-C4B-M0 microgate that imports only the qualified P2-C4A module, not the failing P2-C4B source:

- Source `BFSSP2C4BOriginalActualDensityInterfaceMicrogate.lean`, with one goal: `originalActualDensity f = (fun x => concreteAlgebraData.deformedBosonicPotential 1 0 x * ‖f x‖²) + (fun x => inner ℝ (f x) (concreteAlgebraData.deformedFermionField 1 0 x (f x)))`.
- All source field names on RHS are **fully qualified** `FCP.BFSSSU2Full.concreteAlgebraData`, exactly matching the qualified P2-C4A abbreviation, no private M alias.
- Proof `funext x; simp only [originalActualDensity, Pi.add_apply]` unfolds ONLY the named original density and pointwise function addition, NOT the large concrete algebra structure. This is a candidate, **not prevalidated in Lean**.
- Independent consumer checks both the whole-function equality and a pointwise instance, on the original SmoothCore 2 and Boson 2 types; it imports the microgate, not unqualified C4B.
- Separate strict workflow `bfss-p2c4b-density-interface-strict.yml` has exact source/consumer Git blob hashes, the inherited original/qualified source and toolchain pins, cold source build, warnings as errors, independent consumer, only the standard axiom set, and evidence artifact.

**Qualification discipline:** only a fully green microgate qualifies that one equality. If green, apply it later to C4B's already typed generic sum witness, with an additional exact function-add bridge if needed. It does not by itself qualify C4B. If red, inspect the exact first causal error and consider keeping fully qualified projection expressions opaque; do not automatically cycle back to `rfl/change/simpa` concrete record reduction.

**Physics ceiling:** no new original-Hamiltonian form/domain, high Spin(9) type, eigenpair, mass gap, GUT or ToE claim. P3 star-trace/gauge-projection research remains independent. No new branch, no modifications to main or FCP.
