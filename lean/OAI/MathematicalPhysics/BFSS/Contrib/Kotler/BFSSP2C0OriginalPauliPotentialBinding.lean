import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSFullAlgebraDataProbe

/-!
# P2-C0 — instantiate the original SU(2) Pauli color and potential interfaces

These two lemmas only discharge the already-proved color-basis hypothesis
against the actual original AlgebraData 2. No fresh epsilon/contraction
identity, alternate potential, Fock field, physical Hamiltonian or spectrum
is constructed. Source candidate pending a cold Lean 4.34.1 build and a
separately compiled independent consumer; do NOT call this strict-qualified.
-/

set_option autoImplicit false

namespace FCP.BFSSP2C0OriginalPauliPotentialBinding

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

/-- The literal original normalized-Pauli source has oriented structure
constants +sqrt(2) epsilon, not an uninstantiated color-basis premise. -/
theorem originalPauli_structureConstant (a b c : ColorIndex 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.structureConstant a b c =
      Real.sqrt 2 * FCP.BFSSSU2.epsilon3 a b c := by
  exact FCP.BFSSSU2.algebraData_structureConstant_of_pauli_color
    FCP.BFSSSU2Full.concreteAlgebraData
    FCP.BFSSSU2Full.concreteAlgebraData_color a b c

/-- The actual massless source bosonic potential equals the original
Pauli wedge form, retaining precisely the upstream 1/2 normalization. -/
theorem originalPauli_masslessPotential_eq_wedge (x : Boson 2) :
    FCP.BFSSSU2Full.concreteAlgebraData.deformedBosonicPotential 1 0 x =
      ∑ p : OAI.BFSSGamma.SpatialPair,
        FCP.BFSSSU2.colorWedgeSquared
          (fun a : Fin 3 => x (p.1.1, a))
          (fun a : Fin 3 => x (p.1.2, a)) := by
  exact FCP.BFSSSU2.deformedBosonicPotential_one_zero_eq_wedge
    FCP.BFSSSU2Full.concreteAlgebraData
    FCP.BFSSSU2Full.concreteAlgebraData_color x

#print axioms originalPauli_structureConstant
#print axioms originalPauli_masslessPotential_eq_wedge

end FCP.BFSSP2C0OriginalPauliPotentialBinding
