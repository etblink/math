# C5A R1 RED — native origin control, explicit zero-power premise

Date: 2026-11-14 Pacific. Status: RED_UNQUALIFIED, not mathematical falsification.
[Strict #43591940771](https://github.com/etblink/math/actions/runs/43591940771), job #132438328870, failed at exact tested aee1979bc64e90cca0f75e67e3341c0bc8bc5d93.

| Evidence | Receipt |
| --- | --- |
| Source | eabd26ec2a72043e622d634a6366f4b3ed5eaf77, unchanged |
| Independent consumer | 8e276ff96ce82e7b5fe4fd81ec5bb37241142193 |
| Workflow | c2b7e9f0dadcd53c0f6c785d50c4fc90a2110c85 |
| Frozen preflight | 149 paths, PASS |
| Manifest SHA256 | 0e2acaaf33ad002994fa776aafd28f9d11fe45d6faa4286fa2a9475bc86cacf9 |
| Cold source and fresh warning-as-error source | PASS |
| Source reports | 10, exact root order; standard axioms only |
| Consumer imported-root reports | 14, exact root order; standard axioms only |
| Complete independent consumer | FAIL, origin examples at 79:56 and 82:56 |
| Evidence artifact | #14113580930, 17875 bytes |
| API/upload-log SHA256 | 1132bd3b384fda50eddabb58f1388ae61344068a4a9d839f05d4bdab3ce77405 |

Artifact API digest matched upload log; archive bytes not independently rehashed. Source/toolchain pins passed. No new gate qualification follows from the clean named reports: the consumer's unnamed origin examples failed compilation. All accepted C4C and original-H results remain intact.

## First causal layer

Both origin controls leave sqrt(0^2+epsilon^2)=epsilon (respectively delta). The simp-only list supplies bare zero_pow, whose condition n!=0 is not discharged by this restricted simplifier. Thus zero_add, sqrt-square and positivity rewrites cannot fire. There are two unsolved goals and eight unused-simp errors. No source theorem error is present.

Exact pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, Algebra/GroupWithZero/Basic.lean line 219:
zero_pow : forall {n : Nat}, n != 0 -> (0 : M0)^n = 0.
The actual origin, both positive parameters and correct ratio orientation remain required controls.

[Diagnostic](diagnostics/P3_AUX_RAD_C5A_R1_ORIGIN_CONTROL_FAILURE_43591940771_2026_11_14.txt).

## Bounded disposition

Preregister one consumer-only R2: replace bare zero_pow by zero_pow (by decide : (2 : Nat) != 0) in the two origin simp lists. Keep every source byte, public type, origin/equal controls, ten/fourteen report lists, toolchain, budgets and strict warning policy. Workflow changes only the expected candidate consumer hash. A second related red triggers an isolated source-shaped diagnostic, not repeated broad simplifier changes.

The post-C5A fixed-regulator certificate review remains a strategic research target; this consumer engineering failure neither disproves its conditional argument nor qualifies its physical premises.
