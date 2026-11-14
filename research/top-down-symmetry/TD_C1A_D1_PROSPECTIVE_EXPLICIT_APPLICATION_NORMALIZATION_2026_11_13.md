# TD-C1A D1 — explicit application normalization prospective contract

**Date:** November 13, 2026 Pacific. **Experiment:** E-TD-C1A-D1-APPLICATION-NORMALIZATION-001. **Status:** preregistered before source. **Predecessor:** D0 #43554665838, seven cases pass and three actual-data joins fail.

## Tested hypothesis

D0 demonstrates that direct original pointwise source consumption passes, while matching it through U/A/B lets fails. Likewise both generic and fixed-carrier helper applications to actual gauge/gamma terms fail. Hypothesis: explicitly rewriting the operator-application boundary before final matching avoids the expensive implicit definitional conversions. This may fail; it is not a claimed repair.

Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 was inspected:
- Topology/Algebra/Module/ContinuousLinearMap/Basic.lean: ContinuousLinearMap.mul_def, comp_apply.
- Analysis/Normed/Operator/LinearIsometry.lean: LinearIsometryEquiv.coe_coe''.
- ContinuousLinearMap.mul_apply is a deprecated alias in these pins and will not be used.

## Scope

Three independent proof leaves, each 90 seconds, unchanged Lean limits:
1. Variable original-Fock operator/isometry control for these three explicit public rewrite lemmas.
2. Literal actual axis operator equality: ContinuousLinearMap.ext; explicitly normalize products/application/coercion; consume the accepted pointwise axis theorem directly without U/A/B lets.
3. Literal actual all-vector **conditional evaluation**: assume operator identity h; obtain evaluation with congrArg on a typed operator variable; normalize application explicitly in that intermediate fact; consume the resulting literal pointwise equality.

No all-vector operator identity is attempted. Conditional evaluation assumes that identity and must not be reported as proving covariance. Do not import the failed D0 roots or original full unqualified TD-C1A source.

## Controls, interpretation and stop rules

Preserve all D0 source blobs and their receipts; freeze the original axis chain and full theorem/consumer/workflow. Freshly compile/audit unchanged generic/native helpers before the original axis dependency. Then run the new leaves independently and save exact return codes, logs, roots and hashes. A failed new leaf does not suppress the others.

A positive result supports only the two measured native conversion leaves and permits a separately designed all-vector assembly. A control failure is a new interface/API obstruction. A native join failure means explicit normalization did not solve that leaf; preserve the exact first causal diagnostic and stop, with no same-turn cosmetic retry. No limit increases, global transparency changes, new axioms or alternate physical carrier.

Use a separate diagnostic-only workflow. Collection GREEN can contain failed leaves; only individual compiler/standard-axiom/warning results count. TD-C1A remains RED_UNQUALIFIED until a future unchanged independent full strict consumer qualifies the actual theorem.

## Methodological change from D0

The carrier and source data remain identical. The changed variable is **how the conversion is discharged**: explicit public equalities at a typed operator-application boundary, instead of implicit conversion when specializing an isometry helper or matching a local-let source witness.
