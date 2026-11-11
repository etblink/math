# Internal BFSS monograph local build and source-validation notes

## Edition 0.1 (architecture, 2026-11-11)

The architecture edition established the 14-chapter master file, a 33-record theorem/dependency atlas in readable and machine-readable form, a chapter-level blueprint, and an offline LaTeX build baseline. The 28-page preview was a structural scaffold, not a completed mathematical exposition. Original research snapshot: `etblink/math@d4870eb1ac58f6f8bdf77844b5cc39c5b77be4a5`.

## Edition 0.2 (first mathematical narrative, 2026-11-11)

### Source and documentation review

- Read historical FCP handoffs dated October 12, 13, 16, and 17; checked original source-accepted G4–K2B, G4–K9D, D2B23–25, BA, BE and BH source boundaries and corresponding original-source green run IDs.
- Checked actual `Core.lean` and `GaugeCore.lean` carrier definitions, source gamma/CAR, original sixteen charges and normalized quadratic form, gauge actions, source physical Hilbert definition and source smooth core.
- Checked imported current-tree source declarations in the original Fock/Clifford M3H/M3I, nonzero physical L², original physical Hamiltonian BA/BE/BH, original normalized Fock pointwise and carrier sources.
- Distinguished *historically FCP strict-qualified*, *integrated strict-qualified*, *source definition*, *source-present unqualified*, and *conditional analytical work*. The historical `letI` style-linter episode and the modified BH port were treated separately.

### New authored material

- Five substantive narrative TeX chapters (`chapters/ch02_carriers.tex` through `chapters/ch06_hamiltonian.tex`), with definitions, mathematical propositions, conventional proofs or source-dependency proof explanations, exact status boundaries and pointers to the theorem atlas.
- Chronological appendix (`appendices/historical_lineage.tex`) and detailed companion retrieval guide (`HISTORICAL_LINEAGE.md`) reconstructing the research from FCP through unified integration.
- Editorial review queue (`EDITORIAL_REVIEW_QUEUE.md`) for source-notation checking and subsequent Chapters 7–14.

### Offline compilation and visual validation

From the monograph directory, with a local TeX distribution installed:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error \
  -outdir=/tmp/bfss-monograph-build main.tex
```

- Final local result: **43 pages**, **zero LaTeX warnings**, **zero overfull lines**, no missing internal references or undefined citations.
- Rendered all 43 pages locally to PNGs for contact-sheet visual inspection; chapter introductions, equations, theorem blocks, table of contents, appendix and closing pages display in the checked render.
- Source-only preservation: no `.aux`, `.log`, `.toc`, `.out`, `.fls`, `.fdb_latexmk`, PDF, render image, or local compiler artifact is committed to the monograph branch. These are local review outputs.
- **No GitHub Actions, Pages, webhooks, hosted LaTeX compilers, cloud bibliography systems, or online build-time services are required.** GitHub's Git data API may be used only to preserve version-controlled source files on the authorized monograph branch.

### Scientific scope remaining

Chapters 1 and 7–14 are still architectural outlines. Even for drafted Chapters 2–6, the source exposition is a reviewable first pass, not a claim that every original Lean proof has been fully rewritten in conventional detail. Independent domain/normalization review remains useful before publication. No actual original physical Spin(9) reducing-sector coercivity, positive eigenpair, BFSS mass-gap or eleven-dimensional M-theory equivalence is claimed.
