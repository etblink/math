import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4CT0OriginalSkewBivectorTrace

/-!
# CT0 independent original-source Fock-trace consumer
Import the ACTUAL original source proofs, including the source 48
label and the source 1/4 K(A); no replacement matrix or fermionic model.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4CT0OriginalSkewBivectorTraceIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSST1OriginalFockTraceInvariance
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4LB1P0AOriginalSource48SkewPlane
open FCP.BFSSP3M4CT0OriginalSkewBivectorTrace

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFockTrace_mul_comm_consumer (X Y : Op) :
    originalFockTrace (X * Y) = originalFockTrace (Y * X) :=
  originalFockTrace_mul_comm X Y

theorem originalFock_complex_skew_symmetric_doubleSum_zero_consumer
    {ι : Type*} [Fintype ι]
    (a f : ι → ι → ℂ)
    (ha : ∀ p q, a p q = -(a q p))
    (hf : ∀ p q, f p q = f q p) :
    (∑ p : ι, ∑ q : ι, a p q * f p q) = 0 :=
  originalFock_complex_skew_symmetric_doubleSum_zero a f ha hf

theorem originalSource48BivectorK_skew_trace_zero_consumer
    (A : Matrix Source48Label Source48Label ℝ)
    (hA : A.transpose = -A) :
    originalFockTrace (originalSource48BivectorK A) = 0 :=
  originalSource48BivectorK_skew_trace_zero A hA

-- The original source zero skew matrix must have zero trace.
example :
    originalFockTrace (originalSource48BivectorK
      (0 : Matrix Source48Label Source48Label ℝ)) = 0 := by
  rw [originalSource48BivectorK_zero]
  exact map_zero originalFockTrace

-- Coincident original labels are permitted, with no distinctness hypothesis.
example (i : Source48Label) :
    originalFockTrace (originalSource48BivectorK
      (originalSource48SkewPlane i i)) = 0 :=
  originalSource48BivectorK_skew_trace_zero _
    (originalSource48SkewPlane_transpose i i)

-- Native paired source labels and the forward elementary skew plane.
example :
    originalFockTrace (originalSource48BivectorK
      (originalSource48SkewPlane
        ((0 : Fin 24), (0 : Fin 2)) ((0 : Fin 24), (1 : Fin 2)))) = 0 :=
  originalSource48BivectorK_skew_trace_zero _
    (originalSource48SkewPlane_transpose _ _)

-- Native paired source labels and reversed elementary skew orientation.
example :
    originalFockTrace (originalSource48BivectorK
      (originalSource48SkewPlane
        ((0 : Fin 24), (1 : Fin 2)) ((0 : Fin 24), (0 : Fin 2)))) = 0 :=
  originalSource48BivectorK_skew_trace_zero _
    (originalSource48SkewPlane_transpose _ _)

#print axioms originalFockTrace_mul_comm_consumer
#print axioms originalFock_complex_skew_symmetric_doubleSum_zero_consumer
#print axioms originalSource48BivectorK_skew_trace_zero_consumer

end
end FCP.BFSSP3M4CT0OriginalSkewBivectorTraceIndependentConsumer
