# Spin(9) abstract physical outline R1 RED — first causal import boundary

Date: 2026-11-15 Pacific / 2026-11-16 UTC. Source branch: `research/bfss-spin9-structural-outline-20261115`.  
Status **RED_UNQUALIFIED**; never promote the abstract theorem or claim the original physical charge-norm theorem from this run.

## Exact tested immutable material

- [Run #43796459069](https://github.com/etblink/math/actions/runs/43796459069) completed **failure**, attempt 1, tested commit `1511e1a9a4f6fba139e8f866d2300666fa4ccd12`.
- Failed job `133066278679`. Original full Hilbert / abstract source / toolchain five-pin preflight PASS. Frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS.
- Native source cold build RED at abstract `BFSSSpin9AbstractPhysicalOutline.lean:29:26`: **unknown identifier `NormedSpace`**. The file imports two scoped normed-analysis modules, but not their full required normed-space and real/complex foundations. Subsequently `G`, `S`, `H`, `ℝ`, `ℂ` are unknown because the shared `variable {G S H}` line fails. A cascade reaches 100 Lean errors and the source build stops. The independent `FullL2 2` consumer did **not** run. An incidental `No goals to be solved` later in the malformed environment is not treated as a distinct mathematical failure.
- Exact original abstract source blob `4789901698c1978279a3b7921d636f7b2f5a32bc`, independent consumer blob `af490d8363742a95c859202d2b70a9e1025c7740`, original `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
- Evidence artifact [#14194817249](https://github.com/etblink/math/actions/runs/43796459069/artifacts/14194817249), 1879 bytes, GitHub-reported ZIP SHA256 `80e80fe19cc2fece896d0aff5289dd777b481e60575626c953e6453f9f08d12c`.

## Bounded R2 repair

Change **only** the original abstract source's import closure to `import Mathlib` (or narrower verified equivalent). Keep six statements, all proof bodies, independent consumer byte-for-byte fixed and original source `Core.lean` fixed. Regenerate the workflow only for the exact source SHA pin; all resource and axioms checks unchanged. A green R2 must pass true cold native abstract build, source six axiom reports, original `FullL2 2` independent consumer and three further axiom reports with `{propext, Classical.choice, Quot.sound}` only and no `sorryAx`.

If R2 exposes proof-level failures, diagnose the earliest such error and record it before altering theorem statements or broadening any premises. The missing original physical Spin(9) unitary, common domain, charge covariance, spinor transitivity bridge, nonzero physical singlet, and Hardy/fidelity certificate are unchanged.

No modifications to `integration/bfss-unified-research-20261108`, draft IBI PR #2 or `main`.
