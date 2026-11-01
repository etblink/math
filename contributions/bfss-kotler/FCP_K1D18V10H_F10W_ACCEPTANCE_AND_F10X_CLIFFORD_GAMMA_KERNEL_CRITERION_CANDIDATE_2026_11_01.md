# F10W Gate 2 accepted; F10X source Clifford gamma kernel interface candidate

Date: 2026-11-01. Branch: research/fcp-k1d17-ancestor-cache-pilot-20261028. Parent: 7e2f6e1dc167eb2dc26fc10deeaa4ab022ed6c23.

## Accepted F10W gate

[Run #41313297030](https://github.com/etblink/math/actions/runs/41313297030) completed success (attempt 1) at the exact parent commit above. Exact original gamma, original paired G1A source and accepted F10V pinned; Lean 4.34.1 with Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; original ancestry rebuilt, fresh warning-as-error Lean succeeded, and four independent proposition/axiom audits passed. Token: V10H_F10W_FOUR_GAMMA16_KERNEL_REDUCTION_TYPES_AXIOMS_PASS. Only propext, Classical.choice, Quot.sound permitted; no sorryAx. Evidence [artifact #13086393798](https://github.com/etblink/math/actions/runs/41313297030/artifacts/13086393798); ZIP SHA256 0245b81ef235a2d99a80daa3e83f107760fa91d49d9f51338d25dda5c4a0ecb4.

Accepted four declarations: gamma16ToOriginalPaired48_injective, source9OriginalPairedSO48_eq_iff_gamma16, source9OriginalPairedSO48_mem_ker_iff_gamma16, source9OriginalPairedSO48_ker_eq_gamma16_ker.

**Preserve prior RED:** [F10W Gate 1 #41312208775](https://github.com/etblink/math/actions/runs/41312208775) at SHA ae505a87a60b024e323eacb0fb03a7a6f702b0ad failed with OfNat (ColorIndex 2) 0, not a theorem counterexample; [red artifact #13086272296](https://github.com/etblink/math/actions/runs/41312208775/artifacts/13086272296). The repair used the exact source-typed ColorIndex 2 finite-index witness, with unchanged theorem statements.

## F10X candidate: only a formalized reduction, NOT faithfulness

F10X connects original paired SO48 image equality to source Clifford gamma AlgHom equality and makes the unresolved **even Clifford algebra injectivity** hypothesis explicit. Four strict audit obligations:
1. source9GammaOrthogonal_eq_iff_clifford_gamma: original source Spin9 O16 equality iff original Cl(9) gamma AlgHom equality.
2. source9OriginalPairedSO48_eq_iff_clifford_gamma: SO48 source representation equality iff original Cl(9) gamma AlgHom equality.
3. source9OriginalPairedSO48_mem_ker_iff_clifford_one: exact source SO48 kernel membership iff original Cl(9) gamma AlgHom of the genuine Spin9 element equals matrix 1.
4. source9OriginalPairedSO48_injective_of_even_gamma_injective: explicitly CONDITIONAL theorem from original gamma AlgHom injectivity restricted to the actual even Clifford subalgebra. The hypothesis is not proved here; therefore entire kernel classification and SO48 faithfulness remain OPEN.

Next substantive theorem research (F10Y candidate only after F10X qualification): actual original Cl(9) even Clifford monomial matrix basis / coefficient-separation injectivity, using source 9 gamma word algebra and original 16-dimensional matrices, not a dimension-count assertion. Keep research branch, exact Fock order, strict original source pins; no resource-limit changes, main merge, upstream PR, Spin48 topological lift, Fock implementer, BFSS physics or whole-kernel claims.
