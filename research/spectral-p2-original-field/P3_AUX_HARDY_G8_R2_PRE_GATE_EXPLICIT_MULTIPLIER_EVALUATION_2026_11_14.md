# HARDY-G8 R2 — prospective explicit multiplier evaluation

Status: REGISTERED_NOT_EXECUTED / candidate not staged. Contract committed before proof repair. Prior [R1 red](P3_AUX_HARDY_G8_R1_RED_43673139716_MULTIPLIER_EVALUATION_2026_11_14.md) binds the exact160-pin failure and independently rehashed artifact.

## One-variable repair

In originalHardyTauCore_coordinateDerivative_apply, the existing simp-only list has fermionAction_apply, map_smul. Insert exactly AlgebraData.smoothMultiplier_apply between those lemmas. The existing source theorem evaluates the RHS source smooth multiplier to its scalar action, allowing retained map_smul to act. Correction sums already match in R1's residual; do not add new mathematics or alter the statement.

Old source `27c6aee9bc83c6317b4d6e296a6428fa06473f58`. Freeze helper `b7d518b9f4a6ffb4acfaa4f265416a0b3aeccc68` and entire twelve-example consumer `0d3714894391fd6afa1bfb00b1df7238421ae7e7`. All six declarations/statements and all other proof bodies unchanged. Strict workflow is byte-identical except EXPECTED source blob. Keep original accepted source closure, source baseline b46d2246,1 generic/1 product helper,6 source/12 native reports,12 native controls, same toolchain/axioms/budgets.

## Acceptance and stop line

Full early helpers, cold build, fresh strict source and entire native consumer must pass with exactly audited roots and only propext/Classical.choice/Quot.sound. Static checks are not Lean. A persisting source residual requires exact-goal inspection; a native recursion invokes the registered typed-diagnostic stop. No limit increase, statement weakening, extra scalar assumptions, alternate Fock model or disabled warning.

Qualification concerns coordinate derivative/core tau only. Physical Spin9 and source supercharge energy/domain identities remain separate strategic blockers. Full CAR/charge identity, Hardy, fidelity, zero mode and gap stay unproved.
