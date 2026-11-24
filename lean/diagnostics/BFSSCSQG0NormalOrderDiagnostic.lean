import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6G6HOriginalOrderedMajoranaFierzAssemblyProbe

/-! CSQ-G0 D0: isolate the literal G4B normal-order specialization,
point evaluation, addition, and the G6H response bridge.
Do not import the failed G0 module or assert full physical square equality. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQG0NormalOrderDiagnostic
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6G1
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSSU2PhysicalDomainL6G4B
open FCP.BFSSSU2PhysicalDomainL6G6H

#check @sourceAllSpinorCharge_normalOrder_response

/-- A: consume the exact original operator equation at N=2. -/
theorem rawAtTwo (M : AlgebraData 2) (w : SpinIndex → ℝ) :
    sourceAllSpinorCharge M w * sourceAllSpinorCharge M w =
      (1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p) +
      (1 / 2 : ℂ) • (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
        (M.fermionAction p.1 p.2 * M.fermionAction q.1 q.2) *
          sourceAllSpinorCoefficientResponse M w p q) :=
  sourceAllSpinorCharge_normalOrder_response (N := 2) M w

/-- B: rewrite only the charge-square endomorphism, before splitting
the evaluated addition or introducing the named response. -/
theorem literalAtPoint (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceAllSpinorCharge M w * sourceAllSpinorCharge M w) f) x =
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p) +
        (1 / 2 : ℂ) • (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
          (M.fermionAction p.1 p.2 * M.fermionAction q.1 q.2) *
            sourceAllSpinorCoefficientResponse M w p q)) f) x := by
  rw [sourceAllSpinorCharge_normalOrder_response (N := 2) M w]

/-- Generic evaluated addition, with both operator arguments opaque. -/
theorem evaluateAdd (A B : SourceEnd 2) (f : SmoothCore 2) (x : Boson 2) :
    ((A + B) f) x = (A f) x + (B f) x := rfl

/-- C: test evaluated addition on the literal original G4B terms,
without the G6H named response. -/
theorem literalSplitAtPoint (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceAllSpinorCharge M w * sourceAllSpinorCharge M w) f) x =
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x +
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
        (M.fermionAction p.1 p.2 * M.fermionAction q.1 q.2) *
          sourceAllSpinorCoefficientResponse M w p q)) f) x := by
  rw [literalAtPoint M w f x, evaluateAdd]

/-- D: independently check the literal definition of the G6H ordered
response at the original smooth-core point. -/
theorem responseAtPoint (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceOriginalOrderedFermionicResponse M w) f) x =
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2, ∑ q : FermionLabel 2,
        (M.fermionAction p.1 p.2 * M.fermionAction q.1 q.2) *
          sourceAllSpinorCoefficientResponse M w p q)) f) x := by
  rw [sourceOriginalOrderedFermionicResponse]

/-- E: join only the one-spinor normal-order identity. -/
theorem namedSplitAtPoint (M : AlgebraData 2) (w : SpinIndex → ℝ)
    (f : SmoothCore 2) (x : Boson 2) :
    ((sourceAllSpinorCharge M w * sourceAllSpinorCharge M w) f) x =
      (((1 / 2 : ℂ) • (∑ p : FermionLabel 2,
        sourceAllSpinorCoefficient M w p * sourceAllSpinorCoefficient M w p)) f) x +
      ((sourceOriginalOrderedFermionicResponse M w) f) x := by
  rw [responseAtPoint M w f x]
  exact literalSplitAtPoint M w f x

#print axioms rawAtTwo
#print axioms literalAtPoint
#print axioms evaluateAdd
#print axioms literalSplitAtPoint
#print axioms responseAtPoint
#print axioms namedSplitAtPoint
end
end FCP.BFSSCSQG0NormalOrderDiagnostic
