# RHOPF-P9C3B1 R1 — native RED in scalar-action normalization; R2 bounded recovery

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original R1 run:** [#44597813788](https://github.com/etblink/math/actions/runs/44597813788), attempt 1, conclusion FAILURE.
**Exact tested commit:** `804e412b2222e96a8b16ff2314c5c51748f1276e`.
**Diagnostic artifact:** [#14566218598](https://github.com/etblink/math/actions/runs/44597813788/artifacts/14566218598), downloaded original ZIP SHA-256 `04c68cd51e96966271494b72793923d928c0c310ee85498a8e567b00850406fe`, matching original GitHub digest; ZIP embedded `exact-tested-commit.txt` equals exact SHA. Native log, independent original integer fixture, pinned toolchain hashes and original dependency build log retained.

## What succeeded and failed

- Source hash/proof-contract preflight: PASS.
- Exact pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Qualified original Gamma9 source phase/complement dependency build: PASS.
- Native theorem `relationalCirclePhase_mul`: **RED** at source line 48:57, `unsolved goals` in the hand-written nine-term matrix product expansion. Tactic `noncomm_ring` distributed the sum but left two distinct nested scalar-action associativity arrangements (e.g. `c • (a • (P*P))` versus `c • a • (P*P)`) without normalizing their `ℝ` coefficients.
- Line 63:21 and 63:42: two unused-simp-arguments errors for `zero_smul` and `zero_add` under warning-as-error, in the second calc step. No resource/CI infra failure.
- The RED source `#print axioms` contains `sorryAx` from unsolved proof; independently imported Lean consumer SKIPPED.
- The exact source-original phase family multiplication theorem remains UNQUALIFIED. Nothing changed about accepted P9C3B0 complement table, P9C3A family or physical source.

## R2 repair and stop condition

Preserve exact theorem statement, all imported original source declarations, source pinned axioms, consumer module, execution limits, compiler warning policy, and source-independent integer fixture. Replace only the fragile manual nine-term `calc` with direct `simp only [add_mul, mul_add, mul_smul_comm, smul_mul_assoc, smul_smul, …]` to rewrite distributed scalar actions consistently before applying `module`, reusing the six strictly qualified complement laws, `P²=P`, `PJ=JP=J`, and `J²=-P`. Remove unused `zero_smul` and `zero_add` simp inputs; keep other exact lemmas. Update only the new native source hash in the frozen workflow.

No theorem weakening, copied signed-permutation matrix, source Gamma9 edits, `import all`, `sorry`, axioms or resource increases. R2 must pass original native proof, independent type consumer, allowed-only axiom reports, original artifact digest and exact tested commit before qualification. If R2 again fails through structural scalar-action normalization, **stop the direct expanded proof form and split the multiplication law into an independent abstract ring/module adapter** rather than repeat `noncomm_ring` with cosmetic reshuffles.

## Research boundary

This is a source-original real matrix algebra proof. Even a future GREEN would not itself establish a source-exact continuous circle action, geometric Hopf quotient, full BFSS Fock implementer or physical observable. Original source indexed four-basis mapping remains separately open, with direct gamma-column R1 [#44574592530](https://github.com/etblink/math/actions/runs/44574592530) and R2 [#44577006982](https://github.com/etblink/math/actions/runs/44577006982) preserved STOPPED.
