import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2ColorCrossProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2FermionF3C2ThetaFieldsProbe

/-!
# BFSS SU(2) F4 — construct the exact pinned AlgebraData 2

The color, real Cl(9) gamma and 48-Majorana theta fields were
independently kernel-verified in prior gates. Here they are assembled
into the *actual* upstream OAI.BFSSQuantum.AlgebraData 2 structure.
This is finite algebra input, not a spectral or physical gap theorem.
-/

namespace FCP.BFSSSU2Full
noncomputable section

open OAI.BFSSQuantum

/-- A complete witness to the pinned OpenAI BFSS AlgebraData 2 API.
No replacement type, additional axiom or irreducibility hypothesis. -/
noncomputable def concreteAlgebraData : AlgebraData 2 where
  color := FCP.BFSSSU2.normalizedPauli
  color_hermitian := FCP.BFSSSU2.normalizedPauli_hermitian
  color_traceless := FCP.BFSSSU2.normalizedPauli_trace_zero
  color_orthonormal := FCP.BFSSSU2.normalizedPauli_trace_pair
  color_spanning := FCP.BFSSSU2.normalizedPauli_color_spanning
  gamma := FCP.BFSSGamma9.gamma
  gamma_symmetric := FCP.BFSSGamma9.gamma_symmetric
  gamma_clifford := FCP.BFSSGamma9.gamma_clifford
  theta := FCP.BFSSFermionF2.thetaCandidate
  theta_selfAdjoint :=
    FCP.BFSSFermionF3C2.thetaCandidate_upstream_selfAdjoint
  theta_CAR := by
    intro α β A B
    have h := FCP.BFSSFermionF3C2.thetaCandidate_upstream_CAR α β A B
    by_cases he : α = β ∧ A = B
    · simpa only [if_pos he, one_smul] using h
    · simpa only [if_neg he, ← Nat.cast_smul_eq_nsmul ℂ,
        Nat.cast_zero] using h
  theta_irreducible :=
    FCP.BFSSFermionF3C2.thetaCandidate_upstream_irreducible

/-- Identify the accepted normalized SU(2) color field. -/
theorem concreteAlgebraData_color (A : ColorIndex 2) :
    concreteAlgebraData.color A = FCP.BFSSSU2.normalizedPauli A := rfl

/-- Identify the accepted explicit nine real Clifford generators. -/
theorem concreteAlgebraData_gamma (i : SpaceIndex) :
    concreteAlgebraData.gamma i = FCP.BFSSGamma9.gamma i := rfl

/-- Identify the accepted transported 48-Majorana CAR family. -/
theorem concreteAlgebraData_theta (α : SpinIndex) (A : ColorIndex 2) :
    concreteAlgebraData.theta α A = FCP.BFSSFermionF2.thetaCandidate α A := rfl

#print axioms concreteAlgebraData
#print axioms concreteAlgebraData_color
#print axioms concreteAlgebraData_gamma
#print axioms concreteAlgebraData_theta

end
end FCP.BFSSSU2Full

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-concrete-potential/SU2BFSSFullAlgebraDataProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
