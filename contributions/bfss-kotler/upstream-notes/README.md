# First upstream contribution: BFSS SU(2) follow-up note

Status: **HOLD — public-readiness review incomplete.** The earlier submission-approval recommendation is withdrawn. See [the readiness review](PUBLIC_READINESS_REVIEW.md). The exact draft remains prepared and site-checked; those checks cover formatting, not the full scientific/public presentation. This packet lives in the active research branch. It is a proposed notes change, not an upstream PR or an accepted community contribution.

## Decision

Retain as a candidate route: one notes-only PR to `mathcommunity/oai-math-revised`, for the October 5 SU(2) manuscript. Link the author's already published v0.3.0 report with a neutral relation sentence and its spectral boundary. This contribution does not depend on F10DE or future manifold/tangent results. A source-code port or a manuscript correction can be assessed separately after a bounded import/review plan; neither is bundled here.

The [community README](https://github.com/mathcommunity/oai-math-revised/blob/30cd1e55f058a163f0816c2026fb55f6c4426ea6/README.md) provides three routes:

| Route | Appropriate use here |
| --- | --- |
| Paper correction/citation PR | A specific supported manuscript change, with TeX/PDF and byline updates as applicable; no such mathematical correction is asserted in this packet. |
| Issue proposing a change | A precise problem or reference report without a ready patch; useful for discussion, but the follow-up link already has a small ready patch. |
| Paper-specific NOTES.md | A follow-up report link and neutral description; selected first contribution. |

The [agent guidance](https://github.com/mathcommunity/oai-math-revised/blob/30cd1e55f058a163f0816c2026fb55f6c4426ea6/AGENTS.md) and [PR template](https://github.com/mathcommunity/oai-math-revised/blob/30cd1e55f058a163f0816c2026fb55f6c4426ea6/.github/pull_request_template.md) require the four NOTES headings, parseable contribution line, automation disclosure and contributor checking of drafted notes. The owner should review the exact note before authorizing submission. No human source-checking or independent mathematical review is claimed on the owner's behalf.

## Exact proposal

- Upstream baseline inspected: `30cd1e55f058a163f0816c2026fb55f6c4426ea6` (current main at preparation).
- Only proposed changed path: `preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026/NOTES.md` (new file, eleven lines).
- [Exact proposed note](NOTES.proposed.md).
- [Applicable Git patch](NOTES.patch).
- [Proposed PR title and text](PR.proposed.md), including owner-review instructions outside the proposed PR body.
- Link: https://doi.org/10.5281/zenodo.23937775, version 0.3.0. Zenodo's record API returned this version and creator Kotler, Evan. The current report source was also read directly: its introduction treats the October 5 proposal as under investigation, and its abstract/physical-operator discussion distinguishes conditional eigenpair transport from eigenpair existence. The proposed sentence reflects those stated limits.

The current upstream paper directory has no NOTES.md. Its maintainer-generated AGENT_NOTES already links older FCP issue #28 and draft PR #25; this proposal supplies the published report in the separate contributor-notes channel. AGENT_NOTES is untouched. BFSS issue/PR searches returned no matches in this community repository at preparation; that is a bounded search, not a guarantee against all overlapping work.

## Validation completed

The patch was applied in an isolated worktree at the exact current upstream baseline, containing only the proposed new NOTES.md. `git apply --reverse --check` passes against that worktree. Its status reports just that new file.

`python3 site/build.py --pdfs none --out /tmp/bfss-community-notes-preview` exited 0 and built 751 paper pages. No contribution-format warning was emitted. The builder skipped live issue/discussion data because no GitHub token was supplied; that limitation does not prevent local note rendering.

The upstream parser recognizes exactly one contribution dated 2026-11-04 for `@etblink`, with zero parse problems. Inspection of the generated target HTML confirms the activity entry, automation disclosure, follow-up heading, exact DOI anchor and scope sentence. Empty headings are handled by the existing site renderer. No visual browser inspection or mathematical certification is claimed.

## Submission after owner approval

Create a clean owner-fork contribution branch from the then-current upstream main, recheck whether NOTES.md has since appeared, and apply only this note. If concurrent edits exist, merge the note into the existing sections without overwriting them. Update the contribution date if needed. Repeat the site check after any content change. Open the one-file PR with the prepared title/body and automation disclosure. Do not use the research branch as the upstream PR head: it contains unrelated proof and workflow history. Maintainers can add the eventual PR-number link to the contribution line.

Opening an upstream PR, issue or comment remains subject to the owner's earlier explicit-authorization rule. No upstream write has been performed. The prepared patch remains a draft. Complete the bounded claim/evidence, reader-navigation, disclosure and publication-quality review before recommending the owner submission decision. This review does not wait for completion of the research program.
