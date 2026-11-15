# IBI-G0A — source-exact Gram incidence prerequisite (preregistered)

Date: 2026-11-14 Pacific. Branch: `research/bfss-incidence-unified-20261114`.
Status: **P0 — preregistered source/consumer candidate; no Lean qualification**.
Integration parent: `a04a26d1360a85398a21d2c73688c9fa7d9aa2b7`.
Original IBI pilot ancestor: `5768aa13590feeaf735b8a323083eebf6f93c5cc`.
Target Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.

## Exact source and scope
The original `Boson 2` carrier is nine `ColorVector 2` rows. The
source `FCP.BFSSSU2GaugeG2A.bosonGauge` is the actual upstream
`pairedAlgebraData.gaugeConjugate`, and G3A's
`adjointColorMatrix_orthogonal` has already been proved. G2A and
`BFSS/GaugeOrbits.lean` supply a source `spatialColor_gaugeConjugate`
and `colorConjugate_inner`.

**G0A microgate**: define the *literal original-carrier* Gram entry
`G x i j = inner ℝ (spatialColor x i) (spatialColor x j)`;
prove (a) `G (bosonGauge g x) i j = G x i j`, then
(b) if `y = bosonGauge g x` for some original `GaugeGroup 2` element,
the entries agree. Require an independently compiled native consumer
checking the source action at two spatial indices and an orbit consequence.

This is only a **necessary** forward direction of eventual orbit separation.
Neither Gram alone nor this lemma can distinguish full-rank orientation:
the pilot's reflection counterexample survives.

## Gates deliberately NOT discharged
- **IBI-G0B**: det`(adjointColorMatrix g) = 1` with original color
  normalization, plus an original-source nontrivial sign-flip witness.
- **IBI-G0C**: image surjectivity onto SO(3) for the *exact* G3A source map.
  Standard abstract `SU(2) → SO(3)` surjectivity is not a source crosswalk.
- **IBI-G1**: literal finite signed triple invariance, and rank-split
  Gram/triple orbit classification.
- **IBI-G3/G4**: Fock gauge equivariance, physical quotient measure,
  kinetic terms, closed sixteen-charge domains, and spectra.

These must not be inferred from G0A success. No separate ontology,
new model, GUT, or physical empirical claim is proposed.

## Acceptance and stop conditions
P1 requires a source file plus a separately compiled genuine consumer.
P2 requires exact tested commit, frozen pins, cold source build,
warning-as-error source and consumer, named `#print axioms` roots,
only `propext`, `Classical.choice`, `Quot.sound`, and no
`sorryAx`/unexpected warning. A workflow launch is **not** success.
A red means `RED_UNQUALIFIED` with first causal evidence; do not
alter original BFSS files, G9, `BFSS_GATE_STATE.json`, main, FCP,
or unified integration to repair an isolated IBI candidate.

The only current objective is a minimal source-dependent incidence theorem.
After qualification, re-rank G0B (orientation) and G0C (surjectivity) before
asserting exact SU(2)/SO(3) quotient reconstruction.
