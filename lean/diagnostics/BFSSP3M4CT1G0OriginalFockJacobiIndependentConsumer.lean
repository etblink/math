import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M4CT1G0OriginalFockJacobiSource48Adapter

/-!
# CT1-G0 — independent source-importing original-Fock consumer

Three theorem statements are restated from the built source module.
Four independent controls include arbitrary noncommutative operators,
zero and same-input cases, and literal source48 paired-label controls.
-/

set_option autoImplicit false

namespace FCP.BFSSP3M4CT1G0OriginalFockJacobiIndependentConsumer
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSSource48NormalizedFockGamma
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector
open FCP.BFSSP3M4CT1G0OriginalFockJacobiSource48Adapter

private abbrev Op := Fermion 2 →L[ℂ] Fermion 2

theorem originalFock_commutator_jacobi_consumer (T S X : Op) :
    (T * S - S * T) * X - X * (T * S - S * T) =
      (T * (S * X - X * S) - (S * X - X * S) * T) -
        (S * (T * X - X * T) - (T * X - X * T) * S) :=
  originalFock_commutator_jacobi T S X

theorem originalFock_commutator_sub_consumer (T S X : Op) :
    (T - S) * X - X * (T - S) =
      (T * X - X * T) - (S * X - X * S) :=
  originalFock_commutator_sub T S X

theorem originalSource48K_commutator_jacobi_consumer
    (A B : Matrix Source48Label Source48Label ℝ) (k : Source48Label) :
    (originalSource48BivectorK A * originalSource48BivectorK B -
       originalSource48BivectorK B * originalSource48BivectorK A) *
        sourceNormalizedGamma k -
      sourceNormalizedGamma k *
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) =
      (originalSource48BivectorK A *
          (originalSource48BivectorK B * sourceNormalizedGamma k -
            sourceNormalizedGamma k * originalSource48BivectorK B) -
        (originalSource48BivectorK B * sourceNormalizedGamma k -
          sourceNormalizedGamma k * originalSource48BivectorK B) *
            originalSource48BivectorK A) -
      (originalSource48BivectorK B *
          (originalSource48BivectorK A * sourceNormalizedGamma k -
            sourceNormalizedGamma k * originalSource48BivectorK A) -
        (originalSource48BivectorK A * sourceNormalizedGamma k -
          sourceNormalizedGamma k * originalSource48BivectorK A) *
            originalSource48BivectorK B) :=
  originalSource48K_commutator_jacobi A B k

-- Control 1: arbitrary literal Fock operators, no commutativity.
example (T S X : Op) :
    (T - S) * X - X * (T - S) =
      (T * X - X * T) - (S * X - X * S) :=
  originalFock_commutator_sub T S X

-- Control 2: the zero left Jacobi input.
example (S X : Op) :
    ((0 : Op) * S - S * (0 : Op)) * X -
      X * ((0 : Op) * S - S * (0 : Op)) =
      ((0 : Op) * (S * X - X * S) -
        (S * X - X * S) * (0 : Op)) -
      (S * ((0 : Op) * X - X * (0 : Op)) -
        ((0 : Op) * X - X * (0 : Op)) * S) :=
  originalFock_commutator_jacobi 0 S X

-- Control 3: repeated original source 48-axis; no label distinctness.
example (A : Matrix Source48Label Source48Label ℝ) :
    (originalSource48BivectorK A * originalSource48BivectorK A -
       originalSource48BivectorK A * originalSource48BivectorK A) *
        sourceNormalizedGamma ((0 : Fin 24), (0 : Fin 2)) -
      sourceNormalizedGamma ((0 : Fin 24), (0 : Fin 2)) *
        (originalSource48BivectorK A * originalSource48BivectorK A -
          originalSource48BivectorK A * originalSource48BivectorK A) = 0 := by
  simp

-- Control 4: exact source native paired distinct label through source adapter.
example (A B : Matrix Source48Label Source48Label ℝ) :
    (originalSource48BivectorK A * originalSource48BivectorK B -
       originalSource48BivectorK B * originalSource48BivectorK A) *
        sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) -
      sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) *
        (originalSource48BivectorK A * originalSource48BivectorK B -
          originalSource48BivectorK B * originalSource48BivectorK A) =
      (originalSource48BivectorK A *
          (originalSource48BivectorK B * sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) -
            sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) * originalSource48BivectorK B) -
        (originalSource48BivectorK B * sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) -
          sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) * originalSource48BivectorK B) *
            originalSource48BivectorK A) -
      (originalSource48BivectorK B *
          (originalSource48BivectorK A * sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) -
            sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) * originalSource48BivectorK A) -
        (originalSource48BivectorK A * sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) -
          sourceNormalizedGamma ((0 : Fin 24), (1 : Fin 2)) * originalSource48BivectorK A) *
            originalSource48BivectorK B) :=
  originalSource48K_commutator_jacobi A B _

#print axioms originalFock_commutator_jacobi_consumer
#print axioms originalFock_commutator_sub_consumer
#print axioms originalSource48K_commutator_jacobi_consumer

end
end FCP.BFSSP3M4CT1G0OriginalFockJacobiIndependentConsumer
