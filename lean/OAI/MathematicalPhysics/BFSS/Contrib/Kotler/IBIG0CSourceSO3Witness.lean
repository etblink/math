import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CSO3Euler
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CXImage
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.IBIG0CZImage

/-!
# IBI-G0C — universal SO(3) witness from the ORIGINAL BFSS GaugeGroup 2

The accepted source-independent arbitrary SO3 Euler decomposition is joined to
the separately qualified original BFSS SU2 X and Z generators and their
actual source color-adjoint images, using the existing original G3A
adjointColorMatrix_mul theorem.

No substitute SU(2), changed Pauli normalization, third-party imported proof,
unqualified native quaternion path, physical Hilbert/Fock equivalence, or
spectral conclusion is assumed. This new source-specific theorem is
STAGED until its own exact-pinned strict source and independent consumer pass.

The statement proves that every SO3 matrix HAS a source gauge witness.
It does not separately prove all source G3A images lie inside SO3,
which is needed to type the full map as a hom into the SO3 subgroup.
-/

set_option autoImplicit false

namespace FCP.BFSSIBIG0CSourceSO3Witness
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSIBIG0CNativeZGenerator
open FCP.BFSSIBIG0CNativeXGenerator
open Matrix

/-- Exact abstract/natively sourced positive Z rotation convention. -/
theorem abstractRotZ_eq_sourceRotZ (θ : ℝ) :
    FCP.BFSSIBIG0CSO3Euler.rotZ θ =
      FCP.BFSSIBIG0CZImage.sourceRotZ θ := rfl

/-- Exact abstract/natively sourced positive X rotation convention. -/
theorem abstractRotX_eq_sourceRotX (β : ℝ) :
    FCP.BFSSIBIG0CSO3Euler.rotX β =
      FCP.BFSSIBIG0CXImage.sourceRotX β := rfl

/-- A genuine ordered product in original BFSS GaugeGroup 2 has exactly
the accepted abstract ZXZ real 3x3 image. This is the critical
source-specific composition step: source G3A multiplication is reused,
never assumed for a textbook replacement representation. -/
theorem originalAdjointColorMatrix_sourceZXZ
    (α β γ : ℝ) :
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix
      (sourceZGauge α * sourceXGauge β * sourceZGauge γ) =
      FCP.BFSSIBIG0CSO3Euler.rotZ α *
        FCP.BFSSIBIG0CSO3Euler.rotX β *
        FCP.BFSSIBIG0CSO3Euler.rotZ γ := by
  calc
    _ = FCP.BFSSIBIG0CZImage.sourceRotZ α *
          FCP.BFSSIBIG0CXImage.sourceRotX β *
          FCP.BFSSIBIG0CZImage.sourceRotZ γ := by
            rw [FCP.BFSSSU2GaugeG3A.adjointColorMatrix_mul,
              FCP.BFSSSU2GaugeG3A.adjointColorMatrix_mul,
              FCP.BFSSIBIG0CZImage.originalAdjointColorMatrix_sourceZ_eq_rotZ,
              FCP.BFSSIBIG0CXImage.originalAdjointColorMatrix_sourceX_eq_rotX]
    _ = _ := by
      rw [← abstractRotZ_eq_sourceRotZ, ← abstractRotX_eq_sourceRotX]

/-- Universal original-BFSS source-gauge witness for each proper real
three-dimensional rotation. It asserts surjectivity *onto the subset*
SO(3) as a matrix-existence statement, without presupposing a separate
global determinant-one codomain theorem for all gauge inputs. -/
theorem originalBFSS_adjoint_hits_every_SO3
    (Q : Matrix (Fin 3) (Fin 3) ℝ)
    (hQ : Q ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) :
    ∃ g : GaugeGroup 2,
      FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q := by
  obtain ⟨α, β, γ, hEuler⟩ :=
    FCP.BFSSIBIG0CSO3Euler.sourceSO3_euler_decomp Q hQ
  refine ⟨sourceZGauge α * sourceXGauge β * sourceZGauge γ, ?_⟩
  exact (originalAdjointColorMatrix_sourceZXZ α β γ).trans hEuler.symm

#print axioms abstractRotZ_eq_sourceRotZ
#print axioms abstractRotX_eq_sourceRotX
#print axioms originalAdjointColorMatrix_sourceZXZ
#print axioms originalBFSS_adjoint_hits_every_SO3

end
end FCP.BFSSIBIG0CSourceSO3Witness
