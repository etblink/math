# SM-P0N8 — Model-neutral 0νββ inverted-ordering witness and BFSS lessons

**Date:** November 18, 2026. **Parent:** SM-P0N7 unified-branch commit a0582bcd50984d6a4a34e74e5715e7f169cf16f0.

**Status:** SOURCE_BOUND_CONDITIONAL_MATH_RESULT; INDEPENDENT_LOCAL_CONSUMER_PASS; NO_CI; NO_QUALIFIED_NUCLEAR_RATE; NO_EXPERIMENTAL_EXCLUSION.

## Scientific motivation

**Seek truth, not validation of the Standard Model, BFSS, NFC, or any preferred framework.** The experimentally successful Standard Model is a benchmark rather than a theory we need to prove. We are free to reuse independently valid mathematics and physical mechanisms from any theory and eventually develop a new model when it supplies a genuinely independent, falsifiable prediction. The same adversarial evidentiary standard applies to every candidate.

**Question:** Does inverted neutrino mass ordering enforce a nonzero neutrinoless double-beta-decay rate for every model? **No.** Under the three-light-Majorana-neutrino, approximately unitary PMNS, standard light-neutrino-exchange assumptions, inverted ordering and the measured central mixing inputs yield a strictly positive **light-neutrino effective mass** for any lightest mass. The isolated amplitude floor is NOT a general total nuclear decay-rate floor, because Dirac sectors or additional coherent lepton-number-violating mechanisms change the physical operator.

The known IO mass floor and NO cancellation region have been previously studied. See Penedo and Petcov, The meV frontier of neutrinoless double beta decay in the JUNO era (2026), arXiv:2603.06787. This checkpoint is a source-pinned independent reproduction and methodological transfer, not discovery of a new physical law.

## BFSS architecture and evidence layers

| Layer | Claim | Qualified here | Still missing |
|---|---|---|---|
| 0: abstract structure | Exact phase-optimized three-vector triangle inequality and a bound uniform in the lightest IO mass | Conditional derivation and independent local numerical consumer | Nothing about physical lepton realization |
| 1: original source specialization | PMNS electron weights, actual ordering and eV/eV², 2026 JUNO and 2023 Daya Bay source versions | Frozen central inputs and correct units | Full experiment joint covariance / source-to-model independent parameter prediction |
| 2: physical nuclear operator | The light-Majorana exchange rate requires nuclear phase-space and NME, and could interfere with other LNV amplitudes | Correct typed mechanism and limitations identified | Isotope NME values, theory error, operator matching, physical half-life forecast |
| 3: experimental consumer | KamLAND-Zen xenon-136 and LEGEND-200 germanium-76 bounds | Separate published limits, descriptive conditional reach factors | Signal-level likelihood, cross-isotope correlated NME treatment, exclusion |

This faithfully applies the successful BFSS rule: **structure → original specialization → discharge → composition**. Keep original types, mass labeling, signs, units and hypotheses. Maintain distinct math source and independent consumer, exact Git bytes, negative tests, first-causal-failure diagnosis, and immutable accepted ancestors. A local Python PASS is not Lean kernel acceptance or an empirical physics claim.

## Mathematical core

Let w=(w1,w2,w3)=(cos²θ12 cos²θ13, sin²θ12 cos²θ13, sin²θ13), with sum w=1. For three light Majorana masses mi and arbitrary relative Majorana phases,

m_bb = |w1 m1 + w2 m2 exp(i α) + w3 m3 exp(i β)|.

The exact phase-optimized interval for three nonnegative lengths ai=wi mi is

m_bb ∈ [max(0, 2 max(ai) − Σai), Σai].

For inverted ordering, write x=m3≥0, A=|Δm²31(IO)|>0, d=Δm²21>0; then m1=√(x²+A), m2=√(x²+A+d). Because m2−m1=d/(m2+m1)≤d/(2√A), the reverse triangle inequality gives

m_bb ≥ (w1−w2)√(x²+A) − w3 x − w2 d/(2√A).

For the measured central mixing inputs w1−w2>w3, and the infimum over all x≥0 follows analytically:

**m_bb(IO) ≥ √A √[(w1−w2)²−w3²] − w2 d/(2√A).**

The identity inf_{x≥0} [a√(x²+A)−b x] = √A√(a²−b²) for a>b≥0 supplies the uniform-in-lightest proof. The numerical one-dimensional minimization below is a separate diagnostic, not the global proof.

## Source-pinned inputs and conditional numerical results

JUNO September 29, 2026 preprint arXiv:2609.37895v1: sin²θ12=0.3036, Δm²21=7.388×10⁻⁵ eV², Δm²31(IO)=−2.482×10⁻³ eV², Δm²31(NO)=+2.509×10⁻³ eV². Daya Bay 2023 reactor sin²(2θ13)=0.0851, inverted on its small-reactor-angle branch. The JUNO atmospheric estimates involve an external Daya Bay constraint; its 207.2-day data overlap the earlier 59.1-day source and must not be treated as independent.

Derived electron weights: w1=0.6812547106347544, w2=0.29699731497517434, w3=0.0217479743900712.

| Scenario and precise assumption | Central-input result | What it does NOT mean |
|---|---:|---|
| IO, exactly m3=0, arbitrary phases | 18.92498–48.95480 meV | Not the general any-mass range |
| IO, **any m3≥0**, rigorous analytic lower guarantee | **18.89268 meV** | Not a statistical CL or unconditional nuclear-rate floor |
| IO, numerical minimum for m3 in 0–120 meV | ≈18.89463 meV at m3≈2.79276 meV | Diagnostic, not proof of globality |
| NO, m1=4 meV and constructed relative phases | **0 meV possible** | Not an observed phase |
| IO, hypothetical sin²θ12=0.5 and m3=20 meV | **0 meV possible** | Changed-input counterexample, not a physical fit |

A separate independent complex-vector consumer explicitly constructs NO phases producing zero amplitude. It also verifies phase-geometry extrema across several IO mass examples and checks source-conditioned reach factors. All quoted values are central-input arithmetic, **not** a new parameter-free prediction of the oscillation data.

## Physical mechanism boundary

Under light-Majorana exchange dominance only, a nucleus-specific half-life is of the schematic form

1/T_half(X) = G_0ν(X) g_A^4 |M_0ν(X)|² |m_bb/m_e|²,

with convention-dependent definitions of phase space, g_A, and NME. No original isotope NME, theory-error distribution or phase-space factor is imported. Hence **NO physical half-life forecast** is qualified.

In general a lepton-number-violating EFT can instead have coherent contributions A_total(X)=A_light(X)+A_heavy(X)+A_contact(X)+..., with differing mass-dependent nuclear responses and phases. An algebraic fixture A_other(X)=−A_light(X) demonstrates why a positive isolated light-amplitude floor does not imply a universal total-rate floor **for one isotope**. This fixture is NOT a sourced viable UV theory. Distinct isotope responses and other channels can potentially break that degeneracy, but have not been evaluated here.

Exact lepton-number-conserving Dirac neutrinos can reproduce standard oscillation data without a standard light-Majorana 0νββ contribution. The Majorana mass formula does not become a Dirac decay prediction by substituting equal masses. Likewise a BFSS 0+1D Spin(9) mathematical construction is not an accepted physical 3+1D neutrino/charged-current map.

2026 independent evidence: a sterile-neutrino χEFT study models mass-dependent nuclear amplitudes (European Physical Journal C, DOI 10.1140/epjc/s10052-026-15826-6); an ab initio nuclear study combines actual experiment likelihoods and isotope theory (Physical Review D 114, 013007, DOI 10.1103/rsw5-57fz). This checkpoint does not reproduce their full theory.

## Source-verified isotope experiment comparison

| Experiment | Isotope | Published 90%-CL half-life lower bound | Light-Majorana NME-conditioned effective-mass upper limits |
|---|---|---|---|
| KamLAND-Zen complete 800 (Dec. 2025) | 136Xe | T_half > 3.8×10²⁶ years | m_bb < 28–122 meV |
| LEGEND-200 + GERDA + MAJORANA (Jan. 2026) | 76Ge | T_half > 1.9×10²⁶ years | m_bb < 75–200 meV |

Both NME-dependent upper-limit ranges remain above the conditional 18.893-meV floor. The endpoint ranges correspond to differing nuclear calculations; they are **not** 1σ probability bands. An independent 2026 nuclear-theory review quotes a wider 25–138 meV KamLAND-related interval under another NME/contact treatment. Never average or statistically multiply the quoted isotope bounds without a common source-accepted likelihood and correlated NME theory.

For a fixed SAME isotope and fixed NME, under pure light-neutrino exchange, the symbolic half-life scaling to a hypothetical floor F from an effective-mass bound L is (L/F)²:

| Isotope | Source favorable NME limit end | Other source NME end |
|---|---:|---:|
| 136Xe, 28–122 meV | 2.1965× | 41.6997× |
| 76Ge, 75–200 meV | 15.7592× | 112.0658× |

**These are not exposure requirements, model exclusions, new experiment forecasts or calibrated confidence intervals.** Nuclear matrix elements, backgrounds, efficiencies, and additional LNV mechanisms matter.

## Adversarial negative controls

1. **NO exact cancellation:** the independent consumer constructs a three-complex-term phase witness with m1=4 meV yielding zero light amplitude.
2. **Mixing sensitivity:** a hypothetical solar angle of 45° allows an IO zero amplitude for m3=20 meV, defeating universal claims detached from measured mixing.
3. **Additional mechanism:** algebraically opposite coherent nuclear amplitude cancels the light contribution for an isotope; the UV and multi-isotope feasibility are separately open.
4. **Conserved lepton number:** a Dirac theory has no light-Majorana mechanism even if oscillation data match.
5. **Nuclear isotope non-interchangeability:** 136Xe ≠ 76Ge; NME factors and uncertainties cannot be swapped, bounds cannot be naively combined.
6. **Nonunique UV origin:** different seesaws and Weinberg EFT completions can realize the same low-energy mass matrix, without unique framework credit.
7. **No unsupported BFSS/NFC transfer:** existing verified mathematical structures are not currently a source-qualified 3+1D electron current or neutrino nuclear-decay operator.

## Reproducibility and scientific routing

Companion source paths:
- research/standard-model/tools/sm_p0n8_0nubb_core.py
- research/standard-model/tools/sm_p0n8_0nubb_independent_consumer.py
- research/standard-model/data/SM_P0N8_MODEL_NEUTRAL_0NUBB_IO_FLOOR_2026_11_18.json

**Local stdlib Python 3.13 execution: PASS**, including exact phase cancellation, analytic floor checks, changed-input counterexample, source guard flags and same-isotope scaling. Core, consumer, and JSON must be Git-blob compared with the executed local bytes before any source-exact provenance claim. **No CI**, no Lean formalization, no derived isotope half-life, no experimental likelihood or BFSS/NFC physical promotion.

The accepted BFSS 27 anchors, blocked W0C2B2, SM-D0/SM-P0N0–SM-P0N7, FCP main and unified branch non-research source are unchanged. SM-D1 is still PROSPECTIVE_UNSTAGED.

**Next Project Lead research choice:** audit ONE original source-defined two-isotope light-vs-heavy/short-distance nuclear mechanism, with proper EFT Wilson coefficients, operator normalization, uncertainties and separate isotope likelihood. Establish whether the mechanisms are distinguishable after nuclear nuisance variations; if not, preserve NONIDENTIFIABLE and pivot. Develop a new physical model only when its independently constrained predictions cannot be reproduced by adjusting existing models.

## Primary source URLs

- https://arxiv.org/abs/2609.37895v1 (JUNO 2026 September)
- https://doi.org/10.1103/PhysRevLett.130.161802 (Daya Bay 2023)
- https://arxiv.org/abs/2603.06787 (Penedo and Petcov 2026 known mass frontiers)
- https://journals.aps.org/prl/abstract/10.1103/jkf6-48j8 (KamLAND-Zen complete 2025)
- https://journals.aps.org/prl/abstract/10.1103/25tk-nctn (LEGEND-200 combined 2026)
- https://journals.aps.org/prd/abstract/10.1103/rsw5-57fz (2026 ab initio nuclear global analysis)
- https://link.springer.com/article/10.1140/epjc/s10052-026-15826-6 (2026 sterile-neutrino χEFT)
- BFSS Project Lead qualified-reuse evergreen on the unified branch; FCP evergreen on its historical research branch.
