# SM-P0N2 — Neutrino mass mechanisms, identifiability, and discriminating observables

**2026-11-18 | Source-bound forward research | NO NEW THEOREM, CI QUALIFICATION, EXPERIMENTAL MODEL SCORE, OR PHYSICAL PREDICTION**

## Decision

Following the accepted SM-P0N1 source audit (commit 04984ff058266d21da055bec02e06f68775dbdad), investigate physically legitimate mechanisms for massive neutrinos before attempting any model-to-JUNO numerical comparison. The empirical versions SM-D0/SM-P0N0 and separate JUNO 207.2-day SM-P0N1 preprint record remain unchanged. This note is a NEW RESEARCH OBJECT, not an amendment to those results.

**Finding:** Several well-developed mechanisms furnish correctly typed 3+1D mass operators, but their generic unrestricted parameters are sufficient to accommodate broad low-energy flavor patterns. Existence of a mass mechanism is not, by itself, a prediction for delta_m2_21, sin2_theta12, the ordering, or the PMNS matrix. Restricting a model can create genuine independent constraints; those restrictions must be fixed before using the relevant observations.

## Audited external source and internal provenance

- Particle Data Group (2026), review 14, "Neutrino Masses, Mixing, and Oscillations", esp. sections 14.1-14.4 and eqs. 14.15, 14.20, 14.22-14.29: https://pdg.lbl.gov/2026/reviews/rpp2026-rev-neutrino-mixing.pdf . This review predates the September 2026 JUNO preprint, and is a source of theoretical taxonomy, NOT the September experimental update.
- PDG 2026 errata: https://pdg.lbl.gov/2026/html/errata.html . On 2026-08-07 PDG corrected the summation indices in its web version eqs. 14.39 and 14.42 to i>j; numerical use of those formulas must honor the erratum.
- JUNO Collaboration, "Measurement of Neutrino Oscillation Parameters at JUNO and Indication of the Neutrino Mass Ordering", submitted 2026-09-29: https://arxiv.org/abs/2609.37895 . This 207.2-live-day collaboration preprint reanalyzes/extends the overlapping earlier sample. Ordering indication requires external accelerator inputs; the reported atmospheric-splitting fit uses Daya Bay to select a physical minimum. No joint experiment likelihood is imported here.
- Internal audited mechanism-to-JUNO stopping rule: research/standard-model/SM_P0N1_SOURCE_EXACT_NEUTRINO_PHYSICAL_MAP_AUDIT_2026_11_18.md; matrix data/SM_P0N1_NEUTRINO_MODEL_MAP_GAP_MATRIX_2026_11_18.json.
- Internal prospective comparison semantics: SMD1_MODEL_TO_OBSERVABLE_TRUTH_FIRST_COMPARISON_PROTOCOL_2026_11_18.md. SCC3B1 is a method for finite exact model-witness distinctions, not a physical map or new experiment.
- As additional concrete examples, See: https://www.nature.com/articles/s42005-026-02627-2 (flavor-model design) and https://link.springer.com/article/10.1140/epjc/s10052-026-16328-1 (specific seesaw phenomenology). Such model-dependent studies do not qualify a generic seesaw family or any BFSS/NFC result.

## I. Typed physical input and common calculation

A low-energy neutrino claim must first supply a 3+1D gauge-invariant action, electroweak lepton multiplets, the charged-lepton mass matrix M_e, and a neutrino mass construction in an explicit flavor basis. In the three-light-neutrino effective regime, diagonalize:

- Dirac case: singular-value decomposition of complex M_D with independent left and right unitary maps.
- Majorana case: Takagi diagonalization of a complex symmetric M_nu: U_nu^T M_nu U_nu = diag(m_1,m_2,m_3), with nonnegative masses.
- Charged leptons: U_eL^dagger M_e U_eR = diag(m_e,m_mu,m_tau). PMNS = U_eL^dagger U_nu (up to stated conventions).

The solar observable is delta_m2_21 = m_2^2 - m_1^2, in eV^2, with the mass labeling fixed. JUNO's sin2_theta12 is a mixing observable; neither can be inferred merely from the presence of a three-by-three matrix. Source-derived parameter values, scales, running, theory uncertainty, reactor survival probability, detector response, and actual correlated likelihood are independent requirements for a quantitative comparison.

## II. Mechanism ledger: mass generation is not necessarily parameter prediction

### A. Dirac Yukawa with sterile right-handed neutrinos

Extend the minimal SM by right-handed neutrinos and, under an imposed lepton-number symmetry forbidding their Majorana masses, generate M_D = v Y_nu / sqrt(2). The operator is a legitimate 4D electroweak construction. Arbitrary Y_nu does not predict eigenvalues, PMNS, mass ordering or JUNO splitting. Additional symmetries, textures and independently fixed constants would be needed. The smallness of Yukawas is an explanatory question, not a mathematical impossibility.

**JUNO classification:** FITTABLE_PARAMETERS / NOT_PREDICTED; no independently fixed observable.

### B. Dimension-five Weinberg operator

With SM fields in an EFT, an electroweak-invariant dimension-five operator yields an effective complex symmetric Majorana mass matrix. In the PDG normalization M_nu = (v^2 / Lambda_NP) Z, with Z a flavor matrix (precise coefficient conventions must be stated for any use). Generic unconstrained Z can encode different observed flavor patterns. The operator does not uniquely identify a high-energy completion; deriving it is not deriving a specific mass texture or numerical splitting.

**JUNO classification:** GENERIC_EFFECTIVE_MASS_OPERATOR / NOT_PREDICTED; coefficient matrix must be independently fixed to change status.

### C. Type-I seesaw

With n heavy gauge-singlet Majorana fermions, the PDG convention takes M_D as n-by-3 and M_N as n-by-n. In the controlled heavy-mass regime, M_light approximately equals -M_D^T M_N^{-1} M_D (basis/conjugation conventions matter). Generic Yukawa and heavy-mass matrices are insufficient to predict the solar splitting, mixing or ordering.

A useful *restricted* version has exactly n=2 singlets, no other neutrino-mass operators, and the standard three active neutrinos. Then rank(M_light) <= 2 by matrix rank, so at least one light mass is zero at tree level. This is an honest **conditional structural prediction** independent of JUNO fitting. It does NOT determine whether m_1=0 (normal ordering) or m_3=0 (inverted ordering), nor delta_m2_21 or theta12, which remain free under generic parameters. Any loop effects or additional operators must be audited before promoting an exact physical massless-state claim.

**JUNO classification:** NOT_PREDICTED for generic and two-singlet versions; rank-2 consequence is a separate conditional testable structural statement, not a JUNO parameter prediction.

### D. Type-II and Type-III seesaws

A heavy electroweak scalar triplet (type II) or heavy fermion triplets (type III) can generate Majorana masses through a low-energy dimension-five operator, subject to the model's couplings and symmetry breaking. Their UV field content differs from type I, but generic low-energy flavor couplings do not uniquely fix delta_m2_21 or theta12. Distinctive high-energy signatures require specified masses and couplings; do not equate "different particle content" with established experimental separation.

**JUNO classification:** NOT_PREDICTED without a frozen restricted flavor model.

### E. Radiative mechanisms (e.g. Zee/scotogenic families)

Loop-induced masses require additional specified fields, interactions and often discrete symmetries. Some constrained realizations can give rank or flavor-texture restrictions, and may entail independent collider, flavor-changing or dark-sector observables. The generic labels alone do not establish an independently sourced prediction.

**JUNO classification:** NOT_ASSESSED as a named model until a specific version, Lagrangian, parameter domain and corresponding source computation are supplied.

## III. Structural Counterfactual Capacity: actionable witness design

**Control 1 — common mass-square offset.** In ideal three-flavor vacuum oscillations, replacing every m_i^2 by m_i^2+c for an admissible c while preserving mixing leaves all mass-squared differences and oscillation probabilities unchanged. But a tritium beta-endpoint quantity m_beta^2 = sum_i |U_ei|^2 m_i^2 shifts by c if the electron row is normalized. This shows a mathematical degeneracy of the oscillation observation map, not an already detectable experimental difference.

**Control 2 — Majorana phases.** Different allowed Majorana phases can leave standard vacuum oscillations unchanged; under a specified standard light-neutrino exchange amplitude they can change m_betabeta = |sum_i U_ei^2 m_i|. Null neutrinoless double-beta-decay results alone cannot generally identify phases or exclude all Majorana scenarios, because cancellations, nuclear response and other mechanisms enter. A nonzero signal requires careful alternative-mechanism analysis.

**Control 3 — distinct UV origins, same EFT.** If different high-energy mechanisms yield identical effective 3-flavor neutrino and charged-lepton matrices, every low-energy oscillation marginal built from those identical inputs is the same. SCC must mark them equivalent on this declared witness set; it must not declare the underlying theories identical. Distinguish them only via source-derived additional observables such as sterile/charged states or lepton-flavor-violating processes in well-defined parameter regions.

**Control 4 — retuning is not prediction.** If a texture or mass scale is selected using the exact JUNO solar data under comparison, classify the apparent match as FIT_INPUT_NOT_PREDICTION. To test a constrained hypothesis, freeze all fitting data and parameter domains in advance, predict held-out observables, and assess the *family* under nuisance refitting (not a hand-picked best-looking point).

**SCC separation from physics:** A positive exact witness in the finite comparator is a statement about supplied mathematical distributions. Physical model discrimination further needs experiments, protocols, detector mapping, joint/correlated likelihood and useful finite-sample power. Unknown physical maps remain UNKNOWN even when a conditional math witness is proved.

## IV. Decision matrix and next high-value test

| Model family | Literature-defined 4D mass operator? | Independent JUNO delta_m2_21? | Distinguishing restriction / next witness | Scope verdict |
|---|---|---|---|---|
| Minimal massless-neutrino SM | No neutrino mass term in its renormalizable field content | No | Oscillations motivate extension | Empirically incomplete for neutrino mass |
| Dirac extension, free Yukawas | Yes, as a theoretical construction | No | Lepton number, independent absolute-mass probes | Valid parameterized mechanism |
| Generic Weinberg EFT | Yes | No | Need constrained Wilson coefficient texture | Valid EFT, underdetermined flavor |
| Generic type I/II/III | Yes under stated field/scale hypotheses | No | Specify heavy spectrum, couplings, symmetry | Underconstrained UV families |
| Minimal two-singlet type I | Yes conditionally | No | At least one zero light mass at tree level; test absolute-mass/ordering implications with independent external data | Genuine conditional rank restriction |
| BFSS SU(2) original | No accepted SM low-energy neutrino identification | No | First derive controlled 3+1D chiral physical sector | MISSING_PHYSICAL_MAP |
| Frozen NFC canon | No qualified PMNS/mass derivation; explicit canon non-claim | No | First construct a separately qualified mass/flavor map | MISSING_PHYSICAL_MAP |
| Historical NFC sketches | No qualified physical derivation | No | Original pinned derivation, scale, units and parameter independence | HISTORICAL_UNQUALIFIED |

**Next bounded research target, without generic new CI:** choose one precisely specified *predictive* restricted 4D model (the minimal two-singlet rank-two case is a suitable initial control), identify its actual independent predictions and the external measurement channels that can constrain them, then perform a source-pinned fit-versus-prediction and identifiability audit. Prefer one-parameter and model-family *counterfactual* stress tests before any numeric significance claim. Neither JUNO version supplies an independent replication of the other, and no synthetic covariance or likelihood may be substituted.

## Acceptance / stopping decision

This research-only audit is complete as a taxonomy and candidate priority assessment. **No independently qualified candidate prediction for JUNO has been found, no experimental comparison was performed, and NO status change is authorized for SM-D0, SM-P0N0, SM-P0N1, physical SM-D1, the 27 BFSS anchors or blocked W0C2B2.** The open burden is independent flavor-parameter derivation and a correctly typed physical observable map. Continue only with a specifically sourced constrained model; avoid proving more mathematics merely to produce a GREEN result.
