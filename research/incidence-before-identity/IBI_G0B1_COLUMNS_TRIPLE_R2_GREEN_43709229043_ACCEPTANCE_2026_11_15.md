# IBI-G0B1 source columns / signed triple R2 — GREEN_QUALIFIED

**Date:** 2026-11-15 Pacific. **Disposition:** GREEN_QUALIFIED bounded original-source color-column identification and signed scalar-triple covariance, **not yet det+1**.

## Exact tested and reproducible evidence

- [Strict run #43709229043](https://github.com/etblink/math/actions/runs/43709229043), attempt 1, `completed/success` at exact source SHA `64ed0f9949bee0281453b8a560d1add38e41085a` on `research/bfss-incidence-unified-20261114`.
- Job `132796974305`, `finite-source-and-independent-consumer`, completed/success. All stages passed: frozen source pins and contract, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, **9,021-job cold build**, separately compiled warning-as-error native source and 3-example independent consumer, three named standard-only axiom reports and strict completion marker `BFSS_IBI_G0B1_COLUMNS_TRIPLE_SOURCE_AND_INDEPENDENT_CONSUMER_STRICT_GREEN`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1SourceColumnsTriple.lean`, Git blob `7022f0759fd761791132857e8c07bf8b442d9c43`; independent consumer `lean/diagnostics/BFSSIBIG0B1SourceColumnsTripleIndependentConsumer.lean`, blob `cac4d3cf4e1ccfb469db9152c73e78590fe32a19`; workflow `.github/workflows/bfss-ibi-g0b1-source-columns-triple-strict.yml`, blob `1ee96401d8408b215fa594adcfc6a52ac91eb398`.
- Three formal `#print axioms` declarations `sourceColumn_apply`, `sourceColorLieTriple_conjugate`, `sourceCrossTriple_conjugate`: only `propext`, `Classical.choice`, `Quot.sound`. No `sorryAx`.
- [Artifact #14160192565](https://github.com/etblink/math/actions/runs/43709229043/artifacts/14160192565) 5,242 bytes, expires 2026-11-29 UTC. GitHub reports ZIP SHA256 `29e2cd0c6597ab796f68c76c3af6f72f499466bc3f5ed4add1df9736fbe84303`; not independently rehashed.

## Scope and the R1 failure

Source-exact `sourceColumn_apply` identifies the output B coefficient of conjugated original color-unit A with `G3A.adjointColorMatrix g B A`. Source-exact `sourceColorLieTriple_conjugate` and `sourceCrossTriple_conjugate` establish preservation of the arbitrary original color-vector signed scalar triple under the **actual paired** SU(2) conjugation, using the G1B-normalized `+sqrt(2)` relation.

R1 [#43707787822](https://github.com/etblink/math/actions/runs/43707787822) was RED on the consumer's `private abbrev M` elaboration outside a `noncomputable section`; R1 source built clean and emitted accepted axioms. R2 introduced **only** the consumer declaration-mode correction and updated its workflow pin. Preserve R1 artifact [#14159438687](https://github.com/etblink/math/actions/runs/43707787822/artifacts/14159438687), RED receipt and history; no evidence was erased.

## Next bounded theorem and negative control

Use FIN-DET3 GREEN [#43705949773](https://github.com/etblink/math/actions/runs/43705949773): the existing source `colorCross` column scalar product equals `Matrix.det`. Define a typed matrix column in original `ColorVector 2`, prove (1) its cross/dot scalar equals the already-qualified FIN-DET3 expression, (2) for G3A that color column equals the color-conjugated original `G3A.colorUnit`, and (3) identity columns yield +1. Combine with strictly-qualified `sourceCrossTriple_conjugate` to conclude `(G3A.adjointColorMatrix g).det = +1` in a **separate** source + independent consumer + standard-only-axiom strict gate. Preserve a det=-1 improper reflection negative control, and do not state original image surjectivity from det-one.

Still open: native det-one until the subsequent gate, G0C surjectivity onto SO(3), G2 original orbit classification, physical FullL2/Fock/Hardy and ontology. No changes to unified integration, main, FCP or original pilot.
