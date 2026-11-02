import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPairedSpin9V10HF10YSourceNineCliffordPBWBasisProbe
import Mathlib.Analysis.Normed.Module.TransferInstance
import Mathlib.LinearAlgebra.Finsupp.Pi

set_option autoImplicit false

open OAI.BFSSQuantum

namespace FCP.BFSSPairedSpin9Clifford
noncomputable section

/-!
F10BD2 — construct a local PBW-coordinate normed topology on the exact
source-nine Clifford algebra, then check that the exact algebraic Spin9
subtype inherits a Hausdorff topology.

The accepted PBW representation lands in finitely supported functions,
not in the Pi function space. Compose it with the finite-index Finsupp/Pi
linear equivalence before transporting the norm. This remains local to
the diagnostic: it does not claim a canonical norm, continuity of
Clifford multiplication, a Lie-group structure, or a manifold atlas.
-/

local instance : Fintype (Finset SpaceIndex) := Fintype.ofFinite _

example : FiniteDimensional ℝ (CliffordAlgebra source9Quadratic) :=
  source9Clifford_finiteDimensional

/-- The accepted PBW coordinates, expressed as a genuine finite Pi space. -/
local def source9PBWCoordinates :
    CliffordAlgebra source9Quadratic ≃ₗ[ℝ] (Finset SpaceIndex → ℝ) :=
  source9CliffordPBWBasis.repr.trans
    (Finsupp.linearEquivFunOnFinite ℝ ℝ (Finset SpaceIndex))

local instance : NormedAddCommGroup (CliffordAlgebra source9Quadratic) :=
  NormedAddCommGroup.induced
    (CliffordAlgebra source9Quadratic)
    (Finset SpaceIndex → ℝ)
    source9PBWCoordinates.toAddMonoidHom
    source9PBWCoordinates.injective

local instance : NormedSpace ℝ (CliffordAlgebra source9Quadratic) :=
  NormedSpace.induced ℝ
    (CliffordAlgebra source9Quadratic)
    (Finset SpaceIndex → ℝ)
    source9PBWCoordinates

-- The PBW-coordinate topology on the ambient Clifford algebra.
example : NormedAddCommGroup (CliffordAlgebra source9Quadratic) := inferInstance
example : NormedSpace ℝ (CliffordAlgebra source9Quadratic) := inferInstance
example : TopologicalSpace (CliffordAlgebra source9Quadratic) := inferInstance
example : T2Space (CliffordAlgebra source9Quadratic) := inferInstance

-- The exact algebraic Spin9 subtype inherits the chosen Hausdorff topology.
example : TopologicalSpace (spinGroup source9Quadratic) := inferInstance
example : T2Space (spinGroup source9Quadratic) := inferInstance

-- The exact SO16 subtype already inherits the standard matrix topology.
example : TopologicalSpace (Matrix.specialOrthogonalGroup SpinIndex ℝ) := inferInstance
example : T2Space (Matrix.specialOrthogonalGroup SpinIndex ℝ) := inferInstance

end
end FCP.BFSSPairedSpin9Clifford
