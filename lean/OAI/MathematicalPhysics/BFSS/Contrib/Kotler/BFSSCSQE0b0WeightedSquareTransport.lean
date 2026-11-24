import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0aOriginalBasisSelector

/-! CSQ-E0b0: extract the three standard-only local declarations from E0b R2
for separate strict native and independent imported qualification. No basis
specialization, energy, closed-domain or spectral assertion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b0
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3
open FCP.BFSSCSQE0a

/-- Fix the original carrier before introducing large source expressions. -/
theorem fermionDifferenceToEquality (u v : Fermion 2) (h : u - v = 0) :
    u = v :=
  sub_eq_zero.mp h

/-- Convert the literal G0 difference before rewriting any operator. -/
theorem weightedSquarePoint (w z : SpinIndex → ℝ)
    (hn : spinorSquareNorm w = spinorSquareNorm z)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x =
      ((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x := by
  exact fermionDifferenceToEquality
    (((sourceAllSpinorCharge pairedAlgebraData w *
        sourceAllSpinorCharge pairedAlgebraData w) f.val) x)
    (((sourceAllSpinorCharge pairedAlgebraData z *
        sourceAllSpinorCharge pairedAlgebraData z) f.val) x)
    (FCP.BFSSCSQG0Literal.physicalSquareDifference w z hn f x)

/-- Transport square evaluation across named operator equalities before
introducing concrete paired charge expressions. -/
theorem squarePointTransport (A B C D : SourceEnd 2)
    (f : SmoothCore 2) (x : Boson 2) (ha : A = C) (hb : B = D)
    (h : ((A * A) f) x = ((B * B) f) x) :
    ((C * C) f) x = ((D * D) f) x := by
  calc
    ((C * C) f) x = ((A * A) f) x :=
      congrArg (fun T : SourceEnd 2 => ((T * T) f) x) ha.symm
    _ = ((B * B) f) x := h
    _ = ((D * D) f) x :=
      congrArg (fun T : SourceEnd 2 => ((T * T) f) x) hb

#print axioms fermionDifferenceToEquality
#print axioms weightedSquarePoint
#print axioms squarePointTransport
end
end FCP.BFSSCSQE0b0
