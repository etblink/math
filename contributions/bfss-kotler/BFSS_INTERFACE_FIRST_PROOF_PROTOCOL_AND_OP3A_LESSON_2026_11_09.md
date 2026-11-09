# BFSS methodological lesson — Interface-First Proof Protocol (IFPP) v1.0

**Date:** 2026-11-09  
**Type:** durable research-methodology and negative-knowledge memorandum  
**Repository:** `etblink/math`; branch `integration/bfss-unified-research-20261108`  
**Evidence baseline:** `94fb83a1d4273a15097653039a4550839a248b0e`  
**Status:** METHODOLOGY ONLY. This memorandum accepts **no new mathematical theorem**, modifies **no source definition**, and makes **no new CI qualification**. Preserve independently qualified facts and exact source semantics.

> **Recover before rebuilding. Identify before equating. Prove small interfaces before large constructions. Never mistake compilation success for scientific completion.**

## 1. Why the lesson matters

The BFSS project has moved from discovering isolated source identities to integrating independently developed, independently qualified formal mathematics. Two constructions can use the same mathematical idea, carrier dimension, and Clifford normalization yet not be *known* by Lean to represent the same object. Namespaces, source-index equivalences, basis packing, operator conventions, coercions, action orientations, and closed-domain hypotheses are mathematical *interfaces*, not administrative details.

An imported theorem is not automatically an interoperability theorem. Before claiming a relationship between previously qualified results, **prove that they share the same original object or explicitly construct and verify an intertwiner.**

A short interface theorem can be more valuable to the spectral program than a larger isolated result if it removes a genuine dependency barrier. Conversely, a mathematically false source correspondence is valuable negative knowledge: never force two carriers to coincide by postulating an equivalence, altering a normalization, changing the original Hamiltonian, or hiding a mismatch in elaboration.

**Project-level test:** For each proposed gate, ask *what essential uncertainty, dependency edge, or falsifiable physical hypothesis will this remove?* Do not measure success by the green-run count.

## 2. Exact motivating evidence: OP3-A1

The intended theorem was the original-coordinate-axis equality of historical and active normalized Fock gamma operators, and ultimately their real-linear gamma maps:
`Γ_donor(e_p) = Γ_active(e_p) = √2 · θ_p`, with the source's **positive** `√2`, delta-one CAR, exact 48 paired labels, original `Fermion 2` and no substitute model.

| Run / tested commit | First causal diagnostic | What it actually taught us | Qualification |
| --- | --- | --- | --- |
| [#42661987249](https://github.com/etblink/math/actions/runs/42661987249), `ef31c905ceb42e828a194a8de0198406fca73547` | A rewrite left `BFSSSU2GaugeG1A.pairedTheta` versus `BFSSPairedThetaLabelCrosswalk.pairedTheta`, different qualified namespaces | A theorem relating *active source Majorana* to crosswalk `pairedTheta` did not itself identify the historical donor's separately named `pairedTheta` | RED; no new theorem admitted; `sorryAx` from error recovery |
| [#42665490584](https://github.com/etblink/math/actions/runs/42665490584), `57cda033ea2adb4c38da8cb479cbd58043c675d1` | Isolated paired-label equality reduced to `G1A.colorModeEquiv (j,A) = Crosswalk.colorModeEquiv (j,A)`; two `Unknown identifier majoranaCandidate` errors | Separate **definition-level color/mode packing** from **namespace visibility**; two individually imported definitions are both `finProdFinEquiv`, but the proof had not finished the last reduction; original Fock operator name required the already existing namespace | RED; preflight, pinned toolchain and donor parents passed; no new theorem admitted |
| [#42668302044](https://github.com/etblink/math/actions/runs/42668302044), `94fb83a1d4273a15097653039a4550839a248b0e` | Explicit `rfl` after reducing label definitions; `open FCP.BFSSFermionF2` for source `majoranaCandidate` | A bounded verification experiment based on the first causal errors, with the **same three theorem statements and exact strict criteria** | **IN PROGRESS at memorandum baseline**. Never infer green or mathematical acceptance from a candidate |

Exact details and artifact hashes live in [the OP3-A R0/OP3-A1 evidence ledger](BFSS_OP3A_R0_INVENTORY_AND_R1A_SOURCE_AXIS_GATE_2026_11_09.md). This table is a lesson in proof interfaces, **not** an assertion that the most recent repair qualifies.

Two earlier F1F whole-concrete-map failures add an important different mechanism: [C1 red #42645848109](https://github.com/etblink/math/actions/runs/42645848109) hit Lean recursion at large definitional `change`; [C1b red #42648725215](https://github.com/etblink/math/actions/runs/42648725215) also recursed after explicit matrix equality and `congrArg` transport. These were **not** missing-namespace errors and should **not** be fixed by cycling through `rw`/`simpa`/`change`/`exact` or increasing recursion budgets. The accepted [C3 #42651438879](https://github.com/etblink/math/actions/runs/42651438879) instead separated the abstract symbolic transport from the genuine F1E source-matrix identity. [C4 #42654797722](https://github.com/etblink/math/actions/runs/42654797722) advanced an independent original-CAR pair algebra fact. Both deliberately leave concrete F1F production equality open.

A complementary inventory lesson: source-exact complex Clifford/Fock `AlgEquiv` **M3I was already qualified** in [#42547700192](https://github.com/etblink/math/actions/runs/42547700192). Recovering that accepted component spared an unnecessary proposed donor re-import. **Inventory and qualification retrieval precede rebuilding.**

## 3. Interface-First Proof Protocol — REQUIRED before a new expensive Lean gate

### Phase I — Inventory and semantic contract (read-only)

1. **Specify the goal and relevance.** Write the exact intended theorem, the physical/scientific dependency it discharges, and what it explicitly **does not** establish. If it does not shorten an essential dependency or resolve a real uncertainty, consider postponing it.
2. **Retrieve before redefining.** Search active and provenance branches, the large OAI Lean inventory, previous notes, strict workflow manifests, independent consumers, and green/red histories for prior implementations. Inspect exact remote HEAD and file Git blobs. Check the existing qualified theorem rather than reproducing a similar unqualified definition.
3. **Record the interface contract** before writing a proof. Capture: fully qualified declaration names, **actual types** and universes, original source carriers, basis/index permutations, colors and spin blocks, coefficient fields, normalizations and signs, coercions, group-law orientation, topology, adjoints/star, gauge action and physical domains as applicable. Label every correspondence either `definitionally equal`, `previously proved`, `proposed bridge`, or `possibly incompatible`.
4. **Write a source crosswalk**, including both sides' actual definitions and imported proof roots, not just similar mathematical notation. Identify the first unproved arrow in the diagram.

### Phase II — Dependency ladder and smallest test

5. **Decompose before compounding.** Prefer `exact label equality → pointwise source object equality → scalar/sign normalization → axis evaluation → map equality on arbitrary vectors → AlgebraHom/AlgEquiv → group action → closed physical-domain theorem`. Reorder or omit arrows if a different mathematically valid interface is better, but never silently skip one.
6. **Attack the smallest unsettled carrier.** Prove a label identity on `Fin`/equivalences before a continuous-linear operator equality; a source-axis theorem before a 48-term finite sum; a symbolic/abstract transport lemma before its concrete Fock specialization. Use the already accepted parent theorem rather than unfolding huge source operators.
7. **Do cheap local/preflight validation where feasible.** Check exact imports and namespaces, source declarations and theorem type via `#check`, minimal proof sketches, source-hash diffs, and a small standalone diagnostic before queuing cold expensive CI. A host with no local Lean build can still perform rigorous source-level inspection; **do not claim compilation happened until it did**.
8. **Keep one principal new scientific obligation per strict gate.** Auxiliary label/normalization lemmas may be introduced as independently named roots when necessary; do not mix a full representation action, star involution and spectral theorem in one candidate.

### Phase III — Strict evidence and promotion

9. **Freeze the original sources.** Use the exact tested commit, Lean/Mathlib pins, original definition blobs and consumer blobs; no convenient surrogate BFSS Hamiltonian, Clifford representation, basis order or Majorana scaling. Follow branch-head compare-and-swap for writes.
10. **Qualify the *claimed* interface**, not a weaker type-shaped surrogate. Require cold source build, an independent consumer at the genuine original type, exact `#print axioms` root enumeration, fail-closed error/`sorryAx`/source warning checks, retained receipt and run/artifact identity. Caches are optimization, never independent acceptance.
11. **Promote only after completion.** Use `QUALIFIED`, `CONDITIONAL`, `EXPLORATORY`, `BLOCKED`, `REJECTED` as separate statuses. A green validates its exact theorem/commit and permitted axioms; it does **not** automatically imply source covariance, star preservation, continuity, gauge commutation, domain identification, coercivity or positive spectrum.

### Phase IV — Diagnostic feedback and disciplined pivots

12. **Read the first causal compiler/log diagnostic**, not the terminal red badge or error-recovery `sorryAx` alone. Classify: unresolved mathematical assumption; source-label or normalization mismatch; namespace/import; API/instance/coercion; definitional-reduction/recursion; CI/pin/environment; or valid counterexample.
13. **One bounded evidence-based repair** is reasonable for a localized proof/namespace/CI fault. After **two reds with substantially the same underlying mechanism**, stop variants and require an explicit architecture review, new interface, or `HOLD`. Never raise `maxRecDepth`, heartbeats or axiom allowances merely to make a red disappear.
14. **Preserve negative knowledge append-only**, including test commit, file/line, exact remaining goal, accepted parents, failed technique, why it failed, and what was **not** disproved. Compare with previous green procedures and rejected approaches before choosing the next path.
15. **Change the proof architecture, not the physics**, when large equality reduction is the blocker. Separate symbolic transport and source identity, establish a basis or pointwise interface, or use a previously qualified universal property. If source conventions genuinely conflict, expose the conflict and do **not** manufacture an intertwiner.
16. **Review value, not velocity.** After each acceptance, ask whether the gate unlocks a larger representation/physical theorem, admits a reusable module interface, or rules out a hypothesis. Archive legitimate but noncritical lemmas without inflating their scientific scope.

## 4. Reusable interface record template

For each significant theorem-to-theorem connection, record:

| Field | Required evidence |
| --- | --- |
| Source A and source B | Exact fully qualified names, repository paths, tested Git blobs, accepted run/consumer refs or explicit `not qualified` |
| Carriers and semantics | Types, field, source labels/basis permutation, scalar factors, Majorana CAR, center/sign, source gauge and closed domain when relevant |
| Interface claim | Exact `A = B`, commutative square, homomorphism, intertwiner, or a stated conditional hypothesis |
| Evidence status | Definitionally equal / independently proven / candidate / blocked / refuted; commit and root |
| Minimal predecessor ladder | Specific earlier theorems; first missing source crosswalk |
| Consumer | Imported *original* typed example/theorem, not an unrelated abstract stand-in |
| Failure behavior | First causal error, reproducibility, red-run IDs, next discriminating test |
| Downstream use | Precisely which R/A/P roadmap milestone it enables and which claims remain open |

## 5. Immediate application to OP3 and the spectral roadmap

Before **OP3-A2** (M2/M3I complex Clifford generator-to-active-gamma), recover the full exact interface: `sourceBlockColorLabel`, both **distinct namespace** `spinPairEquiv` and `colorModeEquiv` definitions, the two source `pairedTheta` definitions, donor `originalNormalizedFockMajorana`, active `sourceNormalizedGamma`, donor and active `Source48Vector →ₗ[ℝ] FockOp` maps, and the M2 `originalComplexCliffordFockAlgHom_generator` under the base-changed Clifford input. Check the positive `√2` factor and the **source** `Q(e)=1`.

Only after their small source-axis compatibility is independently strict-qualified should OP3-A2 combine the M2/M3I image of an actual `CliffordAlgebra.ι` coordinate with `sourceNormalizedGamma`. Defer any whole-map equality unless a source-basis proof yields a demonstrated lower-reduction interface.

Then preserve the separate downstream gates for original Spin(9) quadratic isometry, Clifford automorphism, global operator action, involution/star preservation, central parity, continuity, gauge compatibility and original physical Hamiltonian domain. The analytical whole-sector exclusion remains **conditional**, with full-operator weight bound **M = 12**. These interfaces cannot be assumed to commute simply because each component compiles.

## 6. Adoption and provenance

This protocol **supplements** the [bounded-execution protocol](BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md), the [flexible roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md) and the [OP3-A evidence memorandum](BFSS_OP3A_R0_INVENTORY_AND_R1A_SOURCE_AXIS_GATE_2026_11_09.md). It does not alter frozen source definitions, CI acceptance, or original scientific assumptions. Integrate the checklist into the planning of subsequent work; use the code/review gates already established.

**Practical guiding question:** *Which previously disconnected pieces of source-faithful mathematical knowledge can now be used together—and have we actually proved their compatibility?*
