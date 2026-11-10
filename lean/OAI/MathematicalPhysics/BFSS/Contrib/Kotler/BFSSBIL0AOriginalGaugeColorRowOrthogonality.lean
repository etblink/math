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

open scoped BigOperators
open Matrix Finset
open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG3A

/-- Real orthogonality on original output colors, derived directly from
the qualified G3A column-orthogonality and pinned square matrix theorem.
The proof body follows the historically green FCP S3G source. -/
theorem originalColorRow_matrix_orthogonal (g : GaugeGroup 2) :
    adjointColorMatrix g * (adjointColorMatrix g)ᵀ = 1 :=
  mul_eq_one_comm.mp (adjointColorMatrix_orthogonal g)

#print axioms originalColorRow_matrix_orthogonal

end
end FCP.BFSSBIL0AOriginalGaugeColorRowOrthogonality
