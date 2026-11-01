# F10AH accepted — F10AI original gamma 36-pair LinearIndependent source bridge candidate

Date 2026-11-01. Owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Accepted parent `4be86aa54a22d3c6b45cea602bb069533d464e41`.

## F10AH independently qualified

[Strict run #41347596687](https://github.com/etblink/math/actions/runs/41347596687) SUCCESS, first attempt, exact parent SHA. Original gamma source blob pins, Lean 4.34.1 and frozen Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, qualified F10AG ancestry, fresh warning-as-errors Lean compiler, and ALL THREE independent exact theorem type and root-axiom audits passed. Log markers `V10H_F10AH_SOURCE_PIN_AND_SCOPE_PASS` and `V10H_F10AH_THREE_ALL_PAIR_COEFF_TYPES_AXIOMS_PASS`; allowed only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`. [Artifact #13100178058](https://github.com/etblink/math/actions/runs/41347596687/artifacts/13100178058), SHA256 `87f947e4e03ec3fee2a1868dd258ef76445ef99f063647c1cf27046b1a7299ee`.

Accepted F10AH source theorems: exact -16 delta trace Gram on subtype of ORIGINAL a<b gamma pair indices, coefficient extractor for ANY 36-pair real combination, and `source9OriginalGamma_all_ordered_pairs_coeff_function_zero`: from `∑p f(p)•(γaγb) = 0`, infer `f=0` on the ENTIRE subtype simultaneously. This is the direct source-exact uniqueness certificate, not yet the explicit Mathlib `LinearIndependent` declaration.

## F10AI two bounded candidate declarations

1. `source9OriginalGamma_all_ordered_pairs_linearIndependent`: Mathlib `LinearIndependent ℝ source9OrderedGammaPairMatrix` on all 36 original canonically oriented source gamma pairs. Directly use accepted F10AH coefficient-function-zero and pinned-source `Fintype.linearIndependent_iff` (Mathlib/LinearAlgebra/LinearIndependent/Defs.lean, source-exact lines 770–777).
2. `source9OriginalGamma_all_ordered_pairs_coeff_unique`: for arbitrary real functions f,g over same complete subtype, if their finite source gamma-matrix linear combinations agree then `f=g`; use pinned-source `Fintype.linearIndependent_iffₛ` (same source lines 266–273).

This checks a standard type bridge PRIOR to any rank or dimensional claims. No new source gamma choice, target index ordering, resource-limit increase, private gamma tables, axioms or sorry. It does NOT establish 256 even PBW gamma-image linear independence, original even Clifford `AlgHom` injectivity, source Spin9 faithfulness, global Spin48 lift, Fock action or BFSS physics. Both declarations are CANDIDATE until strict source pin + build + fresh warning-as-errors compiler + independent exact type and axiom audits PASS. No main merge or upstream PR.
