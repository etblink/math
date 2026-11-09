import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C1OriginalRealCliffordDirectUniversalLift

/-!
# OP3-C2 — original real Clifford identity and same-order composition

The strictly qualified OP3-C1 AlgHom family is built from the actual
paired-48 source Spin(9) matrix action. Establish its identity and
same-order multiplication on the exact original CliffordAlgebra.

The proof uses the pinned CliffordAlgebra.hom_ext universal generator
extensionality and the already qualified original Source48Label
orthogonal-group MonoidHom. No isometry-equivalence wrapper,
replacement Clifford algebra, large finite Fock sums, inverse,
complexification, physical operator star, topology, gauge or spectral
claim is introduced here.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C2OriginalRealCliffordGroupLaw
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C1OriginalRealCliffordDirectLift

private abbrev RealSourceClifford :=
  CliffordAlgebra source48Quadratic

/-- The genuine original-source Spin(9) identity induces the identity
real Clifford AlgHom. This is proved on all original source generators. -/
theorem source9Spin_originalRealCliffordAlgHom_one :
    source9Spin_originalRealCliffordAlgHom
        (1 : spinGroup source9Quadratic) =
      AlgHom.id ℝ RealSourceClifford := by
  apply CliffordAlgebra.hom_ext
  apply LinearMap.ext
  intro v
  change
    source9Spin_originalRealCliffordAlgHom
        (1 : spinGroup source9Quadratic)
        (CliffordAlgebra.ι source48Quadratic v) =
      CliffordAlgebra.ι source48Quadratic v
  rw [source9Spin_originalRealCliffordAlgHom_generator_covariance]
  rw [map_one]
  simp

/-- Same-order composition on the genuine original source Spin(9)
group and the exact original paired-48 real Clifford algebra.
No inverse or AlgEquiv is asserted here. -/
theorem source9Spin_originalRealCliffordAlgHom_mul
    (g h : spinGroup source9Quadratic) :
    source9Spin_originalRealCliffordAlgHom (g * h) =
      (source9Spin_originalRealCliffordAlgHom g).comp
        (source9Spin_originalRealCliffordAlgHom h) := by
  apply CliffordAlgebra.hom_ext
  apply LinearMap.ext
  intro v
  change
    source9Spin_originalRealCliffordAlgHom (g * h)
        (CliffordAlgebra.ι source48Quadratic v) =
      source9Spin_originalRealCliffordAlgHom g
        (source9Spin_originalRealCliffordAlgHom h
          (CliffordAlgebra.ι source48Quadratic v))
  rw [source9Spin_originalRealCliffordAlgHom_generator_covariance]
  rw [source9Spin_originalRealCliffordAlgHom_generator_covariance]
  rw [source9Spin_originalRealCliffordAlgHom_generator_covariance]
  rw [map_mul]
  simp only [Submonoid.coe_mul, Matrix.mulVec_mulVec]

#print axioms source9Spin_originalRealCliffordAlgHom_one
#print axioms source9Spin_originalRealCliffordAlgHom_mul

end
end FCP.BFSSOP3C2OriginalRealCliffordGroupLaw
