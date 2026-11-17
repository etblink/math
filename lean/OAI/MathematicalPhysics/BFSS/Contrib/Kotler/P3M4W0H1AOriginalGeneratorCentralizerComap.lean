import Mathlib.Algebra.Algebra.Subalgebra.Basic
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0B0OriginalGammaCommutantInduction
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4W0H0OriginalScalarImageAdapter

/-!
# W0H1A — original Clifford-generator membership in source pullback centralizer

Uses Mathlib's already-defined algebraic centralizer and algebra homomorphism
preimage on the ACTUAL original complex Clifford/Fock equivalence.
This is a NEW architecture; stopped W0B1 induction is never imported.
Full Clifford generation is not asserted.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerComap
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4W0B0OriginalGammaCommutantInduction
open scoped TensorProduct

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

/-- Source algebra pulled back from the singleton centralizer in the
actual original Fock endomorphism algebra; no substitute representation. -/
def originalSourceCentralizerPullback (T : Op) : Subalgebra ℂ A :=
  Subalgebra.comap
    (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv : A →ₐ[ℂ] Op)
    (Subalgebra.centralizer ℂ ({T} : Set Op))

/-- Commutation with all 48 literal normalized original Fock Majoranas
places every original complexified Clifford generator in the source
pullback centralizer. Does NOT claim the subalgebra equals top. -/
theorem originalGenerator_mem_sourceCentralizerPullback
    (T : Op)
    (h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p))
    (w : ℂ ⊗[ℝ] Source48Vector) :
    CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w ∈
      originalSourceCentralizerPullback T := by
  rw [Subalgebra.mem_comap, Subalgebra.mem_centralizer_iff]
  intro g hg
  have hgt : g = T := Set.mem_singleton_iff.mp hg
  subst g
  exact (originalComplexEquiv_generator_commutes T h w).eq

#print axioms originalGenerator_mem_sourceCentralizerPullback

end
end FCP.BFSSP3M4W0H1AOriginalGeneratorCentralizerComap
