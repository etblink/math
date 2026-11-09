import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3B2OriginalSource48QuadraticIsometryEquiv

/-!
Independent original-carrier consumer: quadratic IsometryEquiv
for actual Source48Label, Source48Vector, source48Quadratic,
and source spinGroup source9Quadratic. No substitute quadratic.
No Clifford automorphism / original Fock Spin action is asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3B2OriginalSource48IndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3B2OriginalSource48Isometry

example (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ) :
    Source48Vector ≃ₗ[ℝ] Source48Vector :=
  orthogonalMatrix_source48LinearEquiv A hA

example (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ) :
    source48Quadratic.IsometryEquiv source48Quadratic :=
  orthogonalMatrix_source48IsometryEquiv A hA

example (g : spinGroup source9Quadratic) :
    source48Quadratic.IsometryEquiv source48Quadratic :=
  source9SpinOriginalPaired48IsometryEquiv g

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9SpinOriginalPaired48IsometryEquiv g v =
      ((source9SpinOriginalPaired48SpecialOrthogonalHom g :
        Matrix.specialOrthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ).mulVec v :=
  source9SpinOriginalPaired48IsometryEquiv_apply g v

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source48Quadratic (source9SpinOriginalPaired48IsometryEquiv g v) =
      source48Quadratic v :=
  (source9SpinOriginalPaired48IsometryEquiv g).map_app v

#print axioms FCP.BFSSOP3B2OriginalSource48Isometry.orthogonalMatrix_source48LinearEquiv
#print axioms FCP.BFSSOP3B2OriginalSource48Isometry.orthogonalMatrix_source48IsometryEquiv
#print axioms FCP.BFSSOP3B2OriginalSource48Isometry.source9SpinOriginalPaired48IsometryEquiv
#print axioms FCP.BFSSOP3B2OriginalSource48Isometry.source9SpinOriginalPaired48IsometryEquiv_apply

end
end FCP.BFSSOP3B2OriginalSource48IndependentAudit
