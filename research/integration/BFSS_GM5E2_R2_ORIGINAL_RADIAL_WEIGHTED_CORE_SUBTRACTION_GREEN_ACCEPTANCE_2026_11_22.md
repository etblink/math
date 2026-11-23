# GM5E2 R2 strict qualification

[Strict run #45116254046](https://github.com/etblink/math/actions/runs/45116254046) passed at exact unified integration commit `52b2272c7d92ea9bf95251480a5de8a7f3d0167e`, attempt 1, job `137499673867`. The frozen-source preflight and pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration passed. The native build completed 9,145 jobs. The source theorem `radialWeightedCore_sub` and independent paired SU(2) consumer `pairedRadialWeightedCore_sub` each reported exactly `propext`, `Classical.choice`, and `Quot.sound`. The job emitted `BFSS_GM5E2_ORIGINAL_SOURCE_RADIAL_WEIGHTED_CORE_SUBTRACTION_INDEPENDENT_STRICT_GREEN`.

The [original provider ZIP](https://github.com/etblink/math/actions/runs/45116254046/artifacts/14792342796) is [archived on unified integration](evidence/gm5e2-r2-original-green.zip). Its 16,970 bytes have SHA-256 `ac693b62bd8b07b69bce6a86b11435353b34513e20d9dab55c9ead28dc5d00b3`, matching the provider metadata and upload log. All seven members passed CRC. The embedded tested SHA, three Git blobs, environment digests, and both proof reports were checked independently.

| Tested file | Git blob |
| --- | --- |
| Lean source | `ddddbc21ef077381c106054de4e77a5d4c9227c4` |
| Independent Lean consumer | `99457caf1f3412468ef09739c7fb874884280d6d` |
| Strict workflow | `e33e9563771deb540eb62716b763a66b9fe0c8e7` |

For original smooth core vectors $f,g$, the $L^2$ output obtained by multiplying by $\sqrt{\|x\|}$ respects subtraction. This permits the GM5E1 gradient bound to be applied to differences of approximants when the original inputs, native charge outputs, and radial weighted outputs all converge. The corresponding strong gradient limit on the joint graph closure is the next proof. Identifying that closure with an intersection of operator domains and proving global first-moment control remain open.

[R1](BFSS_GM5E2_R1_UNUSED_CHANGE_NATIVE_RED_2026_11_22.md) failed the strict unused-tactic check on a redundant `change`. R2 removes that line and preserves the theorem statement, paired consumer, workflow, and Lean resource settings.
