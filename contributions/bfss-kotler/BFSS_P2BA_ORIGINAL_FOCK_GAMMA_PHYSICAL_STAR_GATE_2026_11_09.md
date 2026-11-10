# BFSS P2b-A — Physical Hilbert-adjoint compatibility on original Majoranas

**Prepared:** November 9, 2026
**Branch:** `integration/bfss-unified-research-20261108`
**Frozen parent (P2a):** `3dc82679cb9db1246c442dbb83276f2952c41d16`
**P2b-A status:** Candidate pending new strict source/independent-consumer gate.
**Exact toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Accepted P2a receipt and unchanged historical source

[Run #42731578061](https://github.com/etblink/math/actions/runs/42731578061), attempt 1, exact commit `3dc82679cb9db1246c442dbb83276f2952c41d16`, job `129550644910`: **success**. Exactly 41 original source and typed consumer Git blob hashes passed, Lean/Mathlib cold source build and independent consumer passed, two declaration roots in both source and consumer used only `propext`, `Classical.choice`, `Quot.sound`. Retained [artifact #13725562540](https://github.com/etblink/math/actions/runs/42731578061/artifacts/13725562540), GitHub-reported ZIP SHA256 `02b8ddb24b59c70d6c841d15766c662304953f0396ee8e20ee1bc861f8c15092` (not independently downloaded).

The original mathematical proof module `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` remains unchanged with Git blob `98889cb8607ccc64091165fbca585acb898b9ddc`. The previous [Run #40595038658](https://github.com/etblink/math/actions/runs/40595038658) failed *after Lean printed the permitted two-root axiom reports* because the verification Python script raised `re.error: unbalanced parenthesis at position 47`. The newly qualified P2a gate fixed the audit procedure, not the proof.

Strictly accepted P2a claims on the **actual original `Fermion 2` Hilbert operator carrier**:
- `sourceNormalizedGamma_selfAdjoint (p : Source48Label)` (literal `√2` normalization).
- `sourceGammaRealLinear_selfAdjoint (v : Source48Vector)` for **all real source vectors**.
- Independent consumer transports C6C's accepted `originalFockGammaRealLinear_eq_activeGammaRealLinear` equality to the M3I donor map.

Strictly accepted OP3-C6C [#42728268316](https://github.com/etblink/math/actions/runs/42728268316) established the original Spin(9) operator algebra action's covariance on the same **active** `sourceGammaRealLinear` map for all real vectors.

## Bounded new candidate: physical star on the correct generators

The first target is
```
α_g (star (Γ_active(v))) = star (α_g (Γ_active(v)))
```
for all original source Spin(9) elements `g` and real `Source48Vector` values `v`. Rewrite P2a physical self-adjointness on the input, apply C6C exact covariance, and rewrite P2a physical self-adjointness on the output. No new global star structure.

Second target explicitly tests complex conjugate scalar behavior:
```
α_g (star (z • Γ_active(v))) = star (α_g (z • Γ_active(v)))
```
for every `z : ℂ`. This uses the **actual physical adjoint** `star_smul` (conjugates `z`), `AlgEquiv.map_smul` and the first theorem. In particular, `iΓ` is generally *skew*-adjoint, not self-adjoint; do not replace `star z` by `z`.

These two exact roots **do not** prove `α_g` is a `StarAlgEquiv` on all original Fock operators. They avoid identifying CliffordAlgebra's default star `star(ι(v)) = -ι(v)` with the Hilbert adjoint, which fixes normalized real Fock Majoranas.

## Strict acceptance

- Reuse **all 41** exact P2a frozen original source/consumer hashes and append only the two P2b-A candidate source/consumer hashes: **43 pins**.
- New Lean module imports C6C and P2a; independent typed consumer imports only the candidate module. Pin C6C exact active gamma covariance, P2a unchanged self-adjoint proof and original `Fermion 2 →L[ℂ] Fermion 2` carrier.
- Fresh pinned Lean/Mathlib cold compile through C6C/P2a and new P2b-A source, then separate candidate source and independent consumer compilation using `-DautoImplicit=false -DwarningAsError=true`. Require exactly two candidate source-and-consumer roots with permitted `propext`, `Classical.choice`, `Quot.sound`; forbid `sorryAx`, hidden axioms and source warnings. Never change the accepted source or its resource options.
- A green run qualifies ONLY the real/complex-scalar Majorana star identities. No full operator action star, continuous Spin(9), Hilbert–Schmidt isometry, original gauge projection, closed Hamiltonian domain or spectral theorem is admitted.

## Planned P2b-B algebra generation route and hard stops

After this foundational gate, formalize the equality of the physical-adjoint-preservation subalgebra with the full original Fock operator algebra. Pinned `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` supplies `CliffordAlgebra.induction` and `adjoin_range_ι`, and `Mathlib/LinearAlgebra/TensorProduct/Defs.lean` supplies `TensorProduct.inductionOn` for complexified real source vectors.

A candidate proof strategy is to set `P(T) := α_g (star T) = star (α_g T)`, check closure under complex scalar multiplication, addition, multiplication (with physical `star_mul` order reversal), and source gamma generation. Show through the **actual M3I equivalence** that source gamma complex algebraically generate *every* original Fock operator. Then package a genuine `StarAlgEquiv.ofAlgEquiv`. Any proof on arbitrary complexified Clifford generators must explicitly handle the `ℂ ⊗[ℝ] Source48Vector` decomposition; C6C's real-vector covariance is not, by itself, an all-complex-vector theorem.

A second possible route transports an anti-linear reverse involution with correct complex-conjugation from the real Clifford source; NEVER transport the default odd Clifford star directly. Test `star (Complex.I • Γ(v)) = -Complex.I • Γ(v)` as a falsifier when selecting lemmas.

The full original operator-fiber representation, parity, SU(2) action and Hamiltonian remain scientifically distinct. This milestone is deliberately small enough to catch a false scalar anti-linearity assumption before a large full-generation Lean gate.
