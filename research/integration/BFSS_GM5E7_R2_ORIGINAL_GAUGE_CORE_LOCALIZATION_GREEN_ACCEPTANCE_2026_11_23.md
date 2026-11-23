# GM5E7 R2 strict qualification

[Strict run #45201004845](https://github.com/etblink/math/actions/runs/45201004845) passed on unified integration at exact tested commit `071a2b2ba31bcba959783cd2c138b80a82f0eb22`, attempt 1, job `137784173293`. Frozen-source preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The native build completed 9,128 jobs. The native declarations `gaugeInvariantRealCutoff` and `nativeCoreCutoff_ims` and the standalone paired SU(2) consumer `pairedNativeCoreCutoff_ims` each reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The strict success sentinel was emitted. The [roadmap check at the tested commit](https://github.com/etblink/math/actions/runs/45201004563) passed.

The [original provider artifact #14834135009](https://github.com/etblink/math/actions/runs/45201004845/artifacts/14834135009) is [archived on unified integration](evidence/gm5e7-r2-original-green.zip). Its 16,473 bytes have SHA-256 `247683bdeeb1d9fd856ecba6d2f6aaee9e5f17bc4d7093da40df3883499e2472`, matching provider metadata and the upload log. All seven members passed CRC. The embedded tested SHA, three source/consumer/workflow blobs, and environment digests match the exact checkout.

| Tested file | Git blob |
| --- | --- |
| Lean source | `e207f80249e32a3b600c42d68cb73111dbdf3949` |
| Independent paired consumer | `efbb4a9a2752fb78abfad94b3f2a0b2b6e9ae734` |
| Strict workflow | `bbadede2dcacf1c50a6c6ee60bbc9afa01e0d7cc` |

R2 exposes the pointwise scalar-multiplication formula and uses exact gauge equivariance and complex linearity. The IMS statement, paired consumer and strict workflow carry forward from R1. The [R1 receipt](BFSS_GM5E7_R1_CUTOFF_COERCION_RED_AND_R2_TYPED_EVALUATION_2026_11_23.md) preserves the original failure, ZIP and complete job log.

A finite smooth real gauge-invariant quadratic partition preserves the original invariant smooth core under multiplication. The sum of the localized native charge forms equals the original form plus the exact IMS gradient correction. The independent consumer checks this identity on the literal paired SU(2) data with two cutoffs. The [fixed-ball analysis](BFSS_GM5E7_ORIGINAL_GAUGE_CORE_LOCALIZATION_GATE_2026_11_23.md) derives a prospective zero-mode criterion using the localization estimate, compactness, and a weak charge-graph limit. Formalization of that criterion and construction of a physical trial sequence satisfying it remain open.
