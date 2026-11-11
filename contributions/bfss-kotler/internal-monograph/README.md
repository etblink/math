# Relative SU(2) BFSS — internal research monograph workspace

**Status: v0.2 internal narrative edition: Chapters 2--6 drafted and locally compiled; Chapters 1 and 7--14 remain architectural. Not a completed research monograph.**

This directory is a narrative, source-auditable onboarding reference for mathematicians and mathematical physicists joining the original relative SU(2) supersymmetric matrix quantum mechanics research program. It is a *living internal research monograph*, not the eventual external publication and not an assertion of a mass gap, a positive-eigenvalue theorem, or an 11-dimensional M-theory equivalence.

## Files

- `CHAPTER_BLUEPRINT.md` — the planned 14-chapter mathematical narrative, drafted-chapter status, open proof obligations and drafting order.
- `chapters/ch02_carriers.tex` through `chapters/ch06_hamiltonian.tex` — substantive mathematical narrative, source definitions, proof explanations, qualification records and explicit limitations.
- `appendices/historical_lineage.tex` — narrative reconstruction of the FCP to unified-integration progression.
- `HISTORICAL_LINEAGE.md` — detailed dated record with FCP and integrated run evidence, historical handoffs and source path locators.
- `THEOREM_ATLAS.json` — structured, exact-snapshot crosswalk of source declarations, Git blob SHAs, evidence status, mathematical boundaries and **narrative** dependencies.
- `THEOREM_ATLAS.md` — readable rendering of those same 33 records, with original-source and strict-run pointers.
- `main.tex` — offline-compilable master TeX importing the five substantive chapters and the historical appendix; other chapters retain section-level scaffolds.
- `BUILD_NOTES.md` — local-only compilation and review results.

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

**Current priority:** Independently review the first mathematical draft, particularly the original charge coefficient normalization and exact current-source carrier interfaces; then extend Chapters 7–9 and 10–13 using the same source-first narrative/evidence standard. The v0.2 PDF is an internal working review artifact, not a claim that the remaining chapters or proofs are complete.
