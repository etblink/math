# RHOPF-P9C3D2G1D11 — original source Gamma9 phase preserves transported quadratic

**Pacific date:** 2026-11-20. **Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED pending full strict Lean source-native and independent imported consumer checks, axiom reports and original ZIP verification.

Accepted G1D10 original run [#44785917654](https://github.com/etblink/math/actions/runs/44785917654) at exact commit `468e593b2afe13492122a7569ffd8d1088a3fe89` proved `J₄ = E ∘ J_range ∘ E.symm` and `J₄²=-I` from the accepted original Gamma9 `J=K13 P`, original rank-four projector image and noncanonical real-linear equivalence G1C0. Its original artifact SHA256 `9c25e258084d268e867f2dc9192e263b2ff06ae5e73e97194cfd3dd2011bf9f5` was verified independently; acceptance commit `1baf92e6f164f28094d5b719199f578dc1fc9e2f`.

## Bounded D11 goals

1. On original `SpinIndex → ℝ` vectors with `P.mulVec v = v`, prove that `J.mulVec v` preserves the original real dot-self, using *exactly* the accepted P9C2C `relationalPhaseJ_transpose_mul_self : Jᵀ J=P`, original projector fixed-point hypothesis and accepted F0 `Matrix.dotProduct_mulVec` technique.
2. On `Fin 4 → ℝ`, prove that the exact transported phase `J₄` preserves the accepted G1C1 quadratic form `relationalRangeCoordinateDotSelf x`, by using `E.symm (J₄ x)=J_range (E.symm x)` and goal 1.

The second result is preservation of the **transported original metric Q**, NOT a claim that G1C0 `E` is an isometry for ordinary dot product in `ℝ⁴`. The source-original P9C2B skew phase `Jᵀ=-J` will remain a useful later test for a compatible Hermitian complex structure. The standard complex scalar `S¹` action, explicit equivariant complex basis, Hopf bundle/quotient, Chern class/topological charge and BFSS physical 48 Majorana Fock, gauge/Hamiltonian or stable hopfion remain OPEN.

CI preserves exact source Gamma9 P/J and G1D10/G1C1 frozen Git blobs, independent signed-permutation integer fixture, Lean v4.34.1 and Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, native and imported consumer warnings-as-error, 2+2 `#print axioms` restricted to `propext`, `Classical.choice`, `Quot.sound`, and evidence artifact archived regardless of RED/GREEN. No original source edits, no `main` writes or new proof budgets/axioms.
