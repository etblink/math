# The Relative SU(2) BFSS Quantum System — internal research monograph

**Active source: Edition 0.7 in development (not yet PDF-build-qualified).** The previous fully compiled checkpoint is **Edition 0.6.1 (2026-11-11), reported as 90 pages and 40 offline structural checks at commit `900859ed`**. All 17 chapters and the historical, normalization, and negative-knowledge appendices are drafted. **This is a working internal manuscript, not a published or peer-reviewed scientific result.**

This directory helps an independent mathematician or mathematical physicist understand, critique, reproduce, and extend the *original source-exact relative SU(2) quantum model* and its formal verification. Its ultimate external successor will be drafted only after the relevant scientific results and formal proofs are complete and independently reviewed.

## Contents

- `main.tex` — fully linked 17-chapter master manuscript, including a printed 38-record atlas and three additional source/evidence appendices.
- `chapters/ch01_scope.tex` — expert introduction: mathematical system versus large-`N` M-theory conjecture, spectral targets, three proof chains, and evidentiary contract.
- `chapters/ch02_carriers.tex` through `ch06_hamiltonian.tex` — source carrier, CAR/Clifford, exact sixteen charges, gauge-physical state space, and native closed Hamiltonian.
- `chapters/ch07_spin_geometry.tex` through `ch09_gauge_covariance.tex` — source Spin(9)/Spin(8) stabilizer, original Fock operator star/trace action, original Majorana-label gauge compatibility and the remaining physical source-lift requirements.
- `chapters/ch10_energy.tex` through `ch14_frontier.tex` — original energy decomposition, accepted first-moment compactness, the bounded *auxiliary* NORM observables, conditional oscillator exclusions, and the unfinished coercivity/spectral joins.
- `chapters/ch15_particle.tex` through `ch17_unification.tex` — **exploratory** GUT/ToE program, including no-go tests for naive color-generation identifications and gauge/descent restrictions on Hopf geometry.
- `appendices/historical_lineage.tex`, `HISTORICAL_LINEAGE.md` — FCP-to-`etblink/math` dated research evolution, later qualifications correcting older as-of statuses.
- `appendices/notation_normalization.tex` — original indices, Fock/CAR, gamma matrices, exact colors, charge/form coefficients, central signs, field normalization, and operator versus Fock-vector carrier distinctions.
- `appendices/negative_knowledge.tex` — bounded failures, explicit no-go scope, source provenance, and review methodology.
- `appendices/theorem_atlas.tex`, `THEOREM_ATLAS.json` and `THEOREM_ATLAS.md` — a printed **38-record** qualification index with source pins and receipts, plus the canonical machine-readable theorem/dependency ledger. The editorial atlas does not substitute for the exact accepted Lean file and strict run evidence.
- `SPECTRAL_JOIN_GATES.md`, `UNIFICATION_RESEARCH_CHARTER.md` — prospective research gates and explicit scientific stop conditions.
- `CONSISTENCY_AUDIT_2026_11_11.md` — detailed cross-chapter review and unresolved claims.
- `tools/audit_manuscript.py` — offline structural checks, *not* a Lean or mathematical proof certification.
- `BUILD_NOTES.md` — exact local compilation and validation record.

## Mathematical source authority

- **Immutable mathematical source inspection baseline:** `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`.
- Original core source: `lean/OAI/MathematicalPhysics/BFSS/Core.lean` (Git blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`).
- Original massless energy: `DeformedCharge.lean` (Git blob `c27c913c44090100f0c714e3eb34e25205f4d2d3`) and integrated massless form interface.
- **Evidence classes:** source definition, historically strict-qualified, integrated strict-qualified at an exact commit, source present/receipt pending, conditional mathematical argument, and open proof obligation. No historical strict receipt automatically certifies a modified imported source in today's integration tree.
- **Current scientific boundary:** no original-source positive-eigenpair theorem, full mass gap, source physical coercivity, Standard Model three-generation derivation, GUT, ToE, or M-theory equivalence is claimed.

The field on `Fermion 2` is different from an action on `FullL2 2`; the full Fock-operator algebra is different from the original Fock-*vector* Hilbert space; the normalized Gram/Fock auxiliary field is different from the unnormalized original fermionic energy term. Those boundaries are essential, not editorial footnotes.

## Local build and review

```bash
python3 tools/audit_manuscript.py
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error \
  -outdir=/tmp/bfss-monograph-build main.tex
```

The completed 0.6.1 referee-response checkpoint was reported as **90 pages**, with **40 offline structural checks passed** at commit `900859ed`. That was a local, GitHub-hosted-service-independent review; subsequent editorial work requires its own new compilation and inspection. A selection of beginning, chapter-transition, and appendix pages was rendered locally and inspected. This workflow requires **no GitHub Actions, Pages, webhooks, or hosted LaTeX**. The review PDF is an output, not committed source.

## Preservation and eventual integration

The authorized editorial branch is `docs/bfss-internal-research-monograph-20261111`. Work on this branch may change only monograph files; no Lean proofs, frozen manifests, CI workflows, original FCP branches, or `main` are to be rewritten for editorial convenience. The unified integration branch remains separate until an explicit reviewed fast-forward decision. If it advances, incorporate/reconcile those changes before attempting a non-force fast-forward.

## Independent referee response (edition 0.6.1)

- `reviews/GROK_REFEREE_REPORT_2026_11_11.md` preserves the external report without treating it as an independent Lean compilation or human peer review.
- `reviews/PROJECT_LEAD_RESPONSE_2026_11_11.md` adjudicates F1–F6 and records an alternate current-literature line for future source-accurate comparison.
- Chapter 13 now displays the fixed-row analytic slicing interface and the factor-two sphere-average cancellation. Chapter 10 explicitly distinguishes a hypothetical energy-bounded escaping sequence from a genuine operator Weyl sequence.
- The historical Gauss-kernel theorem is now G-04 in the **38-record** atlas; the mathematical baseline and accepted parent-source statuses remain unchanged.

## Edition 0.7 in development

The isolated manuscript branch has received source-checked substantive exposition revisions across **Chapters 2--17**, including physical-carrier and domain bridges, Spin and gauge conventions, energy and compactness joins, conditional spectral arguments, and clearly exploratory particle/topology questions. All new conventional proofs remain separate from formal Lean qualification. This is an **in-progress** source checkpoint, not a fully validated 0.7 release.

The next release condition is a complete offline LaTeX build, structural audit, rendered-page inspection and independent mathematical review. Our current local execution environment has TeX tools, but GitHub name resolution fails for a checkout of this branch; the connected GitHub source API does not transfer the full source tree into the local compiler sandbox. **No Edition 0.7 PDF/page count is certified here**, and GitHub-hosted CI/Pages are not substitutes. See `EDITORIAL_REVIEW_QUEUE.md` and the convergence audit.
