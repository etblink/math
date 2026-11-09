# BFSS OP3-C6A — Original Fock-operator Spin(9) algebraic action

**Date:** November 9, 2026
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent:** `6beca063add86525506d22a429dedc6e4a09e005`
**C5B:** STRICT QUALIFIED.
**C6A:** CANDIDATE awaiting separate original-carrier strict cold gate.
**Toolchain:** Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. C5B exact accepted receipt

[Run #42716548152](https://github.com/etblink/math/actions/runs/42716548152), attempt 1, accepted commit `6beca063add86525506d22a429dedc6e4a09e005`, job `129499475654`, **SUCCESS**. Exact 23 Git source/consumer blob pins, pinned Lean/Mathlib restore and complete cold C0–C5B source compilation, independently typed consumer, exact four-root source and consumer axiom audits passed with only `propext`, `Classical.choice`, `Quot.sound`. Final receipt `OP3C5B_ORIGINAL_COMPLEX_CLIFFORD_SPIN_ACTION_INDEPENDENT_STRICT_PASS`. [Artifact #13718577608](https://github.com/etblink/math/actions/runs/42716548152/artifacts/13718577608), GitHub-reported ZIP SHA256 `674321e1064db796817236404d2827a43937b0d371e4b2c995ebeb26f3776d31` (not independently downloaded).

Accepted roots in `FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction`:
- source9Spin_originalComplexTensorAutomorphismHom: exact genuine source Spin9 →* automorphisms of the original real Clifford complexification.
- source9Spin_originalComplexCliffordAutomorphismHom: actual source Spin9 →* automorphisms of `CliffordAlgebra (source48Quadratic.baseChange ℂ)`.
- source9Spin_originalComplexCliffordAutomorphismHom_apply: same action as C5A pointwise `AlgEquiv`.
- source9Spin_originalComplexCliffordAutomorphismHom_generator: all original paired-48 pure complex generators.

No Fock vector lift, physical adjoint, continuity, gauge or spectral consequence was qualified by C5B.

## 2. Minimal exact C6A interface

The independently accepted M3I module `FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv` has *literal types* `CliffordAlgebra (source48Quadratic.baseChange ℂ) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`. It is the original 24-mode Fock space, not substitute matrices or another Fock representation. The pinned `Mathlib/Algebra/Algebra/Equiv.lean` gives a bundled group isomorphism `AlgEquiv.autCongr` with `toFun ψ := ϕ.symm.trans (ψ.trans ϕ)`. As a `MulEquiv`, `toMonoidHom.comp` transports the source group homomorphism and its multiplication law automatically.

New candidate roots in `FCP.BFSSOP3C6AOriginalFockOperatorSpinAction`:

1. `source9Spin_originalFockOperatorAutomorphismHom : spinGroup source9Quadratic →* ((Fermion 2 →L[ℂ] Fermion 2) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2))`. Exactly `(AlgEquiv.autCongr M3I).toMonoidHom.comp C5B`, with no new representation.
2. `source9Spin_originalFockOperatorAutomorphismHom_apply` establishes the exact algebra-equivalence expression `M3I.symm.trans ((C5B g).trans M3I)` rather than some unbound action.
3. `source9Spin_originalFockOperatorAutomorphismHom_apply_operator`: for every genuine source group element `g` and original source Fock operator `T`, action is literally `M3I ((C5B g) (M3I.symm T))`.

Independent original-carrier consumer uses the same exact carrier and source group, checks group identity and multiplication as **consequences** of the bundled `MonoidHom`, and consumes all three candidate roots. No full active normalized Majorana claim is bundled here.

## 3. Strict release and next research steps

Frozen proof inputs should include the **23 exact C5B pins**, direct M3I source and immediate M3H, M3D, M3G, M3C ancestor blobs, plus two C6A source/consumer blobs (**30 pins**), along with the already-pinned toolchain. Workflow cold-builds the original C0–C5B and M3I/C6A paths and separately compiles C6A source and independent consumer with warnings-as-errors and autoImplicit disabled. Require exactly three root reports each with no additional axioms beyond `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, unexpected warnings, compiler errors and budget relaxations. Retain logs and scope receipt.

**GREEN:** C6A group-level algebraic action on the actual original Fock *operator* algebra (all continuous linear maps) accepted. C6B should use qualified C5B original pure-generator covariance and M3I original generator formulas (especially OP3-A2) to prove `α_g(Γ_D(v)) = Γ_D(R_g v)` for all `Source48Vector`. A later C6C should bridge donor to active `sourceGammaRealLinear` over arbitrary vectors using a basis extension rather than assuming the existing OP3-A2 coordinate-axis agreement proves all-vector equality.

**RED:** identify first causal failure. A definitional-reduction mismatch around `AlgEquiv.autCongr` must be addressed with the exact pinned formula, not a different Fock model, added assumptions or increased proof budgets. Preserve negative evidence and stop on repeated undiagnosed failure.

**Physical stop conditions:** `AlgEquiv` does not imply physical `StarAlgEquiv`, continuity of the group action, existence of a global Fock-vector unitary, parity identity for the genuine central `-1`, gauge-physical commutation or invariance of the original closed Hamiltonian form and domains. The original operator-fiber bound is `M=12`. No normalizable positive eigenstate or mass gap follows.
