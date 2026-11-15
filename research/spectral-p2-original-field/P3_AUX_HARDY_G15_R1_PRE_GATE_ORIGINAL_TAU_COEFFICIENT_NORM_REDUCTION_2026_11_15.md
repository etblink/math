# G15 R1 — preregister original tau coefficient norm reduction

REGISTERED_NOT_EXECUTED. Commit after G14 acceptance and before proof code. Accepted G14 #43749092953, exact `3e2cc5da7a2e0965f158c0683acc774bcf1a81b8`; all original donors frozen to that tested closure.

## Observation, hypothesis and target

The original tau is literally M.cliffordLinear of a_p=originalHardyY M i j X p.2 alpha p.1. Original CliffordSymbols.lean already proves cliffordLinear_sq, cliffordLinear_selfAdjoint and cliffordLinear_norm_sq for real coefficients, with CAR factor one half. Use those exact source results rather than rebuilding a Clifford proof.

For each original tau, qualify bounded-Fock self-adjointness, square=(1/2 sum_p a_p^2)I and norm(tau v)^2=(1/2 sum_p a_p^2)norm(v)^2. Then sum over the sixteen alpha labels.

For four plane pairs indexed by Fin4, first prove sum_t tau^{i_t,j_t}_alpha equals M.cliffordLinear of sum_t a_{t,p}. The aggregate norm sum is therefore

    sum_alpha norm((sum_t tau^{i_t,j_t}_alpha(X)) v)^2
      = (1/2) * (sum_alpha sum_p (sum_t a_{t,p})^2) * norm(v)^2.

Keep the square of the coefficient SUM. Replacing it by a sum of coefficient squares would drop cross-plane terms and is forbidden. No distinctness or orthogonality of planes is assumed for this reduction; repeated and reversed planes remain valid controls.

This is an exact Fock-to-real-coefficient reduction, not the final numerical tau bound, paper B.8 constant, Hardy theorem or unbounded supercharge self-adjointness. Subsequent finite gamma contractions must control the real coefficient quadratic on the actual chosen planes and legitimate bosonic weights.

## Architecture: six source roots

P3AuxHardyG15OriginalTauCoefficientNormReduction.lean imports accepted G14 only. Namespace FCP.BFSSP3AuxHardyG15OriginalTauCoefficientNormReduction:

1. originalHardyTau_sq — exact one-half scalar square on original Fermion2.
2. originalHardyTau_selfAdjoint — bounded pointwise original tau self-adjointness.
3. originalHardyTau_norm_sq — exact single-tau action norm.
4. originalHardyTau_sum_norm_sq — sum over all sixteen original charges, keeping the literal coefficient quadratic.
5. originalHardyTau_fourPlane_sum_eq_cliffordLinear — exact linear coefficient binding for the four-plane operator sum.
6. originalHardyTau_fourPlane_sum_norm_sq — aggregate four-plane norm, with cross terms retained.

No new generic helper is planned. Reuse the original Clifford results and finite sum linearity. No concrete Fock-vector expansion, new generator or source-model replacement.

## Controls, qualification and stop

Twelve literal paired controls: first six exact source-statement substitutions; single-tau norm at typed origin (generalize zero before native application); zero vector; repeated four-plane family; true tau-core FullL2 carrier; original tau-core evaluation; accepted G14 charge/tau collapse. Six donor reports: original Clifford square, self-adjointness, norm square, mixed CAR; G7 tau-core evaluation; G14 original charge/tau formula.

Require source6/native12/all12 controls and accepted early helpers1+3+1. New strict workflow independently recomputes expected169-pin closure from G14 (replace old consumer, add new source/consumer). Preserve Lean4.34.1/Mathlib pins, warnings/axioms/autoImplicit discipline, overall120/cold3600/compiler500/helper limits. No escalation.

Before publication require exact root/import/report/control/hash bindings; first-six literal source substitutions; cross-plane sum-square syntax; YAML/bash/five Python/literal preflight; positive and six negative strict-auditor fixtures; guarded checkpoint. No local Lean: static checks are not qualification.

A scalar/core/Fock mismatch, lost one-half or dropped cross term falsifies the candidate. Preserve first cause on red; repeated native conversion or equivalent source boundary requires a separately preregistered isolated diagnostic before a further full retry; two analogous reds require architecture review. No warning suppression or removed control.

On green qualify only coefficient norm reduction, then preregister the actual real gamma/quadratic estimate. Physical symmetry/energy-domain feasibility remains highest forward research; no numerical tau/Hardy/fidelity/zero-mode/gap claim follows from this reduction alone.
