# GM5E8 R2 strict qualification

[Strict run #45212313638](https://github.com/etblink/math/actions/runs/45212313638) passed on unified integration at exact tested commit `264cba73914e0c344afa3e18762559582e690dcd`, attempt 1, job `137824115137`. Frozen-source preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The native build completed 9,143 jobs. The native theorem `originalZeroMode_of_persistentOverlap` and the standalone paired SU(2) consumer `pairedOriginalZeroMode_of_persistentOverlap` each reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The strict success sentinel was emitted. The [roadmap check at the tested commit](https://github.com/etblink/math/actions/runs/45212313716) passed.

The [original provider artifact #14839595791](https://github.com/etblink/math/actions/runs/45212313638/artifacts/14839595791) is [archived on unified integration](evidence/gm5e8-r2-original-green.zip). Its 17,988 bytes have SHA-256 `ba2fe887220c288791c397dc6d9561e1b07cce2274969ecc2880e540bfc4adb8`, matching provider metadata and the upload log. All seven members passed CRC. The embedded tested SHA, source/consumer/workflow blobs, and environment digests match the exact checkout.

| Tested file | Git blob |
| --- | --- |
| Lean source | `672da1f40cbc5c71dee40a81d185054a11ec3479` |
| Independent paired consumer | `d2efa4d62966683b5349cb7e712bb6e7f0e36a76` |
| Strict workflow | `a348a064214c2a84679ac24d2870ed64ec8e3955` |

R2 rewrites zero-submodule membership with the explicit scalar ring. The theorem, consumer and strict workflow carry forward from R1. The [R1 receipt](BFSS_GM5E8_R1_MEM_BOT_ELABORATION_RED_AND_R2_REWRITE_2026_11_23.md) preserves the failure, original ZIP, and complete job log.

A sequence in the original gauge-invariant smooth core with input norms at most one and native charge output tending strongly to zero yields a nonzero zero mode on the original Hamiltonian's natural domain if its overlap magnitude with one fixed physical vector stays eventually above a positive constant. The proof uses orthogonality of the original closed charge graph and the native Hamiltonian weak form. The [fixed-ball bridge](BFSS_GM5E8_ORIGINAL_PERSISTENT_OVERLAP_ZERO_MODE_GATE_2026_11_23.md) still needs formalization and a physical trial family satisfying either the overlap hypothesis or an applicable fixed-ball mass bound remains open.
