# HARDY-G5 R4 RED — stop scalar-zero proof permutations

Date: 2026-11-14 Pacific. RED_UNQUALIFIED. Strict retries halted.

[Run #43651471352](https://github.com/etblink/math/actions/runs/43651471352), attempt1, tested `5d8e066d34e1c2f400c5affd05131fb17ea4a4d9`, job132620666588: completed/failure verified from API and job log.

## Verified result

151-path preflight PASS, manifest SHA-256 `3c70f4d01df2a808fcf08b13fc68273ff92cbc6ec9abfdeb14932d1a22affa18`. Pinned Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 restored. Isolated finite CLM helper PASS. Cold native build PASS (9073 jobs). All six fresh G5 source declarations have only propext/Classical.choice/Quot.sound. The native consumer direct source applications emit no error.

The two R4 additions `simp only [zero_smul ℂ, Finset.sum_const_zero]` fail at consumer58:2 and63:2 with exactly `simp made no progress`. This does not identify the precise scalar/action instance or prove a definitional mismatch. The existing displayed-zero goal needs a calibrated typed comparison; no third simp-list permutation is justified. Source CAR cancellation and R3 operator-to-vector helper remain successful observations, but the complete native consumer is unqualified.

| Binding | Value |
| --- | --- |
| Source | `9ada3167a5de3be647c51f0740b5998d4e6ea45a` |
| Helper | `0398bafa58b46dfbd83ec90a65be84adb03dedf8` |
| Strict consumer | `e5a7d974200a506750be3766754ecefd12633425` |
| Strict workflow | `8c9e1dc3a62c82cf6942a0a42ccab7dce5eecdc8` |
| Reviewed OAI baseline | f51357761243008201f97d9e0ef0cbefa87d0b06 |
| Artifact ID / bytes | 14136821694 / 18788 |
| Artifact digest | `sha256:6dee1ca1b03c0d9b3b66a7e968dfc4f09ef32a64436d5ae5cd11f85e66ebb84e` |

API digest matches upload log; ZIP bytes not independently rehashed. [First-causal diagnostic](diagnostics/P3_AUX_HARDY_G5_R4_ZERO_ACTION_43651471352_2026_11_14.txt).

## Stop rule and next experiment

The R4 prospective stop rule is activated. Freeze strict source/helper/consumer/workflow. Preregister D0 calibrated generic, actual-carrier and original-data zero-action controls, bounded expression observations and separate canonical-witness join cases. Reuse the successfully calibrated D2R2 inspector; raw expression inequality alone does not prove definitional incompatibility. A green diagnostic collector cannot qualify G5.

G4 #43642981119 remains accepted predecessor. No literal Core charge equality, full smooth-core identity, physical Spin9/Hardy/fidelity/zero mode/gap accepted.
