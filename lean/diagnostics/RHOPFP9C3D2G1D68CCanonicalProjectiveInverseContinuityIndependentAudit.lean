import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.RHOPFP9C3D2G1D68CCanonicalProjectiveInverseContinuity

/-! Independent imported original inverse-continuity type consumer. -/
set_option autoImplicit false

namespace FCP.RHOPFP9C3D2G1D68CIndependent
noncomputable section

open FCP.RHOPFP9C3D2G1D65
open FCP.RHOPFP9C3D2G1D66
open FCP.RHOPFP9C3D2G1D68C

example :
    letI : TopologicalSpace (Projectivization ℂ (EuclideanSpace ℂ (Fin 2))) :=
      relationalCanonicalComplexProjectivizationTopology
    Continuous relationalStandardCircleOrbitQuotientProjectivizationEquiv.symm :=
  relationalStandardCircleOrbitProjectivizationEquiv_symm_continuous

#print axioms FCP.RHOPFP9C3D2G1D68C.relationalStandardCircleOrbitProjectivizationEquiv_symm_continuous

end
end FCP.RHOPFP9C3D2G1D68CIndependent
