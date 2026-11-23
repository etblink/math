# Reflected Appendix A gamma basis R1 strict qualification

[Run #45247937102](https://github.com/etblink/math/actions/runs/45247937102) passed on unified integration at exact tested commit `da1e361d0e00c7953cab0507290a4e0b948106f6`, attempt 1, job `137949543049`. Frozen-source preflight and pinned Lean 4.34.1 and Mathlib restoration passed. The 8,926-job native build reported exactly `propext`, `Classical.choice`, and `Quot.sound` on each of the three new declarations. The standalone importing audit reported the same axioms. The strict sentinel was emitted, and the [roadmap guard](https://github.com/etblink/math/actions/runs/45247936942) passed.

[Provider artifact #14855640160](https://github.com/etblink/math/actions/runs/45247937102/artifacts/14855640160) is [archived on unified integration](../integration/evidence/msy-reflected-gamma-basis-r1-original-green.zip). Its 5,956 bytes have SHA-256 `63bbad35e9fdc304494afe2c9e4c2a288f83689062191cc5f042ba5691363b2c`, matching the provider digest and the upload log. All seven members passed CRC. The recorded SHA, blobs and environment hashes match the tested checkout.

| Tested file | Git blob |
| --- | --- |
| Lean source | `adf9f25a546d80ed92cb2a671c8eaad7e591ec77` |
| Independent importing audit | `d67e97c9cb16f36050a6602cd3bb03f94126fa7d` |
| Strict workflow | `d0664f2eb0de78b9c7aa55c87424b9775ea0ffc6` |

This qualifies the finite Appendix A comparison against the original Gamma9 matrices. It covers the reflected single-generator and two-generator identities and the doubled basis's Gram normalization. The separate reproduction checks the transcription against the paper, and the [pairing calculation](BFSS_MSY_REFLECTED_GAMMA_BASIS_GATE_2026_11_23.md#fock-pairing-check) explains why the next step needs actual Majorana transport on the Fock module. The gauge action and the sixteen differential charges are the next source interfaces.
