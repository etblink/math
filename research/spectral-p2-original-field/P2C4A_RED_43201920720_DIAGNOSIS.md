# P2-C4A strict-gate RED #43201920720 — additive side/order mismatch

**Failed SHA:** d8e3b7e518d91fadaa075840daa7c4a07054e2c3 on `integration/bfss-unified-research-20261108`.
**Run:** https://github.com/etblink/math/actions/runs/43201920720
**Job:** 131127230714, failure in cold source/consumer step after original dependency closure restored.
**Status:** bounded repair; no P2-C4A theorem qualified yet.

## First causal error and evidence

The exact source-pin preflight and Lean 4.34.1 / pinned Mathlib restore were successful. The original P2-C3 module compiled, and P2-C4A's first theorem `originalMasslessDensity_integral_lower` printed only standard axioms `propext`, `Classical.choice`, and `Quot.sound`. The first error occurred in `BFSSP2C4AOriginalCoreIntegralTransfer.lean:52:2`: a type mismatch for `add_le_add_left` in `originalMasslessCoreForm_lower_of_integrable`.

The goal after `rw [originalMasslessCoreForm_energy]` was `kinetic + integral(lower) ≤ kinetic + integral(actual)`. The tactic term `add_le_add_left (originalMasslessDensity_integral_lower ...) _` produced `integral(lower) + kinetic ≤ integral(actual) + kinetic`. These statements are equivalent over the reals, but Lean cannot discharge the mismatched literal order using `exact`.

The rejected declaration's `#print axioms` output included `sorryAx` due to elaboration recovery, which disqualifies the full gate. The independent consumer was NOT run. There is no evidence of a mathematical counterexample, and source coefficients, field, core density, and integrability assumptions are untouched.

## Minimal repair

Change **only** `add_le_add_left` to `add_le_add_right` in the second source theorem, preserving every theorem signature, first proof, density abbreviation, explicit `hLower`/`hActual` assumptions, and original `1/2` kinetic term. Update just the source Git blob pin in the strict workflow, preserve this diagnosis, and run a new source-and-independent-consumer strict qualification.

This repair does not prove integrability from compact support. No closed form reduction, high-Spin sector, eigenpair, or mass-gap theorem is claimed. Keep development on unified integration; no new branch or changes to main/FCP.
