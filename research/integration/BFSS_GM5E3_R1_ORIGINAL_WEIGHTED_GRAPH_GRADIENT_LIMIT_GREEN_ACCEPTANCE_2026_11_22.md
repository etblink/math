# GM5E3 R1 strict qualification

[Strict run #45120402139](https://github.com/etblink/math/actions/runs/45120402139) passed at exact unified integration commit `922758b29d43ac3ae98f300622de98409d19947d`, attempt 1, job `137512607746`. The frozen-source preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The native build completed 9,146 jobs. The source theorem `weightedNativeGraph_gradientLimit` and independent paired SU(2) theorem `pairedWeightedNativeGraph_gradientLimit` each reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The job emitted `BFSS_GM5E3_ORIGINAL_SOURCE_WEIGHTED_GRAPH_GRADIENT_LIMIT_INDEPENDENT_STRICT_GREEN`. The [roadmap check at the tested commit](https://github.com/etblink/math/actions/runs/45120401989) also passed.

The [original provider ZIP](https://github.com/etblink/math/actions/runs/45120402139/artifacts/14794785779) is [archived on unified integration](evidence/gm5e3-r1-original-green.zip). Its 16,729 bytes have SHA-256 `d65f7cd51186b5ee1ab55766f60b0dfcd9eb3552fc79d9e7e2fe2dc56c9800b4`, matching the provider metadata and upload log. All seven members passed CRC. The embedded tested SHA, tested blobs, environment digests, and both proof reports were checked against the tested commit.

| Tested file | Git blob |
| --- | --- |
| Lean source | `ead51cf388f9edee800cb2e154beda58010df5e4` |
| Independent Lean consumer | `4faf95ac74298ae2e83a0865aa8ca8ba8f644fd3` |
| Strict workflow | `ad47618142c0d9bbc7891e264e09f9d2fea091dd` |

For original gauge-invariant smooth core sequences with jointly convergent original input, native charge, and radial weighted outputs, the source gradients converge strongly in the original vector-valued $L^2$. The input, gradient, and radial weighted limits form a triple in `BFSSSliceSobolev.weightedClosure`. The paired consumer checks this with the actual paired source charge operator and the explicit square-root radius weight.

The next bounded consequence is to transfer the GM5E1 squared gradient bound to this limit and connect the resulting bounded families to the [qualified weighted-closure compactness theorem](https://github.com/etblink/math/actions/runs/42320696105). Identification with the full intersection of the native charge and radial multiplier domains, separate bosonic and fermionic energy limits, and global radial moment control remain open.
