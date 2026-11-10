# BFSS OP3-C6C — Original active normalized Majorana all-vector Spin(9) covariance

**Date:** November 9, 2026
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen accepted parent:** `177c5306fee094ba9ccbf6e21d508e94cb544922`
**Status:** C6B STRICT QUALIFIED; C6C CANDIDATE pending independent cold gate.
**Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## 1. Accepted OP3-C6B receipt and scope

[Run #42725375970](https://github.com/etblink/math/actions/runs/42725375970), attempt 1, exact commit `177c5306fee094ba9ccbf6e21d508e94cb544922`, job `129529531114`, completed **SUCCESS**. Exactly 32 frozen original source+consumer Git blob pins, pinned toolchain restore, full cold C0–C6B original source build, independent typed Fock operator consumer and exactly two source-and-consumer axiom roots passed. Only `propext`, `Classical.choice`, `Quot.sound` appeared. Final `OP3C6B_ORIGINAL_FOCK_DONOR_GAMMA_INDEPENDENT_STRICT_PASS`. [Artifact #13723377002](https://github.com/etblink/math/actions/runs/42725375970/artifacts/13723377002); GitHub-reported ZIP SHA256 `6e0156fe84702c618934ae83eb84ea6c2d92c0fc4a36bfdd4db91016202a4d46`, not independently downloaded.

Accepted C6B roots `source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator` and `source9Spin_originalFockOperatorAutomorphismHom_donorGamma` give exact original M3I-generator covariance and `α_g Γ_D(v) = Γ_D(R₄₈(g)v)` for ALL original real `Source48Vector` values on the literal original `Fermion 2` operator algebra. The initial red [#42722570692](https://github.com/etblink/math/actions/runs/42722570692) was three unclosed source expression parentheses plus the matching consumer parenthesis; its Lean parse errors and `sorryAx` reflected syntax, not mathematical refutation. Small delimiter correction plus frozen re-pin qualified.

## 2. Source-index and basis audit

Pinned `SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe.lean` fixes original `Source48Label = Fin 24 × Fin 2`, `RealSpinBlock = Fin 8 × Fin 2`, `ColorLabel = Fin 3`, and a source-specific `sourceBlockColorEquiv : (RealSpinBlock × ColorLabel) ≃ Source48Label`. It defines `sourceBlockColorAxis α A = Pi.single (sourceBlockColorLabel α A) 1` on `Source48Vector`. This is the original real 48-dimensional input, not substitute labels or basis.

Two genuinely source-exact real-linear maps are already defined in the accepted ancestry:
- `FCP.BFSSS1V52L9E4.originalFockGammaRealLinear : Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2)` (M3I donor).
- `FCP.BFSSSource48RealLinearGamma.sourceGammaRealLinear` on the **identical** original domain and original Fock operators (active `√2`-normalized gamma).

Qualified OP3-A1 `donor_real_gamma_eq_active_on_source_axis j s A` proves donor/active equality on every true original block/color coordinate axis. The pinned Mathlib `Mathlib/LinearAlgebra/StdBasis.lean` provides `Pi.basisFun ℝ Source48Label`, `Pi.basisFun_apply` and `Basis.ext`. For any actual label p, take `q := sourceBlockColorEquiv.symm p`. Then `sourceBlockColorLabel q.1 q.2 = p` by `Equiv.apply_symm_apply`; thus `sourceBlockColorAxis q.1 q.2 = Pi.single p 1`, the exact standard basis vector. Applying `Basis.ext` to the already verified axis equality should prove equality of these two original real-linear maps WITHOUT unfolding a 48-term Fock operator sum, changing the active map, or requiring large elaboration budgets.

## 3. Two bounded candidate roots

1. `originalFockGammaRealLinear_eq_activeGammaRealLinear`: equality of the two exact original Fock operator-valued real-linear maps on every original source vector by `(Pi.basisFun ℝ Source48Label).ext`, exact source-label inversion, and accepted OP3-A1 axis crosswalk. This is stronger than OP3-A1 alone, but uses no assumptions beyond the already accepted source indexing and linear maps.
2. `source9Spin_originalFockOperatorAutomorphismHom_activeGamma`: `α_g (sourceGammaRealLinear v) = sourceGammaRealLinear ((source9SpinOriginalPaired48OrthogonalHom g).mulVec v)` for every true Spin(9) g and real source vector v. It follows from accepted C6B donor covariance by transporting across the new linear-map equality; the algebra action and `√2` normalization remain unchanged.

The C6C source imports only C6B, OP3-A1, and pinned Mathlib StdBasis; typed independent consumer imports only C6C. Freeze **37 exact pinned sources/consumers**: 32 accepted C6B pins, 3 directly relevant donor/source-crosswalk ancestor bytes not already in the set (OP3-A1, L9E4, active real-linear source gamma), and 2 C6C files. Cold build accepted C0–C6B, OP3-A1 and C6C, then compile source and independent consumer. Require exactly 2 source and 2 independent consumer axiom reports using only `propext`, `Classical.choice`, `Quot.sound`. Reject `sorryAx`, unexpected source warnings, compiler failures and proof-budget escalation; retain exact commit, source blob manifest, logs and scope receipt.

**GREEN:** accept all-vector donor/active identification and active original normalized Majorana covariance. **RED:** inspect exact first failing parser/elaborator/axiom gate; fix only source-exact interface, never replace the Fock model or hide a normalization mismatch.

## 4. Guardrails and next physical program

These two algebraic statements do not establish physical Hilbert adjoint preservation, continuity of the Spin(9) action, unitary implementers on Fock vectors, original central parity implementation, SU(2)-gauge-physical commutation, invariance of the original Hamiltonian's closed quadratic-form domain, coercive confinement, an eigenstate, or a mass gap. In particular, the pinned Mathlib Clifford default `star` negates odd generators, whereas original normalized Fock Majoranas are self-adjoint. Future physical-adjoint work must audit actual Fock star structure and its imported source qualification; no automatic `StarAlgEquiv` from M3I. The honest whole-operator weight ceiling remains `M=12`, not `M=6`.
