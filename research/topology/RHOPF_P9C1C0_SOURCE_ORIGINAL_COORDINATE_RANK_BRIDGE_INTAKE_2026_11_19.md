# RHOPF-P9C1C0 — source-original Hopf-coordinate rank saturation bridge

**Date:** 2026-11-19.
**Branch:** `integration/bfss-unified-research-20261108`.
**Status:** STAGED / STRICT CI PENDING; NOT QUALIFIED.
**Accepted predecessor:** P9C1B1 R2 [#44525487857](https://github.com/etblink/math/actions/runs/44525487857), exact tested commit `e529367451a0f1113dbe10ff01422b8529e9ce37`, acceptance commit `a3a75cacf08c387fa6e7807e722c203bec4a24c8`.

## Strategic reduction: do not prove 256 entries

The original Gamma9 relational projector P is an accepted real idempotent with `Matrix.rank P=4`, `trace P=4` and pairwise source-generator common action. The independently source-matched integer fixture reports `P=diag(1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0)`, but **that literal matrix identity is not yet native Lean qualified**.

Instead define exact original coordinate plane
`V=span_R{Pi.single 0 1, Pi.single 1 1, Pi.single 8 1, Pi.single 9 1}`.
Prove `finrank_R(V)=4` using `Pi.linearIndependent_single_one` and injectivity of the selected original SpinIndex labels.

Prove the **conditional** original-source rank-saturation statement:
`(∀ i ∈ {0,1,8,9}, toLin'(P)(e_i)=e_i) → V = range(toLin'(P))`.
Thus a future finite four-basis **fixed-action witness** suffices to identify the complete source rank-four projector image without direct native reduction of all 256 original real matrix entries.

This gate qualifies only the dimension and implication. It does not claim or manufacture the antecedent. The four exact original basis-action checks are the genuine next source-specific gate (P9C1C1) and must pass independently. Do not infer a new Hopfion, physical Fock lift, dynamical selection or charge conservation merely from subspace equality.

## Controls

Strict pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original Gamma9 source hash, accepted projector and rank modules unchanged, warning-as-error fresh native Lean file, independent exact-original consumer, eight standard-axiom reports and retained original CI artifacts. No extra axioms, sorry, expanded private gamma tables, `import all`, altered Core/Fock/Hamiltonian, or resource overrides.

Preserve P9A1B R1/R2/D0 original-coordinate RED diagnostics, and P9C1B1 R1 native RED, regardless of success of this candidate.
