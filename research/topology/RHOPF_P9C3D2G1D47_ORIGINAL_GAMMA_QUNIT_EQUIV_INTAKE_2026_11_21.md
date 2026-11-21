# RHOPF-P9C3D2G1D47 — original source Gamma9 unit-sphere subtype inverse gate

**Pacific date:** 2026-11-21. **Disposition: UNQUALIFIED**, pending strict source-exact native and independent imported Lean verification and original ZIP artifact hash.

## Accepted provenance and decision boundary
Original [D46 R1 strict GREEN run #44932269163](https://github.com/etblink/math/actions/runs/44932269163) completed at exact tested `9e9b682a0166ed19ee7fa423cf6fb381869ed8d3`. Original ZIP artifact #14718851374 SHA-256 `e6b21bd32021ac703fda1fec734e859b008f947aa08c0cd16dfdaed18d82f63a` independently verified; ZIP integrity PASS, six archive members and embedded tested SHA verified. Two native and two independent `#print axioms` reports allowed only `propext`, `Classical.choice`, `Quot.sound`. Acceptance-only commit `74e9b788810a9b1696b2207aed431811cea5cc89`.

D45 original Gamma9 Q-complex isometry `E : V ≃ₗᵢ[ℂ] EuclideanSpace ℂ (Fin 2)` is source-Q norm preserving and intertwines original Gamma9 Circle phase. D46 separately proved `Q_Gamma9(x)=1 ↔ ‖E x‖=1` and a **forward restricted subtype function** from source-Q unit vectors to standard Euclidean unit vectors.

## D47 strictly bounded question
1. Construct inverse restricted subtype function from Euclidean-unit y by using **the same original-Q D45 isometry inverse** `E.symm y` and the strict D46 predicate equivalence; preserve local D38/D40/D41 instances and no alternate metric.
2. Bundle D46's original forward subtype function and D47's inverse into an `Equiv`; prove `left_inv` and `right_inv` directly using `E.symm_apply_apply` and `E.apply_symm_apply`, independent consumer checks exact types.
3. No new axioms, no `sorryAx`; all declarations explicit and recorded.

**No continuity, homeomorphism, Circle equivariance of the *restricted* map, Hopf quotient, Chern invariant, physical BFSS Fock/Gauss/Hamiltonian, or hopfion claim** is inferred. These require separate proof gates.

## Strict reproducibility
Freeze original Gamma9 SHA pins and all accepted source through D46, new D47 source and independent consumer hash, original integer signed-permutation fixture, exact Lean 4.34.1, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Require accepted full dependency build, warning-as-error native original and independently imported consumer, two native/two consumer axiom reports only `propext`, `Classical.choice`, `Quot.sound`; independently inspect original ZIP SHA, integrity and tested commit after completion. Preserve any REDs and never change accepted sources, original Gamma9 or `main`.
