# RHOPF-P9C3D2G1D37 — source Gamma9 compatible complex inner-product Core intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`. **Status: UNQUALIFIED** until native and independent strict GREEN, exact original ZIP SHA-256 and tested commit checks.

D36 [run #44865343213](https://github.com/etblink/math/actions/runs/44865343213) strict native+independent GREEN at exact SHA `f665d8463e7627005636dfe8bc439a10943e4024`, original ZIP SHA256 independently verified `c76ccc85d7ac2e84a96d79cf46368c9b077becb3513ebb26f49390c286961475`, accepted at `c15f6261adb866a415ff40ad5b04a4a17c2bba1a`.

## Critical pinned Mathlib convention

Exact pinned `Mathlib.Analysis.InnerProductSpace.Defs` declares `InnerProductSpace.Core ℂ E` as a positive-definite Hermitian form with *conjugate-linearity in the FIRST argument*. Our original source Gamma9 (H(x,y)=B_Q(x,y)-iB_Q(J₄ x,y)) is *linear in the FIRST argument* (accepted D35). The correct Mathlib core must therefore use `inner x y := H y x`, not blindly `inner x y := H x y`.

This bounded proof defines only the **Core value** on D31's isolated `RelationalSourceComplexFour`, with conjugate symmetry D32, second-variable additivity D34, second-variable complex conjugate-linearity D36, Q-positive diagonal D32 and x=0 supplied via D35. Prove its diagonal remains original Gamma9 source transported (Q), not standard coordinate Euclidean metric.

No global norm, inner-product typeclass, topological space or source-real-coordinate instance is installed. Pinned API is `InnerProductSpace.Core ℂ RelationalSourceComplexFour` with fields `inner, conj_inner_symm, re_inner_nonneg, add_left, smul_left, definite`. Review source contract warnings-as-error native + independent import, five plus five `#print axioms` reports restricted to `propext, Classical.choice, Quot.sound`, no `sorryAx`. Original source Gamma9/P/J/Circle hashes and accepted D36 pinned, original independent signed-permutation fixture, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original ZIP archive and independent checksum mandatory.

A later separate gate may use pinned `InnerProductSpace.Core.toNormedAddCommGroup` and `toNormedSpace` to construct a coherent norm on this isolated carrier only; then prove `‖x‖² = Q(x)`, rather than importing ordinary coordinate norm. No C² Q-isometry, Hopf quotient/Chern charge or physical original BFSS Fock/Gauss/Hamiltonian/hopfion claim.
