import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe

/-!
Independent consumer for the ported original BFSS M3H/M3I source algebra path.

This file deliberately reuses the exported original source action and its
actual 24-mode Fock operator carrier. It neither assumes nor constructs an
independent manuscript module, a spatial Spin(9) representation, or a
spectral theorem.
-/

set_option autoImplicit false

namespace BFSSUnifiedM3IndependentAudit
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0
open FCP.BFSSS1V52M2
open FCP.BFSSS1V52M3H
open FCP.BFSSS1V52M3I

private abbrev A := CliffordAlgebra (source48Quadratic.baseChange ℂ)
private abbrev FockOp := Fermion 2 →L[ℂ] Fermion 2

example :
    Function.Injective
      (originalComplexCliffordFockAlgHom : A →ₐ[ℂ] FockOp) :=
  originalComplexCliffordFock_injective

example (a : A) :
    originalComplexCliffordFockAlgEquiv a =
      originalComplexCliffordFockAlgHom a :=
  originalComplexCliffordFockAlgEquiv_apply a

example (b : FockOp) :
    ∃ a : A, originalComplexCliffordFockAlgEquiv a = b :=
  originalComplexCliffordFockAlgEquiv.surjective b

#print axioms FCP.BFSSS1V52M3H.originalComplexCliffordFock_injective
#print axioms FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
#print axioms FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv_apply

end
end BFSSUnifiedM3IndependentAudit
