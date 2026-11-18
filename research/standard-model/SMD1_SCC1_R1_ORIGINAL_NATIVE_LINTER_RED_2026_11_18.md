# SM-D1-SCC1 R1 original native RED — strict linter diagnostic

**Date:** 2026-11-18. **Verdict:** native strict RED; unqualified.

- Exact tested commit: `fe34844d7c67e2d9520cc77d458516573137ddc0`
- Original run: https://github.com/etblink/math/actions/runs/44400900631
- Job: `135143314675`
- Original artifact: `14472886007`; ZIP SHA256: `fc2e5597bbbc9bc3f8e9eab8708e9eefe5a3f7e5d9a5bcadefbd5d59d34d7319`
- Source blob: `41b5742fce2b13709677ecb19066b480436f43cf`; original workflow blob: `789c99e34ed4ff094ed0ba278bf93969a820dc22`.
- Checkout, exact source/consumer/SM/BFSS pin preflight and pinned Lean/Mathlib restoration **passed**.
- Cold source completed 3,092 jobs and printed 14 theorem axiom reports without `sorryAx`.
- Strict source check with `-DwarningAsError=true` **failed at line 109:4**: Lean's `linter.unnecessarySimpa` reported "Try `simp at hx` instead of `simpa using hx`".
- Consumer strict Lean stage was **not reached**; no inference about its correctness or axiom cleanliness is allowed.
- A bounded follow-up replaces exactly that proof line and updates the source-blob preflight pin. Do not weaken the warning auditor, suppress this linter, alter statements or mark R1 GREEN.
- Original artifact is 14-day retained until separately archived. Native RED is preserved in GitHub workflow history and this ledger; original full-log independent archival remains a separate task.

**Methodology finding:** compile success is not strict warning-free success. Treat strict linter diagnostics as a first-class proof-qualification requirement. All accepted SM-Y0, SM-D0, SCC0, and 27 BFSS anchors remain untouched.
