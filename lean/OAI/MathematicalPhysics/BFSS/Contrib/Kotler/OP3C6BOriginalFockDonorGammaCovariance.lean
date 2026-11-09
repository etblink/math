import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3C6AOriginalFockOperatorSpinAction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP3A2OriginalComplexCliffordFockSourceAxisCrosswalk

/-!
# OP3-C6B — original Fock-operator Spin(9) covariance on source donor Majoranas

Use the strictly qualified C6A action on the ACTUAL original Fermion 2
complex continuous-linear operator algebra, accepted C5B covariance
of all Source48Vector complex Clifford generators, and the already
accepted OP3-A2 M3I-to-original-donor crosswalk.

No new Fock representation, source indexing, Clifford form, normalization,
star structure, Fock-vector unitary lift, gauge action, Hamiltonian domain
or spectral assertion is introduced. Equality with the *active* original
gamma map on arbitrary vectors is explicitly deferred: OP3-A2 currently
proves the active crosswalk only on original coordinate axes.
-/

set_option autoImplicit false

namespace FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance
noncomputable section

open scoped TensorProduct
open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C5BOriginalComplexCliffordSpinAction
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction
open FCP.BFSSOP3A2OriginalComplexCliffordSourceAxis

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

/-- Covariance on the literal M3I images of every original pure real
complex Clifford generator, within the *original* Fock operator algebra. -/
theorem source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v))) =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ]
            (((source9SpinOriginalPaired48OrthogonalHom g :
              Matrix.orthogonalGroup Source48Label ℝ) :
              Matrix Source48Label Source48Label ℝ).mulVec v)) := by
  calc
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v))) =
      FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((source9Spin_originalComplexCliffordAutomorphismHom g)
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv.symm
            (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
              (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
                (1 ⊗ₜ[ℝ] v))))) :=
      source9Spin_originalFockOperatorAutomorphismHom_apply_operator g _
    _ = FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        ((source9Spin_originalComplexCliffordAutomorphismHom g)
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v))) := by
      rw [AlgEquiv.symm_apply_apply]
    _ = FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ]
            (((source9SpinOriginalPaired48OrthogonalHom g :
              Matrix.orthogonalGroup Source48Label ℝ) :
              Matrix Source48Label Source48Label ℝ).mulVec v)) :=
      congrArg FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (source9Spin_originalComplexCliffordAutomorphismHom_generator g v)

/-- Exact all-real-source-vector covariance for the original M3I
*donor* normalized Majorana map. This does not assume that the active
original gamma map agrees with the donor on all source vectors. -/
theorem source9Spin_originalFockOperatorAutomorphismHom_donorGamma
    (g : spinGroup source9Quadratic) (v : Source48Vector) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v) =
      FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) := by
  calc
    source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52L9E4.originalFockGammaRealLinear v) =
      source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
          (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
            (1 ⊗ₜ[ℝ] v))) :=
      congrArg
        (fun T : OriginalFockOp =>
          source9Spin_originalFockOperatorAutomorphismHom g T)
        (originalComplexEquiv_generator_eq_donor v).symm
    _ = FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ]
            (((source9SpinOriginalPaired48OrthogonalHom g :
              Matrix.orthogonalGroup Source48Label ℝ) :
              Matrix Source48Label Source48Label ℝ).mulVec v)) :=
      source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator g v
    _ = FCP.BFSSS1V52L9E4.originalFockGammaRealLinear
        (((source9SpinOriginalPaired48OrthogonalHom g :
          Matrix.orthogonalGroup Source48Label ℝ) :
          Matrix Source48Label Source48Label ℝ).mulVec v) :=
      originalComplexEquiv_generator_eq_donor _

#print axioms source9Spin_originalFockOperatorAutomorphismHom_M3IGenerator
#print axioms source9Spin_originalFockOperatorAutomorphismHom_donorGamma

end
end FCP.BFSSOP3C6BOriginalFockDonorGammaCovariance
