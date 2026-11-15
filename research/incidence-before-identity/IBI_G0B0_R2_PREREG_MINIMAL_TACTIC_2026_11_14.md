# IBI-G0B0 R2 — preregister minimal sequential tactic repair

Date: 2026-11-14 Pacific / 2026-11-15 UTC.
Status: PROSPECTIVE / UNQUALIFIED; source repair not yet tested.

R1 [#43691017217](IBI_G0B0_R1_RED_43691017217_TACTIC_LINTER_2026_11_14.md)
proved the initial linter failure is a `<;>` combinator in the
single finite-polynomial determinant theorem proof. Its cold build
finished 8924 jobs; warning-as-error source rejected line 44:2;
independent consumer did not execute.

**Only permitted repair** in
`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B0QuaternionPolynomial.lean`:

Before:
```lean
  simp [Matrix.det_fin_three, quaternionAdjointPolynomial, quaternionNormSq]
  <;> ring
```

After:
```lean
  simp [Matrix.det_fin_three, quaternionAdjointPolynomial, quaternionNormSq]
  ring
```

The original determinant statement, coefficients, normalization,
definitions, imports and `#print axioms` roots remain identical.
The separately compiled native consumer
`BFSSIBIG0B0QuaternionPolynomialIndependentConsumer.lean`
is **byte-identical** to R1. The CI workflow changes **only**
the source expected blob SHA, with the source+workflow update
created in one atomic Git commit. No timeout/linter settings,
command changes or repeated retry on unchanged bytes.

**R2 exit conditions:** pinned-source preflight; Lean 4.34.1 and
Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`;
fresh warning-as-error source, three allowed-axiom reports,
and independently compiled 3-example consumer, strict marker
and original CI evidence. Red must preserve exact first
causal evidence. No original G2A/G3A or G9 change.

**Claim ceiling:** Even a R2 green would qualify only the finite
quaternion polynomial, not the actual BFSS G3A determinant one,
SU2→SO3 image surjectivity or a physical BFSS result.
