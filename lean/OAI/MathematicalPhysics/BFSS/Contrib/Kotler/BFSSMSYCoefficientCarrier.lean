import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYSingletonParitySource

/-! Coefficient carrier in the actual F1 Fock coordinate Hilbert space.
Reuse F3-B5 expansion; bind arbitrary coefficients to literal paired theta
via the qualified parity theorem. No dense matrices or bit-order assumption. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYCoefficientCarrier
noncomputable section

open OAI.BFSSQuantum OAI.ContinuumCoulomb.HubbardGlobal OAI.Laughlin.Fock
open FCP.BFSSFermionF1 FCP.BFSSFermionF3B2 FCP.BFSSFermionF3B5
open FCP.BFSSSU2GaugeG1A FCP.BFSSMSYNativeOccupationTransition FCP.BFSSMSYSingletonParitySource

/-- Source coefficient space to original BFSS Hilbert space. -/
noncomputable def coefficientCarrier :
    FockCoordinateSpace 23 ≃ₗᵢ[ℂ] Fermion 2 := fockBFSSUnitary

theorem occupationCoeff_carrier (c : FockCoordinateSpace 23) (A : Finset (Fin 24)) :
    occupationCoeff (coefficientCarrier c) A = c A := by
  change (fockBasis 23).repr
    ((fockCoordinates 23).symm (fockBFSSUnitary.symm (fockBFSSUnitary c))) A = c A
  rw [fockBFSSUnitary.symm_apply_apply]
  calc
    _ = fockCoordinates 23 ((fockCoordinates 23).symm c) A :=
      (fockCoordinates_apply _ _ _).symm
    _ = c A := congrArg (fun v : FockCoordinateSpace 23 => v A)
      ((fockCoordinates 23).apply_symm_apply c)

/-- Reuse the complete F3-B5 expansion, not a new enumeration. -/
theorem carrier_expansion (c : FockCoordinateSpace 23) :
    coefficientCarrier c = ∑ A : Finset (Fin 24), c A • occupationKet A := by
  calc
    _ = ∑ A : Finset (Fin 24), occupationCoeff (coefficientCarrier c) A • occupationKet A :=
      occupationExpansion (coefficientCarrier c)
    _ = _ := by
      apply Finset.sum_congr rfl
      intro A _
      rw [occupationCoeff_carrier]

theorem carrier_norm (c : FockCoordinateSpace 23) :
    ‖coefficientCarrier c‖ = ‖c‖ :=
  coefficientCarrier.norm_map c

/-- The exact signed toggle weight, expressed in integer-unit parity. -/
noncomputable def occupationParity (i : Fin 24) (A : Finset (Fin 24)) : ℂ :=
  if (-1 : ℤˣ) ^ (A.filter (fun k => k < i)).card = 1 then 1 else -1

def toggleOccupation (i : Fin 24) (A : Finset (Fin 24)) : Finset (Fin 24) :=
  if i ∈ A then A.erase i else insert i A

theorem occupationParity_erase (i : Fin 24) (A : Finset (Fin 24)) :
    occupationParity i (A.erase i) = occupationParity i A := by
  have hf : (A.erase i).filter (fun k => k < i) = A.filter (fun k => k < i) := by
    ext k
    simp only [Finset.mem_filter, Finset.mem_erase]
    constructor
    · rintro ⟨⟨_, ha⟩, hlt⟩
      exact ⟨ha, hlt⟩
    · rintro ⟨ha, hlt⟩
      exact ⟨⟨ne_of_lt hlt, ha⟩, hlt⟩
  unfold occupationParity
  rw [hf]

private theorem removalWeight (i : Fin 24) (A : Finset (Fin 24)) :
    creationCoefficient i (A.erase i) = occupationParity i A :=
  (creationCoefficient_eq_parityTest i (A.erase i) (Finset.notMem_erase _ _)).trans
    (occupationParity_erase i A)

/-- Even and odd basis terms use the same toggle; odd phase is occupancy dependent. -/
noncomputable def evenTerm (i : Fin 24) (A : Finset (Fin 24)) : Fermion 2 :=
  (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
    (occupationParity i A • occupationKet (toggleOccupation i A))

noncomputable def oddTerm (i : Fin 24) (A : Finset (Fin 24)) : Fermion 2 :=
  (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
    (Complex.I • (if i ∈ A then
      -(occupationParity i A • occupationKet (toggleOccupation i A))
      else occupationParity i A • occupationKet (toggleOccupation i A)))

theorem evenKet (j : Fin 8) (C : ColorIndex 2) (A : Finset (Fin 24)) :
    pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (occupationKet A) =
      evenTerm (colorModeEquiv (j, C)) A := by
  rw [pairedTheta_even_occupationKet]
  unfold evenTerm
  by_cases h : colorModeEquiv (j, C) ∈ A
  · simp only [toggleOccupation, h, ite_true, removalWeight]
  · have hc : creationCoefficient (colorModeEquiv (j, C)) A =
        occupationParity (colorModeEquiv (j, C)) A :=
      creationCoefficient_eq_parityTest _ _ h
    simp only [toggleOccupation, h, ite_false, hc]

theorem oddKet (j : Fin 8) (C : ColorIndex 2) (A : Finset (Fin 24)) :
    pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (occupationKet A) =
      oddTerm (colorModeEquiv (j, C)) A := by
  rw [pairedTheta_odd_occupationKet]
  unfold oddTerm
  by_cases h : colorModeEquiv (j, C) ∈ A
  · simp only [toggleOccupation, h, ite_true, removalWeight]
  · have hc : creationCoefficient (colorModeEquiv (j, C)) A =
        occupationParity (colorModeEquiv (j, C)) A :=
      creationCoefficient_eq_parityTest _ _ h
    simp only [toggleOccupation, h, ite_false, hc]

/-- General finite coefficient sum identity on the original even theta. -/
theorem evenCarrier (j : Fin 8) (C : ColorIndex 2) (c : FockCoordinateSpace 23) :
    pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (coefficientCarrier c) =
      ∑ A : Finset (Fin 24), c A • evenTerm (colorModeEquiv (j, C)) A := by
  calc
    _ = pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C
        (∑ A : Finset (Fin 24), c A • occupationKet A) :=
      congrArg (pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C)
        (carrier_expansion c)
    _ = ∑ A : Finset (Fin 24), c A •
        pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (occupationKet A) := by
      simp only [map_sum, map_smul]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro A _
      rw [evenKet]

/-- General finite coefficient sum identity on the original odd theta. -/
theorem oddCarrier (j : Fin 8) (C : ColorIndex 2) (c : FockCoordinateSpace 23) :
    pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (coefficientCarrier c) =
      ∑ A : Finset (Fin 24), c A • oddTerm (colorModeEquiv (j, C)) A := by
  calc
    _ = pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C
        (∑ A : Finset (Fin 24), c A • occupationKet A) :=
      congrArg (pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C)
        (carrier_expansion c)
    _ = ∑ A : Finset (Fin 24), c A •
        pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (occupationKet A) := by
      simp only [map_sum, map_smul]
    _ = _ := by
      apply Finset.sum_congr rfl
      intro A _
      rw [oddKet]

#print axioms occupationCoeff_carrier
#print axioms carrier_expansion
#print axioms carrier_norm
#print axioms occupationParity_erase
#print axioms evenKet
#print axioms oddKet
#print axioms evenCarrier
#print axioms oddCarrier

end
end FCP.BFSSMSYCoefficientCarrier
