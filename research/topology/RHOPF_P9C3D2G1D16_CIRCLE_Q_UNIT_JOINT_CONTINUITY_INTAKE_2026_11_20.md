# RHOPF-P9C3D2G1D16 — original Gamma9 Circle joint continuity on Q-unit coordinates intake

**Pacific date:** 2026-11-20. **Branch:** `integration/bfss-unified-research-20261108`.  
**Status:** UNQUALIFIED until original-source/native and independently imported Lean STRICT GREEN and evidence ZIP verified.

The original G1D15 run [#44807530854](https://github.com/etblink/math/actions/runs/44807530854) at tested commit `caca10d05767c1edb029c878b2acc4a47d755b5b` strictly qualified the *genuine* original Gamma9 source Circle identity/composition laws on the exact rank-four projector range, the E-conjugated real-four coordinates and Q-unit sphere. Its original artifact SHA-256 `6370574c08972a47ef7c1cba284a8f2eee7962ee47714b44a3781aaa327ca7d8` was recomputed and all six ZIP entries inspected; acceptance preserved at commit `e63e07ba3418c3392ef7ef4c657404103d65fd77`.

## Narrow D16 target

Reuse the accepted original native `FCP.RHOPFP9C3D2F3.relationalCircleVector_joint_continuous` on `Circle × (SpinIndex → ℝ)`. The D13 original projector-range action is exactly the original native `relationalCircleVector` packaged into a subtype; its output remains in the original P-image. The G1C0 continuous linear equivalence `E` gives the real-four action by continuous conjugation; D14 packages the Q-unit subtype. Prove:
```lean
relationalCircleRangeAction_joint_continuous
relationalCircleFourAction_joint_continuous
relationalCircleQUnitAction_joint_continuous
```
in their exact typed `Continuous (fun p : Circle × X => action p.1 p.2)` forms, without smuggling in postulated complex-coordinate multiplication.

Native and independent imports each print all three `#print axioms`: `propext`, `Classical.choice`, `Quot.sound` only, no `sorryAx` or lean errors. Freeze original Gamma9, G1D13–D15, G1C0/G1C7, F3 and original signed-permutation fixture Git blob hashes. Pin Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, warnings-as-error, original artifact ZIP archiving RED and GREEN. No source Gamma9 or `main` edits.

**Later:** Having group laws and continuity on the exact Q-unit sphere does not prove scalar complex Hopf conjugacy. Next construct a compatible Q-orthonormal complex basis for `(ℝ⁴,J₄)` and verify explicit intertwining with classical scalar `Circle` action on Euclidean (S³). Do not assert the Hopf quotient, first Chern number/topological charge, original 48-Majorana BFSS Fock/gauge/Hamiltonian action or stable physical hopfion before their own source-bound gates.
