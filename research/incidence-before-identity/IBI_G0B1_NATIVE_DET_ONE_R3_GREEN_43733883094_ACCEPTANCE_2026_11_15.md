# IBI-G0B1 native source adjoint det+1 — R3 GREEN_QUALIFIED acceptance

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Verdict:** **GREEN_QUALIFIED** at the exact original source SU(2) determinant-one claim, with independent consumer. This is not G0C surjectivity.

## Immutable source and verification receipt

- [Strict run #43733883094](https://github.com/etblink/math/actions/runs/43733883094) attempt 1, `completed/success`, tested exact commit `a899735669e71609a2f418075826b5c1db629b2a`.
- Job `132872099781`, `finite-source-and-independent-consumer`, `completed/success`: SHA and theorem-contract preflight PASS; pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; **9,022-job cold native build PASS**; independent warning-as-error compilation of actual source and separate consumer PASS. Exact strict completion marker `BFSS_IBI_G0B1_NATIVE_DET_ONE_SOURCE_AND_INDEPENDENT_CONSUMER_STRICT_GREEN` present.
- Native source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1NativeDetOne.lean`, Git blob `0b82625932304f9e03f07850cef674689475fc09`.
- Independent consumer `lean/diagnostics/BFSSIBIG0B1NativeDetOneIndependentConsumer.lean`, Git blob `241be9229b0aa9ea2047679199e068df921987ad`.
- Workflow `.github/workflows/bfss-ibi-g0b1-native-det-one-strict.yml`, Git blob `1e7f75ab71e37f9462ca2cf911909b59898360aa`.
- Seven named `#print axioms` declarations (including `originalAdjointColorMatrix_det_one`) passed with **only** `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx`, compiler error, or unallowed warning in qualifying logs.
- [Artifact #14169627035](https://github.com/etblink/math/actions/runs/43733883094/artifacts/14169627035): 5,392 bytes, retention until 2026-11-29 UTC; GitHub-reported ZIP SHA256 `67cefaab18d445755e917773bba0ed648a02531c8191466844e244946887624a`, **not independently downloaded and rehashed**.

## Exact scientific claim

For every `g : GaugeGroup 2` in the genuine original paired source `AlgebraData 2`, `(FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det=1`. With original qualified G3A `adjointColorMatrix_orthogonal`, its image lies in `SO(3)` in the explicitly pinned output-row/input-column basis. The proof uses accepted FIN-DET3 signed Pauli colorCross polynomial [#43705949773](https://github.com/etblink/math/actions/runs/43705949773), signed G1B [#43703395473](https://github.com/etblink/math/actions/runs/43703395473), and original-source columns/triple covariance [#43709229043](https://github.com/etblink/math/actions/runs/43709229043). The consumer checks arbitrary g determinant one, conjunction with orthogonality, and an exact det=-1 improper reflection **not in the source image**.

## RED preservation, non-qualification boundaries and G0C

- R1 [#43730126071](https://github.com/etblink/math/actions/runs/43730126071) **RED**: new native source finite inner sum ordering and `ColorIndex 2` numeral elaboration created `sorryAx`; preserved in R1 receipt and artifact #14169080415.
- R2 [#43731870423](https://github.com/etblink/math/actions/runs/43731870423) **RED**: corrected original source built 9022 jobs and standard-only axioms, but consumer lacked `open Matrix` for transpose `ᵀ`; preserved in R2 receipt and artifact #14168894395.
- R3 introduced only `open Matrix` in the consumer, kept source byte-identical to R2 and all three original-source independent checks, and fully qualified.

**Open:** G0C prove **surjectivity** of the original `GaugeGroup 2` map onto all 3x3 real orthogonal det+1 matrices using source-exact witness/construction or formal Lie-group reasoning. It cannot follow from det-one/orthogonality alone. G2 must separately prove rank-stratified Gram+signed-triple orbit reconstruction (including reflection failures and rank degeneracy), then domain/physical-state/Spin(9)/spectral transfer. No unification, ToE, BFSS ground state or incidence ontology has been established by this gate.

No original source files, `integration/bfss-unified-research-20261108`, main, frozen FCP or pilot were modified. No promotion/merge of entire research branch authorized.
