import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CZImage
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8RSourceNormalizedZColorFlowDiagonalProbe

/-! The original bosonic adjoint curve in the MSY color (0,1) plane.
The two native matrix donors fix the time and orientation. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYBosonicPlane01

open OAI.BFSSQuantum Matrix
open FCP.BFSSSU2GaugeG3A
open FCP.BFSSIBIG0CNativeZGenerator FCP.BFSSIBIG0CZImage
open FCP.BFSSSU2PhysicalDomainL6G6X FCP.BFSSSU2PhysicalDomainL6H5E8R

private theorem native_z_eq_half_angle (t : ℝ) :
    sourcePlusIGaugeCurve (2 : Fin 3) t = sourceZGauge (-(Real.sqrt 2 * t)) := by
  apply Subtype.ext
  change (sourcePlusIGaugeCurve (2 : Fin 3) t : ColorMatrix 2) = sourceZMatrix (-(Real.sqrt 2 * t))
  rw [source_z_gaugeCurve_diagonal_exp]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [sourceZDiagonal, sourceZMatrix, FCP.BFSSSU2.pauliScale] <;> ring_nf

/-- The adjoint of the actual native curve is the MSY (0,1) color
rotation at angle `√2 * t`, in row-output/column-input order. -/
theorem native_adjoint_plane01 (t : ℝ) :
    adjointColorMatrix (sourcePlusIGaugeCurve (2 : Fin 3) t) =
      !![Real.cos (Real.sqrt 2 * t), Real.sin (Real.sqrt 2 * t), 0;
          -Real.sin (Real.sqrt 2 * t), Real.cos (Real.sqrt 2 * t), 0;
          0, 0, 1] := by
  rw [native_z_eq_half_angle, originalAdjointColorMatrix_sourceZ_eq_rotZ]
  simp only [sourceRotZ, Real.cos_neg, Real.sin_neg, neg_neg]

#print axioms native_adjoint_plane01

end FCP.BFSSMSYBosonicPlane01
