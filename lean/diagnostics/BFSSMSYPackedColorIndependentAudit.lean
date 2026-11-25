import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedColor

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPackedColorIndependent
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2PhysicalDomainL6G6K
open FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear FCP.BFSSMSYPackedColor

private theorem zero_iff_scaled {E F : Type*} [AddCommGroup E] [Module ℂ E]
    [AddCommGroup F] [Module ℂ F] (J : E →ₗ[ℂ] F) (hJ : Function.Injective J)
    (p : E) (g : F) (k : ℂ) (hk : k ≠ 0) (hg : g = k • J p) :
    p = 0 ↔ g = 0 := by
  constructor
  · intro hp
    rw [hg, hp, map_zero, smul_zero]
  · intro hz
    have hv : k • J p = 0 := hg.symm.trans hz
    rcases smul_eq_zero.mp hv with hn | hp
    · exact (hk hn).elim
    · apply hJ
      rw [map_zero]
      exact hp

private theorem sqrtTwo_ne_zero : (Real.sqrt 2 : ℂ) ≠ 0 := by
  have h : (Real.sqrt 2 : ℂ) * (Real.sqrt 2 : ℂ) = 2 := normalization_square
  intro hz
  rw [hz, zero_mul] at h
  exact (by norm_num : (0 : ℂ) ≠ 2) h

theorem literalPlane01ZeroAudit (x : PackedCoordinates) :
    packedContraction (Finset.univ : Finset SpinIndex) (fun _ => (1 : ℂ))
      (fun s => (s, (0 : ColorIndex 2))) (fun s => (s, (1 : ColorIndex 2))) x = 0 ↔
      sourceFiberFermionColorGenerator pairedAlgebraData (2 : Fin 3) (packedCarrier x) = 0 :=
  zero_iff_scaled packedCarrier.toLinearEquiv.toLinearMap packedCarrier.injective
    _ _ ((Real.sqrt 2 : ℂ) / 2) (div_ne_zero sqrtTwo_ne_zero (by norm_num))
    (packed_plane01_generator x)

theorem literalPlane02ZeroAudit (x : PackedCoordinates) :
    packedContraction (Finset.univ : Finset SpinIndex) (fun _ => (1 : ℂ))
      (fun s => (s, (0 : ColorIndex 2))) (fun s => (s, (2 : ColorIndex 2))) x = 0 ↔
      sourceFiberFermionColorGenerator pairedAlgebraData (1 : Fin 3) (packedCarrier x) = 0 :=
  zero_iff_scaled packedCarrier.toLinearEquiv.toLinearMap packedCarrier.injective
    _ _ (-(Real.sqrt 2 : ℂ) / 2) (div_ne_zero (neg_ne_zero.mpr sqrtTwo_ne_zero) (by norm_num))
    (packed_plane02_generator x)

theorem literalPlane12ZeroAudit (x : PackedCoordinates) :
    packedContraction (Finset.univ : Finset SpinIndex) (fun _ => (1 : ℂ))
      (fun s => (s, (1 : ColorIndex 2))) (fun s => (s, (2 : ColorIndex 2))) x = 0 ↔
      sourceFiberFermionColorGenerator pairedAlgebraData (0 : Fin 3) (packedCarrier x) = 0 :=
  zero_iff_scaled packedCarrier.toLinearEquiv.toLinearMap packedCarrier.injective
    _ _ ((Real.sqrt 2 : ℂ) / 2) (div_ne_zero sqrtTwo_ne_zero (by norm_num))
    (packed_plane12_generator x)

#print axioms literalPlane01ZeroAudit
#print axioms literalPlane02ZeroAudit
#print axioms literalPlane12ZeroAudit

end
end FCP.BFSSMSYPackedColorIndependent
