# HARDY-G3 R1 red checkpoint — unused simplifier arguments

Date: 2026-11-14 Pacific. RED_UNQUALIFIED.

[Strict #43636892909](https://github.com/etblink/math/actions/runs/43636892909), attempt1, job #132575560968, exact tested `fba4a18f0ad2efa7c9a0b487ddbab5f728b906e2`. Verified run/job failure. Preflight/toolchain PASS; cold source+native G4J build PASS (9071 jobs). Fresh warning-as-error source FAIL; independent consumer NOT REACHED.

## First causal layer

Source 59:28,63:30,66:48: This simp argument is unused: mul_smul_comm. All three are entries in the private nativeY_basis_weight helper. The assistant inserted redundant arguments. No source theorem error, recursion failure or sorryAx report is observed. All five printed source roots use only propext/Classical.choice/Quot.sound, including CLM action, actual fderiv and finite/final contractions. Ordinary build and clean reports are insufficient for strict gate acceptance; the consumer remains untested.

| Binding | Value |
| --- | --- |
| Source blob | de25bd6dba96e7e2f682fb6e7490b60d430a45a0 |
| Consumer blob | 8fd1ac6d819aaccf9cabe38448813a09c75e59bb |
| Workflow blob | 18aeef3a6ae51e92361f3d039c06e2baab8110ea |
| Reviewed OAI baseline | 64718d564f311b914e629e8bae536327b053ee1f |
| Manifest pins / SHA-256 | 149 / 7aa5b88020006a0493b23ca70e823f76acbbb5c20bc7bbff00521db4fd80962b |
| Artifact ID / bytes | 14130986858 / 17393 |
| Artifact ZIP SHA-256 | sha256:9379bdaccf3a4b7748d2d34fb8af27ad267e86fadc9ac1203df7bc5af5eee86b |

API artifact digest matches upload log; ZIP not independently rehashed. Administrative #43636892840 GREEN, separate. Lean4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 unchanged.

## Repair and stop line

R2 deletes exactly three compiler-flagged mul_smul_comm list arguments. Entire consumer, source definitions and public statements, twelve controls, baseline, budgets, report lists and strict warnings unchanged. Workflow expected source hash only. Preserve this checkpoint before mutation. If a second related lint/proof failure occurs, isolate smallest boundary rather than permute tactics or disable lint. Prior G2 acceptance fixed; no G3 qualification yet.
