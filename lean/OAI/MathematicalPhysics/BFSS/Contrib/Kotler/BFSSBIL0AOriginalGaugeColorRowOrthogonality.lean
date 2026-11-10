import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG3AAdjointColorRepresentationProbe

/-!
# BIL-0A — source SU(2) adjoint-color ROW orthogonality

The qualified G3A source gives transpose(R(q))*R(q)=1, with rows
output colors and columns input colors. Original Fock theta-bilinear
color contraction requires the opposite product R(q)*transpose(R(q))=1.
Obtain it using only G3A's original group action, its inverse, and
the previously qualified input-column orthogonality. No new color
representation, Fock action, Clifford normalization or domain claim.
-/
set_option autoImplicit false

namespace FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG3A

/-- Real orthogonality on the OUTPUT-color rows of the actual original
SU(2) adjoint matrix; no determinant or separate SO(3) model assumed. -/
theorem originalColorRow_matrix_orthogonal (g : GaugeGroup 2) :
    adjointColorMatrix g * (adjointColorMatrix g)ᵀ = 1 := by
  have hcolumns : (adjointColorMatrix g)ᵀ * adjointColorMatrix g = 1 :=
    adjointColorMatrix_orthogonal g
  have hinverse : adjointColorMatrix g * adjointColorMatrix (g⁻¹) = 1 := by
    calc
      adjointColorMatrix g * adjointColorMatrix (g⁻¹) =
          adjointColorMatrix (g * g⁻¹) :=
        (adjointColorMatrix_mul g (g⁻¹)).symm
      _ = adjointColorMatrix 1 := by rw [mul_inv_cancel]
      _ = 1 := adjointColorMatrix_one
  have htranspose : (adjointColorMatrix g)ᵀ = adjointColorMatrix (g⁻¹) := by
    calc
      (adjointColorMatrix g)ᵀ =
          (adjointColorMatrix g)ᵀ *
            (adjointColorMatrix g * adjointColorMatrix (g⁻¹)) := by
              rw [hinverse, mul_one]
      _ = ((adjointColorMatrix g)ᵀ * adjointColorMatrix g) *
            adjointColorMatrix (g⁻¹) := (mul_assoc _ _ _).symm
      _ = adjointColorMatrix (g⁻¹) := by rw [hcolumns, one_mul]
  rw [htranspose]
  exact hinverse

#print axioms originalColorRow_matrix_orthogonal

end
end FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality
