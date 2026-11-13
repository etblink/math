# Scientific method protocol for source-exact BFSS research

**Status:** standing research operating procedure; applies to numerical, symbolic, computational and formal investigations. **Authority:** [BFSS active roadmap](../../BFSS_ACTIVE_ROADMAP.md), [live gate checkpoint](../../BFSS_GATE_STATE.json). Original Lean source with exact strict-green evidence remains the mathematical authority. A successful calculation is not a source-exact proof, physical model theorem or experimental observation of nature.

This file turns the owner's eight scientific-method stages into an *audit trail* rather than a one-time report. [BFSS_EXPERIMENT_REGISTRY.json](BFSS_EXPERIMENT_REGISTRY.json) is the registry of explicit tests and decision rules; it is **not** a second live gate checkpoint. The first registered entry, `E-M7-001-R1`, is a **prospective replication of an existing exploratory result**, not a claim that the original calculation was preregistered.

## The eight stages: mandatory fields and exit rules

| Stage | Required BFSS deliverable | STOP condition |
| --- | --- | --- |
| **1. Observe** | State exactly what was seen, where (original source, numerical diagnostic, Lean error, outside paper, physical data), its SHA, and uncertainty | Do not conflate a model-computed feature with a laboratory observation |
| **2. Question** | Ask one precise mathematical/physical question, with an explicitly named carrier and quantifiers | “Could this be a ToE?” is not a testable numerical question |
| **3. Background** | Read the relevant original source code, qualified runs, rejected proofs, pinned monograph, and upstream Mathlib; list donors and known negatives | Do not rerun a known failed approach without specifying what's new |
| **4. Hypothesis** | One falsifiable claim with exact quantifiers, target observables, counterexample shape and alternative/null | If one finite numerical sample could never count against it, redesign |
| **5. Experiment** | Fix inputs, source blob pins, independent variable(s), dependent outputs, controls, random seeds, tolerance, deterministic arithmetic checks, protocol version and decision threshold *before* collecting new data | No hidden re-tuning or post-hoc selection without a new hypothesis/version |
| **6. Analyze** | Retain raw data, positive/negative controls, residuals, diagnostics, search limits, float precision and alternative hypotheses; use exact arithmetic where possible | Do not count 200 random successes as a theorem about all configurations |
| **7. Conclude** | `FALSIFIED`, `SURVIVED_FINITE_TESTS`, `INCONCLUSIVE`, or separately `LEAN_QUALIFIED` with *exact* run, consumer and source; state what remains open | No numerical pass may directly imply physical coercivity, eigenpairs or generations |
| **8. Communicate** | Commit versioned protocol, reproducible script, output receipt, code/inputs/provenance, discrepancies, and a specific roadmap decision | A chat-only result or an unindexed repo note is incomplete |

**Terminology:** `PROPOSED` means only hypothesis; `REGISTERED_NOT_EXECUTED` fixes a future test; `EXECUTED_UNREVIEWED` has raw evidence but no adjudication; `SURVIVED_FINITE_TESTS` has no known counterexample among tested inputs but **is not proved**; `FALSIFIED` has a reproducible counterexample to the *precise* claim; `INCONCLUSIVE` lacks decisive evidence; `LEAN_QUALIFIED` requires original-source exact theorem + independent consumer + accepted strict-green SHA/axiom audit. Printed symbols, editorial statuses and earlier sampled data never automatically imply qualification.

## Control policy for mathematical computations

For a controlled perturbation, vary a named geometric or physical parameter and hold all other assumptions and normalizations fixed. For a multidimensional phenomenon (e.g. nonlinear Gram singular-value interactions) include systematic factorial or boundary tests in addition to one-factor-at-a-time sweeps; explain why multiple variables are required. Separate:

- **Independent variables:** e.g. singular-value ratios, radial scale, gauge/Spin orientation, `m`, `β`, slice location, or search seed.
- **Dependent measurements:** ratio `||B(X)||/||X||`, residual of polynomial identity, coercivity margin, or candidate escape packet energy.
- **Positive controls:** source Clifford anticommutation, 48×48 skewness, exact tensor Gram, isotropic saturation when conjectured.
- **Negative controls:** deliberately wrong ordering, `θ²` factor, sign, field normalization, false sharp bound, source blob drift.
- **Independent replication:** compute an output using a distinct algorithm (e.g. direct 48×48 SVD vs reduced characteristic formula), not just twice through the same function.
- **Uncertainty:** track deterministic exact zero separately from floating-point residual and error tolerance; any anomalous sample is investigated at higher precision, not silently discarded.

Computational *theorems* have a different control: once a universal claim is proved in Lean, independent source consumers and exact CI pins replace sampling as the acceptance test. Physical conjectures additionally require the correct **original field**, SU(2) fixed space, closed form domain, and dynamical sector; no sample or formal result on a replacement carrier discharges these obligations.

## First registered prospective replication: E-M7-001-R1

**Background observation:** historical [A/B coefficient audit](../../contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py) and [P3 exploratory sharp-constant memo](../spectral-p2-original-field/P3_SOURCE_FERMION_SHARP_CONSTANT_EXACT_NUMERICAL_RESEARCH_2026_11_12.md) suggest a sharper norm constant for the **48×48 coefficient-derived CAR model**; this is not a certified equality with the literal original physical fermion field.

**Question:** For the exact source coefficient map `K0(X)` built from pinned `9×16×16` gamma and SU(2) epsilon tensors, do direct singular values agree with the reduced formula, and can any source configuration violate `||B_K(X)||/||X||≤16√(2/3)`?

**Hypotheses and falsifiers:**
- **H1 (finite coefficient-model conjecture):** for every `X≠0` in the actual 3×9 real configuration carrier, the CAR normal-form norm `||B_K(X)||=(√2/4)∑σ_j(K0(X))` is at most `16√(2/3)||X||`. A reproducible properly pinned `X` with a verified ratio greater than the candidate constant, beyond rounding uncertainty, **falsifies H1**. The zero case is treated separately.
- **H2 (spectral formula donor):** direct 48×48 norm agrees with `8√2 λmax(S(s1,s2,s3))` and the matrix polynomial `K0^6+2P K0^4+P²K0²+4D I=0`, with `P=||X||²`, `D=det(XXᵀ)`. Exact integer nonzero polynomial residual falsifies this matrix identity; floating disagreements require rechecking computation/precision.
- **H3 (physical transfer, NOT asserted):** the literal unnormalized `B_M^(1,0)` is exactly bound to this matrix with the required source 48-Majorana signs, CAR normalization and 16-charge coefficient. H1/H2 sampling **cannot** test H3 universally; it needs a separate exact source proof. H3 is deliberately excluded from numerical acceptance.

**Prospective independent variables:** shape of `(s1,s2,s3)` (rank one; rank two; rank-three isotropic; anisotropic; near valley), overall radial scale, signed/integer oblique coordinates and predetermined random seed. **Outcomes:** direct SVD ratio, independent reduced-eigenvalue ratio, maximum residual, inequality slack, saturation geometry, failure samples. **Fixed controls:** exact Git blob checks (gamma/epsilon/previous audit), 27×48×48 integer coefficient basis, `θ²=I/2`, 48 full singular values, independent source label permutation.

**Preset decision and tests:** run the existing pinned audit with its recorded 200-seed sample and 16 integer polynomial fixtures, *then* conduct an independently coded high-precision or exact-symbolic crosscheck, including orientation and scale covariance and adversarial near-valley configurations. Source drift or script failure means `INCONCLUSIVE`, **not** `FALSIFIED`. A norm violation reproducing under exact/high precision means `FALSIFIED`; a complete finite battery with no counterexample means `SURVIVED_FINITE_TESTS`, never `LEAN_QUALIFIED`. Preserve runtime/library versions and exact output/inputs. Do not retroactively label the original exploration as preregistered.

**Roadmap consequences:** If falsified, withdraw the sharp numerical recommendation; reopen M7 conservative bound or hunt a corrected inequality. If survived, propose an M7 **source-typed, exact polynomial/characteristic-multiplicity** gate with explicit original-field binding before any physical use. Neither outcome displaces **M1 D5-B4A**, the next authorized Lean proof. Run a separate experiment before revising the high-Spin oscillator threshold or coercivity conjecture.

## Communication and negative knowledge

A research outcome is not complete until its status and links appear in the experiment registry and (only when priority/obligation changes) the live roadmap. Never delete or overwrite a refuted idea: preserve the counterexample, underlying assumption and last source snapshot. Every hypothesis should say what conceivable observation would force us to abandon or weaken it.

**Scientific-method principle for this program:** We try to disprove our own claims early. The purpose of Python is not to make the math look persuasive; it is to help identify which exact original-source theorem deserves scarce Lean effort.
