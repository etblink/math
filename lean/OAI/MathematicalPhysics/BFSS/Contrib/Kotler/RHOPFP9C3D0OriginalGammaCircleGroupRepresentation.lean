import Mathlib.Analysis.Complex.Circle
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3COriginalGammaRelationalUnitCircleOrthogonality

/-!
# RHOPF-P9C3D0 — source-original Mathlib Circle algebraic representation

The exact original real-16 Gamma9 phase family R(a,b) is qualified:
  R(1,0)=I;
  R(a,b)R(c,d)=R(ac-bd,ad+bc);
  (a*a+b*b=1) -> R(a,b)ᵀR(a,b)=I.

Bind it to the pinned Mathlib compact group Circle of complex
numbers with norm one using original matrix carrier, with theorems:
  rho(1)=I;
  rho(z*w)=rho(z)rho(w);
  rho(z)ᵀrho(z)=I.
Also expose the resulting Circle →* GammaMatrix monoid hom.

A continuous group homomorphism or pointwise action of Circle on
source spinor vectors is not yet proved. A Hopf quotient, Fock
implementer, gauge/Hamiltonian invariance and particle interpretation
remain independent. No original gamma coordinates or source edits.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D0
noncomputable section

open OAI.BFSSQuantum
open FCP.RHOPFP9C3A
open FCP.RHOPFP9C3B1
open FCP.RHOPFP9C3C

/-- Real matrix assigned to a unit complex phase in the original
Gamma9 16-real-spinor representation. -/
noncomputable def relationalCircleMatrix (z : Circle) : GammaMatrix :=
  relationalCirclePhase (z : ℂ).re (z : ℂ).im

/-- Identity of the native Mathlib circle is the identity real matrix. -/
theorem relationalCircleMatrix_one :
    relationalCircleMatrix 1 = (1 : GammaMatrix) := by
  change relationalCirclePhase ((1 : ℂ).re) ((1 : ℂ).im) =
    (1 : GammaMatrix)
  simpa using relationalCirclePhase_one_zero

/-- Exact original-source circle group multiplication, using the
qualified real-parameter phase law and complex multiplication. -/
theorem relationalCircleMatrix_mul (z w : Circle) :
    relationalCircleMatrix (z * w) =
      relationalCircleMatrix z * relationalCircleMatrix w := by
  change
    relationalCirclePhase (((z * w : Circle) : ℂ).re)
      (((z * w : Circle) : ℂ).im) =
    relationalCirclePhase (z : ℂ).re (z : ℂ).im *
      relationalCirclePhase (w : ℂ).re (w : ℂ).im
  rw [relationalCirclePhase_mul]
  simp only [Circle.coe_mul, Complex.mul_re, Complex.mul_im]

/-- Each native Mathlib circle phase acts by an orthogonal matrix
on the full original real 16-spinor carrier. -/
theorem relationalCircleMatrix_orthogonal (z : Circle) :
    (relationalCircleMatrix z).transpose * relationalCircleMatrix z =
      (1 : GammaMatrix) := by
  have hunit :
      (z : ℂ).re * (z : ℂ).re +
      (z : ℂ).im * (z : ℂ).im = 1 := by
    simpa only [Complex.normSq_apply] using (Circle.normSq_coe z)
  exact relationalCirclePhase_orthogonal_of_unit _ _ hunit

/-- Source-original algebraic group-to-matrix-monoid homomorphism.
Continuity of this function is a separate future gate. -/
noncomputable def relationalCircleRepresentation : Circle →* GammaMatrix where
  toFun := relationalCircleMatrix
  map_one' := relationalCircleMatrix_one
  map_mul' := relationalCircleMatrix_mul

#print axioms relationalCircleMatrix_one
#print axioms relationalCircleMatrix_mul
#print axioms relationalCircleMatrix_orthogonal
#print axioms relationalCircleRepresentation

end
end FCP.RHOPFP9C3D0
