# BFSS forward research: source-exact C48-1A1 gauge covariance and original Spin(8) eigenspace route

**2026-11-10. Research only.** Scope: read-only inspection of exact source code, followed by this documentation commit. No BFSS Lean source, strict workflow, accepted proof, frozen manifest, current CI job or FCP canonical record is altered. C48-1A0 remains **UNQUALIFIED** while [#42798054277](https://github.com/etblink/math/actions/runs/42798054277) is running; this pass deliberately does not poll it. The rest of the work below is explicitly **candidate** and subject to subsequent Lean proof and independent consumer qualification.

## 1. A powerful existing chain, with precise source-bound orientation

The next operator-theoretic bridge requires no new SU(2) Fock action and no arbitrary gauge matrix.

- **G3A** `OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean`: `adjointColorMatrix q B A = pairedAlgebraData.adjointCoefficient q A B`. **Rows B are output color; columns A are input color.** It is a real SU(2) adjoint representation. Do not transpose its indices.
- **G3B/S1J** `SU2BFSSG3B24ModeOrthogonalLiftProbe.lean` and `SU2BFSSPhysicalDomainS1JActual48RealMajoranaColorActionProbe.lean`: original `Fin 24 × Fin 2` real-Majorana matrix `C_q=oneParticleMatrix(q) ⊗ I2`; each actual Fock mode's real and imaginary components transform identically.
- **G4E** `SU2BFSSG4EFermionHilbertUnitaryProbe.lean`: the genuine `fermionGaugeUnitaryHom : GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)`; do not substitute an abstract Clifford vector implementer.
- **G4G** `SU2BFSSG4GMajoranaModeCovarianceProbe.lean`: genuine `majorana0` and `majorana1` gauge covariance including the important imaginary phase and +i source convention.
- **G4H** `SU2BFSSG4HExactThetaCovarianceProbe.lean`: exact upstream `pairedAlgebraData_fermion_adjoint`: for every original `α,A,v`,

      U_q(θ_{α,A} v) = Σ_B [adjointCoefficient q A B] • θ_{α,B}(U_q v).

  It is proved for both original paired real and imaginary Majoranas and every original spin index. It uses **the same output-input ordering** as G3A.
- **Source gamma** `SU2BFSSSource48NormalizedFockGammaProbe.lean`, `SU2BFSSSource48RealLinearGammaProbe.lean`: `sourceGammaRealLinear : Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2)` is the finite real-linear sum of actual source-normalized Majoranas, and `sourceGammaRealLinear_axis_paired j s A` is exactly `(√2 : ℂ) • pairedTheta (spinPairEquiv.symm (j,s)) A`. The normalization is fixed, not arbitrary.
- **C48-0/C48-0B** strictly accepted: the source new color matrix `sourceGaugeOriginalPaired48 q` equals **actual S1J** `sourceRealMajoranaMatrix q`, and its multiplication commutes with actual original source Spin(9) matrix `S_g`. [#42779878513](https://github.com/etblink/math/actions/runs/42779878513) and [#42787913738](https://github.com/etblink/math/actions/runs/42787913738).

**New conclusion:** The exact theorem needed at C48-1A1 is not a new Fock representation or a hypothetical Spin(48) lift. It is an **extension of an existing 48-basis covariance statement to the existing real-linear gamma map**.

## 2. Recommended C48-1A1 theorem and smallest proof route

Target on the original 48 real vector, original `Fermion 2` and genuine G4E unitary:

      ∀ q v ψ,
      (fermionGaugeUnitaryHom q)
        ((sourceGammaRealLinear v) ψ)
      =
      (sourceGammaRealLinear
        ((FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q).mulVec v))
        ((fermionGaugeUnitaryHom q) ψ).

This is the **forward intertwiner** `U_q Γ(v)=Γ(C_q v) U_q`, avoiding inverse conventions and type conversions at the outset. Unitary conjugation follows only afterwards by multiplying the true inverse, with exact map/multiplication laws.

**Proof staging (recommended):**

1. **A1a — source block/color axis:** for all `j : Fin8`, `s : Fin2`, `A : ColorIndex 2`, `ψ : Fermion 2`, use `sourceGammaRealLinear_axis_paired`, G4H `pairedAlgebraData_fermion_adjoint`, and the output-color coefficient equality `adjointColorMatrix q B A = adjointCoefficient q A B`. Show the LHS equals `(√2) • Σ_B R(q) B A · pairedTheta(α,B)(U_q ψ)`. The RHS is `Γ(C_q e_{j,s,A})(U_q ψ)`; reduce its source S1J `mulVec` coefficients using `sourceRealMajoranaMatrix_entry`, `G3B.oneParticleMatrix_block`, G1A `colorModeEquiv`, and correct source `pairedLabelEquiv`. **Preserve the order** `B,A` and the same `s` (no real/imag swap). The equality of `√2`-scaled operators follows from complex-linearity; never drop `√2`.
2. **A1b — every original axis:** transport A1a along the accepted `sourceBlockColorEquiv : (Fin8 × Fin2) × ColorIndex 2 ≃ Source48Label`. Reuse source `sourceBlockColorLabel` and `sourceBlockColorAxis`; don't assume `Fintype.equivFin` matches these modes definitionally.
3. **A1c — all original vectors:** the existing `sourceGammaRealLinear` is a finite sum `∑ p, (v p) • sourceNormalizedGamma p`. Either use `Pi.basisFun ℝ Source48Label` extensionality (as OP3C6C did) after bundling the two sides as **real-linear** maps into Fock operators, or expand a single finite sum and commute with the complex-linear `U_q`; use `Matrix.mulVec` plus finite double-sum swap. Avoid a new 48×48 entry-by-entry expansion.
4. **Independent consumer:** check forward intertwiner on an arbitrary original `Source48Vector` and a literal `Pi.single` source axis, then derive the conjugation-oriented operator equality using the **actual G4E** `fermionGaugeUnitaryHom q` and its inverse. A theorem that only restates the exact new source declaration is insufficient; consume a distinct inverse or basis case.
5. **Strict manifest:** after C48-1A0 succeeds, inherit its accepted closure and separately freeze the exact G4E/G4H/source normalized gamma ancestry not already present; **recompute** pin count rather than assuming 69 or an arbitrary guessed number. Cold-build warning-as-error, independent consumer, kernel axioms, exact source type/root lists.

**High-priority proof-engineering warning:** the small index crosswalk is a real theorem, not a `rfl` assumption. C48-0B demonstrated why independently named `spinPairEquiv` and `pairedColorSpinEquiv` definitions can require the explicit inverse law. The original correct orientation is `C_q[B,A]`, not `C_q[A,B]`.

## 3. A possible *shorter downstream route*: uniqueness instead of full all-operator commutation

Accepted candidate parents to re-audit before relying on them:
- [B3 original physical-star operator action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean): a `StarAlgEquiv` action `α_g` of actual source Spin(9) on `End_ℂ(Fermion 2)`, with the genuine physical Hilbert adjoint, not a Fock-vector Spin(9) implementer.
- [C6C active gamma covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean): `α_g Γ(v) = Γ(S_g v)` on all original source vectors.
- [S1H source gauge-covariant implementer uniqueness](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean): any honest original SU(2) Fock representation satisfying the **same true 48 theta covariance** equals the existing source `fermionGaugeLinearHom`, not just up to phase.
- [S1G source scalar character triviality](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1GExactSourceRelativeCharacterTrivialityProbe.lean): genuine source SU(2) group Euler/quarter-turn calculations eliminate the residual character *under the explicit representation/covariance hypotheses*.

**Conceptual derivation conditional on A1 and accepted source group actions:** Suppose `U_q Γ(v) U_q^{-1} = Γ(C_q v)`. Then for fixed `g`, the transformed gauge family `V_g(q) = α_g(U_q)` satisfies

      V_g(q) Γ(v) V_g(q)^{-1}
        = α_g[U_q Γ(S_g^{-1}v) U_q^{-1}]
        = Γ(S_g C_q S_g^{-1}v)
        = Γ(C_q v),

because C48-0B gives `S_g C_q = C_q S_g`.

If `V_g` is an **honest original SU(2) unitary/linear-equivalence representation** with precisely S1H's theta covariance, that uniqueness theorem directly forces `V_g(q)=U_q`. This may **bypass first proving all-operator automorphism commutation** `α_g∘Ad(U_q)=Ad(U_q)∘α_g`, then killing a scalar via a separate phase calculation. But the shortcut has a real Lean type bridge: `α_g` is an operator-algebra `StarAlgEquiv` on `Fermion 2 →L[ℂ] Fermion 2`; S1H accepts `GaugeGroup 2 →* (Fermion 2 ≃ₗ[ℂ] Fermion 2)`. One must prove that the image of a genuine original unitary under the physical-star algebra automorphism admits a **source-faithful invertible complex-linear Fock operator** and the representation law, and that S1H's theta covariance matches exactly (including scalars). Do not silently identify a bounded operator with a linear equivalence or assume this proof is shorter.

**Decision gate after C48-1A1:** Compare:
- **Route R1:** generator covariance → entire Fock operator algebra action commutation via genuine M3I Clifford generation → possible scalar obstruction → S1G/S1H.
- **Route R2:** generator covariance + B3 star transport → directly construct transformed honest gauge representation `V_g` → apply **S1H uniqueness** to eliminate the scalar and establish fixedness first → deduce full algebra action commutation as a corollary.
Choose based on verified source type transport, actual dependency qualifications and number of new Lean obligations; never count both as independent physical evidence or infer a source Spin(9) Fock-vector lift.

## 4. Parallel original Spin(8) lead — projectors already nearly source-defined

The original Spin(9) ninth-axis source stabilizer `K={g | R9(g)e_9=e_9}` has genuine original source/two-sign-covering work in [axis projection](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisProjection.lean), [source covering](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCovering.lean), and [original SO(8) target coordinate equivalence](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisCoordinateEquivalence.lean). The source group `K` has **not** simply been replaced by an independently constructed Spin(8) group.

The genuine original **gamma16** map has exact source `Γ_9 = gammaNineRealLinear(e_9)` on `SpinIndex=Fin16`. The accepted gamma Clifford square gives `Γ_9²=I` for a unit ninth-axis. Define, provisionally, over the original real 16 spinor matrix algebra:

      P_plus = (I + Γ_9)/2,
      P_minus = (I - Γ_9)/2.

Then the identities are purely algebraic:
- `P_plus²=P_plus`, `P_minus²=P_minus`, `P_plus P_minus=0`, `P_plus+P_minus=I`.
- [F10L actual source eigenspace counts](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10LSourceRealEigenvalueEightEachProbe.lean) should give **rank 8 each** once the original gamma eigenvectors are tied to these explicit idempotent ranges. F10L counts are exact 8/8 at nonzero source v; the rank bridge is an additional obligation.
- Existing global original gamma covariance `source9GammaSpecialOrthogonal_intertwines` plus `K` fixing e9 gives `G9(g) Γ_9 = Γ_9 G9(g)`. Hence both P± commute with the **actual source** stabilizer action and their ranges are K-invariant.

**Best small new mathematical gate**: prove true source K-invariant rank-eight projectors on the literal original `SpinIndex=Fin16` representation. Identification as the inequivalent `8_s` and `8_c` of abstract Spin(8), and any outer triality action, remain **separate** representation-classification tests; no physical three-family interpretation follows.

## 5. Causal negative knowledge and recommended sequence

1. C48-1A1 is potentially a **source-existing-theorem transport**, not a new physical SU(2) construction. Do not refactor G4E, change the operator carrier, or use a non-original label ordering.
2. S1H uniqueness may avoid some C48-1B/C48-2 work, but **only** after the transformed representation is constructed in exactly S1H's type; B3 physical-star preservation is helpful, not the missing conversion by itself.
3. Original 8+8 gamma spectral structure gives real group-invariant subspaces, not automatically a third family, an S3-triality symmetry of the source 48 carrier, or a Spin(10) internal gauge group.
4. At no point infer global BFSS mass gap, full physical Hamiltonian covariance, 4d Standard Model chirality, dark matter, or a ToE from these algebraic gates.
5. **Do not launch new source/consumer strict run until #42798054277's outcome is relayed and the C48-1A0 acceptance or repair is settled.** Preserve this forward research as a portable memo, not proof qualification.

### Proposed immediate operational ordering

- On C48-1A0 green: qualify C48-1A1a source 48-axis intertwiner, then C48-1A1b every-vector extension with an independent consumer; evaluate R1/R2 using the actual S1H and physical-star type interfaces.
- In parallel without touching the BFSS main strict branch: produce a small original Spin(9)-stabilizer gamma-projector proof plan, reusing F10L and the source covariance/covering rather than rebuilding Spin(8) representations from scratch.

**Review ceiling:** This document is source inspection and a mathematical proof plan, not a new accepted gate, independent human validation or evidence that nature is described by matrix theory.
