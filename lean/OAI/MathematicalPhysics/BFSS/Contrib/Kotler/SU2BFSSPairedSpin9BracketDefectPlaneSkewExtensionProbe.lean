import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9BracketDefectLinearExtensionsProbe

/-!
K1D18V9L — exact source-native first finite-sum extension of
commutator-defect zero from generator-generator pairs to a fixed
coordinate generator against an arbitrary skew nine-index matrix.

Apply the accepted V9K real-linear second-argument slice to
the exact V9F 1/2 ordered-pair skew spanning expansion; every
generator-pair defect vanishes by V9K. Preserve the source-original
Fock-paired 48-real output and all native spatial index collisions.

The full arbitrary skew vs skew bracket-preservation theorem,
typed LieHom, global Spin(9) lift and BFSS physics remain separate.
-/

set_option autoImplicit false

namespace FCP.BFSSPairedSpin9Plane
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open scoped BigOperators

/-- The exact bracket defect vanishes on any native coordinate
plane in the first argument and any skew source-native 9×9 input
in the second argument. -/
theorem coordinateToPairedBracketDefect_plane_skew_right
    (r s : SpaceIndex)
    (B : Matrix SpaceIndex SpaceIndex ℝ)
    (hB : B.transpose = -B) :
    coordinateToPairedBracketDefect (coordinatePlane9 r s) B = 0 := by
  have heval (C : Matrix SpaceIndex SpaceIndex ℝ) :
      (coordinateToPairedBracketDefect_rightLinear
        (coordinatePlane9 r s)) C =
          coordinateToPairedBracketDefect (coordinatePlane9 r s) C := rfl
  calc
    coordinateToPairedBracketDefect (coordinatePlane9 r s) B =
        (coordinateToPairedBracketDefect_rightLinear
          (coordinatePlane9 r s)) B := (heval B).symm
    _ = (coordinateToPairedBracketDefect_rightLinear
          (coordinatePlane9 r s))
          ((1 / 2 : ℝ) •
            (∑ t : SpaceIndex, ∑ u : SpaceIndex,
              (B t u) • coordinatePlane9 t u)) := by
        rw [← coordinateSkewMatrix9_plane_spanning B hB]
    _ = 0 := by
        simp only [map_smul, map_sum, heval,
          coordinateToPairedBracketDefect_coordinatePlanes,
          smul_zero, Finset.sum_const_zero]

#print axioms coordinateToPairedBracketDefect_plane_skew_right

end
end FCP.BFSSPairedSpin9Plane
