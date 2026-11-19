# SM-P0N6 — Pre-JUNO Littlest Seesaw RGE fit-input leakage and frozen temporal holdout

**2026-11-18 | SOURCE-BOUND RETROSPECTIVE FROZEN-POINT SCREEN, NO STATISTICAL MODEL EXCLUSION, NO NEW CI OR FORMAL GATE.**

**Parent:** SM-P0N5 at `378655474c70ec38bf855fd6bf9743fa9b362708`. **Canon:** `integration/bfss-unified-research-20261108` only. No edits to accepted Standard Model ledgers, FCP `main`, the 27 accepted BFSS anchors, or the blocked W0C2B2 source gate.

## Project Lead decision

**The input-leakage audit is complete.** Both major 2018 RGE studies fitted the solar mixing angle **and** solar mass splitting using then-available data; their published solar central values are not parameter-free predictions, even though the model's flavor restrictions are nontrivial. Because both papers predate September 2026, **the exact published 2018 frozen central outputs can be challenged out-of-time by JUNO 207.2d without retuning**. This is a useful historical *temporal holdout screen*, not a preregistered 2018 prospective JUNO study or a calibrated model exclusion.

**Source-exact adverse observation:** all eight inspected, published fixed benchmark points predict `sin²theta12` **above** the 2026 JUNO central value `0.3036`. Their splitting predictions differ in both directions depending on the case and do not all move together with the solar mixing residual. **No joint chi-square, model-wide range, confidence interval, parameter re-optimization, RGE reproduction or significance is inferred.** The paper-specific historical χ² values cannot be combined or transported into 2026.

## 1. Frozen source objects and chronology

**G&K / 6 April 2018:** Tanja Geib and Stephen F. King, *Comprehensive renormalization group analysis of the littlest seesaw model*, Phys. Rev. D 97, 075010. Source PDF: https://scoap3-prod-backend.s3.cern.ch/media/files/24829/10.1103/PhysRevD.97.075010.pdf .

- Section IV and **Table I, printed p. 7**, define five fit inputs, including `sin²theta12=0.306±0.012`, `sin²theta13=0.02166±0.00075`, `sin²theta23=0.441 (+0.027/-0.021)`, `Δm²21=(7.50 +0.19/-0.17)×10^-5 eV²`, `Δm²31=(2.524 +0.039/-0.040)×10^-3 eV²`. A second fit optionally included δ. These were **2017-era source-window global-fit observations**. Explicitly `n=3` and `η=±2π/3` were fixed; the numerical scan adjusted `(m_a,m_b)` against the data. Thus the previous solar data were *fit inputs*.
- **Table II, printed p. 8** lists `m_a,m_b` best-fit parameters for SM cases A–D and specified heavy-singlet settings. The nominal running starts at `2×10^16 GeV` and ends at `1000 GeV`; it is not a fully evolved contemporary laboratory likelihood.
- **Figures 1–4, printed pp. 9–10** give separately rounded EW-scale `theta12`, `theta13`, light masses and phases for the `(M_atm,M_sol)=(10^12,10^15)` GeV A/B and reversed `(10^15,10^12)` GeV C/D settings. These are the exact four frozen numeric points transcribed below.
- The original paper's historical ranking `D>C>B>A` by its then-defined χ² was driven substantially by the old atmospheric-angle input. This does not imply D wins against 2026 data.

| G&K case | `M_atm` GeV | `M_sol` GeV | `m_a` meV | `m_b` meV | 2018 source χ² — OLD FIT ONLY |
|---|---:|---:|---:|---:|---:|
| A | 1e+12 | 1e+15 | 39.505 | 4.1592 | 7.14042 |
| B | 1e+12 | 1e+15 | 39.498 | 4.2031 | 4.38607 |
| C | 1e+15 | 1e+12 | 47.226 | 4.1757 | 3.23646 |
| D | 1e+15 | 1e+12 | 47.198 | 4.1913 | 1.49388 |

**KSR / 29 October 2018:** Stephen F. King, Susana Molina Sedgwick and Samuel J. Rowley, *Fitting high-energy Littlest Seesaw parameters using low-energy neutrino data and leptogenesis*, JHEP 10 (2018) 184. Primary PDF: https://link.springer.com/content/pdf/10.1007/JHEP10(2018)184.pdf .

- **Table 1, printed p. 13** adopts NuFit3.2, explicitly including `theta12=33.62 +0.78/-0.76°` and `Δm²21=(7.40 +0.21/-0.20)×10^-5 eV²`, alongside reactor/atmospheric angles, atmospheric splitting, δ and `Y_B=0.87±0.01×10^-10` from the paper's Planck-based baseline.
- Unlike G&K's fixed heavy-singlet masses and two-variable scan, this paper fitted **four real high-scale parameters `(a,b,M_atm,M_sol)`** to **seven observables** (six neutrino and baryon asymmetry), with three nominal degrees of freedom, using REAP threshold matching and low-energy evolution to **M_Z**, not G&K's 1000 GeV endpoint. The sources' historical χ² and their inferred parameters therefore cannot be directly pooled.
- **Tables 2–3, printed pp. 14–15** report A1, D1, A2, D2 fitted points. A1/D1 use `Λ_GUT=1×10^16 GeV`; A2/D2 use `2×10^16 GeV`. As the paper explains, the solar angle was itself part of the global fit and provided a sizeable historical tension/pull. Their results support a constrained model family, not a uniquely parameter-free PMNS number.

| KSR case | `Λ_GUT` GeV | `M_atm` GeV | `M_sol` GeV | `a` | `b` | 2018 χ²/dof — OLD FIT ONLY |
|---|---:|---:|---:|---:|---:|---:|
| A1 | 1e+16 | 5.10e+10 | 3.28e+14 | 0.00817 | 0.215 | 1.51/3 |
| D1 | 1e+16 | 1.59e+12 | 1.08e+10 | 0.0456 | 0.00117 | 2.64/3 |
| A2 | 2e+16 | 5.05e+10 | 5.07e+13 | 0.00806 | 0.083 | 1.76/3 |
| D2 | 2e+16 | 1.36e+13 | 1.06e+10 | 0.135 | 0.00116 | 2.07/3 |

## 2. Independent later measurement — observables and calculation boundary

JUNO Collaboration, *Measurement of Neutrino Oscillation Parameters at JUNO and Indication of the Neutrino Mass Ordering*, **arXiv:2609.37895v1**, submitted 2026-09-29, 207.2 live days/8,294 IBD candidates: https://arxiv.org/abs/2609.37895v1 .

**Frozen later observed central values** (not independent of the overlapping June 2026 59.1-day JUNO analysis):

```
sin²(theta12)         = 0.3036 ± 0.0064
delta_m2_21           = (7.388 ± 0.078) × 10^-5 eV²
```

The first observable is derived from the 2018 papers' **frozen `theta12` tables** via `sin²(theta12 × π/180)`. The second is read directly from KSR **Table 3**, or for G&K is derived as `(m2_meV × 1e-3)^2` under the model's documented `m1=0`. Both solar observables enter the same JUNO analysis, and the joint covariance/likelihood is NOT imported. Do not assume statistical independence or invent a two-dimensional likelihood.

The next table's mass-splitting columns are in **units of `10^-5 eV²`**; the signed residual is model frozen value **minus** the 2026 JUNO central value.

| Frozen source case | Published θ12 | Derived sin²θ12 | Solar sin² residual | Frozen Δm²21 (×10⁻⁵) | Splitting residual (×10⁻⁵) |
|---|---:|---:|---:|---:|---:|
| G&K A | 34.0683° | 0.313802 | +0.010202 | 7.4506 | +0.0626 |
| G&K B | 34.0472° | 0.313461 | +0.009861 | 7.5820 | +0.1940 |
| G&K C | 34.3651° | 0.318620 | +0.015020 | 7.5709 | +0.1829 |
| G&K D | 34.3572° | 0.318491 | +0.014891 | 7.6233 | +0.2353 |
| KSR A1 | 34.20° | 0.315938 | +0.012338 | 7.4300 | +0.0420 |
| KSR D1 | 34.32° | 0.317887 | +0.014287 | 7.3300 | -0.0580 |
| KSR A2 | 34.30° | 0.317562 | +0.013962 | 7.3600 | -0.0280 |
| KSR D2 | 34.33° | 0.318049 | +0.014449 | 7.3400 | -0.0480 |

All eight selected frozen points have `sin²theta12 > 0.3036`. Importantly, their `Δm²21` residuals do **not** have the same sign in every case (some KSR points undershoot), so a one-parameter 'common shift' of all predictions is not a demonstrated model correction. The 2018 points are different models/fit definitions, **not eight independent observations** and not a confidence envelope across CSD(3) parameter space.

This is exactly why **we do not compute a significance** from displayed marginal ± values: missing joint JUNO covariance/response, theory matching/running uncertainties, historical parameter covariance, and source-defined model-specific likelihood. JUNO 207d and 59d analyses must never be combined as independent samples.

## 3. Fit-input leakage and causal inference matrix

| Question | Geib & King (2018) | King, Sedgwick & Rowley (2018) |
|---|---|---|
| Was **solar angle** used to optimize historic parameters? | **YES**: Table I `sin²theta12` | **YES**: Table 1 `theta12` |
| Was **solar splitting** used to optimize historic parameters? | **YES** | **YES** |
| How many continuous free inputs were fitted? | Two: `m_a,m_b`, at fixed heavy masses and discrete texture/phase | Four: `a,b,M_atm,M_sol` |
| External physical constraint included? | Five oscillation inputs; δ optional | Six oscillation inputs plus Planck-based baryon asymmetry |
| Was JUNO's September 2026 source used? | **NO**, impossible chronologically | **NO**, impossible chronologically |
| Are reported numbers held out from **original fit**? | **NO** | **NO** |
| Are the same immutable historical numbers checkable on **later data**? | **YES** | **YES** |
| Is the historical χ² a contemporary 2026 test statistic? | **NO** | **NO** |

**Comparison interpretation:** this is a **retrospective out-of-time model check** with a fixed published 2018 point. It is not (a) a prediction of the 2018 input data made without those inputs, (b) a predeclared 2018 JUNO challenge, (c) a globally refitted 2026 Littlest Seesaw prediction, or (d) a physical confirmation/refutation of BFSS, NFC, FCP or a whole neutrino mechanism family.

## 4. Adversarial FCP/SCC controls

1. **Data and model chronology:** require source publication date, actual fitting input set, exact high-scale point, and observation date. A historical fit can be a frozen baseline for later tests, but fits must not be mislabeled independent predictions of the data used to make them.
2. **Strata are not exchangeable:** Geib–King cases A–D at 1000 GeV and fixed heavy masses are not the same parameter-defined objects as KSR A1/D1/A2/D2 at `M_Z` with heavy masses fitted to leptogenesis. Different global fit datasets also change which old point minimizes source χ².
3. **Counterfactual refit:** allowing arbitrary reoptimization of `m_a,m_b`, `a,b,M_atm,M_sol`, texture direction or charged-lepton corrections **after viewing JUNO** is a new model-selection exercise. If a source-predeclared allowed parameter region and valid likelihood cannot be recovered, that updated model is not independently predictive on this same JUNO result.
4. **Strict vs RG-corrected:** exact high-scale TM1 remains a conditional texture consequence; RG running with threshold effects can alter low-energy angles. The 2018 frozen values are concrete corrected instances; neither four-point list spans the full model family, nor do these source examples prove RGE cannot accommodate the data.
5. **Weaker-model subtraction:** the TM1 relation is shared across models; rank two and one zero mass are not unique LS indicators. No BFSS/NFC-to-lepton map exists in the qualified source scope. FCP's neutrality firewall blocks all framework-level credit.

## 5. Decision after the bounded audit

**SM-P0N6: COMPLETE / HISTORICAL_FIT_LEAKAGE_IDENTIFIED / TEMPORAL_2026_SCREEN_ADVERSE / MODEL_WIDE_EXCLUSION_NOT_ESTABLISHED.**

There is now a reproducible, source-exact reason **not** to claim a successful rescue or a categorical exclusion. The paper variants share a constrained flavor idea but differ in parameters, experimental input epochs and RGE endpoint. The 2026 JUNO solar central values are below all eight inspected *2018 frozen benchmark points*, providing an honest **negative out-of-time diagnostic**.

**Next-step stop rule:** do not undertake an expensive RGE rebuild or optimize a new fit until one can recover (i) a source-antecedent allowed parameter region and independent theory-error treatment, (ii) the complete observable vector and threshold matching, and (iii) the proper experimental joint likelihood. Otherwise mark `FROZEN_POINTS_ADVERSE__FAMILY_UNRESOLVED` and consider other testable physics. The absence of those ingredients cannot be repaired with an arbitrary Gaussian significance or a new Lean 'green' gate.

The companion JSON is an exact finite source + observed-input ledger; the companion Python script checks calculations and fails closed if the required status flags are removed. This audit does **not** contain a complete independent REAP RGE simulation or a full experimental fit.

**Primary source/figure inspection:** G&K DOI https://doi.org/10.1103/PhysRevD.97.075010 (Tables I–II; Figs 1–4), KSR DOI https://doi.org/10.1007/JHEP10(2018)184 (Tables 1–3), official JUNO v1 https://arxiv.org/abs/2609.37895v1. FCP evergreen `etblink/Foundational-Convergence-Program@research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md` supplies decision discipline, not BFSS or SM physical qualification.
