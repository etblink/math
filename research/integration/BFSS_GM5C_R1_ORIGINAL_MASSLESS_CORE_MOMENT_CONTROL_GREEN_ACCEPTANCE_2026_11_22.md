# GM5C R1 strict qualification

[Run #45099280662](https://github.com/etblink/math/actions/runs/45099280662) passed at exact unified integration commit `0d98567ed139f749a497e12449400d1cab29c56f`, attempt 1, job `137446116446`. The frozen-source preflight passed with Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. The native build completed 9,128 jobs. All five native and two independent paired SU(2) declarations reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The job emitted `BFSS_GM5C_ORIGINAL_SOURCE_CORE_MOMENT_CONTROL_INDEPENDENT_STRICT_GREEN`.

The [original provider ZIP](https://github.com/etblink/math/actions/runs/45099280662/artifacts/14784763924) is [archived on unified integration](evidence/gm5c-r1-original-green.zip). Its 16,571 bytes have SHA-256 `6f393e2625bf55f612725b85a00c65ddc60e9f54947a5c35674225996cc35dc1`, matching the provider metadata and upload log. All seven members passed the archive CRC check. The embedded SHA, tested Git blobs, toolchain and manifest digests, and proof reports were checked against the tested commit. The [roadmap check on the tested commit](https://github.com/etblink/math/actions/runs/45099280505) also passed.

| Tested file | Git blob |
| --- | --- |
| Lean source | `d5b7fbe3cb19ec19a1fae372805830fe34b4d7b7` |
| Independent Lean consumer | `4892d5b5487d48b7416d505ac233afd63dcf5e8d` |
| Strict workflow | `076c5eb892bcf24c13faa2d006e6091033fc6306` |

On the original invariant smooth core, the absolute fermionic energy, equivalently the absolute difference between the normalized native charge form and the sum of the kinetic and bosonic potential terms, is bounded by the original field growth constant times the first radial moment. For core vectors vanishing outside a common radius $R$, the bound is at most $C_M R\|u\|^2$. The independent consumer checks both bounds on paired SU(2) data.

The next bounded step is to apply the fixed-radius estimate to graph-Cauchy differences and identify the separate energy limits for the graph closure of that supported core. Treating every supported vector in the native form domain would also require approximation with controlled support. The global first-moment estimate in the unweighted charge graph norm remains open.
