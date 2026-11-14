# TD-C1A D0 — implementation and local review

**Date:** November 13, 2026 Pacific. **Status:** diagnostic implemented; Lean compilation pending CI. **Plan commit:** cfe2822709ccb8bfae2fe0fa898ba843eb0cd7e3.

The retrospective/interpretation contract was committed before these source changes. This collection tests the fixed-original-carrier hypothesis; it does not assume that hypothesis is correct.

| Case | Original data supplied | Question |
| --- | --- | --- |
| Metadata | Fermion 2; frozen generic bridge | Which native structures and generic public signatures elaborate? |
| Variable cast | Original Fermion 2; variable isometry | Does the primitive documented continuous-map coercion elaborate? |
| Generic variable lift | Original Fermion 2; arbitrary U/A/B; pointwise premise | Can the frozen arbitrary-carrier bridge specialize? |
| Generic variable evaluation | Original Fermion 2; arbitrary U/A/B; operator premise | Can the reverse frozen bridge specialize? |
| Native helper | Literal original Fermion 2; arbitrary U/A/B | Can the two conversions be proved directly on the native carrier? |
| Direct axis | Original G4E, S1J, gamma, basis label and vector | Does the exact accepted axis theorem still consume directly? |
| Actual cast | Original G4E; no gamma | Does actual gauge substitution affect coercion? |
| Native axis lift | Original G4E/S1J/gamma, typed U/A/B and source witness | Does the native helper join to the exact accepted axis theorem? |
| Native conditional evaluation | Original G4E/S1J/gamma; explicit operator identity hypothesis | Does native final evaluation consume a supplied operator identity? |
| Generic conditional evaluation | Same actual data and same explicit hypothesis | Does generic specialization behave differently? |

The evaluation hypotheses are not proved here. No all-vector assembly is attempted. A separate compiler process, 90-second cap, axiom/warning audit, return code, elapsed duration and log hash are recorded per case. Candidate failures do not suppress independent cases.

The primitive cast and native-helper cases determine whether to build the costly frozen axis chain. If either fails, that build and the five source-dependent cases are explicitly marked SKIPPED. The frozen generic prerequisite is audited before the original Core build.

## Frozen contracts and evidence

The manifest pins 24 existing/new blobs, including original Core, accepted axis and donor sources, both earlier generic interfaces, failed native composite, original TD-C1A source/independent consumer/full workflow, earlier focused workflow, and the new diagnostic source/runner. The new executed workflow is copied and fingerprinted separately, avoiding a self-referential hash cycle. Lean and Mathlib pins are unchanged.

The runner copies sources and manifest before toolchain restoration. Every executed case saves a log and return code immediately; final collection adds outcomes.json, verdict.txt and log-sha256.json. Infrastructure failure leaves collection unfinished and fails Actions. A completed collection can include failed proof cases. **Read outcomes.json regardless of Actions color.**

## Local verification completed

- Python AST/bytecode compilation, manifest JSON, workflow YAML, branch and all 13 trigger-path checks passed.
- Auditor fixtures rejected compiler errors, sorryAx, deprecated warnings, duplicate roots, unexpected axioms and missing metadata completion.
- Eight simulated collection scenarios passed: all leaves pass; primitive cast fails; native helper fails; both generic variable conversions fail while native leaves pass; direct source axis fails; actual G4E cast fails; native axis join fails; native conditional evaluation fails.
- Simulations checked early build skipping, continued independent collection, classification, specialization differential and invariant RED_UNQUALIFIED/qualification=false.
- New coercion calls use the actual pinned Mathlib public theorem LinearIsometryEquiv.coe_coe''; no assumed direct toContinuousLinearMap field is introduced.
- No local Lean executable is available. These local checks are not Lean compilation or theorem qualification.

No accepted gate, original definition, original theorem contract, full strict consumer, existing workflow, resource option, cache policy or main branch is changed. The next review must inspect exact tested SHA and the complete diagnostic artifact before selecting a proof repair.

## Launched checkpoint

Run [#43554665838](https://github.com/etblink/math/actions/runs/43554665838) was observed **in progress** at exact tested commit 186e338662a2a64bfb14277e134b5a373feca0f0. All 24 manifest source pins were independently matched through GitHub before moving the research branch. Roadmap consistency run #43554665859 at the same commit was observed queued.

No Lean case outcome has been inferred. The original gate stays RED_UNQUALIFIED. The next action is artifact/outcomes review, even if the diagnostic collection reports GREEN.
