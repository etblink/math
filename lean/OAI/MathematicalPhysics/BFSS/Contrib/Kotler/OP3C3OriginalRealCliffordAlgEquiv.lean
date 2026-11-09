import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C2OriginalRealCliffordGroupLaw

/-!
# OP3-C3 — original real Clifford inverse and AlgEquiv

Package the independently qualified OP3-C2 original source Spin(9)
real Clifford AlgHom family as genuine algebra equivalences. Inverse
compositions follow from the accepted same-order group law and the
original source group identities, not a new Clifford model.

The pinned Mathlib AlgEquiv.ofAlgHom constructor packages the existing
homomorphisms. No replacement source indices or quadratic form,
unbounded physical operator, complexification, Fock star/continuity,
central-parity, gauge, Hamiltonian or spectral result is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C1OriginalRealCliffordDirectLift
open FCP.BFSSOP3C2OriginalRealCliffordGroupLaw

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

/-- Right inverse on the actual original source real Clifford algebra. -/
theorem source9Spin_originalRealCliffordAlgHom_comp_inv
    (g : spinGroup source9Quadratic) :
    (source9Spin_originalRealCliffordAlgHom g).comp
        (source9Spin_originalRealCliffordAlgHom g⁻¹) =
      AlgHom.id ℝ RealSourceClifford := by
  calc
    (source9Spin_originalRealCliffordAlgHom g).comp
        (source9Spin_originalRealCliffordAlgHom g⁻¹) =
      source9Spin_originalRealCliffordAlgHom (g * g⁻¹) :=
        (source9Spin_originalRealCliffordAlgHom_mul g g⁻¹).symm
    _ = source9Spin_originalRealCliffordAlgHom
          (1 : spinGroup source9Quadratic) := by rw [mul_inv_cancel]
    _ = AlgHom.id ℝ RealSourceClifford :=
      source9Spin_originalRealCliffordAlgHom_one

/-- Left inverse on the actual original source real Clifford algebra. -/
theorem source9Spin_originalRealCliffordAlgHom_inv_comp
    (g : spinGroup source9Quadratic) :
    (source9Spin_originalRealCliffordAlgHom g⁻¹).comp
        (source9Spin_originalRealCliffordAlgHom g) =
      AlgHom.id ℝ RealSourceClifford := by
  calc
    (source9Spin_originalRealCliffordAlgHom g⁻¹).comp
        (source9Spin_originalRealCliffordAlgHom g) =
      source9Spin_originalRealCliffordAlgHom (g⁻¹ * g) :=
        (source9Spin_originalRealCliffordAlgHom_mul g⁻¹ g).symm
    _ = source9Spin_originalRealCliffordAlgHom
          (1 : spinGroup source9Quadratic) := by rw [inv_mul_cancel]
    _ = AlgHom.id ℝ RealSourceClifford :=
      source9Spin_originalRealCliffordAlgHom_one

/-- Genuine original real Clifford algebra equivalence induced by
each original source Spin(9) element; algebraic, not a Fock unitary. -/
noncomputable def source9Spin_originalRealCliffordAlgEquiv
    (g : spinGroup source9Quadratic) :
    RealSourceClifford ≃ₐ[ℝ] RealSourceClifford :=
  AlgEquiv.ofAlgHom
    (source9Spin_originalRealCliffordAlgHom g)
    (source9Spin_originalRealCliffordAlgHom g⁻¹)
    (source9Spin_originalRealCliffordAlgHom_comp_inv g)
    (source9Spin_originalRealCliffordAlgHom_inv_comp g)

/-- The packaged equivalence uses precisely the accepted original
OP3-C1 algebra homomorphism; it does not replace the source action. -/
theorem source9Spin_originalRealCliffordAlgEquiv_toAlgHom
    (g : spinGroup source9Quadratic) :
    ((source9Spin_originalRealCliffordAlgEquiv g :
        RealSourceClifford ≃ₐ[ℝ] RealSourceClifford) :
      RealSourceClifford →ₐ[ℝ] RealSourceClifford) =
    source9Spin_originalRealCliffordAlgHom g := by
  rfl

#print axioms source9Spin_originalRealCliffordAlgHom_comp_inv
#print axioms source9Spin_originalRealCliffordAlgHom_inv_comp
#print axioms source9Spin_originalRealCliffordAlgEquiv
#print axioms source9Spin_originalRealCliffordAlgEquiv_toAlgHom

end
end FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv
