# IBI-G0C-Z-IMAGE — R1 RED proof-local diagnostic (2026-11-15)

**Verdict:** RED_NOT_QUALIFIED. No original-source Z rotation image theorem accepted; full SO(3) surjectivity remains open.

## Exact tested evidence
- [Run #43754278394](https://github.com/etblink/math/actions/runs/43754278394), tested commit `c423e72139406a7a2aec5acad8c71e0b8df8f2a5`, job `132934829494`, `completed/failure`.
- Preflight, source content pins, pinned Lean 4.34.1 / Mathlib cache and original source dependency build passed.
- The first unqualified source module `IBIG0CZImage.lean` failed at 57:46 (negative complex exponential lemma), with an additional ring normalization diagnostic at 63:4. The proof goal was:
```
↑(Real.cos (θ * (1 / 2))) + ↑(-Real.sin (θ * (1 / 2))) * Complex.I =
↑(Real.cos (θ * (1 / 2))) - Complex.I * ↑(Real.sin (θ * (1 / 2)))
```
- The missing normalization is `Complex.ofReal_neg`. After `rw [harg, Complex.exp_ofReal_mul_I, Real.cos_neg, Real.sin_neg]`, convert `↑(-s)` to `-↑s` with `simp only [Complex.ofReal_neg]`, then `ring`. This is an exact proof-script repair only, not a theorem alteration.
- `#print axioms` reported `sorryAx` for both new declarations because the source proof did not close. This is a failure signal, not an accepted proof. The independent consumer and strict axiom verifier were NOT reached.
- [Preserved run artifact #14177589255](https://github.com/etblink/math/actions/runs/43754278394/artifacts/14177589255); reported zip SHA-256 `4f13945c015bda44ab68f50a06d07642cfd718778005bd590df8d2fd57470dea` (GitHub-reported, not independently rehashed).

## R2 bounded repair and stop rule
- Add only `simp only [Complex.ofReal_neg]` at the demonstrated typed goal; update the strict workflow's source SHA pin, preserve this RED memo. No existing accepted Z-generator, G0B1, Pauli-trace or inverse-Pauli bytes changed.
- If R2 reproduces the same exponential normalization error, stop local tactic churn; inspect typed normalization and proof architecture before further changes. If R2 exposes a different obligation, treat it as a new typed issue.
- The source theorem and independent-consumer contract remain unchanged. No QICLean imports or source/Fock surrogate substitution, and no change to unified integration or main.
