# Edition 0.10.0 build validation

Built on November 27, 2026 Pacific from the source in this directory. The research cutoff is [ec55da1d6e6f](https://github.com/etblink/math/commit/ec55da1d6e6ffe50fedc1ea722f63eb470fae021).

| Check | Result |
| --- | --- |
| Manuscript | 12 chapters, 4 parts, 4 appendices, 22 indexed physical-existence claims, and 5 bibliography entries |
| Source audit | All 14 includes resolved. 31 unique cross-reference labels, complete bibliography keys, critical evidence statuses, the rational fidelity endpoint and the matrix comparison count checked. |
| PDF compilation | Three local pdfLaTeX passes with pdfTeX 1.40.26 and embedded Latin Modern and AMS fonts. The final log has no warnings, unresolved references or box diagnostics. |
| PDF structure | 47 US Letter pages, 22 bookmarks and 187 links, including 59 distinct external URLs. Internal destinations and 33 pinned repository paths checked. |
| Visual inspection | Rendered all 47 pages and inspected contact sheets. Individually inspected PDF pages 1, 3, 17, 23, 28, 40, 42, 47, including the contents, common square, fidelity theorem, notation and declaration map. |
| Byline rebuild | Evan Thomas Kotler appears on the title page and in PDF author metadata alongside the existing collaboration credit. Checked the rendered cover, body text, bookmarks and link destinations. |
| PDF output | BFSS_Internal_Monograph_Edition_0_10_0.pdf, 540,677 bytes |
| PDF SHA-256 | `d5b96b2a52d0c1801b8f8845e34c9bed1e462d267fc7d02126f13cfa40bbc92d` |

The local environment required a locally generated LaTeX format and font map from the installed TeX Live files. The build used `SOURCE_DATE_EPOCH=1795823999`. A standard TeX Live installation can use the commands in the [edition README](README.md).

These checks cover the edit, exact scalar arithmetic, links and typesetting. The cited proof receipts give the exact scopes of the Lean qualifications, and the finite replay and proof obligations retain the statuses printed in the monograph.
