# P3-M3G0B0 R2 — exact strict RED: shallow-checkout provenance baseline
**Date:** 2026-11-13 Pacific. **Classification:** strict workflow infrastructure/provenance preflight RED, not a Lean theorem failure. **DO NOT qualify B0.**

## Source-of-truth CI
- Strict [run #43421947368](https://github.com/etblink/math/actions/runs/43421947368), tested source SHA `84bf477184f6974a263ae1525d79709e17f69ec4`, **completed/failure**.
- Job #131873831845: checkout succeeded; **Preflight accepted 459 OAI imports plus two exact B0 candidate blobs** failed. Lean installation/cold compilation, independent consumer, and axiom audit were SKIPPED. Exact failed run artifact **#14034806526**, 429 bytes, digest `sha256:af23ae8c3ce37e104ef19751eb5333e8448cf214e347753dc8835a1f0b42ef35`.
- First causal log: `fatal: git cat-file: could not get object info` followed by `Command ['git', 'cat-file', '-t', 'c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5'] returned non-zero exit status 128` in `tools/bfss_m3g0a_manifest_audit.py:28`.
- The **immutable** baseline `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5` is an accepted ancestor and remains in GitHub; however `actions/checkout` used `fetch-depth: 10`. By R2 the branch had accrued more than ten commits since baseline, so the local shallow Git object store did not contain that commit.
- The R2 replacement source `ffffa9e8d8679577a5f32999dd36fe5c9e904a07`, frozen independent consumer `c914864eccc801d9045656f0d06157ae384670f4`, and strict workflow `f6ea36c9368e8564f558d0d0ea95a071afe77b4e` were the source of this attempt. R1's previous Lean rewrite failure #43398003237 was separately preserved and addressed in this source, but R2 NEVER reached Lean to verify the fix.

## Minimal R3 remedy
Increase **only** the strict B0 workflow checkout fetch depth to a bounded value sufficiently covering the immutable baseline (suggest `fetch-depth: 96`; use an independently evidenced ancestor-depth check before choosing smaller values). Keep all exact existing 459 predecessor+2 B0 source/consumer file blob pins and their strict assertions. This fixes access to the baseline Git object without changing, resetting, force-updating or moving the source baseline.
The mandatory `git cat-file`, ancestor `git merge-base --is-ancestor`, `git ls-tree`, exact path-to-blob checks and allowed source contract stay unchanged. No new scientific/mathematical premise or theorem changes.

After a protected RED checkpoint is committed, stage R3 as workflow-only repair; never alter accepted M3G0A, historical L6G7U–Z, source B0 theorem statements, Fock carrier or independent consumer. R3 must pass source 461-pin manifest, original Lean cold compilation, independent consumer and three root axiom audits (only `propext`, `Classical.choice`, `Quot.sound`). Preserve future reds independently.

**Last qualified mathematics:** M3G0A strict GREEN #43391099205. M3G0B0 remains unqualified.
