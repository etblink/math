# F10AL accepted; F10AM original shared-right gamma pair bracket candidate

2026-11-01. Owner research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`. Qualified parent SHA `f8ec5281ae97082d71e604a3e5c50750328bdc7c`.

## F10AL Gate 2 qualified
[Run #41353772163](https://github.com/etblink/math/actions/runs/41353772163) SUCCESS first attempt at qualified parent; all source hash pins, Lean v4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AK ancestry, fresh warning-as-errors compiler and FOUR independent exact theorem-type/root-axiom audits PASSED (`V10H_F10AL_FOUR_FORK_LIE_BRACKET_TYPES_AXIOMS_PASS`). Root axioms only `propext`, `Classical.choice`, `Quot.sound`; no sorryAx. [Artifact #13102262720](https://github.com/etblink/math/actions/runs/41353772163/artifacts/13102262720), SHA256 `b7e7ec17c3d0a72f1ca83f828ee0b661be64c768f54f1007c2f4fde013aea7f5`.

F10AL established exact ORIGINAL ordered shared-left bracket `[γaγb,γaγc]=-2γbγc` in matrices and Mathlib's NATIVE so(16,R), whenever a<b<c.

## Negative result retained
[Gate 1 RED #41352777956](https://github.com/etblink/math/actions/runs/41352777956), exact red SHA `ca616ec51013aadc8d488b66c89e848996d20229`. The proof was mathematically elaborated but strict compiler failed on unused `hbc` binder and unnecessary `simpa` tactic. Gate 2 repaired two source lines only (binder renamed `_hbc`, `simpa only` replaced with `simp only`) without changing theorem types or disabling linting. Negative evidence and source-exact compiler diagnostics preserved in the accepted tree.

## F10AM — unqualified complementary shared-RIGHT case
For all actual source SpaceIndex a<b<c, prove EXACT four declarations on ORIGINAL real 16×16 gamma matrices and their qualified native so(16) representatives:
- `source9OriginalGamma_ordered_shared_right_forward_product`: (γaγc)(γbγc)=-γaγb;
- `source9OriginalGamma_ordered_shared_right_reverse_product`: (γbγc)(γaγc)=+γaγb;
- `source9OriginalGamma_ordered_shared_right_matrix_commutator`: [γaγc,γbγc]=-2γaγb as a matrix commutator;
- `source9OriginalGamma_ordered_shared_right_native_so_bracket`: same identity inside Mathlib's native so(16).

Derive the signs from source-only public anticommutation and gamma_c²=1. Independent frozen exact source type and axiom auditing required. Do NOT claim a complete so(9)→so(16) LieHom: disjoint pair brackets and the original native so(9) source basis are still open. Also OPEN: all 256 even gamma images, faithful source even Clifford AlgHom, global Spin group lifts, Fock implementation, spectral/BFSS physics.

Preserve frozen Lean v4.34.1, exact Mathlib, accepted ancestry source, immutable SHA; no extra axioms/sorry, private gamma tables, weakened statements, raised limits, accepted module mutation, main merge or upstream PR.
