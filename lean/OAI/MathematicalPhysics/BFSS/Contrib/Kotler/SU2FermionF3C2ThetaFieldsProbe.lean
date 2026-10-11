import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2FermionF3C1SubmoduleDichotomyProbe

/-!
# BFSS fermions F3-C2 — exact AlgebraData 2 theta-field compatibility

This file states the pinned OAI.BFSSQuantum.AlgebraData 2 theta fields
with exact types; it constructs no other AlgebraData fields.
The claims are discharged by accepted F2, F2-B2d2, and F3-C1 theorems.
-/

namespace FCP.BFSSFermionF3C2
noncomputable section

open FCP.BFSSFermionF2

/-- Exact theta_selfAdjoint field type for pinned AlgebraData 2. -/
theorem thetaCandidate_upstream_selfAdjoint :
    ∀ (α : OAI.BFSSQuantum.SpinIndex)
      (A : OAI.BFSSQuantum.ColorIndex 2),
      IsSelfAdjoint (thetaCandidate α A) := by
  intro α A
  exact FCP.BFSSFermionF2.thetaCandidate_selfAdjoint α A

/-- Exact theta_CAR field type and normalization for pinned AlgebraData 2. -/
theorem thetaCandidate_upstream_CAR :
    ∀ (α β : OAI.BFSSQuantum.SpinIndex)
      (A B : OAI.BFSSQuantum.ColorIndex 2),
      thetaCandidate α A * thetaCandidate β B +
        thetaCandidate β B * thetaCandidate α A =
        (if α = β ∧ A = B then (1 : ℂ) else 0) •
          (1 : OAI.BFSSQuantum.Fermion 2 →L[ℂ]
            OAI.BFSSQuantum.Fermion 2) := by
  intro α β A B
  exact FCP.BFSSFermionF2B2Theta.thetaCandidate_CAR α β A B

/-- Exact theta_irreducible field type for pinned AlgebraData 2. -/
theorem thetaCandidate_upstream_irreducible :
    ∀ W : Submodule ℂ (OAI.BFSSQuantum.Fermion 2),
      (∀ α A, ∀ w ∈ W, thetaCandidate α A w ∈ W) →
        W = ⊥ ∨ W = ⊤ := by
  intro W hθ
  exact FCP.BFSSFermionF3C1.thetaInvariant_bot_or_top W hθ

#print axioms thetaCandidate_upstream_selfAdjoint
#print axioms thetaCandidate_upstream_CAR
#print axioms thetaCandidate_upstream_irreducible

end
end FCP.BFSSFermionF3C2

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-concrete-potential/SU2FermionF3C2ThetaFieldsProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
