# BFSS M4-CS0 R2 — actual source Spin(9) central sign on original active Fock Majoranas

**Date:** 2026-11-15 Pacific / CI finished 2026-11-16 UTC.  
**Canonical active branch:** `integration/bfss-unified-research-20261108`; no side branch or modification to `main`.  
**Decision:** **GREEN / QUALIFIED original source negative-central Fock OPERATOR gamma covariance**, NOT physical Fock-VECTOR unitary, original fermion parity identity, or source full BFSS charge domain covariance.

## Immutable exact gate

- [Strict CS0 R2 #43806215702](https://github.com/etblink/math/actions/runs/43806215702), completed **SUCCESS**, attempt 1, exact tested commit `71b9fdd27500c75a4154c7032c4a8f73b1de1163`, job `133097490324`.
- Exact donor/source/consumer/toolchain SHA preflight `BFSS_M4_CS0_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`; frozen Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold source `Build completed successfully (9175 jobs)`; freshly built actual CS0 with original F10U import chain and checked its source `.olean`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CS0OriginalSpin9CentralGammaSign.lean`, exact Git blob `6b7e627d902f7f9c291cc54b1f3aa1e4dfd5bc1d`; independent consumer `lean/diagnostics/BFSSP3M4CS0OriginalSpin9CentralGammaSignIndependentConsumer.lean`, exact Git blob `4daeae400a9f3105a2732450e10b1557bbe821cd`. Both source and consumer are **byte-identical to R1**; R2 modifies only CI.
- Workflow `.github/workflows/bfss-m4-cs0-original-spin9-central-gamma-strict.yml`, blob `cf2ea64a1c4b14a1f01bbd4f8488612a854c5808`; `mod`/`obj` point to actual `P3M4CS0OriginalSpin9CentralGammaSign` rather than unrelated HS0.
- **4 original native source and 3 independent consumer declarations**, **7/7 exact `#print axioms` reports**, only `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx`, no native errors. The workflow's inherited marker `BFSS_M4_CS0_ORIGINAL_FOCK_HS_ISOMETRY_4_SOURCE_3_CONSUMERS_STRICT_GREEN` contains a historical cosmetic `HS_ISOMETRY` label, but the audited source and consumer are unambiguously the central-gamma sign module. The marker's label is not a mathematical claim about CS0.
- [Evidence artifact #14199137431](https://github.com/etblink/math/actions/runs/43806215702/artifacts/14199137431), ZIP size 17,333 bytes, GitHub-reported SHA-256 `ad652567bb3f5f47e45574a703a6f7595875a02b5aa759129b184bb214717dd6`. This is the GitHub-reported upload digest and not a separate local rehash.

## Source-exact theorem boundary

Reuse actual `source9NegativeCentral : spinGroup source9Quadratic` with its original paired-48 image `-I₄₈` from F10U, the accepted OP3C6C **all-real-vector original active gamma covariance**, and the physical-Hilbert-star operator automorphism `P2bB3`. The real original Source48Vector coordinates are exactly 24 paired modes × two normalized real axes, with `sqrt(2)`-normalized original Majorana operators. No color-major replacement matrix or arbitrary new spin action appears.

Qualified source:
1. `originalSpin9Central_originalPairedOrthogonal_negativeOne`: actual source SO48/orthogonal underlying original paired-label matrix is negative identity.
2. `originalSpin9Central_activeGamma_negative`: for EVERY original real source vector `v`, the genuine original source Spin9 OPERATOR automorphism obeys `α(source9NegativeCentral)(sourceGammaRealLinear v)=-sourceGammaRealLinear v`.
3. `originalSpin9Central_activeGamma_negative_starAction`: same equality under the exact physical-adjoint-preserving original source star-algebra action.
4. `originalSpin9Central_originalAxis_negative`: original `sourceBlockColorLabel (j,s) A` axis `sqrt(2)`-normalized Majorana is negated for all exact indices.

Three independent consumer declarations:
`originalCentral_source48_vector_negative`, `originalCentral_originalGamma_negative`, `originalCentral_originalAxis_negative`.

This is a strong **negative control** for any future proposed coherent Spin9 Fock-vector implementation: a scalar implementer could not produce `Γ(v) ↦ -Γ(v)` by conjugation for nonzero original gamma operators (axis square-one is qualified in `sourceNormalizedGamma_sq_one`). The theorem does **not** construct the Fock-vector unitary, identify it explicitly with source fermion parity, establish a global phase-compatible group hom, or prove original unbounded physical supercharge-domain covariance.

## R1 negative knowledge and exact repair

- [CS0 R1 #43804542031](https://github.com/etblink/math/actions/runs/43804542031), tested commit `a2e0037a10a10b14eeeade4de36014b90972dfe2`, RED before source elaboration because workflow cold-built **HS0**, leaving missing source `SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.olean`.
- [R1 original artifact #14198511339](https://github.com/etblink/math/actions/runs/43804542031/artifacts/14198511339), GitHub-reported SHA-256 `ef15d01415c0245a053b63ae1e0e5f749e15002713ce89b9cfdf752614a84e34`. Do not relabel R1 as a theorem failure or suppress its negative evidence.
- R2 changed **only** `mod` and `obj` fields to cold build the correct CS0 source module. Exact mathematical source/consumer blobs, original donors, axiom whitelist and timeouts remained fixed.
- [Combined R1 red first-causal record and exact R2 pins](BFSS_M4_HS1_CS0_R1_RED_DIAGNOSTIC_2026_11_15.md).

## Next direct experimental implication

Use source exact central sign as a mandatory falsification test for a proposed original-Fock-vector Spin9 representation. Together with the now-green [HS1 operator-HS group hom](BFSS_M4_HS1_R2_GREEN_43806197198_UNITARY_OPERATOR_HS_GROUP_ACCEPTANCE_2026_11_15.md), the next small high-value target is native original 48-normalized-Majorana **bivector infinitesimal Fock-vector** action, rather than re-proving star invariance or assuming that operator-HS symmetry already solves the physical representation.

The unified BFSS gauge-invariant physical Hilbert, source sixteen-charge normalization and covariance, real operator common domains, Hardy/fidelity and actual ground-state/spectral questions remain open. No `main` edit and no separate branch/PR.

**Provenance scope:** This acceptance file and following roadmap edits are documentation-only descendants and are not claimed to have been requalified at their documentation commit SHA.
