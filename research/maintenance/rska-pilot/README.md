# Relational Scientific Knowledge Architecture (RSKA) — pilot v0.1

**Isolated branch** `research/rska-pilot-20261128`, baseline `2e0bcc98de5514498cb6f03727a355e8f504260d`. Main remains canonical. No new mathematics, CI, Lean qualification, upstream merge, historical file relocation, or proof-status migration. This is an additive, reversible pilot for research discovery; merge requires owner review.

## Structural charter

- Incidence Before Identity: use stable scoped record IDs and typed relationships; classification and directory placement are views, not identities. No equivalence inferred from similar titles or shared roots.
- Protected persistence: keep the original atlas and evidence immutable in this pilot; source pins are Git blob identities. Preserve all scope limitations, REDs, cancellations, and historical labels. Never infer current qualification from a matching file alone.
- Nested structure: local research programs may share records and expose explicit interfaces. This is an organizational analogy, not a proven mathematical fibration.
- SCC-inspired separation: keep assumptions, claim, evidence, transformations, dependency routes and presentation distinct; separate a source-bound assertion from its verification method. Do not claim a mathematical identification with SCC.
- Witness completeness as a design goal: each added record and annotation must link pinned provenance; that does not certify evidential sufficiency.
- Truth-first: negative knowledge constrains routes and is searchable; no status propagation or proof inference from a graph.

## Representation and workflow

The authoritative inherited records are the 168 entries in Atlas V7, referenced directly. No copying or rewriting existing records. Overlay IDs are new only for distinct scoped records; they are provisional identifiers, not hashes of mathematical content. A route is a target plus an AND-list of editorial prerequisite records. Multiple named routes to an objective are alternatives; they need not be equivalent. A complete graph of logical implication is not claimed. Existing lexical import edges remain separate from editorial links. Non-entailing typed annotations are supports, limits, replacement_for and scope_update, with explicit evidence/scope. Only prerequisite lists are traversed. Scope updates flag later receipts without editing historical statements. Negative context is displayed even when not in prerequisite traversal. Evidence paths and Git blob IDs bind exact inputs at baseline. No broad taxonomy migration yet.

- [Overlay](overlay.json): 12 scoped records, candidate route, typed annotations, evidence pins.
- [Executable checker and query CLI](pilot.mjs): dependency closure, donor reuse, declaration lookup, exact input byte hashing and negative tests; Node standard library only.
- [Generated results](results.json): report plus adversarial controls.

From repository root, run:
```sh
node research/maintenance/rska-pilot/pilot.mjs check
node research/maintenance/rska-pilot/pilot.mjs reuse E08-LB1C1
node research/maintenance/rska-pilot/pilot.mjs route PE-EXIST atlas-v7
node research/maintenance/rska-pilot/pilot.mjs route PE-EXIST compact-reduced52
node research/maintenance/rska-pilot/pilot.mjs lookup FCP.BFSSCSQF2.paired_native_common_square
```

## First trial

Compare historical editorial existence reachability (77) with curated proposed compact-flow/reduced-52 route (75); shared 59, baseline-only 18, candidate-only 16. These are indexed record counts, **not measures of proof length, workload, proof completeness or dependency minimality**. The two routes differ both in symmetry and witness; the new route was taken from the November 28 memo, not discovered autonomously. The query independently exposes which recorded requirements differ and which qualified donors recur (e.g. E08-LB1C1 connects both physical covariance and Lie-defect reuse; PE-SQUARE serves both Hardy and fidelity). Negative context retrieves GM2A's nonimplication and the stopped ICD0 replacement. The later rank-three receipt is indexed as a scope update, not a qualification promotion.

The report and all 9 negative controls were executed in the isolated JavaScript tool environment using the same pure functions embedded in pilot.mjs and connector-reported blob IDs. The Node wrapper and local file hashing are provided for reproducible checkout-local execution but have not yet been separately run. GitHub blob IDs checked via connector fetches, no independent raw artifact checks. No CI or Lean.

## Merge decision criteria

1. Preserve original input bytes, every inherited scope/status and baseline reachability; reproduce checker locally.
2. Demonstrate a useful nontrivial retrieval across tracks and a route comparison without claiming implication or requalification; compare against existing atlas for actual marginal benefit.
3. Validate evidence and source reference resolution and negative knowledge visibility. Review each new route edge for scientific adequacy and whether it is an actual requirement or just editorial support.
4. Test a second, genuinely different research objective using the same schema without rewriting it. Do not broaden or restructure the tree until benefit is demonstrated.
5. Obtain explicit owner acceptance before merge. If results fail these criteria, preserve branch as negative methodological evidence and do not merge.

A small pilot is successful only if it improves actual research decisions. A growing graph by itself is not success.
