# BFSS OP3-C6B — Exact original M3I donor gamma Spin(9) covariance

**Date:** 2026-11-09
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen accepted parent:** `53074a6cf2129a00bebd97ea670a9302a1633e23`
**Status:** C6A STRICT QUALIFIED; C6B CANDIDATE until its independent strict cold gate.
**Pins:** Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. Accepted C6A exact receipt

[Run #42719194702](https://github.com/etblink/math/actions/runs/42719194702), attempt 1, exact tested commit `53074a6cf2129a00bebd97ea670a9302a1633e23`, job `129508501256`, **SUCCESS**. It passed all **30** original-source Git blob pins, exactly pinned Lean/Mathlib restore, cold original C0–C6A/M3I build, independent typed original Fock-operator consumer and all three source-and-consumer root axiom checks. Only `propext`, `Classical.choice`, `Quot.sound` were reported. Final marker `OP3C6A_ORIGINAL_FOCK_OPERATOR_SPIN_ACTION_INDEPENDENT_STRICT_PASS`. [Artifact #13719714282](https://github.com/etblink/math/actions/runs/42719194702/artifacts/13719714282); GitHub-reported ZIP SHA256 `cab85014001d49b5fd1efd8ceaa3242a1e7e13071ef9f7e041e4b64142eb2dc0` (not independently downloaded).

Accepted roots in `FCP.BFSSOP3C6AOriginalFockOperatorSpinAction`: `source9Spin_originalFockOperatorAutomorphismHom` is a true genuine `spinGroup source9Quadratic →* ((Fermion 2 →L[ℂ] Fermion 2) ≃ₐ[ℂ] ...)` using exact C5B and M3I. `source9Spin_originalFockOperatorAutomorphismHom_apply` and `_apply_operator` certify that the action is exactly `M3I ∘ C5B(g) ∘ M3I⁻¹`, not a different representation.

First C6A red [#42718528244](https://github.com/etblink/math/actions/runs/42718528244) failed *before Lean* because a textual guard insisted on `source48Quadratic.baseChange ℂ` in the new consumer even though the true carrier was defined in the pinned C5B/M3I sources. The scoped repair checks the exact authoritative parent types while retaining all theorem bytes, 30 pins, independent consumer and axiom restrictions. Preserve the lesson: bind representation-integrity checks to their real source of truth, not redundant downstream spelling.

## 2. New exact source covariance gate

C6A alone gives an algebra automorphism on the full original complex Fock operator algebra, not yet its physically meaningful effect on generators. The already qualified C5B theorem maps all original pure complex Clifford generators `ι (1 ⊗ₜ[ℝ] v)` to `ι (1 ⊗ₜ[ℝ] (R₄₈(g).mulVec v))`. The accepted OP3-A2 theorem `originalComplexEquiv_generator_eq_donor` says its M3I image equals the *original donor* `FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v` for every real `Source48Vector`. Those are both original physical Fock operators.

Bounded **two-root** C6B candidate:
1. `source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator`: `α_g (M3I(ι(1⊗v))) = M3I(ι(1⊗R_gv))`. Proof uses accepted C6A `_apply_operator`, `AlgEquiv.symm_apply_apply` and `congrArg M3I` on accepted C5B `_generator`. Avoid arbitrary simplification or rebuilding source Fock representation.
2. `source9Spin_originalFockOperatorAutomorphismHom_donorGamma`: `α_g Γ_D(v) = Γ_D(R_gv)` for **all real source vectors** using exact OP3-A2 all-vector donor equality and root 1. The proof transports the accepted equalities through the original source operator automorphism with a typed `congrArg`, avoiding the earlier tensor/coercion rewrite failure.

The proposed source imports **only** C6A and OP3-A2; the independent consumer imports only C6B. This uses unchanged `Source48Label`, `Source48Vector`, original positive source quadratic form, original `Fermion 2` complex continuous-linear operators and original `√2` Majorana normalization.

## 3. Strict acceptance and next gates

Use a dedicated push-triggered strict gate freezing the **30 exact C6A source/consumer Git blobs plus 2 C6B blobs = 32**, independently compiling the original C0–C6B and the M3I/OP3-A2 roots, then compiling the candidate source and typed independent consumer with `autoImplicit=false` and warnings-as-errors. Require exactly **two** source and two consumer `#print axioms` root reports, with only `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, errors, extra roots, source warnings and proof-budget increases. Retain exact logs, tested commit, manifest and qualification receipt.

**GREEN:** accept covariance on all original M3I donor Majorana real-linear generators. Next C6C should separately prove the donor-to-active **all-vector** gamma map equality by extending the exact qualified OP3-A2 axis crosswalk over the original source basis, rather than assuming that the qualified coordinate-axis theorem implies the full linear-map equality.

**RED:** diagnose the first causal compiler/preflight failure before any repair; only preserve source-exact proof target and its assumptions, never substitute a convenient Clifford form or new Fock model. Reuse `congrArg` for coerced algebra equivalence applications where warranted, and audit any recurring failed elaboration before trying further tactics.

**Physical stop conditions:** Algebraic automorphism does not imply physical-star preservation, topological continuity, Fock-vector unitary implementability, parity-conjugation identification for the original negative center, SU(2) physical commutation, exact preservation of the original closed quadratic-form operator domains, or spectral confinement. Full operator-fiber weight bound remains `M=12`; no positive eigenvalue or mass-gap conclusion follows.


## OP3-C6B first strict RED: delimiter closure before theorem elaboration (2026-11-09)

- Failed exact [Run #42722570692](https://github.com/etblink/math/actions/runs/42722570692), original candidate commit `e13e664a37bb3796d8664c73f362ec01685ec2a0`, attempt 1, job `129519943943`, conclusion **FAILURE**. Recorded [artifact #13722575411](https://github.com/etblink/math/actions/runs/42722570692/artifacts/13722575411), GitHub-reported ZIP digest `sha256:e77bc16d53dd5a0d47ae4311c30e0aed91a467c32fc38f89b0866005f3aed14a` (artifact bytes not independently downloaded).
- Preflight passed **all 32 exact original source/consumer Git blob pins**, frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, and the cold build compiled accepted C6A ancestry. C6B source failed before independent consumer execution.
- **First causal diagnostics:** `OP3C6BOriginalFockDonorGammaCovariance.lean:48:62` and `:102:62` reported `unexpected token ':='; expected ')', ',' or ':'`. The source complex Clifford `ι` generator expression had one unclosed enclosing application in each theorem statement / calc RHS, also at source line 71. The independently typed consumer had the identical omitted closing delimiter at line 36. The reported unsolved goal at line 85 and `sorryAx` were downstream symptoms of parsing an unclosed expression. This does **not** provide mathematical qualification.
- **Bounded proposed repair:** append exactly **one** closing `)` at source lines 48, 71, 102, and consumer line 36; recheck balanced delimiters and unchanged theorem types/definitions/proof tactics. No modifications to the qualified C5B/C6A/M3I/OP3-A2 sources, original paired-48 form and labels, actual Fock carrier, allowed axiom set, cold compilation requirements, or resource budgets. Update only the two candidate Git blob pins in the strict workflow and rerun.
- **Methodological lesson:** large exact-carrier Lean propositions are especially susceptible to a missing enclosing `)` in the `M3I(ι(1⊗R_gv))` expression. Check syntax/delimiter balance before spending a long cold CI cycle or attempting to repair unsolved goals. Do not read a `sorryAx` report following a parser failure as evidence of a false theorem.
- **Qualification boundary:** OP3-C6B remains **CANDIDATE** until the revised strict gate completes both the source and independent consumer with exactly two allowed-axiom roots each. The active all-vector gamma map, physical star, Spin Fock-vector unitary, parity, SU(2) gauge and spectral claims remain unproved here.
