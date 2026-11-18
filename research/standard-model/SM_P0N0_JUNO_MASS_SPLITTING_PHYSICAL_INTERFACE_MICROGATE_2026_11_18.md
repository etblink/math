# SM-P0N0 — JUNO Δm²21 source-exact physical-observable intake

**2026-11-18 | STAGED, UNQUALIFIED.** This is the first empirical-facing protocol intake after SCC3B0/B1, not an independently derived new physics prediction.

## Source and units

Frozen SM-D0 original empirical ledger `research/standard-model/data/SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json`, blob `1d391ba994ee23f03c4423b45fbb15e7e42c86f1`, record `juno_dm2_21_2026`. Exact first 59.1-day JUNO Nature result `Δm²21=(7.50±0.12)×10^-5 eV²` under the **normal ordering analysis scenario**, reported with `sin²θ12=0.3092±0.0087` from the same experiment; DOI `https://doi.org/10.1038/s41586-026-10538-z`, collaboration paper dated June 2026. This is a *frozen first-result* record, not a latest measurement or current global fit. Later JUNO publications may change the numerical frontier; their values are **not silently imported**.

The physical definition is `Δm²21=m₂²−m₁²`, units `eV²`; any model mapping must explicitly declare ordering, eigenvalue labeling, parameter origin, units and experiment/protocol. The reported marginal ± error **does not** specify a statistical likelihood, Gaussianity, nuisance fit or correlation matrix. JUNO's `sin²θ12` record is co-fitted and may not be multiplied into an independent likelihood.

## Bounded executable interface and negative controls

New original Python module `research/standard-model/tools/sm_p0n0.py`:

1. Load the immutable JUNO empirical datum with strict frozen schema/date/DOI/status/units/ordering/cofit assertions and exact rational string parsing.
2. Represent a **synthetic** nonnegative `m_i²` spectrum with consistent normal/inverted ordering and exact rational `eV²` units; forbid silent unit conversion, negative masses and floating-point provenance.
3. Test `(m₂²+c)−(m₁²+c)=m₂²−m₁²` for arbitrary rational offsets; synthetic shifted spectra have different absolute squared masses but identical solar splitting. These are mathematical controls, not deductions about experimental absolute neutrino masses.
4. Return explicit candidate status `FIT_INPUT_NOT_PREDICTION` for neutrino-extended SM phenomenological parameterization, `MISSING_PHYSICAL_MAP` for BFSS and NFC/protected persistence, `NOT_ASSESSED` for unspecified others. No qualified model `Δm²21` prediction exists in this project; **do not invent one** or compute p-values.
5. Emit a deterministic machine-readable checkpoint `SM-P0N0` with `model_prediction_count=0`, `experimental_evidence=NO_EXPERIMENTAL_INFERENCE`, `likelihood_status=NOT_PRESENT_IN_FROZEN_LEDGER`.

Independent adversarial consumer `research/standard-model/tests/test_sm_p0n0.py` covers 20 named cases including provenance tampering, wrong units/ordering, negative mass squares, floating-point injection, failed candidate-origin spoofing, cross-candidate missing maps, co-fit correlation guard and exact common-offset invariance.

## Strict CI and archiving requirement

Pin source/consumer and entire frozen ledger as exact Git blobs, keep original accepted SCC0/SCC3B1 and the earlier Lean SCC3B0 source, archived evidence and original BFSS 27-anchor state unchanged. Test both accepted SCC0/SCC3B1 suites and new consumer, run separate mutation controls and write original tested-commit/checkpoint with full log. Archive original provider ZIP, complete job and SHA/CRC independently **before** acceptance. No changes to `SM_GATE_STATE.json` or `BFSS_GATE_STATE.json` until independently archived GREEN, and even then record an **empirical interface / missing-map** qualification, never full physical SM-D1.

## Conditional next work and stop criterion

If the strict intake gate qualifies, next research should search for an independently justified **model-to-neutrino observable derivation** under the correct 3+1D chiral/gauge/mixing sector; absent such a map, stop at `MISSING_PHYSICAL_MAP` and seek another empirical discriminator rather than adding speculative numeric predictions. Qualified empirical facts are *constraints on models*, not proofs that BFSS/NFC/SM itself is correct.
