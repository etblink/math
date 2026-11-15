# HARDY-G8 R2 — original tau derivative accepted

Date: November 14, 2026 Pacific. Verdict: GREEN_QUALIFIED within the scope below.

[Strict run #43674445069](https://github.com/etblink/math/actions/runs/43674445069), attempt 1, tested `19a441adc0bc2408e639a1dca2ec0e67e31e6f57`, job `132691392211`, completed successfully. The original accepted G7 and physical Hamiltonian sources remain unchanged.

## Exact independently reviewed evidence

- 160 recursive original-source pins; manifest SHA256 `06a3822136ea677928f38230b4b6840447a0e09b9c06230a6acde22f9dc1d2a5`.
- Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Early generic finite-operator helper: one fresh audited root. Original derivative-product-rule helper: one fresh audited root. Cold native build: 9082 jobs. Fresh source: six exact reports. Native independent consumer: twelve exact reports and all twelve examples pass.
- Audited roots contain only `propext`, `Classical.choice`, `Quot.sound`. Logs contain no compiler errors, sorryAx or recursion failure; strict warning checks pass.
- Source blob `138ab7f545bf00812a55d1cb035251a9eccb6c27`; consumer `0d3714894391fd6afa1bfb00b1df7238421ae7e7`; product helper `b7d518b9f4a6ffb4acfaa4f265416a0b3aeccc68`; strict workflow `73a08204ca5a38089f1e69fa6dcb72dd1b1a006c`.
- Provider artifact `14146161190`, 21940 bytes, independently rehashed SHA256 `62414b5ff808ab2afe72e0243150379708f1bbd8d7891d53ab43cb2663a49160`. The [complete evidence ZIP](diagnostics/P3_AUX_HARDY_G8_R2_43674445069_evidence.zip) preserves all fourteen files: exact tested SHA, manifest, preflight, helper/build/source/consumer logs and scope receipts.

## Qualified declarations and meaning

The six roots in `FCP.BFSSP3AuxHardyG8OriginalTauDerivative` are:

- `originalHardyTauCoefficientDerivative`
- `originalHardyTauDerivative`
- `originalHardyTauDerivative_apply`
- `originalHardyTauCore_coordinateDerivative_apply`
- `originalHardyTauCore_derivative_commutator_apply`
- `originalHardyTauCore_derivative_commutator_zero_at`

The literal original scalar-entry derivative defines a finite Fock multiplier. On actual `SmoothCore 2`, differentiation of tau equals tau acting on the differentiated state plus this coefficient-derivative multiplier acting on the state value. The derivative commutator therefore depends only on that value and vanishes wherever the value is zero. The twelve native controls instantiate original paired data and original Boson/Fermion/FullL2 carriers, including diagonal-plane labels without adding a vanishing assumption.

## Preserved red and repair

[R1 #43673139716](P3_AUX_HARDY_G8_R1_RED_43673139716_MULTIPLIER_EVALUATION_2026_11_14.md) remains RED. Its first-causal source residual retained an unevaluated RHS smooth multiplier; `map_smul` could not act. The [R2 contract](P3_AUX_HARDY_G8_R2_PRE_GATE_EXPLICIT_MULTIPLIER_EVALUATION_2026_11_14.md), committed before repair at `bf157953c2b41900fdc4308f9950e2c41b4c9cc7`, added only the existing `AlgebraData.smoothMultiplier_apply` lemma in that simp list. Statements, other proofs, helper, complete consumer, resource limits and source model stayed fixed. Strict success supports this specific evaluation repair.

## Next bounded obligation and claim ceiling

First bind G8's complex scalar-entry fderiv to G3's accepted original real Y derivative coefficients. The scope receipt explicitly says that binding and the finite kinetic CAR contraction are still unproved. Review and preregister that small adapter before kinetic/tau assembly. Then target the original on-core charge/tau rotation identity and tau norm.

Highest forward-research priority is the physical Spin9 action and reducing sector, singlet-to-spinor charge covariance, and exact original supercharge energy/domain identity. These are substantive assumptions of the fixed-positive-regulator fidelity endpoint, alongside the sector-specific Hardy estimate, native domain extension and a normalized physical singlet with rigorously bounded weighted energy.

G8 does not prove the full charge/tau identity, a bounded L2 tau extension, tau norm, physical Spin9 covariance, Hardy/fidelity, a zero mode or a spectral gap. No new original Fock model, Clifford algebra or Hamiltonian is introduced. The roadmap/checkpoint refresh is administrative and strategic; it is not additional Lean qualification.
