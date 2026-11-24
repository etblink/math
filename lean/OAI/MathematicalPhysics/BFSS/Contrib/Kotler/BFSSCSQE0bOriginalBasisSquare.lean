import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0aOriginalBasisSelector

/-! CSQ-E0b: consume qualified E0a and G0, isolating the subtraction-to-equality
boundary on the original fermion carrier before basis specialization.
No energy, closed-domain or spectral assertion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQE0b
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

/-- Specialize the already established equality using qualified E0a. -/
theorem basisSquarePoint (a b : SpinIndex)
    (f : pairedGaugeData.invariantCore) (x : Boson 2) :
    ((pairedAlgebraData.charge a * pairedAlgebraData.charge a) f.val) x =
      ((pairedAlgebraData.charge b * pairedAlgebraData.charge b) f.val) x := by
  have hn : spinorSquareNorm (basisSpinor a) =
      spinorSquareNorm (basisSpinor b) := by rw [basisSpinor_norm, basisSpinor_norm]
  exact squarePointTransport
    (sourceAllSpinorCharge pairedAlgebraData (basisSpinor a))
    (sourceAllSpinorCharge pairedAlgebraData (basisSpinor b))
    (pairedAlgebraData.charge a) (pairedAlgebraData.charge b)
    f.val x (basisCharge pairedAlgebraData a) (basisCharge pairedAlgebraData b)
    (weightedSquarePoint (basisSpinor a) (basisSpinor b) hn f x)

/-- Recover equality of original smooth-core vectors from pointwise equality. -/
theorem basisSquareCore (a b : SpinIndex) (f : pairedGaugeData.invariantCore) :
    pairedAlgebraData.charge a (pairedAlgebraData.charge a f.val) =
      pairedAlgebraData.charge b (pairedAlgebraData.charge b f.val) := by
  apply DFunLike.ext
  intro x
  exact basisSquarePoint a b f x

#print axioms fermionDifferenceToEquality
#print axioms weightedSquarePoint
#print axioms squarePointTransport
#print axioms basisSquarePoint
#print axioms basisSquareCore
end
end FCP.BFSSCSQE0b
