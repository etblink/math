# BFSS × QIT × SCC W0C2B2 D0 R2 — harness-only build-budget correction

Date: 2026-11-18 Pacific. **Prospective; no mathematical qualification.** Only the unified integration branch. Maintain the canonical W0C2B2 R1/R2 stop and all 27 anchors.

## First D0 diagnostic result and preservation

- D0 R1 [#44330552342](https://github.com/etblink/math/actions/runs/44330552342), tested `b3477dbba5a64b9ac61a3d1621b49b607107b6f6`: checkout, 27-anchor preflight and Lean 4.34.1/Mathlib restoration PASS. Cold `lake build` reached `[9234/9240]` and timed out after 1,000 seconds (exit 124). No source-level Lean error was emitted; source and independent consumer did not run. This is a harness/time budget RED, **not** a comparable original source proof RED.
- Original provider artifact `14441212043` (3 files, 18,821 bytes, SHA-256 `cb089a42d1c9d63d92dfdeba00660f9266a02fb7aa338323ad31d50edeeb891b`), complete job log 310,587 bytes, SHA-256 `559e33c9ddb9eaeeb7b076e9be5c2cbee40a740e26359ddc40f8121d0dc02571`, per-member SHA-256/CRC manifest independently preserved by [#44335827790](https://github.com/etblink/math/actions/runs/44335827790) GREEN at commit `bf5b344e67cd03c95437db6e0e934b0a4d0ee3e4`.

## R2 is not a mathematical proof retry

D0 R2 holds **exactly unchanged** the original genuine `Fermion 2 →L[ℂ] Fermion 2` AddMonoidHom source Git blob `5f511b8d3a6851441d316d986ef6152a5139721f` and independent consumer Git blob `3b905f827309a93444b0936e1ba553f0c281c46d`. Same four conditional and algebraic source roots; same four independent consumer roots and two original-source controls. Same pinned Lean 4.34.1/Mathlib commit, 27 anchors, six adversarial auditor mutants, three permitted axioms. No larger Lean maxRecDepth/maxHeartbeats and no omitted axiom checks.

The separate CI workflow changes only the *cold dependency-build harness* from `timeout 1000s lake build` to `timeout 1100s lake build`, which matches the already established 1,100-second strict-gate allowance. The 25-minute enclosing job step stays unchanged. The new preflight verifies D0 R1's exact independent original evidence before running.

Decision rule: Do not count D0 R1 as a proof failure; this one is a specifically diagnosed harness adjustment, not an unchanged RED retry. Do not escalate Lean proof resources if R2 reports a native source error. Independently preserve every new RED and every potential GREEN original ZIP, job log and member checksums before any claim of qualification. GREEN on D0 cannot promote B2's 28th anchor or W0C2B3. Actual source-specific covariance equality, original all-48 gamma Lie-defect centrality, full K Lie bracket, physical Spin(9), gauge, spectral and SCC conclusions remain unproved.
