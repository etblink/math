# L6G2 — first source-row Fierz gate and exact statement repair

> **Superseding outcome:** [G2 #4](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38296484114) is green at `a334f34d74a7cf1ec67faac28a164a82c7ffce84`; the repaired module, five axiom checks and explicit final type passed. See `L6G2_ORIGINAL_ALL_SPINOR_ROW_FIERZ_ACCEPTED_CHECKPOINT_0_1_0.md`. The first-attempt failures below remain historical evidence.

**2026-10-12. Status: G2 unqualified pending the repaired gate. G1 remains accepted.**

[Homogeneous Original Source Fierz #3](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38295308241), commit `814d8b9d91c48da00b516d15a970bd0e5b109413`, restored the new pinned dependency environment and exact five accepted G1 source objects successfully. No G0, R4B, R4D, upstream or concrete gamma source was rebuilt. Lean reached G2 and emitted actual diagnostics after about ten seconds; there was no resource timeout.

## First causal failures

1. In `simp`, the short name `symm` was not unfolded as the intended `OAI.BFSSGamma.symm`; Lean rejected a term of type `Mat -> Mat` as a simp theorem. This affected the zero-spinor branch and the matrix-entry calculation. Use the full source definition name.
2. The matrix-entry sum requires the pinned API's `Matrix.sum_apply` and `Matrix.vecMulVec_apply`. Generic `Finset.sum_apply` and unfolding `vecMulVec` did not produce the intended matrix entries. The exact declarations were inspected in pinned Mathlib `Mathlib/Data/Matrix/Basic.lean` and `Mathlib/Data/Matrix/Mul.lean` at `d13f23b723b8a846827a245b89c10fc7d3f11612` before the repair.
3. The two-term summand lacked its own parentheses. Lean parsed the second term outside the finite sum and automatically introduced a free spatial `i` parameter. Thus the failed draft's parsed statement was DIFFERENT from the intended original-source Fierz identity. Parenthesize BOTH products under the sum; enable `set_option autoImplicit false` so an escaped index becomes a hard error; print the final explicit theorem type. This is why permitted axioms alone cannot establish source fidelity.

The orientation lemmas printed conventional axioms, but the COMPLETE module failed and the homogeneity/final Fierz declarations reported `sorryAx` from unclosed goals. No G2 theorem object or accepted G2 cache was produced; do not label those intermediate printouts as a G2 qualification.

## Correct scientific target

For the unchanged original gamma matrices, every real w (including zero), spatial p and spinor entries r,s:

`sum_i ((w^T gamma_i)_r (w^T gammaTwo_i,p)_s + (w^T gamma_i)_s (w^T gammaTwo_i,p)_r)`

`= (sum_alpha w_alpha^2) gamma_p[r,s] - delta_rs (w^T gamma_p w)`.

There is no extra spatial index, unit-length hypothesis, new gamma system, CAR operator conclusion or analytic-domain assertion. The repair corrects the parsed draft to this intended source equation; it does not pretend the old incorrectly parsed Lean statement was preserved. Preserve G1's frozen source blob `b3c4cb1b12c64d3e718d2c547ee29ebac2b18a36` and its accepted cache.

The next gate changes only these source-level proof/API/grouping issues, keeps existing Lean limits, and retains the full `.olean`, exact five theorem-name and permitted-axiom checks. A successful finite-source Fierz gate would remove the normalization/orientation coefficient obligation, while the actual original CAR/Gauss normal ordering and physical operator domains remain distinct tasks.
