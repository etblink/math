# SM-Y0 — independent one-family Standard Model hypercharge anomaly benchmark (pre-gate)

**Project Lead, 2026-11-18. Truth-seeking research independent of BFSS.** This is a **prospective** strict Lean gate, not a completed or accepted theorem until source and independent consumer compile at the exact tested commit and all axiom reports pass; acceptance is separate from BFSS canonical anchors.

## Why this gate is worth doing

We investigate *what is true about the universe*, using the Standard Model as an empirical benchmark rather than selecting BFSS as a favored conclusion. The Standard Model's left-handed Weyl multiplets and experimentally supported gauge content provide a concrete, falsifiable input ledger. Independent mathematical consistency checks can be reused across candidate underlying theories to **reject incorrect proposed representations** before costly unification interpretation.

Primary physics context: [2026 PDG Standard Model review](https://pdg.lbl.gov/2026/reviews/standard_model_and_related.html), [CERN Standard Model](https://home.cern/science/physics/standard-model/). Related program documents: [truth-first charter](../methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md), [SM0 empirical requirements atlas](SM0_TRUTH_FIRST_EMPIRICAL_REQUIREMENTS_ATLAS_2026_11_18.md), [exact reusable Mathlib/BFSS interfaces audit](SM0_REUSE_AUDIT_MATHLIB_BFSS_SPIN10_CHIRALITY_2026_11_18.md).

## Exact physical input and assumptions

All fields are **left-handed Weyl conventions**, physical right-handed fermions represented by **left-handed charge conjugates**. Hypercharge (Y) uses (Q_{\rm electric}=T_3+Y). One ordinary minimal generation (no singlet right-handed neutrino) comprises:

| Multiplet | Source SU(3) rep | Source SU(2) rep | Y |
|---|---|---|---|
| \(Q_L\) | 3 | 2 | \(+1/6\) |
| \(u_R^c\) | anti-3 | 1 | \(-2/3\) |
| \(d_R^c\) | anti-3 | 1 | \(+1/3\) |
| \(L_L\) | 1 | 2 | \(-1/2\) |
| \(e_R^c\) | 1 | 1 | \(+1\) |

The **SU(3)/SU(2) representations and multiplicities are externally supplied inputs**, not derived from BFSS, Spin(10), a new spacetime, or Lean. A five-field rational charge structure records these hypotheses explicitly, rather than hiding them inside a goal whose conclusion is tautologically zero.

Four coefficient polynomials (common non-Abelian Dynkin-index factors omitted, not physical couplings):
- Color–hypercharge: \(2Y_Q +Y_{u^c}+Y_{d^c}\).
- Weak–hypercharge: \(3Y_Q+Y_L\).
- Cubic Abelian: \(6Y_Q^3+3Y_{u^c}^3+3Y_{d^c}^3+2Y_L^3+Y_{e^c}^3\).
- Mixed gravitational–Abelian: \(6Y_Q+3Y_{u^c}+3Y_{d^c}+2Y_L+Y_{e^c}\).

Separately, \(3+1=4\) weak doublets is even, the familiar elementary parity condition relevant to the SU(2) global anomaly. **This is an arithmetic parity certificate, not a formalized anomaly-index theorem.** The source also changes (Y_Q\) to zero as a negative-control ledger and proves the color and weak mixed coefficients become nonzero.

## Source and consumer contracts

- Independent **non-BFSS** source `lean/OAI/MathematicalPhysics/StandardModel/Contrib/Kotler/SMY0OneFamilyAnomalyLedger.lean` (Git blob `481a984b5ba7d2d7df41297d162ab1d608646d6e`), importing only `Mathlib.Tactic`. Nine theorem roots + nine `#print axioms` reports: four zero coefficients, combined predicate, even-doublets parity, two perturbed nonzero coefficients, and perturbation failure.
- Separate importing `lean/diagnostics/SMY0OneFamilyAnomalyIndependentConsumer.lean` (Git blob `082492122e15f5f73a24b086ea1e3c4ae71527df`). Eight source-target consumer theorem roots + eight axioms reports, three concrete control examples. Explicit charge assumptions independently checked as values, not merely imported under renamed constants.
- Workflow `.github/workflows/sm-y0-one-family-hypercharge-anomalies-strict.yml`, pinned toolchain Lean **4.34.1**, Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612`; strict cold `lake build`, independent `lake env lean` source+consumer, no `sorryAx` nor extraneous axioms beyond `propext`, `Classical.choice`, `Quot.sound`; six adversarial audit mutants must be rejected. Original complete job and provider artifact must be archived independently with checksums on native GREEN or RED.
- Exact donor governance checks: truth-first charter, SM0 evidence and reuse documents, original E2 proof and both independent archived REDs, 27 BFSS anchors and original blocked canonical state. **No BFSS module imported** and **no changes to BFSS canonical state**.
- This is a new standalone Standard Model research result and must never count as a twenty-eighth accepted BFSS anchor.

## What this can and cannot establish

**Can establish:** given these exact supplied representation multiplicities and hypercharges, four local perturbative anomaly coefficients vanish as rational identities, while a one-field charge perturbation fails; an even weak-doublet count is separately certified.

**Cannot establish:** correctness of the Standard Model representation assumptions from first principles, anomaly-free quantization in full QFT, SU(3)^3 and SU(2)^3 local anomaly theorems in generality, global-form subtleties, gauge group emergence, right-handed-neutrino structure, why there are three generations, observed masses, Higgs or Yukawa dynamics, unification, dark matter, quantum gravity, or any discovery beyond existing particle physics.

## Decision on next work

If SM-Y0 qualifies, the next independent SM-S0 candidate should construct `ExteriorAlgebra ℂ (Fin 5 → ℂ)`, distinguish 16-dimensional even and odd degree sectors by an explicit finite basis, then test 5-mode creation/annihilation (Clifford) relations. The Spin(10) chiral-spinor relationship is a *mathematical hypothesis to verify with exact algebra maps*, not a conclusion drawn from dimension 16 alone. In parallel, a separate observational/experimental data baseline should track 2026 PDG quantities with uncertainties, not copied approximate numbers.

**Governance:** BFSS E2 R1 was consumer-recursion RED; E2 R2 was consumer Lean-syntax RED, both original source-compiled and independently preserved. Neither establishes a false mathematical identity. New SM work has no dependency on their eventual resolution.
