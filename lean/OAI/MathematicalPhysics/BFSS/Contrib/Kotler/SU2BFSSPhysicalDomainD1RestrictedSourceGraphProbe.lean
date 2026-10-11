import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSG4K10ASourceClosedJointChargeGraphProbe
import OAI.MathematicalPhysics.BFSS.ClosedProfiles

/-!
# BFSS SU(2) Physical Domain D1 — exact gauge-restricted source graph

PROSPECTIVE / UNCOMPILED until the dedicated pinned Actions gate succeeds.
This is a bounded bridge between the original gauge-invariant source
smooth core, the original 16-charge column, and the *actual* source
GaugeData.deformedModelGraph (at h=1,m=0).

There is no claim that the physical smooth core is L²-dense in the
entire physicalSpace, that charge images stay in physicalSpace, or
that a paper's self-adjoint Hamiltonian has been identified.
-/

namespace FCP.BFSSSU2PhysicalDomainD1
noncomputable section

open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG4K9D
open FCP.BFSSSU2GaugeG4K10A

variable {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)

/-- The original BFSS joint charge graph, explicitly restricted to
the source-defined Gauss-invariant compactly supported smooth core.
This is an original-source object construction, not an assumption. -/
def originalRestrictedClosedGraph :
    Submodule ℂ (FullL2 N × (SpinIndex → FullL2 N)) :=
  (LinearMap.range
    ((coreToL2.comp G.invariantCore.subtype).prod
      (M.chargeVector.comp G.invariantCore.subtype))).topologicalClosure

/-- The actual upstream G.deformedModelGraphMap is the literal
original BFSS charge graph map when (h,m)=(1,0). -/
theorem sourceGaugeRestrictedGraphMap_equal :
    G.deformedModelGraphMap 1 0 =
      (coreToL2.comp G.invariantCore.subtype).prod
        (M.chargeVector.comp G.invariantCore.subtype) := by
  change (coreToL2.comp G.invariantCore.subtype).prod
      ((M.deformedChargeVector 1 0).comp G.invariantCore.subtype) = _
  rw [sourceChargeVector_equal M]

/-- Equality of the source-defined GAUGE-RESTRICTED closed joint charge
graph with the closure of the original gauge-restricted charge map.
This is not inferred from equality of full-space graph closures. -/
theorem sourceGaugeRestrictedClosedGraph_equal :
    G.deformedModelGraph 1 0 = originalRestrictedClosedGraph M G := by
  change (LinearMap.range (G.deformedModelGraphMap 1 0)).topologicalClosure =
    (LinearMap.range
      ((coreToL2.comp G.invariantCore.subtype).prod
        (M.chargeVector.comp G.invariantCore.subtype))).topologicalClosure
  rw [sourceGaugeRestrictedGraphMap_equal M G]

/-- Both gauge-restricted constructions have the same projected
closed-charge domain, in the genuine source ambient FullL2 space. -/
theorem sourceGaugeRestrictedClosedDomain_iff (ψ : FullL2 N) :
    (∃ y : SpinIndex → FullL2 N,
      (ψ, y) ∈ G.deformedModelGraph 1 0) ↔
    (∃ y : SpinIndex → FullL2 N,
      (ψ, y) ∈ originalRestrictedClosedGraph M G) := by
  rw [sourceGaugeRestrictedClosedGraph_equal M G]

/-- The formally qualified core-form equality holds on the actual
source gauge-invariant smooth core, not only full-space test sections. -/
theorem sourceGaugeRestrictedCoreForm_equal (f : G.invariantCore) :
    M.deformedCoreEnergy 1 0 f.val = M.coreForm f.val := by
  exact sourceUnconditionalCoreForm_equal M f.val

/-- Source-defined gauge-restricted graph is included in the
source-defined full closed charge graph; equality is NOT claimed.
This preserves the critical distinction between these closures. -/
theorem sourceGaugeRestrictedGraph_le_full :
    G.deformedModelGraph 1 0 ≤ M.fullClosedGraph := by
  rw [← sourceClosedJointChargeGraph_equal M]
  exact G.deformedModelGraph_le_full 1 0

#print axioms sourceGaugeRestrictedGraphMap_equal
#print axioms sourceGaugeRestrictedClosedGraph_equal
#print axioms sourceGaugeRestrictedClosedDomain_iff
#print axioms sourceGaugeRestrictedCoreForm_equal
#print axioms sourceGaugeRestrictedGraph_le_full

end
end FCP.BFSSSU2PhysicalDomainD1

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainD1RestrictedSourceGraphProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
