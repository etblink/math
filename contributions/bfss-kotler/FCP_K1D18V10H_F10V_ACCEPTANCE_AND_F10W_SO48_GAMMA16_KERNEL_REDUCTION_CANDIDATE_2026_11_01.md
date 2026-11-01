# F10V acceptance and F10W original paired SO48-to-gamma16 kernel reduction
Date: 2026-11-01. Owner research branch: research/fcp-k1d17-ancestor-cache-pilot-20261028.
Accepted parent: e11d71f34cee0b70c6eac9ad009c4c6a93c48ae3.

## F10V — ACCEPTED

[Strict run #41310915901](https://github.com/etblink/math/actions/runs/41310915901) passed at exact SHA e11d71f34cee0b70c6eac9ad009c4c6a93c48ae3, attempt 1. Pinned gamma/Clifford sources; Lean 4.34.1 and Mathlib commit d13f23b723b8a846827a245b89c10fc7d3f11612; accepted F10U rebuilt; warnings-as-errors compilation; four independently elaborated declaration types; permitted-only axiom audit. The exact proof token V10H_F10V_FOUR_CENTRAL_INVOLUTION_SO48_SIGN_TYPES_AXIOMS_PASS is in the strict logs. Root axioms propext, Classical.choice, Quot.sound only; no sorryAx.

[Acceptance artifact #13085368673](https://github.com/etblink/math/actions/runs/41310915901/artifacts/13085368673), ZIP SHA256 296c1445c5fed3e09728d4fa1355f0410afa61212005e747aa1d99ac79e1f46e.

Accepted: source9NegativeCentral_sq_eq_one; source9NegativeCentral_mul_comm; source9NegativeCentral_originalPairedSO48_left_sign; source9NegativeCentral_originalPairedSO48_right_sign.

## F10W — UNQUALIFIED candidate for a real scope reduction

The original source action has a color-identity Kronecker factor and G1A exact pairedColorSpinEquiv reindexing. Its gamma16 matrix input is recoverable by restricting output to the first ORIGINAL COLOR diagonal. The proof must use that actual index mapping. Four testable obligations:

1. gamma16ToOriginalPaired48_injective: prove the accepted original paired matrix transport is injective on the real 16x16 gamma matrices, using actual source ColorIndex 2 and SpinIndex.
2. source9OriginalPairedSO48_eq_iff_gamma16: for any genuine source Spin9 g,h, equal original SO48 actions IFF equal exact gamma16 O16 actions.
3. source9OriginalPairedSO48_mem_ker_iff_gamma16: same condition at the identity.
4. source9OriginalPairedSO48_ker_eq_gamma16_ker: original paired SO48 and gamma16 O16 subgroup kernels coincide as sets.

This is NOT a claim that either kernel is trivial or of order two, nor an entire Spin9 representation faithfulness theorem. The accepted non-kernel central -1 result remains intact. A NEXT independent obligation is to classify the gamma16 source Spin9 kernel using a source-exact Clifford even-subalgebra property, not just a dimension-count guess.

Verification constraints: source-gamma and V10F / F10V blob pins, pinned toolchain and Mathlib, no limit raises, fresh warnings-as-errors compilation, four independent exact types and root axiom checks, preserve diagnostics on red. Main and external upstream untouched.
