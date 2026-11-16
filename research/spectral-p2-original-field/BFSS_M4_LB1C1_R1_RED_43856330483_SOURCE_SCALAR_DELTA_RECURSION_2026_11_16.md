# BFSS M4-LB1C1 R1 RED — original real/complex scalar interface and native covariance elaboration boundary

**Date:** 2026-11-16 Pacific; canonical owner-directed branch `integration/bfss-unified-research-20261108` ONLY, no writes to `main`.

## Immutable failure evidence

- [Strict LB1C1 R1 #43856330483](https://github.com/etblink/math/actions/runs/43856330483), `completed/failure`, attempt 1, exact tested workflow+source commit **`eb1f95bf53f315de27908f1b01dfc3dc182c2621`**, job `133261419662`. Exact new source, qualified LB1C0/LB1S/LB0 donors, original source gamma, consumer and toolchain preflight PASS; frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; actual cold LB1C1 source compile RED, no independent consumer reached.
- [R1 original logs artifact #14221048657](https://github.com/etblink/math/actions/runs/43856330483/artifacts/14221048657), size 3,905 bytes, GitHub-reported ZIP SHA256 **`09e9175456014eb14aa407e17e042c1f03931916335c557a92e74e36b419da96`** (provider-reported, not independently rehashed).
- Tested LB1C1 source Git blob **`9e39d24150d9146ffe6ac0484977a867fb269103`**, independent original-Fock consumer Git blob **`a1c186bf3a630b251e4596ecf63a1dd48c12e701`**; qualified LB1C0 donor blob `8b11930128c92bb8a499970593252de942052b1b`, accepted LB1S `d7d460fc8d2806234816e8bd2088f9cebb6addd4`, accepted LB0 `d08200fae8ef6c9c9544414307ad537f1eeaa4a4`.
- **Three intended native source axiom reports have `sorryAx` because source proof compilation failed. 3+3 full gate RED**; do not call a source/consumer theorem accepted. No mathematical counterexample has been found.

## First causal Lean diagnostics

1. **Line 46:6**, `originalFock_quarter_two`: `rw [← sourceRealComplexBridge (2:ℝ) x, smul_smul]` failed because it searches for a complex scalar `↑2 • x` although its earlier step produced a real-scalar expression; there is no globally coherent guessed real/complex tower. Use **two explicit original real→complex scalar bridge steps**, then native `smul_smul` solely for `ℂ`, with a typed real arithmetic identity `(a/4)*2=a/2` and complex coercion.
2. **Line 57:8**, `originalFock_real_smul_zero`: `smul_zero (a:ℂ)` leaves a stuck `SMulZeroClass ℂ ?m` metavariable; supply exact original Fock operator carrier explicitly to `smul_zero (a:ℂ) Op`.
3. **Lines 77/79**, deprecated `if_pos` and `if_neg`; both are forbidden by the strict warning-as-error gate. Use `ite_eq_left h` / `ite_eq_right h` or equivalent nondeprecated simplification on the named cases.
4. **Line 142:8**, real Fock operator scalar subtraction: `rw [← sub_smul, ha k p]` cannot match that particular original operator real-scalar action. Transfer each of the three terms to `ℂ` via the exact accepted real→complex bridge, use complex `sub_smul`, and the **real skew coefficient arithmetic** `a[p,k]/2 - a[k,p]/2 = a[p,k]`. Do not install a fake real module instance or pretend the operator algebra is commutative.
5. **Line 186:4**, original `hcar := originalSource48BivectorK_commutator_CAR_sum A k` at a goal expressed via source-48 local aliases hit **maximum recursion depth**. The generic source-exact double-commutator from qualified LB1C0 is available; bind first to its *native original statement*, then compose with the generic delta-contraction via named local typed summands / definitional equality, avoiding direct 48×48 full expression unification. No `maxRecDepth` or heartbeat increase.
6. Source original K(A), real 1/4 coefficient, source `Source48Label=Fin24×Fin2` gamma and all three **consumer statements/bodies** are unchanged. No new axioms or sorry.

## Stop rule and R2 scope

Make a bounded proof-only R2 fix for the **generic** source-operator scalar/zero/delta lemmas, and isolate the **native 48-label** adapter rather than modifying the established source definitions. Maintain all three theorem statements, strict pinned donors, restricted axiom reports, correct cold new `.olean`, no sorryAx/warnings. Capture any R2 red first-causal error separately before further edit. If native 48×48 elaboration remains red, change the adapter proof architecture; never loosen resource bounds.

This work does not establish Lie bracket preservation, global Fock-vector Spin9 unitary, original physical sixteen-supercharge or SU2 gauge domain covariance, a ground state, mass gap or any unification theorem.
