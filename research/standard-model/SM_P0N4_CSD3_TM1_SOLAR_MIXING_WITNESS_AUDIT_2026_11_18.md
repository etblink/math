# SM-P0N4 — CSD(3)/TM1 solar mixing: source-pinned, held-out relation and adversarial null controls

**2026-11-18 | Bounded prospective physical comparison research | NO experiment significance, no Lean CI gate, no model/framework qualification**

**Parent checkpoint:** SM-P0N3 \`1e587fbf8c2da64cf55d4dd4f3dfe88565b4ad27\`; working branch \`integration/bfss-unified-research-20261108\`. FCP \`main\`, the qualified BFSS 27-anchor ledger, blocked W0C2B2, accepted SM-D0 and SM-P0N0, overlapping JUNO SM-P0N1 and prior SM-P0N2/N3 records are **not** edited.

## Question and decision

Does a **named, antecedently sourced** restricted two-singlet flavor mechanism generate a PMNS relationship that can be examined against an observation not used to set the relation? **YES, conditionally** for the CSD(n) / Littlest Seesaw TM1 family under stated flavor-basis and leading-order assumptions. **The separate experimental inference is NOT qualified:** the current JUNO + Daya Bay central-value comparison suggests an interesting tension, but no source-approved joint likelihood, detector refit, confidence interval or framework-level conclusion is available.

The model we selected is **not a newly invented fitting texture**: King, *Littlest Seesaw* (submitted 2015, JHEP 02 (2016) 085), predated the JUNO September 2026 analysis, and gives the two coupling directions. The 2023 published review *Neutrino Mixing Sum Rules and the Littlest Seesaw* independently summarizes the exact TM1 solar rule and its charged-lepton-diagonal assumptions. This intake does not independently establish the flavor-symmetry origin as a law of nature.

## 1. Exact model and derived implication (not a numerical fit)

Use a 3+1D chiral electroweak lepton theory with three active neutrinos, diagonal charged-lepton mass matrix in the specified basis, and two gauge-singlet heavy Majorana neutrinos. In the tree-level seesaw/heavy-decoupling approximation, choose **declared input flavor alignments** (the actual restrictions to be tested):

\`\`\`text
a = (0,1,1)^T,    b(n) = (1,n,n-2)^T   (n=3 in the CSD(3) example)
M_nu = m_a a a^T + m_b exp(i eta) b(n) b(n)^T
\`\`\`

Here m_a,m_b are nonnegative effective real mass parameters and η is a physical relative phase (after appropriate field rephasings). Overall seesaw minus sign is physically inessential for the kernel claim. The vectors are complex-bilinear algebraic alignments; they are not Hermitian conjugates inside the Majorana symmetric mass matrix.

For **every** real n, and every allowed m_a,m_b,η,

\`\`\`text
q = (2,-1,1)^T  satisfies  a^T q = 0  and  b(n)^T q = 2-n+(n-2) = 0.
Therefore M_nu q = 0.
\`\`\`

When the rank is exactly two and the light eigenstate associated with q is labeled m_1 = 0 (normal ordering), the normalized q has |q_e|²=4/6=2/3. Under the **explicit diagonal charged-lepton convention**, PMNS obeys

\`\`\`text
|U_e1|² = c12² c13² = 2/3.
s12² = (1 - 3 s13²) / (3 (1 - s13²)).
\`\`\`

This is an exact **conditional tree-level/leading-decoupling TM1 solar mixing sum rule**, independent of m_a, m_b, η and even of n within the stated CSD(n) family. For a broken flavor alignment, n-flavor permutation outside the stated convention, a non-diagonal physical charged-lepton rotation, nonunitary low-energy PMNS from sizeable heavy mixing, or significant RG/threshold corrections, this exact observable relation need not hold. Such adjustments are extra model ingredients requiring source-bound derivations, **not free retroactive fixes**.

The logical inference is:
\`declared CSD flavor vectors + physical charged-lepton basis + unitary 3-light-state interface + m1=0 labeling -> TM1 mixing relation\`.
It does NOT show the restricted flavor vectors are forced by data, derive the measured theta13, or identify any BFSS/NFC object as a lepton.

## 2. Historically separated experimental inputs and exact arithmetic

**Observable:** the solar mixing \`sin²theta12\` from JUNO's **207.2-live-day 2026 collaboration preprint**, is compared with the exact TM1 relation evaluated at a **separately measured reactor** Daya Bay \`sin²(2theta13)\` (2023, full n-Gd dataset).

| Experimental quantity | Central and quoted ± | Role |
|---|---:|---|
| Daya Bay \`sin²2theta13\` (2023) | \`0.0851 ± 0.0024\` | **INPUT** to TM1 mixing prediction, not a CSD model prediction |
| JUNO \`sin²theta12\` (2026-09-29 preprint, 207.2 d) | \`0.3036 ± 0.0064\` | **HELD-OUT COMPARISON** against the pre-existing TM1 relation |
| JUNO \`sin²theta12\` (2026-06-10 Nature, 59.1 d) | \`0.3092 ± 0.0087\` | **HISTORICAL DIAGNOSTIC ONLY**, overlapping predecessor of the 207.2-day data; NOT an independent replication |

Take the physically established small-angle branch \`s13² = (1-sqrt(1-sin²2theta13))/2\`; the other mathematical inverse branch is not the observed small reactor mixing angle. At the central Daya Bay input:

\`\`\`text
s13²(DayaBay) = 0.0217479743900712
s12²(TM1 | DayaBay) = 0.318512357537918
s12²(JUNO 207d) = 0.3036
central residual = TM1 conditional − JUNO = +0.0149123575379180
\`\`\`

As a **display diagnostic only**, varying Daya Bay \`sin²2theta13\` independently over its published single-parameter \`central ± quoted uncertainty\` gives TM1 \`sin²theta12 ∈ [0.3180748, 0.3189488]\`; varying the published 207d JUNO central \`sin²theta12\` over its quoted range gives \`[0.2972,0.3100]\`. The displayed intervals are disjoint. **These are NOT calibrated combined confidence intervals, σ significance, a p-value, a 2D likelihood contour, nor a model exclusion.** The analyses do not provide a validated imported full joint response, systematic cross-experiment covariance and necessary EFT/theory-error allowances. Their central values and marginal quoted errors are sufficient for a reproducible comparison **screen**, not full statistical adjudication.

The earlier 59.1-day JUNO point has \`TM1−historical = +0.0093123575\`. It is one predecessor analysis on an overlapping sample; **never multiply it by the 207-day measurement as an independent likelihood**.

Reverse counterfactual: enforcing the 207d JUNO **central** \`s12²=0.3036\` inside exact TM1 would require \`s13²=(1-3s12²)/(3(1-s12²)) ≈ 0.04269577\`, or \`sin²2theta13≈0.16349136\`, markedly different from the Daya Bay central 0.0851. This is an algebraic diagnostic, not a model fit or exclusion statistic.

## 3. Adversarial checks, weaker-framework subtraction, and escape clauses

**A. Generic two-singlet no-go for TM1 inference.** The tree-level two-singlet rank-two structure alone does not imply \`|U_e1|²=2/3\`. Choose \`a'=(0,1,1)\`, \`b'=(1,0,1)\`; their common normal vector is \`q'=(1,1,-1)\`. When normalized as the massless first PMNS column in the same diagonal charged-lepton basis, \`|U_e1|²=1/3\`. So the constrained alignment is necessary to force TM1; one massless neutrino alone is insufficient. This is a **negative-control counterexample**.

**B. Weaker TM1 class.** The *same* \`|U_e1|²=2/3\` follows from any model that preserves the corresponding normalized PMNS first column. Even other CSD(n) choices satisfy the same solar sum rule. The relation can stress-test that **shared TM1 class**, not uniquely identify the CSD(3) ultraviolet completion or earn independent BFSS/NFC convergence credit. CSD(3) can make additional predictions only once its mass parameters, phase, symmetry breaking, running and experimental interfaces are source-bound and specified.

**C. Charged-lepton escape.** If the neutrino kernel q remains but the physical charged-lepton left diagonalizer is a nontrivial real 1–2 rotation \`R12(phi)\`, then \`|U_e1|²=(2 cos phi + sin phi)²/6\`, not necessarily 2/3. The \`phi≈1.275°\` central counterfactual reproduces *only the JUNO+DayaBay inferred value of |U_e1|²*. This **does not fit the full PMNS matrix**, preserve the independently measured theta13 automatically, or establish a viable corrected Lagrangian. It shows precisely how modifying a source assumption can defeat the strict sum rule; independently motivated rotation size/phase and all observables must be tested before a rescued theory is credited.

**D. Label/domain controls.** This rule assumes the massless first state (NO). Merely relabeling mass eigenstates or claiming inverted ordering without a new physical model is not permitted. Nor may the complex symmetric Takagi problem be replaced by a generic Hermitian 3×3 matrix.

**E. A fixed old paper is not a prediction of all its adjustable parameters.** The earliest cited CSD(3) model predates this measurement, so the TM1 relation is antecedent. Our derived numeric \`0.3185\` is still conditional on measured Daya Bay theta13, not a parameter-free prediction of theta13 itself. The reported disagreement cannot be assigned to a full CSD(3) physical model without a proper likelihood and theoretical corrections audit.

## 4. Comparison verdict under FCP and SM-D1

| Scientific target | Status | Qualified ceiling |
|---|---|---|
| Algebraic kernel and TM1 relation | \`DERIVED_CONDITIONALLY_REPRODUCIBLE\` | Elementary exact math **from declared** texture and charged-lepton assumptions, not formal Lean verification or experimentally established theory |
| TM1 relation versus JUNO 207d central estimate | \`CENTRAL_VALUE_TENSION_SCREEN_ONLY\` | Data-grounded conditional residual \`+0.01491236\` using Daya Bay input; **NO χ², confidence, exclusion, or preferred framework** |
| Difference from unqualified generic 2RH seesaw | \`NEGATIVE_CONTROL_PROVED_ALGEBRAICALLY\` | Rank-2 alone does not force TM1 |
| Uniqueness of CSD(3) | \`NON_UNIQUE_SHARED_TM1_STRUCTURE\` | Same rule from broader class; FCP weaker-framework subtraction blocks unique-origin credit |
| Charged-lepton corrections | \`ESCAPE_POSSIBLE_NOT_PHYSICALLY_ADJUDICATED\` | A source assumption can change the sum rule; no full corrected flavor-model fit established |
| BFSS and frozen NFC physical model linkage | \`MISSING_PHYSICAL_MAP\` | No 3+1D lepton/PMNS derivation or JUNO prediction discovered |
| Physical SM-D1 | \`PROSPECTIVE_UNSTAGED\` | Not promoted |

This is not a FCP framework admission, a recurrence update, or a physical-Standard-Model model-qualification gate. It obeys the evergreen rule **preserve the question, original source, evidence boundary and negative knowledge**.

**Project Lead decision:** source-bound **SM-P0N4 research completed as a conditional mixing-relation screen**. Next high-information action is to audit whether original CSD(3) flavor, charged-lepton diagonalization, RGE, finite-heavy-mixing and parameter choices are sufficiently fixed for a declared held-out prediction, then obtain a defensible likelihood/correlation protocol before experimental exclusion claims. If model flexibility can freely erase the relation, record \`LOST_DISCRIMINATING_POWER\` rather than optimizing a posthoc fit. Avoid generic proof machinery and no CI just to generate GREEN.

### Primary source citations

1. Stephen F. King, *Littlest Seesaw* (2015 submission; JHEP 02 (2016) 085): https://arxiv.org/abs/1512.07531 . Defines atmospheric (0,1,1), solar (1,n,n−2) alignments and TM1.
2. *Neutrino Mixing Sum Rules and the Littlest Seesaw*, Universe 9 (2023), 472, especially §5 and Table 2: https://www.mdpi.com/2218-1997/9/11/472 . Reviews charged-lepton-diagonal basis and exact TM1 relation.
3. JUNO Collaboration, *Measurement of Neutrino Oscillation Parameters at JUNO and Indication of the Neutrino Mass Ordering*, submitted September 29, 2026: https://arxiv.org/abs/2609.37895 . Separate, overlapping later source version.
4. Daya Bay Collaboration, *Precision Measurement of Reactor Antineutrino Oscillation at Kilometer-Scale Baselines by Daya Bay*, Phys. Rev. Lett. 130, 161802 (2023): https://doi.org/10.1103/PhysRevLett.130.161802 .
5. Prior 59.1-day JUNO peer-reviewed Nature analysis (2026-06-10): https://doi.org/10.1038/s41586-026-10538-z . Historical overlapping evidence only.
