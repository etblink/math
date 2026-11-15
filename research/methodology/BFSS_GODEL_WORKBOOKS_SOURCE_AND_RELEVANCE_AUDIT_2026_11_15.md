# Gödel workbook reports: source audit and relevance to BFSS

Date: November 15, 2026 Pacific. Status: RESEARCH_ONLY / LITERATURE_AND_METHOD_AUDIT. No new Lean theorem, axiom, physical claim or priority promotion. Prepared while G12 R4 #43740253917 runs at `8b54ce6b150d8f3689342dd6bf80179414ab95fa`; this note does not adjudicate that run. Top-level last qualified remains G11 at the time of this investigation.

## Decision

Preserve this as a methodological and foundational research lead. Continue G12 and the bounded Hardy algebra package; retain physical Spin9/charge covariance and original supercharge energy/domain identities as the highest forward-research priority. No source examined supplies a new sector-specific Hardy estimate, physical covariance theorem, domain extension or controlled physical trial state.

The useful opportunity is disciplined recovery of overlooked mathematics with a separate audit of what was actually formalized. Existing formal proof success does not discharge source attribution, interpretation or physical model binding.

## Identifying the report and its evidence

The report concerns the sixteen Arbeitshefte/workbooks studied by Jan von Plato's Helsinki team. The university's existing project documents establish a long-running archival effort. The recent IAS news item describes AI-assisted interpretation and identifies physics/cosmology notebooks as subsequent work. These are distinct from a newly established physical theory.

The Guardian link identifies the 1,009-page story; reported proof classifications were not independently replayed in this audit. A search of the project pages, conference materials and targeted recent searches did not locate a public theorem-by-theorem release and proof repository sufficient to replay the particular new Coq claims. This is a scoped search result, not a claim that no such material exists anywhere. IAS's item is explicitly a media summary of the Guardian story, rather than an independent formal audit.

A source pipeline needs separate records for manuscript content, human transcription, proposed reconstruction, modified statement/assumptions, formal proof, and historical attribution. Kernel acceptance addresses the formal proof in its environment; it does not identify which earlier author supplied each missing step. An unsuccessful proof attempt also does not itself establish falsity: a counterexample or separate refutation is needed. This agrees with our existing scientific-method protocol's RED_UNQUALIFIED versus FALSIFIED distinction.

## Public technical material actually inspected

I downloaded Jan von Plato's public AITP 2026 presentation, *Deciphering Gödel*, from the official conference site and inspected the extracted text, including rendered pages79 and85. The PDF has100 pages, many being incremental slide overlays. Its SHA256 is `5d641519b3f7a008155c4d372efa1584669a67fced30380b5f2cd30436e01d5d`. It is separate from the workbooks and the newly reported AI analysis.

The deck's page25 lists positive propositional decision procedures, an intuitionistic-to-modal interpretation, and constructive strength. Pages58 and63 discuss cut elimination/subformulas and a translation into S4. Page79 gives a classical equivalence involving P and P conjoined with excluded middle for Q, whose corresponding intuitionistic implication fails. Page97 mentions topological models of intuitionistic simple type theory in which a choice principle fails. These are concrete foundational topics, not BFSS spectral estimates.

One useful specification check concerns the strongest-formula claim on page85: its precise atom vocabulary must be fixed before formal reuse. If fresh atoms may be introduced without restriction, a candidate equivalent to P can be strengthened by adjoining excluded middle for a fresh Q. The resulting classical equivalence need not give intuitionistic implication. This observation concerns the unrestricted reading; it does not adjudicate a fully specified version of the author's result. I have not independently formalized the presentation's new theorems.

## Implications for our accepted logic

Our allowed axiom audit remains `propext`, `Classical.choice`, `Quot.sound`; the current Lean reference documents these principles and explains axiom-dependency inspection. Independence is relative to a specified base theory. A choice principle failing in an intuitionistic model must not silently be identified with every set-theoretic or type-theoretic formulation of choice.

Nothing in the checked sources justifies replacing our axiom policy or treating a failed Lean elaboration as an incompleteness/independence result. In particular, the recent generic DecidableEq declaration issue and explicit scalar-action repairs were concrete elaboration obligations, not evidence of undecidability.

For a certificate consumer, existence chosen noncomputably and an explicit usable physical trial state are different deliverables. The latter still needs normalization, physical singlet membership, legitimate domains and a rigorously bounded weighted energy. An axiom audit alone cannot supply those estimates.

## Relevance assessment (Project Lead inference)

| Area | Relevance and bounded use |
| --- | --- |
| Recovering overlooked source work | High methodological relevance. Search original modules, historical receipts and failed approaches together; bind each proposed reuse to exact declarations, assumptions and source bytes. Avoid equating AI synthesis with qualification. |
| Translating mathematics to Lean | High relevance. Independently compare the intended theorem and the formal theorem; preserve every repaired assumption and scope change. A green proof of a modified statement must not be reported as the unmodified physical claim. |
| Physical endpoint audit | Reinforces the present priority. For every certificate input, record actual original carrier/operator, physical sector, covariance, domain and energy assumptions, accepted donor evidence and the missing bridge. Further finite algebra is not a substitute for those bridges. |
| Incidence before identity | Conceptual relevance only. A relational reconstruction can be investigated inside our existing logic. It needs explicit reconstruction and equivalence/obstruction theorems preserving the structures used by consumers; the slides do not select an ontology for physics. |
| Direct spectral technique | No direct reusable result identified in the examined materials. No basis to defer G12 or the physical symmetry/energy-domain audit. |

For an incidence-to-BFSS bridge, specify which data are reconstructed and which physical structures are preserved. Examples of obligations to state, not newly proved results: preservation of an inner product or adjoint, compatibility of group actions, correspondence of the actual charge operators, and transport of their domains when those are part of the claim. A match of dimensions or a classical equivalence of descriptions does not automatically provide these stronger intertwiners.

## Bounded next use and reconsideration triggers

For the highest-priority physical audit, use a compact obligation ledger: original source/formula; exact formal statement; sector and domain hypotheses; logical axioms; accepted donor SHA/receipt; changes introduced by reconstruction; present missing lemma; and a possible falsifier. This applies our existing protocol rather than introducing a new proof lane.

Revisit the Gödel material for direct mathematical reuse when a public, source-linked formal statement and proof become available and a specific result reduces one of our named obligations. Require independent statement/axiom checking and a source-shaped consumer before promotion. Preserve unsuccessful reconstructions and counterexamples as distinct outcomes. No gate state, roadmap allocation or workflow is changed by this note.

## Sources inspected

1. University of Helsinki, [Gödel Enigma](https://www.helsinki.fi/en/researchgroups/godel-enigma) and [project description](https://www.helsinki.fi/en/researchgroups/godel-enigma/research/project-description). Primary project context; collection sizes on older descriptions need not equal the media report's selected corpus.
2. Institute for Advanced Study, [November13 media summary](https://www.ias.edu/news/ahead-his-time-ai-helps-unlock-discoveries-hidden-notebooks-man-who-transformed-maths). Institutional media pointer, not independent replay evidence.
3. Alex Bellos, [Guardian report](https://www.theguardian.com/science/2026/nov/13/kurt-godel-notebooks-ai-helps-unlock-hidden-discoveries-man-who-transformed-maths). Used to identify the current story; claims remain attributed.
4. Jan von Plato, [Deciphering Gödel, public presentation](https://aitp-conference.org/2026/slides/JvP.pdf), linked from the [official AITP2026 program](https://aitp-conference.org/2026/). Relevant physical PDF page numbers listed above; original downloaded and inspected, not reproduced in the repository.
5. Lean Language Reference, [Axioms](https://lean-lang.org/doc/reference/latest/Axioms/) and [Validating a Lean Proof](https://lean-lang.org/doc/reference/latest/ValidatingProofs/). General trust/axiom discussion; the repository's own pinned Lean/Mathlib versions remain unchanged.
6. Local project sources: [active roadmap](../../BFSS_ACTIVE_ROADMAP.md), [scientific-method protocol](BFSS_SCIENTIFIC_METHOD_PROTOCOL.md), and [D0 acceptance](../spectral-p2-original-field/P3_AUX_HARDY_G12_D0_R2_GREEN_43734601883_TYPED_ZERO_ACTION_ACCEPTANCE_2026_11_15.md). Their existing distinctions govern this note's disposition.
