# P3-AUX-RAD-C4B R1 — strict GREEN normalized weighted operator and full weak form

**Date:** 2026-11-14 Pacific. **Verdict:** LEAN_QUALIFIED / exact original SU2 physical Hilbert source.
[Strict #43587088274](https://github.com/etblink/math/actions/runs/43587088274), attempt 1, completed success at exact tested `08afa5c57b1f90daa621b938e778bb2ffb7770a2`, job `132423815039`.

## Exact independent verification

- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.lean`, blob `0fe927b9709bd0e359aafb691aca086c6e4a5c46`.
- Independent original paired SU2 consumer `lean/diagnostics/BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquareIndependentConsumer.lean`, blob `f31c84b53f812efd41906e524604e49c1a4ab12b`.
- Workflow `.github/workflows/bfss-p3-aux-rad-c4b-original-weighted-normalized-adjoint-square-strict.yml`, blob `a3b59a8d21bae2f4f0be58a98a4e27ddf1b0c594`.
- Exact reviewed-source preflight **214** transitive OAI candidate/donor pins; manifest SHA256 `29b613e9c57836a558771b26ffd768461f1ea44854a944d703e7f6b1c18b1126`; reviewed baseline `3ade52a124e51356000246b0f5689dfd4829ff25`. Critical Core/G4J/BB/BE/C4A/C3DC/C3/AY source hashes unchanged.
- Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; cold source build, fresh warning-as-error source and independent actual pairedAlgebraData/pairedGaugeData consumer PASS.
- Seven source reports plus thirteen consumer reports (seven new, four BE generic, accepted C4A self-adjointness and C3DC density) verified in exact order; all use only `[propext, Classical.choice, Quot.sound]`. No accepted-source/consumer sorryAx or forbidden warnings. Final marker `BFSS_P3_AUX_RAD_C4B_ORIGINAL_WEIGHTED_NORMALIZED_ADJOINT_SQUARE_STRICT_GREEN`.
- [Evidence artifact #14111595875](https://github.com/etblink/math/actions/runs/43587088274/artifacts/14111595875), 26,832 bytes, published digest `sha256:ba600ba868210644c26b29d4df8f501f61b0299b10da5628d0c785dadfe0df18` matches job log and GitHub metadata; ZIP not independently rehashed. The separate administrative run #43587088273 had previously passed.

## Accepted original-source statements

For every literal `M:AlgebraData 2`, `G:M.GaugeData`, `ε>0`, retain E=G.physicalSpace and actual native sixteen-FullL2 weighted charge Sε. The exact normalized partial operator is Hε=(1/16)Aε, Aε=Sε†Sε.

- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_eq`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_domain`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_apply`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_selfAdjoint`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_closed`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_domain_dense`
- `FCP.BFSSP3AuxRADC4BOriginalWeightedNormalizedAdjointSquare.originalWeightedPhysicalNormalizedAdjointSquare_weakForm_iff`

These establish the literal definition, unchanged full natural domain, exact action, self-adjointness, closedness, dense operator domain, and the representing-vector iff testing **every** vector v in D(Sε):
```text
∀v∈D(Sε), ⟨w,v⟩=(1/16)⟨Sεu,Sεv⟩
  iff u∈D(Hε) and w=Hεu.
```
This is not only a smooth-core identity, nor a replacement of the original unweighted H=(1/16)T†T.

## Boundaries, retained evidence and next mathematical obligation

No kernel equality, zero-mode existence/uniqueness, nonzero kernel, normalized energy root, graph-core density, maximal weighted domain, positive-regulator domain equivalence, ε=0 limit, paper-source/Spin9-singlet Hardy transfer, eigenpair or mass gap is promoted here.
C4A R2 #43585322863 and its retained R1 red, original M5BE0/BF0 Hamiltonian baseline and TD-C1A red remain unchanged. No accepted Lean bytes change in this acceptance commit.

**Next bounded source gate:** exact partial-map kernel equality `Hε.ker=H.ker`, through native graph zero pairs, source Sε/T kernels and the actual natural adjoint-square domains. [C4C pre-gate receipt](P3_AUX_RAD_C4C_R1_PRE_GATE_ORIGINAL_WEIGHTED_KERNEL_PRESERVATION_2026_11_14.md). Equality need not imply a nonzero kernel.
