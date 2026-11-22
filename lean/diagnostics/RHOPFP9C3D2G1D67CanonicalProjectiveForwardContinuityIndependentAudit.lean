import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D67CanonicalProjectiveForwardContinuity

/-! Independent imported consumer of canonical projective forward continuity. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D67Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D66
open FCP.RHOPFP9C3D2G1D67

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardUnitSphereProjectivePoint :=
  relationalStandardUnitSphereProjectivePoint_continuous

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardCircleOrbitQuotientProjectivizationEquiv :=
  relationalStandardCircleOrbitProjectivizationEquiv_continuous

#print axioms FCP.RHOPFP9C3D2G1D67.relationalStandardUnitSphereProjectivePoint_continuous
#print axioms FCP.RHOPFP9C3D2G1D67.relationalStandardCircleOrbitProjectivizationEquiv_continuous

end
end FCP.RHOPFP9C3D2G1D67Independent
