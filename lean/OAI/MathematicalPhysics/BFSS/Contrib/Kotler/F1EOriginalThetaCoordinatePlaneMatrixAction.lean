import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.F1DOriginalThetaBivectorAllLabelAction
import Mathlib.Data.Matrix.Basis

/-!
F1E — literal original Source48 coordinate-plane matrix and Fock theta action.

This interface binds the qualified F1D all-label commutator to a genuine
48-by-48 real skew matrix with exactly the original paired source labels.
It does not import a surrogate 16-gamma carrier or a Spin(9) group action.

For p ≠ q, A(p,q)=+1 and A(q,p)=-1, so the F1A/F1D operator
theta_p theta_q implements A at the Majorana-generator level:
[theta_p theta_q, theta_r] = A(p,r) theta_p + A(q,r) theta_q.

This gate is not a general skew-matrix CAR implementer, LieHom, group lift,
gauge-physical action, Hamiltonian identity, or spectral theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSF1EOriginalThetaCoordinatePlane
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSFermionF2
open FCP.BFSSS1V0

private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

/-- The exact original 48-label real elementary plane: E_pq - E_qp. -/
noncomputable def originalSource48CoordinatePlane
    (p q : Source48Label) : Matrix Source48Label Source48Label ℝ :=
  Matrix.single p q 1 - Matrix.single q p 1

/-- Each literal source plane is skew-symmetric, with no index packing
or alteration of the original label type. -/
theorem originalSource48CoordinatePlane_transpose
    (p q : Source48Label) :
    (originalSource48CoordinatePlane p q).transpose =
      -(originalSource48CoordinatePlane p q) := by
  simp only [originalSource48CoordinatePlane, Matrix.transpose_sub,
    Matrix.transpose_single]
  abel

/-- The actual unnormalized original Fock bivector has precisely the
two nonzero matrix-column coefficients of the actual original 48-plane.
The opposite orientation would contradict the accepted F1A sign. -/
theorem originalThetaBivector_comm_coordinatePlane
    (p q r : Source48Label) (hpq : p ≠ q) :
    (majoranaCandidate p * majoranaCandidate q) * majoranaCandidate r -
      majoranaCandidate r * (majoranaCandidate p * majoranaCandidate q) =
      ((originalSource48CoordinatePlane p q) p r) • majoranaCandidate p +
      ((originalSource48CoordinatePlane p q) q r) • majoranaCandidate q := by
  classical
  rw [FCP.BFSSF1DOriginalThetaBivector.originalThetaBivector_comm_all_labels p q r hpq]
  by_cases hrp : r = p
  · subst r
    simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq,
      zero_smul ℝ, neg_one_smul ℝ]
  · by_cases hrq : r = q
    · subst r
      simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq,
        zero_smul ℝ, one_smul ℝ]
    · have hpr : p ≠ r := Ne.symm hrp
      have hqr : q ≠ r := Ne.symm hrq
      simp [originalSource48CoordinatePlane, hrp, hrq, hpr, hqr,
        zero_smul ℝ]

#print axioms originalSource48CoordinatePlane_transpose
#print axioms originalThetaBivector_comm_coordinatePlane

end
end FCP.BFSSF1EOriginalThetaCoordinatePlane
