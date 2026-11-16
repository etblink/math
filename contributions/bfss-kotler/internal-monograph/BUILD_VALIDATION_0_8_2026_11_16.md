# Edition 0.8 local build and visual validation

Date: 2026-11-16 Pacific. Internal editorial validation; independent mathematical referee review pending.

- Source/evidence baseline: 2325d494224beef60c19a652643164a16db9afc5; preserved Edition 0.7 editorial baseline: b603f4c1715e15f5f92c69d7fb071992dbaa9f40.
- P0A R4 strict acceptance is separately preserved at d2880eeea3135e8f0d3b0d33090bea9f192a6b54.
- Final manuscript: 17 chapters, 4 appendices, 22 TeX sources, **119 PDF pages**.
- Offline structural audit: **68/68 PASS**.
- Offline evidence reconciliation: **38 unchanged historical + 21 dated atlas records**, 95 tree-object bindings, 21 run metadata records PASS. Twenty prior runs/workflows were freshly retrieved; P0A R4 additionally has an independently rehashed four-file artifact and strict source2/consumer2 log audit. These are distinct from fresh recompilation of the complete dependency tree.
- Local latexmk/pdflatex build PASS. Final main.log has no LaTeX warnings, unresolved references/citations or overfull boxes. Underfull paragraph notices in historical source records remain nonblocking layout diagnostics.
- All 119 final pages rendered at 85 dpi; all ten contact sheets visually screened by the assistant. Targeted full-page inspection: physical bivector conventions (PDF p45), conditional certificate derivation (p79), and final source-atlas/P0A scope (p107). No clipping, overlap or missing equation glyphs identified. This is model visual review, not human review.
- Final PDF SHA256: `cbd87dfd88f8fb3a73e806c1f8d55254b985f5b0b06b40942757bd7c5cbbee51`; bytes: 1176665.
- No GitHub Actions or hosted compiler used for the manuscript. Proof CI is separate. No independent mathematical peer review is asserted.

## Reproduction

From this directory, run:

```bash
python3 tools/audit_manuscript.py
python3 tools/audit_consolidation_evidence.py
python3 tools/release_candidate_build.py --outdir /tmp/bfss-ed08
```

The evidence checker requires the Git checkout. Standard TeX Live with latexmk, Latin Modern, AMS packages, xurl, microtype and Poppler is sufficient. This session's image had source/font files but no generated format or ls-R databases. The local recovery used explicit TEXINPUTS/TFMFONTS/TEXFORMATS and font-map/type1/encoding search paths, built a private pdflatex format from latex.ltx, and assembled a private pdftex.map from AMS, RSFS and Latin Modern maps. No manuscript or mathematical convention was changed to repair the environment. This environment repair and a missing Euler font-map first build failure are retained here as reproducibility diagnostics.

`EDITION_0_8_BUILD_SOURCE_HASHES_2026_11_16.json` lists the exact final TeX and atlas inputs. PDF bytes may differ on reproduction because TeX embeds build timestamps; source hashes and semantic/layout checks are the reproducibility boundary. The review PDF is distributed separately, not committed as a source file.
