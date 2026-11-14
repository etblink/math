# HARDY-G3 R2 prospective repair — remove three unused simplifier arguments

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
R1 #43636892909 RED at fba4a18f0ad2efa7c9a0b487ddbab5f728b906e2; exact first-causal checkpoint preserved with this record BEFORE source edits.

## Single bounded change

Remove only the three explicit mul_smul_comm arguments from simp lists in private nativeY_basis_weight, at R1 lines59,63,66. The strict compiler marks each argument unused and suggests omission. Keep every other proof step. No change to the CLM construction, actual fderiv, basis/final contraction statements, coefficients or gamma order.

Consumer 8fd1ac6d819aaccf9cabe38448813a09c75e59bb byte-identical, including all twelve native examples and transverse1/56/probe4/not8 controls. Source public definitions/statements fixed. Workflow changes only expected source hash. Keep frozen baseline 64718d564f311b914e629e8bae536327b053ee1f, exact source donors, Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, budgets, five/ten report lists and warning-as-error/unused-argument lint. Do not disable lint.

## Falsifiers and analysis

Persistent lint failure, any different source/consumer failure, control drift or unexpected axiom blocks qualification. Cold compilation and five clean R1 reports do not substitute for full strict source AND independent consumer acceptance. Second related failure => smallest typed/lint boundary diagnostic, no permutations. Static exact-delta/hash/YAML/bash/Python checks precede CI; no local Lean.

Scope remains original Y actual derivative coefficient only; no tau/charge identity, physical Spin9/Hardy/fidelity, zero mode or gap promotion. Commit before first repair mutation.
