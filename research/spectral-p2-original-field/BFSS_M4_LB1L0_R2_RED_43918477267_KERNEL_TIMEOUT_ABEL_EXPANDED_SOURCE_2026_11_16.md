# BFSS M4-LB1L0 R2 RED — source-expanded native abel kernel timeout

**Date:** 2026-11-16 Pacific. **Branch:** `integration/bfss-unified-research-20261108` only. **Strict status:** RED / NOT QUALIFIED. **Action:** enact the promised stop rule; isolate typed local argument bridge in a separate diagnostic gate rather than launch third full gate or increase Lean resources.

## Immutable R2 execution

- [Strict R2 #43918477267](https://github.com/etblink/math/actions/runs/43918477267) completed **failure**, tested exact commit **`993ffb269bbeb2e8685ca3762dbc63993f3df1ed`**, job **`133478986847`**, original candidate source blob **`a90a267c3f5e5af65261aa443d7044fa093cc364`**.
- [Original logs artifact #14252013704](https://github.com/etblink/math/actions/runs/43918477267/artifacts/14252013704), size **3,175 bytes**, GitHub-reported ZIP SHA256 **`780d50444413b8e604e14a7d47f2320ed89525c75d51a4fc9e8d7fab3b2ac5cf`** (provider-reported, not independently rehashed).
- Original source, frozen qualified LB1C1/LB1C0/LB1S/LB0, gamma, consumer and Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned preflight PASS; frozen cache restoration PASS. New source native build FAILED after running final Lean compilation for ~124 s; independent consumer not reached.
- **First causal error:** `P3M4LB1L0OriginalFockProductCommutator.lean:69:16: (kernel) deterministic timeout` on the direct `simp only [sub_mul, mul_sub, mul_assoc]; abel` calc proof applied to huge original `K(A)` expression.
- **Secondary error:** `...:43:8: (kernel) unknown constant 'FCP.BFSSP3M4LB1L0OriginalFockProductCommutator.originalSource48BivectorK_skew_commutator_gamma_product._abel_1_1'`. This is downstream of the failed kernel check, not an independent new mathematical obstruction.
- Generic `originalFock_commutator_product` compiled with precisely `[propext, Classical.choice, Quot.sound]`. Native source and transpose theorem reports contained unresolved native declaration references due to kernel failure, so **not qualified**. [R2 roadmap consistency #43918477618](https://github.com/etblink/math/actions/runs/43918477618) GREEN on tested source commit only; does not establish LB1L0 acceptance.
- Prior [R1 RED #43916000648](https://github.com/etblink/math/actions/runs/43916000648), job `133470182721`, attempted direct generic-lemma instantiation and failed with **maximum recursion depth at line 67**; [preserved R1 receipt](BFSS_M4_LB1L0_R1_RED_43916000648_NATIVE_LEIBNIZ_RECURSION_2026_11_16.md).

## The new bounded diagnostic decision

Two different failures on the same expanded term—**elaboration recursion** and **kernel timeout**—mean that another direct trial in the full source is not justified. Stage D0 in a separate `lean/diagnostics` source importing **only the accepted LB1C1 module**, not the unqualified LB1L0 module.

D0 tests the exact original `Source48Label`, `originalSource48BivectorK A`, and `sourceNormalizedGamma p`, but uses `set T : Fermion 2 →L[ℂ] Fermion 2`, `set X`, `set Y` to turn large native terms into *typed source-local atoms*. First prove the generic three-atom Leibniz lemma with `simp only [sub_mul, mul_sub, mul_assoc]; abel`; then use the **qualified LB1C1 covariance** only through two typed intermediate equations `hp` and `hq`. No native-expanded `abel`, no global normalization, no increase in `maxRecDepth`, no new axiom or `sorry`. Create a **distinct D0 diagnostic CI**, preserving the separate full LB1L0 workflow without triggering another speculative full run.

Even D0 GREEN only qualifies an intermediate diagnostic, **not** full independent-consumer LB1L0 acceptance. If D0 RED, preserve first diagnostic and revise source architecture rather than force a full gate. The target Lie-bracket `[K(A),K(B)]=K(AB-BA)`, source Spin9-to-Fock global lift, SU2 gauge/16-charge domains and spectral conclusions remain OPEN.
