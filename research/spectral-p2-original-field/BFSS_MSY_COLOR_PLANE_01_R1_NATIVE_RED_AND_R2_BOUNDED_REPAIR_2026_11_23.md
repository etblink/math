# MSY Color-Plane 01: immutable R1 native RED and bounded R2 recovery

23 November 2026 · Unified integration · R1 **RED_UNQUALIFIED** · R2 **RED_NATIVE_UNQUALIFIED** · architectural stop

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

## R2 strict result: second native RED, stop boundary reached

- Strict run: https://github.com/etblink/math/actions/runs/45271008022
- Exact tested commit `0b791ba369332de53f0f139d79f4ac788c3beffb`; job `138030480460`; attempt 1; conclusion FAILURE
- Frozen-source/consumer preflight PASS, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS
- First native failure: `BFSSMSYColorPlane01.lean:52:8` untyped `OfNat (ColorIndex 2) 2` remaining in the `native_structure_constant` proof application; the generic theorem at line 48 also times out during weak-head normalization at the default 200000 heartbeats
- Other native failures: line 79 row 0 unresolved, line 86 row 1 unresolved, line 91 row 2 unresolved; line 101 rewrite did not find the row sum, line 104 final coefficient proof unresolved; unused simp-argument diagnostics at lines 80, 87, 92 and 106 under warning-as-error
- Native reports: `native_adjoint_plane01` shows only the accepted `propext`, `Classical.choice`, `Quot.sound`; the other two declarations depend on unresolved `native_spin_summand` and are NOT axiom-qualified
- Independent importing Fock consumer did NOT qualify because native source compilation failed
- Original R2 provider artifact: https://github.com/etblink/math/actions/runs/45271008022/artifacts/14867250404 ; 38,746 bytes, provider SHA-256 `3927227aa22c79cabb983ac6eb63a03fae286e345c4640a60014ba86502393e7`
- Tested source blob `77f8baf6c045ba337c3cc198c62bb1a3c745e9d3`; independent consumer blob `573df7e6e6c35855cb10a1fd1b0583f0f25bad3c`; R2 strict workflow unchanged
- Independent ZIP bytes/CRC/recomputed artifact SHA-256 were not obtained in this audit; the digest is the GitHub Actions provider checksum, not a personally recomputed digest
- Independent active-roadmap consistency run #45271008504 GREEN at the same SHA. This administrative GREEN does NOT qualify the native theorem.

### Architecture stop, not proof rejection

R1 and R2 are two source-native failures of the same combined color-plane proof track. **No monolithic R3 is authorized here.** Preserve the files at their original tested blobs, do not update the strict consumer or workflow in response to the RED, and do not alter accepted donor sources. Do not increase Lean recursion/heartbeat limits, disable the unused-simp linter, insert `sorry`, or weaken the theorem.

A future separate microgate design must be compiled on the exact pinned source *before* a costly strict pipeline:

1. **Finite color table gate.** State each `(a,b,c) : Fin 3` identity with fully typed `(2 : Fin 3)`; prove the three fixed-index `epsilon3` rows with `fin_cases` and exact algebraic calculation. Never elaborate the nested matrix/AlgebraData proof while proving table facts.
2. **Bounded source generator gate.** Use the qualified Pauli structure-constant theorem as a donor. Establish the three `Fin 3` row contributions by explicit named equalities and `change`/small rewrites, with separate CAR antisymmetry. Keep source operators but avoid a nine-term monolithic simplifier.
3. **Finite action bridge.** Only after the generator gate compiles, reuse the exact accepted L6G7K flow identification and the reflected Majorana unitary to compare exponentials. Include the exact independent Fock consumer and quarter-turn bosonic sign check.
4. **Promotion boundary.** Qualify full source, consumer, environment and axiom reports at a frozen candidate commit, independently review the original evidence, then update canonical statuses. No claimed paper/source differential-supercharge equivalence or physical BFSS ground state follows from any of these finite color gates.

This architectural stop retains useful negative proof-engineering knowledge while leaving the separate original source physical crosswalk and SM comparison free to progress.


## Independent archive of both failed attempts

The original [R1 ZIP](../integration/evidence/msy-color-plane-01-r1-original-red.zip) and [R2 ZIP](../integration/evidence/msy-color-plane-01-r2-original-red.zip) now reside on unified integration. Each six-member archive passed CRC. Both byte counts and independently recomputed SHA-256 digests match the provider. The tested commit, source/consumer/workflow blobs, toolchain and manifest hashes, and first native diagnostics match the corresponding GitHub Actions attempts. Both failures precede independent consumer compilation.
