import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYCoefficientCarrier

/-! Normalized computational Majoranas on occupation-indexed coefficients.
Use the existing isometric carrier and parity-weighted native sums.
The numeric bitmask encoding is a separate interface. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYNormalizedToggle
noncomputable section

open OAI.BFSSQuantum OAI.ContinuumCoulomb.HubbardGlobal
open FCP.BFSSFermionF3B2 FCP.BFSSSU2GaugeG1A FCP.BFSSMSYCoefficientCarrier

theorem toggle_involutive (i : Fin 24) :
    Function.Involutive (toggleOccupation i) := by
  intro A
  by_cases h : i ∈ A
  · simp only [toggleOccupation, h, ite_true, Finset.notMem_erase, ite_false,
      Finset.insert_erase h]
  · simp only [toggleOccupation, h, ite_false, Finset.mem_insert_self, ite_true,
      Finset.erase_insert h]

def toggleEquiv (i : Fin 24) : Equiv.Perm (Finset (Fin 24)) where
  toFun := toggleOccupation i
  invFun := toggleOccupation i
  left_inv := toggle_involutive i
  right_inv := toggle_involutive i

/-- Forward input weight for the normalized imaginary Majorana. -/
noncomputable def oddWeight (i : Fin 24) (A : Finset (Fin 24)) : ℂ :=
  if i ∈ A then -(Complex.I * occupationParity i A)
  else Complex.I * occupationParity i A

/-- Gather the unique predecessor of each output occupation. -/
noncomputable def weightedToggle (i : Fin 24)
    (w : Finset (Fin 24) → ℂ) (c : FockCoordinateSpace 23) :
    FockCoordinateSpace 23 :=
  WithLp.toLp 2 (fun B : Finset (Fin 24) =>
    c (toggleOccupation i B) * w (toggleOccupation i B))

noncomputable def evenAction (i : Fin 24) (c : FockCoordinateSpace 23) :
    FockCoordinateSpace 23 :=
  weightedToggle i (occupationParity i) c

noncomputable def oddAction (i : Fin 24) (c : FockCoordinateSpace 23) :
    FockCoordinateSpace 23 :=
  weightedToggle i (oddWeight i) c

theorem weightedToggle_apply (i : Fin 24) (w : Finset (Fin 24) → ℂ)
    (c : FockCoordinateSpace 23) (B : Finset (Fin 24)) :
    weightedToggle i w c B = c (toggleOccupation i B) * w (toggleOccupation i B) :=
  rfl

/-- Reindex without enumerating the 2^24 occupations. -/
theorem weightedToggle_carrier (i : Fin 24) (w : Finset (Fin 24) → ℂ)
    (c : FockCoordinateSpace 23) :
    coefficientCarrier (weightedToggle i w c) =
      ∑ A : Finset (Fin 24), (c A * w A) • occupationKet (toggleOccupation i A) := by
  calc
    _ = ∑ B : Finset (Fin 24), (c (toggleOccupation i B) * w (toggleOccupation i B)) •
        occupationKet B := carrier_expansion _
    _ = _ := by
      refine Fintype.sum_equiv (toggleEquiv i) _ _ ?_
      intro B
      change (c (toggleOccupation i B) * w (toggleOccupation i B)) • occupationKet B =
        (c (toggleOccupation i B) * w (toggleOccupation i B)) •
          occupationKet (toggleOccupation i (toggleOccupation i B))
      rw [toggle_involutive i B]

noncomputable def majoranaNormalization : ℂ := (Real.sqrt 2 : ℝ)

theorem normalization_cancel :
    majoranaNormalization * (((Real.sqrt 2 / 2 : ℝ) : ℂ)) = 1 := by
  have hs : (Real.sqrt 2 : ℝ) ^ 2 = 2 := Real.sq_sqrt (by norm_num)
  have h : (Real.sqrt 2 : ℝ) * (Real.sqrt 2 / 2) = 1 := by nlinarith
  have hc := congrArg (fun x : ℝ => (x : ℂ)) h
  simpa only [majoranaNormalization, Complex.ofReal_mul, Complex.ofReal_one] using hc

theorem normalizedEvenTerm (i : Fin 24) (A : Finset (Fin 24)) :
    majoranaNormalization • evenTerm i A =
      occupationParity i A • occupationKet (toggleOccupation i A) := by
  unfold evenTerm
  rw [smul_smul, normalization_cancel, one_smul]

theorem normalizedOddTerm (i : Fin 24) (A : Finset (Fin 24)) :
    majoranaNormalization • oddTerm i A =
      oddWeight i A • occupationKet (toggleOccupation i A) := by
  unfold oddTerm
  rw [smul_smul, normalization_cancel, one_smul]
  by_cases h : i ∈ A
  · rw [ite_eq_left h, oddWeight, ite_eq_left h, smul_neg, smul_smul, neg_smul]
  · rw [ite_eq_right h, oddWeight, ite_eq_right h, smul_smul]

/-- The whole finite-sum transport is checked on an abstract index and
module. No specialized scalar-sum rewrite enters the final kernel term. -/
private theorem normalized_of_weighted_sums {ι V : Type*} [AddCommGroup V]
    [Module ℂ V] (s : Finset ι) (k : ℂ) (c w : ι → ℂ)
    (b v : ι → V) (x y : V)
    (hx : x = ∑ a ∈ s, (c a * w a) • b a)
    (hy : y = ∑ a ∈ s, c a • v a)
    (hv : ∀ a, k • v a = w a • b a) :
    x = k • y := by
  calc
    x = ∑ a ∈ s, (c a * w a) • b a := hx
    _ = ∑ a ∈ s, k • (c a • v a) := by
      apply Finset.sum_congr rfl
      intro a _
      calc
        (c a * w a) • b a = c a • (w a • b a) := (smul_smul _ _ _).symm
        _ = c a • (k • v a) := congrArg (fun z : V => c a • z) (hv a).symm
        _ = (c a * k) • v a := smul_smul _ _ _
        _ = (k * c a) • v a := congrArg (fun z : ℂ => z • v a) (mul_comm _ _)
        _ = k • (c a • v a) := (smul_smul _ _ _).symm
    _ = k • (∑ a ∈ s, c a • v a) := Finset.smul_sum.symm
    _ = k • y := congrArg (fun z : V => k • z) hy.symm

/-- Exact normalized even computational action on arbitrary coefficients. -/
theorem evenIntertwine (j : Fin 8) (C : ColorIndex 2) (c : FockCoordinateSpace 23) :
    coefficientCarrier (evenAction (colorModeEquiv (j, C)) c) =
      majoranaNormalization •
        pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (coefficientCarrier c) := by
  exact normalized_of_weighted_sums (ι := Finset (Fin 24)) (V := Fermion 2)
    (Finset.univ : Finset (Finset (Fin 24))) majoranaNormalization
    (fun A : Finset (Fin 24) => c A) (occupationParity (colorModeEquiv (j, C)))
    (fun A : Finset (Fin 24) => occupationKet (toggleOccupation (colorModeEquiv (j, C)) A))
    (evenTerm (colorModeEquiv (j, C)))
    (coefficientCarrier (evenAction (colorModeEquiv (j, C)) c))
    (pairedTheta (spinPairEquiv.symm (j, (0 : Fin 2))) C (coefficientCarrier c))
    (weightedToggle_carrier (colorModeEquiv (j, C)) (occupationParity (colorModeEquiv (j, C))) c)
    (evenCarrier j C c)
    (normalizedEvenTerm (colorModeEquiv (j, C)))

/-- Exact normalized odd computational action on arbitrary coefficients. -/
theorem oddIntertwine (j : Fin 8) (C : ColorIndex 2) (c : FockCoordinateSpace 23) :
    coefficientCarrier (oddAction (colorModeEquiv (j, C)) c) =
      majoranaNormalization •
        pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (coefficientCarrier c) := by
  exact normalized_of_weighted_sums (ι := Finset (Fin 24)) (V := Fermion 2)
    (Finset.univ : Finset (Finset (Fin 24))) majoranaNormalization
    (fun A : Finset (Fin 24) => c A) (oddWeight (colorModeEquiv (j, C)))
    (fun A : Finset (Fin 24) => occupationKet (toggleOccupation (colorModeEquiv (j, C)) A))
    (oddTerm (colorModeEquiv (j, C)))
    (coefficientCarrier (oddAction (colorModeEquiv (j, C)) c))
    (pairedTheta (spinPairEquiv.symm (j, (1 : Fin 2))) C (coefficientCarrier c))
    (weightedToggle_carrier (colorModeEquiv (j, C)) (oddWeight (colorModeEquiv (j, C))) c)
    (oddCarrier j C c)
    (normalizedOddTerm (colorModeEquiv (j, C)))

#print axioms toggle_involutive
#print axioms weightedToggle_apply
#print axioms weightedToggle_carrier
#print axioms normalization_cancel
#print axioms normalizedEvenTerm
#print axioms normalizedOddTerm
#print axioms evenIntertwine
#print axioms oddIntertwine

end
end FCP.BFSSMSYNormalizedToggle
