import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5AOriginalPhysicalMasslessCorePairing
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe

/-! Evaluate the native physical closed charge column and its diagonal form
on the original invariant smooth core. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5B
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM4A
open FCP.BFSSGM5A
open MeasureTheory Set
open scoped InnerProductSpace

private theorem closedChargeCoreGraph {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (f : G.invariantCore) :
    ((⟨coreToL2 f.val, f.property⟩ : G.physicalSpace),
      WithLp.toLp 2 (M.chargeVector f.val)) ∈
        (originalMinimalPhysicalHilbertChargeColumn M G).graph := by
  have hcore : (coreToL2 f.val, M.chargeVector f.val) ∈
      originalMinimalCoreGraph M G := ⟨f, rfl⟩
  have hclosed : (coreToL2 f.val, M.chargeVector f.val) ∈
      originalMinimalClosedGraph M G := by
    change (coreToL2 f.val, M.chargeVector f.val) ∈
      closure (originalMinimalCoreGraph M G :
        Set (FullL2 N × (SpinIndex → FullL2 N)))
    exact subset_closure hcore
  rw [originalMinimalPhysicalHilbertChargeColumn_graph_eq M G]
  apply (originalMinimalPhysicalHilbertChargeGraph_mem_iff M G _).mpr
  change (coreToL2 f.val, M.chargeVector f.val) ∈ originalMinimalClosedGraph M G
  exact hclosed

/-- The original invariant smooth vector in the native closed charge domain. -/
def closedChargeCoreInput {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (f : G.invariantCore) :
    (originalMinimalPhysicalHilbertChargeColumn M G).domain :=
  ⟨⟨coreToL2 f.val, f.property⟩,
    LinearPMap.mem_domain_of_mem_graph (closedChargeCoreGraph M G f)⟩

/-- The native closed charge column returns the original sixteen core charges. -/
theorem closedChargeCoreOutput {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (f : G.invariantCore) :
    originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f) =
      WithLp.toLp 2 (M.chargeVector f.val) := by
  let T := originalMinimalPhysicalHilbertChargeColumn M G
  exact T.mem_graph_snd_inj (T.mem_graph (closedChargeCoreInput M G f))
    (closedChargeCoreGraph M G f) rfl

/-- The normalized diagonal charge form agrees with the original core form. -/
theorem closedChargeCoreForm {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (f : G.invariantCore) :
    (1 / 16 : ℝ) *
      ‖originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)‖ ^ 2 =
        M.coreForm f.val := by
  rw [closedChargeCoreOutput M G f]
  have hnorm : ‖WithLp.toLp 2 (M.chargeVector f.val)‖ ^ 2 =
      ∑ α : SpinIndex, ‖coreToL2 (M.charge α f.val)‖ ^ 2 :=
    PiLp.norm_sq_eq_of_L2 (fun _ : SpinIndex => FullL2 N)
      (WithLp.toLp 2 (M.chargeVector f.val))
  exact congrArg (fun x : ℝ => (1 / 16 : ℝ) * x) hnorm

/-- The massless energy identity evaluated using the native closed charge
column at the embedded invariant smooth core. -/
theorem physicalMasslessClosedChargeCoreEnergy (M : AlgebraData 2)
    (G : M.GaugeData) (f : G.invariantCore) :
    (1 / 16 : ℝ) *
      ‖originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)‖ ^ 2 =
      (1 / 2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f.val)‖ ^ 2 +
      (∫ x : Boson 2, M.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) +
      (inner ℂ (physicalMasslessCoreInput M G f).val
        (originalPhysicalMasslessMultiplier M G
          (physicalMasslessCoreInput M G f))).re :=
  (closedChargeCoreForm M G f).trans (physicalMasslessCoreEnergy M G f)

#print axioms closedChargeCoreInput
#print axioms closedChargeCoreOutput
#print axioms closedChargeCoreForm
#print axioms physicalMasslessClosedChargeCoreEnergy

end
end FCP.BFSSGM5B
