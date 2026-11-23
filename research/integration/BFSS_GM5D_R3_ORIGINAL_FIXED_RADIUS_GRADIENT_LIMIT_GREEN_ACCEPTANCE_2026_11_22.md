# GM5D R3 — original fixed-radius closed gradient and kinetic limit strict GREEN

**Disposition:** Qualified on unified integration by independently checked exact original source, original paired SU(2) consumer, and original CI artifact. **Scope:** fixed-common-radius original invariant smooth-core sequences converging in the native physical sixteen-charge graph.

## Original strict run and integrity

- [GM5D R3 strict GREEN #45107140917](https://github.com/etblink/math/actions/runs/45107140917) passed attempt 1 at exact tested commit `d4080b6f6c75bcec824acc080849c662ec30cb16`, original job `137470904526`, native source build **9,131 jobs**.
- Frozen original-source/dependency-blob preflight **PASS**. Pinned Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored **PASS**. Original native source built fully, independent paired SU(2) consumer compiled under strict warning-as-error and autoImplicit-disabled settings.
- Four original source declarations—`coordinateDirection`, `sourceCoreGradient_norm_sq`, `fixedRadiusCoreGradient_sq_le`, and `fixedRadiusNativeGraph_gradientLimit`—each have exactly `[propext, Classical.choice, Quot.sound]`. The two independent paired declarations—`pairedFixedRadiusCoreGradient_sq_le`, `pairedFixedRadiusNativeGraph_gradientLimit`—also report exactly those three standard axioms. No `sorryAx`.
- Strict sentinel: `BFSS_GM5D_ORIGINAL_SOURCE_FIXED_RADIUS_GRADIENT_LIMIT_INDEPENDENT_STRICT_GREEN`.
- [Original provider artifact #14788881834](https://github.com/etblink/math/actions/runs/45107140917/artifacts/14788881834) is **16,520 bytes**, SHA-256 `75875e4b5d8364d5173c4d3aa542246c2f262f7ed0725e57bed680dd7da2dd07`. Independently downloaded ZIP bytes exactly match provider digest and upload log; all **seven member ZIP CRC checks PASS**. Embedded tested SHA, tested blobs, source and consumer proof reports, and environment hash files inspected. See [full original job log](evidence/gm5d-r3-original-complete-job.log) and [member digest/qualification manifest](evidence/gm5d-r3-original-green-manifest.json). The **original ZIP is retained at the provider artifact link and independently verified locally**, but is **not yet byte-archived in this repository**; do not call it a repo ZIP archive.

| Tested source | Git blob SHA |
| --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSGM5DOriginalFixedRadiusGradientLimit.lean` | `676d41e7897a743bad8a6fbea45eed2733ca8a4d` |
| `lean/diagnostics/BFSSGM5DOriginalFixedRadiusGradientLimitIndependentAudit.lean` | `30c61113bf6329d919ea7d2981d5a1dedae9f2e0` |
| `.github/workflows/bfss-gm5d-original-fixed-radius-gradient-limit-strict.yml` | `8b4c4a389b7fabbf070cae9671262c9eb1e75a7e` |

## Theorem acceptance

For original `M : AlgebraData 2`, `G : M.GaugeData` and `f_n : G.invariantCore` vanishing outside one common radius `R`, the original gradient satisfies

```text
‖sourceCoreGradient f.val‖² ≤
  (1/8)*‖nativeCoreChargeValue M G f‖²
  + 2*(M.fermionGrowthConstant*R)*‖coreToL2 f.val‖².
```

When the core vectors converge in physical `L²` and their **actual original native charge outputs** converge in the sixteen-charge `PiLp` Hilbert sum, the gradients converge strongly to an element of the source **closed Sobolev graph**, and the kinetic energies converge to `(1/2)*‖g‖²`. The paired independent consumer checks precisely this source specialization.

This is a fixed-radius closure result, not unrestricted physical-domain regularity. It proves neither separate potential/multiplier limits on the arbitrary native charge-form completion, a global radial moment inequality, nor ground state, compact resolvent, gap, Hopfion, or GUT.

## Historical RED lineage, never overwritten

- R1 [#45102407563](https://github.com/etblink/math/actions/runs/45102407563), tested `26373ec7cdfb934e255401921b8a547b780aa772`, native RED: failed generic `map_sub` rewrite and closed-graph set type elaboration. [Preserved diagnosis](BFSS_GM5D_R1_ORIGINAL_FIXED_RADIUS_GRADIENT_LIMIT_NATIVE_RED_2026_11_22.md).
- R2 [#45104975857](https://github.com/etblink/math/actions/runs/45104975857), tested `2a4425ec1505cc59708cd70b671cdb4e7d748579`, native RED: generic `map_sub` resolves via wrong `FunLike` instance for `LinearPMap`. [Preserved diagnosis](BFSS_GM5D_R2_EXPLICIT_LINEARPMAP_NATIVE_RED_2026_11_22.md).
- R3 fixes only `LinearPMap.map_sub` qualification; no theorem statement, original dependency pin, strict workflow, paired consumer, or Lean resource budget was expanded.

## Next research boundary

Proceed to the **GM5E0** original-source `kineticPotentialCoreEnergy ≤ (1/16)‖T u_f‖² + C_M*coreRadialMoment f.val` estimate derived from GM5C. It is a **prospective** microgate requiring its own fresh source and independent-consumer checks. Do not claim a global first-moment estimate or automatic physical-domain density. The separate 27-anchor M4 historical register and W0C2B2 BLOCKED state remain unchanged.
