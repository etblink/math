# G15 R3 — RED_UNQUALIFIED, independent consumer failure

Independently verified November 15, 2026. [Run #43759253590](https://github.com/etblink/math/actions/runs/43759253590), attempt 1, job 132950119799, exact tested commit `b3ae66c11c7de12a3fb03b82c19efe73e25533a2`. **Final verdict RED_UNQUALIFIED**. G14 [#43749092953](https://github.com/etblink/math/actions/runs/43749092953) remains the last qualified full gate. D0 diagnostic [#43756234296](https://github.com/etblink/math/actions/runs/43756234296) is separately qualified, not the full G15 gate.

## Complete failure evidence reference

[18-file GitHub artifact](https://github.com/etblink/math/actions/runs/43759253590/artifacts/14179588248), ID 14179588248, uploaded size 25,795 bytes, expires 2026-11-29 UTC. Independently downloaded; whole archive rehashed to **sha256:d35537748f16c29d0f9b69baddc892396765abd7a181a6a4c444bec96ee538c6** matching GitHub. `tested-sha.txt` confirms the exact tested commit. `pin-manifest.json`: 170 source pins, SHA-256 `a52ca07c47727d3717caf95fe29f5b074f42daabc959a5907c1472136886fcb8`, matching preflight. Entry SHA-256: `build.log` `efb9d9d9f796b0dd8903bcd56df8efbe707f5c0b76bd22826f85c40b7ff82f4b`, `source.log` `345e196ed6a13b93dd43092365a51bd27df3e696bfff942229e14fc754901037`, `consumer.log` `8cc2d8fa18716ce74c99e49ea424b4d98f0a9d53b430e7984cbb408ed9d9b5fc`. The ZIP is referenced, not embedded here; retain beyond GitHub's expiry separately.

## First-causal failure

Preflight170/pinned Lean and Mathlib, isolated repair-helper2 + helpers1+3+1, native 9,092-job cold build and all six source axiom reports PASS. Each source root uses only `propext`, `Classical.choice`, `Quot.sound`. Full independent consumer failed at:
- line 65: `⊢ ∑ x, 0 ^ 2 = 0` remains unsolved;
- line 66: unused `zero_pow` and `Finset.sum_const_zero` simplification arguments;
- lines 70 and 72: `t` is unused as an index in a constant `Fin 4` sum.
The consumer emitted twelve axiom reports but did NOT compile cleanly, so cannot count as qualified. No source proof defect is established by this red.

## Recovery boundary

Preserve R3 as RED, not retroactively repaired. [Separate R4 preregistration](P3_AUX_HARDY_G15_R4_PRE_GATE_CONSUMER_ONLY_REPAIR_2026_11_15.md) permits the smallest consumer-only correction, with no production-source, D0 helper, mathematical statement, toolchain, warning policy or resource escalation. No unchanged rerun. Full strict R4 and independent evidence audit are required before promotion. Numerical coefficient estimate, physical Spin(9), equal-charge energy/domain, Hardy and fidelity remain OPEN.
