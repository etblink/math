import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB1OriginalFockComplexifiedGammaPhysicalStar
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P2bB2aOriginalFockScalarProductPhysicalStar

/-!
# BFSS P2b-B2 — global original Fock-operator physical Hilbert-star compatibility

On the ACTUAL original 24-complex-mode Fermion 2 Fock operator algebra
Fermion 2 →L[ℂ] Fermion 2, show the accepted source Spin(9) AlgEquiv
commutes with its physical Hilbert adjoint on EVERY operator.

Four CliffordAlgebra.induction cases are discharged using the exact,
independently strict-qualified interfaces:
 * B2a — scalar algebraMap ℂ physical-star compatibility;
 * B1  — complete complexified original 48-source Clifford generator;
 * B2a — conditional physical-adjoint compatibility of products;
 * B0  — conditional physical-adjoint compatibility of sums.

The M3I original complex Clifford-to-original Fock AlgEquiv, already
accepted, transfers the complete Clifford induction to ALL original
continuous Fock endomorphisms by its actual surjectivity.

No odd-generator Clifford involution is substituted for the physical
Hilbert adjoint. No new Fock module, relaxed axiom or proof budget,
vector-unitary implementation, continuity, gauge-fixed projection,
unbounded Hamiltonian-domain or BFSS spectral theorem is claimed.
-/

set_option autoImplicit false

namespace FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSPairedSpin9Clifford
open FCP.BFSSOP3C6AOriginalFockOperatorSpinAction

private abbrev OriginalFockOp :=
  Fermion 2 →L[ℂ] Fermion 2

private abbrev OriginalComplexClifford :=
  CliffordAlgebra (source48Quadratic.baseChange ℂ)

/-- Four-case source Clifford induction shows that the actual
original Spin(9) operator AlgEquiv commutes with the *physical Fock*
Hilbert adjoint on the M3I image of each complex Clifford element. -/
theorem source9Spin_originalFockOperator_clifford_map_star
    (g : spinGroup source9Quadratic) (x : OriginalComplexClifford) :
    source9Spin_originalFockOperatorAutomorphismHom g
        (star (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv x)) =
      star (source9Spin_originalFockOperatorAutomorphismHom g
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv x)) := by
  induction x using CliffordAlgebra.induction with
  | algebraMap z =>
      rw [(FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).commutes z]
      exact
        FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar.source9Spin_originalFockOperator_algebraMap_map_star
          g z
  | ι w =>
      exact
        FCP.BFSSP2bB1OriginalFockComplexifiedGammaPhysicalStar.source9Spin_originalFockOperator_complexifiedGamma_map_star
          g w
  | mul a b ha hb =>
      have hCliffordMul :
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv (a * b) =
            FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a *
              FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv b :=
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).map_mul a b
      rw [hCliffordMul]
      exact
        FCP.BFSSP2bB2aOriginalFockScalarProductPhysicalStar.source9Spin_originalFockOperator_mul_map_star
          g
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a)
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv b)
          ha hb
  | add a b ha hb =>
      have hCliffordAdd :
          FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv (a + b) =
            FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a +
              FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv b :=
        (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).toLinearEquiv.map_add
          a b
      rw [hCliffordAdd]
      exact
        FCP.BFSSP2bB0OriginalFockAdjointAdditiveBridge.originalFock_spinStarCompat_add
          g
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv a)
          (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv b)
          ha hb

/-- GLOBAL source-exact physical Hilbert-star theorem for every
original 24-mode Fermion 2 complex-linear continuous operator.
This is not a theorem about the source Clifford's odd star; it is a
theorem about the actual operator-adjoint on the genuine Fock space. -/
theorem source9Spin_originalFockOperator_global_map_star
    (g : spinGroup source9Quadratic) (T : OriginalFockOp) :
    source9Spin_originalFockOperatorAutomorphismHom g (star T) =
      star (source9Spin_originalFockOperatorAutomorphismHom g T) := by
  obtain ⟨x, rfl⟩ :=
    (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv).surjective T
  exact source9Spin_originalFockOperator_clifford_map_star g x

#print axioms source9Spin_originalFockOperator_clifford_map_star
#print axioms source9Spin_originalFockOperator_global_map_star

end
end FCP.BFSSP2bB2OriginalFockGlobalPhysicalStar
