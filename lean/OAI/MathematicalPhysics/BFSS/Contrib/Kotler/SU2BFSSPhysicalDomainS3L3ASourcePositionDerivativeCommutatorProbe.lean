import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2BFSSPhysicalDomainS3L1SourceOrbitalSmoothCoreProbe

/-!
# S3L3A — exact source position and coordinate-derivative commutator

Use the ORIGINAL pinned AlgebraData.position and coordinateDerivative
endomorphisms of SmoothCore 2. No substitute test-function algebra.

This single-coordinate Heisenberg product rule is needed to derive
[L_ij, position k B] from the accepted S3L1 genuine orbital generator.
The derivative-derivative commutator and the full cubic Q_alpha rotation
remain separate obligations.
-/

namespace FCP.BFSSSU2PhysicalDomainS3L3A
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData

private def sourceCoordinateCLM (k : SpaceIndex) (B : ColorIndex 2) :
    Boson 2 →L[ℝ] ℂ :=
  Complex.ofRealCLM.comp (EuclideanSpace.proj (𝕜 := ℝ) (k, B))

private theorem sourceCoordinateCLM_apply
    (k : SpaceIndex) (B : ColorIndex 2) (y : Boson 2) :
    sourceCoordinateCLM k B y = ((y (k, B) : ℝ) : ℂ) := rfl

private theorem sourceCoordinate_fderiv
    (k : SpaceIndex) (B : ColorIndex 2) (x v : Boson 2) :
    fderiv ℝ (fun y : Boson 2 => ((y (k, B) : ℝ) : ℂ)) x v =
      ((v (k, B) : ℝ) : ℂ) := by
  have h : (fun y : Boson 2 => ((y (k, B) : ℝ) : ℂ)) =
      sourceCoordinateCLM k B := by
    funext y
    exact (sourceCoordinateCLM_apply k B y).symm
  rw [h, ContinuousLinearMap.fderiv]
  exact sourceCoordinateCLM_apply k B v

/-- The literal BFSS source derivative and position maps satisfy their
canonical commutator, evaluated on the original smooth test core. -/
theorem sourceCoordinateDerivative_position_commutator_apply
    (i k : SpaceIndex) (A B : ColorIndex 2) (f : SmoothCore 2) (x : Boson 2) :
    (coordinateDerivative (N := 2) i A
      ((position (N := 2) k B) f)) x -
      (position (N := 2) k B
        ((coordinateDerivative (N := 2) i A) f)) x =
      ((((EuclideanSpace.single (i, A) (1 : ℝ)) (k, B) : ℝ) : ℂ) • f x) := by
  let v : Boson 2 := EuclideanSpace.single (i, A) (1 : ℝ)
  have hf : DifferentiableAt ℝ (f : Boson 2 → Fermion 2) x :=
    (f.contDiff.differentiable (by norm_num)).differentiableAt
  have hc : DifferentiableAt ℝ
      (fun y : Boson 2 => ((y (k, B) : ℝ) : ℂ)) x :=
    (sourceCoordinateCLM k B).differentiableAt
  change
    fderiv ℝ (fun y : Boson 2 =>
        ((y (k, B) : ℝ) : ℂ) • (f : Boson 2 → Fermion 2) y) x v -
      ((x (k, B) : ℝ) : ℂ) • fderiv ℝ (f : Boson 2 → Fermion 2) x v = _
  rw [fderiv_fun_smul hc hf]
  simp only [ContinuousLinearMap.add_apply, ContinuousLinearMap.smul_apply,
    ContinuousLinearMap.smulRight_apply]
  rw [sourceCoordinate_fderiv k B x v]
  change
    (((x (k, B) : ℝ) : ℂ) • fderiv ℝ (f : Boson 2 → Fermion 2) x v +
      (((v (k, B) : ℝ) : ℂ) • f x)) -
      ((x (k, B) : ℝ) : ℂ) • fderiv ℝ (f : Boson 2 → Fermion 2) x v = _
  abel

#print axioms sourceCoordinateDerivative_position_commutator_apply

end
end FCP.BFSSSU2PhysicalDomainS3L3A

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS3L3ASourcePositionDerivativeCommutatorProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
