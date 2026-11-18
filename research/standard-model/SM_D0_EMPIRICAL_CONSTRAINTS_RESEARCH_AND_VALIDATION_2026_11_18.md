# SM-D0 — first empirical requirements and null-search constraint snapshot

**Status:** 2026-11-18 source-reviewed research candidate. **No validation-GREEN or acceptance claimed here until the independent CI gate passes and its provider evidence is archived.** Truth-first program: explanations of observed reality outrank any favored mathematical framework.

Canonical charter: [Truth-first foundational research](../methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md). First proven separate math input: [SM-Y0 one-family anomaly coefficient benchmark](SMY0_R1_QUALIFIED_SOURCE_CONSUMER_ACCEPTANCE_2026_11_18.md). SM-D0 itself is **data and provenance**, not a Lean proof or a physics prediction. Its machine-readable snapshot is [SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json](data/SM_D0_EMPIRICAL_CONSTRAINTS_ASOF_2026_11_18.json); exact immutable source status and limits are recorded per row.

## Date, provenance and exclusion rules

**As-of date:** 2026-11-18, with static [PDG 2026 particle listings](https://pdg.lbl.gov/2026/listings/particle_properties.html) as an edition marker (NOT an unexamined replacement by dynamically advancing \`pdgLive\`). These **ten selected source-level results are neither a comprehensive latest/global fit nor a PDG world average**. Values below were checked against specific original publications or official collaboration releases, with their original source date in the ledger; source status and possible correlations are explicit.

**Hard scientific guardrails:**

1. A **measurement** is a measured central value and quoted uncertainty within a specified collaboration's analysis. A **lower or upper limit** is a channel-specific statement at a stated confidence level; none is a general estimate of a lifetime or a positive detection.
2. Two results from the same analysis can be **correlated**; adding error bars in quadrature or computing combined \(\chi^2\) requires a covariance, not just two displayed numbers. In particular, JUNO's two reported oscillation parameters are not independent experimental datasets.
3. A source's adopted analysis settings are part of its evidence. The 2026 CMS inclusive Higgs signal-strength fit assumed \(m_H=125.38\) GeV; that **must not silently be substituted with** CMS's newer combined Higgs mass \(125.065\) GeV.
4. A calculated model prediction must identify **the same observable, kinematics, units, confidence convention, and physical regime** before comparison. Missing physical mapping is **NOT TESTED**, not a "pass" or a proof of compatibility.
5. The gate can verify exact frozen ledger values, source URLs, schema, dates and adversarial negative mutations, but **cannot independently reproduce particle experiments or fetch and authenticate full external articles during CI**. This scientific limitation is explicitly returned by the verifier.

## Ten versioned primary-source inputs

| Area | Original reported result | Source and date | Physical role; important interpretation |
|---|---|---|---|
| Higgs mass | \(m_H=125.065\pm0.088\) GeV | [CMS HIG-26-010 announcement](https://cms.cern/news/how-much-does-higgs-boson-weigh-cms-gives-its-most-precise-answer-yet), **2026-11-02** | Preliminary CMS combination \(H\to\gamma\gamma\) and \(H\to ZZ\to4\ell\). Single-collaboration result, not PDG/world average or SM mass derivation |
| Electroweak W mass | \(m_W=80360.2\pm9.9\) MeV | [CMS, Nature 652 (2026)](https://pmc.ncbi.nlm.nih.gov/articles/PMC13061639/), **2026-04-08** | Direct \(W\to\mu\nu\) mass, distinct from electroweak fits/world average; inter-experiment tension with the CDF 2022 measurement must not be suppressed |
| Higgs production/decay | Inclusive \(\mu=1.014^{+0.055}_{-0.053}\) (SM ratio) | [CMS HIG-21-018 revised preprint](https://arxiv.org/abs/2602.18611), version dated **2026-08-14** | Assumes \(m_H=125.38\) GeV in the analysis; not an independent second Higgs-mass measurement |
| Neutrino solar mixing | JUNO \(\sin^2\theta_{12}=0.3092\pm0.0087\) | [JUNO, Nature 654 (2026)](https://doi.org/10.1038/s41586-026-10538-z), **2026-06-10** | First 59.1 days reactor measurement, paper's normal-ordering scenario, not a mass-generation theory |
| Neutrino splitting | JUNO \(\Delta m^2_{21}=(7.50\pm0.12)\times10^{-5}\) eV² | [Same JUNO primary publication](https://doi.org/10.1038/s41586-026-10538-z), **2026-06-10** | Correlated with the preceding row, does not determine absolute neutrino masses |
| Proton-decay two body | \(\tau/B(p\to e^+\pi^0)>2.4\times10^{34}\) years, 90% CL | [Super-Kamiokande, PRD 102 (2020)](https://journals.aps.org/prd/abstract/10.1103/PhysRevD.102.112011), **2020-12-22** | Older published channel-specific limit, retained as a comparison benchmark, **not called the newest 2026 bound** |
| Proton-decay three body | \(\tau/B(p\to e^+\pi^0\pi^0)>7.2\times10^{33}\) years, 90% CL | [Super-Kamiokande, PRD 114 (2026)](https://journals.aps.org/prd/abstract/10.1103/frxr-pk3t), **2026-10-26** | Two pions in the final state, so not substitutable for \(e^+\pi^0\) |
| Proton-decay three body | \(\tau/B(p\to\mu^+\pi^0\pi^0)>4.5\times10^{33}\) years, 90% CL | [Same Super-Kamiokande 2026 search](https://journals.aps.org/prd/abstract/10.1103/frxr-pk3t) | Muon and electron final states must be treated as distinct |
| Proton + invisible | \(\tau/B(p\to e^+ X)>1.72\times10^{33}\) years, 90% CL | [Super-Kamiokande, PRD 114 (2026)](https://journals.aps.org/prd/abstract/10.1103/rsr5-d3x2), **2026-10-13** | Applies to **massless invisible neutral** \(X\) assumed in this search; not generic invisible-particle model exclusion |
| Muon electric dipole moment | \(|d_\mu|<1.1\times10^{-19}\ e\,\mathrm{cm}\), 95% CL | [Fermilab official release](https://news.fnal.gov/2026/08/muon-g-2-experiment-places-new-constraints-on-a-forbidden-property-of-muons/), **2026-08** (month-granularity only) | Direct CP-odd muon EDM search, **not** the muon magnetic anomaly \(g-2\); no observed EDM |

### Most scientifically important immediate observations

**Neutrino mass/mixing are essential discriminants.** A purported fundamental theory that only has massless neutrinos or no coherent mixing interface must not be declared to "reproduce the Standard Model" after passing a gauge-representation count. Oscillation measurements are real constraints, but do not identify a unique high-scale mechanism.

**Unification must respect nonobservations.** The 2026 proton-decay searches are mode specific. A Spin(10) or SU(5) candidate must actually calculate \(\tau/B\) with its own scale, couplings, operator coefficients, spectrum, hadronic matrix elements and uncertainty before comparison. The group name or spinor dimension does not alone predict a lifetime. A measured lower bound may disfavor a **specific parameter point** at its stated CL; it does not automatically reject all GUTs.

**Precision Higgs and W observables are complementary.** CMS's 2026 Higgs mass, Higgs rate and W mass have different assumptions, inputs and correlations. Our ledger intentionally **does not** manufacture a combined anomaly significance. The W mass literature contains tensions; reporting an apparently neat single value as an uncontested world result would distort our scientific assessment.

## Reusable validator and independent factual crosscheck

The first validator is [\`research/standard-model/tools/smd0_validate.py\`](tools/smd0_validate.py), using only Python standard library. It validates **ten independent record IDs** and explicitly rejects **ten adversarial mutations**: a changed W mass, future publication, duplicated measurement, mislabeled bound, altered confidence level, swapped proton decay mode, false JUNO independence, silently changed Higgs fit mass assumption, missing scientific limitation and a changed/live PDG edition.

This is a **fixed-reference consistency and audit gate**, not a statistical \(\chi^2\) evaluator. Its source-specific expected-value table is separately transcribed from the original sources, but lives in our own repository; it cannot check whether a paper's webpage was modified since the as-of review. The CI must archive the immutable ledger, validator and validation output after a GREEN, and record no empirical model acceptance just because this gate runs.

## Subsequent comparison workflow

1. **SM-D1 prediction interface:** For each proposed theory, require a *model name/version*, explicit physical input map, predicted observable, unit, errors, correlation/likelihood model, and computed confidence interpretation. A missing map remains \`NOT_PREDICTED\` or \`NOT_APPLICABLE\`, never a fake zero discrepancy.
2. **SM-D2 primary review expansion:** Add the versioned PDG 2026 CKM, PMNS, Higgs widths, electroweak correlations, QCD couplings, rare flavor limits and cosmological constraints only after sourcing exact original tables and uncertainties. The PDG 2026 and 2027 live editions must not be mixed.
3. **SM-S0 mathematical route:** Work toward an independent \(\Lambda^\mathrm{even}\mathbb C^5\) spinor **construction** with actual Clifford and subgroup actions, not a mere \(16=1+10+5\) number match. Then use D0/D1 measurements and Y0 chiral anomaly constraints to evaluate claimed physical relevance.

**Current scientific ceiling:** this document and its machine-readable ledger organize verified source-level research inputs. They neither establish a unified theory nor falsify BFSS, Spin(10), or other approaches without their concrete, same-observable predictions. BFSS \`BFSS_GATE_STATE.json\` remains unchanged with 27 accepted original mathematical anchors; SM-Y0 remains the independently archived qualified math benchmark.
