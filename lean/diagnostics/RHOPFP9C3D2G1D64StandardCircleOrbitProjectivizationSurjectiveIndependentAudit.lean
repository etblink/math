import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D64StandardCircleOrbitProjectivizationSurjective

/-! Independently imported surjectivity tests for exact standard Circle quotient. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D64Independent
noncomputable section

open FCP.RHOPFP9C3D2G1D57
open FCP.RHOPFP9C3D2G1D61
open FCP.RHOPFP9C3D2G1D63
open FCP.RHOPFP9C3D2G1D64

example :
    Function.Surjective relationalStandardUnitSphereProjectivePoint :=
  relationalStandardUnitSphereProjectivePoint_surjective

example :
    Function.Surjective relationalStandardCircleOrbitQuotientToProjectivization :=
  relationalStandardCircleOrbitQuotientToProjectivization_surjective

#print axioms FCP.RHOPFP9C3D2G1D64.relationalStandardUnitSphereProjectivePoint_surjective
#print axioms FCP.RHOPFP9C3D2G1D64.relationalStandardCircleOrbitQuotientToProjectivization_surjective

end
end FCP.RHOPFP9C3D2G1D64Independent
