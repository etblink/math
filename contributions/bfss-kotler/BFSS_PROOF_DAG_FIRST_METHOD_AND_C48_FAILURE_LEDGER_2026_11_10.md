# FCP–BFSS Proof-DAG-First Protocol and C48 Failure Ledger

**Date:** 2026-11-10 (America/Los_Angeles)  
**Status:** METHODOLOGY ONLY; no mathematical qualification, scientific promotion, FCP canonical change, or claim of a completed run.  
**Identity:** Child of the **Foundational Convergence Program**; descriptive sub-identity **FCP–BFSS: Representation, Spectral, and Physical-Realization Research**. Not a new foundational framework or separate program.  
**Active work branch:** integration/bfss-unified-research-20261108.

## 1. Protocol adopted prospectively

**Proof-DAG First:** design each new proof as the smallest meaningful, independently checked interfaces **before implementing** the composite theorem. Do not wait for multiple reds to decompose the obligation.

This strengthens existing [Interface-First Proof Protocol](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), [bounded execution protocol](BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md), and [proof reuse/failure playbook](BFSS_LEAN_PROOF_REUSE_AND_FAILURE_PLAYBOOK_2026_11_08.md). It does not supersede their source-integrity safeguards.

**Pre-implementation deliverable: a Proof DAG contract.** Record:

1. The exact target statement, scientific motivation, and explicit limits on physical or empirical conclusions.
2. Original Lean carriers and fully qualified source types: index/order, equivalences, real/complex structure, Clifford/CAR normalization, action orientation, adjoint/star, topology and domains.
3. Qualified parent declarations with exact tested SHAs, workflow IDs, and source blobs; inspect signatures, not inferred names.
4. One semantically small new lemma per unqualified node, and the explicit dependency edge that allows its output to feed the next node.
5. A lightweight first check of each new node (syntax, type, focused lemma) where possible; **strict qualification still requires cold source build, manifest hashes, warning-as-error, axiom checks and an independent consumer**.
6. Assembly from already verified nodes; any nontrivial remaining rewrite, summation, or coercion becomes a node.
7. Independent downstream consumer using the theorem to prove a *distinct* corollary, not simply reasserting its type.
8. Clear gate state: QUALIFIED / CANDIDATE / EXPLORATORY / CONDITIONAL / RED, with exact tested commit and qualification ceiling.
9. After two substantively similar red elaboration errors, stop patching a long proof; re-audit the interfaces and decompose before the next expensive run.
10. Publish negative knowledge with the same rigor as green evidence: first causal diagnostic, source hash, exact gate and what the failure does **not** disprove.

The mathematical roadmap, Lean implementation roadmap, and physical-realization roadmap remain separate ledgers. A well-typed source theorem is not a physical Hamiltonian theorem; a compiled candidate is not a qualified theorem.

## 2. Six consecutive C48-1A1b0 strict reds: causal record

Target: the original S1J source matrix acting on one exact G1A paired 48-real Majorana axis,

    C(q) e(j,s,A) = sum_(B : ColorIndex 2) R(q)_(B,A) e(j,s,B),

where C is the original S1J real Majorana matrix, R is the original G3A real adjoint color matrix, and the axis is the S1V5 source-block color axis. Rows B are **output**, columns A are **input**. Original vector index is **Fin 24 × Fin 2**, not an arbitrary color-major replacement.

| Strict run | First causal diagnostic | Method lesson |
| --- | --- | --- |
| [#42854278047](https://github.com/etblink/math/actions/runs/42854278047) RED | Scoped matrix-vector notation not available in the diagnostic | Inspect scopes; explicit Matrix.mulVec API |
| [#42859271145](https://github.com/etblink/math/actions/runs/42859271145) RED | Polymorphic Pi.single coordinate type failed inference | Explicit source carrier or source-specific lemma |
| [#42863553538](https://github.com/etblink/math/actions/runs/42863553538) RED | Generic Pi.single_eq_of_ne caused dependent-function inference failure | Reuse existing sourceBlockColorAxis_self and sourceBlockColorAxis_other |
| [#42867822784](https://github.com/etblink/math/actions/runs/42867822784) RED | Destructive substitution by rcases with rfl erased j/s/B before later source-specific application | Retain named equalities; avoid substituting live variables |
| [#42873893752](https://github.com/etblink/math/actions/runs/42873893752) RED | All 9,021 source dependencies and the new proof elaborated with only standard axioms; Lean unnecessarySimpa linter at line 91 required simp instead of simpa | Distinguish lint-only qualification failure from type/proof failure; correct the exact style warning without changing the theorem |
| [#42877745576](https://github.com/etblink/math/actions/runs/42877745576) RED | All 9,021 dependencies built; theorem elaborated with standard axioms, but unusedSimpArgs linter at line 91 flagged sourceBlockColorAxis | Trust the exact Lean lint hint, remove the unused simp arg; linter-only red still does **not** qualify the theorem |

All six passed exact source-pin preflight and built **9,021 dependencies**; the appended diagnostic was not strictly accepted. Earlier reds involved notation, dependent-type elaboration and tactic substitutions, whereas runs #42873893752 and #42877745576 were exclusively lint failures with the target theorem reported to depend only on standard axioms. Earlier sorryAx after elaboration errors disqualified those candidates; the last two runs reported no sorryAx, but CI was still red.

**Last tested revision:** `2a357d510eeafb64a31de13e4537b56b5880cd1c`, run [#42877745576](https://github.com/etblink/math/actions/runs/42877745576) RED (unusedSimpArgs on explicit sourceBlockColorAxis). **Current bounded candidate:** remove the unused argument only; strict green still required. The scientific target and source representation were not weakened.

**Procedure:** linter-specific edits to an already elaborated proof are an exception to further mathematical DAG decomposition, not a waiver of the Proof-DAG-First requirement on the next new gate. Prefer a cheap focused Lean lint check before expensive strict source rebuilds where the environment permits.

## 3. Smallest C48 matrix-axis DAG

| Node | Interface | Evidence / action |
| --- | --- | --- |
| M0 | Original S1J source entry under exact G1A axis labels, output-input orientation | Accepted source preflight [#42847346999](https://github.com/etblink/math/actions/runs/42847346999), SHA dea9dbdd30043d6cd41d7940deac199b28b4bf46 |
| M1 | Source axis evaluates to one at its own coordinate | Reuse existing S1V5 sourceBlockColorAxis_self |
| M2 | Source axis evaluates to zero at a distinct coordinate | Reuse existing S1V5 sourceBlockColorAxis_other |
| M3 | Typed coordinate formula for the finite sum of adjoint coefficients times source axes, at arbitrary output coordinate | **Not separately qualified**; isolate next if current candidate fails |
| M4 | Matrix-column equality from M0–M3, exact Matrix.mulVec_single_one, source-label extensionality | Current candidate remains unqualified without strict green |
| M5 | Independent consumer with a genuinely different corollary, type/axiom checks | **Pending** |

**Critical engineering correction:** M3 should be independently checked **before** M4, not discovered by a monolithic gate's fourth red. Avoid repeated expensive 9,021-job builds for small type errors where a narrow real-source check can isolate the problem, but never replace cold final proof qualification with an unpinned warm check.

## 4. Next all-vector covariance DAG, only after qualified M4/M5

- F1: source-normalized real-linear Gamma on a literal axis matches the genuine G1A paired Majorana, including positive sqrt(2) and exact CAR.
- F2: the actual G4E gauge Fock unitary intertwines that axis (earlier source-axis covariance accepted in #42813706857).
- F3: use M4 and real-linearity to express Gamma(C(q)e) as the exact output-color sum.
- F4: extend the axis intertwiner to any original real Source48Vector by basis or real-linear extensionality, yielding U(q) Gamma(v) psi = Gamma(C(q)v)(U(q)psi).
- F5: independently consume F4 to derive inverse/conjugation and examine commuting original Spin(9) operator automorphism; do **not** invent a Spin(9) Fock-vector unitary from a mere algebra automorphism.
- PHYS: actual gauge-physical FullL2 domain, original closed quadratic form, reducing sectors and spectral conclusions are separate obligations.

## 5. Cross-framework and epistemic application

When extracting a theorem from FCP's frozen reference corpus, separate the **source claim**, the **exact transferable mathematical statement**, its hypotheses, the **literal BFSS interface**, its failed-transfer countermodels, and the physical/empirical ceiling. A paper's framework admission status is irrelevant to whether a particular lemma is useful. Generic methods earn no fictitious FCP cross-framework convergence credit.

The [FCP charter](https://github.com/etblink/Foundational-Convergence-Program/blob/main/FCP_CHARTER.md), [epistemic rules](https://github.com/etblink/Foundational-Convergence-Program/blob/main/EPISTEMIC_RULES.md), and prospectively active Method 0.2.1 remain authoritative. No canonical FCP source window or adjudication is changed by this memo.

**Next conditional step:** the isolated remaining diagnostic is an unusedSimpArgs style-linter correction; mathematical proof elaboration is observed but **not yet qualified**. The subsequent all-vector C48 and polarization gates must begin with independently checked Proof-DAG atoms, including an explicit M3 reusable coordinate lemma if matrix-axis assembly requires revision. Always verify exact tested SHA, strict consumer and axioms before acceptance.


## 6. Retrospective acceptance and reusable-source qualification boundary — 2026-11-10

**Accepted direct diagnostic:** [#42880436131](https://github.com/etblink/math/actions/runs/42880436131) GREEN at exact commit `b588df82d5adb272dbda42d88d6fe04dc459f22c`; all 9,021 dependencies, 4 Git blob pins, three original S1J axis theorems and standard-axioms-only reports passed the strict check. Six previous reds remain recorded above as historical evidence, not current gate status.

**Still pending:** the qualifying workflow compiled a single direct diagnostic and did **not** compile a separate importing consumer. The next bounded gate, [C48-1A1b1 source and independent consumer](BFSS_C48C1A1B0_STRICT_ACCEPTANCE_AND_B1_PROOF_DAG_2026_11_10.md), exports the exact proven statements into an importable source module, adds a distinct identity-color-column consumer, and requires its own strict green before calling the exported interface accepted. Subsequent C48 Fock action remains open.
