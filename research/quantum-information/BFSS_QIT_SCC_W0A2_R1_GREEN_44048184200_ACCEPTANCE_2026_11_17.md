# BFSS × QIT × SCC W0A2 R1 — STRICT GREEN ACCEPTANCE

Date: 2026-11-17 Pacific. **STRICT GREEN / QUALIFIED FOR W0A2 ONLY.** Unified branch `integration/bfss-unified-research-20261108`; `main` untouched.

## Exact mathematical theorem and qualified source

Original strict [run #44048184200](https://github.com/etblink/math/actions/runs/44048184200), job `133919001260`, SUCCESS at tested SHA `58219d2de55b7bba212effe50deec3d27eb361ac`.

The accepted original `M3I` complex Clifford/Fock equivalence maps each real-source embedded Clifford generator to the **actual active original 24-mode Fock** gamma operator:

```lean
theorem originalComplexEquiv_realGenerator_eq_activeGamma
    (v : Source48Vector) :
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
        (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ)
          (1 ⊗ₜ[ℝ] v)) =
      sourceGammaRealLinear v
```

This is a two-donor `calc` proof: strict qualified OP3-A2 `originalComplexEquiv_generator_eq_donor`, followed by strict qualified W0A1 `originalFockGammaRealLinear_eq_sourceGammaRealLinear`. No surrogate representation and no `K(A)` expansion.

- Exact source Git blob `d444e0c08b4a3ae63653c9807c39c140940a67be`, independently importing consumer `b9d9dee2bb6f72d959f9602a8b09154fb439879e`, strict workflow `9485e28f14d6b7e802d1f2d5539356399075401c`.
- Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; original cold build **9,126 jobs PASS**.
- Exact donor preflight PASS, one public source root and one separately imported consumer root, two consumer controls PASS.
- Source and consumer `#print axioms` depend only on `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`. Six negative auditor tests PASS.

## Original byte-exact evidence independently retained

Provider-original [artifact #14313710380](https://github.com/etblink/math/actions/runs/44048184200/artifacts/14313710380) ZIP has **13,853 bytes**, SHA-256 `543977c735a7f5fa11b852b23ef40e6f43d6b9850de4ed925f241b9e120904a6`. Its ZIP CRC and six member digests were checked independently. The separate [preservation run #44050703909](https://github.com/etblink/math/actions/runs/44050703909) returned GREEN after independently refetching and auditing original provider metadata, all source/consumer roots and the exact ZIP, then committed *only* original archive bytes on the unified branch.

Byte-identical provider ZIP Git blob `57e4229d1e9ba35f919fcbcae9e78bf47ac25ba1` at `research/quantum-information/diagnostics/BFSS_M4_W0A2_R1_44048184200_evidence.zip`. Complete original CI job log Git blob `f1bd0a14b939435ae67a7266c32ad82d0617c3df` at `research/quantum-information/diagnostics/BFSS_W0A2_R1_44048184200_complete_job.log`. Machine-readable exact six-member hashes and source/consumer evidence at `research/quantum-information/diagnostics/BFSS_W0A2_R1_44048184200_evidence_manifest.json`.

## Qualification boundary and predecessor preservation

Last accepted predecessor W0A1 [#44043503665](https://github.com/etblink/math/actions/runs/44043503665) remains an independent qualified ancestor with original provider green archive `ee39bccb7f61c497926bdb7eac9527cc53384d74`. W0A0 R1 source elaboration RED and R2 qualified GREEN original ZIPs remain byte-preserved as separate history. The CT1/QTC1 stopped native source specialization REDs are untouched.

**Not established:** source theorem for arbitrary *complexified* vectors in `ℂ ⊗[ℝ] Source48Vector`, full image generation by all normalized gammas, scalar commutant on active operator type, trace scalar elimination, complete structural witness injectivity, source `K(A)` Lie homomorphism, Spin(9) implementer or any physical BFSS ground-state statement.

Next **W0A3** is prospective only: scalar transport `ι(z ⊗ₜ v)` under the true original source Clifford/Fock equivalence; complex tensor induction, Schur and trace remain separate later gates. Stop on two analogous native source failures; do not inflate Lean resource limits to disguise an architecture mismatch.
