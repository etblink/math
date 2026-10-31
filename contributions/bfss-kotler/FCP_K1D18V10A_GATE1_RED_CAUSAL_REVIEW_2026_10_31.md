# K1D18V10A Gate 1 — exact source failure and bounded correction (2026-10-31)

**Status:** FAILURE PRESERVED / Gate 2 candidate only. Do **not** promote V10A before a successful pinned strict compiler and independently typed axiom audit.

- Red run: [#41247413084](https://github.com/etblink/math/actions/runs/41247413084).
- Exact failed SHA: `2aa27fde073a64b939c7c8932f755c43b5c2edec`; job `124673612161`.
- Red artifact [#13060187093](https://github.com/etblink/math/actions/runs/41247413084/artifacts/13060187093), SHA-256 `5fd15dd7f10008a9934aaea4efd664e93a2e3e400f34a45d90ad462566bc18f0`, containing the exact compiler error and tested SHA.
- Green predecessor: V9Z run [#41245738090](https://github.com/etblink/math/actions/runs/41245738090), exact SHA `a399e53aa093603c00c032af51221dbd36617eca`. This predecessor passed in the red V10A workflow. Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored and compiled.

## First-cause classification — three exact Lean errors, not a disproved math lemma

1. Source line 46: `(Matrix.mem_orthogonalGroup_iff).mp` misapplied the pinned theorem with explicit size and ring arguments; Lean reported invalid field `mp` on a function. Corrective interface: carry accepted V9V `pairedSkewExp_mem_orthogonalGroup` as a typed hypothesis, then `rw [Matrix.mem_orthogonalGroup_iff] at hm`. This is the exact method already accepted in V9V.
2. Source lines 49–50: under `simp only`, right side remained `1*1` but computed determinant equality had right side `1`. Corrective bridge: replace the irrelevant `one_pow` simplifier with `one_mul` alongside `pow_two`.
3. Source line 60: `Set.EqOn` has an implicit point binder and an explicit membership proof; `hglobal t` supplied a real where a `t ∈ Set.univ` proof was expected. Corrective bridge: `hglobal (Set.mem_univ t)`, letting the requested equality infer the implicit point.

Because the compiler failed, both incomplete V10A declarations printed `sorryAx`; that **blocks qualification** regardless of algebraic plausibility. Independent exact-typed audit was correctly skipped. The artifact step passed and preserved evidence.

## Gate 2 change control

- Only the three above local proof elaboration sites change in V10A source.
- The strict workflow source SHA pin advances to the exact corrected blob; original V9Z and all prior source ancestry SHA pins, toolchain, dependency restore, -DwarningAsError=true, independent theorem-type checks and axiom whitelist remain unchanged.
- No source labels, quadratic forms, gamma matrices, group interfaces or mathematical theorem statements change; no extra axioms or compiler limits.
- Gate 2 is an **experiment** until a completed green workflow passes with both declarations independently checked and `sorryAx` absent.
- Global Spin(9) group integration, continuous original Spin48 covering and physical/Fock claims remain **OPEN**.
