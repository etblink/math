# F10BY three-red causal review and bounded recovery plan

**Review baseline:** `etblink/math@91764a75f189ccb7e59c937ccb00db31d1cb9fd1`, research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.  
**Environment:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.  
**Status at planning:** all three BY runs are red. The unchanged mathematical source compiles; complete independent acceptance is pending. Live qualification belongs in the [authoritative handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md), not this frozen review.

## 1. Question, evidence and decision

The mathematical question is whether the actual finite ordered source Spin word's action on each fixed original nine-vector has the proposed full derivative in its real parameters at zero. Its mathematical source has passed fresh strict compilation in all three attempts. The current blocker is the independent audit environment/style, not an observed failed mathematical goal.

The first two audit runs failed to construct subtraction on continuous-linear endomorphisms. The third removed those diagnostics and reached a single style-linter error in a new local proof binding. That is new evidence about the repair, while the third run remains red.

**Decision:** lock the mathematical source and audit propositions; change only the proof binding `letI` to the compiler-requested `let`, refresh the exact audit pin/guard, and rerun the unchanged full strict acceptance procedure. Preserve the two typed operands, derived additive topology, ground subtraction control and literal commutator test that reached the new failure boundary.

No change is justified to the source theorem, norm, original carriers, derivative normalization, axiom whitelist, warnings policy or resource limits.

## 2. Exact three-run causal matrix

| Run | Exact tested commit | Source compiler | Independent audit | What this discriminates |
|---|---|---|---|---|
| [41584710436](https://github.com/etblink/math/actions/runs/41584710436) | `81dc01df6bf787a5b890ce8da9c3678ffe4030b1` | Success; six permitted roots | Two `HSub` inference errors at 46:6 and 60:8 | Original audit operator expressions did not elaborate. |
| [41586108954](https://github.com/etblink/math/actions/runs/41586108954) | `15b5c5ab64ee0eb66e4a6720d36d7141f7a9a823` | Success; same source | Same two `HSub` errors at 46:7 and 61:9 | Result annotations alone are insufficient. Do not repeat that design as the next hypothesis. |
| [41587795099](https://github.com/etblink/math/actions/runs/41587795099) | `91764a75f189ccb7e59c937ccb00db31d1cb9fd1` | Success; same source | Only `linter.style.haveILetI` at 30:2; compiler requests `let` | The combined structural/operand bridge gets past both former errors and the new ground subtraction control. Remaining diagnostic is proof style. |

All three passed exact preflight, pinned restoration and accepted BX ancestry. The source blob is unchanged throughout: `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc`. Each failed audit still printed six imported roots with permitted axioms; these printouts did not certify failed examples or complete the gate.

| Run | Job | Artifact | Artifact ZIP SHA-256 |
|---|---|---|---|
| 41584710436 | `125747383788` | `13207638715` | `edeb5bfe1c63245e3a09f1f96c9c842882cd0f6195546d937f850a5c00925613` |
| 41586108954 | `125751864371` | `13207993586` | `f03cf59fdfe336e187a0068f3a1c88a13ea14917cf669f92e93b408ef3b3b985` |
| 41587795099 | `125757234015` | `13208927770` | `4b5146f08f9b0ef3dc83e53221f0daa4233691d957495d9c164e0434a87d06fc` |

### What the latest log actually establishes

The only actual Lean diagnostic in the candidate/audit terminal phases is at audit 30:2: the goal is a proposition and `let` is preferred over `letI`. The compiler explains that the latter inlines its value, while proof irrelevance makes that distinction unnecessary here. There are no remaining `HSub` diagnostics and no `sorryAx` in the twelve BY root reports across the two phases.

The third repair combined two changes: a derived topology instance and typed operand bindings. This run supports that combination; it does not isolate which component was individually necessary. A separate ablation would add no needed mathematical evidence for the present acceptance goal.

## 3. Historical procedures reviewed

This is a bounded source-derived comparison, not a statistical study of every repository run. Historical status claims below are identified as records; the three current BY runs were checked directly at their exact commits/jobs/logs/artifacts.

| Source inspected | Recoverable successful procedure | Application here |
|---|---|---|
| [FCP evergreen](https://github.com/etblink/Foundational-Convergence-Program/blob/cc608e2282e1b32bb11bbb64424e4775b28138e2/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md), blob `f5b53f680e7b3c119491be01306a33d83586bd9a` | Classify first causal failure; compose source-exact typed interfaces; separate exploratory diagnostics from final strict acceptance. Stop repeated no-information wrapper retries. | Classify source success, audit inference failures and the later style failure separately. Keep final acceptance fail-closed. |
| [FCP procedural review](https://github.com/etblink/Foundational-Convergence-Program/blob/cc608e2282e1b32bb11bbb64424e4775b28138e2/handoffs/FCP_BFSS_PROJECT_LEAD_PROCEDURAL_SUCCESS_FAILURE_REVIEW_AND_EXECUTION_PLAN_2026_10_26.md), blob `539940a0b696ebe4ece856420d2a3222716971eb` | Accepted S4 sequences used small original-source interfaces, explicit scalar/domain/index types and sealed ancestry. Repeated generic reduction and blind CI iteration failed. | Reuse BF topology, BT multiplication, BW derivative and BX transport. Leave the compiled BY mathematics fixed. |
| [V9Z six-red review](FCP_K1D18V9Z_SIX_RED_METHOD_CAUSAL_REVIEW_GATE7_2026_10_31.md) | Blockers moved from namespace and function-shape errors to a style-only failure. Follow the final linter correction without weakening warning strictness. | A new style error after old type errors disappear is a changed boundary, not another observation of the same type failure. |
| [V8L linter recovery](FCP_K1D18V8L_GATE1_RED_LINTER_CAUSAL_REVIEW_GATE2_RECOVERY_2026_10_30.md) | Remove only highlighted unused simp arguments; preserve propositions and strict checking. | Use the one-keyword compiler correction here. |
| [V8A validator recovery](FCP_K1D18V8A_THREE_GATE_CAUSAL_REVIEW_AND_VALIDATOR_RECOVERY_2026_10_30.md) | Kernel-checked independent propositions establish types; pretty-print regexes do not. Validate the verifier against actual output. | Keep the actual six typed audit interfaces and controls. The present failure is Lean's style linter, not the Python axiom classifier, which was never reached. |
| [V10E conversion review](FCP_K1D18V10E_GATE2_RED_DEFINITIONAL_EQUALITY_FAILURE_REVIEW_2026_10_31.md) | An inferred definitional equality failed; pinned propositional witnesses and typed congruences supplied the real bridge. | Do not infer a fix solely from a pretty-printed type. The failed result annotations remain negative evidence. |
| [Current handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md), BW/BX accepted records | Typed projections, exact argument order, independent PBW reconstruction, explicit map/value congruences and literal finite sums passed strict gates. | Preserve those components, including actual source indices and full native-plane normalization. |

The evergreen was read for decision rules; its file is not being edited. The procedural review's main method, execution rules and relevant runtime/provenance history were reviewed; its old live-state claims do not override current evidence.

## 4. What worked and what failed in this sequence

### Successful mechanisms worth retaining

1. **Separate source and independent audit verdicts.** The source was already compiling. Locating the audit failure prevented unrelated mathematical edits.
2. **Inspect the pinned instance declaration.** `ContinuousLinearMap.sub` in Mathlib `Topology/Algebra/Module/ContinuousLinearMap/Basic.lean` requires `IsTopologicalAddGroup` on the codomain. The audit now derives it from qualified BF via current `IsTopologicalRing.isTopologicalAddGroup`.
3. **Bind the input operators at complete consumer types.** Typed `R` and `L` expose endomorphisms in the reconstructed audit environment before subtraction. Result annotations alone had failed.
4. **Use a ground prerequisite control.** The audit explicitly requests `Sub (A →L[ℝ] A)` before the complete operator checks.
5. **Keep the semantic endpoint literal.** Independent commutator evaluation, actual inverse-coercion conjugation, actual vector-action derivative and the full native-plane finite sum remain present.
6. **Preserve exact provenance and scope.** No red run is relabeled accepted; clean imported-root reports do not override any failed example.

### Failures to avoid repeating

- **Annotation-only retries without discriminating prerequisites.** The second BY red duplicated the first inference boundary. The next step needed instance/API inspection and an explicit ground test.
- **Assuming a style-safe wrapper from static checks.** YAML, Python and shell checks passed but could not catch Lean's proof-style linter. Introducing `letI` caused an avoidable extra cycle.
- **Treating a required guard as evidence of correctness.** The workflow temporarily required the very `letI` form later rejected by Lean. Text guards constrain content; they do not validate semantics or style.
- **Conflating all reds.** The third run has no former inference failures. Replacing the working structural bridge now would discard positive evidence.
- **Weakening the gate to manufacture green.** Linter suppression, extra limits, axiom relaxation and removal of independent controls remain unjustified.

My procedural correction is to freeze already passing mathematical code sooner, inspect the exact failing wrapper prerequisite before another full cycle, and check new proof bindings against the pinned linter contract. The review does not assign a success probability from run counts.

## 5. Implemented recovery plan and discriminating outcomes

### Locked inputs

- Mathematical source `1fa83224a22fc0c7d2efdd6b1fdffe2f55f536cc` remains byte-for-byte unchanged.
- Same six roots, theorem hypotheses, finite parameter domain, original vector carrier, PBW norm, actual group inverse, commutator coefficient and full native output.
- Same derived local topology, explicit operand bindings and ground subtraction test.
- Same Lean/Mathlib pins, fresh source/audit compilation, three-axiom whitelist and 840/600-second caps.

### Exact edit

In the local additive-topology proof:

```lean
letI : IsTopologicalRing (CliffordAlgebra source9Quadratic) :=
  source9Clifford_isTopologicalRing_pbw
```

becomes:

```lean
let : IsTopologicalRing (CliffordAlgebra source9Quadratic) :=
  source9Clifford_isTopologicalRing_pbw
```

This follows the actual compiler instruction. No linter is disabled. Removing only the changed keyword recovers the entire previous audit exactly. Repaired audit blob: `4e89a6df00269492b91bee147cd4a24bb3b688a3`.

The workflow refreshes that exact audit pin and the corresponding proof-binding guard. This report records the causal review; the handoff remains the only live qualification ledger.

### Acceptance and stop rules

- Accept BY only after completed strict success at the exact repair commit, successful fresh source and independent audit, exact six permitted root reports per log, no `sorryAx`/unexpected warnings/errors, and retained artifact identity/digest.
- A new pure style diagnostic calls for its exact local correction while retaining strictness.
- If the old `HSub` error returns, do not try another generic annotation or expand the theorem. Isolate the already present topology, ground subtraction and typed operand checks in a bounded source-interface diagnostic with full types. This would contradict the present expectation that the third run resolved that boundary.
- If the validator fails after both Lean phases pass, compare it against the actual compiler/audit output; do not change mathematics to satisfy a string heuristic.
- If an actual mathematical goal or carrier mismatch emerges, preserve that as a separate obligation and reassess the construction.

## 6. Scientific boundary

BY concerns the ordinary full finite-parameter derivative at zero of the actual word action, for a fixed original nine-vector. It does not construct a source or target atlas, select an invertible 36-plane model, identify a tangent Lie algebra, classify a kernel or covering, prove the full F10BC manifold differential, or establish a physical BFSS conclusion. Those obligations remain separate even after this gate is accepted.
