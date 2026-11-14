import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3OriginalPhysicalWeightedChargeGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AZOriginalPhysicalChargeDomainDensityReductionProbe

/-!
P3-AUX-RAD-C3D-B R2: the ACTUAL sixteen original smooth-core charge
outputs have a weighted FullL2 representative in AY's PiLp 2 output.
Exact original source invariant-core inputs lie in the accepted closed
physical weighted charge graph. Not yet a dense-domain theorem.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSP3AuxR0B2AOriginalReciprocalFullL2BoundedAction
open FCP.BFSSP3AuxRADC2BOriginalReciprocalHilbertOutputLift
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness

/-- A genuine AY Hilbert PiLp 2 column formed by applying the accepted
compact-support radial weight witness to the sixteen source M.charge fields.
There is no replacement source charge or output carrier. -/
noncomputable def originalWeightedChargeCoreOutput
    (M : AlgebraData 2) (ε : ℝ) (f : SmoothCore 2) :
    PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
  (originalMinimalHilbertOutputEquiv (N := 2)).symm
    (fun α : SpinIndex => originalWeightedCoreFieldL2 ε (M.charge α f))

/-- Exact output lift: reciprocal of every weighted original source
charge field recovers the unmodified original M.chargeVector f. -/
theorem originalWeightedChargeCoreOutput_reciprocal
    (M : AlgebraData 2) {ε : ℝ} (hε : 0 < ε)
    (f : SmoothCore 2) :
    originalReciprocalHilbertOutputCLM hε
      (originalWeightedChargeCoreOutput M ε f) =
      WithLp.toLp 2 (M.chargeVector f) := by
  apply (originalMinimalHilbertOutputEquiv (N := 2)).injective
  funext α
  rw [originalReciprocalHilbertOutputCLM_coordinate hε]
  change originalReciprocalFullL2CLM hε
      (originalWeightedCoreFieldL2 ε (M.charge α f)) =
      coreToL2 (M.charge α f)
  exact originalReciprocalFullL2CLM_core_witness hε (M.charge α f)

/-- The actual original invariant smooth core is included in the
actual physical-Hilbert weighted inverse-image graph, with the genuine
source gauge data, via AU/AY original closed core graph. -/
theorem originalWeightedChargeCoreGraph_mem
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) (f : G.invariantCore) :
    ((⟨coreToL2 f.val, f.property⟩ : G.physicalSpace),
      originalWeightedChargeCoreOutput M ε f.val) ∈
      (originalWeightedPhysicalChargeColumn M G hε).graph := by
  rw [originalWeightedPhysicalChargeColumn_graph_eq M G hε]
  apply (originalWeightedPhysicalChargeGraph_mem_iff M G hε _).mpr
  rw [originalWeightedChargeCoreOutput_reciprocal M hε f.val]
  rw [originalMinimalPhysicalHilbertChargeColumn_graph_eq M G]
  apply (originalMinimalPhysicalHilbertChargeGraph_mem_iff M G _).mpr
  have hcore :
      (coreToL2 f.val, M.chargeVector f.val) ∈
        originalMinimalCoreGraph M G := ⟨f, rfl⟩
  change (coreToL2 f.val, M.chargeVector f.val) ∈
    closure (originalMinimalCoreGraph M G :
      Set (FullL2 2 × (SpinIndex → FullL2 2)))
  exact subset_closure hcore

/-- A SOURCE-EXACT inclusion in the domain of the closed weighted
partial linear charge. Density is a separate Haar step. -/
theorem originalWeightedChargeCore_mem_domain
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) (f : G.invariantCore) :
    (⟨coreToL2 f.val, f.property⟩ : G.physicalSpace) ∈
      (originalWeightedPhysicalChargeColumn M G hε).domain :=
  LinearPMap.mem_domain_of_mem_graph
    (originalWeightedChargeCoreGraph_mem M G hε f)

#print axioms originalWeightedChargeCoreOutput
#print axioms originalWeightedChargeCoreOutput_reciprocal
#print axioms originalWeightedChargeCoreGraph_mem
#print axioms originalWeightedChargeCore_mem_domain

end
end FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
