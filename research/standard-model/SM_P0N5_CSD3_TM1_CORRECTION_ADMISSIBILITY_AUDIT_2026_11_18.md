# SM-P0N5 — CSD(3)/TM1 correction admissibility and prediction-preservation audit

**Date:** 2026-11-18  | **Scope:** read-only external primary-source audit with newly committed *research-only* decision record; no formal/empirical model qualification or CI launch.

**Parent:** SM-P0N4, integration branch commit `1977d49e536d1055dca85b99ac8e8faa54724ca7`. Preserve SM-P0N4 numerical witness and SM-P0N0/SM-P0N1/SM-P0N2/SM-P0N3, BFSS's 27 qualified anchors, blocked W0C2B2, FCP's own canonical main and its living Method 0.2.1 controls.

## 0. Lead decision

**Do not rescue exact TM1 through arbitrary charged-lepton rotations, unspecified flavor corrections or quasi-degenerate running. Preserve an adverse, conditional central-value screen on the uncorrected TM1 invariant; keep the fully RGE-corrected Littlest Seesaw as a **separately sourced but UNADJUDICATED** physical candidate.**

This is not a claim that the original 2016 CSD(3) family has been excluded, and not a claim that any other 2026 flavor model is true. It is a correctly scoped *assumption-preservation* test. The **JUNO 207.2-day preprint** is a later overlapping analysis, not an independent replica of the prior 59.1-day JUNO data. The Daya Bay measurement supplies reactor angle input. No joint experiment likelihood or model-specific high-scale RGE parameter scan is imported here.

## 1. Primary-source exact identities and their promotion limits

- King, *Littlest Seesaw*, arXiv:1512.07531 / JHEP 02 (2016) 085 explicitly uses atmospheric column `(0,1,1)` and solar column `(1,n,n-2)` with normal ordering and `m1=0`. It specifies CSD(3) `n=3` and a symmetry-motivated phase benchmark. The kernel `q=(2,-1,1)` is a shared **neutrino-column** mathematical fact, not automatically a full PMNS invariant in every charged-lepton theory.
- The original 2016 benchmark gives both original source Yukawa matrices, especially `Y^E=diag(y_e,y_mu,y_tau)` in its Eq. (130). The fixed TM1 PMNS first column relies on this charged-lepton basis. The model does **not** contain an unconstrained `theta_12^e` as a freely adjustable input. Higher-order flavor-operator corrections may be possible, but they require new sourced operators and quantified coefficients rather than ad hoc after-the-fact insertion.
- King & Luhn, *Littlest Seesaw model from S4 × U(1)*, JHEP 09 (2016) 023 separately embeds the texture in a symmetry realization and discusses **suppressed** higher-order corrections. Suppressed is not zero, and neither the paper abstract nor our prior source records supplies a source-pinned arbitrary correction budget matching the newer JUNO point.
- King, Zhang & Zhou, *Renormalisation Group Corrections to the Littlest Seesaw Model and Maximal Atmospheric Mixing*, JHEP 12 (2016) 023, analyzes SM/MSSM scale evolution with heavy-singlet thresholds. Geib & King, *Comprehensive renormalization group analysis of the littlest seesaw model*, PRD 97, 075010 (2018), performs parameter scans, fits and shows some atmospheric-angle changes can be larger than older restricted examples. **Neither publication is an exact frozen 2026 posterior or a proof that the solar TM1 discrepancy is globally unrepairable.**
- Zhang, *Trimaximal mixing patterns meet the first JUNO result*, PRD 113, 055035 (2026), reports that near-degenerate neutrino masses can render some RG-corrected TM1/TM2 patterns compatible with the **first** JUNO result. This mechanism requires a distinct neutrino mass regime: under the present strict 2RH tree-level `m1=0` and the observed nonzero splittings, `m2≈0.00860 eV` and `m3≈0.05009 eV`, so the three light masses cannot be quasi-degenerate. **The cited quasi-degenerate rescue does NOT transfer into this strict rank-two CSD(3) model.** It also tested an earlier JUNO source version, not the updated September 2026 result.
- A June 2026 paper by Shang et al., *New modular fixed point neutrino models and their phenomenological implications for JUNO, T2HK and DUNE*, and a November 2026 paper by Hao et al., *Lepton mixing from the Δ(96) Modular Littlest Seesaw*, identify **other models** with non-TM1 correlations. Such alternatives remain distinct proposals, not retroactive CSD(3) rescue. Some used pre-September JUNO data; a held-out evaluation must disclose that provenance.

## 2. Explicit conditional correction budget from SM-P0N4 central inputs

| Quantity | Numerical consequence | Evidentiary role |
|---|---:|---|
| Daya Bay 2023 `sin²(2θ13)` | `0.0851 ± 0.0024` | **Measured input**, not CSD-produced |
| Daya Bay central `sin²θ13`, small branch | `0.0217479743901` | Inverse-trigonometric arithmetic |
| Strict TM1 `sin²θ12` | `0.318512357537918` | Conditional source-derived TM1 value |
| JUNO September 2026 `sin²θ12` | `0.3036 ± 0.0064` | Later held-out **central-value diagnostic** |
| Central solar `sin²θ12` displacement (TM1−JUNO) | `0.014912357537918` | Not calibrated statistical significance |
| Strict TM1 `θ12` from Daya Bay | `34.3584843574°` | Conditional angle |
| JUNO central `θ12` | `33.4355819237°` | Transformed measured central value |
| Solar angle displacement | `−0.9229024338°` | **Required low-energy angle shift**, assuming same central θ13 |
| Strict `|Ue1|²` | `2/3` | Original zero-mode and Ye assumptions |
| JUNO × Daya Bay central `|Ue1|²` | `0.681254710635` | Measured-input conditional inference |
| Change in `|Ue1|²` needed | `+0.0145880439681` | Witness of breaking the strict PMNS column |
| Illustrative real charged-lepton 1–2 rotation to reproduce ONLY `|Ue1|²` | `+1.2754626679°` | **Posthoc counterfactual only**; not a valid full PMNS fit |

To reproduce only the electron entry of the old massless eigenvector with `U_eL=R12(phi)` under the chosen sign convention, `|Ue1|²=(2 cos(phi)+sin(phi))²/6`. At the observed central `|Ue1|²`, `phi≈1.27546°`. This would also rotate the other PMNS columns; there is NO demonstrated simultaneous match to measured `θ13`, `θ23`, CP phase and mass splittings, and no source justification that this correction is permitted within the 2016 symmetry model. Do not promote this algebraic degree to an independent physical parameter or evidence of a saved theory.

## 3. Source table stress-test: legitimate RGE results are neither zero nor a universal rescue

The 2016 King–Zhang–Zhou paper's representative scale-evolution **examples** tabulate:

| Original 2016 RGE case/setting | Input `θ12` | Tabulated low-scale `θ12` | Tabulated low-scale `θ13` | What actually follows |
|---|---:|---:|---:|---|
| Case A / SM, table 2 | 34.32° | 34.13° | 8.11° | −0.19° solar running in **that example**; low-scale reactor prediction is also different from the Daya Bay input |
| Case A / MSSM tanβ=30, table 2 | 34.32° | 34.63° | 8.77° | +0.31° solar running, i.e. opposite direction from needed central decrease |
| Case B / SM, table 3 | 34.32° | 34.13° | 8.11° | Another illustrative −0.19°; not a full 2026 global fit |
| Case C / SM, table 4 | 34.32° | 34.11° | 9.54° | Solar shift −0.21° but reactor angle substantially differs; cannot score solar alone |

These source tables use particular **high-scale parameters and old experimental targets**, with low-energy tabulation near the author's stated electroweak matching scale, not a modern JUNO detector likelihood. They show source-exact possibility and scale, **not maximum possible** solar running over the entire permitted high-scale parameter space. Source-prior 2018 fit studies did re-optimize parameters with earlier data; importing their historical best fits as predictive scores on the 2026 observation would be inappropriate without exact source and input chronology.

**This audit does not infer 'RG is too small in all models' from four examples.** It infers a strict and useful stopping rule: *an acceptable 2026 prediction requires a source-pinned high-scale variant, bounded thresholds/couplings, fully consistent low-energy charged-lepton diagonalization and complete vector of observables—not merely a freely chosen angle correction.*

## 4. SCC counterfactual design

| Counterfactual | Preserved | Changed | Classification |
|---|---|---|---|
| Change `m_a,m_b,eta` within exact CSD(3) and fixed Ye | Normal massless eigenvector and exact TM1 first-column solar rule | Mass splittings, other angles and CP observables | `UNABLE_TO_REPAIR_SOLAR_RULE_BY_REFITTING_MASSES` |
| Change CSD(n) `n`, keep two alignment columns and Ye diagonal | Exact TM1 first-column rule for **all** n | Other observables and texture | `WEAKER_MODEL_NONUNIQUE_SHARED_RELATION` |
| Arbitrarily rotate charged leptons | Neutrino-sector rank/kernel may persist | Physical PMNS first column, reactor angle, CP | `MODEL_MODIFICATION_NOT_ORIGINAL_TEST` |
| Introduce independently specified flavor higher-order operators | Only explicitly preserved symmetries / operators | May move TM1 correlation and other observables | `SEPARATE_MODEL_REQUIRES_PRIOR_COEFFICIENT_BOUNDS` |
| RGE/threshold evolution of **frozen high-scale** CSD(3) | Pre-specified high-scale action and field content | Low-energy matrices and possible PMNS columns | `LEGITIMATE_CORRECTION_NOT_YET_RECALCULATED_2026` |
| Quasi-degenerate 3-light-neutrino TM1 RG model | Some TM1 high-scale patterns | Mass assumption `m1≈m2≈m3>0` | `INCOMPATIBLE_WITH_EXACT_2RH_TREE_LEVEL_M1_ZERO` |

## 5. Promotion/firewalls and next lead decision

**Provisional scientific verdict:** strict uncorrected TM1 gives a source-exact *central-value tension screen*, but no defensible exclusion significance. The mathematically secure implication is that varying only CSD(3) neutrino mass coefficients and phase **cannot remove that TM1 relation**. Arbitrary charged-lepton rotation is a different model. A generic quasi-degenerate RGE escape cannot apply to a strict rank-two light-mass spectrum; real hierarchical CSD(3) running is not yet excluded.

**Selected next action, not executed here:** one narrowly bounded *source-first RGE matching audit*, not a fishing expedition over textures. Recover the actual 2018 Geib–King model variants and 2018 high-scale fit inputs; choose source-antecedent parameter/threshold ranges before exposure to the September JUNO result, trace which observables were used in the historical fit, and ask whether a fixed, independently constrained variant still has a held-out solar mixing prediction. Only then decide whether importing a 2026 likelihood is scientifically worthwhile. If ranges are free enough to soak up JUNO while other predictions are unconstrained, record `LOST_DISCRIMINATING_POWER` and stop. If genuinely frozen, require the correct full correlated experiment/theory interface for a qualified empirical claim.

**No changes** to previously accepted empirical records, BFSS Lean gates, the FCP framework canon, the SMA physical D1 prospective status, or `main`. No joint χ², p-value, significance, numerical model score, source-to-BFSS/NFC physical map or accepted new theorem claimed.

## Primary source references

- Stephen F. King, *Littlest Seesaw* (2016): https://arxiv.org/abs/1512.07531
- King & Luhn, *Littlest Seesaw model from S4 × U(1)* (2016): https://doi.org/10.1007/JHEP09(2016)023
- King, Zhang & Zhou, *Renormalisation Group Corrections to the Littlest Seesaw Model and Maximal Atmospheric Mixing* (2016): https://arxiv.org/abs/1609.09402
- Geib & King, *Comprehensive renormalization group analysis of the littlest seesaw model* (2018): https://doi.org/10.1103/PhysRevD.97.075010
- Di Zhang, *Trimaximal mixing patterns meet the first JUNO result* (2026): https://doi.org/10.1103/t3w7-y9r3
- Shang et al., *New modular fixed point neutrino models and their phenomenological implications for JUNO, T2HK and DUNE* (2026): https://doi.org/10.1007/JHEP06(2026)036
- Hao et al., *Lepton mixing from the Δ(96) Modular Littlest Seesaw* (2026): https://doi.org/10.1007/JHEP11(2026)092
- JUNO 207.2d 2026 preprint: https://arxiv.org/abs/2609.37895
- Daya Bay 2023: https://doi.org/10.1103/PhysRevLett.130.161802
- FCP Project Lead evergreen `handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md` on `research/openai-math-su2-s1v52-global-lift-scoping-20261019` and FCP canonical `CURRENT_STATE.md` on `main` govern evidence integrity only; neither promotes the research comparator into an FCP scientific phase.
