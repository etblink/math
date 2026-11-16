# Spin(9) structural outline R3 RED — abstract success, original BFSS Core.olean missing

Date: 2026-11-15 Pacific / 2026-11-16 UTC.
Branch: `research/bfss-spin9-structural-outline-20261115`.
**Verdict: SIX ABSTRACT THEOREMS LEAN-PROVED / WHOLE NINE-TARGET GATE RED.** No physical original-Spin(9) implementation or actual BFSS charge norm theorem asserted.

## Immutable evidence

- [R3 #43798301546](https://github.com/etblink/math/actions/runs/43798301546): completed **failure**, tested commit `c9456aacb50be610cea270088c705050dc408c2d`, attempt 1, job `133072147725`.
- Native source/core five-pin preflight **PASS** and frozen Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration **PASS**.
- Fresh abstract `lake build` **PASS**, 8,924 jobs, including `BFSSSpin9AbstractPhysicalOutline`. Fresh `lean -DautoImplicit=false -DwarningAsError=true` source pass **PASS**; all **six abstract `#print axioms` reports** contain only `propext, Classical.choice, Quot.sound` and **no** `sorryAx`.
- Independent original-`FullL2 2` consumer failed **before elaborating any consumer theorem**, with first-causal error:
  `diagnostics/BFSSSpin9AbstractPhysicalOutlineIndependentConsumer.lean:1:0: error: object file '.../BFSS/Core.olean' of module OAI.MathematicalPhysics.BFSS.Core does not exist`.
- This is caused by the strict workflow building the pure module and running `lake env lean` directly on the independent consumer, without first building imported original `OAI.MathematicalPhysics.BFSS.Core`. It is a dependency-build omission, not a Lean proof, physical-theory, or axiom failure.
- [Preserved R3 artifact #14195272382](https://github.com/etblink/math/actions/runs/43798301546/artifacts/14195272382), 1858 bytes, GitHub-reported ZIP digest SHA-256 `0f4f87f309b187a5f5c302462fcf3ab887f4fcf6d85247756f1080693b00a4e4`.
- Fixed abstract source blob `90432decaa1ea0243aa3f3f573a68a534ffc113c`, fixed independent original consumer blob `af490d8363742a95c859202d2b70a9e1025c7740`, fixed original `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.

## R4 bounded workflow-only repair

Without touching **any** of the six proven abstract source statements or proof bodies, the three independent native consumer statements/bodies, or original `Core.lean`:
1. Add a single explicit pinned `timeout ... lake build OAI.MathematicalPhysics.BFSS.Core` within the existing cold source/consumer job after the abstract source was built and before the direct original consumer `lake env lean` invocation, saving the Core build log as immutable evidence.
2. Expand the existing log scanner to check that new original-Core build log and its successful completion. Do not relax warning/axiom/sorry rules, preflight hashes, source/consumer or timeout and toolchain contracts.
3. A final strict GREEN requires all six abstract and all three original-`FullL2 2` consumer axiom reports and their independent compilations. If the next result exposes an actual native type failure, preserve that distinct first-causal red; do not conflate it with this missing `.olean`.

R1 [#43796459069](https://github.com/etblink/math/actions/runs/43796459069) import failure and R2 [#43797501515](https://github.com/etblink/math/actions/runs/43797501515) `apply` mismatch remain preserved. No modifications to main, unified integration, or incidence draft PR #2. Abstract result remains **conditional** on a genuine physical unitary, common invariant domain, supercharge covariance, spinor transitivity, and singlet existence.
