# F10AD Gate 1 RED — source-exact Matrix.mul_sum resolution (2026-11-01)

## Failed original, retained

[Strict run #41340651169](https://github.com/etblink/math/actions/runs/41340651169) at exact SHA `8937e6b10acee1138d173e15d604241458324a88`, attempt 1, completed FAILURE. [Diagnostic artifact #13097154176](https://github.com/etblink/math/actions/runs/41340651169/artifacts/13097154176); ZIP digest `sha256:3164c56073637f50efb8d4dd96e5013fe455b86e72e306b62bdb31209906c433`.

Pinned source hashes, Lean 4.34.1 with Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and accepted F10AC ancestry passed. Strict warning-as-error F10AD compilation failed at original source line 60: `Unknown identifier mul_sum`; at line 59 the trace-of-matrix-sum proof was left incomplete. `sorryAx` appeared in diagnostics for all three dependent candidate declarations, and the separate independent audit was skipped. No theorem is qualified by this red run. This is a namespace resolution failure, not a mathematical counterexample.

## Source verified correction, Gate 2 only a candidate

The exact pinned Mathlib source `Mathlib/Data/Matrix/Mul.lean` defines a *protected* theorem `Matrix.mul_sum` for matrix multiplication distributing over finite sums. Modify ONLY `rw [mul_sum, Matrix.trace_sum]` to `rw [Matrix.mul_sum, Matrix.trace_sum]` in the first F10AD proof. Keep all three candidate theorem statements and the other proof bodies unchanged. Update only the new F10AD source blob pin in its strict workflow. No axioms, sorry, new gamma representation, private gamma table, elevated resource limits or skipped checks.

The intended new result remains the simultaneous eight-word source gamma fixed-left coefficient extraction formula `trace ((γaγb) * (∑ c, f(c)•(γaγc))) = -16*f(b)` for `a ≠ b`, plus zero-coefficient consequences. **Do not claim** full all-pair or 256-element even gamma independence, source even-Clifford injection, Spin9 faithfulness, Spin48 lift, Fock action or BFSS physics. Independent compiler and exact declaration-type/axiom checks are required before acceptance. Owner research branch only; no main or upstream changes.
