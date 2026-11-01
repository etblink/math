# F10AK accepted; F10AL original gamma shared-left fork Lie bracket candidate
2026-11-01. Owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
Accepted parent SHA: `3dee5aa632152131a3c1126e48321f22c838d3d7`.

## Exact F10AK qualification
[Strict run #41351422445](https://github.com/etblink/math/actions/runs/41351422445), attempt 1 SUCCESS at parent. Pinned original sources, Lean v4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AJ ancestry, fresh warning-as-error source compile and THREE independent exact type/axiom audits PASSED (`V10H_F10AK_THREE_NATIVE_LIE_BRACKET_TYPES_AXIOMS_PASS`). Only `propext`, `Classical.choice`, `Quot.sound`; no sorryAx.
[Artifact #13101653483](https://github.com/etblink/math/actions/runs/41351422445/artifacts/13101653483), ZIP SHA256 `7cf1a05c76144561eaaa34a68863bf2f9eeff656bb7b35b05d82505074b2ca1b`.

Qualified source F10AK: for a<b<c the original gamma real matrix commutator, and its bracket in Mathlib's ACTUAL native so(16), satisfies [γaγb,γbγc]=2γaγc. This is an exact one-pattern bracket calculation; no so(9) LieHom yet.

## F10AL — UNQUALIFIED shared-left fork candidate
Proposed FOUR exact declarations on a<b<c:
1. `source9OriginalGamma_ordered_fork_forward_product`: (γaγb)(γaγc)=-γbγc.
2. `source9OriginalGamma_ordered_fork_reverse_product`: (γaγc)(γaγb)=+γbγc.
3. `source9OriginalGamma_ordered_fork_matrix_commutator`: difference = -2•(γbγc).
4. `source9OriginalGamma_ordered_fork_native_so_bracket`: same Lie bracket in native so(16,ℝ), using qualified F10AJ source gamma-pair subtype.

Use only public original Clifford anticommutation, original gamma-square identity and native source brackets. The negative sign is essential; no guessed Lie-hom normalization. The subsequent missing overlap/disjoint cases and native source so(9) LieHom remain separate gates. Full 256 even gamma-word independence, even-Clifford AlgHom injection, Spin(9)/Spin(48) global lift, Fock realization and BFSS physical claims still OPEN. Do not weaken or expand the theorem claims.

Strict gate pins exact original sources and F10AK/F10AL, frozen Lean/Mathlib, rebuilt accepted F10AK ancestry, warnings-as-errors fresh Lean, four independent exact theorem-type and axiom reports (allow only propext/Classical.choice/Quot.sound). Preserve immutable tested SHA/log artifact. No source changes to accepted modules, increased limits, sorry/axioms, main merge or upstream PR.
