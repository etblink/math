# IBI-G0B1 source columns/triple R2 — consumer noncomputable section preregistration

Date: 2026-11-15 Pacific.
Status: PROSPECTIVE / UNQUALIFIED pending independent strict CI.

## R1 outcome and exact target

R1 run [#43707787822](https://github.com/etblink/math/actions/runs/43707787822) built all 9,021 source jobs and printed accepted-only axioms for `sourceColumn_apply`, `sourceColorLieTriple_conjugate` and `sourceCrossTriple_conjugate`, then failed the independent consumer's local `private abbrev M` at line 21 with `lean.dependsOnNoncomputable` due to `pairedAlgebraData`. The original source and G1B, G3A and FIN-DET3 donors are unchanged.

**Only approved repair:** In `BFSSIBIG0B1SourceColumnsTripleIndependentConsumer.lean`, insert `noncomputable section` immediately inside the existing namespace before the existing `open` declarations; close that section immediately before `end BFSSIBIG0B1SourceColumnsTripleIndependentConsumer`. Keep `private abbrev M : AlgebraData 2 := pairedAlgebraData` and all **three arbitrary source** examples byte-identical otherwise. This matches the accepted source declaration mode and creates no new Lean axioms or theorem assumptions.

Update the exact consumer Git blob pin in `.github/workflows/bfss-ibi-g0b1-source-columns-triple-strict.yml` atomically with this preregistration and R1 RED receipt; preserve source blob `7022f0759fd761791132857e8c07bf8b442d9c43` and import dependency blobs, original strict shell steps, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold build, warning-as-error source, warning-as-error independent consumer, three standard-only `#print axioms`, and artifact retention.

If R2 RED, preserve its **first causal diagnostic**, identify whether the failure moved or is analogous, and enforce the two-analogous-failures stop rule. Only a new strict run completed/success on the exact new SHA with the independent consumer PASS and completion marker qualifies this gate.

Claim ceiling: source-exact columns + signed Lie/cross covariance. **Still not** native det +1, image surjectivity, orbit reconstruction, FullL2/Fock physical consequences or ontology. No original source, integration, main, FCP or pilot modifications.
