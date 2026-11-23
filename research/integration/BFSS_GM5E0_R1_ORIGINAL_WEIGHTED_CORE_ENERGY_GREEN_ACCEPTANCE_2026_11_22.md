# GM5E0 R1 — original weighted core energy strict GREEN acceptance

**Verdict:** QUALIFIED under strict original-source / independent-consumer CI on `integration/bfss-unified-research-20261108`.

## Original CI and independent evidence

- [Strict run #45109580962](https://github.com/etblink/math/actions/runs/45109580962), attempt 1, original job `137478615625`, exact tested commit `388481285c6c72c56550e65b5ba73fffb746fc99`. All job steps passed, including source-exact frozen dependency preflight, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration, original native source **9,129-job** build, and standalone strict original paired SU(2) consumer.
- Source `FCP.BFSSGM5E0.originalNativeCore_kineticPotential_le` and independent consumer `FCP.BFSSGM5E0Independent.pairedOriginalNativeCore_kineticPotential_le` each depend only on `[propext, Classical.choice, Quot.sound]`. No `sorryAx`. Original required sentinel `BFSS_GM5E0_ORIGINAL_SOURCE_WEIGHTED_CORE_ENERGY_INDEPENDENT_STRICT_GREEN`.
- [Provider original artifact #14789328735](https://github.com/etblink/math/actions/runs/45109580962/artifacts/14789328735): 16,504 bytes, original ZIP SHA-256 `468bb88f7ec8a7d4bc29d24350da44a6a28f3c48b83f1084e22b82635c62b5f1`. The provider ZIP was independently downloaded, SHA-256 matched metadata/upload log, all **seven CRC member checks passed**, and per-member SHA-256 and sizes verified. `tested-sha.txt` and `tested-blobs.txt` agree with exact tested commit and source/consumer/workflow blobs. Full [original job log](evidence/gm5e0-r1-original-complete-job.log) and independently generated [evidence manifest](evidence/gm5e0-r1-original-green-manifest.json) preserved in the repository. The original artifact ZIP itself is **not** yet stored as a binary repository file; do not mislabel it as repo-archived.

| Tested file | Original tested Git blob |
| --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSGM5E0OriginalWeightedCoreEnergy.lean` | `4da6d5a1c610a4a79c3c39732137e31cf9d71a8e` |
| `lean/diagnostics/BFSSGM5E0OriginalWeightedCoreEnergyIndependentAudit.lean` | `62806ea320506c531e50464bcb5baa50c652f932` |
| `.github/workflows/bfss-gm5e0-original-weighted-core-energy-strict.yml` | `9a56c28bbfe1d42f92c028eadd1fd0a91b6a9d65` |

## Accepted mathematical claim

For original `M : AlgebraData 2`, `G : M.GaugeData`, `f : G.invariantCore`:

```text
kineticPotentialCoreEnergy M f.val ≤
  (1/16)*‖originalMinimalPhysicalHilbertChargeColumn M G
    (closedChargeCoreInput M G f)‖²
  + M.fermionGrowthConstant * coreRadialMoment f.val.
```

This follows from the lower half of qualified GM5C's `nativeCoreEnergy_difference_le`, not from a conjectured coercive potential. It is exactly on the **original invariant smooth core**, checked using the **literal paired SU(2) data and original sixteen-charge Hilbert output**. The derived estimate controls kinetic plus bosonic potential energy only with the explicitly present first radial moment.

**Unqualified:** a uniform first moment controlled solely by the unweighted charge graph norm, density in a weighted native physical graph intersection, separate completed-domain potential / fermion multiplier operator convergence, compact resolvent, physical threshold eigenvector or gap, Hopfion or GUT. These are not consequences of this acceptance.

## Bookkeeping

- Earlier exact original GM5D R3 qualification [#45107140917](https://github.com/etblink/math/actions/runs/45107140917) and R1/R2 native REDs remain unchanged.
- The GM5E0 workflow's human-readable `name` and one step display label retain the inherited phrase `fixed-radius gradient limit`, although its actual source, independent consumer, filenames, tests, and sentinel identify GM5E0 weighted energy. This is a **stale display label only**; do not modify the qualified tested workflow bytes without a separate CI plan.
- Parallel cross-track status advances to GM5E0 R1, while the separate historical M4 register keeps its 27 accepted anchors and W0C2B2 BLOCKED.

## Next bounded obligation

Plan GM5E1 on the *defined joint weighted graph closure of invariant smooth-core input/charge/first radial-weight outputs*. Prove gradient and nonnegative bosonic-potential multiplier Cauchy control using the qualified inequality and the exact original multiplication operator interface. No automatic density in an unrestricted domain. Audit original source details and type compatibility before writing a new Lean gate.
