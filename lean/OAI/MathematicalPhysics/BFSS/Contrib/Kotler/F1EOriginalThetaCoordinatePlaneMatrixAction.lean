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
  -- Use explicitly typed real-scalar identities; the prior two simp-only
  -- attempts reduced matrix entries but left these operator scalar actions.
  have hsmul_zero (T : FockOp) : (0 : ℝ) • T = (0 : FockOp) :=
    zero_smul ℝ T
  have hsmul_one (T : FockOp) : (1 : ℝ) • T = T :=
    one_smul ℝ T
  have hsmul_neg_one (T : FockOp) : (-1 : ℝ) • T = -T :=
    neg_one_smul ℝ T
  by_cases hrp : r = p
  · subst r
    have hpp :
        (originalSource48CoordinatePlane p q) p p = (0 : ℝ) := by
      simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq]
    have hqp :
        (originalSource48CoordinatePlane p q) q p = (-1 : ℝ) := by
      simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq]
    simpa [hpp, hqp, hsmul_zero, hsmul_neg_one]
  · by_cases hrq : r = q
    · subst r
      have hpqcoeff :
          (originalSource48CoordinatePlane p q) p q = (1 : ℝ) := by
        simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq]
      have hqq :
          (originalSource48CoordinatePlane p q) q q = (0 : ℝ) := by
        simp [originalSource48CoordinatePlane, hpq, Ne.symm hpq]
      simpa [hpqcoeff, hqq, hsmul_zero, hsmul_one]
    · have hpr : p ≠ r := Ne.symm hrp
      have hqr : q ≠ r := Ne.symm hrq
      have hprcoeff :
          (originalSource48CoordinatePlane p q) p r = (0 : ℝ) := by
        simp [originalSource48CoordinatePlane, hrp, hrq, hpr, hqr]
      have hqrcoeff :
          (originalSource48CoordinatePlane p q) q r = (0 : ℝ) := by
        simp [originalSource48CoordinatePlane, hrp, hrq, hpr, hqr]
      simpa [hrp, hrq, hprcoeff, hqrcoeff, hsmul_zero]

#print axioms originalSource48CoordinatePlane_transpose
#print axioms originalThetaBivector_comm_coordinatePlane

end
end FCP.BFSSF1EOriginalThetaCoordinatePlane
