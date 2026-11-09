import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C3OriginalRealCliffordAlgEquiv

/-!
# OP3-C4 — original real Clifford Spin(9) automorphism-group homomorphism

Use the accepted OP3-C3 original real Clifford AlgEquiv family and
OP3-C2 same-order group law to construct the actual algebraic MonoidHom
from source Spin(9) to automorphisms of the original real Clifford
algebra, using the pinned Mathlib AlgEquiv automorphism Group instance.

No new quadratic form, original source relabeling, replacement Fock
space, star/continuity, central-parity implementation, gauge-physical
operator, Hamiltonian or spectral conclusion is introduced here.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C4OriginalRealCliffordSpinAction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C1OriginalRealCliffordDirectLift
open FCP.BFSSOP3C2OriginalRealCliffordGroupLaw
open FCP.BFSSOP3C3OriginalRealCliffordAlgEquiv

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

/-- A genuine algebraic group homomorphism from original Spin(9)
to the automorphism group of the *original real Clifford algebra*.
The previously qualified family, not a surrogate representation,
is the entire underlying map. -/
noncomputable def source9Spin_originalRealCliffordAutomorphismHom :
    spinGroup source9Quadratic →*
      (RealSourceClifford ≃ₐ[ℝ] RealSourceClifford) where
  toFun := source9Spin_originalRealCliffordAlgEquiv
  map_one' := by
    apply AlgEquiv.coe_toAlgHom_injective
    change
      (source9Spin_originalRealCliffordAlgEquiv
          (1 : spinGroup source9Quadratic)).toAlgHom =
        AlgHom.id ℝ RealSourceClifford
    exact
      (source9Spin_originalRealCliffordAlgEquiv_toAlgHom
        (1 : spinGroup source9Quadratic)).trans
          source9Spin_originalRealCliffordAlgHom_one
  map_mul' g h := by
    apply AlgEquiv.coe_toAlgHom_injective
    change
      (source9Spin_originalRealCliffordAlgEquiv (g * h)).toAlgHom =
        (source9Spin_originalRealCliffordAlgEquiv g).toAlgHom.comp
          (source9Spin_originalRealCliffordAlgEquiv h).toAlgHom
    simpa only [source9Spin_originalRealCliffordAlgEquiv_toAlgHom] using
      (source9Spin_originalRealCliffordAlgHom_mul g h)

/-- This packaged action evaluates to exactly the accepted original
real Clifford AlgEquiv at each source group element. -/
theorem source9Spin_originalRealCliffordAutomorphismHom_apply
    (g : spinGroup source9Quadratic) :
    source9Spin_originalRealCliffordAutomorphismHom g =
      source9Spin_originalRealCliffordAlgEquiv g := rfl

/-- Original Source48Label Clifford generator covariance, directly
through the globally bundled source Spin(9) automorphism action. -/
theorem source9Spin_originalRealCliffordAutomorphismHom_generator
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalRealCliffordAutomorphismHom g
        (CliffordAlgebra.ι source48Quadratic v) =
      CliffordAlgebra.ι source48Quadratic
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) := by
  change (source9Spin_originalRealCliffordAlgEquiv g).toAlgHom
      (CliffordAlgebra.ι source48Quadratic v) = _
  rw [source9Spin_originalRealCliffordAlgEquiv_toAlgHom]
  exact source9Spin_originalRealCliffordAlgHom_generator_covariance g v

#print axioms source9Spin_originalRealCliffordAutomorphismHom
#print axioms source9Spin_originalRealCliffordAutomorphismHom_apply
#print axioms source9Spin_originalRealCliffordAutomorphismHom_generator

end
end FCP.BFSSOP3C4OriginalRealCliffordSpinAction
