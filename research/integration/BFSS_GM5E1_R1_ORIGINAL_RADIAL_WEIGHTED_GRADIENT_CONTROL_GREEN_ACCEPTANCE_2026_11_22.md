# GM5E1 R1 — exact original radial weighted gradient control strict GREEN

**Accepted only in original invariant smooth-core scope; exact tested source and independent paired SU(2) consumer both qualified.**

## Native original CI and artifact

- [Strict GREEN run #45111900418](https://github.com/etblink/math/actions/runs/45111900418), attempt 1, at exact tested commit `05b5e2c9ad34e1957d7e1b5f6fd602a084b9fc96`; original job `137485917984`. Frozen dependency preflight PASS; original pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS; original native source **9,144 jobs** PASS; standalone original paired consumer PASS.
- Exact source `radialWeightedCore_norm_sq` and `weightedCoreGradient_sq_le`; exact independent consumer `pairedRadialWeightedCore_norm_sq` and `pairedWeightedCoreGradient_sq_le`: **four reports**, each lists only `[propext, Classical.choice, Quot.sound]`; no `sorryAx`. Strict sentinel `BFSS_GM5E1_ORIGINAL_SOURCE_RADIAL_WEIGHTED_GRADIENT_CONTROL_INDEPENDENT_STRICT_GREEN`.
- Original provider [artifact #14790701701](https://github.com/etblink/math/actions/runs/45111900418/artifacts/14790701701): **16,893 bytes**, SHA-256 `058c6c83a9827289896faa424ff22a2d882e727901c72dada6fdc82d12441f2f`. Downloaded original ZIP independently; SHA-256 matched provider metadata and original upload log, all **7 ZIP members passed CRC**, and member hashes / tested SHA / tested Git blob IDs checked. [Evidence member manifest](evidence/gm5e1-r1-original-green-manifest.json), [complete original job log](evidence/gm5e1-r1-original-complete-job.log). The original ZIP is verified and retained at the **provider link** but is **not byte-archived in the repository**.

| Exact tested file | SHA of Git blob |
| --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSGM5E1OriginalRadialWeightedGradientControl.lean` | `257318d2553e1fab10d3b79c6b88180b2e49ab7a` |
| `lean/diagnostics/BFSSGM5E1OriginalRadialWeightedGradientControlIndependentAudit.lean` | `16939cd9feed34d3730735c965debc38e2a35eea` |
| `.github/workflows/bfss-gm5e1-original-radial-weighted-gradient-control-strict.yml` | `ac94aed2c517e7fb76698fa97a762ed3f225e4f5` |

## Qualified source mathematics

On the exact original SU(2) Fock smooth core `f`, the source `BFSSSliceSobolev.weightedToL2` identifies the true radial-weighted vector:

```text
‖radialWeightedCore f‖² = coreRadialMoment f
  = ∫ x, ‖x‖ * ‖f x‖².
```

On original `M : AlgebraData 2`, original gauge `G : M.GaugeData`, and `f : G.invariantCore`, using qualified GM5E0 and original massless bosonic potential nonnegativity:

```text
‖sourceCoreGradient f.val‖² ≤
  (1/8) * ‖nativeCoreChargeValue M G f‖² +
  (2*M.fermionGrowthConstant) * ‖radialWeightedCore f.val‖².
```

Exact independent consumer verifies both on literal paired `pairedAlgebraData` and `pairedGaugeData`; no changed Fock representation or convenience operator is used.

**Strict limits:** these hold on original smooth-core inputs, **not** unrestricted native charge domain. No established equivalence of original gauge-invariant weighted charge graph completion with the source weighted Sobolev closure of **all** smooth-core triples. No automatically bounded first radial moment under unweighted graph norm, no global kinetic/potential decomposition of arbitrary completed states, compact resolvent, spectral gap, eigenvector, Hopfion, GUT or Standard Model prediction.

## Next bounded question, not automatically qualified

First prove additivity of the original `radialWeightedCore` on original smooth-core differences using the source `BFSSSliceSobolev.weightedToL2_ae` and the actual `FullL2` Lp equality. Then the GM5E1 estimate applies to differences of a Cauchy sequence in the **joint weighted physical charge graph** and gives a strong gradient limit in the original closed Sobolev graph by the GM5D argument. Only then, separately, investigate source potential multiplier closure and the physical invariant-space intersection.

**Historical bookkeeping:** the separate canonical M4 accepted-anchor list remains 27 and `P3-M4-W0C2B2` remains BLOCKED; GM5D R1/R2 native REDs and their original evidence remain unchanged.
