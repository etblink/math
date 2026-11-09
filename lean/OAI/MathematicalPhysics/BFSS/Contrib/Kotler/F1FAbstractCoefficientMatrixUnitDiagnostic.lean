import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1FAbstractCoefficientModuleDiagnostic

/-!
F1F generic matrix-unit and elementary skew-plane evaluations.

This deliberately stays in a symbolic real module and index type. It
does not elaborate the original 24-mode Fock carrier or claim equality
with the production source literal 48-label double finite sum.

The result is a reusable *abstract* coefficient-plane interface, which
is a separate obligation from its original Fock specialization.
-/

set_option autoImplicit false

namespace FCP.BFSSF1FAbstractMatrixUnits
noncomputable section

open FCP.BFSSF1FAbstractCoefficient
open scoped BigOperators

variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {M : Type*} [AddCommGroup M] [Module ℝ M]

/-- A single nonzero real matrix entry selects precisely its ordered
coefficient-family value. Finite sums remain fully symbolic here. -/
theorem rawCoefficientSum_matrixUnit
    (T : ι → ι → M) (p q : ι) :
    rawCoefficientSum T (Matrix.single p q (1 : ℝ)) = T p q := by
  unfold rawCoefficientSum
  rw [Finset.sum_eq_single p]
  · rw [Finset.sum_eq_single q]
    · simp
    · intro y _ hy
      simp [hy.symm]
    · simp
  · intro x _ hx
    simp [hx.symm]
  · simp

/-- The already verified generic half coefficient map evaluates each
source-style matrix unit with the original external half factor. -/
theorem halfCoefficientLinearMap_matrixUnit
    (T : ι → ι → M) (p q : ι) :
    halfCoefficientLinearMap T (Matrix.single p q (1 : ℝ)) =
      (1 / 2 : ℝ) • T p q := by
  rw [halfCoefficientLinearMap_apply, rawCoefficientSum_matrixUnit]

/-- The skew-plane evaluation is abstract and does not require source
Fock operator expansion or a second normalization convention. -/
theorem halfCoefficientLinearMap_skewPlane
    (T : ι → ι → M) (p q : ι) :
    halfCoefficientLinearMap T
        (Matrix.single p q (1 : ℝ) - Matrix.single q p (1 : ℝ)) =
      (1 / 2 : ℝ) • (T p q - T q p) := by
  rw [map_sub, halfCoefficientLinearMap_matrixUnit,
      halfCoefficientLinearMap_matrixUnit, smul_sub]

#print axioms rawCoefficientSum_matrixUnit
#print axioms halfCoefficientLinearMap_matrixUnit
#print axioms halfCoefficientLinearMap_skewPlane

end
end FCP.BFSSF1FAbstractMatrixUnits
