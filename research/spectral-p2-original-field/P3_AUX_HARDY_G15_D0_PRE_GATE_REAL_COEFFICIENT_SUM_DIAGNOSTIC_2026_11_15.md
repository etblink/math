# G15 D0 — preregister isolated real-coefficient sum diagnostic

REGISTERED_NOT_EXECUTED; commit before code. Full G15 is BLOCKED after R1/R2 source failures. Accepted donor baseline G14 #43749092953, exact `3e2cc5da7a2e0965f158c0683acc774bcf1a81b8`.

## Question and falsifier

Can explicit ordered scalar-sum and sum-permutation proofs qualify outside BFSS, then lift to the literal original Clifford/tau family without the failed concrete simp_rw normalizer? Failure in the Mathlib-only phase falsifies that candidate proof before any native build. Generic success followed by source failure localizes the adapter boundary; success of both permits a separately preregistered later full repair, not automatic G15 acceptance.

## Two layers

Mathlib-only P3AuxHardyG15RealCoefficientSumDiagnostic.lean, namespace FCP.BFSSP3AuxHardyG15RealCoefficientSumDiagnostic, two roots:

1. realCoefficient_sum_smul: for arbitrary finite I, complex module V, a:I->Real and v:V, sum_i ((a_i:Complex) smul v) = ((sum_i a_i:Real):Complex) smul v.
2. realCoefficient_doubleSum: for arbitrary finite I,J and a:I->J->Real, T:J->V, interchange the two finite sums, then consume root1 for each J coordinate.

Use explicit calc/rw for sum_smul and Complex.ofReal_sum, one step per equality. Do not repeat the failed simp_rw list on source matrices. No OAI/BFSS import, no resource overrides or new axioms.

Native BFSSP3AuxHardyG15RealCoefficientSumNativeDiagnostic.lean imports accepted G14, original G4J and the generic diagnostic. Two roots:

1. originalCliffordLinear_fourSum: unfold only original cliffordLinear on a neutral table b:Fin4->FermionIndex2->Real, then apply the qualified double-sum helper.
2. originalTau_fourSum: apply root1 to the literal originalHardyY coefficient table, matching the frozen G15 source statement, with original real/complex/coefficient order unchanged.

Three literal paired examples: neutral coefficient table; actual original tau at variable configuration; actual original tau at typed origin (generalize zero first). Print the two native plus two generic axiom roots. No main G15 import, source target or consumer. No norm or physical result is promoted by this interface diagnostic.

## Gate and evidence

Expected169-pin diagnostic closure replaces G14 consumer with generic/native diagnostics; it excludes full G15 source/consumer. Independently pin all existing OAI bytes to G14. Independently hash/freeze all three main G15 source/consumer/workflow bytes stated in the red review. Main checkpoint stays BLOCKED throughout diagnostic CI.

Run and audit generic2 strictly before native build. Only on generic success cold-build accepted G14/G4J plus helper, then strict native4 reports/three examples. Remove OAI objects before the native build and assert the main G15 object is absent before/after. Preserve full logs, pin manifest, exact tested SHA and a diagnostic-only completion marker.

Preserve Lean4.34.1/Mathlib pins; autoImplicit=false, warnings-as-errors, standard axioms, overall120/cold3600/compiler500 and existing helper limits. No additional full G15 trial. Static checks: imports/roots/examples/pins/frozen-main exclusions/YAML/bash/Python; positive and negative strict auditor fixtures; guarded checkpoint. Local Lean unavailable, so static checks are not qualification.

On diagnostic red preserve the exact failing phase and change only a separately preregistered diagnostic proof/adapter after inspection. On diagnostic green accept only these finite/source interfaces, then preregister full G15 R3 before modifying the frozen source. Numerical tau estimate, physical symmetry/energy domains, Hardy and fidelity remain separate.
