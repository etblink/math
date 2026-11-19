# SM-P0N9 — Two-isotope neutrinoless double beta mechanism-identifiability audit

**Date:** November 18, 2026. **Branch:** integration/bfss-unified-research-20261108. **Parent:** SM-P0N8, commit 5421d330e7d5e5d0e42b19fec639d3e65f86dc40.

**Outcome:** CONDITIONAL_IDENTIFIABILITY_CRITERION_PROVED; CURRENT_EXPERIMENTAL_MECHANISM_NOT_IDENTIFIED; SOURCE_NME_DATA_NOT_IMPORTED. This is a research and methods checkpoint, not a formal Lean gate, experimental likelihood result, or promotion of a particular framework.

## Scientific question and operating rule

Can two isotopes, xenon-136 and germanium-76, discriminate light-Majorana exchange from a heavy-neutrino or short-distance neutrinoless double-beta mechanism?

The correct answer is **conditionally**: for exact nonzero rates, a specified noninterfering two-mechanism model, and exact known isotope-dependent nuclear responses, the answer depends on the rank of a 2×2 matrix. If the amplitudes interfere, more physical degrees of freedom enter and two rates generally fail to identify them. **Present published measurements give upper limits, not two positive rates; they cannot identify the mechanism.**

Seek truth, not validation of the Standard Model, BFSS, NFC, or any other preferred ontology. Source-verified physical claims outrank attractive analogies, and negative knowledge is first-class.

## Primary literature and scope

- E. Lisi, A. Marrone and N. Nath, **Interplay between noninterfering neutrino exchange mechanisms and nuclear matrix elements in 0νββ decay**, Phys. Rev. D 108, 055023 (September 20, 2023), https://doi.org/10.1103/PhysRevD.108.055023 . Explicitly analyzes light-versus-heavy **noninterfering** exchange across isotope choices; finds dependence on heavy/light NME ratios and potential bias under different nuclear calculations.
- W. Dekens and collaborators, **Neutrinoless double beta decay rates in the presence of light sterile neutrinos**, JHEP 09 (2024) 201, https://doi.org/10.1007/JHEP09(2024)201 . Demonstrates additional ultrasoft and short-range source operators for germanium-76 and xenon-136 and warns that naively using only mass-dependent nuclear matrix elements misses contributions.
- A. Todd and collaborators, **Ab Initio Short-Range Nuclear Matrix Elements for Neutrinoless Double-Beta Decay**, Phys. Rev. Lett. 137, 092501 (August 26, 2026), https://doi.org/10.1103/d2n7-n2c7 . Its published abstract confirms a multi-isotope ab initio short-range calculation including Ge and Xe, and sterile mixing-mass comparisons. **This audit has not extracted source-specific numeric response matrices or their cross-isotope covariance**, and will not invent them.
- KamLAND-Zen complete xenon-136 (2025): T_1/2 > 3.8×10^26 years, 90% CL, https://doi.org/10.1103/jkf6-48j8 .
- LEGEND-200 with GERDA and MAJORANA germanium-76 (2026): T_1/2 > 1.9×10^26 years, 90% CL, https://doi.org/10.1103/25tk-nctn .

## Layer 0: structural identifiability theorem, two *noninterfering* mechanisms

Write R_X=(1/T_1/2(X))/G_X with a known, correctly normalized isotope-specific phase-space factor G_X. Assume the LNV mechanisms are physically **noninterfering** (for example, different final-state chiralities under the relevant approximation), with fixed response coefficients L_X≥0 and H_X≥0 incorporating the source-defined matrix elements and convention. Then

R_Xe = L_Xe x + H_Xe y,
R_Ge = L_Ge x + H_Ge y,

with unknown nonnegative coupling-strength squares x and y. Under **two exactly measured rates** and **known** response coefficients,

D = L_Xe H_Ge − L_Ge H_Xe.

If D≠0, the linear equations have a unique real solution. For a physically allowed nonnegative mixture, that solution must satisfy x,y≥0. A small determinant relative to the column norms makes the inverse unstable in the presence of realistic errors. A dimensionless separation diagnostic is

S = |D|/[sqrt(L_Xe²+L_Ge²) sqrt(H_Xe²+H_Ge²)],

the absolute sine of the angle between response columns; S=0 means their isotope ratios coincide. The same signature is not unique to a UV model, even if the strengths were recovered.

**Falsifier for naive two-isotope sufficiency:** Choose proportional columns L=(2,1), H=(4,2), all deliberately synthetic. Then D=0 and any observed pair satisfying the proportional rate ratio admits a continuum of mixtures. No measurement precision can remedy an exactly rank-one map. A nearly proportional case has D≠0 but is unstable. Changing the nuclear model can change S; an S calculated from one selectively chosen NME table is NOT a robust evidence claim.

For a full source-exact quantitative adjudication, phase-space normalization, heavy/light NME conventions and chiral interference assumptions must be harmonized in a single nuclear EFT scheme; correlated theory errors and the real experiment likelihood must be included. Mixing coefficients from unrelated nuclear schemes violates the original-source rule.

## Layer 1: coherent interference creates additional unobserved parameters

For coherent mechanisms with the **same observable helicity final state**, a generic toy amplitude is

A_X = a_X η_L + b_X η_H,     R_X = |A_X|²,

where a_X and b_X are properly normalized nuclear amplitudes and η_L, η_H are complex LNV couplings. If the source amplitudes can be taken real within a specified convention, set x=|η_L|², y=|η_H|² and z=2 Re(η_L conj(η_H)), with z²≤4xy. Then R_X=a_X²x+b_X²y+a_Xb_Xz. Two rate observations constrain **three** real unknowns; generically a continuous degeneracy remains, even if the two isotope nuclear numbers are known exactly.

**Constructed exact counterexample (synthetic only):** a=(1,1), b=(1,2) across Xe/Ge and observed rates (2,5). One choice η_L=1, η_H=i has strengths (x,y)=(1,1) and interference z=0. A distinct choice x=1.2, y=1.1, z=−0.3 also gives rates (2,5) and meets the required positivity cone; a concrete relative phase is arccos[z/(2√xy)]. The local consumer reproduces these rates independently. This is a **mathematical observational-equivalence example**, not a known viable sterile-neutrino or EFT Lagrangian.

A third isotope, other kinematic distributions, a separately measured coupling, or a **prior source-frozen** phase relation might break this degeneracy. Whether any accessible experiment actually does so must be investigated, not assumed.

## Layer 2: experimental status is upper limits, not two positive observed rates

The available KamLAND-Zen and LEGEND results constrain the lifetime from below, hence constrain the **rate from above**, within source-specific confidence constructions. For any positive limits the mechanism strengths x=y=0 remain allowed. Neither a unique nonzero pair nor the existence of LNV is established. Combining these sources numerically as Gaussian constraints without their statistical model, backgrounds, experimental systematics and cross-isotope NME covariance would falsely promote a likelihood-free arithmetic screen.

**Our decision:** REAL_WORLD_TWO_ISOTOPE_MECHANISM_IDENTIFIABILITY = NOT_ESTABLISHED. This is a stronger and more useful negative result than a speculative mechanism-ranking score.

## BFSS and FCP lessons carried forward

1. **Structure:** derive the determinant rank test and coherent ambiguity without pretending to know nuclear physics.
2. **Specialization:** require exactly the selected Xe/Ge source operators, convention for G, a priori chirality/interference classification and actual NME values.
3. **Discharge:** independently verify source nuclear matrices, errors, renormalization and phase-space factors, then fetch joint likelihoods; none of these are currently discharged.
4. **Composition:** only after the above are qualified ask if a particular sourced physical theory produces identifiable observables.
5. **Negative controls:** full-rank synthetic inversion, rank-one degeneracy, near-collinear instability, two coherent solutions with the same rates, and upper-limit zero solution.
6. **Governance:** no upstream main edits, no FCP state mutation, no new Standard Model physical D1 qualification and no BFSS/NFC lepton identification. Strict original source versus toy model separation.

The checked local standard-library Python artifacts are research/standard-model/tools/sm_p0n9_two_isotope_core.py and research/standard-model/tools/sm_p0n9_two_isotope_consumer.py; the machine-readable control is research/standard-model/data/SM_P0N9_TWO_ISOTOPE_IDENTIFIABILITY_2026_11_18.json. Their synthetic coefficient values are **never** experimental nuclear matrix elements. Local consumer PASS is not Lean source/consumer proof acceptance.

**Next source-first operation:** obtain ONE consistent ab initio or EFT dataset providing nuclear light/heavy coefficients for both isotopes and their uncertainty/correlation structure, with exact operator normalizations. Then test whether S remains bounded away from zero across allowed nuclear uncertainty and whether detector-level likelihoods could discriminate in a *prospective* signal scenario. If not, record NONIDENTIFIABLE and favor a third channel rather than fitting new physics to current upper limits.
