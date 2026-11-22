import Mathlib.Tactic
import Mathlib.LinearAlgebra.Projectivization.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D62StandardCircleProjectivePointOrbitIff

/-!
# RHOPF-P9C3D2G1D63 — standard Circle orbit quotient to algebraic projectivization

D61 gave the projective point of each standard norm-one complex two-vector.
D62 proved equality of those projective points iff the ACTUAL D49
standard Circle action connects their representatives. Here we descend
the exact projective-point map through the accepted D57 orbit Setoid and
prove the induced map is injective. Surjectivity, quotient Equiv,
projective topology, CP¹/S² Homeomorph, Hopf invariant and physical
BFSS Fock/Gauss/Hamiltonian assertions are out of scope.
-/

set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D63
noncomputable section

open FCP.RHOPFP9C3D2G1D50
open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D62

/-- Induced algebraic projective-point map on the EXACT D57 quotient
by the accepted D49 standard Circle scalar action. Its
well-definedness uses D57's genuine Setoid and D62's proved iff. -/
noncomputable def relationalStandardCircleOrbitQuotientToProjectivization
    (q : Quotient relationalEuclideanUnitCircleOrbitSetoid) :
    Projectivization ℂ (EuclideanSpace ℂ (Fin 2)) := by
  refine Quotient.liftOn' q relationalStandardUnitSphereProjectivePoint ?_
  intro x y hxy
  have hClass :
      relationalEuclideanUnitCircleOrbitClass x =
        relationalEuclideanUnitCircleOrbitClass y :=
    Quotient.sound hxy
  exact (relationalStandardUnitSphereRelated_iff_projectivePoint_eq x y).1
    ((relationalEuclideanUnitCircleRelated_iff_orbitClass_eq x y).2 hClass)

/-- The induced map of each D57 orbit class is exactly the
already qualified D61 algebraic complex projective point. -/
theorem relationalStandardCircleOrbitQuotientToProjectivization_class
    (x : {y : EuclideanSpace ℂ (Fin 2) // ‖y‖ = 1}) :
    relationalStandardCircleOrbitQuotientToProjectivization
        (relationalEuclideanUnitCircleOrbitClass x) =
      relationalStandardUnitSphereProjectivePoint x := by
  rfl

/-- Projective-point equality of two EXACT standard Circle orbit
classes implies their equality in the D57 set quotient. This is
injectivity only, not a projective quotient Equiv. -/
theorem relationalStandardCircleOrbitQuotientToProjectivization_injective :
    Function.Injective relationalStandardCircleOrbitQuotientToProjectivization := by
  intro q r hqr
  induction q, r using Quotient.inductionOn₂' with
  | _ x y =>
      change relationalStandardUnitSphereProjectivePoint x =
        relationalStandardUnitSphereProjectivePoint y at hqr
      change relationalEuclideanUnitCircleOrbitClass x =
        relationalEuclideanUnitCircleOrbitClass y
      exact (relationalEuclideanUnitCircleRelated_iff_orbitClass_eq x y).1
        ((relationalStandardUnitSphereRelated_iff_projectivePoint_eq x y).2 hqr)

#print axioms relationalStandardCircleOrbitQuotientToProjectivization
#print axioms relationalStandardCircleOrbitQuotientToProjectivization_class
#print axioms relationalStandardCircleOrbitQuotientToProjectivization_injective

end
end FCP.RHOPFP9C3D2G1D63
