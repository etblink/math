import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedCarrier

/-! The packed seed tests use ordered products of two normalized
Majoranas, then finite complex-weighted sums. Transport the entire
contraction abstractly, before specializing to the original Fock fiber. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedBilinear
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSMSYNativeOccupationTransition
open FCP.BFSSMSYNormalizedToggle FCP.BFSSMSYPackedCarrier

theorem spinIndex_val (j : Fin 8) (rho : Fin 2) :
    (spinPairEquiv.symm (j, rho)).val = rho.val + 2 * j.val := rfl

theorem spinPair_numeric (s : SpinIndex) :
    (spinPairEquiv s).1.val = s.val / 2 ∧
      (spinPairEquiv s).2.val = s.val % 2 := by
  have hs := spinIndex_val (spinPairEquiv s).1 (spinPairEquiv s).2
  have he : spinPairEquiv.symm ((spinPairEquiv s).1, (spinPairEquiv s).2) = s := by
    exact spinPairEquiv.symm_apply_apply s
  rw [he] at hs
  have hr := (spinPairEquiv s).2.isLt
  omega

theorem packedMode_numeric (s : SpinIndex) (a : ColorIndex 2) :
    (colorModeEquiv ((spinPairEquiv s).1, a)).val = a.val + 3 * (s.val / 2) := by
  rw [modeIndex_val, (spinPair_numeric s).1]

/-- The source-ordered spin label selects the exact bit and phase. -/
noncomputable def packedAction (s : SpinIndex) (a : ColorIndex 2)
    (c : PackedCoordinates) : PackedCoordinates :=
  if (spinPairEquiv s).2 = (0 : Fin 2) then
    packedEvenAction (colorModeEquiv ((spinPairEquiv s).1, a)) c
  else packedOddAction (colorModeEquiv ((spinPairEquiv s).1, a)) c

theorem packedAction_intertwines (s : SpinIndex) (a : ColorIndex 2)
    (c : PackedCoordinates) :
    packedCarrier (packedAction s a c) =
      majoranaNormalization • pairedTheta s a (packedCarrier c) := by
  obtain ⟨⟨j, rho⟩, h⟩ := spinPairEquiv.symm.surjective s
  subst s
  fin_cases rho
  · simpa only [packedAction, Equiv.apply_symm_apply, Prod.fst, Prod.snd, ite_true]
      using packedEvenIntertwine j a c
  · have hn : (1 : Fin 2) ≠ 0 := by decide
    simpa only [packedAction, Equiv.apply_symm_apply, Prod.fst, Prod.snd, hn, ite_false]
      using packedOddIntertwine j a c

theorem normalization_square : majoranaNormalization * majoranaNormalization = (2 : ℂ) := by
  have hs : (Real.sqrt 2 : ℝ) * Real.sqrt 2 = 2 := by
    rw [← sq]
    exact Real.sq_sqrt (by norm_num)
  have hc := congrArg (fun x : ℝ => (x : ℂ)) hs
  simpa only [majoranaNormalization, Complex.ofReal_mul, Complex.ofReal_ofNat] using hc

/-- Abstract two-step intertwiner: order is right action first. -/
private theorem twice_intertwines {E F : Type*} [AddCommGroup F] [Module ℂ F]
    (J : E → F) (f g : E → E) (A B : F →ₗ[ℂ] F) (k : ℂ)
    (hf : ∀ x, J (f x) = k • A (J x))
    (hg : ∀ x, J (g x) = k • B (J x)) (x : E) :
    J (f (g x)) = (k * k) • A (B (J x)) := by
  rw [hf, hg, map_smul, smul_smul]

abbrev MajoranaLabel := SpinIndex × ColorIndex 2

noncomputable def packedBilinear (u v : MajoranaLabel) (c : PackedCoordinates) :
    PackedCoordinates :=
  packedAction u.1 u.2 (packedAction v.1 v.2 c)

theorem packedBilinear_intertwines (u v : MajoranaLabel) (c : PackedCoordinates) :
    packedCarrier (packedBilinear u v c) =
      (2 : ℂ) • pairedTheta u.1 u.2 (pairedTheta v.1 v.2 (packedCarrier c)) := by
  calc
    _ = (majoranaNormalization * majoranaNormalization) •
          pairedTheta u.1 u.2 (pairedTheta v.1 v.2 (packedCarrier c)) :=
      twice_intertwines (fun x : PackedCoordinates => packedCarrier x)
        (packedAction u.1 u.2) (packedAction v.1 v.2)
        (pairedTheta u.1 u.2).toLinearMap (pairedTheta v.1 v.2).toLinearMap
        majoranaNormalization (packedAction_intertwines u.1 u.2)
        (packedAction_intertwines v.1 v.2) c
    _ = _ := congrArg (fun k : ℂ => k •
      pairedTheta u.1 u.2 (pairedTheta v.1 v.2 (packedCarrier c))) normalization_square

/-- Generic finite contraction lemma: no 2^24-dimensional enumeration or
specialized nested scalar-sum reasoning in the source proof. -/
private theorem contraction_transport {E F I : Type*} [AddCommGroup E] [Module ℂ E]
    [AddCommGroup F] [Module ℂ F] (J : E →ₗ[ℂ] F) (s : Finset I)
    (w : I → ℂ) (x : I → E) (y : I → F) (k : ℂ)
    (h : ∀ i, J (x i) = k • y i) :
    J (∑ i ∈ s, w i • x i) = k • (∑ i ∈ s, w i • y i) := by
  rw [map_sum, Finset.smul_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [map_smul, h i, smul_smul, smul_smul, mul_comm (w i) k]

/-- The exact ordered, weighted sum represented by the Python term list.
The finite index set may contain separately indexed repeated terms. -/
noncomputable def packedContraction {I : Type*} (s : Finset I) (w : I → ℂ)
    (u v : I → MajoranaLabel) (c : PackedCoordinates) : PackedCoordinates :=
  ∑ i ∈ s, w i • packedBilinear (u i) (v i) c

noncomputable def sourceContraction {I : Type*} (s : Finset I) (w : I → ℂ)
    (u v : I → MajoranaLabel) (x : Fermion 2) : Fermion 2 :=
  ∑ i ∈ s, w i • pairedTheta (u i).1 (u i).2 (pairedTheta (v i).1 (v i).2 x)

theorem packedContraction_intertwines {I : Type*} (s : Finset I) (w : I → ℂ)
    (u v : I → MajoranaLabel) (c : PackedCoordinates) :
    packedCarrier (packedContraction s w u v c) =
      (2 : ℂ) • sourceContraction s w u v (packedCarrier c) := by
  exact contraction_transport packedCarrier.toLinearEquiv.toLinearMap s w
    (fun i => packedBilinear (u i) (v i) c)
    (fun i => pairedTheta (u i).1 (u i).2
      (pairedTheta (v i).1 (v i).2 (packedCarrier c))) 2
    (fun i => packedBilinear_intertwines (u i) (v i) c)

private theorem zero_iff_of_scaled {E F : Type*} [AddCommGroup E] [Module ℂ E]
    [AddCommGroup F] [Module ℂ F] (J : E →ₗ[ℂ] F) (hJ : Function.Injective J)
    (x : E) (y : F) (h : J x = (2 : ℂ) • y) : x = 0 ↔ y = 0 := by
  constructor
  · intro hx
    have hy : (2 : ℂ) • y = 0 := by rw [← h, hx, map_zero]
    rcases smul_eq_zero.mp hy with htwo | hz
    · exact ((by norm_num : (2 : ℂ) ≠ 0) htwo).elim
    · exact hz
  · intro hy
    apply hJ
    rw [h, hy, smul_zero, map_zero]

theorem packedContraction_zero_iff {I : Type*} (s : Finset I) (w : I → ℂ)
    (u v : I → MajoranaLabel) (c : PackedCoordinates) :
    packedContraction s w u v c = 0 ↔
      sourceContraction s w u v (packedCarrier c) = 0 :=
  zero_iff_of_scaled packedCarrier.toLinearEquiv.toLinearMap packedCarrier.injective
    _ _ (packedContraction_intertwines s w u v c)

#print axioms spinIndex_val
#print axioms spinPair_numeric
#print axioms packedMode_numeric
#print axioms packedAction_intertwines
#print axioms normalization_square
#print axioms packedBilinear_intertwines
#print axioms packedContraction_intertwines
#print axioms packedContraction_zero_iff

end
end FCP.BFSSMSYPackedBilinear
