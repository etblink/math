# C5A R1 pre-gate — original positive-regulator scalar/L-infinity ratio

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED; NOT LEAN QUALIFIED.
Reviewed baseline: 926f017b629ce9327e4c6f91c544c8e262131709.
C4C #43589307044 verified GREEN at c63c8c0be281d804495e8aa6334ad4f5689c9211, nine/sixteen reports and 215 pins. Commit this contract and acceptance/checkpoint BEFORE first new proof/consumer commit.

## Observation, question, hypothesis and reuse

Native w_epsilon(X)=sqrt(norm(X)^2+epsilon^2) already has exact square, positivity and continuity. Positive graph transport needs c_epsilon,delta=w_epsilon/w_delta. The literal ratio/L-infinity interface is absent in inspected current Kotler filenames and exact R0A/R0B1 source.

Question: can positive original ratios be source-qualified as continuous bounded complex fields and genuine L-infinity classes with correct inverse/reciprocal identities?
Hypothesis: ordered square comparison gives both parameter-order bounds; native MemLp/toLp/AE gives the class.

| Donor | Exact pin | Disposition |
| --- | --- | --- |
| R0A | a67f8740586588c6d4ee9c9148574c81c14d4937 | DIRECT REUSE square/positivity |
| R0B1 | d1cbb8077799236e5e1b82704270bdb9ab9153b4 | DIRECT REUSE continuity, actual reciprocal and MemLp/toLp/AE pattern |
| R0B2A/G0B0/C2B | accepted original sources reviewed in forward memo | DEFERRED FullL2/PiLp actions, no scalar prerequisite |
| Pinned Holder.holderL and Mul.lsmul | Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 | DEFERRED until an actual FullL2-action consumer |
| C4C | 0e234856784f0d427a1f1792151c158ad97802da | ACCEPTED predecessor, no new scalar dependency |

Coverage: current Kotler directory, exact R0A/R0B1, C4C source/consumer/workflow/logs, roadmap/state and preserved regulator memos. Not an exhaustive historical-branch census. Local Lean/lake unavailable.

## Fixed target and acceptance

Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC5AOriginalPositiveRegulatorRatio.lean
Namespace: FCP.BFSSP3AuxRADC5AOriginalPositiveRegulatorRatio
Only import accepted R0B1; retain original Boson 2 and volume. Ten roots:
- originalRadialWeight_mono
- originalRadialWeight_scaled_le
- originalRegulatorRatioField
- originalRegulatorRatioField_continuous
- originalRegulatorRatioField_norm_le
- originalRegulatorRatioField_mul_reverse
- originalReciprocalField_mul_ratio
- originalRegulatorRatioField_memLp_infty
- originalRegulatorRatioLpInf
- originalRegulatorRatioLpInf_ae

For 0<delta<=epsilon prove w_delta<=w_epsilon and delta*w_epsilon<=epsilon*w_delta. Define complex ratio, prove continuity (denominator positivity suffices), norm bound max(1,epsilon/delta), ratio times reverse =1 and reciprocal_epsilon * ratio = reciprocal_delta. Then MemLp infinity, toLp and exact AE field identity. Retain positive parameters wherever required.

Consumer: lean/diagnostics/BFSSP3AuxRADC5AOriginalPositiveRegulatorRatioIndependentConsumer.lean
Workflow: .github/workflows/bfss-p3-aux-rad-c5a-original-positive-regulator-ratio-strict.yml
Import candidate and G4J. Exercise all ten contracts on original Boson 2/literal L-infinity measure, original paired physical/FullL2 anchors, and independent origin and equal-parameter controls. Audit ten new roots plus:
- FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_sq
- FCP.BFSSP3AuxR0AOriginalRadialScalar.originalRadialWeight_pos
- FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalRadialWeight_continuous
- FCP.BFSSP3AuxR0B1OriginalReciprocalLpInfinity.originalReciprocalLpInf_ae

Freeze every existing transitive OAI source to reviewed 926f017b629ce9327e4c6f91c544c8e262131709; explicit Core/G4J/R0A/R0B1 pins. Only two new candidates differ. CI measures pin count; never invent it. Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612. Cold OAI build, fresh warning-as-error source/consumer, exact ten/fourteen report order, standard axioms only. Persist logs/manifest; no proof-budget or warning-policy change.

## Falsifiers and decisions

Wrong ratio orientation, positivity dropped, one-order bound advertised general, surrogate configuration/measure, AE mistaken for pointwise equality, failed native controls, source drift, warning or disallowed axiom blocks qualification. Compiler red is RED_UNQUALIFIED, not mathematical falsification; preserve first causal evidence before bounded repair; after two related reds isolate the interface.

GREEN qualifies scalar/L-infinity only. No FullL2/PiLp ratio action, common charge/Hamiltonian domain, form order, resolvent, epsilon zero, zero-mode existence, Hardy/gap or paper-source promotion. No numerical sampling or mathematical Python experiment.

## Exact launch binding — 2026-11-14 Pacific

Pre-gate receipt and C4C acceptance checkpoint committed at `1b22f133ac68fb18d80392685d7db9ebaf01dbc1` before new source. [Strict #43591940771](https://github.com/etblink/math/actions/runs/43591940771) tests exact `aee1979bc64e90cca0f75e67e3341c0bc8bc5d93`, job #132438328870. Source `eabd26ec2a72043e622d634a6366f4b3ed5eaf77`, consumer `8e276ff96ce82e7b5fe4fd81ec5bb37241142193`, workflow `c2b7e9f0dadcd53c0f6c785d50c4fc90a2110c85`. Checkout/preflight pending at binding. Administrative #43591940743 separate. **UNQUALIFIED pending exact cold source/consumer and axiom audit.**
