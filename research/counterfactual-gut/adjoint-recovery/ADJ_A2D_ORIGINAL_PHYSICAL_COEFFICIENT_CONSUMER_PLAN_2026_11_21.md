# ADJ-A2d — independent original physical coefficient and paired SU(2) consumer

**Date:** 2026-11-21 (America/Los_Angeles). **Status:** design and implementation candidate. This file does NOT confer Lean qualification.

## Inputs that are already qualified

- **D1S3**: exact original `fermionCoefficient x` real skewness and literal paired SU(2) coefficient skewness. Original strict source [run #44976962312](https://github.com/etblink/math/actions/runs/44976962312), source blob `f35d70284bec100dc617935cf41a6c933c618e5b`.
- **ADJ-A2c R2**: generic exact original finite-Fock quantizer self-adjoint for real skew `K`. [Run #44985982244](https://github.com/etblink/math/actions/runs/44985982244), tested `5ea5837c028b473b39a855b1bb49d1b7acccccfb`, source blob `94893b6b4f623dfd92122947a4054c4b1a63a5ad`, artifact #14739886670 SHA-256 `d7842c84326439d97ffecbf7b1189a7aca04847cdf6f31c19124cbc1b81364f7`.
- Accepted A0/A1/A2a/A2b parent modules are imported only transitively and are pinned. The original D1S4 R1/R2 gates remain strict RED/FROZEN, and the A2c R1 strict linter RED remains preserved.
- Original actual paired source `FCP.BFSSSU2GaugeG1A.pairedAlgebraData : AlgebraData 2`, file `SU2BFSSG1APairedThetaProbe.lean` blob `152204ef15a6569534e0503824a697cb9ae8e4ce`, reused only through the accepted D1S3 import.

## Exact consumer target

Create `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSAdjointA2dPhysicalCoefficientQuantizerConsumer.lean` with **only two direct imports**:

```lean
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSAdjointA2cOriginalFrequencyQuantizerSelfAdjoint
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S3OriginalFermionCoefficientSkewProbe
```

Prove exactly two named independent-source consumer roots, with direct named theorem application and no matrix-entry rewriting:

1. `FCP.BFSSAdjointA2d.originalFermionCoefficient_quantize_isSelfAdjoint`: for any original `M : AlgebraData N`, `x : Boson N`, the **bounded finite-Fock** `M.quantizeFrequency (M.fermionCoefficient x)` is self-adjoint. Apply accepted A2c to the real source `K=M.fermionCoefficient x` and D1S3 generic source skewness.
2. `FCP.BFSSAdjointA2d.pairedOriginalFermionCoefficient_quantize_isSelfAdjoint`: for original literal `FCP.BFSSSU2GaugeG1A.pairedAlgebraData : AlgebraData 2`, `x : Boson 2`, the same exact source quantizer is self-adjoint. Apply A2c with D1S3's **paired** coefficient skewness directly; no substitute CAR or convenient Fock model.

Use `#print axioms` on these **two exact roots**. They must each report only `propext`, `Classical.choice`, `Quot.sound` and compile with Lean 4.34.1, pinned Mathlib and strict warning-as-error.

## Dedicated independent-source consumer workflow

One new path-scoped strict workflow, distinct from ADJ-A2c, with exact tested SHA and pins for original BFSS Core/FermionFrequency/FermionQuantization/FrequencyContraction, A0/A1/A2a/A2b/A2c, D1S3 source, and literal paired source SU2BFSSG1A, plus Lean/Mathlib pins. Native cold original-source consumer build, warning-as-error strict recompile, exactly two axiom roots, no `sorryAx` or unsafe axioms, required `BFSS_ADJ_A2D_ORIGINAL_CONSUMER_STRICT_GREEN` sentinel. Original preflight/native/strict/environment/tested-SHA/cache logs archived unconditionally; independently verify original artifact SHA-256 and run job outcome. Preserve first-error diagnostics on RED, one evidence-driven local repair max, two-RED STOP. No D1S4 retry, original BFSS changes, linter weakening or resource ceilings.

## Scope and physical boundary

If both consumer roots qualify, they establish **exact original source finite-dimensional fermionic quantizer Hermiticity for any bosonic configuration x**, including literal paired SU(2) AlgebraData. This is a meaningful rigorous algebraic property of the original BFSS fermion term at fixed bosonic x, **not** a theorem that the full boson-dependent fermionic multiplication operator has been closed on its full Hilbert-space domain, or that the bosonic kinetic term plus full Hamiltonian is self-adjoint. It does not prove gauge-invariant Gauss law, the original BFSS ground state, spectral discreteness, mass gap, physical Hopfion, Standard Model or GUT. The source restriction identity `deformedFermionField_quantized` already exists in original source but is not part of this consumer and would need a separate independently qualified domain/comparison gate before claims about the real-form physical fermion field.


## Exact original source implementation and R1 strict launch

New independent consumer source commit [`7a06194a91327e82b018f7ba969a0e11b9e4f000`](https://github.com/etblink/math/commit/7a06194a91327e82b018f7ba969a0e11b9e4f000) contains exactly two target consumer theorems and `#print axioms` reports, only two accepted A2c and D1S3 direct imports, no new axioms, sources, coercions or original frozen D1S4 references. Dedicated pinned and warning-as-error workflow committed at tested SHA `dd1c28bde99144017e72aa334370e875a74ba7cc`. Original [strict R1 #44986683677](https://github.com/etblink/math/actions/runs/44986683677) **PENDING at launch**; the job checks two precise source/consumer axiom roots, frozen original source and accepted parent blob hashes, exact Lean/Mathlib, and preserves unconditional source/preflight/native/strict/manifest/tested SHA evidence. No mathematically valid theorem is accepted until original strict GREEN and artifact verification.
