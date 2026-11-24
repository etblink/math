import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQE0aOriginalBasisSelector

set_option autoImplicit false
set_option warningAsError true
namespace FCP.BFSSCSQE0aIndependent
noncomputable section
open scoped BigOperators
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G2
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Independent original real-spinor normalization. -/
theorem basisNormAudit (a : SpinIndex) :
    spinorSquareNorm (FCP.BFSSCSQE0a.basisSpinor a) = 1 :=
  FCP.BFSSCSQE0a.basisSpinor_norm a

/-- Generic finite coordinate selector with the original real-to-complex cast. -/
theorem selectorAudit {V : Type*} [AddCommGroup V] [Module ℂ V]
    (A : SpinIndex → V) (a : SpinIndex) :
    (∑ b : SpinIndex, (FCP.BFSSCSQE0a.basisSpinor a b : ℂ) • A b) = A a :=
  FCP.BFSSCSQE0a.basisWeightedSum A a

/-- Original paired weighted charge, not a surrogate operator. -/
theorem pairedChargeAudit (a : SpinIndex) :
    sourceAllSpinorCharge pairedAlgebraData (FCP.BFSSCSQE0a.basisSpinor a) =
      pairedAlgebraData.charge a :=
  FCP.BFSSCSQE0a.basisCharge pairedAlgebraData a

#print axioms basisNormAudit
#print axioms selectorAudit
#print axioms pairedChargeAudit
end
end FCP.BFSSCSQE0aIndependent
