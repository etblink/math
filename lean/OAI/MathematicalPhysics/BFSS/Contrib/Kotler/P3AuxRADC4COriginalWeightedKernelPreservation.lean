import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC4BOriginalWeightedNormalizedAdjointSquare

/-!
P3-AUX-RAD-C4C R1: actual partial-operator kernel equality Hε.ker = H.ker
on the original SU2 physical Hilbert subtype for ε > 0.
PROSPECTIVE / UNQUALIFIED until exact strict source/paired consumer audit.
Kernel membership retains the full natural domains. No nonzero kernel,
zero-mode existence/dimension, epsilon-zero result or spectral gap is claimed.
-/
set_option autoImplicit false

namespace FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BA
open FCP.BFSSSU2PhysicalDomainL6H5E8BB
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BD
open FCP.BFSSSU2PhysicalDomainL6H5E8BE
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
open FCP.BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquare
open FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare

section Algebra

variable {E F : Type*}
variable [AddCommGroup E] [Module ℂ E]
variable [AddCommGroup F] [Module ℂ F]

/-- The existing partial-map kernel is exactly its zero graph pairs. -/
theorem mem_ker_iff_graph_zero (T : E →ₗ.[ℂ] F) (x : E) :
    x ∈ T.ker ↔ (x, (0 : F)) ∈ T.graph := by
  constructor
  · intro h
    obtain ⟨y, hxy, hy⟩ := LinearPMap.mem_ker_iff.mp h
    exact (LinearPMap.mem_graph_iff T).mpr ⟨y, hxy.symm, hy⟩
  · intro h
    obtain ⟨y, hyx, hy⟩ := (LinearPMap.mem_graph_iff T).mp h
    exact LinearPMap.mem_ker_iff.mpr ⟨y, hyx.symm, hy⟩

/-- The actual source normalization is nonzero and preserves the
partial-map kernel, including the original domain membership. -/
theorem oneSixteenth_ker (T : E →ₗ.[ℂ] F) :
    ((1 / 16 : ℂ) • T).ker = T.ker := by
  ext x
  constructor
  · intro h
    obtain ⟨u, hxu, hu⟩ := LinearPMap.mem_ker_iff.mp h
    refine LinearPMap.mem_ker_iff.mpr ⟨u, hxu, ?_⟩
    change (1 / 16 : ℂ) • T u = 0 at hu
    have h := congrArg (fun y : F => (16 : ℂ) • y) hu
    have hc : (16 : ℂ) * (1 / 16 : ℂ) = 1 := by norm_num
    simpa only [smul_smul, hc, one_smul, smul_zero] using h
  · intro h
    obtain ⟨u, hxu, hu⟩ := LinearPMap.mem_ker_iff.mp h
    refine LinearPMap.mem_ker_iff.mpr ⟨u, hxu, ?_⟩
    change (1 / 16 : ℂ) • T u = 0
    rw [hu, smul_zero]

end Algebra

section Hilbert

variable {E F : Type*}
variable [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
variable [NormedAddCommGroup F] [InnerProductSpace ℂ F]

/-- True natural adjoint-square zero pairs equal original charge zero
pairs. Density is explicit; no entire-domain invariance is assumed. -/
theorem naturalAdjointSquare_graph_zero_iff
    (T : E →ₗ.[ℂ] F) (hd : Dense (T.domain : Set E)) (x : E) :
    (x, (0 : E)) ∈ (naturalComp T.adjoint T).graph ↔
      (x, (0 : F)) ∈ T.graph := by
  constructor
  · intro hx
    obtain ⟨y, hxy, hy⟩ := mem_graph_naturalComp.mp hx
    obtain ⟨u, rfl, rfl⟩ := (LinearPMap.mem_graph_iff T).mp hxy
    obtain ⟨v, hv, hv0⟩ := (LinearPMap.mem_graph_iff T.adjoint).mp hy
    have hp := (LinearPMap.adjoint_isFormalAdjoint hd) v u
    rw [hv0, inner_zero_left, hv] at hp
    exact (LinearPMap.mem_graph_iff T).mpr
      ⟨u, rfl, inner_self_eq_zero.mp hp.symm⟩
  · intro hx
    exact mem_graph_naturalComp.mpr ⟨0, hx, T.adjoint.graph.zero_mem⟩

theorem naturalAdjointSquare_ker
    (T : E →ₗ.[ℂ] F) (hd : Dense (T.domain : Set E)) :
    (naturalComp T.adjoint T).ker = T.ker := by
  ext x
  exact (mem_ker_iff_graph_zero _ x).trans
    ((naturalAdjointSquare_graph_zero_iff T hd x).trans
      (mem_ker_iff_graph_zero T x).symm)

end Hilbert

variable (M : AlgebraData 2) (G : M.GaugeData) {ε : ℝ} (hε : 0 < ε)

/-- Literal native inverse-graph zero pairs coincide because Bε0=0. -/
theorem originalWeightedPhysicalCharge_graph_zero_iff (x : G.physicalSpace) :
    (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalWeightedPhysicalChargeColumn M G hε).graph ↔
      (x, (0 : PiLp 2 (fun _ : SpinIndex => FullL2 2))) ∈
        (originalMinimalPhysicalHilbertChargeColumn M G).graph := by
  rw [originalWeightedPhysicalChargeColumn_graph_eq M G hε,
    originalWeightedPhysicalChargeGraph_mem_iff M G hε]
  simp only [map_zero]

theorem originalWeightedPhysicalCharge_ker_eq_original :
    (originalWeightedPhysicalChargeColumn M G hε).ker =
      (originalMinimalPhysicalHilbertChargeColumn M G).ker := by
  ext x
  exact (mem_ker_iff_graph_zero _ x).trans
    ((originalWeightedPhysicalCharge_graph_zero_iff M G hε x).trans
      (mem_ker_iff_graph_zero _ x).symm)

theorem originalWeightedNormalized_ker_eq_charge :
    (originalWeightedPhysicalNormalizedAdjointSquare M G hε).ker =
      (originalWeightedPhysicalChargeColumn M G hε).ker := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  calc
    (originalWeightedPhysicalNormalizedAdjointSquare M G hε).ker =
        (originalWeightedPhysicalAdjointSquare M G hε).ker :=
      oneSixteenth_ker _
    _ = (originalWeightedPhysicalChargeColumn M G hε).ker :=
      naturalAdjointSquare_ker _
        (originalWeightedPhysicalChargeColumn_domain_dense_unconditional M G hε)

/-- The unchanged source BE Hamiltonian has the original charge kernel. -/
theorem originalNormalizedHamiltonian_ker_eq_charge :
    (originalMinimalPhysicalNormalizedHamiltonian M G).ker =
      (originalMinimalPhysicalHilbertChargeColumn M G).ker := by
  let : CompleteSpace G.physicalSpace := originalPhysicalHilbertComplete M G
  calc
    (originalMinimalPhysicalNormalizedHamiltonian M G).ker =
        (originalMinimalPhysicalHilbertChargeAdjointSquare M G).ker :=
      oneSixteenth_ker _
    _ = (originalMinimalPhysicalHilbertChargeColumn M G).ker :=
      naturalAdjointSquare_ker _
        (originalMinimalPhysicalHilbertChargeColumn_domain_dense_unconditional M G)

/-- Exact kernel submodule equality to the original physical H.
This does not assert that this kernel contains a nonzero vector. -/
theorem originalWeightedNormalized_ker_eq_originalH :
    (originalWeightedPhysicalNormalizedAdjointSquare M G hε).ker =
      (originalMinimalPhysicalNormalizedHamiltonian M G).ker :=
  (originalWeightedNormalized_ker_eq_charge M G hε).trans
    ((originalWeightedPhysicalCharge_ker_eq_original M G hε).trans
      (originalNormalizedHamiltonian_ker_eq_charge M G).symm)

#print axioms mem_ker_iff_graph_zero
#print axioms oneSixteenth_ker
#print axioms naturalAdjointSquare_graph_zero_iff
#print axioms naturalAdjointSquare_ker
#print axioms originalWeightedPhysicalCharge_graph_zero_iff
#print axioms originalWeightedPhysicalCharge_ker_eq_original
#print axioms originalWeightedNormalized_ker_eq_charge
#print axioms originalNormalizedHamiltonian_ker_eq_charge
#print axioms originalWeightedNormalized_ker_eq_originalH

end
end FCP.BFSSP3AuxRADC4COriginalWeightedKernelPreservation
