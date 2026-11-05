# Public contribution readiness review — 2026-11-04

**Verdict: HOLD. The earlier recommendation to request upstream submission approval was premature.** The prepared note passed website-format checks; that did not complete a review of the work it introduces. The user has asked for a deliberate first presentation under their responsibility as the human author. No upstream submission is authorized by that request.

This is a review by the same assistant involved in development, not independent human or external mathematical review. It identifies concrete improvements and the remaining bounded review; it is not a claim that every proof or all 121 report links have been rechecked.

## What was inspected

- The exact eleven-line proposed NOTES.md and full proposed PR text at research commit `fdc3f656e625925f0d042cb2b3e87b47b6bf6656`.
- The live Zenodo API record for DOI [10.5281/zenodo.23937775](https://doi.org/10.5281/zenodo.23937775), including title, version, description and file list.
- Its actual downloadable 21-page PDF, `BFSS_Kotler_v030_Zenodo_Final_20261103.pdf`, not only a local manuscript draft. Its MD5 `7dd1e6c9620caa4d8f4000ca9636b65e` matches the record. PDF text was extracted; the first page was rendered and visually inspected. Full-page visual QA of all 21 pages is not claimed.
- The current report TeX, already read from the author's stored publication source. The abstract, sections on physical operators and gamma representations, cutoff, declaration index, evidence tables and disclosure were reviewed for this assessment.
- Actual BB and BC source declarations, their gamma-source import, and CK's completion source in the active checkout. These are inspections, not new kernel compilations or independent validation of the entire ancestry.
- Terminal run [41944503239](https://github.com/etblink/math/actions/runs/41944503239), its exact tested head, source/audit phases and first causal diagnostics.

## Findings

| Finding | Evidence and implication | Required response |
| --- | --- | --- |
| Submission readiness was overstated | Website generation, note parsing and a working DOI establish formatting/link checks. They do not audit the linked report's headline mathematical descriptions or make a first-reader evidence path usable. | Withdraw the ready-to-submit recommendation; retain the draft and completed format checks as such. |
| The note's spectral boundary is appropriate | Its claim is limited to related representation geometry and conditional operator correspondences, and it states that positive-energy eigenstate existence is not established. The downloaded report's abstract and introduction also state this limit. | Preserve this wording and its distinction between eigenpair transport and existence. Do not imply a refutation of the October 5 claim. |
| Headline claims need an explicit audit crosswalk | The report supplies declarations and exact run/commit tables, but the proposed introduction offers no short claim-to-statement/hypothesis-to-source-to-check route. Historical FCP operator work and later math geometry also use different repositories and source cutoffs. | Prepare one concise reader entry point: separate the conditional physical-operator statements, algebraic gamma maps, and historical local-geometry snapshot; link exact source commits and their hypotheses. Check each headline against its full quantified statement before sign-off. |
| Terminology needs precise provenance | BB/BC use the explicit `FCP.BFSSGamma9.gamma` realization through the pinned source Clifford evaluation. The report's term “original gamma” distinguishes the 16-real line from paired-48, but a new reader still needs the exact realization and its relation to the model's gamma-data assumptions made explicit. | Define “original” by the actual source object; distinguish that construction from unproved manuscript/operator/representation matching. This review has not found a theorem refutation. |
| Reproduction should have a first executable target | The report lists Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, declarations, run links and commits. The contribution packet's successful build is of the community website, not the Lean mathematics. | Provide a pinned checkout and exact target/audit workflow for a representative included result; state expected outputs and what that check does and does not cover. Reuse existing valid execution evidence accurately; do not claim a fresh whole-corpus replay. |
| AI disclosure needs to cover the actual workflow | The PDF says generative AI assisted manuscript preparation; the draft PR says ChatGPT/Codex assisted the note and report and that the research uses Lean. These statements do not fully explain substantial assistance with proof-code development and audit drafting/review. | Draft a precise disclosure of those roles, distinguish kernel checking from independent human review, and identify only the checks actually performed by the human. Do not assign unperformed mathematical checks to the author. |
| Live metadata has a small visible error | Zenodo's title ends “Relative SU(2) BFSS Matrix Mode”; both the PDF title and PDF metadata end “Matrix Model.” | Correct the record title before drawing new attention to it, through the author's permitted publication workflow. No Zenodo mutation was performed in this review. |
| Frozen report and current research must remain distinct | The published report explicitly stops at CK; current DD is later and DE is unaccepted. Some historical open geometry obligations have since progressed. | Label v0.3.0 as its dated snapshot. Do not silently rewrite published conclusions or suggest that DE is part of that version. No new theorem is required merely to describe the existing version honestly. |

## Bounded completion standard

The next work is a review of the existing publication and its introduction, not completion of the BFSS program:

1. Audit the report's abstract/headline mathematical claims against the exact declarations, complete assumptions and original tested commits. Treat the conditional H3B2/H4 physical-operator claims separately from BB/BC and the CK local-geometry snapshot. Record any discrepancy rather than smoothing it over.
2. Produce the short reader entry point and representative replay instructions from those exact sources and existing strict workflows. Check the chosen public links. Preserve historical results and failure evidence; keep DE out of the accepted/public snapshot.
3. Revise the proposed note/PR framing and tool-role disclosure to match that audit, with no claim of independent human review. Inspect the full published PDF layout and fix any material editorial issue through version-aware publication work.
4. Resolve the metadata typo and any actual claim/evidence discrepancy before recommending submission. Author review and explicit upstream authorization remain final, concrete steps after the reviewed package exists.

An external mathematical review would add value, but this plan does not invent a mandatory fresh-human qualification or defer indefinitely until a volunteer appears. The present work is responsible to the checks actually completed and must say where independent review is absent.

## Current research failure is a separate matter

Run 41944503239 tested `f8bee5665407ae41b7f3e1cedebf382bf5d32f76`. Accepted DD parent and all ten DE source declarations compiled successfully with permitted axioms. The independent audit failed at three proof sites: a `letI` style linter in the coverage proof (line 88), and alias-sensitive rewrites in inverse-at-zero (95) and overlap membership (122). This is evidence about those proof interfaces; it neither accepts DE nor refutes the report's earlier results.

The focused repair leaves the DE source unchanged, uses Lean's recommended ordinary `let` in the proof, and replaces the two rewrites with explicitly typed equality transports. Audit propositions, ten-root inventory, negative controls, whitelist, warning policy and proof/time limits stay fixed. Static preflight succeeds, but complete strict qualification is still required. F10DD remains accepted. The public-readiness hold does not depend on waiting for DE to turn green.
