import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSG1APairedThetaProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2FermionF3B7SignedModeProbe

/-! MSY native occupation bridge, R1. Reuse the literal G1-A paired
Majoranas and the qualified F3 occupation kets. The sorting sign is
the source exterior permutation, not an arbitrary Fintype enumeration.
No global singlet, weighted-domain, or spectral assertion. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYNativeOccupationTransition
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSFermionF1 FCP.BFSSFermionF2 FCP.BFSSFermionF3B2 FCP.BFSSFermionF3B7
open OAI.Laughlin.Fock OAI.ContinuumCoulomb.HubbardGlobal

/-- Literal source complex mode number, matching the integer bit label. -/
theorem modeIndex_val (j : Fin 8) (C : ColorIndex 2) :
    (colorModeEquiv (j, C)).val = C.val + 3 * j.val := by
  rfl

/-- The sign of the actual permutation sorting a singleton followed by
the increasing occupation list. The next combinatorial bridge will
identify this sign with the parity of the number of smaller modes. -/
noncomputable def sortSign (i : Fin 24) (A : Finset (Fin 24)) (hi : i ∉ A) : ℂ :=
  let S : Set.powersetCard (Fin 24) 1 := ⟨{i}, Finset.card_singleton i⟩
  let T : Set.powersetCard (Fin 24) A.card := ⟨A, rfl⟩
  have hd : Disjoint S.val T.val := by simpa only [S, T, Finset.disjoint_singleton_left]
  if (Set.powersetCard.permOfDisjoint hd).sign = 1 then 1 else -1

/-- Source creation coefficient, with the specific exterior sign exposed
rather than merely a statement that it is ±1. -/
theorem creationCoefficient_eq_sortSign
    (i : Fin 24) (A : Finset (Fin 24)) (hi : i ∉ A) :
    creationCoefficient i A = sortSign i A hi := by
  let S : Set.powersetCard (Fin 24) 1 := ⟨{i}, Finset.card_singleton i⟩
  let T : Set.powersetCard (Fin 24) A.card := ⟨A, rfl⟩
  have hd : Disjoint S.val T.val := by simpa only [S, T, Finset.disjoint_singleton_left]
  have h := ExteriorAlgebra.basis_mul_of_disjoint
    (Pi.basisFun ℂ (Fin 24)) S T hd
  have hset : (Set.powersetCard.disjUnion hd).val = insert i A := by
    ext k
    simp [Set.powersetCard.disjUnion, S, T]
  change fockBasis 23 {i} * fockBasis 23 A =
    (Set.powersetCard.permOfDisjoint hd).sign •
      fockBasis 23 (Set.powersetCard.disjUnion hd).val at h
  rw [fockBasis_singleton, hset] at h
  change creationCoefficient i A =
    (if (Set.powersetCard.permOfDisjoint hd).sign = 1 then (1 : ℂ) else -1)
  rcases Int.units_eq_one_or (Set.powersetCard.permOfDisjoint hd).sign with hs | hs
  · have hc : create i (fockBasis 23 A) = (1 : ℂ) • fockBasis 23 (insert i A) := by
      simpa only [hs, one_smul, create, LinearMap.coe_mk, AddHom.coe_mk] using h
    simp [creationCoefficient, hc, hs]
  · have hc : create i (fockBasis 23 A) = (-1 : ℂ) • fockBasis 23 (insert i A) := by
      simpa only [hs, Units.neg_smul, one_smul, neg_smul,
        create, LinearMap.coe_mk, AddHom.coe_mk] using h
    simp [creationCoefficient, hc, hs]

/-- Complete the existing signed occupied-mode action with the zero
action of the annihilator on an unoccupied source ket. -/
theorem annihilator_occupationKet_of_not_mem
    (i : Fin 24) (A : Finset (Fin 24)) (hi : i ∉ A) :
    annihilator i (occupationKet A) = 0 := by
  calc
    annihilator i (occupationKet A) =
        fockBFSSUnitary
          (fockOperator (annihilate i) (fockCoordinates 23 (fockBasis 23 A))) := by
      simp only [annihilator, occupationKet, onBFSS,
        LinearIsometryEquiv.conjStarAlgEquiv_apply_apply,
        LinearIsometryEquiv.symm_apply_apply]
    _ = fockBFSSUnitary (fockCoordinates 23 (annihilate i (fockBasis 23 A))) := by
      rw [fockOperator_coordinates]
    _ = 0 := by
      rw [annihilate_unoccupied_basis i A hi]
      simp

private theorem majorana1_phase (i : Fin 24) :
    majorana1 i =
      (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
        ((Complex.I : ℂ) • (creator i - annihilator i)) := by
  unfold majorana1
  simp only [star_smul, Complex.star_def, Complex.conj_I, creator_adjoint]
  rw [smul_sub, sub_eq_add_neg]
  ext x
  simp

/-- Source even Majorana acts with the true signed insertion/removal. -/
theorem pairedTheta_even_occupationKet
    (j : Fin 8) (C : ColorIndex 2) (A : Finset (Fin 24)) :
    pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (occupationKet A) =
      if colorModeEquiv (j, C) ∈ A then
        (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
          (creationCoefficient (colorModeEquiv (j, C)) (A.erase (colorModeEquiv (j, C))) •
            occupationKet (A.erase (colorModeEquiv (j, C))))
      else
        (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
          (creationCoefficient (colorModeEquiv (j, C)) A •
            occupationKet (insert (colorModeEquiv (j, C)) A)) := by
  rw [pairedTheta_even, majorana0]
  simp only [_root_.smul_apply, _root_.add_apply]
  by_cases hi : colorModeEquiv (j, C) ∈ A
  · rw [ite_eq_left hi, creator_occupationKet, creationCoefficient_occupied _ _ hi,
      zero_smul, zero_add, annihilator_occupationKet_of_mem _ _ hi]
  · rw [ite_eq_right hi, annihilator_occupationKet_of_not_mem _ _ hi,
      add_zero, creator_occupationKet]

/-- Source odd Majorana has opposite phases on occupied and vacant
modes, using exactly the same signed insertion/removal. -/
theorem pairedTheta_odd_occupationKet
    (j : Fin 8) (C : ColorIndex 2) (A : Finset (Fin 24)) :
    pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (occupationKet A) =
      if colorModeEquiv (j, C) ∈ A then
        (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
          (Complex.I • -(creationCoefficient (colorModeEquiv (j, C))
            (A.erase (colorModeEquiv (j, C))) •
              occupationKet (A.erase (colorModeEquiv (j, C)))))
      else
        (((Real.sqrt 2 / 2 : ℝ) : ℂ)) •
          (Complex.I • (creationCoefficient (colorModeEquiv (j, C)) A •
            occupationKet (insert (colorModeEquiv (j, C)) A))) := by
  rw [pairedTheta_odd, majorana1_phase]
  simp only [_root_.smul_apply, _root_.sub_apply]
  by_cases hi : colorModeEquiv (j, C) ∈ A
  · rw [ite_eq_left hi, creator_occupationKet, creationCoefficient_occupied _ _ hi,
      zero_smul, zero_sub, annihilator_occupationKet_of_mem _ _ hi]
  · rw [ite_eq_right hi, annihilator_occupationKet_of_not_mem _ _ hi,
      sub_zero, creator_occupationKet]

#print axioms modeIndex_val
#print axioms creationCoefficient_eq_sortSign
#print axioms annihilator_occupationKet_of_not_mem
#print axioms pairedTheta_even_occupationKet
#print axioms pairedTheta_odd_occupationKet

end
end FCP.BFSSMSYNativeOccupationTransition
