import OAI.MathematicalPhysics.BFSS.Core
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.TDC1AR4FockOperatorEvaluationInterface

/-! Diagnostic only. This file does not qualify TD-C1A. -/
set_option autoImplicit false

namespace FCP.BFSSTDC1AD0
noncomputable section
open OAI.BFSSQuantum

#eval IO.println "D0_METADATA_NATIVE_STRUCTURES_BEGIN"
#synth NormedAddCommGroup (Fermion 2)
#synth Module ℂ (Fermion 2)
#synth NormedSpace ℂ (Fermion 2)
#eval IO.println "D0_METADATA_GENERIC_SIGNATURES_BEGIN"
#check @FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.operator_of_pointwise
#check @FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.pointwise_of_operator
#eval IO.println "D0_METADATA_NATIVE_SPECIALIZATION_BEGIN"
#check (FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.operator_of_pointwise (𝕜 := ℂ) (E := Fermion 2))
#check (FCP.BFSSTDC1AR4FockOperatorEvaluationInterface.pointwise_of_operator (𝕜 := ℂ) (E := Fermion 2))
#eval IO.println "D0_METADATA_COMPLETE"



end
end FCP.BFSSTDC1AD0
