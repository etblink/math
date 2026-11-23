# MSY Color-Plane 01: immutable R1 native RED and bounded R2 recovery

23 November 2026 · Unified integration · R1 **RED_UNQUALIFIED** · R2 **PENDING_STRICT_CI**

## Exact original failure

- Strict workflow: https://github.com/etblink/math/actions/runs/45260614151
- Exact R1 tested commit: `7eea73abee40ea3998b3939b361fce28be5cd81e`
- Native job: `137994052107`; completed failure, attempt 1
- Original provider artifact: https://github.com/etblink/math/actions/runs/45260614151/artifacts/14862980893
- Artifact: 39,316 bytes, provider SHA-256 `88a8a2323792198aa4b9c373abf7c65bcc4c3919b98e8131421fcd38d64c1711`
- Frozen source and consumer preflight: PASS; Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS
- Native compilation: RED. Independent importing consumer: NOT REACHED/NOT QUALIFIED
- This receipt quotes the original provider digest/upload log. The ZIP has not been independently downloaded, CRC-inspected, or rehashed here. Retain the original provider artifact and complete independent archival where possible.

First-causal diagnostic: `BFSSMSYColorPlane01.lean:23:26`: failed to synthesize `OfNat (ColorIndex 2) 2`. Analogous source errors for bare color indices 0, 1, 2 occurred throughout. Accepted source `Core.lean` defines `ColorIndex 2 = Fin (2^2 - 1)`; the qualified L6H5E8R donor types the color Z label `(2 : Fin 3)`. Separate native diagnostic `BFSSMSYColorPlane01.lean:75:2`: `simp` maximum recursion depth when expanding the nine ordered color terms. Dependent axiom reports include `sorryAx`, so **no R1 theorem is qualified**.

Original tested blobs: source `a5e020d4aa630ce9fea5a00206ea3ce6c5d8dfe5`; independent consumer `95bb98dd43f2cd3d57a1c7582e5019024e979567`. Strict workflow remains unchanged for R2.

## Bounded R2 source repair

1. Type only original SU(2) color literal sites explicitly as `(0 : Fin 3)`, `(1 : Fin 3)`, and `(2 : Fin 3)` in both native source and importing Fock consumer. No abstract index family or mathematical theorem statement is replaced.
2. Separate the `native_spin_summand` finite three-color contraction into three row sums before the final anticommutation and scalar normalization. Do not increase heartbeat/recursion limits or add axioms.
3. Retain original gamma/CAR/physical source imports, exact theorem names, original independent consumer, workflow and environment pins. New R2 source and consumer are candidates until a full native build and independent consumer prove their exact claims.
4. If a second native RED is analogous, stop this monolithic architecture and use isolated typed microgates/row calculations rather than a third blind retry.

## Mathematical and physical interpretation

The prior reflected gamma-basis and Majorana transport GREEN qualifications are unaffected. R1 does not establish even the restricted color-plane identification. A future R2 GREEN, if independently qualified, identifies one normalized finite SU(2) color-plane action conditional on the Majorana intertwiner; it does **not** establish the full external Appendix A Fock realization, gauge-fixed smooth-core supercharge equivalence, original BFSS physical zero-mode existence, Standard Model, GUT, or ToE.

Preserve this failure as negative proof-engineering knowledge, not a physical counterexample.
