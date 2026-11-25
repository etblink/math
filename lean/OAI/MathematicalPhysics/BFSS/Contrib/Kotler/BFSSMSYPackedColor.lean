import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedBilinear
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYFermionGeneratorPlane01

/-! Exact transport of the three ascending color-pair contractions used in
check_seed.py to the actual positive-i original source fiber generators. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedColor
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2 FCP.BFSSSU2GaugeG1A
open FCP.BFSSIBIG1BOriginalSignedCross FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSMSYFermionGeneratorPlane01 FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear

-- Evaluate the nine-entry color table in an abstract complex module.
private theorem contract12 {V : Type*} [AddCommGroup V] [Module ℂ V]
    (T : Fin 3 → Fin 3 → V) (k : ℂ) :
    (∑ a : Fin 3, ∑ b : Fin 3, (k * (epsilon3 a b (0 : Fin 3) : ℂ)) • T a b) =
      k • (T 1 2 - T 2 1) := by
  rw [smul_sub, sub_eq_add_neg]
  simp [Fin.sum_univ_three, epsilon3]

private theorem contract02 {V : Type*} [AddCommGroup V] [Module ℂ V]
    (T : Fin 3 → Fin 3 → V) (k : ℂ) :
    (∑ a : Fin 3, ∑ b : Fin 3, (k * (epsilon3 a b (1 : Fin 3) : ℂ)) • T a b) =
      (-k) • (T 0 2 - T 2 0) := by
  calc
    _ = k • (T 2 0 - T 0 2) := by
      rw [smul_sub, sub_eq_add_neg]
      simp [Fin.sum_univ_three, epsilon3, add_comm]
    _ = _ := by rw [neg_smul, ← smul_neg, neg_sub]

private theorem color_term (c : Fin 3) (α : SpinIndex) (a b : Fin 3) :
    sourceFiberFermionColorTerm pairedAlgebraData c α a b =
      ((Real.sqrt 2 : ℂ) * (epsilon3 a b c : ℂ)) •
        (pairedTheta α a * pairedTheta α b) := by
  have hc : pairedAlgebraData.structureConstant a b c =
      Real.sqrt 2 * epsilon3 a b c :=
    pairedColor_structureConstant a b c
  unfold sourceFiberFermionColorTerm
  rw [hc, Complex.ofReal_mul, pairedAlgebraData_theta, pairedAlgebraData_theta]

private theorem reverse_product (α : SpinIndex) (a b : Fin 3) (hab : a ≠ b) :
    pairedTheta α b * pairedTheta α a = -(pairedTheta α a * pairedTheta α b) := by
  rw [eq_neg_iff_add_eq_zero]
  have hne : ¬ (α = α ∧ b = a) := fun h => hab h.2.symm
  have h := pairedTheta_CAR α α b a
  rw [ite_eq_right hne] at h
  exact h.trans (zero_smul ℂ (1 : SourceFiberEnd))

private theorem generator_scale (k : ℂ) : Complex.I * (-Complex.I / 2) * (2 * k) = k := by
  rw [show Complex.I * (-Complex.I / 2) * (2 * k) = -(Complex.I ^ 2) * k by ring,
    Complex.I_sq, neg_neg, one_mul]

-- Keep the operator data parametric while doing the finite sum and scale.
private theorem generator_from_spin_contraction
    (M : AlgebraData 2) (c : Fin 3) (T : SpinIndex → SourceFiberEnd) (k : ℂ)
    (hSpin : ∀ α : SpinIndex,
      (∑ a : Fin 3, ∑ b : Fin 3, sourceFiberFermionColorTerm M c α a b) =
        (2 * k) • T α) :
    sourceFiberFermionColorGenerator M c = k • (∑ α : SpinIndex, T α) := by
  change Complex.I • ((-Complex.I / 2 : ℂ) •
    (∑ α : SpinIndex, ∑ a : Fin 3, ∑ b : Fin 3,
      sourceFiberFermionColorTerm M c α a b)) = _
  have hsum : (∑ α : SpinIndex, ∑ a : Fin 3, ∑ b : Fin 3,
        sourceFiberFermionColorTerm M c α a b) =
      ∑ α : SpinIndex, (2 * k) • T α :=
    Finset.sum_congr rfl (fun α _ => hSpin α)
  rw [hsum, ← Finset.smul_sum, smul_smul, smul_smul, generator_scale]

private theorem generator_from_table (c a b : Fin 3) (k : ℂ) (hab : a ≠ b)
    (hcontract : ∀ T : Fin 3 → Fin 3 → SourceFiberEnd,
      (∑ i : Fin 3, ∑ j : Fin 3,
        ((Real.sqrt 2 : ℂ) * (epsilon3 i j c : ℂ)) • T i j) =
        k • (T a b - T b a)) :
    sourceFiberFermionColorGenerator pairedAlgebraData c =
      k • (∑ α : SpinIndex, pairedTheta α a * pairedTheta α b) := by
  apply generator_from_spin_contraction pairedAlgebraData c
    (fun α => pairedTheta α a * pairedTheta α b) k
  intro α
  let T : Fin 3 → Fin 3 → SourceFiberEnd := fun i j => pairedTheta α i * pairedTheta α j
  calc
    _ = ∑ i : Fin 3, ∑ j : Fin 3,
        ((Real.sqrt 2 : ℂ) * (epsilon3 i j c : ℂ)) • T i j := by
      apply Finset.sum_congr rfl
      intro i _
      apply Finset.sum_congr rfl
      intro j _
      exact color_term c α i j
    _ = k • (T a b - T b a) := hcontract T
    _ = _ := by
      change k • (pairedTheta α a * pairedTheta α b -
        pairedTheta α b * pairedTheta α a) = _
      rw [reverse_product α a b hab, sub_neg_eq_add, smul_add, ← add_smul, ← two_mul]

/-- The middle color reverses the ascending Python pair (0,2). -/
theorem native_generator_plane02 :
    sourceFiberFermionColorGenerator pairedAlgebraData (1 : Fin 3) =
      (-(Real.sqrt 2 : ℂ)) •
        (∑ α : SpinIndex, pairedTheta α (0 : Fin 3) * pairedTheta α (2 : Fin 3)) :=
  generator_from_table 1 0 2 (-(Real.sqrt 2 : ℂ)) (by decide)
    (fun T => contract02 T (Real.sqrt 2 : ℂ))

theorem native_generator_plane12 :
    sourceFiberFermionColorGenerator pairedAlgebraData (0 : Fin 3) =
      (Real.sqrt 2 : ℂ) •
        (∑ α : SpinIndex, pairedTheta α (1 : Fin 3) * pairedTheta α (2 : Fin 3)) :=
  generator_from_table 0 1 2 (Real.sqrt 2 : ℂ) (by decide)
    (fun T => contract12 T (Real.sqrt 2 : ℂ))

/-- The literal unit-weight ascending-pair contraction used by Python. -/
noncomputable def packedColorPlane (a b : ColorIndex 2) (x : PackedCoordinates) :
    PackedCoordinates :=
  packedContraction (Finset.univ : Finset SpinIndex) (fun _ => (1 : ℂ))
    (fun s => (s, a)) (fun s => (s, b)) x

private theorem plane_apply {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    (theta : SpinIndex → ColorIndex 2 → E →L[ℂ] E)
    (a b : ColorIndex 2) (v : E) :
    (∑ α : SpinIndex, theta α a * theta α b) v =
      ∑ α : SpinIndex, theta α a (theta α b v) := by
  simp only [_root_.sum_apply, mul_apply_eq_comp]

private theorem scale_transport {F : Type*} [AddCommGroup F] [Module ℂ F]
    (p y : F) (k : ℂ) (h : p = (2 : ℂ) • y) :
    k • y = (k / 2) • p := by
  have hs : k / 2 * 2 = k := by ring
  rw [h, smul_smul, hs]

private theorem generator_transport (c a b : Fin 3) (k : ℂ)
    (hG : sourceFiberFermionColorGenerator pairedAlgebraData c =
      k • (∑ α : SpinIndex, pairedTheta α a * pairedTheta α b))
    (x : PackedCoordinates) :
    sourceFiberFermionColorGenerator pairedAlgebraData c (packedCarrier x) =
      (k / 2) • packedCarrier (packedColorPlane a b x) := by
  have h := packedContraction_intertwines (Finset.univ : Finset SpinIndex)
    (fun _ => (1 : ℂ)) (fun s => (s, a)) (fun s => (s, b)) x
  have hv : packedCarrier (packedColorPlane a b x) =
      (2 : ℂ) • ((∑ α : SpinIndex, pairedTheta α a * pairedTheta α b) (packedCarrier x)) := by
    rw [plane_apply]
    simpa only [packedColorPlane, sourceContraction, one_smul] using h
  rw [hG]
  change k • ((∑ α : SpinIndex, pairedTheta α a * pairedTheta α b) (packedCarrier x)) = _
  exact scale_transport _ _ k hv

theorem packed_plane01_generator (x : PackedCoordinates) :
    sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3) (packedCarrier x) =
      ((Real.sqrt 2 : ℂ) / 2) • packedCarrier (packedColorPlane 0 1 x) :=
  generator_transport 2 0 1 (Real.sqrt 2 : ℂ) native_fermion_generator_plane01 x

theorem packed_plane02_generator (x : PackedCoordinates) :
    sourceFiberFermionColorGenerator pairedAlgebraData (1 : Fin 3) (packedCarrier x) =
      (-(Real.sqrt 2 : ℂ) / 2) • packedCarrier (packedColorPlane 0 2 x) :=
  generator_transport 1 0 2 (-(Real.sqrt 2 : ℂ)) native_generator_plane02 x

theorem packed_plane12_generator (x : PackedCoordinates) :
    sourceFiberFermionColorGenerator pairedAlgebraData (0 : Fin 3) (packedCarrier x) =
      ((Real.sqrt 2 : ℂ) / 2) • packedCarrier (packedColorPlane 1 2 x) :=
  generator_transport 0 1 2 (Real.sqrt 2 : ℂ) native_generator_plane12 x

#print axioms native_generator_plane02
#print axioms native_generator_plane12
#print axioms packed_plane01_generator
#print axioms packed_plane02_generator
#print axioms packed_plane12_generator

end
end FCP.BFSSMSYPackedColor
