# RHOPF-P9C3D2G1D38 — source Gamma9 Q norm and standalone Mathlib normed-group intake

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`. **UNQUALIFIED** until native + independent original strict GREEN with six/six clear axiom reports and independently hashed original ZIP.

D37 R2 accepted at [commit `ddca344e`](https://github.com/etblink/math/commit/ddca344e9673a7920aca50d31551cad77d4f25da), exact tested `f8b17130d0afb7b79573ad39d8f3a5db19ee02dc`, [run #44868434441](https://github.com/etblink/math/actions/runs/44868434441) GREEN, original ZIP SHA256 independently confirmed `ff4a3a56397a1e6bd705dd7d48b3633857301bb6a7bbea9dc8270981e46b57bd`. D37 R1 RED remains preserved due to class-valued reducibility warning; D37 R2 repaired `@[instance_reducible]`.

## Bounded original Gamma9 Q norm identity and detached instance

Define on **isolated** D31 `RelationalSourceComplexFour` only:
`relationalSourceComplexFourQNorm x := Real.sqrt (relationalRangeCoordinateDotSelf x.coordinates)`.
Theorems establish nonnegativity, `QNorm²=Q`, `QNorm=√(re (inner x x))`, strict positivity for x≠0. Source Q is the original Gamma9 transported spinor metric, **not** Euclidean dot on `Fin 4 → ℝ`.

Then create a standalone `NormedAddCommGroup RelationalSourceComplexFour` value using the exact pinned `InnerProductSpace.Core.toNormedAddCommGroup` with an explicitly local D37 core instance. **Do not** install a global norm instance or full `InnerProductSpace ℂ` at this gate. The separate next gate must prove this concrete constructed group's `‖x‖²=Q`, build `NormedSpace ℂ` coherently and then a compatible inner product instance after checking no instance conflict.

Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, strict original Gamma9/P/J/Circle ancestors and D37 source hash pins, independent signed-permutation integer Gamma9 fixture, native and independent consumer with warnings-as-errors and six+six axiom printouts restricted to `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or proof-budget overrides, original evidence ZIP SHA256 and tested commit independently verified before acceptance.

Not claimed: global NormedSpace or InnerProductSpace instance, explicit Q-isometric ℂ² frame, classical Hopf circle/quotient/Chern charge, original BFSS physical Fock/Gauss/Hamiltonian/stable hopfion. Preserve original Gamma9, `main`, all accepted and RED evidence.
