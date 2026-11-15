import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG16TripleSupportDiagnostic

/-! G16 D1B0: independent finite support/forbidden-third-axis controls. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16TripleSupportIndependentConsumer
noncomputable section

open FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic

example : Fintype.card TripleLabel = 28 :=
  tripleLabel_card

example : ∀ x : TripleLabel, (tripleSupport x).card = 3 :=
  tripleSupport_card

example : Function.Injective tripleSupport :=
  tripleSupport_injective

example : ∀ x : TripleLabel,
    x.1.2 < FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.planeLeft x.1.1 ∨
    FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic.planeRight x.1.1 < x.1.2 :=
  thirdAxis_outside

example :
    tripleSupport (⟨((0 : Fin 4), (2 : Fin 9)), by decide⟩ : TripleLabel) =
      ({0, 1, 2} : Finset (Fin 9)) := by
  decide

example :
    tripleSupport (⟨((3 : Fin 4), (8 : Fin 9)), by decide⟩ : TripleLabel) =
      ({6, 7, 8} : Finset (Fin 9)) := by
  decide

example :
    tripleSupport (⟨((0 : Fin 4), (2 : Fin 9)), by decide⟩ : TripleLabel) ≠
      tripleSupport (⟨((1 : Fin 4), (0 : Fin 9)), by decide⟩ : TripleLabel) := by
  decide

#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleLabel_card
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleSupport_card
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleSupport_injective
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.thirdAxis_outside

end
end FCP.BFSSP3AuxHardyG16TripleSupportIndependentConsumer
