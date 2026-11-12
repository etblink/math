# BFSS Pre-Gate Evidence Receipt — source retrieval before new Lean work

**Adopted:** November 12, 2026. **Status:** Project Lead operating procedure; not a new Lean theorem, CI workflow, or automatic enforcement mechanism.
**Scope:** all new BFSS mathematical gates on integration/bfss-unified-research-20261108; also the discovery phase of future upstream contribution gates. Preserve main, prior branches and the original source definitions.

## Decision

Before implementing a NEW mathematical source theorem or launching its first strict gate, the Project Lead must have a concise **Pre-Gate Evidence Receipt** either in the gate's existing research memorandum (explicitly labelled as such) or as a short standalone file. No separate bureaucracy is needed when a current memorandum already contains all required fields.

The receipt is a **go/no-go decision**, not a search transcript. It shows that project history, original source interfaces and negative evidence were actually examined. A mere assertion "searched prior work" is insufficient.

Do not add an automated check, GitHub app, dashboard or new registry. Git history, exact source blobs and the existing strict compiler/consumer are canonical; this procedure changes behavior, not proof standards.

## A. Minimum receipt fields

1. **Exact mathematical contract:** Lean target name/type, physical carrier and source identity, dimensions, normalizations, hypotheses, expected conclusion, and exclusions. Include a statement of what it does *not* prove, particularly physical-domain and spectral ceilings.
2. **Search scope performed:** named original BFSS source files and sibling modules; the chronological gate notes and historical red/green corpus; H1/H2 and project map; archived FCP/original branches where applicable; pinned Mathlib source for uncertain APIs; and optional upstream inventory when relevant. Mark which were actually inspected and which were unavailable. Do not falsely claim exhaustive coverage.
3. **Candidate evidence matrix:** for each plausible predecessor, exact declaration, repo, branch or tested commit, source path and Git blob (if known), strict green run or precise lesser status, mathematical type match/mismatch, and disposition. Categories: DIRECT REUSE, EXACT ADAPTER, METHOD ONLY, UNQUALIFIED, NEGATIVE PRECEDENT, or NOT APPLICABLE.
4. **Negative knowledge:** previously attempted bad methods, first causal errors, red run IDs, and the smallest accepted repair pattern; do not conflate source/compiler red, consumer-only warning red, preflight red, toolchain red, and falsification.
5. **Novelty justification:** identify the single genuinely missing *type-level interface* after existing source lemmas are used. If direct reuse works, new proof construction is prohibited; prefer an independent consumer of the old result or an explicit small adapter if needed.
6. **One bounded proof plan:** smallest imports, theorem dependencies, separate consumer obligations, exact source blob-pins and toolchain, warning-as-error/axiom criteria, expected tested CI workflow, rollback/stop condition. If the first target is only a microgate, name the later unqualified bridge explicitly.
7. **Decision and owner:** Project Lead GO / HOLD / NO NEW PROOF, with short justification; link to a date-stamped receipt. A future strict GREEN changes qualification status, not the original retrieval record.

## B. Reproducible search sequence

**First, search actual declarations, not just titles or repository names.** Start with the type signature and related mathematical synonyms, then look for matching imports in the current original BFSS source (including MassiveMoments, ProfileEnergy, DeformedCharge, MixedEnergy and source Kontrib modules when relevant). Search across the pinned active integration ref, not only a default-branch GitHub code index.

**Second, retrieve historical chronology.** Read the evergreen reuse ledger, the 21-record qualified evidence map, H1/H2, the 99-branch locator, and archived FCP notes. The existing tools are available in contributions/bfss-kotler/tools. Examples for a local checkout:

    python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "integrable fermion density" --include-lean
    python3 contributions/bfss-kotler/tools/historical_gate_lookup.py --query "concrete source recursion" --notes-dir contributions/bfss-kotler --limit 12
    python3 contributions/bfss-kotler/tools/h1_evidence_registry.py --search "original Hamiltonian core form"
    git grep -n -e "bosonic_core_integrable" -e "fermion_core_integrable" integration/bfss-unified-research-20261108 -- lean/
    git log --all -- lean/OAI/MathematicalPhysics/BFSS/MassiveMoments.lean
    git show <tested-commit>:<known-source-path>

The GitHub search endpoint may not index the private/nondefault corpus and may return no matches. **Zero search results do not mean no existing theorem.** Prefer exact repository tree traversal, local git grep and historical documents. For FCP, use the actual FCP checkout or its pinned archived source snapshots; never silently claim that local copied branches cover every historical FCP ref. A standalone report may be produced even without a local checkout, but explicitly record method and coverage.

**Third, verify provenance and exact types.** H1/H2, dated memos, names and source-file presence are DISCOVERY only. The source declaration must actually exist at the cited SHA; any claim of accepted status must name the exact tested commit, workflow run, distinct source/consumer, permitted axioms and strict acceptance receipt. An imported source module that compiled as ancestry supports availability; do not automatically claim each named theorem has been separately audited as an independent root.

**Fourth, choose the smallest solution:** direct imported lemma > exact source-typed adapter > small generic lemma already proven > novel proof. Avoid reimplementing source lemmas merely because their names are not in the new namespace. Before changing source physics, make the precise hypothesis and definition correspondence explicit.

## C. Red-to-remedy escalation

Classify the FIRST causal red before editing. If source proof and axiom audit passed and only consumer/linter failed, repair ONLY consumer or verifier as appropriate; do not touch theorem bytes. If a parsed-source/import pin or workflow preflight failed, repair THAT layer first.

After **two reds with the same mathematical target and similar elaboration failures**, suspend tactic cycling. Re-read the receipt; re-open the historic accepted proof and its exact target type; run a narrow API diagnostic or separate microgate. If after another bounded microgate a type conversion remains unresolved, pause new source changes and audit the source import/declaration interface. Never raise maxRecDepth/maxHeartbeats to bypass an unresolved source mismatch and never weaken the original theorem, axioms or independent consumer.

A NEW proof theorem can resume only after the receipt states: prior candidate reused/rejected and why; current first causal failure; actual missing interface. A consumer-only correction to an already passing source gate may use the existing red memo as this receipt rather than duplicate paperwork.

## D. Reusable pre-gate receipt template

Copy this into the new gate's research memo, not necessarily a new file:

    ## Pre-Gate Evidence Receipt — [gate ID] — [date]
    Target declaration and exact full type:
    Source carrier, normalization, assumptions, exclusions:
    Repo/branch and intended base SHA:
    Retrieval actually performed (commands/paths, plus unavailable):
    Evidence: [candidate declaration | source blob/commit | qualified run or partial status | type comparison | disposition]
    Negative results and causal red references:
    Existing reusable theorem(s) and any exact adapter needed:
    Smallest new missing interface (or "NONE"):
    Minimal source import / independent consumer / pinned CI / axiom contract:
    Project Lead GO, HOLD, or NO NEW PROOF; reason:
    Acceptance follow-up: exact green tested SHA/run, failure digest, or pending:

The receipt should be short where there is simple direct reuse, detailed only when source paths disagree or prior failures are numerous. Do not create a new global approval step requiring the user to repeat "continue" after every ordinary qualification.

## E. Worked case, decision and measurable follow-through

**P2-C4B case:** Original public AlgebraData.bosonic_core_integrable and fermion_core_integrable already exist in MassiveMoments.lean (blob 2fd223d0da1a85c3be52bb2b9c68f4f12d10957e). Their add combination and Pi.add_apply precedents also exist there, and ProfileEnergy.coreEnergyDensity_integral consumes the same lemmas. DeformedCharge.averaged_core_energy contained only local variants. A separate M0 exact originalActualDensity function equality SOURCE-COMPILED, allowed-axiom clean at #43227613296, but its independent consumer failed a style warning; M0 itself is unqualified pending the new strict run #43232000116. See the [filled active receipt](../../research/spectral-p2-original-field/P2C4B_PRE_GATE_SOURCE_REUSE_RECEIPT_2026_11_12.md).

The incident is not evidence that more registries are needed. It is evidence that existing reference procedures were not enforced before proof design. Hold the full C4B proof while M0 runs; upon green, reuse MassiveMoments plus M0 equality in a small originalActualDensity_integrable repair, then independently strict qualify full C4B.

**Success measurement for the next three NEW mathematical gates:** each has a pre-gate receipt completed before the first new theorem/consumer commit; each named reusable theorem has verified source types and evidence status; each repeated red is classified at its first failure layer; no proof is duplicated without an explicit type/namespace mismatch justification. Review these three receipts before deciding whether any automation is worth the extra cost.

**Boundaries:** documentation is not Lean evidence, source compilation is not full consumer qualification, P2-C4B does not establish the closed original BFSS high-Spin sector or positive eigenpairs, and no classical GUT/ToE proposal is promoted by this process.
