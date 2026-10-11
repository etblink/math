import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2FermionF3B2BasisActionProbe

/-!
# BFSS fermions F3-B3 — actual occupation-mode projector algebra

On the exact pinned Fock-transported BFSS Hilbert space, transfer the
upstream finite-fermion number-operator idempotence and pairwise
commutation results to the same `occupiedMode` family whose basis
action passed Gate #62.

This is a bounded formal target. Finite occupation-label selector
products, coordinate isolation and theta_irreducible remain unproved.
-/

namespace FCP.BFSSFermionF3B3
noncomputable section

open FCP.BFSSFermionF1 FCP.BFSSFermionF2
open FCP.BFSSFermionF3B1 FCP.BFSSFermionF3B2
open OAI.Laughlin.Fock OAI.ContinuumCoulomb.HubbardGlobal

/-- The exact occupied-mode operator is idempotent, transported from
the finite exterior Fock number operator. -/
theorem occupiedMode_idempotent (i : Fin 24) :
    occupiedMode i * occupiedMode i = occupiedMode i := by
  have hFock :
      fockOperator (number i) * fockOperator (number i) =
        fockOperator (number i) := by
    have h := congrArg
      (fun T : Module.End ℂ (Space 23) => fockOperator T)
      (number_idempotent i)
    simpa only [fockOperator_mul, ContinuousLinearMap.mul_def] using h
  have hBFSS := congrArg
    (fun T : FockCoordinateSpace 23 →L[ℂ] FockCoordinateSpace 23 => onBFSS T)
    hFock
  rw [occupiedMode_as_fockNumber]
  simpa only [onBFSS, map_mul] using hBFSS

/-- Number operators for any two transported modes commute as actual
continuous operators on the pinned BFSS Fermion 2 space. -/
theorem occupiedMode_mul_comm (i j : Fin 24) :
    occupiedMode i * occupiedMode j =
      occupiedMode j * occupiedMode i := by
  have hnumber : number i * number j = number j * number i :=
    number_commute i j
  have hFock :
      fockOperator (number i) * fockOperator (number j) =
        fockOperator (number j) * fockOperator (number i) := by
    have h := congrArg
      (fun T : Module.End ℂ (Space 23) => fockOperator T)
      hnumber
    simpa only [fockOperator_mul, ContinuousLinearMap.mul_def] using h
  have hBFSS := congrArg
    (fun T : FockCoordinateSpace 23 →L[ℂ] FockCoordinateSpace 23 => onBFSS T)
    hFock
  rw [occupiedMode_as_fockNumber i, occupiedMode_as_fockNumber j]
  simpa only [onBFSS, map_mul] using hBFSS

#print axioms occupiedMode_idempotent
#print axioms occupiedMode_mul_comm

end
end FCP.BFSSFermionF3B3

/-!
Independent BFSS SU(2) formalization contribution by Evan T. Kotler (2026).
Research DOI: https://doi.org/10.5281/zenodo.23291242
FCP source: b60baa806dab3f0b296229a78f70e07b787544ab, experiments/openai-math-su2-concrete-potential/SU2FermionF3B3ProjectorProbe.lean
Copyright (c) 2026 Evan T. Kotler. SPDX-License-Identifier: Apache-2.0.
Build status: integrated candidate; upstream port NOT YET independently verified.
OpenAI retains credit for the original BFSS definitions on which this work builds.
-/
