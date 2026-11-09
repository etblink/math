# BFSS OP3-C4 — exact original Clifford automorphism group action

**Date:** November 9, 2026
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent:** `43f31887253561f8825a2dd6915847cbdd23fdb6`
**Status:** OP3-C3 **QUALIFIED**, OP3-C4 **CANDIDATE** pending independent strict gate.
**Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## OP3-C3 acceptance receipt

[Run #42707460921](https://github.com/etblink/math/actions/runs/42707460921) concluded **SUCCESS**, attempt 1, exact tested commit `43f31887253561f8825a2dd6915847cbdd23fdb6`, job `129467928339`. Exact 17 original source/consumer Git blob pins, pinned Lean and Mathlib restore, cold OP3-B1/C0/C1/C2/C3 source compilation, independent original-carrier consumer and exact four-root source/consumer axiom audits all passed. All four had only `propext`, `Classical.choice`, and `Quot.sound`. Receipt `OP3C3_ORIGINAL_REAL_CLIFFORD_ALGEQUIV_INDEPENDENT_STRICT_PASS`. [Artifact #13715775398](https://github.com/etblink/math/actions/runs/42707460921/artifacts/13715775398); GitHub-reported archive SHA256 `364f0b51f64deb20805ee6b1660febd2d9284814c5117c30f2ce262dd42f4ced` (not independently downloaded).

Exact accepted `FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv` roots: `source9Spin_originalRealCliffordAlgHom_comp_inv`, `source9Spin_originalRealCliffordAlgHom_inv_comp`, `source9Spin_originalRealCliffordAlgEquiv`, `source9Spin_originalRealCliffordAlgEquiv_toAlgHom`. This proves real Clifford `AlgEquiv` at each genuine source group element; OP3-C2 already proves homomorphism identity and multiplication at the AlgHom level.

## Next exact source interface

The pinned `Mathlib/Algebra/Algebra/Equiv.lean` defines `instance aut : Group (A ≃ₐ[R] A)` with `mul ϕ ψ := ψ.trans ϕ` so multiplication applies `ϕ (ψ x)`, matching the same-order OP3-C2 group law. It also provides `AlgEquiv.coe_toAlgHom_injective` and `AlgEquiv.toAlgHomHom`, with `map_mul' _ _ := rfl`. No custom group law or replacement representation is needed.

**Three candidate exact roots:**

1. `source9Spin_originalRealCliffordAutomorphismHom` : `spinGroup source9Quadratic →* (CliffordAlgebra source48Quadratic ≃ₐ[ℝ] CliffordAlgebra source48Quadratic)`. Identity and multiplication are proven via injectivity of the underlying `AlgHom`, OP3-C3 underlying-map equality and independently accepted OP3-C2 group law.
2. `source9Spin_originalRealCliffordAutomorphismHom_apply`: this global action evaluates to the previously qualified OP3-C3 `AlgEquiv` at every original Spin9 element.
3. `source9Spin_originalRealCliffordAutomorphismHom_generator`: on each actual `Source48Vector` generator, it gives `ι source48Quadratic (R_g.mulVec v)` with exactly the source `Source48Label` paired representation.

The source imports **only** OP3-C3; the independent consumer imports **only** OP3-C4. Do not expand the original 48-mode Fock basis or use conditional physical sector assumptions in this real algebraic gate.

## Strict acceptance contract

Dedicated push-triggered workflow freezes **19 exact source/consumer Git blobs**, Lean/Mathlib version pins and exact three-root declaration names; checks original imports and interface usage; cold-builds the original B1/C0/C1/C2/C3/C4 source ancestry, compiles a typed independent consumer, and audits each root's actual axioms independently in source and consumer. Reject `sorryAx`, unknown identifiers, compiler errors and original-source warnings; allowed roots are only `propext`, `Classical.choice`, `Quot.sound`. Retain an audit artifact with scope.

**GREEN:** accept only the original real Clifford automorphism-valued Spin(9) `MonoidHom`, exact evaluation and original generator covariance. Move to separate **complex base-change** then original M3I Fock operator algebra transport, keeping normalization, Fock CAR, source label mapping and center action explicit. **RED:** diagnose first causal Lean or preflight failure and permit only bounded exact-interface repair; if repeated same-cause failures, stop for architecture review.

**Not proved:** a *star-preserving* complex/Fock representation, unitary Fock implementer, continuity of Spin action, central `-1` fermionic parity implementer, SU(2) gauge-physical commuting action, equality on physical quadratic-form operator domains, coercivity, existence of positive normalizable eigenstates, or mass gap. The original physical model and analytical whole-operator weight bound `M=12` remain untouched.
