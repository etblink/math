import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC2BOriginalReciprocalHilbertOutputLift
import Mathlib.Topology.Algebra.Module.LinearPMap

/-!
P3-AUX-RAD-C3 R1. Closed inverse-image graph of the ACTUAL original AY
physical-input, sixteen-FullL2-output closed minimal charge.
The weighting is defined by an injective bounded reciprocal B16
on the output. This gate proves graph/closedness only, not domain density,
maximal weighted multiplication, a quadratic form or a spectral gap.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift

/-- Native closed-graph inverse image in the exact physical-Hilbert
input and AY's genuine sixteen-output PiLp 2 Hilbert product. -/
noncomputable def originalWeightedPhysicalChargeGraph
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    Submodule ℂ (G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2)) :=
  (originalMinimalPhysicalHilbertChargeColumn M G).graph.comap
    ((LinearMap.id : G.physicalSpace →ₗ[ℂ] G.physicalSpace).prodMap
      (originalReciprocalHilbertOutputCLM hε).toLinearMap)

/-- The weighted graph means precisely (u, B16 z) belongs to the
accepted original physical-input charge graph. -/
theorem originalWeightedPhysicalChargeGraph_mem_iff
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε)
    (p : G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2)) :
    p ∈ originalWeightedPhysicalChargeGraph M G hε ↔
      (p.1, originalReciprocalHilbertOutputCLM hε p.2) ∈
        (originalMinimalPhysicalHilbertChargeColumn M G).graph := by
  rfl

/-- Vertical uniqueness follows solely from the original AY graph
being single-valued and the qualified B16 having zero kernel. -/
private theorem originalWeightedPhysicalChargeGraph_vertical
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    ∀ p : G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2),
      p ∈ originalWeightedPhysicalChargeGraph M G hε →
      p.1 = 0 → p.2 = 0 := by
  rintro ⟨u, y⟩ hp hu
  have hsrc : (u, originalReciprocalHilbertOutputCLM hε y) ∈
      (originalMinimalPhysicalHilbertChargeColumn M G).graph :=
    (originalWeightedPhysicalChargeGraph_mem_iff M G hε _).mp hp
  have hzero : originalReciprocalHilbertOutputCLM hε y = 0 :=
    (originalMinimalPhysicalHilbertChargeColumn M G).graph_fst_eq_zero_snd hsrc hu
  apply originalReciprocalHilbertOutputCLM_injective hε
  simpa using hzero

/-- The actual original physical-Hilbert weighted charge is defined
by its single-valued closed candidate inverse-image graph. -/
noncomputable def originalWeightedPhysicalChargeColumn
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    G.physicalSpace →ₗ.[ℂ]
      PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
  (originalWeightedPhysicalChargeGraph M G hε).toLinearPMap

theorem originalWeightedPhysicalChargeColumn_graph_eq
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalChargeColumn M G hε).graph =
      originalWeightedPhysicalChargeGraph M G hε := by
  exact Submodule.toLinearPMap_graph_eq _
    (originalWeightedPhysicalChargeGraph_vertical M G hε)

/-- Closedness is the continuous preimage of AY's accepted
original physical-charge graph under (u,y) ↦ (u,B16 y). -/
theorem originalWeightedPhysicalChargeColumn_isClosed
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    (originalWeightedPhysicalChargeColumn M G hε).IsClosed := by
  change IsClosed ((originalWeightedPhysicalChargeColumn M G hε).graph :
    Set (G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2)))
  rw [originalWeightedPhysicalChargeColumn_graph_eq M G hε]
  change IsClosed {p : G.physicalSpace ×
      PiLp 2 (fun _ : SpinIndex => FullL2 2) |
    (p.1, originalReciprocalHilbertOutputCLM hε p.2) ∈
      ((originalMinimalPhysicalHilbertChargeColumn M G).graph :
        Set (G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2)))}
  have hc : IsClosed ((originalMinimalPhysicalHilbertChargeColumn M G).graph :
      Set (G.physicalSpace × PiLp 2 (fun _ : SpinIndex => FullL2 2))) :=
    originalMinimalPhysicalHilbertChargeColumn_isClosed M G
  have hf : Continuous (fun p : G.physicalSpace ×
      PiLp 2 (fun _ : SpinIndex => FullL2 2) =>
      (p.1, originalReciprocalHilbertOutputCLM hε p.2)) :=
    continuous_fst.prodMk
      ((originalReciprocalHilbertOutputCLM hε).continuous.comp continuous_snd)
  exact hc.preimage hf

#print axioms originalWeightedPhysicalChargeGraph
#print axioms originalWeightedPhysicalChargeGraph_mem_iff
#print axioms originalWeightedPhysicalChargeColumn
#print axioms originalWeightedPhysicalChargeColumn_graph_eq
#print axioms originalWeightedPhysicalChargeColumn_isClosed

end
end FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
