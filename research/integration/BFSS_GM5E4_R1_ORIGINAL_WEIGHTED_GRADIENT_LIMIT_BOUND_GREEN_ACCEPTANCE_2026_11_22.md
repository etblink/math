# GM5E4 R1 strict qualification

[Strict run #45123468324](https://github.com/etblink/math/actions/runs/45123468324) passed at unified integration commit `9906eca664a1031f649b1722672d0dba155f3264`, attempt 1, job `137522337424`. The frozen-source preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The native build completed 9,147 jobs. The source theorem `weightedNativeGraph_gradientLimit_sq_le` and independent paired SU(2) theorem `pairedWeightedNativeGraph_gradientLimit_sq_le` each reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The job emitted `BFSS_GM5E4_ORIGINAL_SOURCE_WEIGHTED_GRADIENT_LIMIT_BOUND_INDEPENDENT_STRICT_GREEN`. The [roadmap check at the tested commit](https://github.com/etblink/math/actions/runs/45123468261) also passed.

The [original provider ZIP](https://github.com/etblink/math/actions/runs/45123468324/artifacts/14795895420) is [archived on unified integration](evidence/gm5e4-r1-original-green.zip). Its 17,051 bytes have SHA-256 `3818cf1f6281354e620a20759d2580e053f0fa36e3502eeb3f1f6071de698bed`, matching provider metadata and the upload log. All seven members passed CRC. The embedded tested SHA, three blobs, environment digests, and both proof reports were checked independently.

| Tested file | Git blob |
| --- | --- |
| Lean source | `dc324b12029d35e696fec678a4cc9eb50f374078` |
| Independent Lean consumer | `5bbb08aa5e7bcd3335860a73acdfb483deb16622` |
| Strict workflow | `5154f590f85db0caf8bc1e1537756bfc30765647` |

For a jointly convergent original invariant smooth-core sequence, the GM5E3 limit triple remains in the original weighted Sobolev closure and the limiting gradient $g$ obeys $\|g\|^2\le \|q\|^2/8+2C_M\|w\|^2$. Here $q$ and $w$ are the native charge and square-root radial weighted limits. The paired consumer checks the same bound with the literal paired source charge and weight.

The next bounded application is total boundedness in the original unweighted $L^2$ for families of these limits with uniform input, charge, and radial weighted norms, via the [qualified weighted Sobolev compactness theorem](https://github.com/etblink/math/actions/runs/42320696105). Identification with the full intersection of operator domains and a global radial moment bound remain open.
