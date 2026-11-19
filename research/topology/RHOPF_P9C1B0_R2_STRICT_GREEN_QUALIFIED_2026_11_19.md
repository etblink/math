# RHOPF-P9C1B0 R2 — original-source strict GREEN independently qualified

**Date:** November 19, 2026.
**Branch:** `integration/bfss-unified-research-20261108`.
**Original strict run:** [#44519484672](https://github.com/etblink/math/actions/runs/44519484672), attempt 1, conclusion SUCCESS.
**Exact tested commit:** `f373a3686f0b2157c45e5d81e49c4f8a33064d88`.
**Verdict:** **ACCEPT P9C1B0 R2**. Preserve prior R1 RED.

## Original qualification evidence

- Frozen original Core, SU2RealGammaProbe, P9A0, F10AN, F10AE, accepted P9C0/P9C1A dependencies, source and consumer hash preflight: PASS.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Original F10AE and P9C1A dependency build, native Lean source with `-DwarningAsError=true`: PASS.
- Independent Lean source-import type consumer warning-as-error: PASS.
- SIX original native and SIX imported consumer axiom reports: exclusively `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- Original integer gamma fixture independent consumer: PASS.
- Original [CI artifact #14527234521](https://github.com/etblink/math/actions/runs/44519484672/artifacts/14527234521) downloaded independently. ZIP SHA-256 `e49b5a3113affbbe3f0cb7c44724e7cd416af22ec074db09297f98fdfcbfaa2c` exactly matches GitHub digest. Archive `exact-tested-commit.txt` matches the above SHA; its native and independent log files each contain exactly six theorem axiom reports and no `sorryAx`.

The six qualified original-source theorems are:
`K13K25_trace_zero`, `K13K46_trace_zero`, `K25K46_trace_zero`,
`relationalProjector_expanded`, `relationalProjector_trace_four`, `relationalProjector_ne_zero`.

## Scientific and mathematical ceiling

For the original 16-real gamma spinor representation, K1=gamma1*gamma3, K2=-(gamma2*gamma5), K3=-(gamma4*gamma6), P=(1/4)•((I-K1*K2)*(I-K1*K3)).
The exact original projector trace equals four, and P is nonzero. P9C1A R1 already proves P²=P and K1P=K2P=K3P.

Because P is a real finite-dimensional idempotent, a standard linear algebra argument shows `dim(im P)=trace(P)=4` mathematically. The native typed Lean rank theorem has NOT yet been proved. Equality of its image to the original coordinate subspace (0,1,8,9) is a distinct unqualified source-matching task, as is the original Fock physical-action problem.

R1 [#44517493380](https://github.com/etblink/math/actions/runs/44517493380) remains **RED** due to a single CI report-file filename mismatch AFTER native and independent Lean compilation succeeded. R2 repaired ONLY that filename; no source/bound math claim changes. Earlier P9A1B R1/R2/D0 RED diagnostic history remains retained.

No original Core, Hamiltonian, Fock operator, FCP canon or NFC assumption was changed.

## Next recommendation

Read source-pinned Mathlib for projector-rank/trace interface. Qualify a bounded `P9C1B1` with a typed original-source `Matrix.rank P=4` or `finrank (LinearMap.range P)=4` theorem, relying on the accepted `P²=P` and `trace P=4` without source coordinate expansion. Stop on structural failures and archive them. Subsequently compare the rank-four image with the selected original Hopf coordinate subspace through a separate bounded exact source witness.
