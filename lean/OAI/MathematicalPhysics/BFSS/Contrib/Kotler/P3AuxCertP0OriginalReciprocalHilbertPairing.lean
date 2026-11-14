import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxG0B0OriginalReciprocalFullL2AEMultiplication
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3OriginalPhysicalWeightedChargeGraph
import Mathlib.MeasureTheory.Function.L2Space
import Mathlib.Analysis.InnerProductSpace.PiL2

/-!
CERT-P0 R1: native original reciprocal Hilbert pairing and charge-graph transfer.
PROSPECTIVE until exact cold source and independent native consumer acceptance.
No new operator, Hardy estimate, physical Spin9 lift or fidelity theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxG0B0OriginalReciprocalFullL2AEMultiplication
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open MeasureTheory

theorem originalReciprocalField_conj (ε : ℝ) (x : Boson 2) :
    starRingEnd ℂ (originalReciprocalField ε x) =
      originalReciprocalField ε x := by
  unfold originalReciprocalField
  rw [Complex.conj_inv, Complex.conj_ofReal]

theorem originalReciprocalFullL2CLM_inner {ε : ℝ} (hε : 0 < ε)
    (f g : FullL2 2) :
    inner ℂ (originalReciprocalFullL2CLM hε f) g =
      inner ℂ f (originalReciprocalFullL2CLM hε g) := by
  rw [L2.inner_def, L2.inner_def]
  apply integral_congr_ae
  filter_upwards [originalReciprocalFullL2CLM_ae_originalField hε f,
    originalReciprocalFullL2CLM_ae_originalField hε g] with x hf hg
  rw [hf, hg, inner_smul_left, inner_smul_right,
    originalReciprocalField_conj]

theorem originalReciprocalHilbertOutputCLM_inner {ε : ℝ} (hε : 0 < ε)
    (f g : PiLp 2 (fun _ : SpinIndex => FullL2 2)) :
    inner ℂ (originalReciprocalHilbertOutputCLM hε f) g =
      inner ℂ f (originalReciprocalHilbertOutputCLM hε g) := by
  rw [PiLp.inner_apply, PiLp.inner_apply]
  apply Finset.sum_congr rfl
  intro α _
  have hf := originalReciprocalHilbertOutputCLM_coordinate hε f α
  have hg := originalReciprocalHilbertOutputCLM_coordinate hε g α
  change (originalReciprocalHilbertOutputCLM hε f) α =
    originalReciprocalFullL2CLM hε (f α) at hf
  change (originalReciprocalHilbertOutputCLM hε g) α =
    originalReciprocalFullL2CLM hε (g α) at hg
  rw [hf, hg]
  exact originalReciprocalFullL2CLM_inner hε (f α) (g α)

/-- Exact pairing with the unchanged original charge. The original
charge-domain witness and actual weighted graph premise are explicit. -/
theorem originalWeightedChargeGraph_pairing
    (M : AlgebraData 2) (G : M.GaugeData) {ε : ℝ} (hε : 0 < ε)
    (t : (originalMinimalPhysicalHilbertChargeColumn M G).domain)
    (z y : PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (hz : ((t : G.physicalSpace), z) ∈
      (originalWeightedPhysicalChargeColumn M G hε).graph) :
    inner ℂ (originalMinimalPhysicalHilbertChargeColumn M G t) y =
      inner ℂ z (originalReciprocalHilbertOutputCLM hε y) := by
  have hc := hz
  rw [originalWeightedPhysicalChargeColumn_graph_eq M G hε] at hc
  have hs := (originalWeightedPhysicalChargeGraph_mem_iff M G hε _).mp hc
  obtain ⟨v, hv, hvz⟩ :=
    (LinearPMap.mem_graph_iff (originalMinimalPhysicalHilbertChargeColumn M G)).mp hs
  have hvt : v = t := Subtype.ext hv
  have ht : originalMinimalPhysicalHilbertChargeColumn M G t =
      originalReciprocalHilbertOutputCLM hε z := hvt ▸ hvz
  exact (congrArg
    (fun w : PiLp 2 (fun _ : SpinIndex => FullL2 2) => inner ℂ w y) ht).trans
      (originalReciprocalHilbertOutputCLM_inner hε z y)

#print axioms originalReciprocalField_conj
#print axioms originalReciprocalFullL2CLM_inner
#print axioms originalReciprocalHilbertOutputCLM_inner
#print axioms originalWeightedChargeGraph_pairing

end
end FCP.BFSSP3AuxCertP0OriginalReciprocalHilbertPairing
