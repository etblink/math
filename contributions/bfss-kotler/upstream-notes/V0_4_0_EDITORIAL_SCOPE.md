# BFSS v0.4.0 — editorial scope and evidence map

**Working decision, 2026-11-04: prepare v0.4.0.** This is a scope/outline for a new review draft, not a completed manuscript or permission to publish. The owner offered v0.3.1 or v0.4.0; the substantial accepted post-v0.3.0 geometry makes v0.4.0 the clearer designation. The public-submission hold remains in force.

A v0.3.1 would suit a correction-only edition preserving the old research cutoff. The current work changes several statements that v0.3.0 correctly left open at its dated cutoff. Fold the editorial/disclosure corrections into v0.4.0 and preserve the published v0.3.0 as the historical record. Do not erase old versions or rewrite historical open obligations as mistakes.

## Frozen research cutoff

- Active math source snapshot: `a8fb249ebc49021f466c9c73995f144edb379fba`.
- Latest included newly accepted checkpoint: F10DE, strict [run 41946635772](https://github.com/etblink/math/actions/runs/41946635772), completed/success, attempt 1.
- Published v0.3.0's geometry stopped at CK, tested `b106e809965b8790d7679c74389e8a21fa6c62b0`, run 41754991438. Its earlier conditional FCP physical-operator results retain their own exact original commits.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

Later candidate research is excluded from this draft unless a deliberate cutoff revision is recorded. The source snapshot has no completed smooth source manifold/Lie-group construction or source tangent-space identification.

## Changes in scientific content

| Topic | Dated v0.3.0 position | Material for v0.4.0 | Boundary to retain |
| --- | --- | --- | --- |
| Local source recovery | Homeomorphism onto the chosen word image; full-source neighborhood recovery open | Exact reconstruction on an explicit source identity neighborhood, then an open identity chart with the actual ordered-word inverse | Local equality does not imply global recovery or global injectivity. The entire old word image is not asserted open. |
| Chart-inverse regularity | Finite parameter-coordinate derivative/inverse construction | The actual chart inverse is Clifford-valued smooth to every specified order; its derivative at zero is the injective positive-half-bivector sum | Ambient/parameter differentiation is not a formal source-manifold differential. |
| Derivative image | No packaged source chart derivative-range Lie algebra | Exact range equals the native half-bivector span; commutator closure and a canonical native so(9) Lie equivalence | The actual ambient range is not yet identified with a separately constructed group tangent space. |
| Gamma representation comparison | Algebraic group and Lie algebra maps established separately | Literal gamma evaluation on the actual range, exact representation identities and full finite-parameter derivative factorization | Full group-map manifold differential compatibility remains open. |
| Source atlas | Full-source neighborhood chart unavailable at the old cutoff | Translated charts cover the original source group on its existing topology; named ChartedSpace value, exact maps/overlaps | This is a topological atlas. Smooth transitions, IsManifold/Lie-group structures and tangent identification remain open. |
| Physical operators/spectrum | Conditional natural-domain/graph correspondence and existing-eigenpair transfer | Retain these as a separate historical theorem line, with full premise audit and exact source-to-manuscript boundary | No new positive-energy eigenstate, gap, coercivity or compactness result is established by the later geometry. |

## Principal new evidence anchors

All commits below are exact tested commits, not merely documentation heads. Previous acceptance records supply the earlier run reviews; this turn independently verified DE's complete fresh source/audit result. This table is not a claim to have freshly rerun all listed gates.

| Result | Strict run | Exact tested commit |
| --- | --- | --- |
| CU: two-sign natural-action kernel/fibers | [41862534414](https://github.com/etblink/math/actions/runs/41862534414) | `0ac77b6885b359dad60cf92c78cf9e1fcc771250` |
| CV: exact local source recovery | [41868430179](https://github.com/etblink/math/actions/runs/41868430179) | `b4304dec91de0f025e93998289c304c60f59b55c` |
| CW: original-source open identity chart | [41872942447](https://github.com/etblink/math/actions/runs/41872942447) | `a980c3e6ae6c26c26ccd48c891a1a11749ee9e54` |
| CX: actual chart-inverse regularity and derivative | [41888219932](https://github.com/etblink/math/actions/runs/41888219932) | `595c8e58f1444a2f283695c9dd6995ed8cc77dfc` |
| CY: actual derivative range and half-bivector span | [41893512389](https://github.com/etblink/math/actions/runs/41893512389) | `93e2001e330ad5d3dc2150e6d9281295282dfc04` |
| CZ: original-gamma parameter derivative comparison | [41901992068](https://github.com/etblink/math/actions/runs/41901992068) | `e85045bfa324c7d4be9e6cb78ce5b6dc95c7262b` |
| DB: actual-range commutator closure | [41913435697](https://github.com/etblink/math/actions/runs/41913435697) | `abedd367f58f34054ba9bb9a4e2507a4eb1ba576` |
| DC: range Lie subalgebra and native Lie equivalence | [41934575798](https://github.com/etblink/math/actions/runs/41934575798) | `6729d54be338bbb71fce7ef841fa92d6e7343f83` |
| DD: literal range-gamma LieHom and comparison identities | [41938138536](https://github.com/etblink/math/actions/runs/41938138536) | `0019a5fe47be33765090c1a0fd409967211bb5d4` |
| DE: translated topological charts/atlas | [41946635772](https://github.com/etblink/math/actions/runs/41946635772) | `a8fb249ebc49021f466c9c73995f144edb379fba` |

The historical CU job-status metadata discrepancy remains documented in its acceptance record. This is not silently relabeled as uniformly clean metadata. The current DE run/job terminal states agree.

## Manuscript organization

Working title: **Source-Specific Lean Results for the Relative SU(2) BFSS Model: Conditional Operator Correspondence and Local Spin Geometry**. Final wording remains subject to the claim audit.

1. Reader summary: mathematical question, concrete source objects, three principal result lines, and remaining physical question. Explain why these results are useful without making green-run counts the organizing narrative.
2. Definitions and assumptions: original/genuine source spinGroup, the explicit FCP gamma realization and its relation to model data, source label conventions, inherited PBW topology and normalization. Define precisely what “source-specific” and “independently constructed” mean.
3. Conditional physical-operator correspondence: audit H3B2/H4 complete hypotheses and the pinned historical Hamiltonian versus the October 5 prose operator. State eigenpair transport separately from existence.
4. Local source theorem: reconstruction, two-sign ambiguity/exclusion, open identity chart and restricted inverse laws. Include exact domain sets and the actual word formula.
5. Derivative-range theorem: Clifford-valued regularity, derivative normalization, range/span equality, commutator closure and native Lie equivalence.
6. Representation comparison: literal gamma restriction and complete finite-parameter derivative factorization. Do not promote it to a source manifold differential.
7. Topological atlas and remaining smooth geometry: translated charts and exact overlap sets/formulas, followed by explicit unproved smooth/tangent obligations.
8. Limitations and preserved counterexamples: local/global distinctions, scalar/negative-sign controls, conditional/unconditional boundaries, spectral existence still open.
9. Reproducibility appendix: concise claim-to-declaration/premise/source/check map and one fully specified representative replay. Keep exact run/commit and failure evidence available without requiring a first reader to navigate the entire chronological handoff.
10. Version changes and disclosure: distinguish new mathematics, editorial corrections and unchanged conditional physical claims; explain substantial AI help with code, proof/audit drafting and prose, Lean kernel checking, and only human checks actually performed.

## Review order and release status

First complete the bounded claim/premise audit and reader entry point specified in [PUBLIC_READINESS_REVIEW.md](PUBLIC_READINESS_REVIEW.md). Then draft the mathematical narrative around that map, compare every headline/abstract sentence with its exact statement, and perform complete PDF layout/link checks. Correct the Zenodo title typo in the publication workflow and update the contributor note to the selected version only after the version is actually published. Do not invent a future DOI.

The green DE result closes its formal qualification requirement. It does not lift the public-readiness hold. No new source theorem, full smooth manifold construction or positive-eigenstate proof is required just to prepare this honest, current progress report. Publication and upstream submission remain separate owner decisions after a concrete reviewed draft exists.
