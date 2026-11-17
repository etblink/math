# BFSS QTC1 R2 — typed complex cast and explicit source-definition join

**Date:** 2026-11-16 Pacific. **Pre-gate R2 contract, not a qualification.** Single active `integration/bfss-unified-research-20261108`, no writes to `main`.

## Original R1 diagnosis and immutable RED

QTC1 R1 [strict #44020471704](https://github.com/etblink/math/actions/runs/44020471704) RED at tested `02859a9d28ec971bbd53a0f3bdad2638e87c3707`; original provider artifact #14301386967, exact SHA-256 `4effa4881bb7d33f5397873db92bfa4279e351dbda9d1991062356fe1ed73bd8`, archived ZIP Git blob `8ae6ad676712bd361d4a4a0568fc5924a3c3daa5`, complete log Git blob `aa18bfb54c64d248849508c60d6cfd7f66d32cea`, manifest and RED receipt all committed at `4d8c2063ba55880123e1b71e9b7467e6658e1af2`.

Preflight, frozen QTC0D and original source dependencies, Lean 4.34.1 and pinned Mathlib PASS. QTC1 source failed on (1) `exact_mod_cast hr` at 47:8 producing an equality in ℝ, not complex ℂ, and (2) direct large-definitional `unfold; exact ...` at 71:8 exceeding default recursion depth. Both source root audits `sorryAx`; independent consumer NEVER EXECUTED. This is a proof-elaboration failure, not a counterexample.

## Bounded R2 proof architecture

- Keep both public theorem statements **byte-identical** to R1 and leave the independent consumer source blob `24113406f779e1f2dcd769c9c400d0b897dda6a9` untouched.
- Replace only the ambiguous scalar `exact_mod_cast hr` with `push_cast; ring` on the **explicit type** `((B p q/4:ℝ):ℂ)=(1/4:ℂ)*((B p q:ℝ):ℂ)`. This is an elementary field/coercion identity and cannot change the factor or meaning.
- Replace the monolithic `unfold originalSource48BivectorK originalFockQuadratic; exact originalFock_real_quarter_quadratic (...)` with an **explicit three-leg typed calc** (native source real summation, generic proved real/complex term sum, native source complex quadratic), connecting each exact original declaration with a small `rfl` boundary, and the middle with the R1 existing generic lemma. The source must not recurse through the full original Fock/CAR carrier during a single untyped `exact`.
- Do not change original `K(B)`, source normalized `Γ_p`, `Source48Label`, existing qualified QTC0A/QTC0C/QTC0D, the exact `1/4`, or any prior GREEN/RED files. No increased maxRecDepth/maxHeartbeats, mock Fock carriers, or unproved axioms.
- Require the same strict standard-axiom whitelist, two source roots, two independent consumer roots, seven adversarial controls and six auditor mutant rejects. Independent Actions source cold build + consumer are mandatory; no acceptance from roadmap GREEN alone. Preserve the **exact provider ZIP** and full job logs regardless of R2 outcome; after another analogous RED, apply the two-attempt architecture stop and choose a different typed adapter design.

The scope is ONLY equality of original real-`K(B)` and the complex `Q_Γ(B_ℂ)` for arbitrary real B on genuine original Fock operators, not `[K(A),K(B)]` nor physical fidelity. Last qualified remains QTC0D strict [#44018395393](https://github.com/etblink/math/actions/runs/44018395393). QTC2 stays prospective.