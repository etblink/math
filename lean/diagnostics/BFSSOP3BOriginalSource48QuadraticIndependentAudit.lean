import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3BOriginalSource48QuadraticIsometryBridge

/-!
OP3-B1 independent consumer: exact original 48-real Source48Vector,
source48Quadratic and historically recovered G1A paired-label
Spin(9) → SO(48) homomorphism. No substitute quadratic carrier.

No Clifford automorphism, operator adjoint/star, continuity,
central parity, gauge-physical Hamiltonian or spectral theorem.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3BOriginalSource48QuadraticIndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford

example (A : Matrix Source48Label Source48Label ℝ)
    (hA : A ∈ Matrix.orthogonalGroup Source48Label ℝ)
    (v : Source48Vector) :
    source48Quadratic (A.mulVec v) = source48Quadratic v :=
  FCP.BFSSOP3BOriginalSource48Quadratic.orthogonal_matrix_preserves_source48Quadratic A hA v

example (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source48Quadratic
      (((source9SpinOriginalPaired48SpecialOrthogonalHom g :
        Matrix.specialOrthogonalGroup Source48Label ℝ) :
        Matrix Source48Label Source48Label ℝ).mulVec v) =
      source48Quadratic v :=
  FCP.BFSSOP3BOriginalSource48Quadratic.source9SpinOriginalPaired48_preserves_source48Quadratic g v

#print axioms FCP.BFSSOP3BOriginalSource48Quadratic.orthogonal_matrix_preserves_source48Quadratic
#print axioms FCP.BFSSOP3BOriginalSource48Quadratic.source9SpinOriginalPaired48_preserves_source48Quadratic

end
end FCP.BFSSOP3BOriginalSource48QuadraticIndependentAudit
