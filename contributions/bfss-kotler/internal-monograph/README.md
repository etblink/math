# Relative SU(2) BFSS — internal research monograph workspace

**Status: internal research monograph v0.5, mathematical Chapters 2--14 drafted; prospective unification Chapters 15--17 drafted as research analyses, not physical results.**

This directory is a narrative, source-auditable onboarding reference for mathematicians and mathematical physicists joining the original relative SU(2) supersymmetric matrix quantum mechanics research program. It is a *living internal research monograph*, not the eventual external publication and not an assertion of a mass gap, a positive-eigenvalue theorem, or an 11-dimensional M-theory equivalence.

## Files

- `CHAPTER_BLUEPRINT.md` — the 17-chapter research monograph architecture, drafted-chapter status, open proof obligations and drafting order.
- `chapters/ch02_carriers.tex` through `chapters/ch14_frontier.tex` — thirteen substantive chapters on the original quantum model, mathematical proofs, qualified source theorems and the open spectral interface.
- `appendices/historical_lineage.tex` — narrative reconstruction of the FCP to unified-integration progression.
- `HISTORICAL_LINEAGE.md` — detailed dated record with FCP and integrated run evidence, historical handoffs and source path locators.
- `THEOREM_ATLAS.json` — structured, exact-snapshot crosswalk of source declarations, Git blob SHAs, evidence status, mathematical boundaries and **narrative** dependencies.
- `THEOREM_ATLAS.md` — readable rendering of 37 records, with the recovered strict-green stabilizer covering, SO(8) coordinate equivalence, C48 label commutation and active-gamma compatibility.
- `chapters/ch15_particle.tex` through `chapters/ch17_unification.tex` — three **prospective** research chapters with precise no-go and emergence tests, not verified particle-physics claims.
- `main.tex` — offline-compilable 17-chapter master TeX; Chapter 1 is still an editorial scaffold.
- `BUILD_NOTES.md` — local-only compilation and review results.
- `SPECTRAL_JOIN_GATES.md` — source-physical theorem dependency and counterexample checklist.
- `UNIFICATION_RESEARCH_CHARTER.md` — prospective source-first research tracks and explicit rejection criteria.

## Source authority and careful interpretation

The source inspection baseline is `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5` (the parent of this documentation work). The original `Core.lean` and `GaugeCore.lean` determine the mathematical carriers and gauge definitions. FCP BA–BH proofs are historically strict-green but their imported copies are *not* automatically green in the new integration environment. Existing qualified original Clifford/Fock and abstract compactness results are not equivalent to a completed spectral theorem. The operator-valued Fock-endomorphism fiber and the actual physical Fock-vector Hilbert carrier are different mathematical spaces.

The term **BFSS** denotes the source mathematical system's origin and characteristic equations; this document does not assume the proposed eleven-dimensional M-theory interpretation. A truly changed model with new dynamics should be named separately and must not silently inherit source-exact theorems.

## Collaboration policy

1. Every formal theorem claim must give its exact mathematical statement, source declaration, hypotheses, and qualification status. Do not cite CI alone in place of a conventional mathematical argument.
2. Distinguish a conditional analytical theorem from a source-exact certified theorem. No invented statements, assumptions, citations, or phantom Lean proofs.
3. Never modify historical accepted proof files, Git histories, pinned toolchains, workflows, or main while editing this workspace. Commit changes only on the dedicated monograph branch.
4. Local `pdflatex`/`latexmk` is sufficient for building; **do not use GitHub Actions, Pages, webhooks or hosted build services**, especially during an incident.
5. Ignore LaTeX-generated `.aux`, `.toc`, `.log`, `.out`, `.fls`, `.fdb_latexmk` and PDF artifacts when committing source-only edits. Preserve reviewed edition PDFs separately if desired.
6. For later fast-forward promotion, first verify the unified branch is an ancestor of the monograph HEAD; reconcile any divergence on the monograph branch and only then fast-forward the unified branch without `--force`.

**Current priority:** Independently review Chapters 10–11 against the exact source energy fields, compactness-domain data and finite-CAR diagnostic assumptions; then develop Chapter 12 normalized auxiliary field and Chapter 13 conditional high-type spectral mechanism. The v0.5 PDF is a working review edition, not a completed spectral theorem.


## Edition 0.5 — spectral synthesis and unification prospectus

- `chapters/ch12_normalized.tex`: original bounded Gram/Fock observable, true `FullL2 2` representatives, strict and queued-gate distinction.
- `chapters/ch13_spectral.tex`: conditional operator-fiber/vectors weight bounds, oscillator exclusion, precise original-source coercivity and spectrum obligations.
- `chapters/ch14_frontier.tex`: proof dependency gates, hostile counterexamples, evidence and version-control separation.
- `chapters/ch15_particle.tex`: Spin(9)/Spin(10) comparison and color-triplet family-label obstruction, without claims of observed families.
- `chapters/ch16_topology.tex`: source-gamma eigenspace bundles, Hopf geometry and projective gauge-descent tests, explicitly conditional topology qualifications.
- `chapters/ch17_unification.tex`: GUT/ToE necessary conditions and falsifiable source/dynamics/phenomenology gates.
- `SPECTRAL_JOIN_GATES.md`: open physical proof dependency checklist.
- `UNIFICATION_RESEARCH_CHARTER.md`: source-first exploratory program, kill criteria and research-only evidence.

Original research source and Lean evidence snapshot remains `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`. The manuscript branch advances editorially only; no CI, webhooks, workflow, or original Lean source changes are required to read or compile it.
