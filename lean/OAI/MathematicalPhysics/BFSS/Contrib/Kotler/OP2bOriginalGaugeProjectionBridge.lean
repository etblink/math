import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OP2aOriginalFockGaugeSource
import OAI.LinearAlgebra.GaugeFixedProjectionOP0

/-!
# OP2b: original SU(2) Fock representation as linear operators, with OP0 projection

Bind OP0's endomorphism representation and continuous-operator interface to
exactly the already-qualified original G4-E SU(2) unitary action on Fermion 2.
No replacement Fock carrier, assumed gauge averaging, or Spin(9) action.
Nonzero vacuum, gauge-physical L² and closed Hamiltonian remain OPEN.
-/

set_option autoImplicit false

namespace FCP.BFSSOriginalGaugeProjectionOP2B
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSOriginalFockGaugeOP2A
open FCP.BFSSGaugeFixedProjectionOP0

/-- Forgetting the norm and inverse proofs of the genuine original G4-E
unitary action produces a complex-linear representation on literal Fermion 2. -/
def originalGaugeLinearAction : GaugeGroup 2 →* Module.End ℂ (Fermion 2) where
  toFun g := (originalFockGaugeUnitaryHom g).toLinearEquiv.toLinearMap
  map_one' := by
    apply LinearMap.ext
    intro v
    change originalFockGaugeUnitaryHom 1 v = v
    rw [map_one]
    rfl
  map_mul' g h := by
    apply LinearMap.ext
    intro v
    change originalFockGaugeUnitaryHom (g * h) v =
      originalFockGaugeUnitaryHom g (originalFockGaugeUnitaryHom h v)
    rw [map_mul]
    rfl

/-- The same original unitary map viewed as a bounded complex-linear operator. -/
def originalGaugeContinuousAction (g : GaugeGroup 2) :
    Fermion 2 →L[ℂ] Fermion 2 :=
  (originalFockGaugeUnitaryHom g).toContinuousLinearMap

/-- The two operator interfaces act identically on every original Fock vector. -/
theorem originalGaugeOperators_exact (g : GaugeGroup 2) (v : Fermion 2) :
    originalGaugeContinuousAction g v = originalGaugeLinearAction g v := rfl

/-- Both interfaces act exactly as the pinned G4-E source representation. -/
theorem originalGaugeLinearAction_source (g : GaugeGroup 2) (v : Fermion 2) :
    originalGaugeLinearAction g v =
      FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom g v := rfl

/-- The literal SU(2)-fixed subspace of the original BFSS Fermion 2 carrier. -/
def originalFermionGaugeFixed : Submodule ℂ (Fermion 2) :=
  gaugeFixedSubspace originalGaugeLinearAction

/-- Canonical orthogonal projection onto the original fermionic fixed space. -/
def originalFermionGaugeProjection : Fermion 2 →L[ℂ] Fermion 2 :=
  gaugeFixedProjection originalGaugeLinearAction

/-- The genuine original SU(2) action fixes the output of the projection. -/
theorem originalFermionGaugeProjection_fixed
    (g : GaugeGroup 2) (v : Fermion 2) :
    originalFockGaugeUnitaryHom g (originalFermionGaugeProjection v) =
      originalFermionGaugeProjection v := by
  exact gaugeFixedProjection_fixed originalGaugeLinearAction v g

/-- The projection has range exactly the literal original fixed space. -/
theorem originalFermionGaugeProjection_range :
    originalFermionGaugeProjection.range = originalFermionGaugeFixed :=
  range_gaugeFixedProjection originalGaugeLinearAction

/-- The original fermionic gauge projection is idempotent. -/
theorem originalFermionGaugeProjection_idempotent :
    IsIdempotentElem originalFermionGaugeProjection :=
  gaugeFixedProjection_idempotent originalGaugeLinearAction

/-- The original fermionic gauge projection is orthogonal. -/
theorem originalFermionGaugeProjection_star :
    IsStarProjection originalFermionGaugeProjection :=
  gaugeFixedProjection_isStarProjection originalGaugeLinearAction

#print axioms originalGaugeOperators_exact
#print axioms originalGaugeLinearAction_source
#print axioms originalFermionGaugeProjection_fixed
#print axioms originalFermionGaugeProjection_range
#print axioms originalFermionGaugeProjection_idempotent
#print axioms originalFermionGaugeProjection_star

end
end FCP.BFSSOriginalGaugeProjectionOP2B
