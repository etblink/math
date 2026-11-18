# SM-P0 — physical observable feasibility review after SCC3B0/B1

**November 18, 2026 | READ-ONLY EVIDENCE REVIEW / NO NEW MODEL QUALIFICATION**

## Decision and motivation

The formally qualified SCC1→SCC3B0 mathematical sequence and independently qualified SCC3B1 decision-methodology successor now distinguish (i) exact positive marginal predictions, (ii) genuinely missing model/measurement maps, (iii) invalid typed comparisons and (iv) absence of joint likelihood/covariance data. They are tools to seek physical truth; their existence is **not evidence for BFSS, NFC, SCC, or any theory**.

**STOP building general comparison machinery merely for more GREEN gates.** The next bounded research target should be a *real, source-versioned particle-physics observable bridge*. This memorandum reviews only the existing, independently archived SM-D0 ledger (not a current global fit). No new sources are searched, experimental values imported, likelihood calculated or original files altered.

## First candidate: a neutrino oscillation observable as a conditional control

Use the accepted empirical ledger `research/standard-model/data/SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json`, immutable blob `1d391ba994ee23f03c4423b45fbb15e7e42c86f1`.

- `juno_dm2_21_2026`: first JUNO 59.1-day reactor-antineutrino analysis, central `0.0000750 eV²`, reported `±0.0000012 eV²`, source date 2026-06-10, specified normal-ordering analysis convention. Original peer-reviewed source DOI `10.1038/s41586-026-10538-z`.
- `juno_sin2theta12_2026`: same JUNO analysis, `sin²θ12=0.3092 ±0.0087`, dimensionless. **These two fitted quantities are correlated**, not independent likelihood factors. The frozen ledger does **not** supply their full joint covariance/likelihood.
- A conditional physics observable interface starts with mass eigenvalues and the precise definition `Δm²21=m₂²−m₁²`, in `eV²`, a mass-ordering choice, and mixing-basis convention. Invariance under `m_i² → m_i²+c` is an exact symbolic control; oscillations alone cannot fix a common absolute-mass offset. This is **not a source-derived physical prediction**, nor a bound on the absolute neutrino mass.
- The minimal Standard Model one-family anomaly ledger SM-Y0 is not a neutrino mass-generation derivation. The observed oscillation parameters can be inputs to a suitable neutrino-extended phenomenological parametrization; fitting them is not a predictive success of a foundational model.

**Proposed next intake target** `SM-P0N0`: type the `Δm²21` measurement definition and error representation; prove/independently test the common-offset invariance as a negative control; record explicitly whether a candidate supplies an independently calculated eigenvalue mass-square splitting under the same ordering and units.

## Candidate model statuses — no invented predictions

| Candidate | Current source-derived `Δm²21` prediction? | Decision |
|---|---|---|
| Neutrino-extended SM parameterization | A fit/input interface is possible; no independent source-predicted splitting established by this ledger | `FIT_INPUT_NOT_PREDICTION` |
| BFSS matrix-model research branch | No independently qualified map from original BFSS sector to 3+1-dimensional chiral neutrino mass eigenstates and JUNO protocol | `MISSING_PHYSICAL_MAP` |
| Archived NFC / protected-persistence hypotheses | No independently qualified numeric neutrino-to-JUNO prediction and tested physical embedding | `MISSING_PHYSICAL_MAP` |
| Other candidate frameworks | No predictions supplied or verified in this intake | `NOT_ASSESSED` |

An unavailable map is a **documented testability limitation**, not a numerical model failure or support. Avoid treating a choice of fitted values as a prediction.

## Controls against premature inference

1. Pin the exact paper, analysis ordering, units `eV²`, data snapshot, and whether reported errors are statistical, systematic or total. Do not invent a covariance matrix or multiply the two JUNO marginal likelihoods.
2. If we model one marginal statistically, first obtain the collaboration-reported likelihood/error definition; otherwise compare only symbolic equality, units and known source input status. `±` alone does not license a Gaussian likelihood.
3. A candidate asserting a neutrino mass matrix must source its matrix entries, diagonalization convention, eigenvalue ordering and scale. Only then compute the splitting as a candidate prediction and compare.
4. The physically essential BFSS obstacle — deriving a 3+1D chiral Standard Model sector with the correct gauge/mixing degrees of freedom — remains an open model-to-observable obligation, not solved by mathematical Spin(9)/Fock theorems.
5. Contrast independent empirical controls: the ledger also contains CMS W and Higgs measurements (W mass needs an electroweak calculation and stated input scheme; Higgs mass is an SM fitted parameter), and channel-specific proton-decay limits (only models deriving the exact final-state lifetime can be tested). Do not confuse a parameter fit or unrelated decay channel with a falsifying prediction.
6. Source recheck before new quantitative phenomenology: SM-D0 is an as-of 2026-11-18 curated snapshot, nonexhaustive and not a live PDG average.

## Next bounded decision gate

Create `SM-P0N0` as a **source-exact physical-interface specification and symbolic negative control**, not a new generic SCC gate. Require explicit PASS/FAIL/UNKNOWN checks for: mass-squared definitions, units, ordering, proven origin of mass-eigenvalue inputs, covariance/likelihood availability and versioned primary empirical provenance. Stop if the physical maps are absent and write a precise `MISSING_PHYSICAL_MAP` certificate instead of fabricating numeric values.

**Gate status:** `PROPOSED_READ_ONLY_REVIEW`. No repo source/theorem/data or SM/BFSS gate state is changed by this note; full physical `SM-D1` stays `PROSPECTIVE_UNSTAGED`, W0C2B2 stays `BLOCKED`, original BFSS 27 anchors intact.
