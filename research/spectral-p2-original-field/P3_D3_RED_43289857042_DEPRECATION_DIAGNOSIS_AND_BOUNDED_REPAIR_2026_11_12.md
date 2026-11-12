# P3-D3 strict RED #43289857042 — pinned source qualified by compiler, consumer linter fail (2026-11-12)

**Status:** D3 NOT GATE-QUALIFIED. **First causal error is a one-token consumer API deprecation.**
**Original candidate commit:** `e78c2f43a8770d10a42a20e0365582f38615fdef`.
**Run:** https://github.com/etblink/math/actions/runs/43289857042 (completed/failure).
**Job:** `131432898329`. **Evidence artifact:** `13978236289`, SHA-256
`93f34e433f5d7b9f13a54bb391fb483250e50fda74ab7acdcda4913e2277c4d0`.
Original exact source blob `09796e2294faa0ca83012162d633e6943d317e30`.
Original independent consumer blob `44dde44f26a4d73088865f4dd3943821cde002c0`.
The new workflow retained the 61 OP1C0 source/consumer accepted pins and two D3 pins.

## What actually passed and what failed

- All 63 pinned source/consumer blobs, fixed toolchain Lean `4.34.1`,
  Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` verified.
- Cold source build `P3D3OriginalFockColumns.lean` and independent standalone
  source axioms invocation passed. Both exported declarations
  `originalFockColumns` and `originalFockColumns_apply` printed only
  `[propext, Classical.choice, Quot.sound]`.
- At independent consumer line 36, column-zero injectivity proof:
  `simpa only [originalFockColumns_apply, ContinuousLinearMap.zero_apply] using h i`
  triggered the **only reported source/consumer Lean error**:
  `ContinuousLinearMap.zero_apply has been deprecated: Use zero_apply instead`.
  Under `-DwarningAsError=true`, this is fatal. The independent consumer
  did not qualify in this run, even though the source proof compiled.
- Evidence is a Lean **deprecation-linter/API error**, not a contradiction
  of the columns theorem, not loss of original-Fock identification, not
  an axiom failure, and not a mathematical refutation.

## Single-line bounded correction and retest contract

Change `ContinuousLinearMap.zero_apply` to pinned Lean's requested
`zero_apply` in the **existing independent consumer only**. Update
**only** this new consumer's Git-blob SHA in the isolated D3 workflow,
retaining all 61 ancestor pins and the D3 source SHA byte-identically.
No changes to T1, OP1A/B/C0, BFSS physical Hamiltonian, Mathlib, the
original D3 source theorem, underlying mathematical hypotheses, group
action or operator domains. No recursion/heartbeat increase.

Re-run identical strict-gate contract: cold source build, separate
original-source and consumer warnings-as-errors checks, exact axiom
reports, artifact. The fix is a candidate until fresh strict GREEN.
If the new consumer has another failure, inspect first causal error and
reassess interfaces rather than blindly cycling tactics.
