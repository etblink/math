# Offline build and source-architecture verification — 2026-11-11

**Scope:** Documentation-only. This record describes a **local LaTeX and source-index check**, not Lean compilation, GitHub Actions CI qualification, proof of any theorem, or a claim that the source mathematical exposition is finished.

## Local source checks

- JSON schema loads; **33** unique object/theorem/open-gate records; all scientific dependency IDs resolve.
- **14** numbered planned narrative chapters; the main TeX has the same 14 numbered chapters and three technical appendices.
- All records explicitly distinguish original source definitions, historical source strict greens, present integration strict greens, unverified source receipts, queued candidate gates, conditional analytical results, and open proof obligations.
- Each verified source definition/declaration record includes an exact `etblink/math` file path and 40-hex-character source Git blob, read from the specified source snapshot; a green run URL is included only where an acceptance was recovered. The historical BH current port is not misleadingly upgraded to an integrated pass.
- A scientific dependency in this atlas does **not** claim to be the mechanically extracted Lean import graph.
- No new CI run, GitHub Pages publication, or webhook was used for this verification. The outage of November 11 is not a mathematical dependency of the document.

## Offline LaTeX build

Command (in a local copy of this directory, or in an isolated build directory):

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error -file-line-error main.tex
```

Environment checked: local `pdflatex` and `latexmk` installation. **Result: PASS**, 28-page source-outline PDF generated on November 11, 2026. Hyperref PDF-string and overfull-line warnings in the first build were corrected in the source by using shorter text-only section bookmark entries and heading text. The final local compile reported no LaTeX errors, overfull lines, or unresolved-reference warnings. PDF pages were rendered and representative title, contents, chapter, and appendix pages inspected. This is a source-format and layout test, **not** a mathematical/proof correctness review.

## Next evidence and editorial checks

1. Inspect the atlas with the independent expert's questions in mind: precise model identity, original/source-vs-manuscript distinction, exact conventions, stronger current qualified successors, and undercredited historical branches.
2. Verify substantive formulas against literal source declarations before writing full narrative mathematical proofs, starting with Chapters 2–6.
3. Obtain independent mathematical review at a later checkpoint; every future 'strict qualified' label must remain anchored to a verified exact commit and root-axiom receipt.
4. For source-only commits, do not add generated `.aux`, `.toc`, `.log`, `.out`, `.fls`, `.fdb_latexmk`, or `.pdf` artifacts to Git; keep optional PDF previews outside the branch.
