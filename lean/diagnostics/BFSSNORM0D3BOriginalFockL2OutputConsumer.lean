import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNORM0D3BOriginalFockL2Output

/-!
# NORM-0D D1-B output — independent original SmoothCore consumer

Verify the named original FullL2 output against the pre-existing source
SmoothCore inclusion and an a.e.-equal alternate representative.
Neither consumer constructs a new Hamiltonian, multiplier nor domain.
-/
set_option autoImplicit false

namespace FCP.BFSSNORM0D3BOriginalFockL2OutputConsumer
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSNORM0COriginalNormalizedFockField
open FCP.BFSSNORM0D3BOriginalFockL2Output

/-- On the genuine original smooth core, the output class agrees
with applying the original Fock operator to the original test function. -/
theorem originalFockL2Output_smoothCore_ae
    (B : GammaMatrix) (f : SmoothCore 2) :
    (originalFockL2Output B (coreToL2 f) : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (f x)) := by
  filter_upwards [originalFockL2Output_ae B (coreToL2 f), coreToL2_ae f]
    with x haction hf
  exact haction.trans (congrArg (originalNormalizedFockGramObservable x B) hf)

/-- Separate importing consumer checks the complete public
representative-a.e. interface for actual original FullL2 inputs. -/
theorem originalFockL2Output_rep_consumer
    (B : GammaMatrix) (f : FullL2 2) (g : Boson 2 → Fermion 2)
    (hfg : (f : Boson 2 → Fermion 2) =ᵐ[volume] g) :
    (originalFockL2Output B f : Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 => originalNormalizedFockGramObservable x B (g x)) :=
  originalFockL2Output_ae_of_rep B f g hfg

#print axioms FCP.BFSSNORM0D3BOriginalFockL2Output.originalFockL2Output_ae
#print axioms FCP.BFSSNORM0D3BOriginalFockL2Output.originalFockL2Output_ae_of_rep
#print axioms originalFockL2Output_smoothCore_ae
#print axioms originalFockL2Output_rep_consumer

end
end FCP.BFSSNORM0D3BOriginalFockL2OutputConsumer
