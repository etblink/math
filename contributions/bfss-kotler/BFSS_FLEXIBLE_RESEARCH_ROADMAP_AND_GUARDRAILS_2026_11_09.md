# BFSS — flexible research roadmap and decision guardrails

**Operational status:** PROPOSED LIVING ROADMAP / NO NEW MATHEMATICAL ACCEPTANCE  
**Date:** 2026-11-09  
**Repository and working branch:** `etblink/math`, `integration/bfss-unified-research-20261108`  
**Research provenance:** `etblink/Foundational-Convergence-Program` and pinned, independently requalified imports  
**Baseline for this roadmap:** `263a8b85661ad786e4cec1a137100822b9145e5c`  
**Lean / Mathlib pin:** Lean `4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`

> **Operating principle:** Seek the truth, not a green workflow. Preserve proven source-faithful mathematics, preserve every informative failure, and change research routes when evidence warrants. A green qualifies only the exact checked declaration, tested commit, dependencies, consumers and gate contract; it does not qualify a downstream scientific claim.

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

## 8. Immediate execution order and handoff contract

**Next bounded task: R0 → R1 / OP3-A generator-axis crosswalk.**

1. **Read-only preparation:** Confirm the accepted donor M2/M3I source and current branch provenance, active Fock gamma and paired-label source, actual equality of relevant normalized generators, and exact import closure. Inspect the already present `SU2PairedThetaLabelCrosswalkProbe`, `SU2BFSSPhysicalDomainS1V7OriginalSourceSixteenBlockLabelBridgeProbe`, `SU2BFSSSource48FockIndexBridgeProbe`, donor `S1V52L9E2/L9E4/M2/M3I`, and active `SU2BFSSSource48NormalizedFockGammaProbe` / `SU2BFSSSource48RealLinearGammaProbe`. Trust exact checked proof bodies, not stale source header labels.
2. **One precise candidate:** Original-source axis theorem `Γ_donor(e_p) = Γ_active(e_p) = (√2 : ℂ) • θ_p` at the **genuine** `Source48Label`, or equivalent `(Fin 8 × Fin 2 × ColorIndex 2)` axes with explicit label equivalence. Separate donor-to-active scalar/label theorem from the Clifford universal generator application if needed. Verify actual equality before asking for full linear-map equality.
3. **Minimal strict gate:** Freeze all source blobs; compile only the required closure and new lemma, import it independently at the exact original Fock operator type, inspect exact theorem roots and fail-closed diagnostics; do not change F1F C1/C1b. If this source crosswalk is accepted, proceed to R2. If not, preserve the first causal error and choose one narrower source/label experiment or hold.

**Project Lead autonomy:** Execute bounded, authorized source-faithful proof and documentation tasks that meet this contract; do not presume authorization for changing physical assumptions, weakening acceptance rules, destructive cleanup, merging into main, external publication, or downstream scientific claim promotion. Keep the owner informed of branch, exact run ID, evidence status and why the next gate matters.

**Success is not “many green runs.” Success is eliminating essential uncertainty without losing the truth of the original model.**
