import Mathlib.Algebra.Star.StarAlgHom
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB2OriginalFockGlobalPhysicalStar

/-!
# BFSS P2b-B3 — source-exact physical-star Spin(9) action on original Fock operators

The exact B2 theorem upgrades the already accepted C6A algebraic
Spin(9) action on the LITERAL original Fermion 2 continuous complex-linear
operator algebra to a physical Hilbert-star algebra automorphism at each
source Spin(9) element. The original C6A group law supplies a genuine
star-automorphism-valued monoid homomorphism.

This is a *packaging* gate, not an independent star theorem. There is no
new Fock carrier, substituted Clifford odd involution, new physical Hilbert
space, continuity, Fock-vector implementing unitary, gauge-fixed action,
unbounded-operator domain, or BFSS spectral assertion.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Source Spin(9) acts by physical-Hilbert-star algebra automorphisms
on the entire *original* continuous Fock operator algebra. -/
noncomputable def source9Spin_originalFockOperatorStarAlgEquiv
    (g : spinGroup source9Quadratic) :
    OriginalFockOp ≃⋆ₐ[ℂ] OriginalFockOp :=
  StarAlgEquiv.ofAlgEquiv
    (source9Spin_originalFockOperatorAutomorphismHom g)
    (source9Spin_originalFockOperator_global_map_star g)

/-- No change of the underlying algebraic source action occurs. -/
theorem source9Spin_originalFockOperatorStarAlgEquiv_apply
    (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    source9Spin_originalFockOperatorStarAlgEquiv g T =
      source9Spin_originalFockOperatorAutomorphismHom g T := rfl

/-- The original source group law holds as a star-automorphism representation,
with composition order inherited *exactly* from qualified C6A. -/
noncomputable def source9Spin_originalFockOperatorStarAutomorphismHom :
    spinGroup source9Quadratic →*
      (OriginalFockOp ≃⋆ₐ[ℂ] OriginalFockOp) where
  toFun := source9Spin_originalFockOperatorStarAlgEquiv
  map_one' := by
    apply StarAlgEquiv.ext
    intro T
    change
      source9Spin_originalFockOperatorAutomorphismHom
        (1 : spinGroup source9Quadratic) T = T
    rw [map_one]
    rfl
  map_mul' g h := by
    apply StarAlgEquiv.ext
    intro T
    change
      source9Spin_originalFockOperatorAutomorphismHom (g * h) T =
        source9Spin_originalFockOperatorAutomorphismHom g
          (source9Spin_originalFockOperatorAutomorphismHom h T)
    rw [map_mul]
    rfl

#print axioms source9Spin_originalFockOperatorStarAlgEquiv
#print axioms source9Spin_originalFockOperatorStarAlgEquiv_apply
#print axioms source9Spin_originalFockOperatorStarAutomorphismHom

end
end FCP.BFSSP2bB3OriginalFockStarAutomorphismAction
