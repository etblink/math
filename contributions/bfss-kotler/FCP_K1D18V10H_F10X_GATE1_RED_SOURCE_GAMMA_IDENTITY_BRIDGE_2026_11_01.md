# F10X Gate 1 RED — explicit original source gamma identity bridge (2026-11-01)

**Failed run:** [#41322416019](https://github.com/etblink/math/actions/runs/41322416019) at exact commit `d2e97e6842c41594a18c204631bbe803ff7469e0`, attempt 1, completed FAILURE. Preserve as RED, not as qualified theorem evidence.

**Preserved negative evidence:** [artifact #13090251696](https://github.com/etblink/math/actions/runs/41322416019/artifacts/13090251696), ZIP SHA256 `06a459ef5758fea033c95fd1f0d8034b1edda5e0b08f824fa954789961876d2d`.

**Passed before failure:** source blob pins (original Clifford gamma, V10E, F10W, F10X), Lean 4.34.1 + Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and full accepted F10W ancestry. Fresh F10X warning-as-error compiler failed; independent exact declaration and axiom audit skipped.

**First causal error:** `SU2BFSSPairedSpin9V10HF10XSourceCliffordGammaKernelCriterionProbe.lean:81:2`, failed to simplify `source9GammaCliffordAlgHom ((1 : spinGroup source9Quadratic) : CliffordAlgebra source9Quadratic)` to `(1 : GammaMatrix)`. In the kernel bridge `source9OriginalPairedSO48_mem_ker_iff_clifford_one`, the accepted equivalence states `Γ(g) = Γ(1)`, while the target is `Γ(g) = I16`. The earlier `simp only [MonoidHom.mem_ker, map_one]` could not see the coerced source Spin9 identity as the Clifford-algebra multiplicative identity. The failure was *coercion/normalization*, not a counterexample to the intended equivalence. The three other F10X theorem proofs had no reported compiler errors; the failed theorem and its `sorryAx` report remain unqualified.

**Smallest source-exact repair:** insert an explicitly typed local equality `hOne` for the source Clifford gamma image of the genuine source Spin9 identity, using only the ALREADY ACCEPTED `source9SpinGammaOrthogonalHom_apply 1` and its monoid `map_one`. Then pass `hOne` into the same exact `simpa only`. Do not change any of the four theorem statements, other proof bodies, or the hypothesis of the conditional even-Clifford injectivity result.

**Workflow:** update the single F10X source blob pin; all exact ancestral hashes, warning-as-error compilation, four independent exact type and root-axiom checks, timeout budgets and artifact upload remain unchanged. No sorry, axioms, surrogate gamma, changed original paired label, or resource-limit increase.

**Gate 2 is only a candidate** until its strict compiler and independent audits qualify. The even-Clifford gamma injectivity hypothesis remains OPEN, as do full Spin9 faithfulness, Spin48 lift/cover, Fock implementation and BFSS physical predictions. No main merge or external upstream PR.
