# SM-P0N3 — Minimal two-singlet seesaw: rank-two physical control, independent witnesses and weaker-model subtraction

**2026-11-18 | BOUNDED SOURCE-BOUND FORWARD RESEARCH; NO QUALIFIED NEW PHYSICS THEOREM, NO CI GATE AND NO MODEL-EXPERIMENT SIGNIFICANCE**

**Parent:** SM-P0N2 mechanism/identifiability frontier on \`integration/bfss-unified-research-20261108\` (checkpoint \`c7c175f8faac97b9231f4f800a317783f2f9286e\`). **Ownership:** research/standard-model only; FCP canonical \`main\`, BFSS evidence ledger, SM-D0, SM-P0N0, SM-P0N1, SM-P0N2 and SM-D1 governance unchanged.

## 0. Outcome and scope ceiling

**Bounded result.** Exactly two heavy Majorana gauge-singlet neutrinos with no other neutrino mass sources force a rank-at-most-two light-neutrino mass matrix at *tree level*. Two nonzero observed oscillation splittings favor rank **exactly** two within this restricted setup. The result therefore supplies a conditional **one-massless-light-neutrino** restriction. It does **not** by itself predict \`delta_m2_21\`, \`sin2theta12\`, mass ordering, sterile-neutrino masses, or heavy-light mixings.

After inserting **measured** JUNO 207.2-day oscillation parameters and published Daya Bay \`sin²2theta13\` as explicit *inputs*, the restriction yields central-input scenarios for the total light-neutrino mass, kinematic electron-neutrino mass, and standard light-Majorana exchange amplitude. Those numbers are **data-conditioned implications, not independent JUNO predictions**. They must not be used to score BFSS, NFC, or the seesaw mechanism as confirmed.

The central cross-framework finding is a weaker-model counterexample: **a three-singlet seesaw with the third singlet decoupled, or a rank-two Weinberg EFT, can reproduce the same low-energy light mass matrix.** The rank restriction is useful, not a unique identifying signature for two-singlet UV dynamics. This is exactly FCP's Layer-10 weaker-framework subtraction.

## 1. Explicit assumptions and typed mass map

1. A 3+1D electroweak theory with the three observed active lepton doublets, a charged-lepton mass diagonalization, and *exactly two* additional gauge-singlet neutral fermions \`N_1,N_2\`.
2. A gauge-invariant renormalizable Dirac Yukawa coupling generating \`M_D\` of shape \`2 × 3\` and a symmetric invertible Majorana mass matrix \`M_N\` of shape \`2 × 2\`; standard 3-active charged-current flavor identification.
3. The fundamental active-active Majorana block is exactly zero at tree level: no independently inserted Weinberg operator, type-II triplet contribution, additional singlet, or extra lepton-number violating active mass term.
4. The numerical light-neutrino effective description presumes heavy-singlet decoupling, so the leading effective matrix \`M_light ≃ −M_Dᵀ M_N⁻¹ M_D\` is valid, and the usual **approximately unitary** \`3 × 3\` PMNS convention can be used for derived observables. At finite heavy-light mixing the full charged-current matrix is not exactly a unitary light-only 3 × 3 matrix, and new heavy-particle contributions require separate study.
5. The calculations use a standard, coherent three-flavor naming convention with \`delta_m2_21 = m_2²−m_1² > 0\`; NO has \`delta_m2_31>0\`, IO \`delta_m2_31<0\`. For \`0νββ\`, only the standard light-Majorana exchange component with freely varying remaining relative Majorana phase is included. Real nuclear half-lives require isotope-specific phase-space factors, nuclear matrix elements, and any additional amplitudes.

This is a **named restricted 4D physical model**. It is not a claimed 0+1D BFSS low-energy emergence map or frozen NFC prediction. It is not a complete two-singlet parameter fit; mass and flavor matrices remain largely free.

## 2. Analytical result and negative controls

The tree-level symmetric neutral mass matrix in the \`(ν_L,N)\` basis is

\`\`\`text
                [  0_(3×3)    M_Dᵀ ]
M_(5×5)  =      [  M_D         M_N ]
\`\`\`

Because \`M_D : C³ → C²\`, \`dim ker M_D ≥ 1\`. For any nonzero \`x ∈ ker M_D\`, \`(x,0) ∈ ker M_(5×5)\` directly, even before the heavy-decoupling approximation. In the seesaw regime, \`M_light = −M_Dᵀ M_N⁻¹ M_D\`, so \`rank(M_light) ≤ rank(M_D) ≤ 2\`, hence \`det(M_light)=0\` and at least one light mass is zero. No numerical matrix elements have been inserted into this argument.

**Falsifier within strict tree-level assumptions:** a reliably determined \`m_lightest>0\` with a physical measurement protocol and justified model dependencies conflicts with the exactly-zero-mass conclusion. It would **not** refute all seesaw models, because higher-order effects and additional operators or states can evade the exact rank-two premise.

**Weaker UV countermodel:** take \`M'_D\` of shape \`3×3\` whose first two rows are those of \`M_D\` and whose third row is zero, and set \`M'_N = diag(M_N, M_3)\` with \`M_3≠0\`. The effective \`3×3\` light matrix is *identical*. Thus \`det M_light=0\`, the three-light-neutrino mass spectrum, PMNS, and standard light-neutrino oscillation marginals do **not** distinguish two physical singlets from all three-singlet completions. Another rank-two symmetric Weinberg-EFT coefficient can reproduce the same low-energy matrix; an adequately tuned Dirac sector can share the masses and oscillations but has different lepton-number assumptions.

**SCC interpretation:** identical low-energy predictions at specified witnesses yield observational equivalence *on those witnesses*, not identity of underlying theories. Additional heavy-sector predictions require sourced masses, mixing, production/decay channels and experimentally applicable nuisance treatment.

## 3. Frozen source-versioned inputs — observed, not generated by the model

| Input | Central value | Source, method and provenance |
|---|---:|---|
| \`delta_m2_21\` | \`7.388e-5 eV²\` | JUNO 207.2 live days, 8,294 IBD candidates, collaboration preprint submitted 2026-09-29; overlapping with earlier 59.1-day JUNO data |
| \`sin²(theta12)\` | \`0.3036\` | Same 207.2-day JUNO fit; not independent of the preceding value |
| \`delta_m2_31\` (NO) | \`+2.509e-3 eV²\` | JUNO 207.2-day fit **with Daya Bay atmospheric-splitting constraint selecting the physical minimum** |
| \`delta_m2_31\` (IO) | \`−2.482e-3 eV²\` | Same conditional JUNO+Daya Bay atmospheric-splitting treatment |
| \`sin²(2theta13)\` | \`0.0851\` | Daya Bay Collaboration, full n-Gd sample, PRL 130 161802 (2023), \`±0.0024\` quoted; transformed on the experimentally relevant small-\`theta13\` branch |

No quoted uncertainty is propagated here because the accepted files do not provide a validated joint likelihood/covariance among the inputs, and both the 2026 JUNO September analysis and Daya Bay constraints share fit dependencies. None of the data versions is treated as independent repeats. These specific values are **central-input benchmarks**, not fitted central values or new experiment predictions.

## 4. Reproducible conditional arithmetic

Let \`s13²=(1−sqrt(1−sin²(2theta13)))/2\` (small-angle branch) and \`c13²=1−s13²\`. The electron-flavor weights are \`w=(c12²c13²,s12²c13²,s13²)\`, \`sum(w)=1\`.

- NO \`(m1,m2,m3)=(0,sqrt(delta21),sqrt(delta31_NO))\`
- IO \`(m1,m2,m3)=(sqrt(|delta31_IO|),sqrt(|delta31_IO|+delta21),0)\`
- \`Sigma=sum_i m_i\`
- \`m_beta=sqrt(sum_i w_i m_i²)\` (standard light-only, unitary 3-flavor approximation)
- \`m_betabeta=|sum_i U_ei² m_i|\` under light-Majorana exchange. With one zero mass, precisely two nonzero amplitudes \`a,b\` remain and the free relative Majorana phase gives the exact **central-input amplitude interval** \`[|a−b|,a+b]\`.

| Derived quantity | NO | IO |
|---|---:|---:|
| \`m_lightest\` | \`0 eV\` | \`0 eV\` |
| \`m2\` | \`0.00859534758 eV\` | \`0.05055571184 eV\` |
| \`m1\` | \`0 eV\` | \`0.04981967483 eV\` |
| \`m3\` | \`0.05008991915 eV\` | \`0 eV\` |
| \`Sigma\` | \`0.05868526672 eV\` | \`0.10037538667 eV\` |
| \`m_beta\` | \`0.00874687541 eV\` | \`0.04949710789 eV\` |
| \`m_betabeta\`, light-only phase envelope | \`0.00146344087–0.00364214943 eV\` | \`0.01892497748–0.04895479883 eV\` |

The companion JSON contains all exact decimal inputs, source identifiers, assumptions, central outputs and no-likelihood status; \`research/standard-model/tools/sm_p0n3_two_singlet_control.py\` independently recomputes these via Python standard library and fail-closed assertions. No CI was launched. A local numerical check is not a formal theorem or validated statistical analysis.

## 5. Independent experimental witnesses, with correct evidence ceilings

| Witness | Can test the rank-two restriction? | Current source-bound evidence and limitation |
|---|---|---|
| Reactor/accelerator 3ν oscillations | Constrain splittings/angles/order; do **not** measure absolute common mass or distinguish UV completions with the same effective matrix | JUNO September 2026 mass ordering indication requires external long-baseline constraints; the 207.2-day data overlap earlier JUNO |
| Kinematic beta endpoint \`m_beta\` | In principle distinguishes sufficiently different absolute spectra, conditional on flavor/response | KATRIN Science 2025 reported \`m_beta<0.45 eV\` at 90% CL. That bound is far above *both* conditional central benchmarks, so **no exclusion/discrimination** from this result |
| \`0νββ\` and \`m_betabeta\` | Can constrain Majorana lepton-number violation and the phase-sensitive low-energy amplitude **only under a specified mechanism** | LEGEND-200 combined PRL 2026: \`T_1/2^{0ν}>1.9e26 yr\` at 90% CL; \`m_betabeta<75–200 meV\` under NME and standard mass mechanism. These limits are above both central benchmark phase maxima. A null result is not a proof of Dirac nature |
| Cosmological \`Sigma\` | Potentially sensitive to the two central mass sums, but inherently depends on assumed cosmological model, dataset and prior/likelihood | A published September 2026 full-shape/DESI/CMB/SNe analysis quotes \`Sigma<0.049 eV\` in ΛCDM and \`<0.077 eV\` in a dynamic-DE model (95% CL). The former is *below the oscillation-implied NO floor* of this benchmark. This is a warning about modeling/prior/data-consistency tensions, **not a blanket falsification of oscillation physics or a standalone seesaw exclusion** |
| Direct heavy-singlet signatures | Potentially differentiates UV completions | No source-derived \`M_N\`, heavy-light mixings or detector response supplied here, hence \`NOT_PREDICTED\` for any experiment |

No experimental likelihood or joint covariance is imported, so it is prohibited to infer significance, marginal exclusion, Bayesian preference or a new physical qualification from these side-by-side numbers.

## 6. SCC counterfactual and FCP weaker-framework matrix

| Pair / counterfactual | What is equal | What could differ | Scope of judgment |
|---|---|---|---|
| Two-singlet rank two vs three-singlet rank two with third singlet decoupled | Exact leading low-energy \`M_light\` (constructive embedding), hence any matched 3ν masses, mixing and oscillation marginals | Accessible heavy states only after fixing a nondecoupled third coupling/spectrum | **LOW_ENERGY_EQUIVALENT_ON_STATED_WITNESSES**, no unique UV claim |
| Rank-two seesaw vs rank-two Weinberg EFT | One possible identical light Majorana matrix | UV dynamics, heavy spectrum, higher-dimensional operators | **SAME_EFT_NOT_UV_IDENTITY** |
| Rank-two Majorana vs Dirac with matched three light masses and PMNS | Vacuum oscillations, \`Sigma\`, and \`m_beta\` | Genuine lepton-number violating amplitude, e.g. standard \`0νββ\` | **0NU CHANNEL_CONDITIONAL; NO ASSUMED_DETECTION** |
| NO vs IO rank-two cases | One massless state under the same rank restriction | \`Sigma\`, \`m_beta\`, and phase-dependent \`m_betabeta\` (and oscillation ordering features) | **CENTRAL_INPUT_STRUCTURAL_DIFFERENCE, NO EXPERIMENTAL_SIGNIFICANCE** |
| Add a nonzero additional active Weinberg contribution | Underlying two-singlet sector unchanged | Full low-energy determinant need not vanish; \`m_lightest>0\` becomes possible | **ASSUMPTION_SENSITIVITY / NO UNIVERSAL_ZERO_MASS_CLAIM** |

Under FCP Method-0.2.1 safeguards: representation does not establish identity; a generic rank inequality does not receive framework-specific recurrence credit; a successful fit is not a held-out prediction; a rank-two model-level exclusion would not automatically exclude the entire seesaw family, BFSS, NFC, or any other framework.

## 7. Scientific decision and stop rule

**Conclusion:** SM-P0N3 is a **source-bound, independently reproducible conditional numerical research control**. One massless neutrino at tree level is meaningful conditional predictive structure, but neither its two-singlet UV origin nor JUNO's values are independently predicted. Existing named KATRIN and LEGEND limits do not discriminate the two central mass-ordering cases. Cosmological comparisons need an explicitly accepted cosmological likelihood with appropriate physics priors and treatment of tensions.

**Next priority:** search for a specifically *restricted, source-pinned* neutrino flavor Lagrangian or symmetry with coefficients fixed independently of the held-out target. Demand at least one falsifiable relationship among masses and mixing (or between neutrino and charged-lepton sectors) not removable by refitting, then identify actual independent measurement channels. Otherwise preserve \`UNDERDETERMINED_GENERIC_MASS_MECHANISM\` and select a different empirical observable.

**Never** overwrite the preserved 59.1-day JUNO evidence, treat 207.2-day as independent data, infer a fit is a forecast, promote a generic seesaw rank result to a BFSS/NFC result, or launch speculative Lean/CI merely to increase GREEN count.

### Primary source bibliography

- Particle Data Group, *Neutrino Masses, Mixing, and Oscillations* (March 2026 revision; official 2026 PDF), seesaw Eqs. 14.19–14.21, general EFT Eq. 14.24, absolute/0νββ formulas: https://pdg.lbl.gov/2026/reviews/rpp2026-rev-neutrino-mixing.pdf
- JUNO Collaboration, 207.2-day reactor antineutrino preprint submitted 2026-09-29, *Measurement of Neutrino Oscillation Parameters at JUNO and Indication of the Neutrino Mass Ordering*: https://arxiv.org/abs/2609.37895
- Daya Bay Collaboration, *Precision Measurement of Reactor Antineutrino Oscillation at Kilometer-Scale Baselines by Daya Bay*, Phys. Rev. Lett. 130, 161802 (2023): https://doi.org/10.1103/PhysRevLett.130.161802
- KATRIN Collaboration, *Direct neutrino-mass measurement based on 259 days of KATRIN data*, Science 388, 180–185 (2025): https://doi.org/10.1126/science.adq9592
- LEGEND Collaboration, *First Results on the Search for Lepton Number Violating Neutrinoless Double-β Decay with the LEGEND-200 Experiment*, Phys. Rev. Lett. 136, 022701 (2026): https://doi.org/10.1103/25tk-nctn
- DESI/CMB cosmological methodological contrast, *Reanalyzing DESI DR1: IV. Percent-level cosmological constraints from combined probes and robust evidence for the normal neutrino mass hierarchy*, Phys. Rev. D 114, 063526 (2026): https://doi.org/10.1103/sjff-yj2t
- FCP evergreen: \`etblink/Foundational-Convergence-Program@research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md\`; FCP live charter/protocol/claim ledger govern comparative scope, not BFSS or SM acceptance.
