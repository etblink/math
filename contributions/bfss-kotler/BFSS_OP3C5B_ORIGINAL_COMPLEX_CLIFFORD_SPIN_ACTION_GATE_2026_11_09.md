# BFSS OP3-C5B — Original complex Clifford Spin(9) automorphism group

**Date:** 2026-11-09
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent:** `a5180f26a40f3d8b74515036bb7907bc0cbdaa10`
**OP3-C5A:** STRICT QUALIFIED at exact parent.
**OP3-C5B:** CANDIDATE pending its own independent strict gate.
**Pins:** Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. Accepted OP3-C5A receipt and scope

[Run #42714280905](https://github.com/etblink/math/actions/runs/42714280905), attempt 1, exact tested commit `a5180f26a40f3d8b74515036bb7907bc0cbdaa10`, job `129491618608`, **SUCCESS**. Exact 21 source/consumer Git blobs, pinned Lean/Mathlib, full cold C0-C5A source build, independent typed original-carrier consumer, and both source/consumer two-root axiom audits passed with only `propext`, `Classical.choice`, `Quot.sound`. Final marker `OP3C5A_ORIGINAL_COMPLEX_CLIFFORD_BASE_CHANGE_INDEPENDENT_STRICT_PASS`; [artifact #13717837042](https://github.com/etblink/math/actions/runs/42714280905/artifacts/13717837042), GitHub-reported ZIP SHA256 `0e74a6e17e79d66bf3a8ad9a3198d1516ab445ef5ac7d00bbf3cc800104b9701` (not independently downloaded).

Accepted C5A proves a **pointwise** `ℂ`-algebra equivalence at every genuine original `spinGroup source9Quadratic` element, and exact covariance of `CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (1 ⊗ₜ[ℝ] v)` by `source9SpinOriginalPaired48OrthogonalHom` for **all** `Source48Vector` values. The first red [#42712236812](https://github.com/etblink/math/actions/runs/42712236812) was an exact Lean rewrite/coercion mismatch, repaired by `congrArg` through the original base-change tensor context with no theorem change.

## 2. Exact group packaging, no new representation

The pinned `Mathlib/RingTheory/TensorProduct/Maps.lean` supplies `Algebra.TensorProduct.congr_refl` and `congr_trans`, so tensor extension preserves identity and composition. In `Mathlib/Algebra/Algebra/Equiv.lean`, `instance aut : Group (A ≃ₐ[R] A)` uses `mul ϕ ψ := ψ.trans ϕ` and `AlgEquiv.autCongr (E.symm)` is a `MulEquiv` transporting automorphism groups across the pinned base-change equivalence `E := CliffordAlgebra.equivBaseChange ℂ source48Quadratic`.

This candidate introduces **four exact roots**:
- `source9Spin_originalComplexTensorAutomorphismHom`: original Spin(9) to automorphism group of `ℂ ⊗[ℝ] CliffordAlgebra source48Quadratic`; its group law uses the already accepted original real C4 `MonoidHom`.
- `source9Spin_originalComplexCliffordAutomorphismHom`: composition of this scalar-extended group map with `AlgEquiv.autCongr E.symm`, landing on the *original* `CliffordAlgebra (source48Quadratic.baseChange ℂ)`.
- `source9Spin_originalComplexCliffordAutomorphismHom_apply`: this packaged action equals the exact C5A accepted pointwise `AlgEquiv`, not another representation.
- `source9Spin_originalComplexCliffordAutomorphismHom_generator`: the same C5A paired-48 covariance for all pure original complex Clifford generators. It explicitly transports equality through the coercion to the algebra automorphism function, avoiding accidental rewrite mismatches.

The new source imports **only** accepted C5A; the independent consumer imports **only** new C5B source; both bind to the genuine `Source48Label`, `Source48Vector`, `source48Quadratic`, original Spin(9) and exact base-change tensor, with unchanged `√2` Majorana convention.

## 3. Strict cold acceptance and next gates

Dedicated push-triggered workflow should freeze **23 exact original/source+consumer Git blobs** plus Lean/Mathlib versions. Cold build B1, C0–C5B and separately compile source and independent consumer. Verify exactly four declaration-root `#print axioms` reports from *each*, permitting only `propext`, `Classical.choice`, `Quot.sound`; reject `sorryAx`, errors, surprise source warnings, extra roots and hidden resource increases. Retain reproducible Git SHA/blob manifest, tested commit and diagnostics artifact.

**GREEN:** accept only an actual original complex Clifford Spin(9) automorphism-valued group homomorphism and exact pointwise/generator interface. Then C6-A should transport this group representation through independently qualified **M3I** `originalComplexCliffordFockAlgEquiv : CliffordAlgebra (source48Quadratic.baseChange ℂ) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`. C6-B should independently bind the normalized original Majorana `sourceNormalizedGamma` axes via already qualified OP3-A2. Do not reprove M3I.

**RED:** inspect exact first compiler/preflight failure, fix only a typed interface under exact pins and preserve negative knowledge. If repeated same-cause reductions appear, stop to audit the type boundary before more rewrites or budget changes.

**Strict physical limit:** This is algebraic `ℂ`-automorphism evidence, not preservation of the *physical Fock adjoint*, negative center parity conjugation, Spin topology/continuity, gauge action, closed Hamiltonian form, spectral positivity, point spectrum or mass gap. The full operator-fiber weight ceiling remains `M=12` (not `M=6`).
