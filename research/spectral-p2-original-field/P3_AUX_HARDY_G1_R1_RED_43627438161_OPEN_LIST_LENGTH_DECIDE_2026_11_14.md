# HARDY-G1 R1 red checkpoint — open list-length decide

Date: 2026-11-14 Pacific. RED_UNQUALIFIED.

Strict [#43627438161](https://github.com/etblink/math/actions/runs/43627438161), attempt 1, job #132546379281, tested `a74db0572da9101fcaf12d8dee139350f1301362`. Verified run/job failure. Source closure/toolchain PASS; cold candidate source FAIL. Fresh warning-as-error source and independent native consumer NOT REACHED.

## Exact first causal layer

Source 42:74 and 50:80: Expected type must not contain free variables, on [i,j,k].length <=5 and [i,j,k,l,m].length <=5. The local by decide tactic rejects the open syntactic proposition before reducing list length. No recursion/Clifford trace or original carrier error is shown. The assistant introduced these proof terms; this is an engineering failure, not mathematical falsification.

Three source reports (missing-label, conjugation trace helper and square trace) have only standard allowed axioms. Both three/five trace conclusions have consequential sorryAx. Neither clean reports nor source-present statements establish strict qualification. Full independent consumer has not run.

| Binding | Value |
| --- | --- |
| Source blob | 7172ba68d2b95475a4f0b4383a8996ba3da40bb9 |
| Consumer blob | 6cde9e42664eb378136d12cde77989fee628f7d3 |
| Workflow blob | cbf9c3fadf761c54c1a92b384003c093b1d56e60 |
| Reviewed existing OAI baseline | 321a49fb29de3ab55d41bf35f54e1fcfdfa6eaea |
| Manifest pins / SHA-256 | 147 / d18da8b4f28ad9d2c04ef620987c2bbc530b11a0ceec6f81ed50291c367df811 |
| Artifact ID / bytes | 14126474746 / 16481 |
| Artifact ZIP SHA-256 | sha256:f845089c90bc28e70f05c63896fc27db220d9fcf46105e2a2e6fd9b583f340b0 |

Artifact API digest matches upload log; ZIP not independently downloaded/rehashed. Separate administrative #43627438088 success. Lean 4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 retained. HARDY-X0 and CERT-P0 acceptances unaffected.

## Decision

One preregistered R2 proof repair: make the literal list-length goal explicitly (3:Nat)<=5 or (5:Nat)<=5 before decide. Leave public statements, gamma order, repeated-label coverage and entire native consumer unchanged. Workflow expected source hash changes only. Preserve this checkpoint before source mutation. A second related red triggers a minimal list/decide interface diagnostic; no tactic permutations.
