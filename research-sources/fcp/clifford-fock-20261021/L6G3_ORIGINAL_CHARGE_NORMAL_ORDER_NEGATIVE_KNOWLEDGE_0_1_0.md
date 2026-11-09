# BFSS L6G3 — original-charge normal-ordering failure feedback

**2026-10-12. Qualification record; the initial failed module is not accepted.**

> **Superseding accepted result:** [Gate #6](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38300167214) passed at `79701169e1b969cfd477870d87b3bd04b686120d`, source blob `1c155a708930af50534dc9cb540c48319aeae8b2`. The two targeted changes below resolved the failures without raising limits. See `L6G3_ORIGINAL_CHARGE_NORMAL_ORDER_ACCEPTED_CHECKPOINT_0_1_0.md` for the exact seven accepted source declarations and remaining Gauss obligations. The failed gate below is preserved as feedback, not a current stop.

## Failed gate #5

[Run 38299624077](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38299624077), job `114979086901`, checked commit `e99b8bbb1f4817dd90175d084a5d6dc10f2a57d2`. The proposed G3 source blob was `ddf41b0b8fc104986403a88b51a79fa37056e624`.

The original source preflight and pinned environment checks passed. The environment, accepted G1 objects, and accepted G2 object all restored in the normal PR25 merge scope. G1 and G2 proof compilations were correctly skipped; no PR-base manipulation or gamma/Fock rebuild was required.

The candidate compiled for approximately 26 seconds before emitting errors:

- The generic square expansion left `sum_x sum_i A_i A_x = sum_p sum_q A_p A_q`. Pinned simplification distributes the right finite sum first. A finite index swap is required; it does not commute the operator factors.
- Both final source applications then reached the default `isDefEq` heartbeat limit. They supplied an untyped label lambda and inferred the noncommutative ring and index types from the original smooth-core operators.
- The five source CAR, coefficient-commutation, and factorization declarations printed only `propext`, `Classical.choice`, `Quot.sound`. The two final normal-order statements printed `sorryAx` after the errors. These partial printouts do not qualify the failed file as an importable module.

The shell used `set -euo pipefail`, an actual Lean `-o` compilation, and a strict named-axiom audit. Lean's nonzero exit stopped the qualification step before the G3 object cache could be saved. The workflow remained red. A printed final theorem type is not proof acceptance.

## Targeted repair accepted in gate #6

Commit `79701169e1b969cfd477870d87b3bd04b686120d` added an explicit `Finset.sum_comm` to the generic double-sum expansion, and explicit `(R := SourceEnd N)`, `(I := FermionLabel N)`, and a typed label lambda to both source applications. It also prints the private generic normal-order theorem's axioms independently.

The source coefficient definitions, pinned Core, concrete gamma source, accepted G1/G2 modules, and proof budgets were unchanged. The refinement addresses identifiable elaboration and finite-sum interfaces; it is not a resource-limit increase or a retry of the stalled R4B/R4D family.

## Preserve the mathematical boundary

The intended result is normal ordering on the original full smooth compact core, for the literal source charge and its real-spinor linear combinations:

`Q(w)^2 = (1/2) sum_p L_p(w)^2 + (1/2) sum_pq theta_p theta_q [L_p(w), L_q(w)]`.

The delta-one CAR fixes both factors of `1/2`. Source coefficient/fermion commutation is proved from the original Core derivative and position interfaces. The commutator term remains explicit. Its identification with the original fermion multiplication and Gauss terms, physical gauge restriction, operator closure, and spectral conclusions are separate obligations.

Do not unfold the concrete `2^24` Fock representation to prove this finite algebraic transport. Do not drop the first-order orbital Gauss term or the fermionic Gauss term on unconstrained functions. Do not label a partial axiom printout, cache hit, or failed `.olean` build as a green theorem.
