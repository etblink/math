# v0.4.0 contribution validation — 5 November 2026

## Decision and scope

The notes-only contribution is technically prepared for owner review and explicit upstream-opening approval. The earlier v0.3.0 proposal and its publication-readiness hold are superseded by the published v0.4.0 and this updated packet. No claim of external peer review, completed BFSS spectral proof or newly qualified Lean theorem is made.

Upstream baseline: `30cd1e55f058a163f0816c2026fb55f6c4426ea6`.
Owner contribution commit: `37af0591d8c968e6232968b0951639798a2d7028`.
Branch: `contribution/bfss-v040-follow-up-20261105`.
Remote compare: one commit ahead, zero behind, only the manuscript's new NOTES.md (11 additions, no deletions).

## Source and publication alignment

The preceding source-to-prose/editorial review produced the 18-page v0.4.0 report through F10DE, preserving (P1)–(P4), true natural-domain adjoint composition, chart restrictions and the distinction between topological charts/ambient derivatives and a full manifold differential. The note's neutral sentence describes those results and the report's explicit nonclaims. No further Lean replay was performed for this note.

The anonymous public Zenodo API returns the revised title, version 0.4.0, creator Kotler, Evan, and BFSS_v0.4.0.pdf / BFSS_v0.4.0.tex:
https://zenodo.org/records/23969575

- Public TeX MD5: `6fdb4bf190c0969d5ea05c4120889bae`; matches the reviewed local source.
- Public PDF MD5: `aba890186983900efc7b5b0ef5ed4959`; independently downloaded bytes match the record checksum.
- Public PDF: 18 pages; extracted text on every page equals the reviewed local PDF after whitespace normalization.
- The local signed PDF has a different binary MD5. No binary identity or pixel-by-pixel comparison is claimed. The publication check establishes the public checksum, matching source and matching full page text.

## Format and build validation

An isolated sparse clone was based on the exact community baseline. The root AGENTS is the only applicable AGENTS for this paper path. The README, PR template and target paper directory were reviewed; there was no NOTES.md to merge. AGENT_NOTES.md was left unchanged.

Command:
```sh
python3 site/build.py --pdfs none --out <temporary-output>
```

Build exits 0 and reports 751 paper pages. The upstream parser returns exactly one contribution, date 2026-11-05, person @etblink (Evan T. Kotler), and no parse problems. The generated target HTML contains the exact DOI anchor, ChatGPT/Codex disclosure, conditional-results phrase and eigenstate-existence limitation. No “Contributions line not understood” warning occurs.

The checkout includes manuscript READMEs/NOTES/AGENT_NOTES, catalogue, overview, Lean scope notes and website code. It omits PDFs and unrelated Lean challenge configurations/proof blobs, producing missing-config warnings for those unrelated links. This does not validate the Lean library or all website destinations. Live issues/discussions were skipped because no GitHub token was supplied. No browser visual inspection is claimed.

The one-file patch passes reverse application against the prepared worktree; the staged diff passes whitespace checking. GitHub's compare independently confirms the one-file scope.

## Owner check and submission boundary

The owner authorized preparation and validation. Their earlier explicit-approval requirement for upstream PRs remains in force. Upstream [AGENTS](https://github.com/mathcommunity/oai-math-revised/blob/30cd1e55f058a163f0816c2026fb55f6c4426ea6/AGENTS.md) states: “If you draft entries, the contributor must check them.” The entry and proposed body are available for that exact check; no independent human mathematical proof audit is attributed to the owner.

No upstream issue, comment or PR was opened. Recheck main, concurrent NOTES edits and the date before submission; update affected validation if anything changes.


## Submission authorization and blocked attempt — 5 November 2026

The owner replied “You are authorized to continue” after receiving links to the exact eleven-line note and proposed PR text. This supersedes the pending-approval status above. It does not attribute independent mathematical checking to the owner.

Before submission, community main was rechecked at the same baseline, the target NOTES.md remained absent, the fork note matched the prepared bytes, and the open-PR query for the same owner/head branch returned an empty list.

The create-pull-request request targeted `mathcommunity/oai-math-revised:main` from `etblink:contribution/bfss-v040-follow-up-20261105`, with the prepared title/body, draft=false and maintainer editing allowed. GitHub returned HTTP 403, “Resource not accessible by integration.” No PR number or URL was returned. The connected-browser fallback reported unavailable originating browser context; no browser submission occurred. GitHub CLI was unavailable.

The packet now provides a prefilled compare/PR form as the manual handoff. There is no pending owner-authorization requirement; the remaining block is the available account/session surface's ability to create the upstream PR. No upstream issue, comment or PR has been opened.
