import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe

/-!
P3-AUX-RAD-C3D-C R1: source exact, original BFSS SU2 PHYSICAL
weighted 16-charge operator's input Hilbert-domain density.
Uses strict qualified C3D-B original invariant smooth core inclusion
and previously qualified original D2B10C Haar physical smooth-core density.
No maximal weighted-domain identification, graph-core or spectral gap.
-/
set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
open FCP.BFSSSU2PhysicalDomainD2B10C
open MeasureTheory Set

/-- Hilbert physical-input norm density reduces to literal original
G.coreNormClosure = G.physicalSpace. This is not graph-norm density. -/
theorem originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε)
    (hd : G.coreNormClosure = G.physicalSpace) :
    Dense ((originalWeightedPhysicalChargeColumn M G hε).domain :
      Set G.physicalSpace) := by
  rw [Subtype.dense_iff]
  have hs :
      (LinearMap.range (coreToL2.comp G.invariantCore.subtype) :
        Set (FullL2 2)) ⊆
      ((↑) '' ((originalWeightedPhysicalChargeColumn M G hε).domain :
        Set G.physicalSpace) : Set (FullL2 2)) := by
    rintro ψ ⟨f, rfl⟩
    let u : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
    refine ⟨u, ?_, rfl⟩
    exact originalWeightedChargeCore_mem_domain M G hε f
  calc
    (G.physicalSpace : Set (FullL2 2)) =
        (G.coreNormClosure : Set (FullL2 2)) :=
      congrArg (fun S : Submodule ℂ (FullL2 2) =>
        (S : Set (FullL2 2))) hd.symm
    _ = closure (LinearMap.range
        (coreToL2.comp G.invariantCore.subtype) : Set (FullL2 2)) := rfl
    _ ⊆ closure ((↑) '' ((originalWeightedPhysicalChargeColumn
        M G hε).domain : Set G.physicalSpace) : Set (FullL2 2)) :=
      closure_mono hs

/-- Unconditional actual BFSS SU2 physical Hilbert input norm density
of closed original weighted charge Sε, for every ε>0. Original Haar. -/
theorem originalWeightedPhysicalChargeColumn_domain_dense_unconditional
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    Dense ((originalWeightedPhysicalChargeColumn M G hε).domain :
      Set G.physicalSpace) :=
  originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
    M G hε (sourceCoreNormClosure_eq_physical_unconditional M G)

#print axioms originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
#print axioms originalWeightedPhysicalChargeColumn_domain_dense_unconditional

end
end FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
