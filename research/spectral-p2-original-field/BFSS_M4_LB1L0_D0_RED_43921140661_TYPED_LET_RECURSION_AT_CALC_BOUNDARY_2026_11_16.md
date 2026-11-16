# BFSS M4-LB1L0 D0 RED — transparent 'set' Fock locals still recurse at native calc

**Date:** 2026-11-16 Pacific. **Owner-authorized branch:** `integration/bfss-unified-research-20261108`, `main` untouched. **D0 diagnostic RED**, NOT LB1L0 acceptance. Preserve exact evidence; do not rewrite accepted LB1C1 donor.

## Exact execution and failure

- [D0 diagnostic #43921140661](https://github.com/etblink/math/actions/runs/43921140661): `completed/failure` attempt 1 at tested commit **`e7bbe79f8e63a46b2de991a949a4744ee8bab587`**, job **`133488424906`**; diagnostic source `lean/diagnostics/BFSSP3M4LB1L0D0TypedAtomNativeProductBridge.lean` original Git blob **`05978e9fd3a57c60da0fb7e1315b0fdd8e18b8b6`**; workflow `.github/workflows/bfss-m4-lb1l0-d0-typed-atom-native-product-diagnostic.yml` original blob **`3fa8aa408d0d91f997dd025274b5772384d26184`**.
- [Original diagnostic artifact #14253248530](https://github.com/etblink/math/actions/runs/43921140661/artifacts/14253248530), size **3138 bytes**, GitHub-reported ZIP SHA256 **`3a0caffd4073ac01d7935c6fdee62a3bed4332a874b883e3aedc053142b2ed5a`** (provider reported, not independently rehashed).
- Exact D0 source/qualified LB1C1/LB1C0/LB1S/LB0/gamma/Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` hash preflight PASS. Frozen cache PASS. Cold accepted LB1C1 donor build PASS. The independent D0 diagnostic later failed at **`diagnostics/BFSSP3M4LB1L0D0TypedAtomNativeProductBridge.lean:68:2: maximum recursion depth has been reached`**, the opening `calc` of the source-specialized product covariance. No final D0 diagnostic marker; no independent full LB1L0 consumer was compiled.
- Generic `originalFock_product_three_typed_atoms` reported **only** `[propext, Classical.choice, Quot.sound]`. The source-bound `source48_gamma_product_covariance_via_typed_atoms` reported **`sorryAx`** as a result of compiler failure, NOT formal acceptance.
- [Roadmap consistency #43921140463](https://github.com/etblink/math/actions/runs/43921140463) GREEN on D0 commit, independent of mathematical qualification.

## Negative knowledge and refined architecture

- [LB1L0 R1 #43916000648](https://github.com/etblink/math/actions/runs/43916000648): elaborator recursion on direct generic-lemma application to expanded original source expression.
- [LB1L0 R2 #43918477267](https://github.com/etblink/math/actions/runs/43918477267): kernel deterministic timeout under direct `abel` normalization of that expression.
- **D0:** source term bound by `set T/X/Y : Op := ...` remains **definitionally transparent** (let-bound). `calc` still touches source expansion at line 68. This is a diagnosis/hypothesis based on source and first error, not a proven Lean elaborator trace.

## D1 falsifiable next microdiagnostic

Use the accepted source-only import and a distinct diagnostic file; retain generic `Fermion 2 →L[ℂ] Fermion 2` product identity. Replace definitionally transparent `set T/X/Y` by `generalize hT : originalSource48BivectorK A = T`, `generalize hX : sourceNormalizedGamma p = X`, `generalize hY : sourceNormalizedGamma q = Y`. These introduce **new variables with equalities**, not let-bound definitions. Prove source gamma-action witnesses `hp` and `hq` by reversing hT/hX/hY only inside those small obligations, using frozen qualified LB1C1. Then the entire native Leibniz `calc` works on opaque variables; avoid normalization or lemma matching against huge original Source48 term. The D1 diagnostic has its own workflow and exact-pinned source, donor, and toolchain, with two restricted axiom reports. **No resource increases, no new axioms, no production full-gate run.**

D1 GREEN would be architectural evidence only; a separate new full source+independent consumer six-report strict gate would still be needed. D1 RED requires retaining the new first-causal compiler error and reconsidering source-binding proof strategy without further blind repetitions.

Global original `[K(A),K(B)] = K(AB-BA)`, Spin9 Fock-vector unitary action and physical SU2/16-charge domain and spectral obligations remain OPEN. `main` unchanged.
