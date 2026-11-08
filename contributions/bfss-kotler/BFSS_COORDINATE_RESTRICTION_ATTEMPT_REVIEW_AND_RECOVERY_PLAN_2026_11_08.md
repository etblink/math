# BFSS — Coordinate restriction causal review and implemented recovery plan

**Recorded:** 2026-11-08, America/Los_Angeles.  
**Repository:** etblink/math.  
**Review branch HEAD:** 3b3429ae29cbbbbe3784f931a7a37745af5f592e.  
**Latest failed proof attempt:** run 42464034784, attempt 2, tested 3085d66bcd22972d1455582d1c8b6fa52e3b5768.  
**Status:** Failure analysis and candidate recovery; no new mathematical acceptance.

## 1. Decision from the actual failure

The retry restored the pinned environment and compiled all 134 inherited
modules plus the unchanged fourteen-root coordinate source. The sole compiler
error is in the independent consumer, at line 78:

```lean
Pi.single 8 1 (Fin.last 8) = 1
```

The preceding typed matrix-to-coordinate equality now succeeds. Its final
`norm_num [source9CoordinateVector]` step does not convert the actual last-index
presentation to literal coordinate 8. The prior consumer repair was therefore
incomplete: it addressed one equality in the calc chain but left another
already-known coordinate convention to automation. This is a consumer proof
conversion failure, not a new source theorem failure or mathematical obstruction.

**Decision:** keep the complete source byte-for-byte fixed. In that one existing
consumer example, prove the finite-index equality explicitly, prove the actual
real singleton's same-coordinate value using inspected scalar/Core interfaces,
and compose the two equalities. Update only the consumer integrity pins. Preserve
all twenty-six example propositions and run the unchanged complete strict gate.

## 2. Distinguish recent attempts instead of counting undifferentiated reds

| Run / attempt | Earliest relevant failure or success | Scientific/operational meaning |
| --- | --- | --- |
| 42454470502 / 1 | New source: finite-index, scalar-family, matrix and identity conversions | Original restriction candidate unqualified; isolate the new interfaces |
| 42456290249 / 1 | Diagnostic omitted the working real-number import context | Diagnostic environment defect, not a BFSS counterexample |
| 42456930099 / 1 | Diagnostic dependent singleton application omitted its value | Inspect full pinned arguments before retrying |
| 42459708602 / 1 | Explicit real value still did not determine the dependent family | Value annotations alone were insufficient; switch to the nondependent scalar identity |
| 42460938380 / 1 | Singleton errors gone; three obsolete Core if_neg references | Proof route progressed; strict deprecation policy correctly rejected the introduced aliases |
| 42461564621 / 1 | Nine diagnostic interfaces compiled cleanly | Exploratory interface evidence only; not original-source qualification |
| 42462519467 / 1 | Source passed; consumer's matrix-abbreviation rewrite failed | Freeze source and use an explicitly typed equality |
| 42464034784 / 1 | Toolchain binary download returned HTTP 504 | Zero proof compilations; same-commit infrastructure retry was justified |
| 42464034784 / 2 | Source passed; last scalar step left literal 8 versus Fin.last 8 | The first consumer bridge worked, but its last conversion still needed an explicit proof |

This table contains eight failed attempts and one diagnostic pass. It is not
a new success-rate estimate. The older twenty-completed-run census is a dated
run-level snapshot; do not combine it numerically with this attempt-level table.
The same run ID can represent different attempts, phases and causes.

## 3. Historical methods actually reviewed

These comparisons use the repository's scoped historical records. The latest
attempt's archive and all log/input hashes were independently checked in this
review. Older acceptance claims are cited as historical records, not freshly
requalified mathematical results.

| Inspected record | Successful method | Failed method or limitation | Application now |
| --- | --- | --- | --- |
| [FCP evergreen guidance](https://github.com/etblink/Foundational-Convergence-Program/blob/cc608e2282e1b32bb11bbb64424e4775b28138e2/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md), blob f5b53f680e7b3c119491be01306a33d83586bd9a | Structure, literal-source specialization, premise discharge and bounded composition | Near-identical retries and partial reports do not establish acceptance | Identify the exact remaining equality and prove its two parts explicitly |
| [Source-geometry procedural review](BFSS_SOURCE_GEOMETRY_PROCEDURAL_SUCCESS_FAILURE_REVIEW_2026_11_07.md), blob c95dd2b26bd47c262c56dc16b5d80ca2a960b3a6 | Typed bridges, source-frozen consumer repair, separate diagnostics and qualification | Generic simplification and uninspected routine APIs caused avoidable cycles | Retain the source and all controls; repair the single consumer obligation |
| [V9Z six-red review](FCP_K1D18V9Z_SIX_RED_METHOD_CAUSAL_REVIEW_GATE7_2026_10_31.md), blob 18434fdd36fdd4dab5976fa2ab5446ec1668a4de | Named propositional bridges and exact strict-linter corrections | Namespace guessing and repeated simpa variants hid the real conversion boundary | Replace inferred index conversion with a checked equality; inspect Core as well as Mathlib |
| [F10BY three-red review](FCP_K1D18V10H_F10BY_THREE_RED_METHOD_REVIEW_AND_RECOVERY_PLAN_2026_11_02.md), blob 1a8339357a3f2d95f51194a88b597a10b2b93c6c | Full consumer types, verified prerequisites, source freeze | Result/value annotations alone did not resolve missing structure | Scalar family and index conventions must be discharged, not merely annotated |
| [F10DF conversion recovery](FCP_K1D18V10H_F10DF_TWO_RED_METHOD_REVIEW_AND_AUDIT_CONVERSION_REPAIR_2026_11_05.md), blob 724c4f160453b16fad3124b9f8321df7af636694 | Pointwise checked equality plus explicit consumer transport led to qualified run 42121005736 | Whole-expression conversion exceeded resources; imported-root reports did not certify failed examples | Use congrArg on the actual source coordinate function and a typed scalar evaluation |

The current source has compiled successfully in two completed strict proof
attempts with the same Git blob. Its present frozen status is justified by
that component evidence. Full qualification still requires the independently
authored consumer and the complete receipt.

## 4. What worked, what did not, and corrections to our procedure

**Retain what worked.** Exact source labels, Clifford order, axis, topologies,
central signs and theorem propositions have stayed fixed. Typed intermediate
equalities, pinned membership/entry lemmas, separate source/consumer phases,
and strict evidence retention have exposed progressively narrower failures.
The accepted Mathlib-only diagnostic supplied the concrete index proof needed
here. It must be applied to consumer conversions as carefully as to source code.

**The lessons were not applied consistently.** We left a final finite-index
conversion to norm_num after diagnosing that convention explicitly elsewhere.
Earlier, adding a scalar value did not solve a dependent codomain family, and
a familiar but deprecated Core alias introduced another avoidable diagnostic
red. These were proof-engineering mistakes; source mathematics should not be
changed to compensate for them.

**Inspect complete interfaces.** Read namespace, implicit/dependent parameters,
argument order and deprecation status in both pinned Mathlib and pinned Lean
Core. An inspected scalar theorem is preferable to guessing how a dependent
function family will be inferred. A private source alias does not automatically
give an independently written consumer a usable rewrite pattern.

**Review every step of a replacement proof.** Fixing the first failed rewrite
does not certify the last calc equality. For each step, state its input type,
output type, index convention and actual proof witness before the full retry.
Do not assume that a common normalization tactic closes the remaining goal.

**Keep failure phases separate.** The HTTP 504 was an installation failure and
justified one unchanged same-commit retry. The retry's consumer failure is new
proof evidence and does not justify another identical rerun. Neither event is
evidence against the mathematical representation, nor evidence that it is true.

**Do not use reports as substitutes for consumer compilation.** The consumer
prints imported source-root axiom reports. Those reports can all be clean while
an anonymous consumer example fails. Require the whole compiler exit to be zero;
do not weaken the output parser or remove the independent example.

**Keep performance work separate.** No cache rollout, compiler reinstall,
heartbeat increase, warning waiver or timeout change addresses this concrete
consumer equality. Historical cache measurements concern a different sealed
closure and do not authorize transplanting it into the live gate.

## 5. Implemented bounded plan

1. Freeze source blob 7df84b75d2d18fca18cc34e515359aa70e994cb0, all fourteen
   public statements, all 134 ancestor bytes, original carriers/actions and
   all strict controls.
2. Keep the first typed calc equality, which succeeded in the latest attempt.
   Replace only its last proof by a local checked equality between Fin.last 8
   and original coordinate 8, a typed scalar singleton equality, and congrArg
   transport through the actual source9CoordinateVector 8 function.
3. Preserve all twenty-six consumer propositions exactly, including the
   original negative central element, its two-sign kernel, arbitrary-target
   and vector-action checks, perpendicular membership and mixed-axis rejection.
4. Refresh only the consumer Git blob and SHA-256 in the existing manifest.
   Do not alter source pins, runner, workflow, dependency revisions, root or
   marker inventories, instance setup or proof resource limits.
5. Reconstruct the exact pinned closure from the retained artifact for static
   verification, validate all pins and imports, compare all consumer propositions,
   run the ten adversarial validator tests and check unchanged workflow syntax.
   This reconstruction is not a local Lean compilation or a new qualification.
6. Submit one complete strict cold source/consumer run. No further inverse
   embedding, SO(8) equivalence or downstream gate is included.

The finite-index proof shape is the already compiled diagnostic last_index_eq
at c800a96899a9e7597b78903891a07bd6401917f7. Pinned Mathlib
Algebra/Notation/Pi/Basic.lean, blob 1f0d6aa8e4dcc65dbd97ecc3739192f740c1fbc6,
provides the nondependent scalar single_apply identity. Pinned Lean Core.lean,
blob d55190c7a9f9de89bc671813e643a22b016bfb39 at compiler commit
5045d0056413266e57c625dcd7c365b10e377c52, supplies nondeprecated ite_eq_left.
No new theorem hypothesis is introduced; the finite equality is proved by decide.

## 6. Evidence, acceptance and stop conditions

The latest rejected archive is artifact 13620159781, ZIP SHA-256
49a3dbdbed792e2bbd2f2e5d09dd0c74617ceb05e092b9390db4814a5979b0d5.
Review verified all 166 input Git/SHA-256 pins, all 136 ordered build-log
digests, 135 successful compiler exits, ten successful strict report/marker
sets and all 42 installed package revisions. The receipt remains INCOMPLETE.
See [the exact rejected evidence](evidence/source-axis-stabilizer-2026-11-07/strict-failure-42464034784-attempt-2.json).
Object hashes are compiler receipt records; archived binaries were not supplied
and were not independently rehashed.

Accept only a complete fresh PASS at its exact tested commit: all 136 cold
builds, twenty-six examples, 121 strict root reports, eleven completion markers,
allowed propext/Classical.choice/Quot.sound axioms, no unexpected warnings or
errors, and a retained complete receipt. Static checks and source-only success
do not meet that standard.

If the same scalar/index boundary persists, stop full strict retries and obtain
a working minimal typed reproducer of that exact equality before another run.
If a different consumer fails, preserve and inspect its first actual error;
do not modify the frozen source or reflexively add annotations. An infrastructure
failure, validator failure or genuine mathematical mismatch gets its own
classification and bounded response. Never relabel a historical red as green.

Even acceptance would establish only the coordinate-exact faithful continuous
restriction. Its inverse, full target homeomorphic group equivalence, source
Spin(8) classification, branching, Fock action, physical domains, coercivity
and spectral existence remain separate obligations.
