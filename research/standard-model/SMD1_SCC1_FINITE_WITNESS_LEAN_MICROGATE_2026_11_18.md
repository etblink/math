# SM-D1-SCC1 — bounded mathematical separation microgate

**Date:** November 18, 2026. **STATUS: SOURCE/CONSUMER STAGED, NOT QUALIFIED.**

## Scope and provenance

Build on SM-D1-SCC0 R1 (original finite Python methodology, strict/archived). This is an independent Lean 4.34.1 source and importing consumer for elementary deterministic witness logic. It deliberately does **not** import NFC's SCC branch book or make its conditional MCS/WeakGlue/UC/TSI hypotheses unconditional.

The mathematical definitions prove that two instances are observationally equivalent **only relative to a specified witness set**. A separating witness is an explicit differing deterministic Boolean output. A finite family is uniformly separated only when every admissible pair is distinguished. Finite deletion-minimal supports may be non-unique. Missing predictions use `Option Bool` and cannot count as agreement; they require separate data handling.

The consumer imports SM-Y0's previously qualified single-family anomaly coefficients and uses two independent mathematical zero/nonzero witnesses for the explicit quark-doublet charge perturbation. These are not physical measurement predictions. No result here claims statistical distinguishability, covariance, phenomenology, physical model adequacy, or all-parameter continuous family separation.

## Strict acceptance requirements

1. Original source and independent importing consumer must compile at pinned Lean 4.34.1 and Mathlib d13f23b7.
2. Source declarations and consumer declarations must contain no sorry, unsafe, admitted assumptions or foreign axioms; roots need explicit `#print axioms` audit.
3. All printed axioms must remain within Mathlib's conventional `propext`, `Classical.choice`, and `Quot.sound` ceiling.
4. Strict CI must pin original SM-Y0/SM-D0, SMD1-SCC0 source and evidence, and 27 BFSS anchors.
5. Original strict GREEN evidence must be separately verified and archived before any new qualification record is accepted.
6. Do not modify `BFSS_GATE_STATE.json` or `SM_GATE_STATE.json` during staging. Full SM-D1 physical bridge remains prospective.

**Decision gate:** no broadening into any physical model fit until a genuine map to the exact experimental observable, channel, units and uncertainty/likelihood is supplied.
