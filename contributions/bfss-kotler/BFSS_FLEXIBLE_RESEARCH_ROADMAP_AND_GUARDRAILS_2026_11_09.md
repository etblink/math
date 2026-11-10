# BFSS — flexible research roadmap and decision guardrails

**Operational status:** PROPOSED LIVING ROADMAP / NO NEW MATHEMATICAL ACCEPTANCE  
**Date:** 2026-11-09  
**Repository and working branch:** `etblink/math`, `integration/bfss-unified-research-20261108`  
**Research provenance:** `etblink/Foundational-Convergence-Program` and pinned, independently requalified imports  
**Baseline for this roadmap:** `263a8b85661ad786e4cec1a137100822b9145e5c`  
**Lean / Mathlib pin:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`

> **Operating principle:** Seek the truth, not a green workflow. Preserve proven source-faithful mathematics, preserve every informative failure, and change research routes when evidence warrants. A green qualifies only the exact checked declaration, tested commit, dependencies, consumers and gate contract; it does not qualify a downstream scientific claim.

> **Current gate status:** C48-0 is now strictly qualified at [#42779878513](https://github.com/etblink/math/actions/runs/42779878513); the next gate C48-0B is submitted and in strict verification [#42782411960](https://github.com/etblink/math/actions/runs/42782411960). The original R0–R5 and first C48-0 queue below are preserved historical decision context. See [Section 9](#9-acceptance-checkpoint--c48-0-qualified-c48-0b-launched).

> **Active strategy update (late 2026-11-09):** The R0–R5 table below is the historical baseline, not the immediate gate queue. B2, B3, and T1 have since qualified. The active operator-algebra/gauge path and its proof obligations are in [Section 8](#8-late-2026-11-09-strategy-revision--c48-original-gauge-compatibility-pivot). The C48-0 candidate has been submitted but was not qualified at this update. Preserve previous decisions as provenance rather than rewriting their historical status.

This is the **current decision guide**, not a supersession of immutable evidence. Earlier roadmaps and historical notes remain primary provenance: [post-F1 operator-action recalibration](BFSS_POST_F1_CAR_OPERATOR_ACTION_RECALIBRATION_2026_11_09.md), [spectral confinement roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md), [whole-sector oscillator exclusion](BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md), [adversarial frontier decision](BFSS_SPECTRAL_FRONTIER_ADVERSARIAL_DECISION_2026_11_07.md), [gauge-fixed projection feasibility](BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md), and [F1 historical success/failure ledger](BFSS_HISTORICAL_GATE_RETRIEVAL_F1B_2026_11_08.md).

## 1. North star, scientific boundaries and route selection

**Research target:** Determine whether the *actual undeformed relative SU(2) BFSS gauge-physical Hamiltonian*, with its actual closed quadratic form and operator domains, possesses positive-energy normalizable eigenstates in appropriate Spin(9) isotypic sectors; establish or refute the precise claims with source-faithful reproducible mathematics.

**Not the target:** Prove a global mass gap, infer compact resolvent for the entire Hilbert space despite flat directions, infer point spectrum from positivity alone, or assert a spectral theorem merely from representation algebra. Positive sector point spectrum and a zero-threshold continuous spectrum elsewhere are not logically contradictory.

The work has **three related lanes** that should run at different speeds:

| Lane | Role | Can progress independently? | Critical join |
| --- | --- | --- | --- |
| **R — representation and original-source action** | Construct the exact global Spin(9) action on the complete original Fock operator algebra | Yes; **primary route** | Actual source-weight/stabilizer and gauge-compatible operator action |
| **A — adversarial spectral analysis** | Test whole-sector oscillator exclusion, valley escape, branching and thresholds | Yes, under **explicit conditional hypotheses** | Replace each hypothesis with qualified source representations and estimates |
| **P — physical form and domains** | Bind the original gauge-physical projection, supercharges, closed quadratic form, coercivity and spectrum | Early inventory can proceed; theorem promotion depends on R and A | Same original carrier, original domains, common core, actual Hamiltonian |

**No fixed dates or mandatory tactic sequence.** Reorder, parallelize, or cancel tasks when the dependency and evidence map changes. Do **not** cross the R–A–P join by silently treating a conditional result as unconditional.

## 2. Verified starting inventory and known blocks

| Input | Current evidence | Scope caveat |
| --- | --- | --- |
| Original F1A–F1E CAR, bivector source ingredients and F1F compact real LinearMap | Qualified ancestry and independently checked components on active integration branch | Literal expanded production F1F map is not qualified |
| Abstract matrix-unit / skew-plane evaluations and symbolic transport | [C3 strict green #42651438879](https://github.com/etblink/math/actions/runs/42651438879), 25 exact source/consumer reports | Concrete original-Fock plane equation remains blocked |
| Original CAR reverse product and real half-antisymmetry at distinct source labels | [C4 strict green #42654797722](https://github.com/etblink/math/actions/runs/42654797722), 31 exact reports | Does not discharge F1F's entire concrete finite-sum equality |
| **Actual original complexified Clifford algebra ≃ full original Fock operator algebra** | [M3H/M3I strict green #42547700192](https://github.com/etblink/math/actions/runs/42547700192), tested `741e629e228e83071f757ab4adc5588715136fd1`; source + independent consumer, six permitted-axiom reports | It is `ℂ`-`AlgEquiv`, **not automatically** a star-equivariant Spin(9) action |
| Source Spin(9) algebraic gamma representation and original paired-48 SO-valued map | F10R and earlier qualified source work recorded; verify exact imported theorem blobs/consumers at each new gate | Algebraic group map alone does not prove the source topological action on Fock operators |
| Whole-sector oscillator exclusion with full-operator weight bound | Analytical result **conditional** on explicit source/action/branching premises | Full operator fiber `M=12`, not the Fock-vector `M=6`; no accepted physical spectral result |
| Original full concrete Fock-plane equation and literal production F1F | C1 red [#42645848109](https://github.com/etblink/math/actions/runs/42645848109), C1b red [#42648725215](https://github.com/etblink/math/actions/runs/42648725215), recurring recursion / definitional-reduction failure | **HOLD**; mathematical statement not disproved, no accepted theorem |
| Original gauge-physical closed Hamiltonian / spectral conclusion | Partial original physical-source and projection infrastructure, conditional analytical arguments | No accepted global coercivity, compact-resolvent, eigenvalue or mass-gap theorem |

**Important recovery:** Historical M3I is **already independently strictly accepted on this integration branch**, and its M3H/M3I theorem blobs match the accepted gate. The older 47-module donor-rebase proposal is superseded. Do not rebuild or re-import that equivalence just to duplicate proof credit. Existing source headers may retain stale "UNQUALIFIED" prose; trust immutable exact-commit gate evidence over stale comments, without rewriting accepted bodies.

## 3. Representation lane R — next proof gates

Each gate has an **entry condition**, a **minimal new obligation**, and a **stop/fallback**. Do not combine multiple new, high-cost source specializations in one gate.

| ID | Proposed bounded obligation and acceptance evidence | If blocked, fail, or falsified |
| --- | --- | --- |
| **R0 — exact source inventory** | Identify the qualified M3I/M2 source carrier, F1 paired-label crosswalk, `√2` generator normalization, F10R original paired-48 action, exact imports and blob pins. Record names/expressions and first consumer obligation. Read-only first. | Locate mismatch precisely; do not introduce arbitrary instances or rename representations to force apparent equality. |
| **R1 / OP3-A — original generator crosswalk** | Prove on each *actual source axis* `e_p`: donor complex-Clifford Fock generator, donor normalized real-linear generator, and active `sourceNormalizedGamma p` identify with exactly `√2 • majoranaCandidate p`, after the explicit original G1A paired permutation. **Independent source-axis consumer and accepted parents**. | If label or normalization conversion is expensive, split into (i) label permutation, (ii) normalized theta equality, (iii) generator evaluation, each separately checked. If mismatch is real, record and correct upstream convention, not physics. Do not try whole-map `simpa` first. |
| **R2 / OP3-B — original Spin(9) quadratic isometry** | Turn the exact F10R `Spin(9) → SO(48)` paired-label matrix into an isometry of the **actual** `source48Quadratic` on `Source48Vector`; establish identity, composition orientation, unit-axis evaluation, inverse. | If group-action orientation is reversed, compare left/right action conventions in a tiny source-axis consumer. Do not substitute an unspecified equivalent 48-space. |
| **R3 / OP3-C — Clifford automorphism** | From R2, construct the genuine source complex Clifford automorphism with exact generator covariance and check multiplication, identity, inverses and `√2` normalization. If Mathlib's API differs, qualify the smallest isometry-to-Clifford map first. | Explore the universal Clifford property or a basis/monomial route, but retain R2's exact group and source generator tests. No assumed automorphism as an axiom. |
| **R4 / OP3-D — full original operator action** | Conjugate R3 through the **accepted M3I `AlgEquiv`** to produce an honest `Spin(9) →*` algebra-automorphism action on `Fermion 2 →L[ℂ] Fermion 2`. Independently verify covariance on the original normalized gamma and delta-one theta, group law, center behavior on generators. | If huge equalities recurse, prove abstract `AlgEquiv` transport and generator test separately; use typed source-axis lemmas, not full 48-by-48 sums. Stop after repeated same-cause recursion and preserve the blocker. |
| **R5 / OP3-E — star, parity, topology** | Prove adjoint preservation using exact generator self-adjointness and generation/uniqueness (or another genuinely valid involution). Show the negative central element acts on original Majoranas by sign and on full operator algebra by fermion-parity **conjugation**. Establish continuity in the correct source topological group and Fock-operator topology. | **Star is not automatic for a bare `AlgEquiv`.** A Clifford conjugation involution may negate odd generators even though physical `θ` is self-adjoint. Do not infer star preservation from algebraic covariance. If continuity fails, keep a strictly algebraic conditional action rather than overstating it. |

**R-lane milestone:** **An independently source-qualified continuous, star-preserving original Spin(9) operator action, with correct group law, original Majorana covariance and central parity.** The action should be stated at exactly the carrier consumed by the spectral argument. Until every required property is accepted, label it *partial/algebraic/conditional*, not the complete physical action.

## 4. Parallel analytic lane A — actively seek disproof

This lane is worth pursuing **while R1–R5 are underway**, but every result must carry its hypotheses, sector carrier and normalization. The goal is to falsify a bad mechanism early instead of formalizing it blindly.

| ID | Question / evidence gate | Negative or alternate branch |
| --- | --- | --- |
| **A0 — source-free weight sanity and normalization** | Recompute the full-operator fiber bound `M=12`, not vector-only `M=6`; check the exact torus orientation, 2π center and B4-to-D4 restriction conventions. For oscillator levels `0..m`, the conditional exclusion threshold is `λ₂>m+12`. | If chosen sector violates the bound (e.g. old `(24,18,0,0)` for levels 0–11), reject that candidate; do not relabel it as an accepted high-type sector. |
| **A1 — whole-isotypic exclusion** | Validate absence of low transverse oscillator states on the **whole smooth isotypic source core**, not merely one highest-weight vector; include little-group branching, moving frames and almost-everywhere evaluation. | Construct an explicit same-sector, fixed-gauge and moving-frame escaping sequence. Any valid counterexample blocks promotion of that mechanism; record a negative theorem if possible. |
| **A2 — nonzero physical realization** | Show at least one selected high type exists nontrivially after the **actual original SU(2) gauge projection** and with correct operator-column action. Candidate `(24,24,0,0)` must be checked, not assumed. | If the proposed sector is zero, select a different sector **without changing the original physical problem**, or mark the route unavailable. |
| **A3 — escape/annulus robustness** | Independently attack coercivity with collinear valleys, multishell cutoffs, color-changing frames, near-valley localization, radial trial families and boundary errors. Record estimates and counterexamples at exact norms/domains. | A real escape channel defeats the proposed coercivity claim. Stop spectral promotion and revise the physical argument rather than patch an inequality to fit. |

**A-lane milestone:** A reliable conditional **whole-sector** estimate and a nontrivial original physical sector, with the corrected `M=12` condition and falsification attempts documented. Analytical notes are not automatically Lean-accepted or applicable to the original closed form.

## 5. Physical/functional analytic lane P — the final bridge

| ID | Mandatory proof obligation | Stop condition |
| --- | --- | --- |
| **P0 — exact physical carrier and gauge action** | Match original Fock operator-column action to the actual original `GaugeGroup 2` action, gauge-fixed projection and source spatial Spin(9) action. Prove genuine commutation/intertwining and invariance—not an arbitrary projected surrogate. | If actions or carrier conventions disagree, stop any physical-sector inference. |
| **P1 — original closed quadratic form** | Identify the original source smooth core, supercharges, physical projection, closure, adjoints, complete domains, and equivalence to the actual normalized Hamiltonian quadratic form. Preserve original unbounded-operator domains; `Q†Q` on an easier core is not automatically the whole physical Hamiltonian. | A domain failure or unsupported extension blocks self-adjoint/closed-operator or spectral promotion; retain only the proved core statement. |
| **P2 — source-sector coercivity and compactness** | Combine accepted R action, A whole-sector exclusion, gauge invariance and P1 closure to obtain a **uniform, source-faithful** lower bound and compact embedding/resolvent on the chosen physical isotypic sector. | If full-sector confinement fails, make the negative result explicit and explore a different valid mechanism or sector. |
| **P3 — spectral existence, independent stress test** | Prove nonzero relevant sector, spectral compactness, correct positive-energy eigenvalues and any claimed sequence, all for the **actual original Hamiltonian**; independently review counterexamples and hypotheses. | Do not infer positive point spectrum from nonnegativity, abstract compactness, a gauge-averaged toy model or a different closed extension. No global mass-gap claim. |

**P-lane milestone:** One exact, reproducible physical spectral theorem whose assumptions have all been discharged for the undeformed original model. If a hypothesis cannot be discharged, publish/record the strongest valid conditional or negative statement instead.

## 6. Non-negotiable guardrails

### Mathematical and scientific integrity

1. **Source fidelity:** Keep original BFSS `Core.lean`, original `Fermion 2`, original `Source48Label` paired permutation, original `source48Quadratic`, source Spin(9), exact `θ` CAR and `√2` Clifford normalization, original SU(2) gauge action and original physical closed form. An equivalent model is only a comparison until an exact source intertwiner is verified.
2. **Statement integrity:** No altered target theorem, hidden additional hypothesis, postulated isomorphism, `sorry`, `admit`, new axiom, `unsafe` shortcut, or assumed spectral conclusion. Mathematical equivalence must be proved, not stated as a comment.
3. **Evidence classification:** Maintain `QUALIFIED`, `CONDITIONAL`, `EXPLORATORY`, `BLOCKED`, `REJECTED`. A theorem that prints an axiom report after a compile error or `sorryAx` is **not** qualified. Do not promote a parent merely because it is imported.
4. **Source and kernel verification:** Every promoted Lean gate needs exact tested commit, frozen toolchain/Mathlib and source blob pins, cold source build, independent consumer of the **actual claimed type**, exact theorem-root enumeration, fail-closed warnings/errors/axioms and persisted logs/artifact receipts. Caches may accelerate development but cannot replace the cold independent acceptance check.
5. **Do not chase greens:** A passing gate must resolve a named dependency or eliminate a meaningful scientific uncertainty. Retain the exact red and green runs and explain why each mattered. No mass gap or spectral point theorem without the complete original-source analytical and domain chain.

### Adopted interface-first methodology (2026-11-09)

Before designing another expensive Lean source gate, apply the [Interface-First Proof Protocol and OP3-A lesson](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md): retrieve already qualified source work; inspect fully qualified source types, names, label permutations and normalizations; write an explicit dependency ladder; prove the first missing interface on the smallest carrier; only then attempt large operator constructions. The OP3-A1 reds [#42661987249](https://github.com/etblink/math/actions/runs/42661987249) and [#42665490584](https://github.com/etblink/math/actions/runs/42665490584) are negative proof-engineering evidence, not mathematical counterexamples. Preserve exact first goals and never assume two independently named constructions agree without an admitted crosswalk. The subsequent [#42668302044](https://github.com/etblink/math/actions/runs/42668302044) was in progress at this addendum's baseline, so no acceptance is inferred. No original-source or verification requirements are relaxed.

### Proof engineering and change control

- **One principal new mathematical obligation per expensive gate.** Auxiliary interface lemmas may be bundled only when individually named, independently auditable and lower cost than the main result. Do preflight `#check`, inspect prior Mathlib/accepted tactics, and test source-axis or abstract statement before the full Fock carrier.
- **After two same-mechanism reds**, stop tactic permutations. Diagnose the first causal compiler line and historical precedents, write a brief method review, and change proof architecture or mark the gate blocked. A diagnostic syntax/CI-quoting failure is not mathematical evidence; repair that bounded defect without changing proof claims.
- **No recursive budget escalation as a substitute for an explanation.** Any exceptional proof-resource setting needs evidence, bounded scope, and independent cold requalification; do not silently raise `maxRecDepth`, `maxHeartbeats`, CI timeouts or axiom allowances to mask a source incompatibility.
- **Protect accepted work:** Do not modify qualified ancestry or original production F1F as a side effect. Freeze source and independent consumers; alter historical records by append-only findings. Branch updates require fast-forward with expected-head lease. Distinguish research branches and accepted integration branches; no merge, publication or upstream claim without the corresponding authorization and audit.
- **No opportunistic repo reimports:** Before recovering donors from FCP or other branches, check active file blobs and strict gate receipts. M3I is already qualified; use it rather than duplicating the 47-module proposed rebase. Do not import `openai/math` or donor material without source, license/provenance and explicit semantic compatibility checks.

## 7. Decision rules, adaptive pivots and review cadence

Use this exact **gate decision record** after every cold run:

| Field | Record |
| --- | --- |
| Claim and relevance | Exact statement, original vs abstract/conditional status, which R/A/P dependency it discharges |
| Inputs | Branch, tested commit, dependency SHA, exact theorem/source/consumer blob pins |
| Verification | First causal error or green source/consumer/build, exact axiom roots, artifact and run IDs |
| New knowledge | What the evidence *proves*, *does not prove*, and what counterexample or failure ruled out |
| Next decision | `ADVANCE`, `REPAIR_BOUNDARY`, `PIVOT`, `HOLD`, `REJECT_CLAIM` with the one next discriminating test |

**Advance:** Full exact source + independent consumer passed and all named predecessors are accepted. **Repair boundary:** One genuinely diagnosed, small parser/import/API/CI/source typo defect with no proposition alteration. **Pivot:** Same red mechanism persists or a new source/interface approach materially reduces reduction cost. **Hold:** Missing parent, unverified donor, insufficient signal, or conditional-only analytical source binding. **Reject claim:** Counterexample, false inequality, irreconcilable source mismatch, or incompatible physical-domain statement; keep negative knowledge.

**Regular checkpoint:** After each admitted gate, update a short dependency ledger and do not queue another expensive proof until the next necessary obligation is explicit. Re-evaluate priorities after two equivalent reds, at any source/model mismatch, at each completed R/A/P milestone, and whenever existing accepted work is discovered. Every few bounded gates, review whether the work shortens the path to the actual spectral theorem; archive productive but noncritical lemmas rather than allowing them to displace the critical path.

**Allowed adaptation examples:** If R1 normalization crosswalk is blocked by instance reduction, temporarily use separate source-axis label and scalar lemmas; do **not** repeat F1F C1/C1b. If R3 Clifford functor API is unsuitable, use another exact universal-property construction with the same source carrier. If R4 algebraic action passes but star/topology fails, retain only the algebraic theorem. If A finds a genuine high-sector escape sequence, stop P2; that negative result may be scientifically more important than another successful partial proof. If P1 original closed-domain identification fails, study the operator domain directly rather than substituting an easier Hamiltonian.

## OP3-B2 decision checkpoint — 2026-11-09: HOLD the optional isometry-equivalence package

**Qualified and retained:** OP3-A1 [#42668302044](https://github.com/etblink/math/actions/runs/42668302044), OP3-A2 [#42671945161](https://github.com/etblink/math/actions/runs/42671945161), and OP3-B1 [#42675821883](https://github.com/etblink/math/actions/runs/42675821883), the genuine original source-48 quadratic preservation theorem. **Not qualified:** OP3-B2 `IsometryEquiv` after two independent same-mechanism recursion failures, [#42678500270](https://github.com/etblink/math/actions/runs/42678500270) and [#42680558526](https://github.com/etblink/math/actions/runs/42680558526). The latter successfully elaborated its separately factored real `LinearEquiv` before recursing in the thin `IsometryEquiv.map_app'` wrapper, but the whole gate and its independent audit failed, so nothing from OP3-B2 is promoted.

**Guardrail applied:** HOLD, perform source-level read-only review, and evaluate the pinned Mathlib lower interface `QuadraticMap.Isometry` → `CliffordAlgebra.map` or direct `CliffordAlgebra.lift` before implementing any new proof. Do not rebuild a different 48D action, raise Lean recursion budgets, or reattempt the same wrapper. See [the OP3-B2 two-red diagnosis and alternative-interface audit](BFSS_OP3B2_SOURCE48_ISOMETRY_PACKAGING_AND_OP3C_INTERFACE_AUDIT_2026_11_09.md). The mathematical OP3-C real/complex Clifford group action and original Fock operator representation remain open.

**Latest active research direction (2026-11-09):** The [pinned Mathlib and original BFSS OP3-C direct Clifford lift investigation](BFSS_OP3C_DIRECT_CLIFFORD_LIFT_INTERFACE_INVESTIGATION_2026_11_09.md) has completed a **read-only API audit**. It identifies direct `CliffordAlgebra.lift` applied to `(CliffordAlgebra.ι source48Quadratic).comp (R_g.mulVecLin)` as the preferred next source-exact experiment. The needed Clifford square condition follows from the already-qualified OP3-B1 quadratic preservation; the original L9E5C1 real Fock Clifford lift is a concrete internal precedent. The weaker `QuadraticMap.Isometry` → `CliffordAlgebra.map` remains a secondary route; the twice-red `IsometryEquiv` wrapper remains **HOLD**. OP3-C universal lift, its group law/inverse, complexification, original operator star/continuity and spectral claims remain **UNQUALIFIED**. The R0/R1 instructions below are **historical baseline**, superseded operationally by this updated checkpoint. No new Lean source or workflow was submitted during the research audit.

## Current OP3-C checkpoint — 2026-11-09: OP3-C0 accepted, OP3-C1 candidate

[OP3-C0 run #42685719690](https://github.com/etblink/math/actions/runs/42685719690) at commit `e45fc7e4f8e917682310628a2da1f5f877eb9475` **passed** its exact source/consumer cold build and eight permitted-axiom reports for four roots. The genuinely original source-48 Clifford generator under the qualified F10R Spin(9) paired-label matrix action obeys `f_g(v)²=source48Quadratic(v)·1`. Its original linear generator map and evaluation are independently qualified, avoiding the twice-red OP3-B2 `IsometryEquiv` wrapper. This is not an `AlgHom` or group action.

**Operational next gate:** [OP3-C1 direct source real Clifford universal lift](BFSS_OP3C1_ORIGINAL_REAL_CLIFFORD_UNIVERSAL_LIFT_GATE_2026_11_09.md) via pinned `CliffordAlgebra.lift` and the accepted OP3-C0 square, with exact generator and original matrix covariance and an independent strict consumer. If qualified, next prove identity and same-order composition, then inverse, then real/complex Clifford and source M3I Fock transport. The original star, center, continuity, gauge-physical and spectral obligations remain open. This checkpoint supersedes the historical R0→R1 implementation instructions below; no already-qualified math is reopened.

## 8. Immediate execution order and handoff contract

**Next bounded task: R0 → R1 / OP3-A generator-axis crosswalk.**

1. **Read-only preparation:** Confirm the accepted donor M2/M3I source and current branch provenance, active Fock gamma and paired-label source, actual equality of relevant normalized generators, and exact import closure. Inspect the already present `SU2PairedThetaLabelCrosswalkProbe`, `SU2BFSSPhysicalDomainS1V7OriginalSourceSixteenBlockLabelBridgeProbe`, `SU2BFSSSource48FockIndexBridgeProbe`, donor `S1V52L9E2/L9E4/M2/M3I`, and active `SU2BFSSSource48NormalizedFockGammaProbe` / `SU2BFSSSource48RealLinearGammaProbe`. Trust exact checked proof bodies, not stale source header labels.
2. **One precise candidate:** Original-source axis theorem `Γ_donor(e_p) = Γ_active(e_p) = (√2 : ℂ) • θ_p` at the **genuine** `Source48Label`, or equivalent `(Fin 8 × Fin 2 × ColorIndex 2)` axes with explicit label equivalence. Separate donor-to-active scalar/label theorem from the Clifford universal generator application if needed. Verify actual equality before asking for full linear-map equality.
3. **Minimal strict gate:** Freeze all source blobs; compile only the required closure and new lemma, import it independently at the exact original Fock operator type, inspect exact theorem roots and fail-closed diagnostics; do not change F1F C1/C1b. If this source crosswalk is accepted, proceed to R2. If not, preserve the first causal error and choose one narrower source/label experiment or hold.

**Project Lead autonomy:** Execute bounded, authorized source-faithful proof and documentation tasks that meet this contract; do not presume authorization for changing physical assumptions, weakening acceptance rules, destructive cleanup, merging into main, external publication, or downstream scientific claim promotion. Keep the owner informed of branch, exact run ID, evidence status and why the next gate matters.

**Success is not “many green runs.” Success is eliminating essential uncertainty without losing the truth of the original model.**

## 8. Late 2026-11-09 strategy revision — C48 original gauge-compatibility pivot

**Decision:** Retain the north star (actual undeformed relative SU(2) BFSS closed physical Hamiltonian and sector spectral truth) and all R/A/P guardrails, but **reorder the near-term R-to-P join**. Prove original fermionic gauge compatibility through exact source 48-Majorana matrices and Fock-operator *automorphisms **before** attempting a complete Spin(9) action on individual Fock vectors. Do not treat a planned proof as a qualification. This is an operational priority change, not a modification of any accepted theorem.

**Qualified mathematical input:** B2 original global physical-star [#42759465245](https://github.com/etblink/math/actions/runs/42759465245), tested `f21db5d7fdf36b8ee07c230787af8691859956a9`; B3 original `Spin(9) →* StarAlgEquiv` [#42764649026](https://github.com/etblink/math/actions/runs/42764649026), tested `ac7438a9ae069db323863562c5462f3c59753a22`; T1 original Fock trace + independent trace pairing [#42769361446](https://github.com/etblink/math/actions/runs/42769361446), tested `b05b97260bb56718110f014a1052b54bc74bafa2`. The operator action is **algebraic**; source-parameter continuity, gauge compatibility, original Hamiltonian-domain intertwining, eigenpairs and mass gap are not inferred. See [B3/T1 strict acceptance](BFSS_P2BB3_STRICT_ACCEPTANCE_AND_T1_TRACE_HANDOFF_2026_11_09.md).

**C48-0 candidate:** [run #42775475732](https://github.com/etblink/math/actions/runs/42775475732) on `e41678954b814453a58de6bce116e036158772a2`; **in progress at this revision**, with exact source labels and a 62-blob strict workflow. No acceptance is claimed without the final green cold source, independent consumer, and allowed-axiom receipt. Candidate source: `C48C0OriginalSpinGaugeMajoranaCommutation.lean`. The existing F10F source Spin(9) and G3A/G3B color actions are reindexed using the same original G1A `pairedColorSpinEquiv`. Do not create a different 48-carrier or bypass the source spin/color ordering.

### Active dependency ladder

| Priority / gate | Exact next obligation | Existing reusable interfaces | Acceptance boundary |
| --- | --- | --- | --- |
| **C48-0** (active, pending) | `S_g C_q = C_q S_g` as original `Matrix Source48Label Source48Label ℝ`; original G3B mode coefficients and independent vector consumer | F10F, G1A, G3A/G3B, paired-label crosswalk | **Not qualified** until #42775475732 succeeds; on red diagnose first causal failure only |
| **C48-0B** (next if C48-0 accepted) | `sourceGaugeOriginalPaired48 q = FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q` **on the literal `Fin 24 × Fin 2`** | New C48-0 `_G3B_mode_entry`; S1J `sourceRealMajoranaMatrix_entry`; exact paired `Fin 8 × Fin 2 × ColorIndex` crosswalk | Identity on all source entries with independent consumer; do not identify by matching names or approximate matrices |
| **C48-1A** | Establish the exact intertwining of original C48-0B matrices with `pairedTheta`/active `sourceGammaRealLinear`, preserving coefficient direction | OP3C6C Spin(9) active-gamma covariance, G4G/H original SU(2) Majorana and theta covariance, OP3A original axis crosswalk | Source-exact normalized 48-generator identities; no inferred full-algebra equality |
| **C48-1B** | Extend generator commutation to `α_g ∘ β_q = β_q ∘ α_g` on all original `Fermion 2 →L[ℂ] Fermion 2`, where `β_q(T)=U_q T U_q^{-1}` | Accepted M3I full Clifford/Fock algebra equivalence, C6A/C6C, B3, G4E/H, original Clifford generation | True full operator-algebra commutator, group multiplication orientation and an independent consumer; **does not by itself fix `U_q`** |
| **C48-2** | For fixed `g`, define the *genuine* gauge representation `V_g(q)=α_g(U_q)`, then prove `V_g(q)=U_q` | B3 star action and exact G4E/OP2b gauge unitaries; inspect S1A, S1D, S1G, S1H; T1 trace fallback | Type-check `GaugeGroup 2 →* (Fermion 2 ≃ₗ[ℂ] Fermion 2)`, establish S1H's **literal 48-theta covariance** premise, and independently verify accepted status of S1G/H before invoking them. No scalar-character shortcut is assumed |
| **C48-3** | Conclude `α_g(originalFermionGaugeProjection)=originalFermionGaugeProjection` | Existing `GaugeFixedProjectionOP1.starAlgEquiv_fixed_gaugeFixedProjection`, OP2b `originalGaugeLinearAction`, `originalGaugeContinuousAction`, `originalGaugeOperators_exact` | Requires pointwise `α_g(U_q)=U_q` and exact OP1/OP2b interfaces. No original full boson–fermion physical-space or closed-domain conclusion |
| **HS-0** (parallel, nonblocking) | Package B3/T1 trace-pairing invariance as a genuine unitary action on the finite-dimensional original *operator* Hilbert space | T1 trace and independent pairing, `OAI/LinearAlgebra/MatrixState/HilbertSchmidt.lean` | Operator-level action only; source continuity, original Fock-vector unitary, Cartan weights `M=12`, and physical form still separate |

### C48-2 phase-obstruction decision, with two independent routes

The accepted B3 star map preserves algebra multiplication and Hilbert adjoints, so applying it to each genuine G4E gauge unitary gives a same-order unitary **representation candidate**. The hard step is deriving its exact `pairedTheta` covariance from C48-1B. Commutation of the two conjugation actions alone proves equality **up to scalar**; it does not prove equal implementers.

**Primary reuse route (conditional on verified acceptance):** Source `SU2BFSSPhysicalDomainS1GExactSourceRelativeCharacterTrivialityProbe.lean` contains `original_relativeGaugeScalar_trivial`; `SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean` contains `original_source_gauge_representation_unique`. These are precise **source-defined theorem candidates** for killing the scalar character using genuine SU(2) quarter-turns/curves and Euler factorization. Their file text exists on this branch, but their **standalone historical strict acceptance has not been audited here**. Confirm source, consumer, complete imported closure and tested commit before promoting this route; do not mistake an older source header or `#print axioms` for acceptance.

**Independent T1 route:** If `α_g(U_q)=c_g(q)U_q`, T1 gives `(c_g(q)-1) Tr_F(U_q)=0`. At identity `Tr_F(U_1)=dim_ℂ(Fermion 2)=2^{24}≠0`; continuity of the *original G4E gauge representation* gives a neighborhood of identity on which the trace stays nonzero, so `c_g=1` there. If the genuine source SU(2) is shown connected and generated by every identity neighborhood, the multiplicative scalar character is trivial everywhere. This **local-trace plus connectedness** route may avoid formalizing the full `2^{24}\cos^{16}\theta` character formula. The needed continuity of `Tr_F ∘ U`, finite dimensionality, source SU(2) connectedness and scalar homomorphism still require exact verified interfaces; do not assert the conclusion prematurely. The full exterior character `2^{24}\cos^{16}\theta` remains a secondary independent check.

**Selection rule:** Before opening C48-2, audit S1G/H qualification and exact hypotheses. Select the route with fewer *unqualified* source obligations; preserve the other as a negative/independent cross-check, not a duplicate long proof campaign. Do not raise Lean proof budgets or introduce new axioms to evade a missing source bridge.

### Scientific boundaries and documentation discipline

- The gauge operator `U_q` is the **actual original** G4E/OP2b `Fermion 2` unitary, not an abstract implementer with an unproved identification. An original 48×48 matrix commutator is neither Fock-level commutation nor invariance of the original gauge projection.
- The fixed projection is **fermionic**, not automatically the complete gauge-physical projection in the bosonic × fermionic Hilbert space. Any supercharge or closed-Hamiltonian form covariance must be handled on the correct source Hilbert carrier and domains in lane P.
- Preserve the distinction between the **operator** weight bound `M=12` and the Fock-vector candidate `M=6`. HS-0 cannot establish either bound by itself.
- Do not silently elevate older staged `S1V52L9E5F14/F15/F18C` Spin(48) sources to qualified status. Distinguish a file's meaningful mathematical candidate from an independent cold CI acceptance record.
- Keep the original R/A/P roadmap and its falsification/physical-domain obligations intact. This addendum **overrides only the immediate representation-to-gauge proof queue**. Every resulting accepted/red gate requires exact hashes, independent consumers, failures, and a handoff update.

**Active companion handoff:** [C48-0 research and verification ledger](BFSS_C48C0_ORIGINAL_SPIN_GAUGE_48_COMMUTATION_HANDOFF_2026_11_09.md). **Computational negative controls:** [original Fock SU(2)/Spin(9) Python research](BFSS_ORIGINAL_FOCK_SU2_SPIN9_PYTHON_FORWARD_RESEARCH_2026_11_09.md). All statements here are roadmap decisions unless backed by the individual green receipts above.

## 9. Acceptance checkpoint — C48-0 qualified, C48-0B launched

**C48-0 accepted:** Exact original Spin(9) vs G3A/G3B SU(2) real 48-source-label matrix commutation on the G1A paired Fock-majorana index, with source coefficients, identity, multiplication, original-vector consumer and allowed axioms. Strict-green [#42779878513](https://github.com/etblink/math/actions/runs/42779878513), tested commit `b9bc56747d22ba2dae721aff91b47f6e7c2ce1b9`, 62 frozen Git blob hashes, accepted-marker `C48C0_ORIGINAL_SPIN_GAUGE_48_INDEPENDENT_STRICT_PASS`, evidence digest `sha256:d4c70877ff9ebb2a1c7f35c82a30e855d97ade66828779f2f644f67d2060c528`. The initial source reindexing error and subsequent unused-simp strict warning are preserved in the [C48 handoff](BFSS_C48C0_ORIGINAL_SPIN_GAUGE_48_COMMUTATION_HANDOFF_2026_11_09.md), Sections 7–9.

**C48-0B pending:** Exact identity between the accepted C48-0 new matrix and the independently existing, actual original SU(2) source-majorana matrix `S1J.sourceRealMajoranaMatrix` at literal `Fin 24 × Fin 2`. Separate source declarations prove paired color/spin-to-mode/real-label crosswalk and all-entries equality; independent consumer applies the existing C48-0 commutator **to S1J**. New strict workflow has 67 pins: accepted C48-0's 62 plus S1J/S1C/G3C ancestry and two new source/consumer roots. Source/consumer commits `df5ffbaafaba277ee0ff64d7cd6abdeffe92e498` and `2f6c8cf45b1216b016bb16250fe731be12e4ee4e`; workflow self-trigger preflight repair `4ff4a5f04940eb331f90e86da37dcb5993db4c7b`. Candidate [#42782411960](https://github.com/etblink/math/actions/runs/42782411960) was **IN PROGRESS at this checkpoint**. No C48-0B acceptance before a clean final `C48C0B_ACTUAL_S1J_GAUGE_IDENTITY_INDEPENDENT_STRICT_PASS`.

**Near-term dependency order unchanged:** C48-0B source identity → C48-1A original paired-theta/gamma covariance crosswalk → C48-1B Fock-operator conjugation-action commutation → C48-2 **genuine** SU(2) gauge-operator fixedness by audited S1G/S1H uniqueness or exact T1 trace+continuity fallback → C48-3 OP1/OP2b original **fermionic** gauge projection fixedness. In parallel, HS-0 can package accepted B3/T1 Hilbert–Schmidt operator action, without conflating it with full physical Hamiltonian or Fock-vector representation.

**Stop line:** A matrix commutator does not discharge phase obstructions, source continuity, original unbounded operator domains, whole physical gauge projection or spectral confinement. C48-0B is a separate genuine-source binding, not a logical restatement or retroactive expansion of C48-0.

## 10. C48-0B strict acceptance and next bounded generator gate

**C48-0B accepted:** [#42787913738](https://github.com/etblink/math/actions/runs/42787913738), exact tested `153db2527bdc8b3bc2e57eff6ccba55f2e5e6fd0`, **all 67 frozen blobs, cold source, independent consumer, strict warning and clean allowed-axiom gates green**. Final `C48C0B_ACTUAL_S1J_GAUGE_IDENTITY_INDEPENDENT_STRICT_PASS`; evidence artifact `sha256:c26f392a938a772d4fafdc7f28057739fd17fd2a1adccc67d5577764838724d5`.

The qualified theorem equates C48-0's original 48-Majorana gauge color matrix to the preexisting S1J source-real Majorana gauge matrix, then the independent consumer demonstrates true Spin(9) / **S1J original SU(2)** source-matrix commutation. The previous C48-0B reds are preserved as negative procedural knowledge in the C48 handoff, Sections 11–13.

**Next bounded step C48-1A0:** Before proving G4H's full SU(2) conjugation action on the active normalized gamma map, reuse accepted OP3C6C `source9Spin_originalFockOperatorAutomorphismHom_activeGamma` and accepted C48-0B to show a precise original-Fock-*operator* identity
```text
  α_g(Γ(C_q · v)) = Γ(C_q · (S_g · v)).
```
Here `Γ=sourceGammaRealLinear` is the actual original normalized Fock Majorana map, `S_g` is the accepted original F10F source Spin9 matrix and `C_q` is the **independently existing S1J source gauge** matrix. This formula requires no new Fock-vector Spin9 implementer; the SU2 unitary `U_q` itself does not occur and its desired conjugation law remains the next C48-1A1 obligation. Prove with the exact C48-0B matrix commutator and the accepted OP3C6C active-gamma theorem, independently consume it on original `Source48Vector` and source-coordinate axes. Do not substitute an arbitrary tensor model or infer `Ad(U_q)` commutation yet.

**Then C48-1A1:** Prove `U_q Γ(v)=Γ(C_q v)U_q` on all source vectors, using actual G4H paired-theta field covariance and sourceNormalizedGamma/sourceGammaRealLinear's exact `√2` normalization. Only after both formulae are qualified should C48-1B attempt full-algebra equality of `α_g` with SU(2) conjugation via original Clifford/Fock generation.

The C48-2 S1G/H uniqueness or T1 trace-continuity fallback, C48-3 original fermionic projection, and original Hamiltonian analytical and spectral obligations remain unchanged. The Standard Model, gravity and dark-matter **feasibility conversations are exploratory parallel research and do not amend these BFSS verification gates**.

## 11. C48-1A0 strict acceptance; genuine SU(2) Fock-unitary axis next

**C48-1A0 accepted:** [run #42798054277](https://github.com/etblink/math/actions/runs/42798054277) (tested commit `5115e9d2178550f3333d83e8fbdbb6f414e5a4cd`), cold 9,167-job build, all 69 exact blobs, true original normalized-gamma Fock operator action, source and independent consumer compiled with clean allowed-axiom audits, final marker `C48C1A0_ORIGINAL_GAMMA_S1J_INDEPENDENT_STRICT_PASS`, evidence SHA-256 `4457ac2e3376696285b8e7e869914907d16022e6d9896c47b0163b6e768c698e`. It is **operator-gamma compatibility with source S1J**, *not* the Fock SU(2) unitary covariance result.

**C48-1A1a pending:** use existing true G4H source `pairedAlgebraData_fermion_adjoint` and OP3A original gamma-source index normalization to prove the exact source-axis formula `U_q Γ(e_(j,s,A))ψ = Σ_B R(q) B A · Γ(e_(j,s,B))(U_q ψ)`. New source [`feb1c3df`](https://github.com/etblink/math/commit/feb1c3df7f21fce6dfa1a7f9abcac49a291c85ea), independent consumer [`3a8a97ee`](https://github.com/etblink/math/commit/3a8a97ee11669fa4a18119271afc9a7bcbbc8b95), 80-pin strict workflow [`d81d1d82`](https://github.com/etblink/math/commit/d81d1d8246016f917b5ef436f353b3e6d0c4b594). New [run #42802526685](https://github.com/etblink/math/actions/runs/42802526685) was **IN PROGRESS at this checkpoint**. No qualification before independent consumer and `C48C1A1a_ORIGINAL_G4H_FOCK_AXIS_INDEPENDENT_STRICT_PASS`.

**Next sequence remains bounded:** C48-1A1b source all-vector S1J matrix covariance → compare whole-algebra route R1 versus B3-star/S1H uniqueness route R2 → rigorous true gauge-implementer fixedness → OP1/OP2b original fermionic projection. The simultaneously preserved original Spin(8) rank/projector and GUT/ToE feasibility programs do not establish any 4D physical particle sector and do not change these strict BFSS gates.
