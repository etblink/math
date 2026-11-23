# Edition 0.9.1 build validation

The internal review manuscript was built on 23 November 2026 from the sources in this directory. Its research cutoff is unified integration commit `fcd873ebbb3148fb0036e19b7b8cb81dbb28be98`, which records GM5E9 R1 and its original strict CI evidence.

| Check | Result |
| --- | --- |
| Manuscript structure | 20 numbered chapters and four appendices |
| Manuscript source audit | 58 of 58 checks passed |
| PDF compilation | `latexmk -pdf` completed with pdfTeX 1.40.26. The final log contained no warnings, overfull boxes, or undefined references. |
| PDF layout review | Inspected pages 1, 37, 67–69, 96, 98, and 117–118, including the revised equations, criteria, and claim index. |
| PDF workflow links | All ten strict workflow links cited for the updated massless proof chain were present in the PDF annotations. |
| Output | `BFSS_Internal_Monograph_Edition_0_9_1.pdf`, 131 US Letter pages, 952,032 bytes |
| PDF SHA-256 | `84e95986a1d8068f69d245fc29157030026b1636c9080ed5456fdb3bec1f9c60` |

The build used a locally generated pdfLaTeX format and font map from the installed TeX Live files. The acceptance receipt under `research/integration/` records the independent paired Lean consumer and the exact mathematical scope. The revised exposition is ready for internal review.
