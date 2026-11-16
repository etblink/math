# BFSS M4-LB1C1 R3 RED — unresolved scalar instance and complex subtraction lemma elaboration

**Date:** 2026-11-16 Pacific. **Owner branch:** `integration/bfss-unified-research-20261108`. **Status:** R3 strict RED, full source `[K(A),Γ_k]` covariance UNQUALIFIED.

## Immutable evidence

- [R3 strict #43863772086](https://github.com/etblink/math/actions/runs/43863772086), tested commit `2e427346700da2dacf68b30d5a7b6ed3acd355a7`, job `133286972775`; **completed/failure**. Source Git blob `6fd6ccfeb52e7c354393c4ed0f6f884944b6dc95`. Frozen original source, qualified donors, independent consumer and toolchain preflight PASSED; Lean 4.34.1/Mathlib cache restored; actual cold native LB1C1 source FAILED; independent consumer was not reached.
- [R3 failure logs artifact #14225555376](https://github.com/etblink/math/actions/runs/43863772086/artifacts/14225555376), size 3763 bytes, GitHub-reported ZIP digest `sha256:14a93ac4241b8bcd90e1aed38c55abe40fc524b3408abc61589aee76230843e8` (not independently rehashed).
- [R3 roadmap consistency #43863772140](https://github.com/etblink/math/actions/runs/43863772140) GREEN on this same tested commit; **not** proof qualification.

## First-causal Lean diagnostics

1. LB1C1 line **68:8**: `exact smul_zero (a : ℂ)` still leaves `SMulZeroClass ℂ ?m.15` stuck, because Lean does not infer the operator carrier from the polymorphic theorem before typeclass search. Removing the surplus `Op` argument in R3 fixed the earlier function-application error but was insufficient. R4 candidate pins the equality with an explicit source `(0 : Op)` and `simpa only using (smul_zero (a : ℂ) : (a : ℂ) • (0 : Op) = (0 : Op))`.
2. LB1C1 line **172:18**: `rw [← sub_smul]` still cannot match the displayed goal `↑(a p k/2) • x p - ↑(a k p/2) • x p = (↑(a p k/2) - ↑(a k p/2)) • x p`. R4 candidate bypasses rewrite elaboration by **explicitly specializing** `sub_smul` to the two complex-coerced real coefficients and the original `(x p : Op)`, then taking `.symm`.
3. All three source-axiom reports include `sorryAx` because cold Lean proof compilation failed; independent consumer not reached. Neither a GREEN gate nor a counterexample to the algebraic target.

## R4 bounded repair and stop rule

Only the two source proof steps above change. The three exported theorem statements, original `K(A)=¼∑ A[p,q]Γ_pΓ_q`, source-48 ordering, native gamma, accepted LB0/LB1S/LB1C0 donors, frozen consumer, workflow resource limits and six standard-only axiom requirements remain unchanged. Update only the new source blob pin. Do not promote until a cold new-source build and 3+3 independent axiom reports pass with no `sorryAx`. If R4 RED, preserve its complete first-causal evidence and reconsider the finite-sum proof interface rather than raising resource limits or modifying qualified donors. The Lie bracket, coherent Fock Spin9 group, physical charge/gauge domains and spectrum remain open.
