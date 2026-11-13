# P3-M3G0A manifest accepted for strict attempt — NO new mathematical qualification
**Pacific date:** 2026-11-13. **Status:** prospective exact-pin preflight qualified; **Lean gate pending**.

## Immutable audit
- [Manifest audit #43390427806](https://github.com/etblink/math/actions/runs/43390427806) GREEN at `e4ddc105f17e47f78bcf9ab60b5c822a9fab2e36`; job 131768745408.
- The audit verified the exact **96** accepted M2C1 pins, original M3 source and consumer blobs, historical L6G7U–Z six hashes, Lean 4.34.1 / Mathlib `d13f23b7...`, and full recursive `import OAI...` closure against immutable commit `c6253c7c8bec20ede9ac9cb725fb694c5e55d6b5`.
- **225** gauge L6G7Z transitive OAI source modules, with **one** path overlap with M2; **459** distinct files in deduplicated union of all roots, M2 original 96 pins and actual M3 source/consumer closure. This broad OAI traversal is larger than the handoff's older **128 internal** gauge-source-module inventory. Never treat these as the same counting convention; the 459 pin set is the strict one.
- Audit manifest artifact content digest `sha256:7f38d8694b56656b08007af17212ddd724f2fa71815aa84375df53345e05c130` includes the tested head metadata.
- The importer manifest source is `tools/bfss_m3g0a_manifest_audit.py`, original blob `7ce1334dad835fbe9798cf7557a98cd6e7fba3d0`, with explicit ancestor-tree checks and a frozen two-file candidate source/consumer hash contract.

## Exact bounded mathematical gate
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3G0AOriginalFockGaugeColumnTransport.lean`, blob `cc40839076eb980dab54f57af9c95b9d9e33da2c`.
- Consumer: `lean/diagnostics/BFSSP3M3G0AOriginalFockGaugeColumnTransportIndependentConsumer.lean`, blob `b66dcf427baf572a44de3bd72566857803accbea`.
- Actual SU2 diagonal `PiLp 2` unitary via `LinearIsometryEquiv.piLpCongrRight`, M2C0 `≃L[ℂ]` transport, column intertwining, one/mul/inverse laws; real `FullL2 2`, `OriginalFockOperatorLp`, actual `Boson 2` and `Fermion 2`.
- Forbidden promotions: original pointwise a.e. left-output law, source-basis independence, physical fixedness, original operator-norm isometry, unbounded Gauss, closed physical H, spectrum, gap or GUT/ToE.
- Independent cold build, consumer, warning and explicit permitted axiom audits required; only `propext`, `Classical.choice` and `Quot.sound`. A documentation or manifest GREEN is **not** a theorem GREEN.
- Strict workflow `.github/workflows/bfss-p3-m3g0a-original-fock-gauge-column-strict.yml` is the sole new mathematical qualification attempt. Accept only if its exact tested SHA, 459-pin preflight, source/consumer compilation and axiom audit are independently GREEN. On RED preserve the first causal problem and repair narrowly without rewriting historical gauge interfaces.
