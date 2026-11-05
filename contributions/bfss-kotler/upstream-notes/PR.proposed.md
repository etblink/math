# Proposed title

BFSS SU(2): add a scoped follow-up report link

# Proposed pull request body

Adds `NOTES.md` for `Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026`, linking Evan T. Kotler's published BFSS Lean progress report v0.3.0 (DOI 10.5281/zenodo.23937775). The note describes its relation to the manuscript and explicitly states that it does not establish positive-energy eigenstate existence.

This follows the README's notes/follow-up contribution route. The change is confined to this paper's notes; the manuscript, bibliography, PDF, Lean library and catalogue are unchanged. It is offered for community review, with no claim of peer review or certification of the manuscript or linked report.

ChatGPT/Codex assisted preparation of this note and the linked report; the underlying research uses Lean 4. The report's scope statement and exact DOI record were checked during preparation. No independent human mathematical review is asserted.

Validation: `python3 site/build.py --pdfs none --out /tmp/bfss-community-notes-preview` completed successfully. The generated paper page contains the parsed contribution entry, exact DOI link, and scope sentence. No contribution-format warning was emitted. Live issue/discussion data were skipped by the builder because no GitHub token was supplied.

- [x] Added a line under `## Contributions` in the paper's `NOTES.md`.
- [x] Substantial use of language models and proof assistants is stated above.

# Owner review before submission

Review the exact proposed note, its description of your report, attribution and automation disclosure. Upstream submission remains pending your explicit authorization. Update the contribution date if submission occurs on a later day; omit a PR-number link until one exists.
