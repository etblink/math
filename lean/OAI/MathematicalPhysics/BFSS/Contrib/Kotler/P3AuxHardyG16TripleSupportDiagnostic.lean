import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxHardyG16FourPlaneIncidenceDiagnostic

/-! G16 D1B0: 28 distinct triple supports for the four literal consecutive planes.
Mathlib/D0 finite mathematics only; no gamma, originalHardyY or physical claim. -/
set_option autoImplicit false
namespace FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic
noncomputable section

open FCP.BFSSP3AuxHardyG16FourPlaneIncidenceDiagnostic

abbrev TripleLabel : Type :=
  {x : Fin 4 × Fin 9 // x.2 ≠ planeLeft x.1 ∧ x.2 ≠ planeRight x.1}

def tripleSupport (x : TripleLabel) : Finset (Fin 9) :=
  {planeLeft x.1.1, planeRight x.1.1, x.1.2}

theorem tripleLabel_card : Fintype.card TripleLabel = 28 := by
  decide

theorem tripleSupport_card : ∀ x : TripleLabel, (tripleSupport x).card = 3 := by
  decide

theorem tripleSupport_injective : Function.Injective tripleSupport := by
  decide

theorem thirdAxis_outside : ∀ x : TripleLabel,
    x.1.2 < planeLeft x.1.1 ∨ planeRight x.1.1 < x.1.2 := by
  decide

#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleLabel_card
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleSupport_card
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.tripleSupport_injective
#print axioms FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic.thirdAxis_outside

end
end FCP.BFSSP3AuxHardyG16TripleSupportDiagnostic
