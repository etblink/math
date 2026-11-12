# The Relative SU(2) BFSS Quantum System — internal research monograph

**Edition 0.6 (2026-11-11): 88-page locally compiled expert-onboarding review edition.** All **17 planned chapters** contain mathematical or explicitly bounded research exposition, with a fully written Chapter 1 and source-exact notation and negative-knowledge appendices. **This is a working internal manuscript, not a published theorem or a completed scientific research program.**

This directory helps an independent mathematician or mathematical physicist understand, critique, reproduce, and extend the *original source-exact relative SU(2) quantum model* and its formal verification. Its ultimate external successor will be drafted only after the relevant scientific results and formal proofs are complete and independently reviewed.

## Contents

- `main.tex` — fully linked 17-chapter master manuscript, including three source/evidence appendices.
- `chapters/ch01_scope.tex` — expert introduction: mathematical system versus large-`N` M-theory conjecture, spectral targets, three proof chains, and evidentiary contract.
- `chapters/ch02_carriers.tex` through `ch06_hamiltonian.tex` — source carrier, CAR/Clifford, exact sixteen charges, gauge-physical state space, and native closed Hamiltonian.
- `chapters/ch07_spin_geometry.tex` through `ch09_gauge_covariance.tex` — source Spin(9)/Spin(8) stabilizer, original Fock operator star/trace action, original Majorana-label gauge compatibility and the remaining physical source-lift requirements.
- `chapters/ch10_energy.tex` through `ch14_frontier.tex` — original energy decomposition, accepted first-moment compactness, the bounded *auxiliary* NORM observables, conditional oscillator exclusions, and the unfinished coercivity/spectral joins.
- `chapters/ch15_particle.tex` through `ch17_unification.tex` — **exploratory** GUT/ToE program, including no-go tests for naive color-generation identifications and gauge/descent restrictions on Hopf geometry.
- `appendices/historical_lineage.tex`, `HISTORICAL_LINEAGE.md` — FCP-to-`etblink/math` dated research evolution, later qualifications correcting older as-of statuses.
- `appendices/notation_normalization.tex` — original indices, Fock/CAR, gamma matrices, exact colors, charge/form coefficients, central signs, field normalization, and operator versus Fock-vector carrier distinctions.
- `appendices/negative_knowledge.tex` — bounded failures, explicit no-go scope, source provenance, and review methodology.
- `THEOREM_ATLAS.json` and `THEOREM_ATLAS.md` — **37** source-linked qualification and theorem/dependency records. The editorial atlas does not substitute for the exact accepted Lean file and strict run evidence.
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

The 0.6 preview is **88 pages**, compiled locally with **zero LaTeX warnings, zero overfull lines, and zero unresolved internal references**. A selection of beginning, chapter-transition, and appendix pages was rendered locally and inspected. This workflow requires **no GitHub Actions, Pages, webhooks, or hosted LaTeX**. The review PDF is an output, not committed source.

## Preservation and eventual integration

The authorized editorial branch is `docs/bfss-internal-research-monograph-20261111`. Work on this branch may change only monograph files; no Lean proofs, frozen manifests, CI workflows, original FCP branches, or `main` are to be rewritten for editorial convenience. The unified integration branch remains separate until an explicit reviewed fast-forward decision. If it advances, incorporate/reconcile those changes before attempting a non-force fast-forward.

## Collaboration rules retained from earlier editions

1. Do not substitute a green workflow, symbolic finite diagnostic or paper citation for a complete mathematical theorem and its exact hypotheses.
2. Preserve historically qualified results together with source blob IDs and failure causes; never silently rewrite the original FCP record.
3. Restrict editorial Git changes to this monograph branch and its source directory. Do not touch accepted Lean modules, manifests, original proof branches or `main`.
4. Compile and validate the book locally; do not depend on GitHub Actions, Pages, webhooks, hosted LaTeX, or live services to validate its scientific statements.
5. Keep generated PDFs and `.aux`/`.toc`/`.log`/`.fls`/`.fdb_latexmk` build files out of source commits.
6. Promote to unified by a verified non-force fast-forward only after reviewer acceptance and reconciling any intervening changes on unified.
