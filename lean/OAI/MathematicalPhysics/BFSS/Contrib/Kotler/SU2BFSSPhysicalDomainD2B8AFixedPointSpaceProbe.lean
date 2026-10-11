import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainD2B7SourceFullL2GaugeIsometryAndFixednessProbe

/-!
# BFSS SU2 D2B8A — original full-L² physical space equals gauge fixed vectors

PROSPECTIVE / UNCOMPILED until the pinned Lean workflow passes.

The accepted D2B7 theorem shows every vector in the true source
GaugeData.physicalSpace is fixed by sourceFullGaugePairCLM. This leaf
proves the converse using the original fermion inverse action.

This is a source-defined fixed-point characterization. It does NOT prove
SU2 strong continuity on FullL2, a full Hilbert Haar integral,
bounded Haar projection, or invariant smooth-core density.
-/

namespace FCP.BFSSSU2PhysicalDomainD2B8A
noncomputable section

open OAI
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainD2B6
open FCP.BFSSSU2PhysicalDomainD2B7
open MeasureTheory

variable (M : AlgebraData 2) (G : M.GaugeData)

/-- The simultaneous fixed vectors of the original SU2 full-Hilbert
gauge operators are EXACTLY the true source-defined physicalSpace. -/
theorem sourceFullGaugePairCLM_fixed_iff_physical (v : FullL2 2) :
    (∀ g : GaugeGroup 2, sourceFullGaugePairCLM M G g v = v) ↔
      v ∈ G.physicalSpace := by
  constructor
  · intro hfixed
    change v ∈
      (⨅ g : GaugeGroup 2,
        LinearMap.ker (G.bosonPullback g - G.fiberAction g))
    apply (Submodule.mem_iInf _).mpr
    intro g
    change G.bosonPullback g v - G.fiberAction g v = 0
    apply sub_eq_zero.mpr
    have hg := hfixed g⁻¹
    rw [sourceFullGaugePairCLM_apply] at hg
    have hf := congrArg (G.fiberAction g) hg
    rw [sourceFermionFiberAction_left_inv M G g] at hf
    simpa only [inv_inv] using hf
  · intro hv g
    exact sourceFullGaugePairCLM_fixed_physical M G g v hv

#print axioms sourceFullGaugePairCLM_fixed_iff_physical

end
end FCP.BFSSSU2PhysicalDomainD2B8A

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainD2B8AFixedPointSpaceProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
