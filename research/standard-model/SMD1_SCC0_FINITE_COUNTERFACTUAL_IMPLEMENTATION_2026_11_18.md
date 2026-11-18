# SM-D1-SCC0 — finite counterfactual witness protocol, implementation checkpoint

**Date:** 2026-11-18. **State:** implementation staged; original strict CI and independent archive NOT YET QUALIFIED. No experimental physics result is claimed.

## Original SCC source now located

The frozen theorem-bearing SCC source is \`etblink/Nested-Fibrational-Cosmology/NFC_SCC_Branch.tex\` at the canonical repository commit \`ed3047c2cbc0abc34d2549dd27754e4d3d05af78\` (blob \`1f340e6c1d191c6ecd2e8b6805fd78078ef26dce\`). Its object definition is \`X=(A,W,T,D)\` (support, witness, transported invariant, defect ledger). Conditional MCS, WeakGlue, UC and TSI arguments are present. The branch explicitly remains **conditional CERT-CLOSE**, subject to UCTI/depth-sum/threshold-stability and source descent. This implementation **does not** import or assert these theorems, NFC ontology, or any physical SCC mechanism.

## Formalization boundary

\`tools/smd1_scc0.py\` implements **executable finite exact semantics** (not a Lean theorem or a continuous-parameter result). A scenario supplies predictions for explicitly identified witnesses, each with protocol, unit, categorical outcomes and a provenance label. Distributions use \`fractions.Fraction\` and normalize exactly. A model family is a nonempty finite set of scenarios. All admissible scenario pairs must differ on at least one fully comparable recorded marginal to count as uniformly separated.

- \`EQUIVALENT_ON_RECORDED_MARGINALS\` does **not** mean model identity or equality of joint laws.
- \`ALL_FINITE_SCENARIO_PAIRS_SEPARATED\` means exact, finite, *theoretical* separation on the supplied selected marginals; it does **not** guarantee practical distinguishability at finite statistical power or exhaust a continuous parameter space.
- \`UNKNOWN_NOT_PREDICTED_OR_UNMAPPED\` is neither equality nor agreement; unknown responses block a complete comparison.
- Wrong observable ID, channel/protocol, outcome domain or unit is invalid.
- Multiple observations sharing a declared dependence group are rejected as a compound comparison absent a separately modeled actual joint distribution. In particular, the two published JUNO measurements are not silently multiplied as independent likelihoods.
- Inclusion-minimal separating witness sets are computed by explicit deletion/exhaustive search. They can be non-unique. No original SCC MCS uniqueness theorem is imported.
- Proof and source claims are capped at *this typed toy protocol*. The \`provenance\` label is a traceability requirement, **not** independent validation that a model has produced a genuine physical prediction.

## Independent consumer and adversarial controls

\`tests/test_smd1_scc0.py\` checks 24 positive/negative scenarios, including identity of recorded marginals, exact mathematical separation, unknown or missing physical maps, wrong proton decay channel, wrong unit, wrong outcomes, non-normalization, negative probability, duplicate witnesses, correlated JUNO fields, an explicit synthetic joint fixture, overlapping versus uniformly separated finite scenario families, and non-unique and two-witness minimal families. It independently computes the SM-Y0 one-family rational hypercharge coefficients for the canonical and quark-doublet charge-zero counterfactual and checks their zero/nonzero distinctions. No actual experiment is represented by these fixtures.

## Guardrails and next decision

Original SM-Y0 R1 and SM-D0 R1 evidence (including exact blob pins) and 27 BFSS accepted anchors remain immutable and independently governed. SM-D1 continues **PROSPECTIVE_UNSTAGED** in \`SM_GATE_STATE.json\` until an original strict GREEN, an independent preservation pass and a scope review; this is a *methodology gate*, not SM-D1 physical model adequacy.

**Next only after strict evidence:** independently archive original CI logs/artifacts and their hashes; consider a second Lean source/consumer microgate for elementary finite separation lemmas; eventually require external physical model predictions and covariance/likelihood provenance before applying this comparator to actual SM-D0 data. No theory is favored.
