# IBI-G1B — architecture review after two analogous independent-consumer REDs

**Date:** 2026-11-15 Pacific.
**Track:** `research/bfss-incidence-unified-20261114`.
**Decision:** STOP additional source/consumer CI launches pending proof-architecture revision.
All G1B mathematical statements, original source bytes, source pins,
consumer bytes and workflow are frozen at tested R3 commit
`771ecb6d600014beacfb511a7e0522354105cf34`.
This memo does not request permission to modify unified integration.

## Evidence and diagnosis

- R1 [#43695261997](https://github.com/etblink/math/actions/runs/43695261997):
  original source `simp` made no progress in real `inner` scalar normalization;
  two dependent declarations emitted `sorryAx`; no consumer.
- R2 [#43699776873](https://github.com/etblink/math/actions/runs/43699776873):
  exact explicit `real_inner_smul_left` fixed that. Source cold build
  9,019 jobs and all seven original-source axiom audits PASS. Consumer
  first failure: numeric literals `(0 : ColorIndex 2)` etc require
  unavailable `OfNat (ColorIndex 2)` instance in that elaboration.
- R3 [#43700926730](https://github.com/etblink/math/actions/runs/43700926730):
  source cold build and axiom audits PASS identically.
  Replacing literals with `(⟨k, by decide⟩ : ColorIndex 2)`
  removes typeclass failures but leaves `epsilon3` pattern match
  over raw Fin constructors unresolved in the positive and negative
  orientation fixtures. Consumer failed at 26:23 and 35:24.

**Root-cause category:** two related finite-color-coordinate
*consumer normalization and representation* failures, not two
failures of original Pauli sign/gauge-invariant theorem. No observed
source sign counterexample. Avoid saying G1B is qualified, however,
because the independent consumer was not accepted.

## Underlying type structure and branch-specific distinction

The original `Core.lean` uses
`ColorIndex N := Fin (N ^ 2 - 1)`. For `N = 2`, this is definitionally
a three-element index but its surface notation and custom constructor
proofs may not reduce as expected in a nested `epsilon3` match.
The source finite symbol
`FCP.BFSSSU2.epsilon3 : Fin 3 → Fin 3 → Fin 3 → ℝ`
is already accepted and signed in the 0/1/2 basis.

This suggests a two-layer **consumer** proof, not modifying any
original physical definitions:

1. **Canonical finite sign layer**: test
   `epsilon3 (0 : Fin 3) (1 : Fin 3) (2 : Fin 3) = 1` and
   `epsilon3 (0 : Fin 3) (2 : Fin 3) (1 : Fin 3) = -1`
   directly using definitional reduction / explicit case normalization.
   This may be tested in a local scratch environment first, with
   `#check`, `#reduce`, and `#print` inspection.
   It is not yet a verified Lean lemma.
2. **Original-source typed bridge**: write the two *original*
   `pairedAlgebraData.structureConstant` examples with canonical
   `(k : Fin 3)` indices and use the existing theorem
   `pairedColor_structureConstant`; if needed, make the
   `ColorIndex 2` ↔ `Fin 3` definitional conversion explicit with
   `change` before rewriting. This is a proof-engineering
   proposal, not an accepted equality until checked.
3. Retain the independently compiled **arbitrary** original
   `Boson 2` and `GaugeGroup 2` consumers of
   `originalLieTriple_eq_crossTriple` and
   `originalCrossTriple_gauge`. Never satisfy the test solely with
   standalone finite epsilon identities.
4. Keep opposite-sign fixtures and the source +√2 normalization
   so a reversal, transposition or coefficient mismatch is detected.
   Do not replace actual source color indices with a surrogate
   SO(3) action or a textbook octonion model.

## Review alternatives and escalation

- Preferred: first isolate the canonical `Fin 3` evaluation in
  an *uncommitted local scratch proof* or independently inspected
  exact source proof; test that both signs reduce. Then preregister
  one **bounded consumer-only architectural revision** keeping the
  original source byte-identical and update the CI consumer pin atomically.
- Fallback if canonical `Fin 3` alone does not normalize:
  explicitly prove two small finite `epsilon3` basis lemmas,
  using a finite case/constructor normalization instead of hoping
  broad `norm_num` solves nested `Fin` matches. Test those
  before splicing into source consumers. An independent consumer
  must still exercise the original `pairedAlgebraData` declarations.
- If the sign examples produce the *wrong* sign after exact
  normalization, preserve a genuine original-source
  counterexample and halt G0B1 dependent theorem claims.
- No CI rerun with unchanged bytes; no linter/axiom relaxation,
  timeout escalation or attempts to declare a source-only green
  as full gate green.
- At the *next* red at the revised boundary, preserve exact
  diagnostic, reassess the architecture and consider a
  separately justified narrower consumer gate rather than
  ad hoc tactic series.

## Scientific gate chain retained

Accepted: G0A original Gram invariance, G0B0 generic quaternion
polynomial, G1A source Lie-triple gauge invariance.
G1B original source now source-built and axiom-audited, but
still **RED_UNQUALIFIED** overall.
Do not advance G0B1 determinant-one, G0C SU(2) image surjectivity,
G2 orbit classification, physical L2/Fock/domain relevance,
or ontology claims as if they were proven.
OCT-SRC source octonionic Spin9 research is independent of
these SU(2) color index failures.

## Operational controls

Preserve R1/R2/R3 source commits, logs, receipts and artifacts.
Do not delete/rewrite research branch history. Make documentation-only
preservation now, with **no new strict workflow trigger**.
Do not modify `integration/bfss-unified-research-20261108`,
`main`, original BFSS source, FCP, or the original IBI pilot.
