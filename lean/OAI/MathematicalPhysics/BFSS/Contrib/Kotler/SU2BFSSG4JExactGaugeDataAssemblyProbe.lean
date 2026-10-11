import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSG4IC2FermionJointContinuityProbe
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSG2BBosonGaugeContinuityProbe

/-!
# BFSS SU(2) G4-J — literal six-field upstream GaugeData construction

This is a FIELD-BY-FIELD assembly of the already independently
compiler-qualified, source-bound G1-A/G2-A/G2-B/G4-E/G4-H/G4-I-C2
SU(2) construction for exactly pairedAlgebraData : AlgebraData 2.

It does not substitute a new AlgebraData, gauge representation or
Hilbert space. There are no new mathematical assumptions.

A successful compilation validates the exact upstream
AlgebraData.GaugeData structure on the pinned BFSS types.
It does not establish Hamiltonian spectral results, dynamics or
empirical correctness of BFSS matrix theory.
-/

namespace FCP.BFSSSU2GaugeG4J
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG2A FCP.BFSSSU2GaugeG2B
open FCP.BFSSSU2GaugeG4E FCP.BFSSSU2GaugeG4H
open FCP.BFSSSU2GaugeG4IC2

/-- The literal PINNED upstream six-field BFSS SU(2) GaugeData
for the true 48-Majorana, 24-orbital pairedAlgebraData witness.

The boson and fermion actions are exact real/complex Hilbert
isometries and group homomorphisms. All covariance and continuity
fields are the previously source-verified theorems. -/
noncomputable def pairedGaugeData : pairedAlgebraData.GaugeData where
  boson := bosonGauge
  fermion := fermionGaugeUnitaryHom
  boson_adjoint := by
    intro g x i
    exact bosonGauge_adjoint g x i
  fermion_adjoint := by
    intro g α A f
    exact pairedAlgebraData_fermion_adjoint g α A f
  boson_continuous := bosonGauge_continuous
  fermion_continuous := fermionGauge_jointContinuous

/-- Assembly preserves precisely G2-A's already verified boson action. -/
theorem pairedGaugeData_boson_exact :
    pairedGaugeData.boson = bosonGauge := rfl

/-- Assembly preserves precisely G4-E's already verified unitary
fermion action; it is not a replacement representation. -/
theorem pairedGaugeData_fermion_exact :
    pairedGaugeData.fermion = fermionGaugeUnitaryHom := rfl

/-- Recover the exact upstream field, not just an independent theorem. -/
theorem pairedGaugeData_fermion_jointContinuous :
    Continuous (fun z : GaugeGroup 2 × Fermion 2 =>
      pairedGaugeData.fermion z.1 z.2) :=
  pairedGaugeData.fermion_continuous

#print axioms pairedGaugeData
#print axioms pairedGaugeData_boson_exact
#print axioms pairedGaugeData_fermion_exact
#print axioms pairedGaugeData_fermion_jointContinuous

end
end FCP.BFSSSU2GaugeG4J

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-concrete-potential/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
