import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM0BOriginalMasslessFockPointwiseGaugeCovariance

/-!
GM0B independent exact original paired source-Fock consumer.
No imported massive-field substitute, unbounded Lp domain, or Hopfion.
-/
set_option autoImplicit false

namespace FCP.BFSSGM0BIndependent
open OAI.BFSSQuantum

theorem pairedSourceMasslessFockPointwiseGaugeCovariant
    (g : GaugeGroup 2) (x : Boson 2) (v : Fermion 2) :
    FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g
      (FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
        (FCP.BFSSMasslessM1a.masslessSourceFrequency
          FCP.BFSSSU2GaugeG1A.pairedAlgebraData x) v) =
    FCP.BFSSSU2GaugeG1A.pairedAlgebraData.quantizeFrequency
      (FCP.BFSSMasslessM1a.masslessSourceFrequency
        FCP.BFSSSU2GaugeG1A.pairedAlgebraData
        (FCP.BFSSSU2GaugeG4J.pairedGaugeData.boson g x))
      (FCP.BFSSSU2GaugeG4J.pairedGaugeData.fermion g v) :=
  FCP.BFSSGM0B.pairedOriginalMasslessQuantizer_gauge_covariant g x v

#print axioms pairedSourceMasslessFockPointwiseGaugeCovariant

end FCP.BFSSGM0BIndependent
