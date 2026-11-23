# Edition 0.9 local build validation

Edition 0.9 records the research through unified integration commit `9ee5c7a999531bd502b4ff076af278ba9be5353b`. The edition was built and checked on November 22, 2026 Pacific.

- The 20-chapter manuscript with four appendices builds to **130 pages**. All 26 TeX files match the distributed Edition 0.9 source archive byte for byte.
- The offline structural audit passed **57/57 checks**. The final LaTeX log has no LaTeX warnings, unresolved references or citations, or overfull boxes.
- The reproduced PDF has the same extracted text and layout as the distributed PDF when both are read with `pdftotext -layout`. The distributed PDF's SHA-256 is `c2ed121dbd9b1de8866613bc9fb05cad07bfebaf546d86336fd8e043441e4e78`.
- These are manuscript checks. Lean qualification follows the exact source and independent consumer receipts cited in the text. Independent mathematical review of this edition remains pending.

Run the [build commands](README.md) from this directory with TeX Live and latexmk. The workspace build used a local `pdflatex` format and font map because the system TeX installation did not supply a generated format.
