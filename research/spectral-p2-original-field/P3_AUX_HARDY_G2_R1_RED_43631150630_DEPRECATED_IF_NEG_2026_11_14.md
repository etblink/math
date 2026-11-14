# HARDY-G2 R1 red checkpoint — deprecated conditional rewrite

Date: 2026-11-14 Pacific. RED_UNQUALIFIED.

Strict [#43631150630](https://github.com/etblink/math/actions/runs/43631150630), attempt 1, job #132557819255, exact tested `7d262f2df1b701b91756c9a00cb8ad237d456420`: run/job failure verified. Preflight/toolchain PASS; cold OAI source and native G4J build PASS (9070 jobs). Fresh warning-as-error source FAIL; complete independent consumer NOT REACHED.

## Exact first causal failure

Source 21:8: error: if_neg has been deprecated: Use ite_eq_right instead.

The assistant introduced a deprecated lemma name despite the frozen GammaWords source already using ite_eq_right hij. All five fresh source reports contain only propext, Classical.choice and Quot.sound; no sorryAx. Those clean reports and successful ordinary compilation do not qualify a strict source/consumer gate. The warning-as-error policy correctly blocks acceptance.

| Binding | Value |
| --- | --- |
| Source blob | fb5ecf36b4a475d9c4b7b23b961412665ce5a860 |
| Consumer blob | f53612702cbf1b69c5ced0463baf17bb15dbf209 |
| Workflow blob | 2a27ab3959bde62cbc5322637729fe08b8ffd957 |
| Reviewed OAI baseline | 3645cdc05202abefd0b5a9533a4daa1ca45fdf6d |
| Manifest pins / SHA-256 | 148 / 803d6f94f8b788138b721a8b4d548c69604f6b4bd1eed3325fbba13e87d7e70f |
| Artifact ID / bytes | 14128198644 / 17297 |
| Artifact ZIP SHA-256 | sha256:c0edfcb150542e1cd2e93d9e3cc091ac95f3adc2aa16e9fe7cbea2ebdfd83eff |

Artifact API digest matches upload log; ZIP not independently rehashed. Administrative #43631150462 GREEN, separate from qualification. Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 unchanged.

## Decision

R2 replaces precisely if_neg hij with ite_eq_right hij. No theorem/definition, product order, coefficient, consumer, control, warning policy, baseline or budget change. Workflow expected source hash only. This is an engineering negative, not a mathematical falsification. Preserve before mutation. A second related red requires a minimal diagnostic, not proof permutations. Prior G1/X0/CERT acceptances fixed; no G2 acceptance yet.
