# FCP Claim Ledger

## Current state

Scientific claim entries began with FCP-1. FCP-15L reconciled the durable central provenance spine through FCP-15, FCP-16 through FCP-18 appended the later controls/meta-audit, FCP-19 appended the Asymptotic Safety source-intake findings, FCP-20 appended the AS/null-GR subtraction/control result, and FCP-21 appended the Reduced-NFC/null-subtracted-AS controlled comparison. The 62 historical durable rows through FCP-21 remain preserved in their original order and wording. The earlier current-state supersession propagation appended 24 durable rows for already-canonical post-FCP-21 science, yielding 86 rows. The Post-FCP-25 reconciliation appended three FCP-25 durable rows, yielding 89 rows. The post-FW-CAT program-ledger reconciliation appended exactly four further durable rows—one FCP-26 Stage-1 empirical-screen row and three FW-CAT Stage-2 rows—yielding 93 durable rows through FW-CAT Taxonomy Gate Stage 2. The later external-audit / OBJ-CAT-11 bounded re-adjudication reconciliation appends exactly one current taxonomy-correction row, yielding 94 durable rows through the OBJ-CAT-11 bounded re-adjudication. The post-NFC/process-matrix durable-provenance reconciliation appends five already-canonical process-matrix and pairwise rows, yielding **99 durable rows through the Reduced-NFC ↔ FW-PROCESS-MATRIX prospective comparison**. The post-recurrence-delta durable-provenance reconciliation appends exactly one current recurrence row, yielding **100 durable rows through `PROGRAM_LEVEL_RECURRENCE_DELTA_2026_09`**. No historical claim row is deleted, reordered, or rewritten. `status: ACCEPTED` means that a row remains an accepted record at its declared source window and scope; it does **not** mean that the row is always the latest applicable present-tense interpretation. Current interpretation is resolved from the latest applicable durable rows together with `CURRENT_STATE.md` and `FRAMEWORK_REGISTER.md`. Canonical post-FCP-25 operations that create no distinct framework-indexed durable proposition remain authoritative in their own artifacts without being converted into artificial ledger rows. **No overall numerical framework score or winner is inferred from these rows.**

## Claim record schema

Future claims should use the following fields:

| Field | Requirement |
|---|---|
| `claim_id` | stable FCP identifier |
| `title` | short descriptive name |
| `framework_ids` | one or more IDs from `FRAMEWORK_REGISTER.md` |
| `source_ids` | exact supporting source records |
| `claim_text` | precise proposition at declared scope |
| `assumptions` | complete material hypotheses |
| `classification` | exactly one primary allowed classification |
| `canonicity_level` | 1–5 where applicable |
| `weaker_framework_test` | result of Layer 10 |
| `physical_bridge` | explicit bridge or `NONE` |
| `empirical_binding` | explicit evidence/comparator or `NONE` |
| `falsification_condition` | what would defeat or downgrade the claim |
| `countermodels` | references or `NONE` |
| `scope_ceiling` | strongest permitted interpretation |
| `status` | `DRAFT`, `ACCEPTED`, `SUPERSEDED`, or `WITHDRAWN` |
| `supersedes` | prior claim IDs or `NONE` |
| `notes` | optional bounded notes |

## Primary classifications

- `SOURCE_DERIVED`
- `GENERIC_MATHEMATICS`
- `VALID_CONDITIONAL`
- `MODEL_CHOICE`
- `PHYSICAL_BRIDGE`
- `EMPIRICAL`
- `NONFORCED`
- `COUNTERMODELED`
- `OPEN`

---

# FCP-1 claim entries

## FCP1-NULL-001 — Standard Model gauge-QFT structure

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-QCD-2026`, `SRC-NULL-PDG-NU-2026`
- `claim_text`: At the bounded null-baseline scope, the Standard Model particle sector is defined as a renormalizable gauge quantum field theory with strong `SU(3)_C` and electroweak `SU(2)_L × U(1)_Y` gauge structure, the established fermion representations/families, and the minimal Higgs sector.
- `assumptions`: the Standard Model source definition and its declared field content.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `2` relative to the declared SM model; no deeper physical canonicity claimed.
- `weaker_framework_test`: gauge-QFT structure in general is generic; the specific gauge group/matter content is model-specific rather than mathematically inevitable.
- `physical_bridge`: scattering, decay, mass and coupling observables as defined in PDG particle-physics practice.
- `empirical_binding`: `NONE` for this definitional row; empirical support is recorded separately.
- `falsification_condition`: source-definition mismatch would invalidate this row; empirical failure of the SM would delimit the model but need not invalidate gauge QFT generally.
- `countermodels`: `NONE`
- `scope_ceiling`: definition/structure of the SM, not derivation of why nature chose this structure.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-002 — GR supplies actual classical dynamics

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-GR-2026`
- `claim_text`: Given the Einstein-Hilbert gravitational action, universal/minimal metric coupling, and suitable matter/initial-boundary data, GR yields Einstein's field equations and therefore an actual classical dynamical law rather than merely a set of permitted transformations.
- `assumptions`: GR action/coupling postulates and mathematically suitable data.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `2` relative to the declared GR model.
- `weaker_framework_test`: variational field equations are generic; the Einstein dynamics and universal metric coupling are the specific content.
- `physical_bridge`: metric/connection to timing, free fall, orbital motion, redshift and gravitational-wave observables.
- `empirical_binding`: recorded separately in `FCP1-NULL-005`.
- `falsification_condition`: mathematical nonderivability from the stated action or reproducible empirical failure at the declared regime.
- `countermodels`: `NONE`
- `scope_ceiling`: classical GR dynamics in its tested/modelled domain; no quantum-gravity completion implied.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-003 — Standard Model parameter values are not all internally predicted

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-QCD-2026`
- `claim_text`: Precision SM predictions require empirical input parameters and a declared renormalization/input scheme; the framework derives many relations among observables conditional on these inputs but does not internally derive every observed numerical parameter from deeper principles.
- `assumptions`: standard perturbative SM/QFT use of renormalized parameters.
- `classification`: `MODEL_CHOICE`
- `canonicity_level`: `N/A`
- `weaker_framework_test`: parameter fitting/input selection is common to many physical models.
- `physical_bridge`: renormalization conditions tied to measurable masses, decay widths, cross sections and couplings.
- `empirical_binding`: PDG electroweak/QCD input schemes and global fits.
- `falsification_condition`: a source-derived theorem predicting all listed independent inputs would supersede this row.
- `countermodels`: `NONE`
- `scope_ceiling`: parameter-origin underdetermination; does not imply that the conditional predictions lack empirical content.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-004 — Particle-sector precision success

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-QCD-2026`, `SRC-NULL-PDG-HIGGS-2026`
- `claim_text`: At the FCP-1 source window, electroweak precision observables, QCD running/coupling determinations, and measured Higgs interaction patterns show quantitative consistency with Standard Model predictions at their stated uncertainties and tested scopes.
- `assumptions`: source-qualified experimental inputs, theoretical calculations and uncertainty models used in the cited reviews.
- `classification`: `EMPIRICAL`
- `canonicity_level`: `5` only in the sense of empirical selection among tested alternatives at those observables; no foundational uniqueness inferred.
- `weaker_framework_test`: generic gauge theory/renormalization alone does not reproduce these specific quantitative agreements.
- `physical_bridge`: collider/hadronic cross sections, widths, asymmetries, masses and coupling-sensitive rates.
- `empirical_binding`: PDG 2026 electroweak global fit; PDG QCD running/coupling synthesis; PDG Higgs measurements.
- `falsification_condition`: reproducible statistically/systematically qualified deviations inconsistent with all allowed SM parameter values/theory uncertainties at the declared scope.
- `countermodels`: `NONE`
- `scope_ceiling`: empirical success of the specific particle model over tested observables; not proof of UV or ontological completeness.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-005 — GR precision and strong-field empirical success

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-GR-2026`, `SRC-NULL-LVK-GWTC5-TGR-2026`
- `claim_text`: GR is consistent with the bounded source set's precision weak-field, equivalence-principle, binary-pulsar and gravitational-wave tests, including the current GWTC-5 test suite at the stated measurement/model uncertainties.
- `assumptions`: calibration, waveform/environment/systematics and statistical models declared by the empirical sources.
- `classification`: `EMPIRICAL`
- `canonicity_level`: `5` only at tested observables/regimes.
- `weaker_framework_test`: generic metric/variational gravity does not automatically reproduce the tested Einstein predictions.
- `physical_bridge`: timing, free fall, redshift and gravitational-wave signal observables.
- `empirical_binding`: PDG 2026 gravitational tests; LVK GWTC-5 TGR 2026.
- `falsification_condition`: reproducible deviations from Einstein predictions beyond qualified uncertainty/systematic allowances.
- `countermodels`: `NONE`
- `scope_ceiling`: strong empirical support in tested regimes, not proof of exactness at arbitrary curvature, energy or quantum scale.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-006 — Minimal SM neutrino sector is incomplete

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-NU-2026`
- `claim_text`: The minimal renormalizable Standard Model field content described in the bounded sources gives massless neutrinos, while observed flavour oscillations require nonzero mass-squared differences and mixing; therefore the minimal SM particle model requires extension in the neutrino sector.
- `assumptions`: minimal SM field content and standard interpretation of oscillation data.
- `classification`: `EMPIRICAL`
- `canonicity_level`: `5` at the empirical inference that the minimal massless-neutrino model is insufficient.
- `weaker_framework_test`: the conclusion is specific to the mismatch between the minimal SM and neutrino data; it does not falsify QFT in general.
- `physical_bridge`: measured flavour-transition probabilities/event spectra.
- `empirical_binding`: PDG 2026 neutrino oscillation synthesis.
- `falsification_condition`: would require overturning established oscillation evidence or showing the cited minimal SM actually generates the required masses without extension.
- `countermodels`: empirical neutrino oscillation data function as the negative witness to minimal-SM completeness.
- `scope_ceiling`: incompleteness of the minimal SM; no unique neutrino-mass mechanism selected.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-007 — Dark-matter microscopic identity remains open

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-DM-2026`
- `claim_text`: Under the standard GR/cosmological interpretation represented in the bounded source, most of the non-baryonic dark-matter component is inferred gravitationally but its fundamental microscopic makeup remains unknown.
- `assumptions`: standard gravitational/cosmological interpretation at the cited source scope.
- `classification`: `OPEN`
- `canonicity_level`: `N/A`
- `weaker_framework_test`: the open problem is empirical/physical rather than distinctive mathematics.
- `physical_bridge`: gravitational dynamics, lensing, structure formation and cosmological abundance observables.
- `empirical_binding`: PDG 2026 dark-matter review.
- `falsification_condition`: a source-qualified microscopic identification accounting for the dominant component would supersede the open status.
- `countermodels`: `NONE`
- `scope_ceiling`: identifies a frontier; gives no positive credit to any specific dark-matter theory.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-008 — Dark-energy/cosmological-constant explanation remains open

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-DE-2026`
- `claim_text`: Cosmic acceleration is empirically established and a cosmological constant provides the simplest standard description, but the physical explanation of its observed small magnitude or the possibility of an alternative origin remains open at this baseline.
- `assumptions`: standard cosmological use of GR and the observational synthesis in the cited review.
- `classification`: `OPEN`
- `canonicity_level`: `N/A`
- `weaker_framework_test`: accelerated expansion as an empirical target is independent of any one deeper framework.
- `physical_bridge`: expansion-history, CMB and large-scale-structure observables at the review scope.
- `empirical_binding`: PDG 2026 dark-energy review.
- `falsification_condition`: a uniquely source/empirically selected physical mechanism with the required magnitude would supersede the open status.
- `countermodels`: `NONE`
- `scope_ceiling`: explanatory frontier, not evidence for a specific alternative.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-009 — No established unified UV-complete quantum-gravity dynamics in the bounded null baseline

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-GR-2026`, `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-QCD-2026`
- `claim_text`: The bounded null baseline contains classical Einstein gravity and quantum-field-theoretic matter dynamics but does not itself supply one source-qualified UV-complete dynamical theory unifying quantum fields with dynamical spacetime at arbitrary scales.
- `assumptions`: FCP-1's deliberately bounded null definition and source set.
- `classification`: `OPEN`
- `canonicity_level`: `N/A`
- `weaker_framework_test`: this is a frontier/scope statement, not positive evidence for any proposed quantum-gravity framework.
- `physical_bridge`: `NONE` beyond the established separate-domain bridges.
- `empirical_binding`: `NONE` as a direct quantum-gravity observation.
- `falsification_condition`: integration of a source-qualified, empirically established UV-complete quantum-gravity theory into the null baseline would supersede this row.
- `countermodels`: `NONE`
- `scope_ceiling`: absence of a completed unification in the bounded baseline; no claim that a specific style of UV completion is required.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP1-NULL-010 — Generic formal machinery receives no framework-specific convergence credit by itself

- `framework_ids`: `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NULL-PDG-EW-2026`, `SRC-NULL-PDG-QCD-2026`, `SRC-NULL-PDG-GR-2026`
- `claim_text`: Action principles, gauge redundancy, representation theory, perturbation theory, renormalization-group flow, effective-theory reasoning and related generic mathematics are not by themselves specific enough to count as distinctive evidence for the null competitor in later foundational convergence scoring.
- `assumptions`: FCP Layer-10 weaker-framework rule.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: `N/A`
- `weaker_framework_test`: PASSES — these structures occur in many substantially weaker or different frameworks.
- `physical_bridge`: `NONE` required for the generic classification.
- `empirical_binding`: specific quantitative instantiations are scored separately in empirical rows.
- `falsification_condition`: a proof that a listed structure uniquely implies the full quantitative null competitor would require reclassification.
- `countermodels`: existence of alternative gauge/variational/renormalizable theories is sufficient to block uniqueness.
- `scope_ceiling`: generic structural tool only.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-3 cross-framework claim entries

## FCP3-NFC-001 — Reduced-NFC comparative object is source-bound to the reduction

- `framework_ids`: `FW-NFC-RED`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`
- `claim_text`: FCP-3 admits Reduced NFC only as the reduced relational operational object `K_red=(C,T)` plus the bounded R1–R10 survivor set and six survivor questions; discarded historical NFC claims are excluded.
- `assumptions`: FCP-3 provenance firewall and the noncanonical reduction continuity record.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `2` as a comparative reduction record; no physical canonicity implied.
- `weaker_framework_test`: not applicable to the provenance identity itself.
- `physical_bridge`: `NONE`
- `empirical_binding`: `NONE`
- `falsification_condition`: a documented error in the reduction provenance or an explicit superseding reduction would require revision.
- `countermodels`: `NONE`
- `scope_ceiling`: comparative identity of Reduced NFC only, not renewed NFC canon or ToE status.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-001 — K2 quotient/equivalence recurrence is generic

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP3-COMP-001`
- `claim_text`: Reduced-NFC observational equivalence and null-baseline gauge/diffeomorphism redundancy share generic equivalence/quotient machinery, but FCP-3 does not establish that they encode the same physical equivalence relation.
- `assumptions`: frozen K2 and E1–E5 rules.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: NFC `C2` relative to `T`; null `C2–C3` relative to component theory.
- `weaker_framework_test`: PASSES — equivalence relations and quotients occur in substantially weaker frameworks.
- `physical_bridge`: `NONE` connecting the two equivalence semantics.
- `empirical_binding`: null redundancy has domain-level empirical support; no cross-framework empirical equivalence.
- `falsification_condition`: an explicit E1/E2/E3/E4 correspondence preserving physical observables could upgrade the claim.
- `countermodels`: generic existence of inequivalent physical theories using quotient structures blocks uniqueness.
- `scope_ceiling`: `K2`; strongest correspondence `E5`; convergence `WEAK`; zero framework-specific credit.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: NFC M1 `MODEL_CHOICE/SOURCE_DERIVED`; null M1 mainly `SOURCE_DERIVED` after theory declaration.

## FCP3-CROSS-002 — K3 transformation recurrence is generic

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP3-COMP-001`
- `claim_text`: Both frameworks organize licensed/composable transformations, but no structure-preserving map identifies Reduced-NFC admissible processes with the null baseline's heterogeneous gauge, symmetry, interaction, intervention, representation, and RG transformations.
- `assumptions`: frozen K3 distinction between transformation classes and dynamics.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: both at most `C2–C3` within declared frameworks.
- `weaker_framework_test`: PASSES — categories/monoids of maps are generic.
- `physical_bridge`: no cross-framework map.
- `empirical_binding`: `NONE` for the generic cross-framework structure.
- `falsification_condition`: explicit E1/E2/E3 map preserving material transformation roles could upgrade.
- `countermodels`: many mathematical systems have composable transformations without shared physics.
- `scope_ceiling`: `K3`; `E5`; `WEAK_CONVERGENCE`; zero framework-specific credit.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-003 — K5 formal observable-family recurrence is generic

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP3-COMP-001`
- `claim_text`: Reduced NFC and the null baseline both possess formal observable/test structures, but Reduced NFC does not presently match the null baseline's calibrated measurement interface and no cross-framework observable equivalence is established.
- `assumptions`: frozen K5 separation of formal observables, physical interpretation, calibration, and exhaustion.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: NFC `C2` relative to `T`; null formal structures `C2–C3`, tested observables can reach `C5`.
- `weaker_framework_test`: PASSES — formal observable families are generic.
- `physical_bridge`: absent across frameworks; null has its own calibrated bridges.
- `empirical_binding`: none for cross-framework equivalence.
- `falsification_condition`: a source-bound E2/E3/E4 observable map with preserved calibration could upgrade.
- `countermodels`: formal observation languages can share algebraic form while measuring different physical quantities.
- `scope_ceiling`: `K5`; `E5`; `WEAK_CONVERGENCE` only at formal level.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-004 — K8 local-to-global recurrence is generic

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP3-COMP-001`
- `claim_text`: Both sides encounter local-to-global consistency burdens, but FCP-3 finds no shared non-generic obstruction invariant or E1–E4 correspondence; the common content is generic globalization logic.
- `assumptions`: frozen K8 and source-bound reduced/null structures.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: mostly `C2–C3` relative to supplied structures.
- `weaker_framework_test`: PASSES — patching/globalization problems are widespread across mathematics and physics.
- `physical_bridge`: null has specific physical instances; no cross-framework physical bridge.
- `empirical_binding`: `NONE` for the generic commonality.
- `falsification_condition`: isolation of a specific independently derived shared obstruction with E1–E3/E4 support would upgrade.
- `countermodels`: many inequivalent theories have local-to-global problems.
- `scope_ceiling`: `K8`; `E5`; `WEAK_CONVERGENCE`; remains a high-value open comparison question.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-005 — K1/K6/K7 similarities do not exceed functional analogy

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-COMP-001`, `SRC-FCP3-CONV-001`
- `claim_text`: At current source scope, state-carrier role (K1), locality role (K6), and inter-description/scale role (K7) have no E1–E4 correspondence and remain functional analogies only.
- `assumptions`: frozen equivalence rules and absence of explicit structure-preserving carrier, causal, or RG maps.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: role-level similarities occur in many unrelated frameworks.
- `physical_bridge`: `NONE`
- `empirical_binding`: `NONE`
- `falsification_condition`: an explicit E1/E2/E3/E4 correspondence for any key would supersede the relevant part.
- `countermodels`: generic modeling systems can have carriers/locality/scale descriptions without sharing physics.
- `scope_ceiling`: `E5_FUNCTIONAL_ANALOGY`; no convergence credit.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-006 — Reduced NFC lacks a counterpart to null sector dynamics

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: Reduced NFC's admissible process structure does not presently supply a source-derived global physical-history selector comparable in evidentiary role to GR or SM/QFT sector dynamics.
- `assumptions`: frozen K4 distinction between allowed transformations and actual dynamics.
- `classification`: `NONFORCED`
- `canonicity_level`: NFC no physical canonicity; null sector laws framework-canonical with empirically tested consequences.
- `weaker_framework_test`: not a generic-similarity claim; it is a missing-selection result.
- `physical_bridge`: absent for Reduced-NFC foundational dynamics.
- `empirical_binding`: null sector dynamics bound by FCP-1; no NFC counterpart.
- `falsification_condition`: source-binding a Reduced-NFC deterministic/stochastic/variational history selector with physical realization would require revision.
- `countermodels`: multiple allowed NFC processes/selection policies recorded by the reduction.
- `scope_ceiling`: K4 divergence; does not imply null UV completeness or unique cosmic history.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-007 — Reduced NFC lacks comparable calibrated physical realization

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: Reduced NFC presently lacks a general source-bound calibration bridge comparable to the null baseline's mappings from formal variables to measured time, length, masses, couplings, rates, spectra, gravitational-wave strain, and related observables.
- `assumptions`: frozen K9 requirements.
- `classification`: `NONFORCED`
- `canonicity_level`: NFC physical canonicity/calibration not established; null operational realizations can reach `C5` at tested scope.
- `weaker_framework_test`: not a generic-similarity claim.
- `physical_bridge`: absent on Reduced-NFC foundational side.
- `empirical_binding`: null calibration chains source-bound in FCP-1.
- `falsification_condition`: a source-qualified Reduced-NFC realization/calibration map satisfying K9 would supersede.
- `countermodels`: multiple historical branch realizations/choices prevent source selection.
- `scope_ceiling`: K9 divergence; no claim that null ontology is uniquely fundamental.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-008 — No current Reduced-NFC empirical discriminator against null baseline

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-COMP-001`
- `claim_text`: At the FCP-3 source scope, no Reduced-NFC foundational prediction satisfies all frozen K10 requirements needed to discriminate it from the bounded GR+QFT+SM null baseline.
- `assumptions`: K10 comparator/observable/uncertainty/decision-rule/provenance requirements.
- `classification`: `OPEN`
- `canonicity_level`: `N/A`.
- `weaker_framework_test`: not applicable until a discriminator exists.
- `physical_bridge`: insufficient for a foundational discriminator.
- `empirical_binding`: `NONE` for Reduced NFC versus null.
- `falsification_condition`: a preregistered source-bound Reduced-NFC prediction satisfying K10 would supersede the open status.
- `countermodels`: `NONE`
- `scope_ceiling`: `NO_CURRENT_EMPIRICAL_DISCRIMINATOR`; not impossibility of future prediction.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP3-CROSS-009 — Strong/moderate NFC–null convergence is not established

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP3-COMP-001`, `SRC-FCP3-CONV-001`, `SRC-FCP3-DIV-001`
- `claim_text`: After applying frozen K1–K10, E1–E5, weaker-framework, selection, physical-bridge, and quantitative tests, FCP-3 establishes no strong or moderate NFC–null convergence candidate at current source scope.
- `assumptions`: FCP-2 comparison rules and FCP-3 source bindings.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: the apparent correspondences that survive are generic or functional analogies.
- `physical_bridge`: no E1–E4 cross-framework physical bridge established.
- `empirical_binding`: no Reduced-NFC K10 discriminator.
- `falsification_condition`: a future source-qualified non-generic E1–E4 correspondence would supersede the relevant negative result.
- `countermodels`: genericization/vocabulary-erasure and differing physical semantics defeat the stronger inference.
- `scope_ceiling`: bounded negative/nonforcing result; not proof that future nontrivial convergence is impossible.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: strong `0`; moderate `0`; weak/generic `4`; functional analogy only `3`; no correspondence `3`; material divergences `9`.

---

# FCP-5 AQFT/null reformulation-extension claims

## FCP5-AQFT-001 — Core AQFT/QFT agreement is primarily a reformulation relation

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-AQFT-FV-2015`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: At the bounded source scope, core AQFT's abstract observable/state and representation-independent organization substantially reformulates and sharpens physical content already belonging to relativistic QFT rather than constituting an independently derived competing theory.
- `assumptions`: FCP-4 source boundary and frozen FCP-2 equivalence/convergence rules.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `C2–C3` relative to the AQFT/QFT formulations; no ontological uniqueness.
- `weaker_framework_test`: abstract operator algebras and representations are generic; the AQFT physical specialization is source-qualified but historically lineage-related to QFT.
- `physical_bridge`: same relativistic QFT domain in concrete realizations.
- `empirical_binding`: successful concrete QFT predictions are `EMPIRICALLY_INHERITED`, not independent AQFT selection.
- `falsification_condition`: a source-qualified AQFT structure with independent derivation and discriminating physical consequences could supersede the relevant reformulation classification.
- `countermodels`: empirically equivalent alternative QFT formulations block inference from formal representation to independent empirical theory.
- `scope_ceiling`: `REFORMULATION_RELATION`; no independent strong/moderate convergence credit.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-002 — LCQFT supplies a source-qualified model-class extension but not quantum gravity

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP4-AQFT-FV-2015`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: Locally covariant QFT extends fixed-background AQFT by organizing a theory functorially over globally hyperbolic spacetimes and admissible embeddings; this is additional structural/model-class content relative to the bounded null presentation, while Lorentzian metric/causal geometry remains supplied rather than derived.
- `assumptions`: LCQFT source category, functorial axioms and stated supplementary conditions.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `C2–C3` within LCQFT; no physical canonicity of the background category inferred.
- `weaker_framework_test`: category/functor mathematics is generic, but the physical specialization to locally covariant QFT is not exhausted by the generic shell.
- `physical_bridge`: QFT on supplied classical globally hyperbolic spacetimes.
- `empirical_binding`: inherited through concrete QFT models; no independent framework-level discriminator.
- `falsification_condition`: showing the bounded null baseline already source-binds an equivalent cross-background structure would downgrade the 'additional relative to bounded null' wording; deriving the metric from LCQFT would require new sources beyond this claim.
- `countermodels`: generic functors without QFT semantics defeat any claim that functoriality alone is physically distinctive.
- `scope_ceiling`: `MODEL_CLASS_EXTENSION`; explicitly **not quantum gravity** and not derivation of spacetime.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-003 — AQFT encodes and sharpens locality; it does not derive causal geometry from weaker foundations

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP4-AQFT-FV-2015`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: AQFT makes relativistic locality structurally explicit through spacetime-indexed local algebras and causal/locality conditions, but the relevant spacetime causal structure and locality axiom are inputs to the framework rather than a derivation of physical locality from a nonspatiotemporal substrate.
- `assumptions`: source-specified spacetime background/category and AQFT locality/causality conditions.
- `classification`: `NONFORCED`
- `canonicity_level`: locality structure `C2–C3` within the supplied framework; tested causal propagation in concrete QFT belongs to the null empirical record.
- `weaker_framework_test`: commutation and net structure are generic; physical relativistic localization depends on supplied spacetime semantics.
- `physical_bridge`: spacelike separation and localized QFT observables.
- `empirical_binding`: inherited from relativistic QFT/model realizations; no independent AQFT locality discriminator.
- `falsification_condition`: a source-qualified derivation of spacetime causal structure from weaker AQFT primitives would supersede the nonforcing part.
- `countermodels`: algebraic/net systems can satisfy analogous formal locality relations without encoding physical Lorentzian causality.
- `scope_ceiling`: structural sharpening and consequences of locality, not origin of spacetime causality.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-004 — Localized AQFT measurement theory supplies a physical bridge without independent empirical distinction

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-FV-MEAS-2020`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: The Fewster–Verch localized system–probe construction supplies source-qualified physical measurement architecture, including localized couplings, induced system observables and causally consistent instrument composition under stated hypotheses; it does not by itself calibrate all detectors or yield an AQFT-vs-null empirical discriminator.
- `assumptions`: system/probe theories, bounded coupling region, scattering construction and causal-factorization conditions of the cited source.
- `classification`: `PHYSICAL_BRIDGE`
- `canonicity_level`: up to `C4` as physically interpreted framework architecture; no independent `C5` selection.
- `weaker_framework_test`: completely positive maps/instruments are generic; the locally covariant system–probe realization is the source-specific content.
- `physical_bridge`: explicit system, probe, interaction region and induced observable semantics.
- `empirical_binding`: `NONE` as an independent comparison discriminator.
- `falsification_condition`: failure of the source construction under its stated hypotheses would invalidate; a distinct AQFT experimental prediction would require a separate empirical claim.
- `countermodels`: generic instrument formalisms show that abstract CP-map structure alone is non-distinctive.
- `scope_ceiling`: physical measurement framework, not universal calibration or empirical selection of AQFT.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-005 — Abstract AQFT does not supply one universal physical history selector

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP4-AQFT-FV-2015`, `SRC-FCP4-AQFT-BFR-2025`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: Concrete AQFT/pAQFT models may possess genuine dynamics and LCQFT may supply relative Cauchy evolution under extra conditions, but the bounded abstract AQFT framework does not select one universal physical history across all models and spacetimes comparable to the concrete SM/QFT sector laws of the null baseline.
- `assumptions`: separation of core AQFT, LCQFT/time-slice structure, pAQFT model construction and concrete model dynamics.
- `classification`: `NONFORCED`
- `canonicity_level`: model dynamics `C2–C3`; framework-wide history selection underdetermined.
- `weaker_framework_test`: automorphisms and response maps do not generically select physical histories.
- `physical_bridge`: concrete model-dependent dynamics; no universal framework bridge.
- `empirical_binding`: concrete QFT model predictions inherit the null empirical record.
- `falsification_condition`: a source-qualified universal AQFT dynamical-selection law would supersede.
- `countermodels`: distinct AQFT models with different dynamics suffice to block universal selection.
- `scope_ceiling`: K4 scope difference; does not deny real dynamics in concrete AQFT models.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-006 — AQFT has no source-bound framework-level empirical discriminator against the null QFT baseline

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP4-AQFT-FV-MEAS-2020`, `SRC-FCP4-AQFT-BFR-2025`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: At the FCP-5 source scope, no abstract AQFT prediction satisfies all frozen K10 requirements needed to distinguish AQFT empirically from the bounded successful QFT/SM sector; quantitative success of concrete AQFT representations is therefore recorded as empirical inheritance unless independently discriminating evidence is supplied.
- `assumptions`: frozen K10 comparator/observable/uncertainty/decision/provenance requirements.
- `classification`: `OPEN`
- `canonicity_level`: `N/A` at framework-comparison level.
- `weaker_framework_test`: reproducing an already successful model does not independently select one formal representation.
- `physical_bridge`: present through concrete QFT models and the measurement framework, but no distinct AQFT observable is identified.
- `empirical_binding`: `EMPIRICALLY_INHERITED`; no independent dataset/source record.
- `falsification_condition`: a preregistered source-bound AQFT-specific prediction satisfying K10 would supersede this open status.
- `countermodels`: empirically equivalent formulations block inference from reproduction to independent empirical selection.
- `scope_ceiling`: `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`; not proof that none can ever exist.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP5-AQFT-007 — AQFT/null structural agreement does not count as independent foundational convergence

- `framework_ids`: `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP2-EQUIV-001`
- `claim_text`: Because the bounded AQFT tradition is explicitly an algebraic reformulation/extension lineage of QFT, close AQFT–null structural agreement is not counted as `INDEPENDENT_CONVERGENCE`; core agreement is labeled `REFORMULATION_RELATION`, while additional LCQFT/pAQFT/measurement structures are evaluated separately on their own source-qualified merits.
- `assumptions`: historical/mathematical dependence of the formulations plus frozen FCP convergence-credit rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: expected agreement between a theory and its reformulation cannot establish independent recurrence from separate primitives.
- `physical_bridge`: inherited through shared QFT models.
- `empirical_binding`: no independent AQFT selection.
- `falsification_condition`: demonstration that a specific compared structure arose independently under the FCP independence criterion and satisfies non-generic E1–E4 requirements would permit reevaluation of that structure only.
- `countermodels`: alternate empirically equivalent reformulations show why agreement alone is insufficient.
- `scope_ceiling`: no strong/moderate **independent** AQFT–null convergence credit from expected reformulation agreement.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-6 Reduced-NFC/AQFT controlled-comparison claims

## FCP6-CROSS-001 — No nontrivial Reduced-NFC/AQFT convergence survives AQFT subtraction

- `framework_ids`: `FW-NFC-RED`, `FW-AQFT`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP4-AQFT-FV-2015`, `SRC-FCP4-AQFT-FV-MEAS-2020`, `SRC-FCP4-AQFT-BFR-2025`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After subtracting AQFT reformulational content, generic mathematics, supplied axioms and empirically inherited QFT success, FCP-6 establishes no strong or moderate Reduced-NFC/AQFT convergence at its bounded source scope; surviving similarities are weak/generic or functional, while dynamics, realization and pairwise empirical selection remain material asymmetries or open burdens.
- `assumptions`: the FCP-5-qualified AQFT residue, the FCP-3 Reduced-NFC binding, and frozen FCP-2 K1–K10/E1–E5 and independence rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: PASSES for surviving quotient/observable/globalization commonalities; generic or role-level recurrence cannot establish framework-specific convergence.
- `physical_bridge`: No E1–E4 two-sided physical bridge is source-bound between Reduced NFC and the FCP-5-qualified AQFT residue.
- `empirical_binding`: `NO_CURRENT_PAIRWISE_EMPIRICAL_DISCRIMINATOR`; shared absence is not empirical equivalence.
- `falsification_condition`: A future source-qualified non-generic E1–E4 Reduced-NFC/AQFT correspondence satisfying the frozen independence and physical-bridge burdens would supersede the relevant negative scope.
- `countermodels`: FCP-6 subtraction controls plus semantic differences in equivalence, locality, measurement, dynamics and realization block the stronger inference.
- `scope_ceiling`: bounded negative/nonforcing FCP-6 result; not a theorem that no future correspondence can exist.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: strong `0`; moderate `0`; weak/generic `3`; functional analogy `4`; no correspondence `3`.

---

# FCP-7 GPTOPT baseline claims

## FCP7-GPTOPT-001 — GPTOPT is a general operational meta-framework and does not select quantum theory by itself

- `framework_ids`: `FW-GPTOPT`
- `source_ids`: `SRC-FCP4-GPT-HARDY-2001`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-GPT-CDP-PUR-2010`, `SRC-FCP4-OPT-CHIRIBELLA-2014`, `SRC-FCP4-GPT-MULLER-2021`, `SRC-FCP4-GPT-PLAVALA-2023`
- `claim_text`: At the FCP-7 source scope, GPTOPT is a coherent operational/probabilistic meta-framework containing classical, quantum and broader-than-quantum models; quantum theory is an embedded/special model class and is not selected by the base framework without additional reconstruction principles or empirical restriction.
- `assumptions`: the FCP-4 GPT/OPT source window and the FCP-7 separation of G0–G6 layers.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `C2–C3` relative to declared GPT/OPT framework structure; no physical uniqueness.
- `weaker_framework_test`: Generic convexity, composition and operational syntax are not distinctive by themselves; the physically interpreted GPTOPT theory-space structure is source-qualified.
- `physical_bridge`: Operational preparation/effect/transformation semantics provide laboratory-facing interpretation, while complete calibration remains model dependent.
- `empirical_binding`: Quantum empirical success belongs to the selected quantum model; it is not automatic empirical confirmation of the whole GPTOPT family.
- `falsification_condition`: A source-qualified result showing that base GPTOPT alone uniquely fixes the quantum state/effect/composite/transformation structure would supersede the nonselection statement.
- `countermodels`: Classical and post-quantum GPT models inside the admitted family block unique quantum selection from the base framework.
- `scope_ceiling`: `GENERALIZATION_RELATION` to quantum theory at whole-family level; not independent convergence or quantum reconstruction from the base alone.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP7-GPTOPT-002 — Composite, dynamics and reconstruction selection remain additional GPTOPT burdens

- `framework_ids`: `FW-GPTOPT`
- `source_ids`: `SRC-FCP4-GPT-HARDY-2001`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-GPT-CDP-PUR-2010`, `SRC-FCP4-OPT-CHIRIBELLA-2014`, `SRC-FCP4-GPT-MULLER-2021`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FCP2-KEYS-001`
- `claim_text`: FCP-7 finds that local GPT state spaces do not by themselves uniquely determine the physical composite theory, native transformations describe allowed processes rather than one universal physical history law, and quantum-reconstruction principles such as continuity/reversibility, purification or other named axiom packages are additional selection assumptions rather than base GPTOPT theorems.
- `assumptions`: the FCP-7 G0–G6 decomposition and frozen distinctions among K3 transformations, K4 dynamics, K8 composition and K9 realization.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` for unique physical selection.
- `weaker_framework_test`: Convex/process/composite mathematics permits multiple lawful models and tensor/composite choices; no base-level uniqueness follows.
- `physical_bridge`: Operational probabilities/tests supply physical semantics but do not select one global composite cone, one dynamics, or one reconstruction package.
- `empirical_binding`: No framework-level discriminator validates one reconstruction package or the whole GPTOPT family at FCP-7 scope.
- `falsification_condition`: A source-qualified theorem deriving a unique physical composite, actual dynamics and quantum structure from the admitted base GPTOPT assumptions would supersede the corresponding burdens.
- `countermodels`: Minimal/maximal/intermediate composites, post-quantum nonsignalling models and alternative reconstruction packages witness nonuniqueness.
- `scope_ceiling`: durable GPTOPT selection-burden result; does not deny strong conditional consequences of named extra axioms.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-8 GPTOPT empirical theory-space claims

## FCP8-GPTOPT-001 — Quantum-boundary and composite-system selection remain open in GPTOPT

- `framework_ids`: `FW-GPTOPT`
- `source_ids`: `SRC-FCP8-GPT-PR-1994`, `SRC-FCP8-GPT-TSIRELSON-1980`, `SRC-FCP8-GPT-IC-2009`, `SRC-FCP8-GPT-ML-2010`, `SRC-FCP8-GPT-AQ-2015`, `SRC-FCP8-GPT-IC-2026`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-GPT-PLAVALA-2023`
- `claim_text`: At the FCP-8 source scope, no-signalling is too weak to select quantum correlations; Information Causality and Macroscopic Locality substantially restrict post-quantum possibilities but do not uniquely characterize the complete quantum set; almost-quantum correlations provide a reusable insufficiency witness; and local state spaces plus local tomography do not uniquely select the quantum composite cone.
- `assumptions`: the declared Bell scenarios, GPT composite constructions and exact principle hypotheses in the frozen FCP-8 source window.
- `classification`: `OPEN`
- `canonicity_level`: `N/A` for unique physical/foundational selection.
- `weaker_framework_test`: Multiple post-quantum models satisfy substantial subsets of the proposed constraints, so the principles do not force the desired unique boundary.
- `physical_bridge`: Bell correlations and operational composite structures are physically interpretable, but complete global GPT composite tomography/selection is not source-bound.
- `empirical_binding`: No principle is independently selected as nature's unique foundational law at this scope.
- `falsification_condition`: A source-qualified complete characterization plus independent physical selection of the relevant quantum boundary/composite rule would supersede the open status.
- `countermodels`: PR-box and almost-quantum correlations; minimal/maximal/intermediate composite possibilities.
- `scope_ceiling`: `QUANTUM_BOUNDARY_SELECTION_OPEN`; `QUANTUM_BOUNDARY_PRINCIPLE_UNDERDETERMINATION`; `COMPOSITE_SYSTEM_SELECTION_OPEN`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP8-GPTOPT-002 — Experiment narrows bounded GPT theory space without globally selecting quantum theory

- `framework_ids`: `FW-GPTOPT`
- `source_ids`: `SRC-FCP7-GPT-MAZUREK-2021`, `SRC-FCP8-GPT-RINGBAUER-2014`
- `claim_text`: FCP-8 source-binds genuine experimental narrowing of bounded GPT possibilities: model-independent single-photon GPT tomography constrains deviations from qubit state/effect geometry, while the Information-Causality laboratory task probes the principle using emulated/postselected supraquantum statistics; these results do not globally select quantum theory from the full GPTOPT space or confirm GPTOPT as a fundamental theory.
- `assumptions`: the tomography-completeness caveat of the Mazurek analysis and the loss/postselection construction used in the Ringbauer Information-Causality experiment.
- `classification`: `EMPIRICAL`
- `canonicity_level`: up to bounded empirical selection level `L2`; no global `L3/L4` selection.
- `weaker_framework_test`: Excluding particular low-dimensional deviations or exercising an emulated task does not uniquely select the full quantum framework.
- `physical_bridge`: Laboratory preparation/measurement statistics within the declared photon-polarization and Information-Causality tasks.
- `empirical_binding`: Positive bounded empirical constraint, not observation of natural post-quantum physics and not unique principle/framework selection.
- `falsification_condition`: Broader complete tomography or a discriminating experiment selecting a unique quantum boundary could raise the empirical ceiling; failure of the cited analyses would invalidate the bounded constraint.
- `countermodels`: Tomography incompleteness and emulated supraquantum statistics block global-selection inference.
- `scope_ceiling`: highest FCP-8 empirical-selection level `L2`; no `L3/L4` global quantum selection.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-9 causal-set source-intake claims

## FCP9-CST-001 — Causal set theory has a source-bound discrete causal-order core

- `framework_ids`: `FW-CAUSAL`
- `source_ids`: `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP9-CST-SURYA-2019`, `SRC-FCP9-CST-SURYA-2025`
- `claim_text`: FCP-9 source-binds causal set theory proper as a locally finite causal order with primitive causal/discrete physical interpretation and an explicit continuum-approximation burden linking order to continuum causality and cardinality to volume; the broader historical `FW-CAUSAL` causal/order umbrella is too broad and therefore opens a framework-split candidate.
- `assumptions`: the BLMS causal-set lineage and the bounded FCP-9 source taxonomy; adjacent causal/order programs are not silently pooled.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: `C2–C3` within the controlled CST lineage; no unique physical theory selection.
- `weaker_framework_test`: Generic partial-order mathematics alone is insufficient; the causal/discrete physical interpretation and continuum burden are the source-qualified CST content.
- `physical_bridge`: Order/causality and number/volume are continuum-realization semantics under declared approximation conditions.
- `empirical_binding`: No framework-level empirical selection follows from defining the causal-set carrier.
- `falsification_condition`: A source audit showing that the claimed core is not shared by the controlled CST lineage, or that the umbrella is scientifically coherent under the frozen separation rule, would require revision.
- `countermodels`: Adjacent causal/order approaches with materially different commitments block treating the historical umbrella as one source-bound competitor.
- `scope_ceiling`: FCP-9 source-intake/taxonomy result; suggested `FW-CST` successor not yet enacted until FCP-10.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP9-CST-002 — CST kinematics does not determine unique continuum or physical dynamics

- `framework_ids`: `FW-CAUSAL`
- `source_ids`: `SRC-FCP9-CST-SURYA-2019`, `SRC-FCP9-CST-SURYA-2025`, `SRC-FCP9-CST-MULLER-2025`, `SRC-FCP9-CST-KR-1975`, `SRC-FCP9-CST-RS-2000`, `SRC-FCP9-CST-SZ-2020`, `SRC-FCP9-CST-SS-2026`, `SRC-FCP9-CST-BD-2010`
- `claim_text`: FCP-9 finds no framework-wide derivation of a unique realistic continuum, manifoldlikeness, 3+1 dimension, topology or complete quantum dynamics from minimal CST kinematics. Core CST is D0; classical sequential growth reaches a bounded D2 family with coupling freedom; quantum sequential-growth programs are nontrivial but incomplete; continuum recovery remains R2 framework-wide with sharper conditional subresults.
- `assumptions`: the FCP-9 separation of minimal kinematics, optional CSG/QSG dynamics, manifoldlike continuum inputs and controlled reconstruction results.
- `classification`: `OPEN`
- `canonicity_level`: framework-level physical selection unresolved.
- `weaker_framework_test`: Generic poset abundance and multiple lawful growth/quantum-growth constructions show that kinematics alone does not force the desired physical sector.
- `physical_bridge`: Faithful embedding, order/number semantics and discrete operator/action limits provide conditional realization bridges, not dynamics selecting the bridge target.
- `empirical_binding`: No empirical selection of one CST dynamics or continuum is source-bound.
- `falsification_condition`: A source-qualified selected CST dynamics yielding robust manifoldlike 3+1 GR plus matter with controlled continuum uniqueness would supersede the relevant open burdens.
- `countermodels`: Kleitman–Rothschild generic-poset counterpressure; CSG coupling freedom; incomplete QSG families.
- `scope_ceiling`: `TRADITIONAL_FINITE_CONTINUUM_UNIQUENESS_OPEN_REFINED`; `MANIFOLDLIKENESS_SELECTION_OPEN`; R2/D2 ceiling at FCP-9.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP9-CST-003 — CST empirical constraints are model-specific rather than framework-selecting

- `framework_ids`: `FW-CAUSAL`
- `source_ids`: `SRC-FCP9-CST-LAMBDA-2004`, `SRC-FCP9-CST-ZUNTZ-2008`, `SRC-FCP9-CST-PDS-2009`, `SRC-FCP9-CST-CDP-2010`, `SRC-FCP9-CST-SURYA-2019`
- `claim_text`: FCP-9 source-binds observational constraints on declared causal-set-inspired cosmological and diffusion phenomenology, but these tests constrain additional parameterized models rather than an unavoidable prediction of minimal CST; no framework-level CST empirical discriminator is identified.
- `assumptions`: the explicit additional assumptions and phenomenological parameterizations of Everpresent-Lambda, swerves/energy diffusion and polarization diffusion models.
- `classification`: `EMPIRICAL`
- `canonicity_level`: bounded `E2` model-specific empirical scope; no framework-level selection.
- `weaker_framework_test`: Different CST-compatible dynamics/phenomenology can avoid the exact constrained model, so model exclusion does not select or falsify the entire framework.
- `physical_bridge`: CMB and related observable quantities in the declared phenomenological implementations.
- `empirical_binding`: Real observational constraints at model scope; no E3 positive framework discriminator or E4 framework selection.
- `falsification_condition`: A source-qualified unavoidable CST prediction satisfying the full K10 framework-discriminator burden would supersede the framework-level open ceiling.
- `countermodels`: Multiplicity of optional CST phenomenology blocks inheritance from one tested model to the full framework.
- `scope_ceiling`: `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`; highest FCP-9 empirical level E2 model-specific.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-10 CST taxonomy-resolution claim

## FCP10-CST-001 — FW-CAUSAL is superseded and FW-CST is the canonical source-bound successor

- `framework_ids`: `FW-CAUSAL`, `FW-CST`
- `source_ids`: `SRC-FCP9-CST-INTAKE-001`, `SRC-FCP9-CST-BASELINE-001`, `SRC-FCP10-CST-BINDING-001`
- `claim_text`: FCP-10 resolves the FCP-9 taxonomy defect by preserving historical `FW-CAUSAL` as `SUPERSEDED_BY_FRAMEWORK_SPLIT` and admitting `FW-CST` as the canonical source-bound Causal Set Theory comparator; the unspecified adjacent order-theoretic remainder is deferred pending separate source intake, with no empty placeholder framework created.
- `assumptions`: the frozen FCP-4 framework-separation rule and the unchanged FCP-9 scientific packet.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: repository/framework taxonomy canonicity only; no physical uniqueness.
- `weaker_framework_test`: A taxonomy label alone provides no scientific credit; the split is justified only by the source-bound difference between CST proper and the unbound adjacent remainder.
- `physical_bridge`: No new physical bridge is introduced by the taxonomy action.
- `empirical_binding`: FCP-9 R2/D2/E2 and no-framework-discriminator status remain unchanged.
- `falsification_condition`: A later source intake showing the deferred remainder forms the same framework under the frozen separation rule could motivate a separately authorized taxonomy revision.
- `countermodels`: The FCP-9 over-broad umbrella itself is the negative witness against silent pooling.
- `scope_ceiling`: taxonomy/provenance result only; CSG remains optional C2, QSG provisional C3, sprinkling a continuum-sampling construction, and matter/phenomenology extension-level.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: FCP-10 added zero external scientific sources and performed no cross-framework comparison.

---

# FCP-11 CST/null-GR control claims

## FCP11-CSTNULL-001 — CST is not a GR reformulation, but GR-like recovery is predominantly target-conditioned

- `framework_ids`: `FW-CST`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP9-CST-INTAKE-001`, `SRC-FCP9-CST-BASELINE-001`, `SRC-FCP10-CST-BINDING-001`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-11 finds that CST's locally finite carrier, primitive causal order and fundamental spacetime discreteness are additional foundational commitments rather than a mere representation of GR; however, its strongest GR-like faithful-embedding, operator/action and continuum results are predominantly target-conditioned reconstruction or compatibility results and therefore do not constitute independent emergence or independent strong/moderate convergence with GR.
- `assumptions`: canonical `FW-CST` from FCP-10, the FCP-9 source window, the bounded null/GR decomposition, and frozen FCP-2 equivalence/independence rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework; exact substructure E2/E3 relations remain conditional on their named bridges/limits.
- `weaker_framework_test`: Generic order/combinatorial mathematics and supplied Lorentzian/manifoldlike targets are insufficient for CST-specific emergence credit.
- `physical_bridge`: Faithful embedding/order-preserving and selected continuum-limit bridges exist at bounded substructure scope; they do not provide whole-framework equivalence or dynamics selection.
- `empirical_binding`: GR/QFT empirical success in recovered/target regimes is inherited, not independent CST evidence.
- `falsification_condition`: A source-qualified, non-target-conditioned derivation of manifoldlike GR dynamics from selected CST dynamics satisfying frozen independence criteria would supersede the relevant negative classification.
- `countermodels`: Sprinkling into a chosen Lorentzian manifold and manifold-conditioned continuum limits demonstrate why reconstruction need not be dynamical emergence.
- `scope_ceiling`: CST is a genuine additional foundational proposal, but FCP-11 independent strong convergence `0`, moderate convergence `0`; target-conditioned E2/E3 subrelations remain local.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP11-CSTNULL-002 — CST dynamics, matter realization and framework-level empirical selection remain open after null control

- `framework_ids`: `FW-CST`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP9-CST-BASELINE-001`, `SRC-FCP10-CST-BINDING-001`, `SRC-FCP9-CST-RS-2000`, `SRC-FCP9-CST-SZ-2020`, `SRC-FCP9-CST-SS-2026`, `SRC-FCP9-CST-ZUNTZ-2008`, `SRC-FCP9-CST-PDS-2009`, `SRC-FCP9-CST-CDP-2010`, `SRC-FCP2-NULL-DECOMP-001`
- `claim_text`: After FCP-11 null/GR subtraction, optional CST dynamics do not source-bind a selected manifoldlike GR-plus-matter history law, realistic Standard Model matter/calibration remains extension/open, and model-specific phenomenology does not supply a framework-level CST empirical discriminator.
- `assumptions`: FCP-9/FCP-10 CST identity and levels R2/D2/E2, with null QFT/SM calibration used only as comparator rather than inherited CST evidence.
- `classification`: `OPEN`
- `canonicity_level`: framework-level dynamics/realization/empirical selection unresolved.
- `weaker_framework_test`: Possessing a stochastic/quantum-growth family or phenomenological model does not force one physical law or framework-wide empirical signature.
- `physical_bridge`: Order/number and selected continuum/operator bridges exist; complete matter/detector calibration from one selected CST quantum dynamics does not.
- `empirical_binding`: `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`; empirical ladder remains E2 model-specific.
- `falsification_condition`: A source-qualified selected CST quantum dynamics recovering calibrated GR+SM observables and yielding a discriminating prediction would supersede the relevant open status.
- `countermodels`: CSG coupling freedom, incomplete QSG and optional phenomenology block whole-framework promotion.
- `scope_ceiling`: R2 framework-wide continuum; strongest bounded optional dynamics D2; E2 model-specific; null UV incompleteness is not positive CST evidence.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-12 Reduced-NFC/CST comparison claims

## FCP12-CROSS-001 — No nontrivial Reduced-NFC/CST convergence survives dual subtraction

- `framework_ids`: `FW-NFC-RED`, `FW-CST`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP9-CST-BASELINE-001`, `SRC-FCP10-CST-BINDING-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After both Reduced-NFC provenance restriction and FCP-11 CST null/GR subtraction, FCP-12 establishes no E1–E4 pairwise relation and no strong or moderate convergence; six surviving E5 relations are only generic or functional, while CST's causal/discrete carrier, manifold-selection burden and partial realization have no source-bound Reduced-NFC counterpart.
- `assumptions`: Reduced NFC exactly as frozen in FCP-3, canonical CST only after FCP-11 subtraction, and frozen FCP-2 correspondence/independence rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: Generic relational, quotient, observation and local/global structures occur in substantially weaker systems and therefore do not earn distinctive convergence credit.
- `physical_bridge`: No two-sided source-bound E1–E4 physical bridge is established.
- `empirical_binding`: No current Reduced-NFC/CST pairwise empirical discriminator.
- `falsification_condition`: A future source-qualified non-generic E1–E4 relation surviving both provenance and null/GR subtraction would supersede the relevant negative result.
- `countermodels`: Finite description is not CST spacetime discreteness; observational quotient is not order isomorphism; interface structure is not primitive causal order.
- `scope_ceiling`: E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `6`, none `4`; strong `0`, moderate `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP12-CROSS-002 — Congruence, Viability and Interface Sufficiency remain discovery questions rather than convergence results

- `framework_ids`: `FW-NFC-RED`, `FW-CST`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP9-CST-BASELINE-001`, `SRC-FCP10-CST-BINDING-001`, `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-12 identifies no source-bound CST theorem playing the Reduced-NFC Congruence, manifold-Viability or finite Interface-Sufficiency roles; these three remain unresolved discovery questions, while Globalization, Realization and Dynamics are defeated as present convergence candidates by genericity or material asymmetry.
- `assumptions`: the six FCP-3 Reduced-NFC survivor questions and the FCP-11-qualified CST residue.
- `classification`: `OPEN`
- `canonicity_level`: `N/A` for unresolved pairwise discovery questions.
- `weaker_framework_test`: A shared question, generic underdetermination or finite local data does not itself supply a shared theorem.
- `physical_bridge`: No source-bound CST factorization/invariance theorem matching the stated Reduced-NFC roles is identified.
- `empirical_binding`: `NONE` for the three discovery questions.
- `falsification_condition`: A source-bound CST theorem with the exact non-generic logical role of one survivor question could close that discovery item and support a new separately authorized comparison.
- `countermodels`: Current CST stems/intervals/manifoldlikeness definitions and optional dynamics do not force the claimed factorization or viability properties.
- `scope_ceiling`: `UNRESOLVED_DISCOVERY`: Congruence, Viability, Interface Sufficiency; `DEFEATED_AS_CONVERGENCE`: Globalization, Realization, Dynamics.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-13 CQM/null-QM control claims

## FCP13-CQMNULL-001 — CQM/ordinary-QM agreement is lineage-related reformulation and structural refinement, not independent convergence

- `framework_ids`: `FW-CQM`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-CQM-GS-2018`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-13 classifies CQM as a lineage-related process/compositional reformulation and structural refinement of ordinary quantum theory: concrete quantum models support bounded E2 representation relations, but generic category/process/diagram mathematics and lineage-related quantum structure do not count as independently discovered convergence.
- `assumptions`: the four-source CQM window, the established quantum/QFT null sector, and frozen FCP-2 E1–E5/independence rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` for independent convergence; representation canonicity remains model/hypothesis relative.
- `weaker_framework_test`: Generic categories, monoidal composition and string diagrams occur far beyond quantum physics; expected agreement between a theory and its reformulation does not establish independent recurrence.
- `physical_bridge`: Concrete quantum representations provide E2 structure at bounded model/named-extension scope, not whole-family equivalence.
- `empirical_binding`: Standard quantum empirical success is `EMPIRICALLY_INHERITED`, not independent CQM evidence.
- `falsification_condition`: A source-qualified CQM result independently derived under the FCP independence criterion and carrying non-generic physical/empirical consequences could supersede that result's nonconvergence classification.
- `countermodels`: Toy/non-Hilbert categorical models and generic categorical structures block uniqueness and framework-wide identity with ordinary QM.
- `scope_ceiling`: FCP-13 E2 count `6` at bounded representation scope, but independent strong convergence `0`, moderate convergence `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP13-CQMNULL-002 — CQM retains structural and optional-extension residue but no framework-level empirical discriminator

- `framework_ids`: `FW-CQM`
- `source_ids`: `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-CQM-GS-2018`, `SRC-FCP2-KEYS-001`
- `claim_text`: After FCP-13 subtraction, the durable CQM residue is process-first compositional abstraction, representation-independent protocol theorem schemas under named hypotheses, and explicitly optional dagger/compact/classical-interface/CPM/probabilistic-bridge structures; no source-bound framework-level CQM empirical discriminator is identified.
- `assumptions`: generic categorical machinery, diagrammatic presentation and ordinary quantum empirical success are excluded from CQM-specific credit; optional structures are not promoted into minimal core.
- `classification`: `OPEN`
- `canonicity_level`: structural results up to framework/model-relative levels; empirical selection absent.
- `weaker_framework_test`: Generic composition/diagram syntax is available in weaker frameworks; only additional named categorical hypotheses support the retained non-generic schemas.
- `physical_bridge`: Physical semantics/calibration arrives through selected concrete quantum/probabilistic models.
- `empirical_binding`: `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`; reproduced quantum success remains inherited.
- `falsification_condition`: A source-qualified CQM-specific K10 discriminator or proof that an optional package is universally forced by the framework would supersede the corresponding ceiling.
- `countermodels`: Toy/non-Hilbert models and optional-package variation demonstrate that minimal CQM does not uniquely select all ordinary quantum physical structure.
- `scope_ceiling`: structural/optional-extension residue only; no independent CQM E4 relation.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-14 CQM/GPTOPT qualification-remediated claims

## FCP14-CQMGPT-001 — A source-bound CQM/GPTOPT bridge does not qualify for pairwise E2 in the frozen packet

- `framework_ids`: `FW-CQM`, `FW-GPTOPT`
- `source_ids`: `SRC-FCP4-CQM-GS-2018`, `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FCP2-EQUIV-001`
- `claim_text`: Final qualification-remediated FCP-14 preserves a real categorical-probabilistic CQM/GPTOPT bridge but withholds pairwise E2 because the frozen internal packet does not contain the explicit map/functor/representation data required by FCP-2; all positive FCP-14 key relations therefore top out at E5.
- `assumptions`: the closed FCP-14 source window, final remediation-qualified packet, and the frozen FCP-2 requirement that E2 be supported by an explicit declared map/representation preserving the relevant structure.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` pairwise; provenance ceiling controls classification.
- `weaker_framework_test`: Bridge existence and translatable roles do not by themselves establish the exact structure-preserving pairwise representation demanded for E2.
- `physical_bridge`: `SOURCE_BOUND_BRIDGE = YES`; `BRIDGE_MEDIATED = YES`; exact pairwise E2 map not frozen.
- `empirical_binding`: No pairwise E4 discriminator.
- `falsification_condition`: A separately authorized source-strengthening phase freezing the required explicit map data could permit reevaluation; the current packet cannot.
- `countermodels`: The qualification defect in the provisional candidate is the direct negative witness against inferring E2 from bridge existence alone.
- `scope_ceiling`: `E2_NOT_SOURCE_QUALIFIABLE_AT_CURRENT_PACKET = YES`; FCP14 pairwise E2 backfill forbidden.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: Final E-class counts: E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `6`, none `4`.

## FCP14-CQMGPT-002 — CQM and GPTOPT remain materially distinct after dual subtraction

- `framework_ids`: `FW-CQM`, `FW-GPTOPT`
- `source_ids`: `SRC-FCP4-CQM-GS-2018`, `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FCP7-GPT-MAZUREK-2021`, `SRC-FCP8-GPT-AQ-2015`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After generic, quantum-inheritance, bridge-dependence and optional-structure subtraction, FCP-14 finds zero independently justified non-generic CQM/GPTOPT convergence: GPTOPT retains distinct convex/probabilistic geometry, composite-selection burden and broader empirical theory space, while CQM retains named process-theoretic/optional categorical residue; FCP-4 framework separation is preserved.
- `assumptions`: final FCP-13 CQM residue, FCP-7/FCP-8 GPTOPT residue, and final remediation-qualified FCP-14 relationship accounting.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework.
- `weaker_framework_test`: Generic process/probability/composition shells and common quantum targets do not discharge independent-convergence burden.
- `physical_bridge`: The source-bound bridge is retained as translation/interface residue, not a merger or whole-family containment theorem.
- `empirical_binding`: GPTOPT's bounded L2 narrowing does not select CQM; no pairwise empirical discriminator.
- `falsification_condition`: A future source-qualified independent non-generic E1–E4 relation or whole-family equivalence theorem could supersede the relevant separation result.
- `countermodels`: Physical composite-cone ambiguity, operational-equivalence semantics and differing optional/base structures block framework collapse.
- `scope_ceiling`: independent strong convergence `0`; moderate convergence `0`; `FCP4_FRAMEWORK_SEPARATION = PRESERVED`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-15 loop-family source-intake claims

## FCP15-LOOP-001 — FW-LOOP is source-bound as one family with persistent canonical/covariant subframework labels

- `framework_ids`: `FW-LOOP`
- `source_ids`: `SRC-FCP15-LOOP-RS-1995`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP15-LOOP-AB-2021`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-PEREZ-2013`
- `claim_text`: FCP-15 source-binds one top-level loop-quantum-gravity family while requiring persistent `LOOP-CANON` and `LOOP-COVAR` internal labels: common loop quantum-geometry/spin-network lineage and a fixed-graph EPRL boundary bridge are source-bound, but canonical Hamiltonian and covariant spinfoam dynamics remain materially distinct constructions without complete whole-sector equivalence.
- `assumptions`: the exact 13-source FCP-15 window and the FCP-4 framework-separation rule applied without importing adjacent GFT/CDT/tensor/LQC programs into base `FW-LOOP`.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework taxonomy/source-binding level; no physical uniqueness.
- `weaker_framework_test`: Shared graphs/representations alone would be generic; the loop-specific quantum-geometric lineage and named canonical/covariant bridge supply the source-bound family relation.
- `physical_bridge`: EPRL-type fixed-graph spin-network boundary relation is conditional/model scoped; whole physical-Hilbert/dynamics equivalence remains open.
- `empirical_binding`: No empirical selection follows from retaining one framework family.
- `falsification_condition`: A future source intake demonstrating materially different primitive/model-class/physical burdens requiring separate top-level IDs, or a complete equivalence collapsing the sublabels, could motivate separate taxonomy revision.
- `countermodels`: Distinct canonical constraint and covariant amplitude constructions block treating the internal sectors as merely notation.
- `scope_ceiling`: `OUTCOME_B_INTERNAL_SUBFRAMEWORK_DISTINCTION`; `FRAMEWORK_SPLIT_CANDIDATE = 0`; no cross-framework E1–E5 assignment.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP15-LOOP-002 — Mature loop kinematics does not establish unique framework-wide dynamics or continuum GR recovery

- `framework_ids`: `FW-LOOP`
- `source_ids`: `SRC-FCP15-LOOP-AL-1997`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-TG-2024`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-BARRETT-2010`, `SRC-FCP15-LOOP-BMP-2009`, `SRC-FCP15-LOOP-STEINHAUS-2020`, `SRC-FCP15-LOOP-BCMR-2026`, `SRC-FCP15-LOOP-AB-2021`
- `claim_text`: FCP-15 finds mature source-bound spin-network/quantum-geometric kinematics and substantive canonical constraint and covariant spinfoam dynamics programs, but no unique framework-wide physical history law, complete canonical/covariant dynamics equivalence, regulator-independent continuum selection, full physical-observable calibration, or complete 3+1 GR recovery is source-bound.
- `assumptions`: strict separation of L1 kinematics, L2 constraints, L3 formulation-dependent dynamics and L4 semiclassical/coarse-graining/continuum results.
- `classification`: `OPEN`
- `canonicity_level`: framework-wide dynamics, continuum and calibration selection unresolved.
- `weaker_framework_test`: A discrete operator spectrum, graph structure, constraint operator, fixed-complex amplitude or asymptotic expansion does not by itself force physical spacetime discreteness, dynamics or continuum GR.
- `physical_bridge`: Area/volume spectra, EPRL boundary structure, Regge asymptotics, low-order correlations and continuum/coarse-graining constructions provide partial conditional bridges.
- `empirical_binding`: Recovered GR-target behavior is not independent loop empirical confirmation.
- `falsification_condition`: A source-qualified selected loop dynamics with controlled regulator-independent continuum limit, complete physical observables and calibrated GR+matter recovery would supersede the corresponding open burdens.
- `countermodels`: Kinematical spectra without detector bridge; distinct constraint/amplitude choices; fixed-complex gluing; asymptotic/low-order results; open coarse-graining universality.
- `scope_ceiling`: `FRAMEWORK_WIDE_UNIQUE_DYNAMICS_OPEN`; `DISCRETE_COMPOSITION_SOURCE_BOUND / PHYSICAL_GLOBALIZATION_OPEN`; `PARTIAL_REALIZATION / FRAMEWORK_CALIBRATION_OPEN`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: Parameter firewall preserved: Barbero–Immirzi dependence/fitting is not converted into an independent prediction.

## FCP15-LOOP-003 — No framework-level loop empirical discriminator is source-bound

- `framework_ids`: `FW-LOOP`
- `source_ids`: `SRC-FCP15-LOOP-GHM-2012`, `SRC-FCP15-LOOP-AB-2021`, `SRC-FCP15-LOOP-TG-2024`
- `claim_text`: FCP-15 identifies no direct empirical/observational source satisfying the frozen K10 burden for an unavoidable base-`FW-LOOP` discriminator; loop-inspired phenomenology remains intermediate/model dependent and agreement with recovered GR or parameter fitting is not independent framework evidence.
- `assumptions`: base `FW-LOOP` is separated from optional matter/cosmology/black-hole/phenomenology extensions, and empirical inheritance/parameter firewalls are enforced.
- `classification`: `OPEN`
- `canonicity_level`: no framework-level empirical selection.
- `weaker_framework_test`: Phenomenological models can add assumptions not forced by base LQG, so constraining them cannot automatically confirm or exclude the whole framework.
- `physical_bridge`: Proposed Planck-scale phenomenological links exist, but the source record does not establish a compulsory base-framework-to-detector chain.
- `empirical_binding`: `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`; FCP-15 direct empirical source count `0`.
- `falsification_condition`: A source-qualified unavoidable loop prediction with comparator, observable, parameter treatment, uncertainty, experiment and decision criterion satisfying K10 would supersede.
- `countermodels`: Model-dependent dispersion/Lorentz-violation and other loop-inspired phenomenology illustrate the extra-assumption gap.
- `scope_ceiling`: no framework-level K10 evidence; no cross-framework E4 or other E1–E5 relation assigned in FCP-15.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

# FCP-16 Loop/null-GR control claims

## FCP16-LOOPNULL-001 — Loop retains non-generic quantum structure after null/GR subtraction without independent E1–E4 convergence

- `framework_ids`: `FW-LOOP`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP15-LOOP-RS-1995`, `SRC-FCP15-LOOP-AL-1997`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-AB-2021`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-PEREZ-2013`, `SRC-FCP15-LOOP-STEINHAUS-2020`, `SRC-FCP15-LOOP-BCMR-2026`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-16 finds that `FW-LOOP` is not merely a reformulation of GR: after subtracting generic mathematics, classical-GR lineage, optional/model-specific structure, target-conditioned GR recovery and empirical inheritance, a non-generic residue remains in loop quantum-geometric kinematics, canonical/covariant quantum-dynamics programs, their bounded internal bridge, continuum/coarse-graining structure and the Barbero–Immirzi selection burden. However, the closed packet freezes no explicit loop↔GR E2 map and no complete E3 limit/error record, so no independent E1–E4 loop/GR convergence is established.
- `assumptions`: the exact FCP-15 loop source packet, FCP-1/FCP-2 null/GR baseline, and frozen FCP-2 generic-math, independence, physical-bridge and E1–E5 rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework; retained loop structures are framework/model relative at their declared scopes.
- `weaker_framework_test`: PASSES for generic graph/representation/constraint/path-integral machinery and classical-GR lineage; those structures are removed before the loop-specific quantum residue is retained.
- `physical_bridge`: partial quantum-geometric and semiclassical/continuum bridges exist, but complete physical-state, observable/calibration and continuum-GR bridges remain open.
- `empirical_binding`: recovered GR success is `EMPIRICALLY_INHERITED`; no independent loop E4 discriminator.
- `falsification_condition`: an explicit source-qualified loop↔GR E1/E2/E3/E4 relation satisfying the frozen map/limit/physical/empirical burdens could supersede the relevant provenance ceiling, while a source audit showing the retained residue is wholly generic or classical-GR reformulation would require revision.
- `countermodels`: spin-network mathematics without selected dynamics; kinematical spectra without detector bridge; model-dependent canonical/covariant dynamics; fixed-complex asymptotics and open continuum selection.
- `scope_ceiling`: E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `9`, NONE `1`; independent strong convergence `0`, moderate convergence `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: `FW-LOOP` remains one family with persistent `LOOP-CANON` / `LOOP-COVAR` labels; no taxonomy change.

## FCP16-LOOPNULL-002 — Loop dynamics, continuum recovery, calibration and framework-level empirical selection remain open after null control

- `framework_ids`: `FW-LOOP`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-TG-2024`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-PEREZ-2013`, `SRC-FCP15-LOOP-BARRETT-2010`, `SRC-FCP15-LOOP-BMP-2009`, `SRC-FCP15-LOOP-STEINHAUS-2020`, `SRC-FCP15-LOOP-BCMR-2026`, `SRC-FCP15-LOOP-GHM-2012`, `SRC-FCP15-LOOP-AB-2021`, `SRC-NULL-PDG-GR-2026`, `SRC-NULL-LVK-GWTC5-TGR-2026`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After FCP-16 null/GR subtraction, canonical and covariant loop dynamics remain substantive but nonunique/incomplete; fixed-complex Regge asymptotics, low-order metric correlations and continuum-limit structures remain partial and target-conditioned rather than complete GR recovery; the Barbero–Immirzi parameter and detector/observable calibration remain physical-selection burdens; and no unavoidable base-`FW-LOOP` empirical discriminator is source-bound.
- `assumptions`: FCP-15 separation of kinematics, dynamics, optional structures, continuum and phenomenology plus FCP-16 empirical-inheritance and provenance ceilings.
- `classification`: `OPEN`
- `canonicity_level`: framework-wide dynamics, continuum, calibration and empirical selection unresolved.
- `weaker_framework_test`: a constraint operator, named spinfoam amplitude, asymptotic match, refinement structure, fitted parameter or optional phenomenological model does not force a unique physical loop theory or framework discriminator.
- `physical_bridge`: partial/conditional; no complete selected 4D continuum + matter + detector calibration chain.
- `empirical_binding`: `FCP16_INDEPENDENT_LOOP_E4 = 0`; `NO_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR_IDENTIFIED`.
- `falsification_condition`: a source-qualified selected loop dynamics with controlled regulator-independent GR+matter recovery, calibrated physical observables and an unavoidable discriminating prediction would supersede the corresponding open statuses.
- `countermodels`: Hamiltonian regularization freedom, spinfoam model/two-complex dependence, fixed-simplex asymptotics, low-order truncation, continuum-universality gap, gamma calibration and model-specific phenomenology.
- `scope_ceiling`: `FRAMEWORK_WIDE_UNIQUE_DYNAMICS_OPEN`; `COMPLETE_LOOP_GR_CONTINUUM_RECOVERY = OPEN`; `FRAMEWORK_LEVEL_LOOP_PHYSICAL_CALIBRATION = OPEN`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: null quantum-gravity incompleteness is not positive loop evidence; no new external source is added.



---

# FCP-17 Reduced-NFC/loop controlled comparison claims

## FCP17-NFCLOOP-001 — No nontrivial Reduced-NFC/loop convergence survives the dual firewall

- `framework_ids`: `FW-NFC-RED`, `FW-LOOP`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP15-LOOP-RS-1995`, `SRC-FCP15-LOOP-AL-1997`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-AB-2021`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-PEREZ-2013`, `SRC-FCP15-LOOP-STEINHAUS-2020`, `SRC-FCP15-LOOP-BCMR-2026`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After restricting Reduced NFC to the exact FCP-3 comparative object and `FW-LOOP` to the six-item FCP-16 null-subtracted residue, FCP-17 establishes no independently non-generic E1–E4 pairwise convergence. Six keys retain only E5 generic or functional relations, while K2, K4, K9 and K10 have no qualified pairwise correspondence; the closed packet freezes no NFC↔loop E2 map, no NFC↔loop E3 controlled limit, and no pairwise E4 discriminator.
- `assumptions`: frozen FCP-3 Reduced-NFC provenance/genericity ceilings, the FCP-16 loop null/GR subtraction firewall, and unchanged FCP-2 K1–K10/E1–E5 rules.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework; all positive relations remain role/scope bounded.
- `weaker_framework_test`: PASSES for generic relational carriers, quotienting, formal observables, adjacency, composition, refinement and local/global organization; those features occur in substantially weaker systems.
- `physical_bridge`: no two-sided source-bound NFC↔loop physical map is established; loop partial realization remains unmatched by a general Reduced-NFC realization.
- `empirical_binding`: `FCP17_INDEPENDENT_E4 = 0`; inherited GR/QM success and optional phenomenology are excluded.
- `falsification_condition`: a future source-qualified non-generic NFC↔loop E1/E2/E3/E4 relation satisfying the frozen map/limit/physical/empirical burdens would supersede the relevant negative classification.
- `countermodels`: generic relational/network carrier without loop quantum geometry; loop quantum geometry without `T`-relative observational quotient; composition without dynamics; boundary data without FIS; loop-internal bridge without NFC involvement.
- `scope_ceiling`: E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `6`, NONE `4`; independent strong convergence `0`, moderate convergence `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP17-NFCLOOP-002 — Survivor questions produce no non-generic pass and expose dynamics/realization asymmetry

- `framework_ids`: `FW-NFC-RED`, `FW-LOOP`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-TG-2024`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-PEREZ-2013`, `SRC-FCP15-LOOP-STEINHAUS-2020`, `SRC-FCP15-LOOP-BCMR-2026`, `SRC-FCP15-LOOP-AB-2021`, `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-17 finds no non-generic pass among the six Reduced-NFC survivor questions: Congruence and Interface Sufficiency have no frozen loop-residue counterpart, Viability is only weak-generic, Globalization is only a functional analogy, and Realization and Dynamics are defeated as convergence by material asymmetry because loop retains partial physical bridges and substantive quantum-dynamics programs while Reduced NFC supplies neither a general calibrated realization nor a selected physical history law.
- `assumptions`: the FCP-3 six-survivor-question set and only `LOOP-R1` through `LOOP-R6` after FCP-16 subtraction.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` for pairwise survivor status.
- `weaker_framework_test`: shared open questions, invariant-set logic, boundary language and local/global organization are available in weaker frameworks and do not constitute a common theorem.
- `physical_bridge`: loop partial/target-conditioned realization exists at bounded scope; no matching general Reduced-NFC bridge.
- `empirical_binding`: `NONE`; survivor-question outcomes are structural/provenance results.
- `falsification_condition`: a future source-bound loop theorem matching an NFC survivor's exact non-generic logical role, or a source-bound Reduced-NFC physical dynamics/realization matching loop structure, could reopen the corresponding disposition.
- `countermodels`: loop dynamics without NFC congruence; boundary state without finite-interface sufficiency; category-relative colimit without physical continuum; shared realization incompleteness without a pairwise map.
- `scope_ceiling`: `PASS_NON_GENERIC = 0`; Congruence `NO_SOURCE_BOUND_COUNTERPART`; Viability `WEAK_GENERIC`; Interface Sufficiency `NO_SOURCE_BOUND_COUNTERPART`; Globalization `FUNCTIONAL_ANALOGY`; Realization/Dynamics `DEFEATED_AS_CONVERGENCE`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

# FCP-18 program meta-audit claims

## FCP18-META-001 — No independently non-generic multi-framework recurrence survives the closed-corpus subtraction audit

- `framework_ids`: `FW-NFC-RED`, `FW-AQFT`, `FW-GPTOPT`, `FW-CQM`, `FW-CST`, `FW-LOOP`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP3-COMP-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP10-CST-BINDING-001`
- `claim_text`: Across the nine completed pairwise comparison phases through FCP-17, broad recurrences in carriers, quotients, process structure, observables, locality, scale and globalization do not yield an independently motivated non-generic common structure at E1–E4 strength after generic-mathematics, lineage/reformulation, target-conditioned-recovery and empirical-inheritance controls; independent multi-framework strong and moderate convergence recurrence counts are both zero.
- `assumptions`: the exact closed FCP corpus through FCP-17, nine-phase pairwise denominator, frozen FCP-2 independence/equivalence rules and anti-double-counting method of FCP-18.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` program-level meta-result.
- `weaker_framework_test`: PASSES for the recurring generic shells; framework-specific residues remain scientifically substantive but do not coincide independently at the required strength across multiple distinct families.
- `physical_bridge`: no multi-family common physical bridge survives at E1–E4 scope.
- `empirical_binding`: independent framework-level pairwise E4 remains zero.
- `falsification_condition`: a later source-qualified independently motivated non-generic E1/E2/E3/E4 relation recurring across at least two distinct framework families would supersede the bounded zero-recurrence conclusion.
- `countermodels`: AQFT/QFT and CQM/QM lineage relations, CST/GR target-conditioned recovery, LOOP/GR target/lineage relations, and generic Reduced-NFC correspondences demonstrate why raw recurrence is insufficient.
- `scope_ceiling`: closed-corpus result through FCP-17; `INDEPENDENTLY_NONGENERIC_MULTI_FRAMEWORK_RECURRENCE_COUNT = 0`; strong recurrence `0`; moderate recurrence `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP18-META-002 — Reduced NFC has not accumulated repeated independent positive support at the frozen comparative scope

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-LOOP`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP3-COMP-001`, `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: The four completed Reduced-NFC pairwise comparisons—against the null baseline, AQFT residue, CST residue and LOOP residue—each establish E1=E2=E3=E4=0 and independent strong/moderate convergence=0; surviving positive relations are E5 generic/functional, Interface Sufficiency repeatedly remains a discovery/no-counterpart question, and Dynamics/Realization repeatedly appear as asymmetries. Reduced NFC therefore does not satisfy the FCP-18 burden for repeated independent positive support.
- `assumptions`: Reduced NFC exactly as frozen in FCP-3 and the explicit repeated-support burden requiring the same non-generic structure to recur independently in at least two comparator families at E1/E2/E3 or sufficiently specific E4 strength.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` program-level evidentiary result.
- `weaker_framework_test`: E5 quotient, relational, interface and globalization similarities occur in weaker or unrelated frameworks and cannot discharge the non-generic support burden.
- `physical_bridge`: no repeated two-sided Reduced-NFC physical bridge is source-qualified.
- `empirical_binding`: `REDUCED_NFC_INDEPENDENT_E4 = 0` across the four completed comparisons.
- `falsification_condition`: two or more independent comparator families source-qualifying the same non-generic Reduced-NFC structure at E1/E2/E3 or sufficiently specific E4 would reopen the result.
- `countermodels`: repeated E5-only recurrence and repeated absence of a comparator FIS theorem show why repeated questions or vocabulary are not repeated support.
- `scope_ceiling`: `HAS_REDUCED_NFC_ACCUMULATED_REPEATED_INDEPENDENT_SUPPORT = NO`; not a claim that Reduced NFC is false or incapable of future stronger evidence.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP18-META-003 — Framework-level empirical selection is the most universal current bottleneck

- `framework_ids`: `FW-NULL-GRQFTSM`, `FW-NFC-RED`, `FW-AQFT`, `FW-GPTOPT`, `FW-CQM`, `FW-CST`, `FW-LOOP`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP7-GPT-MAZUREK-2021`, `SRC-FCP8-GPT-RINGBAUER-2014`
- `claim_text`: Independent framework-level E4 is zero across all nine completed pairwise phases; K10 has no independent pairwise framework discriminator in 9/9 phases, while empirical-inheritance control materially affects 8/9 and GPTOPT, CST and LOOP contain bounded/model-specific empirical structures that do not select the base framework. The null baseline's established empirical success remains genuine comparator evidence but is not transferable as independent competitor credit.
- `assumptions`: frozen K10/E4 requirements and separation of direct framework-level prediction from inheritance, parameter fitting and optional/model-specific phenomenology.
- `classification`: `OPEN`
- `canonicity_level`: framework-level empirical selection remains unresolved across the competitor corpus.
- `weaker_framework_test`: compatibility with tested GR/QM/QFT or exclusion of an optional phenomenological model does not uniquely select a base foundational framework.
- `physical_bridge`: varies by framework; absence of a compulsory base-framework-to-detector chain is part of the bottleneck.
- `empirical_binding`: null direct evidence is preserved; bounded GPTOPT/CST evidence is preserved at its actual scope; no independent framework-level pairwise E4 relation is promoted.
- `falsification_condition`: an unavoidable framework-level prediction with comparator, observable, parameter treatment, uncertainty, data and decision rule satisfying K10 would supersede the corresponding open status.
- `countermodels`: empirical inheritance through reformulation/recovery and optional phenomenology demonstrate why observed compatibility is insufficient for framework selection.
- `scope_ceiling`: `INDEPENDENT_FRAMEWORK_LEVEL_E4_COUNT = 0`; `FRAMEWORK_LEVEL_EMPIRICAL_SELECTION = MOST_UNIVERSAL_CURRENT_BOTTLENECK`; dynamics and realization remain separate major burdens.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP18-META-004 — Frozen provenance and subtraction controls materially affect conclusions without establishing a governance defect

- `framework_ids`: `FW-NULL-GRQFTSM`, `FW-NFC-RED`, `FW-AQFT`, `FW-GPTOPT`, `FW-CQM`, `FW-CST`, `FW-LOOP`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP3-COMP-001`
- `claim_text`: The closed-corpus self-audit finds that preregistered genericity, lineage/reformulation, target-conditioned-recovery, empirical-inheritance, countermodel and provenance controls repeatedly change or limit scientific interpretations while still permitting bounded stronger relations when their records are explicit. FCP-14's E2 downgrade is a direct self-correction case; FCP-5/FCP-11/FCP-13 show that E2/E3 are not categorically prohibited; FCP-16/FCP-17 preserve valid underlying structures while withholding stronger pairwise labels. No framework-neutral governance defect or unremediated prior scientific error is established.
- `assumptions`: historical candidates/remediations are preserved as evidence, phase roles are separated before aggregation, and no numerical rescoring or retroactive rule change is performed.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: methodological record of the frozen FCP corpus; no claim of universal optimality.
- `weaker_framework_test`: not a convergence claim; the relevant test is whether the controls discriminate among reformulation, genericity, target recovery, additional structure and open burdens rather than deleting all positive relations.
- `physical_bridge`: `N/A` program-method result.
- `empirical_binding`: `NONE`; no claim that methodological performance empirically validates a framework.
- `falsification_condition`: discovery of a framework-neutral missing dimension, systematic contradiction, or rule that blocks source-qualified relations despite complete E1–E5 records would motivate a separately authorized governance review or remediation.
- `countermodels`: qualified FCP-5/FCP-11/FCP-13 relations are negative witnesses against the claim that the rules automatically force all relations to E5/NONE.
- `scope_ceiling`: `GOVERNANCE_REVIEW_CANDIDATE = 0`; `PRIOR_RESULT_REMEDIATION_CANDIDATE = 0`; no key weighting, ranking or governance v0.2 authorized.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`


---

# FCP-19 Asymptotic Safety source-intake claims

## FCP19-AS-001 — `FW-AS` is source-bound as one coherent framework

- `framework_ids`: `FW-AS`
- `source_ids`: `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-NR-2006`, `SRC-FCP19-AS-CRIT-2020`, `SRC-FCP19-AS-EICHHORN-2026`
- `claim_text`: FCP-19 source-binds `FW-AS` as one coherent asymptotic-safety framework centered on the hypothesis that a physically appropriate interacting gravitational UV RG fixed point with a finite-dimensional UV critical surface provides a continuum quantum-gravity completion; functional-RG machinery, finite truncations, robustness studies, gravity-matter systems, Lorentzian constructions and phenomenology are retained as implementation/evidence layers rather than separate top-level frameworks.
- `assumptions`: bounded 18-source FCP-19 corpus and frozen FCP-4 framework-separation rule.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework identity only; no cross-framework convergence class.
- `weaker_framework_test`: generic RG/QFT fixed-point mathematics is insufficient; the AS-specific commitment is the gravitational interacting fixed-point/critical-surface hypothesis plus its source-bound evidence.
- `physical_bridge`: partial; Lorentzian and UV–IR realization programs are nonempty but incomplete.
- `empirical_binding`: no unavoidable framework-level discriminator is source-bound.
- `falsification_condition`: source evidence demonstrating materially distinct AS programs with different primitive commitments/model classes/physical scopes/empirical burdens would reopen taxonomy.
- `countermodels`: different calculational implementations alone do not force framework splitting.
- `scope_ceiling`: `FCP19_AS_TAXONOMY = OUTCOME_A_ONE_FRAMEWORK`; `FRAMEWORK_SPLIT_CANDIDATE = 0`; no E1–E5 comparison.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP19-AS-002 — Gravitational fixed-point evidence reaches multi-truncation robustness scope but not an exact complete-theory theorem

- `framework_ids`: `FW-AS`
- `source_ids`: `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-LR-2002`, `SRC-FCP19-AS-CPR-2009`, `SRC-FCP19-AS-FLNR-2016`, `SRC-FCP19-AS-FKLR-2018`, `SRC-FCP19-AS-DBOPT-2018`, `SRC-FCP19-AS-EICHHORN-2026`
- `claim_text`: The bounded corpus contains broad recurring non-Gaussian gravitational UV fixed-point evidence across increasingly large Euclidean truncations/operator bases and nontrivial regulator/truncation robustness checks, sufficient for `FCP19_STRONGEST_FIXED_POINT_EVIDENCE = AS-L3_MULTI_TRUNCATION_ROBUSTNESS`; it does not source-qualify an exact complete-theory fixed-point theorem or exact physical UV-critical-surface dimension, and explicit parametrization dependence prevents promotion of small truncation-level relevant-direction counts to one exact physical integer.
- `assumptions`: evidence ladder is source-scope bookkeeping only; exact/formal flow equations are distinguished from projected truncation solutions.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded evidence statement, not proof of universal AS validity.
- `weaker_framework_test`: persistence across multiple truncations is stronger than a single-model fixed point but remains weaker than complete theory-space control.
- `physical_bridge`: continuum interpretation is conditional on persistence and a suitable global physical trajectory.
- `empirical_binding`: none directly.
- `falsification_condition`: exact complete-theory construction could strengthen the ceiling; systematic disappearance under controlled enlargement could weaken it.
- `countermodels`: field-parametrization dependence, omitted operator sectors and background/dynamical distinctions block exactification.
- `scope_ceiling`: `COMPLETE_THEORY_FIXED_POINT_THEOREM = NO`; `EXACT_PHYSICAL_CRITICAL_SURFACE_DIMENSION = OPEN`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP19-AS-003 — Physical realization is partial and no unavoidable base-framework empirical discriminator is source-bound

- `framework_ids`: `FW-AS`
- `source_ids`: `SRC-FCP19-AS-MRS-2011`, `SRC-FCP19-AS-SW-2025`, `SRC-FCP19-AS-DEP-2014`, `SRC-FCP19-AS-MPR-2016`, `SRC-FCP19-AS-PR-2024`, `SRC-FCP19-AS-GRS-2019`, `SRC-FCP19-AS-PLATANIA-2024`, `SRC-FCP19-AS-EICHHORN-2026`
- `claim_text`: FCP-19 source-binds substantive Lorentzian fixed-point/signature-robustness work, gravity-matter fixed-point studies, selected UV–IR/GR-like trajectories and nonempty particle/cosmology/black-hole phenomenology, while retaining implementation/trajectory/calibration dependence; completed Lorentzian unitary realization, unique realistic gravity-matter trajectory, complete physical-observable calibration and an unavoidable detector-level base-`FW-AS` empirical discriminator remain open.
- `assumptions`: compatibility, trajectory selection, parameter fitting and optional phenomenology are not promoted to compulsory framework predictions.
- `classification`: `OPEN`
- `canonicity_level`: physical-realization/empirical-boundary status.
- `weaker_framework_test`: recovery of successful GR/QFT behavior or existence of optional phenomenology does not independently select AS.
- `physical_bridge`: nonempty but partial (`AS-L4` maximum at FCP-19 scope).
- `empirical_binding`: `DIRECT_EMPIRICAL_SOURCE_COUNT = 0`; `AS-L5 = NONE`; `FCP19_AS_K10 = NO_CURRENT_BASE_FRAMEWORK_DISCRIMINATOR`.
- `falsification_condition`: a source-bound compulsory AS prediction with detector observable, parameter treatment, uncertainty and decision rule would reopen K10; a complete Lorentzian realistic trajectory could strengthen K9.
- `countermodels`: RG-improved black holes, trajectory-calibrated scales and approximation-dependent matter bounds show why optional/model results cannot bind the base framework.
- `scope_ceiling`: `COMPLETE_LORENTZIAN_UNITARY_REALIZATION = OPEN`; framework empirical selection open.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`


---

# FCP-20 Asymptotic Safety/null-GR control claims

## FCP20-ASNULL-001 — Asymptotic Safety retains a non-generic null-subtracted residue without independent E1–E4 convergence

- `framework_ids`: `FW-AS`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-CPR-2009`, `SRC-FCP19-AS-FLNR-2016`, `SRC-FCP19-AS-FKLR-2018`, `SRC-FCP19-AS-DBOPT-2018`, `SRC-FCP2-NULL-DECOMP-001`, `SRC-FCP2-EQUIV-001`
- `claim_text`: FCP-20 finds that `FW-AS` is not merely a reformulation of the null GR/QFT baseline: after subtracting generic RG mathematics, QFT/RG lineage, classical-GR lineage/target content, model/truncation dependence, optional phenomenology and empirical inheritance, a six-item AS-specific residue survives around the interacting gravitational UV fixed-point hypothesis, finite-dimensional UV-critical-surface architecture, AS-L3 multi-truncation robustness evidence, fixed-point-defined continuum/trajectory program, partial Lorentzian/gravity-matter realization and the remaining physical-trajectory/calibration/empirical-selection burden. The closed packet nevertheless source-qualifies no pairwise E1, E2, E3 or E4 relation; K1–K9 top out at E5 and K10 is NONE.
- `assumptions`: exact FCP-19 18-source AS packet, exact FCP-1/FCP-2 null baseline, frozen FCP-2 K1–K10/E1–E5 rules, and ordered generic/lineage/target/model/optionality/empirical subtraction.
- `classification`: `NONFORCED`
- `canonicity_level`: `N/A` cross-framework; residue items retain the FCP-19 hypothesis/evidence/realization ceilings.
- `weaker_framework_test`: generic effective-action/RG/fixed-point mathematics, QFT RG machinery, GR variables and GR-like infrared targets are removed before the gravitational fixed-point/critical-surface residue is retained.
- `physical_bridge`: partial; selected UV–IR, Lorentzian and gravity–matter bridges exist, but no complete framework-wide calibrated physical map is source-bound.
- `empirical_binding`: `FCP20_INDEPENDENT_AS_E4 = 0`; recovered GR/QFT success and fitted low-energy inputs remain inherited/calibrational rather than independent AS evidence.
- `falsification_condition`: a future source-qualified AS↔null E1/E2/E3/E4 relation satisfying the frozen map/limit/physical/empirical burdens could supersede the corresponding pairwise ceiling; evidence showing the retained residue is wholly generic or inherited would require revision.
- `countermodels`: exact flow equation without exact solution; repeated truncation fixed points without complete-theory theorem; shared RG machinery without AS; GR-like IR recovery without independent empirical credit.
- `scope_ceiling`: `FCP20_NULL_SUBTRACTED_AS_RESIDUE_NONEMPTY = YES`; residue items = 6; E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `9`, NONE `1`; independent strong convergence `0`, moderate convergence `0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP20-ASNULL-002 — Complete AS fixed-point closure, physical trajectory selection, realization and framework-level empirical selection remain open

- `framework_ids`: `FW-AS`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP19-AS-MRS-2011`, `SRC-FCP19-AS-SW-2025`, `SRC-FCP19-AS-DEP-2014`, `SRC-FCP19-AS-MPR-2016`, `SRC-FCP19-AS-GRS-2019`, `SRC-FCP19-AS-PR-2024`, `SRC-FCP19-AS-EICHHORN-2026`, `SRC-NULL-PDG-GR-2026`, `SRC-FCP2-EQUIV-001`
- `claim_text`: After FCP-20 null/GR subtraction, the strongest gravitational fixed-point evidence remains `AS-L3_MULTI_TRUNCATION_ROBUSTNESS`; an exact complete-theory fixed-point theorem, exact physical UV-critical-surface dimension, complete scheme/gauge/parametrization independence, unique realistic UV–IR trajectory, full Lorentzian nonperturbative unitarity/causal-observable realization, complete realistic gravity–matter calibration and an unavoidable base-framework empirical discriminator remain open. Selected GR-like recovery is target-conditioned and does not supply independent AS E3/E4 credit at the closed-packet provenance ceiling.
- `assumptions`: FCP-19 evidence ladder and optionality firewalls remain unchanged; FCP-20 does not reopen the source window or reconstruct missing E2/E3 records from general knowledge.
- `classification`: `OPEN`
- `canonicity_level`: complete-theory, realization and empirical-selection status unresolved.
- `weaker_framework_test`: multi-truncation robustness is stronger than a single-model result but weaker than complete theory-space control; compatibility/recovery can be achieved with fitted/selected inputs and therefore does not force framework selection.
- `physical_bridge`: nonempty and substantive but partial/conditional; no complete detector-calibrated chain from AS-H to unavoidable observables.
- `empirical_binding`: `DIRECT_EMPIRICAL_SOURCE_COUNT = 0`; `AS-L5 = NONE`; `FCP20_INDEPENDENT_AS_E4 = 0`.
- `falsification_condition`: a complete source-qualified physical AS construction with controlled GR+matter realization, calibrated observables and an unavoidable discriminating prediction could strengthen these open statuses.
- `countermodels`: parametrization-dependent relevant-direction counts; multiple critical-surface trajectories; Lorentzian truncation without full unitarity; approximation-dependent matter bounds; optional RG-improved phenomenology.
- `scope_ceiling`: `COMPLETE_THEORY_FIXED_POINT_THEOREM = NO`; `EXACT_PHYSICAL_CRITICAL_SURFACE_DIMENSION = OPEN`; `COMPLETE_LORENTZIAN_UNITARY_REALIZATION = OPEN`; `NO_CURRENT_BASE_FRAMEWORK_DISCRIMINATOR`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`


---

# FCP-21 Reduced NFC / null-subtracted Asymptotic-Safety comparison claims

## FCP21-NFCAS-001 — Dual-firewall comparison yields no independently non-generic NFC/AS E1–E4 relation

- `framework_ids`: `FW-NFC-RED`, `FW-AS`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-CPR-2009`, `SRC-FCP19-AS-FLNR-2016`, `SRC-FCP19-AS-FKLR-2018`, `SRC-FCP19-AS-DBOPT-2018`
- `claim_text`: FCP-21 compares the exact FCP-3 Reduced-NFC object only against AS-R1 through AS-R6 from the FCP-20 null-subtracted Asymptotic-Safety residue and finds no independently non-generic E1, E2, E3 or E4 relation. Four K-keys retain only E5 functional relations and six are NONE; independent strong and moderate convergence are zero; `FCP21_INDEPENDENT_E4 = 0`; and all six Reduced-NFC survivor questions have `PASS_NON_GENERIC = NO`, so `FCP21_SURVIVOR_PASS_NON_GENERIC = 0`.
- `assumptions`: exact FCP-3 Reduced-NFC source binding and genericity firewall; exact FCP-20 six-item AS residue and null/GR-subtraction firewall; frozen FCP-2 K1–K10/E1–E5 rules; closed packet with no new source intake.
- `classification`: `NONFORCED`
- `canonicity_level`: pairwise comparison only; no program-level rescoring or claim that either framework is false.
- `weaker_framework_test`: generic quotient/process/finite/stability/colimit mathematics on the NFC side and generic RG/QFT/GR-lineage structures on the AS side are removed before convergence credit; surviving relations do not meet E1–E4 independence requirements.
- `physical_bridge`: Reduced NFC lacks a general calibrated physical-realization map; AS has partial physical realization but incomplete trajectory/calibration closure.
- `empirical_binding`: neither side supplies a pairwise foundational discriminator at the frozen scope; shared absence does not constitute E4.
- `falsification_condition`: a future source-qualified NFC↔AS E1/E2/E3/E4 relation satisfying the frozen object-type, provenance, independence, physical-bridge and empirical burdens could supersede the corresponding pairwise ceiling.
- `countermodels`: fixed point without partition stabilization; partition stabilization without fixed point; colimit without physical continuum limit; shared empirical absence without E4.
- `scope_ceiling`: E1 `0`, E2 `0`, E3 `0`, E4 `0`, E5-only `4`, NONE `6`; independent strong convergence `0`; moderate convergence `0`; `FCP21_SURVIVOR_PASS_NON_GENERIC = 0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

## FCP21-NFCAS-002 — K7 fixed/finite/scale similarities are type-mismatched and AS partial realization remains materially asymmetric

- `framework_ids`: `FW-NFC-RED`, `FW-AS`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-CPR-2009`, `SRC-FCP19-AS-FLNR-2016`, `SRC-FCP19-AS-FKLR-2018`, `SRC-FCP19-AS-DBOPT-2018`, `SRC-FCP19-AS-MRS-2011`, `SRC-FCP19-AS-SW-2025`, `SRC-FCP19-AS-EICHHORN-2026`
- `claim_text`: FCP-21's focused K7 and realization audits find that the AS gravitational RG fixed point is not NFC fixed-carrier partition stabilization, the finite-dimensional UV critical surface is not interface capacity or Interface Sufficiency, relevant RG directions are not interface-visible novelty distinctions, AS multi-truncation robustness is evidence rather than NFC process congruence or weak-coupling stability, and the AS UV→IR trajectory program is not categorical colimit completion. FCP-20's nonempty partial Lorentzian/gravity-matter AS realization therefore creates a material asymmetry with the Reduced-NFC core, whose general physical realization and selected physical-history law remain unestablished.
- `assumptions`: object types are preserved; AS-R3 is evidence, AS-R6 is an open burden, and no FCP-20-subtracted generic RG/QFT/GR shell or rejected NFC physical interpretation is restored.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded type/realization comparison; no claim that future mappings are impossible.
- `weaker_framework_test`: identical words such as fixed, stable, finite, trajectory, global or completion receive no credit without shared typed structure; each apparent K7/K8 upgrade is defeated by explicit countermodels.
- `physical_bridge`: AS partial physical bridge = nonempty but incomplete; Reduced-NFC general physical bridge = not established.
- `empirical_binding`: `FCP21_INDEPENDENT_E4 = 0`; no detector-level pairwise discriminator is source-bound.
- `falsification_condition`: an explicit provenance-qualified map/limit showing material structure preservation between the relevant NFC and AS objects, or a source-bound Reduced-NFC physical realization matching AS at the required scope, could strengthen the relation.
- `countermodels`: RG fixed point without finite partition stabilization; finite critical surface without interface factorization; relevant eigendirections without novelty bits; colimit without RG trajectory; partial AS Lorentzian realization without Reduced-NFC realization.
- `scope_ceiling`: K7 `TYPE_MISMATCH_AFTER_GENERICITY_SUBTRACTION`, NONE; K8 E5-only functional analogy with type mismatch; K9 `MATERIAL_ASYMMETRY`, NONE.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`

---

## Rules

- One primary classification per claim.
- A claim may not exceed the authority of its sources and bridges.
- Negative and nonforcing results remain preserved when later work supersedes a stronger claim.
- No framework-level numerical score is inferred automatically from individual claim rows.
- Cross-framework convergence credit requires the frozen FCP-2 correspondence and weaker-framework rules.
- Reformulation relations must not be counted as independent convergence unless the independence burden is explicitly discharged.
- `ACCEPTED` records scope-time acceptance, not immunity from later qualification or partial supersession; present-tense use must follow the latest applicable durable row and live current-state surfaces.
- Partial supersession does not require destructive historical-row mutation. A later accepted row may narrow or replace only the affected current subclaim while the historical row remains preserved for provenance.


---

# Post-FCP-21 current-state propagation claims

## FCP-TSS-AQFT-001 — AQFT split/nuclearity source gap is closed at bounded formal/physical scope

- `framework_ids`: `FW-AQFT`
- `source_ids`: `SRC-FCP-TSS-AQFT-DL-1984`, `SRC-FCP-TSS-AQFT-BW-1986`, `SRC-FCP-TSS-AQFT-FEWSTER-2016`, `SRC-FCP-TSS-AQFT-SUMMERS-2009`
- `claim_text`: Targeted source strengthening source-qualifies the AQFT split property and nuclearity chain at declared inclusion/model scopes: a split inclusion interposes a type-I factor and supports a spatial tensor-product/product-state separation structure, while named nuclearity conditions provide source-qualified sufficient routes and phase-space control. This closes the bounded research gap without making split universal, identifying a finite interface, or establishing a framework-level empirical discriminator.
- `assumptions`: exact targeted-strengthening AQFT source packet; positive-separation/split-inclusion and variant-specific nuclearity hypotheses; no promotion from model/inclusion scope to minimal AQFT axioms.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: source-qualified at named inclusion/model scope; no universal framework canonicity claimed.
- `weaker_framework_test`: tensor factorization and phase-space/nuclearity mathematics are not uniquely AQFT; the physically specialized split/nuclearity theorem chain is retained only at its source-qualified scope.
- `physical_bridge`: AQFT local-algebra and state-separation semantics; no finite-interface or detector-calibration identity.
- `empirical_binding`: `NONE` as an independent AQFT framework discriminator.
- `falsification_condition`: failure of the split/nuclearity implications under their stated hypotheses or a source audit showing the admitted sources do not support the claimed scope would downgrade the row.
- `countermodels`: distal/non-split examples and model/covariance cases without split block universality.
- `scope_ceiling`: `AQFT_SPLIT_NUCLEARITY_GAP = CLOSED`; no universal split theorem, finite-interface theorem, or EMP4 promotion.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: targeted source strengthening commit `d9663a9a85d4ec6e0da4a0d82d4a8bba054d922c`; adjudication blob `ad527b6c40e258110d4c2ac23e77ebcddc8b529d`; handoff blob `cad553e8f2323a4de7bd3cc6e3d151fa72a04d61`.

## FCP-TSS-LOOP-001 — Strengthened LOOP has bounded target-conditioned continuum/GR recovery without framework EMP4

- `framework_ids`: `FW-LOOP`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP15-LOOP-BARRETT-2010`, `SRC-FCP15-LOOP-BMP-2009`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-LOOP-HLL-2020`, `SRC-FCP-TSS-LOOP-HAN-2017`, `SRC-FCP-TSS-LOOP-BAHR-STEINHAUS-2016`
- `claim_text`: The strengthened LOOP corpus contains source-qualified fixed-building-block `E3-S` and selected model-level `E3-M` recovery toward Einstein/GR behavior, including refined/regularized, linearized-spin-2 and bounded perturbative/continuum results. These are positive target-conditioned recovery relations and viability evidence, while framework-level `E3-F`, `E3-P`, operational calibration and EMP4 remain unestablished.
- `assumptions`: exact strengthened LOOP source packet; recovery target is supplied GR/Einstein content; model/building-block/domain restrictions are preserved.
- `classification`: `VALID_CONDITIONAL`
- `canonicity_level`: bounded substructure/model recovery only; no framework-wide recovery canonicity.
- `weaker_framework_test`: recovering a supplied GR target can occur in multiple frameworks and does not by itself establish independent foundational convergence.
- `physical_bridge`: partial target-conditioned semiclassical/continuum bridge; no complete framework-to-detector calibration chain.
- `empirical_binding`: recovered GR success is inherited; `LOOP_FRAMEWORK_LEVEL_EMP4 = NONE`.
- `falsification_condition`: failure of the stated controlled limits/recovery records would weaken the positive E3 content; a complete framework-wide calibrated recovery could strengthen the ceiling.
- `countermodels`: fixed-complex/building-block recovery without framework continuum uniqueness; model recovery without selected dynamics.
- `scope_ceiling`: `LOOP_CONTINUUM_PHYSICAL_RECOVERY_GAP = PARTIALLY_CLOSED`; `E3-S` and selected `E3-M` nonempty; `E3-F = NONE`; `E3-P = NONE`; EMP4 none.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current-successor content for the E3-zero subclaim of `FCP16-LOOPNULL-001`; historical FCP-16 remains accepted at its frozen scope. Canonical provenance: equal-standard audit blob `44eba6d79b06a96c67cfd6dd78cf3a0af6d45df1`; targeted-strengthening adjudication blob `ad527b6c40e258110d4c2ac23e77ebcddc8b529d`.

## FCP-TSS-AS-001 — Strengthened AS has bounded target-conditioned and Lorentzian model recovery without framework EMP4

- `framework_ids`: `FW-AS`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP-TSS-AS-ALR-2026`, `SRC-FCP-TSS-AS-PPR-2023`, `SRC-FCP-TSS-AS-KNORR-2026`, `SRC-FCP19-AS-MRS-2011`, `SRC-FCP19-AS-SW-2025`
- `claim_text`: The strengthened AS corpus source-qualifies selected global UV-to-IR and Lorentzian model-level `E3-M` recovery/realization results and a timelike model observable, while preserving trajectory, truncation, gauge, parameter and calibration dependence. These results provide positive target-conditioned recovery/viability content but no framework-wide EMP4 or unavoidable AS discriminator.
- `assumptions`: exact strengthened AS source packet; model/truncation and trajectory qualifications are retained; GR/QFT/SM recovery targets are supplied rather than independently rediscovered.
- `classification`: `VALID_CONDITIONAL`
- `canonicity_level`: bounded model/trajectory recovery and Lorentzian realization only.
- `weaker_framework_test`: target recovery and model observables do not uniquely select the AS framework or establish complete-theory control.
- `physical_bridge`: nonempty model-level Lorentzian/trajectory bridge; framework-wide calibration remains incomplete.
- `empirical_binding`: timelike model prediction and consistency evidence do not satisfy framework EMP4; inherited low-energy success is not independent AS selection.
- `falsification_condition`: failure of the admitted model calculations or controlled recovery records would downgrade; a compulsory calibrated framework prediction could strengthen the empirical ceiling.
- `countermodels`: alternative truncations/trajectories and parameter-sensitive realizations block framework-wide promotion.
- `scope_ceiling`: selected `E3-M` nonempty; timelike model observable nonempty; `FRAMEWORK_EMP4 = NONE`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current-successor content for the E3-zero subclaim of `FCP20-ASNULL-001`; historical FCP-20 remains accepted at its frozen scope. Canonical provenance: equal-standard audit blob `44eba6d79b06a96c67cfd6dd78cf3a0af6d45df1`; targeted-strengthening adjudication blob `ad527b6c40e258110d4c2ac23e77ebcddc8b529d`.

## FCP22-NFCAQFT-001 — Strengthened AQFT supplies a generic FIS factorization/separation analogue only

- `framework_ids`: `FW-NFC-RED`, `FW-AQFT`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP-TSS-AQFT-DL-1984`, `SRC-FCP-TSS-AQFT-FEWSTER-2016`, `SRC-FCP-TSS-AQFT-SUMMERS-2009`
- `claim_text`: Under Method 0.2.0, Reduced-NFC Interface Sufficiency and strengthened AQFT split/nuclearity share a bounded formal factorization/separation role at `E5`, but there is no exact FIS identity, pairwise E2 map, controlled pairwise E3 recovery, pairwise E4 discriminator, finite-interface identity, or non-generic foundational relation.
- `assumptions`: exact FCP-3 Reduced-NFC object; exact targeted-strengthened AQFT object; FCP-22 claim-sensitive comparison and genericity controls.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: `S0` generic formal-role relation only.
- `weaker_framework_test`: condition-dependent factorization/separation occurs in substantially weaker mathematics and therefore cannot establish distinctive foundational convergence.
- `physical_bridge`: no common calibrated physical interface or locality bridge.
- `empirical_binding`: `PAIRWISE_EMPIRICAL_SELECTION = NO`.
- `falsification_condition`: a source-qualified non-generic map/limit or operational relation preserving the relevant FIS structure could supersede the generic ceiling.
- `countermodels`: split without selected-query sufficiency; FIS without AQFT type-I split structure; infinite-dimensional AQFT local algebras without finite interface.
- `scope_ceiling`: one generic `E5_FUNCTIONAL_RELATION`; pairwise E1–E4 none; no NFC empirical support.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: partial current-subclaim successor to `FCP6-CROSS-001`; unaffected FCP-6 generic relations remain current. Canonical provenance: FCP-22 comparison blob `bdd99d3fc46b22e24771905e3587ad0e5e5fa23e`; handoff blob `e807bf9e6731bb928039836d53768aa0b3f2fab7`.

## FCP23-EMP-001 — No current framework-level discriminator or no-go survives the bounded FCP-23 screen

- `framework_ids`: `FW-CST`, `FW-AS`
- `source_ids`: `SRC-FCP23-CST-CCS-2023`, `SRC-FCP23-CST-CCS-2024`, `SRC-FCP23-CST-GOS-2018`, `SRC-FCP23-AS-EPS-2025`, `SRC-FCP23-AS-KNORR-PROP-2026`, `SRC-FCP23-AS-PW-2020`
- `claim_text`: FCP-23 identifies no source-qualified framework-level empirical discriminator and no framework-level no-go candidate at the declared source scope. The strongest tested adverse results remain below framework scope because core-preserving realization/model/truncation/parameter escapes remain available.
- `assumptions`: exact preregistered FCP-23 targets and frozen 19-source adjudicative corpus; framework-level exclusion requires coverage of all core-preserving realizations or a compulsory operational discriminator.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded current feasibility conclusion only.
- `weaker_framework_test`: exclusion of a model, truncation, parameter region or realization does not exclude a whole framework.
- `physical_bridge`: target-specific and incomplete at framework scope.
- `empirical_binding`: `FRAMEWORK_LEVEL_DISCRIMINATOR_IDENTIFIED = NO`; `FRAMEWORK_LEVEL_NO_GO_CANDIDATE_IDENTIFIED = NO`.
- `falsification_condition`: a theorem covering every core-preserving realization or a compulsory calibrated framework prediction could supersede this current bounded result.
- `countermodels`: CST action-weighted/restricted continuum escapes and AS model/truncation/gauge/trajectory variation block framework-wide promotion.
- `scope_ceiling`: `NO_CURRENT_FRAMEWORK_LEVEL_DISCRIMINATOR_IDENTIFIED_AT_THE_DECLARED_SOURCE_SCOPE`; not impossibility in principle.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-23 adjudication blob `f2a034e55c14e73db34cbfe15566457aea9e5ce2`; handoff blob `dd0067c1e8199968ef556e70039abb592a0571b5`.

## FCP23-EMP-002 — FCP-23 preserves real model/parameter constraints below framework exclusion

- `framework_ids`: `FW-CST`, `FW-AS`
- `source_ids`: `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP9-CST-SURYA-2019`, `SRC-FCP23-CST-GOS-2018`, `SRC-FCP23-CST-CCS-2023`, `SRC-FCP23-CST-CCS-2024`, `SRC-FCP-TSS-AS-KNORR-2026`, `SRC-FCP23-AS-PW-2020`, `SRC-FCP-TSS-AS-FLPR-2023`, `SRC-FCP-TSS-AS-PRW-2025`, `SRC-FCP-TSS-AS-ALR-2026`, `SRC-FCP23-AS-KNORR-PROP-2026`, `SRC-FCP23-AS-EPS-2025`
- `claim_text`: The bounded FCP-23 corpus contains real model-level discriminators and parameter/realization constraints: CST generic-order non-manifoldlikeness is a serious realization pressure with strongest qualified exclusion scope `EXCL-R`, while AS scattering/ghost/spectral/pole/positivity results reach strongest qualified scope `EXCL-M`. Neither result is promoted to framework exclusion.
- `assumptions`: exact target-specific model and realization assumptions in the FCP-23 frozen corpus.
- `classification`: `VALID_CONDITIONAL`
- `canonicity_level`: model/realization constraint scope only; not framework selection.
- `weaker_framework_test`: bounded adverse evidence is retained even when it cannot discriminate the full framework.
- `physical_bridge`: target/model dependent.
- `empirical_binding`: `NONE_DIRECT`; `FCP23_EMPIRICAL_STATUS = EMP0_NONE`. The retained results are theoretical/model/parameter/realization constraints, not direct observational or experimental support and not framework-level empirical selection.
- `falsification_condition`: failure of the admitted model analyses would weaken the constraint; broader compulsory coverage could strengthen exclusion scope.
- `countermodels`: explicit core-preserving escape constructions prevent framework-wide generalization.
- `scope_ceiling`: `MODEL_LEVEL_DISCRIMINATORS = YES`; `PARAMETER_OR_REALIZATION_CONSTRAINTS = YES`; bounded underdetermination only.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-23 adjudication blob `f2a034e55c14e73db34cbfe15566457aea9e5ce2`; bounded remediation preserves `EMP0_NONE`, direct empirical credit `0`, and binds the complete CST obstruction/escape plus AS scattering/ghost/spectral/pole/positivity source set.

## FCP24-STRING-001 — Historical FW-STRING umbrella is superseded by one source-bound String/M successor plus deferred holographic remainder

- `framework_ids`: `FW-STRING`, `FW-STRING-M`
- `source_ids`: `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-FCP24-FORMULATION-SEN-ZWIEBACH-2024`, `SRC-FCP24-DUALITY-WITTEN-1995`, `SRC-FCP24-HOLO-MALDACENA-1998`, `SRC-FCP24-HOLO-BOUSSO-2002`, `SRC-FCP24-HOLO-ANNINOS-2025`
- `claim_text`: FCP-24 finds the historical string/holography umbrella too broad for one scientific competitor and source-binds exactly one stable successor, `FW-STRING-M`, for the String/M-theory framework family. Broader holographic material is retained as adjacent but is deferred pending separate source intake; `FW-HOLO` is not created.
- `assumptions`: exact frozen 24-source FCP-24 corpus and the framework-separation rule; AdS/CFT is treated as a declared-domain dual description rather than automatically all holography.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework taxonomy/source-binding level only.
- `weaker_framework_test`: shared vocabulary does not establish one carrier, dynamics or model class across String/M theory and all broader holography.
- `physical_bridge`: taxonomy result; physical realization assessed separately.
- `empirical_binding`: no empirical framework selection follows from taxonomy.
- `falsification_condition`: a future separately frozen corpus establishing a stable broader holographic framework or a different taxonomy could supersede the current framework boundary.
- `countermodels`: broader holographic programs with different primitives/domains block internal-formulation treatment under the frozen corpus.
- `scope_ceiling`: `FCP24_TAXONOMY_OUTCOME = C`; `FW_STRING_CURRENT_STATUS = SUPERSEDED_BY_FRAMEWORK_SPLIT`; `FW_STRING_M_CURRENT_STATUS = SOURCE_BOUND_READY`; `FW_HOLO_CREATED = NO`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-24 taxonomy blob `205975e97e7126f425374a4c3598acf01ed4c98b`; handoff blob `83cebd500cab24b8e19e15b81b0acac8bd872040`.

## FCP24-STRING-002 — String/M nonperturbative and realization content is nonempty but incomplete and selection-dependent

- `framework_ids`: `FW-STRING-M`
- `source_ids`: `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-FCP24-NONPERT-POLCHINSKI-1995`, `SRC-FCP24-NONPERT-BFSS-1997`, `SRC-FCP24-VACUA-CHSW-1985`, `SRC-FCP24-VACUA-GKP-2002`, `SRC-FCP24-VACUA-KKLT-2003`, `SRC-FCP24-REALIZATION-MCALLISTER-QUEVEDO-2023`
- `claim_text`: FCP-24 source-qualifies nonempty perturbative, D-brane, string-field and declared-domain candidate nonperturbative String/M content plus concrete compactification/vacuum/model families, while a universal complete nonperturbative definition, generic dynamical 4D realization, complete vacuum/history selector and framework-wide calibration remain unestablished.
- `assumptions`: formulation, background, compactification, large-N/duality-domain and model assumptions are retained rather than universalized.
- `classification`: `NONFORCED`
- `canonicity_level`: source-bound family/model content with open framework-wide completion/selection.
- `weaker_framework_test`: existence of many controlled constructions does not force one realized world or one all-background formulation.
- `physical_bridge`: nonempty model/compactification/low-energy bridges; generic selected realization remains open.
- `empirical_binding`: model compatibility/parameter constraints only; no framework-level selection.
- `falsification_condition`: a universal complete construction with selected physical realization could strengthen the current ceiling; failure of admitted constructions would weaken corresponding model claims.
- `countermodels`: multiple vacua/formulations and domain-limited dualities block unique realization and universal completion.
- `scope_ceiling`: nonperturbative content nonempty/source-qualified in declared domains; universal complete definition and vacuum selection not established.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-24 K1–K10 baseline blob `a4a166cbe9546d72ecf7622e6c4dd6948cb361e1`; handoff blob `83cebd500cab24b8e19e15b81b0acac8bd872040`. Post-acceptance evidence (2026-10-07): `SRC-OPENAI-MATH-F270B-BFSS-2026` strengthens source-bound model-level BFSS spectral knowledge and scope-limitedly corrects the 1997 blanket exclusion of other normalizable bound states for the defined N=2 relative operator under the normalizable-eigenstate reading. This post-FCP-24 evidence does **not** alter the historical `source_ids` field, `NONFORCED` classification, K1–K10 coordinates, framework-wide incompleteness/selection ceiling, pairwise results, recurrence, empirical status, or Reduced-NFC comparisons. Controlling adjudication: `audits/OPENAI_MATH_FAMILY270B_BFSS_T6_SOURCE_DELTA_ADJUDICATION_0_1_0.md`.

## FCP24-STRING-003 — String/M phenomenology reaches model/parameter constraint scope but not framework selection

- `framework_ids`: `FW-STRING-M`
- `source_ids`: `SRC-FCP24-PHENOM-MARCHESANO-SHIU-WEIGAND-2024`, `SRC-FCP24-COSMO-BAUMANN-MCALLISTER-2015`, `SRC-FCP24-EMPIRICAL-LVK-2021`
- `claim_text`: FCP-24 retains nonempty String/M phenomenology and observational constraints at model/network/parameter scope, including cosmic-string-network constraints, but identifies no direct unavoidable `FW-STRING-M` framework discriminator and no framework-level empirical selection.
- `assumptions`: model-specific compactification/cosmology/network assumptions are not promoted to the base framework; cosmic-string constraints are not treated as identification of cosmic superstrings.
- `classification`: `EMPIRICAL`
- `canonicity_level`: parameter/model constraint scope only.
- `weaker_framework_test`: excluding or constraining optional models does not select or exclude the entire framework.
- `physical_bridge`: model-dependent cosmology/phenomenology to observational data.
- `empirical_binding`: `PARAMETER_CONSTRAINT_AT_MODEL_SCOPE`; framework-level empirical selection `NO`.
- `falsification_condition`: a compulsory String/M prediction with calibrated comparator/uncertainty/decision rule could strengthen the framework-level ceiling.
- `countermodels`: ordinary cosmic-string networks and multiple String/M realizations block framework identification from the admitted constraints.
- `scope_ceiling`: model/parameter constraint only; no direct framework discriminator.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-24 realization/phenomenology adjudication in handoff blob `83cebd500cab24b8e19e15b81b0acac8bd872040`.

## FCP-STRINGM-NULL-001 — String/M versus null contains one target-conditioned E3-S and six strict E5 relations without framework selection

- `framework_ids`: `FW-STRING-M`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-FCP24-FORMULATION-SEN-ZWIEBACH-2024`, `SRC-FCP24-DUALITY-WITTEN-1995`, `SRC-FCP24-NONPERT-POLCHINSKI-1995`, `SRC-FCP24-NONPERT-BFSS-1997`, `SRC-NULL-PDG-GR-2026`
- `claim_text`: The Method-0.2.0 `FW-STRING-M`/null control finds 20 material records with E1=0, E2=0, one bounded target-conditioned `E3-S` low-energy Einstein recovery relation, E4=0, six strict E5 functional relations and thirteen NONE. A nonempty six-item String/M-specific residue survives null subtraction, but no direct framework discriminator or framework-level empirical selection follows.
- `assumptions`: exact FCP-24 String/M object; exact null GR+QFT+SM control; claim-level relation/residue separation and target/empirical-inheritance firewalls.
- `classification`: `NONFORCED`
- `canonicity_level`: pairwise control result with bounded E3-S substructure recovery.
- `weaker_framework_test`: generic gauge/dynamics/scale/consistency roles and recovery of supplied Einstein behavior do not establish independent foundational convergence.
- `physical_bridge`: bounded low-energy Einstein recovery; no all-framework calibrated realization.
- `empirical_binding`: inherited GR success and model constraints do not yield framework selection.
- `falsification_condition`: a stronger source-qualified pairwise map/recovery/prediction could supersede the corresponding relation ceiling.
- `countermodels`: String/M-specific residue without null correspondence; target recovery without independent origin; model phenomenology without framework selection.
- `scope_ceiling`: E1 0; E2 0; E3 1 (`E3-S`); E4 0; E5 6; NONE 13; framework empirical selection `NO`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: comparison blob `7cd7bc3ccaf8f13cc2e756e9cee7816a49695f8e`; handoff blob `8e54e593eb6da894d7c9652b983ae3c37aa3df30`.

## FCP-NFCSTRINGM-001 — Reduced NFC and String/M share three independent-origin but generic E5 roles only

- `framework_ids`: `FW-NFC-RED`, `FW-STRING-M`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-FCP24-DUALITY-WITTEN-1995`, `SRC-FCP24-FORMULATION-SEN-ZWIEBACH-2024`, `SRC-FCP24-NONPERT-BFSS-1997`
- `claim_text`: The Method-0.2.0 Reduced-NFC/String-M comparison finds eight material candidates: E1=E2=E3=E4=0, three `IND-I` but mathematically generic `S0` E5 roles, and five NONE. No non-generic relation, pairwise empirical selection, or empirical support for Reduced NFC is established; material asymmetry is nonempty.
- `assumptions`: exact FCP-3 Reduced-NFC object and exact six-item null-subtracted String/M residue; no broader holography import.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: three generic E5 roles only.
- `weaker_framework_test`: descriptive coordination, admissible transformation and global-coherence roles occur in weaker mathematics; independent origin does not remove genericity.
- `physical_bridge`: no pairwise physical map/controlled limit.
- `empirical_binding`: pairwise E4 none; `NFC_EMPIRICAL_SUPPORT = NO`.
- `falsification_condition`: a non-generic typed map, controlled limit or operational discriminator could strengthen the current pairwise ceiling.
- `countermodels`: String/M dynamics/recovery without NFC counterpart; NFC partition stabilization without String/M scale architecture.
- `scope_ceiling`: E1–E4 zero; E5 3; NONE 5; non-generic 0; pairwise empirical selection `NO`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: comparison blob `a3185d58614e28a99c128c4fa4fee44e1e80811d`; handoff blob `f2dff7b761521e9c1db538301f3bb65420ae314c`.

## FCP-NFCAS-CURRENT-001 — Strengthened NFC/AS comparison remains E1–E4 zero with three generic E5 roles and no NFC support

- `framework_ids`: `FW-NFC-RED`, `FW-AS`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP-TSS-AS-ALR-2026`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP19-AS-WEINBERG-1979`
- `claim_text`: The prospective Method-0.2.0 Reduced-NFC/strengthened-AS reanalysis evaluates 17 material candidates and finds E1=E2=E3=E4=0, three mathematically generic `S0` E5 relations, fourteen NONE, zero non-generic relations, no pairwise empirical selection and no empirical support for Reduced NFC.
- `assumptions`: exact FCP-3 Reduced-NFC object; exact strengthened AS comparator including FCP-20 residue, targeted-strengthening delta and FCP-23 `EXCL-M` control.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: three generic pairwise E5 roles only.
- `weaker_framework_test`: admissible-trajectory, observable-selection and global-coherence roles are generic and do not establish common foundational structure.
- `physical_bridge`: no cross-framework source/target/control/calibration map.
- `empirical_binding`: `PAIRWISE_EMPIRICAL_SELECTION = NO`; `NFC_EMPIRICAL_SUPPORT_FROM_AS_REANALYSIS = NO`.
- `falsification_condition`: a source-qualified non-generic E1–E4 pairwise relation could supersede the current ceiling.
- `countermodels`: AS internal target recovery/model observables without any Reduced-NFC source/target/observable counterpart.
- `scope_ceiling`: 17 atomic candidates; E1–E4 zero; E5 3; NONE 14; non-generic 0.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: partial current successor to `FCP21-NFCAS-001`; canonical provenance: comparison blob `f8a78bed134d36e1cea5cd90de29447f0348cb5a`; handoff blob `3771ee8de5e0390eba3e9eb0a4cb1643765056da`.

## FCP-NFCAS-CURRENT-002 — Strengthened AS realization advances relative to Reduced NFC without evidentiary transfer

- `framework_ids`: `FW-NFC-RED`, `FW-AS`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP-TSS-AS-ALR-2026`, `SRC-FCP-TSS-AS-PPR-2023`, `SRC-FCP19-AS-MRS-2011`
- `claim_text`: Strengthened AS has selected model-level UV-to-IR and Lorentzian realization/recovery content and a source-qualified timelike model observable that Reduced NFC does not match with a general calibrated physical realization or selected physical-history law. This is a material asymmetry, not convergence and not evidence for Reduced NFC.
- `assumptions`: strengthened AS model/trajectory limitations and exact Reduced-NFC realization ceiling are preserved.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded pairwise asymmetry only.
- `weaker_framework_test`: greater comparator maturity does not transfer evidence to the compared framework or define a scalar ranking.
- `physical_bridge`: AS nonempty partial bridge versus Reduced-NFC general bridge unestablished.
- `empirical_binding`: AS model observable remains below framework EMP4; no pairwise E4.
- `falsification_condition`: a source-qualified Reduced-NFC realization matching the relevant AS scope or a stronger pairwise map could alter the asymmetry.
- `countermodels`: AS realization without NFC relation; NFC formal structure without AS physical trajectory.
- `scope_ceiling`: `MATERIAL_ASYMMETRY = NONEMPTY__STRENGTHENED`; no framework winner.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: partial current successor to `FCP21-NFCAS-002`; canonical provenance: handoff blob `3771ee8de5e0390eba3e9eb0a4cb1643765056da`.

## FCP-NFCLOOP-CURRENT-001 — Strengthened NFC/LOOP comparison remains E1–E4 zero with seven generic E5 roles and no NFC support

- `framework_ids`: `FW-NFC-RED`, `FW-LOOP`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-LOOP-HLL-2020`
- `claim_text`: The prospective Method-0.2.0 Reduced-NFC/strengthened-LOOP reanalysis evaluates 29 atomic candidates and finds E1=E2=E3=E4=0, seven mathematically generic `S0` E5 roles, twenty-two NONE, zero non-generic relations, no pairwise empirical selection and no empirical support for Reduced NFC.
- `assumptions`: exact FCP-3 Reduced-NFC object; exact historical LOOP residue plus targeted-strengthening delta; LQC excluded; atomic claim-level decomposition.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: seven generic pairwise E5 roles only.
- `weaker_framework_test`: carrier organization, admissible transformations, viability filtering, observable mediation, localization, coarse/fine organization and globalization roles occur in weaker mathematics.
- `physical_bridge`: no NFC↔LOOP typed physical map, controlled limit or calibrated operational relation.
- `empirical_binding`: `PAIRWISE_EMPIRICAL_SELECTION = NO`; `NFC_EMPIRICAL_SUPPORT_FROM_LOOP_REANALYSIS = NO`.
- `falsification_condition`: a source-qualified non-generic E1–E4 relation could supersede the current pairwise ceiling.
- `countermodels`: LOOP quantum geometry/recovery without NFC structure; NFC carrier/process/globalization without LOOP quantum dynamics.
- `scope_ceiling`: 29 atomic candidates; E1–E4 zero; E5 7; NONE 22; non-generic 0.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: partial current successor to `FCP17-NFCLOOP-001`; generic viability is K3 while K4 is reserved for physical dynamics. Canonical provenance: comparison blob `a379a8dbe42ecb5404bbd5fe2240591f1cb5d6f6`; handoff blob `8d773b731bfe9f15c34ecdfe42c34ca705eb61e9`.

## FCP-NFCLOOP-CURRENT-002 — Strengthened LOOP dynamics/continuum/realization is materially asymmetric to Reduced NFC without evidentiary transfer

- `framework_ids`: `FW-NFC-RED`, `FW-LOOP`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP15-LOOP-EPRL-2008`, `SRC-FCP15-LOOP-BARRETT-2010`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-LOOP-HAN-2017`
- `claim_text`: Strengthened LOOP retains substantive canonical/covariant dynamics programs and bounded E3-S/E3-M continuum/GR recovery evidence that Reduced NFC does not match with a selected physical-history law or general calibrated realization. This creates nonempty strengthened-side dynamics/continuum/realization asymmetry without pairwise E3/E4 or evidence transfer to Reduced NFC.
- `assumptions`: LOOP-internal canonical/covariant bridges and GR-target recovery remain distinct from pairwise NFC↔LOOP relations; generic viability remains K3 and physical dynamics remains K4.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded pairwise asymmetry only.
- `weaker_framework_test`: comparator-side dynamics/recovery is scientifically substantive but cannot be relabeled as a cross-framework relation merely because the other framework lacks it.
- `physical_bridge`: LOOP partial target-conditioned recovery versus Reduced-NFC general bridge unestablished.
- `empirical_binding`: inherited GR success; no pairwise or LOOP framework EMP4.
- `falsification_condition`: a source-qualified Reduced-NFC dynamics/realization counterpart or a genuine cross-framework controlled limit could alter the asymmetry.
- `countermodels`: LOOP-internal E3 with no NFC source/target; canonical/covariant bridge with no NFC involvement.
- `scope_ceiling`: `MATERIAL_LOOP_ASYMMETRY = NONEMPTY__STRENGTHENED`; no framework winner.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: partial current successor to `FCP17-NFCLOOP-002`; canonical provenance: handoff blob `8d773b731bfe9f15c34ecdfe42c34ca705eb61e9`.

---

# Program-level current recurrence claims

## FCP-REC-001 — Current recurrence corpus contains 16 historical operations, 13 effective slots and six Reduced-NFC slots

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-CQM`, `FW-GPTOPT`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP3-COMP-001`, `SRC-FCP3-NFC-BIND-001`
- `claim_text`: The canonical Method-0.2.0 recurrence reconstruction distinguishes 16 historical pairwise operations from 13 supersession-adjusted current pairwise slots and six current Reduced-NFC comparator slots. FCP-6/FCP-22 compose one current NFC/AQFT slot with partial subclaim supersession; historical NFC/LOOP and NFC/AS slots are replaced for current interpretation by their later prospective reanalyses.
- `assumptions`: exact canonical corpus through the program-level recurrence recomputation; operation chronology and current pairwise-slot identity are not treated as the same denominator.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: current program-level bookkeeping/provenance result.
- `weaker_framework_test`: denominator identity is not a convergence claim and carries no framework credit.
- `physical_bridge`: `NONE` required for denominator bookkeeping.
- `empirical_binding`: `NONE`.
- `falsification_condition`: discovery of an omitted/duplicated canonical pairwise operation or incorrect supersession identity would require denominator revision.
- `countermodels`: repeated analyses of one pair demonstrate why operation count cannot be used as the current independence denominator.
- `scope_ceiling`: historical operations 16; current effective slots 13; current Reduced-NFC slots 6; no scoring implication.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current program-level successor context for historical FCP-18 denominator statements. Canonical provenance: recurrence meta-ledger blob `441d6d10f9bf12c74a1f1dbe90d2b95c5b077be7`; handoff blob `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

## FCP-REC-002 — GR/classical recovery recurs across four families only as target-conditioned R3 recovery

- `framework_ids`: `FW-CST`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP9-CST-SURYA-2019`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-NULL-PDG-GR-2026`
- `claim_text`: Bounded E3 recovery of GR/Einstein/classical/low-energy target content recurs across CST, LOOP, AS and String/M, but the shared endpoint is supplied by the declared recovery target and implementation/control remain framework-specific. The recurrence is therefore `R3_TARGET_CONDITIONED_E1_E4_RECOVERY_RECURRENCE`, not independent foundational rediscovery of GR.
- `assumptions`: exact current E3 records and their target-conditioning; endpoint commonality is separated from implementation and control.
- `classification`: `VALID_CONDITIONAL`
- `canonicity_level`: one current R3 recurrence family.
- `weaker_framework_test`: multiple frameworks can be engineered/selected to recover the same successful target, so endpoint recurrence does not establish common independent foundations.
- `physical_bridge`: nonempty bounded target-recovery bridges varying by framework.
- `empirical_binding`: recovered GR success is inherited, not independent EMP4.
- `falsification_condition`: independent non-target-derived recurrence of the same non-generic structure at E1–E4 could require reclassification.
- `countermodels`: distinct framework-specific recovery mechanisms reaching the same supplied GR endpoint.
- `scope_ceiling`: `R3 = 1`; target-conditioned recovery retained without R1/R2 promotion.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: recurrence meta-ledger `441d6d10f9bf12c74a1f1dbe90d2b95c5b077be7`.

## FCP-REC-003 — AQFT/QFT and CQM/QM E2 recurrence is lineage/reformulation R4 rather than independent convergence

- `framework_ids`: `FW-AQFT`, `FW-CQM`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP2-EQUIV-001`
- `claim_text`: Bounded E2 representation/reformulation relations recur in AQFT/QFT and CQM/QM. Because shared historical/formal lineage explains the agreement, the program-level recurrence is `R4_LINEAGE_OR_REFORMULATION_E1_E4_RECURRENCE`, not independent foundational convergence.
- `assumptions`: current equal-standard E2 status and historical lineage controls.
- `classification`: `NONFORCED`
- `canonicity_level`: one current R4 recurrence family.
- `weaker_framework_test`: agreement between a theory and its reformulation is expected and cannot establish independent origin by itself.
- `physical_bridge`: inherited through corresponding QFT/QM concrete realizations.
- `empirical_binding`: empirical success is inherited rather than independent framework selection.
- `falsification_condition`: a specific E2 structure shown to have independent non-lineage origin and non-generic physical content could be reconsidered separately.
- `countermodels`: empirically equivalent or structurally related reformulations demonstrate the lineage confound.
- `scope_ceiling`: `R4 = 1`; no independent foundational credit from lineage E2.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: recurrence handoff blob `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

## FCP-REC-004 — Seven generic E5 functional families recur across the current framework corpus without foundational promotion

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-CQM`, `FW-GPTOPT`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP24-FOUNDATION-AGMON-2023`, `SRC-FCP2-EQUIV-001`
- `claim_text`: Seven genuine multi-family `R5_GENERIC_E5_FUNCTIONAL_RECURRENCE` roles recur in the current corpus: carrier/state organization; quotient/equivalence; admissible transformations/process organization; observable/interface mediation; locality/causality/localization; scale/refinement/coarse-graining/RG; and globalization/local-to-global coherence. Their recurrence is mathematically generic and does not establish independent foundational convergence.
- `assumptions`: exact current pairwise slot corpus; E5 is retained as a real relation class but genericity and independence are separate axes.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: seven R5 generic recurrence families.
- `weaker_framework_test`: each listed role occurs in substantially weaker or unrelated formal systems.
- `physical_bridge`: no common multi-family calibrated physical bridge follows from the generic roles.
- `empirical_binding`: `EMP0`/no independent framework-level selection from the generic roles.
- `falsification_condition`: discovery that a listed recurrence is materially non-generic and satisfies E1–E4 plus independence/bridge burdens could require reclassification of that family.
- `countermodels`: generic formal systems instantiate these roles without the specific foundational commitments of the compared frameworks.
- `scope_ceiling`: `R5 = 7`; `INDEPENDENT_FOUNDATIONAL_RECURRENCE_FROM_GENERIC_E5 = NO`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: recurrence meta-ledger blob `441d6d10f9bf12c74a1f1dbe90d2b95c5b077be7`.

## FCP-REC-005 — Empirical success recurs primarily through inheritance/shared targets and yields no framework EMP4 recurrence

- `framework_ids`: `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CQM`, `FW-CST`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-NULL-PDG-GR-2026`, `SRC-NULL-PDG-EW-2026`, `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP4-CQM-AC-2004`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP24-EMPIRICAL-LVK-2021`
- `claim_text`: Current multi-family empirical compatibility is explained by reformulation inheritance, shared recovery targets, or model/parameter constraints rather than independent framework-level pairwise EMP4. The program contains one `R7_EMPIRICALLY_INHERITED_OR_SHARED_TARGET_RECURRENCE` family, zero current independent framework-level EMP4 slots and zero multi-family EMP4 recurrence.
- `assumptions`: empirical inheritance, target conditioning, model/parameter scope and framework-level discriminator requirements remain separated.
- `classification`: `NONFORCED`
- `canonicity_level`: one R7 recurrence family; EMP4 zero at current framework level.
- `weaker_framework_test`: compatibility with successful GR/QM/QFT or constraints on optional models can occur without selecting a foundational framework.
- `physical_bridge`: varies by framework and is often target/model conditioned.
- `empirical_binding`: real inherited/model evidence retained; `CURRENT_MULTI_FAMILY_EMP4_RECURRENCE_COUNT = 0`.
- `falsification_condition`: one or more compulsory framework-level operational relations satisfying EMP4 could supersede the zero-EMP4 result.
- `countermodels`: same-model/reformulation success and target recovery without independent prediction.
- `scope_ceiling`: `R7 = 1`; independent framework-level EMP4 slots 0; multi-family EMP4 recurrence 0.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current successor context for `FCP18-META-003`; historical row remains accepted through FCP-17. Canonical provenance: recurrence handoff `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

## FCP-REC-006 — No independent non-generic multi-family foundational recurrence survives Method 0.2.0 controls

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-CQM`, `FW-GPTOPT`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP3-COMP-001`, `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP24-FOUNDATION-AGMON-2023`
- `claim_text`: After genericity, lineage/reformulation, target-conditioning, empirical-inheritance, anti-double-counting, physical-bridge and calibration controls, no recurrence family satisfies the current Method-0.2.0 R1 or R2 burden across multiple distinct framework families.
- `assumptions`: exact 13-slot current corpus and preregistered recurrence criteria; positive R3/R4/R5/R7 relations are retained rather than erased.
- `classification`: `NONFORCED`
- `canonicity_level`: current program-level evidentiary result.
- `weaker_framework_test`: generic or explained recurrence cannot be promoted merely by repetition.
- `physical_bridge`: no common multi-family E1–E4 physical bridge survives the required controls.
- `empirical_binding`: no current independent framework-level EMP4 recurrence.
- `falsification_condition`: a source-qualified independently motivated materially non-generic E1–E4 relation recurring across at least two distinct framework families would reopen the result.
- `countermodels`: lineage E2, target-conditioned E3, generic E5 and inherited empirical success demonstrate why raw recurrence is insufficient.
- `scope_ceiling`: `R1 = 0`; `R2 = 0`; no framework winner or scalar score.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current program-level successor context for `FCP18-META-001`; historical FCP-18 remains accepted at its through-FCP17 scope. Canonical provenance: recurrence meta-ledger `441d6d10f9bf12c74a1f1dbe90d2b95c5b077be7`.

## FCP-REC-007 — Reduced NFC has no repeated independent support across its six current comparator slots

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP15-LOOP-AL-2004`, `SRC-FCP19-AS-WEINBERG-1979`, `SRC-FCP24-FOUNDATION-AGMON-2023`
- `claim_text`: Across the six current Reduced-NFC comparator slots—null, AQFT, CST, LOOP, AS and String/M—the exact FCP-3 Reduced-NFC object has E1=E2=E3=E4=0 in every slot. Positive pairwise content is generic E5 only; therefore zero recurrence families provide qualifying repeated independent support for Reduced NFC.
- `assumptions`: exact FCP-3 Reduced-NFC object; FCP-6/FCP-22 partial slot composition; current prospective AS/LOOP and String/M comparisons; repeated-support burden requires materially same non-generic E1–E4 structure across at least two distinct comparator families.
- `classification`: `NONFORCED`
- `canonicity_level`: current six-slot program-level result.
- `weaker_framework_test`: repeated generic roles, repeated open burdens and comparator maturity do not satisfy non-generic support.
- `physical_bridge`: no repeated two-sided Reduced-NFC physical bridge is source-qualified.
- `empirical_binding`: `REDUCED_NFC_SUPPORTING_RECURRENCE_FAMILY_COUNT = 0`.
- `falsification_condition`: qualifying independent non-generic Reduced-NFC E1–E4 relations in at least two distinct comparator families would reopen the conclusion.
- `countermodels`: repeated generic E5 roles and repeated comparator asymmetry without structural support transfer.
- `scope_ceiling`: `HAS_REDUCED_NFC_ACCUMULATED_REPEATED_INDEPENDENT_SUPPORT = NO`; not a claim that Reduced NFC is false.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current program-level successor context for `FCP18-META-002`; historical FCP-18 remains accepted at its four-slot scope. Canonical provenance: recurrence handoff `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

## FCP-REC-008 — Material asymmetry recurs across frameworks without constituting a score or convergence relation

- `framework_ids`: `FW-NFC-RED`, `FW-AQFT`, `FW-CST`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`, `FW-GPTOPT`, `FW-CQM`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP4-AQFT-HK-1964`, `SRC-FCP9-CST-BLMS-1987`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP19-AS-REUTER-1998`, `SRC-FCP24-FORMULATION-SEN-ZWIEBACH-2024`
- `claim_text`: The current program exhibits nonempty material asymmetry across carrier specificity, dynamics, continuum recovery, physical realization, calibration and empirical contact. These differences are scientifically substantive but are not a framework score, winner, convergence relation or evidentiary transfer to a framework lacking the stronger content.
- `assumptions`: pairwise asymmetries and framework-specific maturity are retained at their exact scopes without scalar aggregation.
- `classification`: `NONFORCED`
- `canonicity_level`: program-level qualitative asymmetry pattern.
- `weaker_framework_test`: greater specificity or maturity along one axis does not force global framework superiority.
- `physical_bridge`: varies materially across frameworks.
- `empirical_binding`: varies by framework; no scoring or transfer follows.
- `falsification_condition`: future scientific work could change individual asymmetries or supply shared relations; the no-score rule remains methodological unless separately revised.
- `countermodels`: frameworks can be stronger on one axis and weaker/open on another, defeating scalar inference.
- `scope_ceiling`: `PROGRAM_LEVEL_MATERIAL_ASYMMETRY_PATTERN = NONEMPTY`; `MATERIAL_ASYMMETRY != FRAMEWORK_SCORE`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: recurrence handoff blob `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

## FCP-REC-009 — Unique dynamics, full realization, calibration, selection and framework empirical discrimination recur as open burdens

- `framework_ids`: `FW-NFC-RED`, `FW-AQFT`, `FW-CST`, `FW-CQM`, `FW-GPTOPT`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`
- `source_ids`: `SRC-FCP3-NFC-BIND-001`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FCP9-CST-SURYA-2019`, `SRC-FCP4-CQM-AC-2004`, `SRC-FCP15-LOOP-QSD-1998`, `SRC-FCP19-AS-EICHHORN-2026`, `SRC-FCP24-REALIZATION-MCALLISTER-QUEVEDO-2023`
- `claim_text`: Multiple framework families retain recurring open burdens in unique dynamics, full physical realization, calibration, model/trajectory/vacuum selection and framework-level empirical discrimination. These shared absences are a program-level bottleneck pattern, not positive E1–E5 convergence.
- `assumptions`: each framework's open burden is preserved at its own source-qualified scope; shared absence is not treated as a common structure.
- `classification`: `OPEN`
- `canonicity_level`: current program-level open-burden pattern.
- `weaker_framework_test`: many unrelated theories can share unresolved problems, so common absence does not imply common foundation.
- `physical_bridge`: incompleteness varies by framework and burden.
- `empirical_binding`: framework-level discrimination remains absent in the current recurrence corpus.
- `falsification_condition`: closing individual burdens would shrink the pattern; a common positive structure would require separate E1–E5 qualification.
- `countermodels`: distinct reasons for incompleteness across frameworks block inference from shared labels alone.
- `scope_ceiling`: `PROGRAM_LEVEL_RECURRENT_OPEN_BURDEN_PATTERN = NONEMPTY`; `SHARED_OPEN_BURDEN != POSITIVE_RELATION`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: recurrence handoff blob `dc20e786340d505d6302bbbecf56305aa65cc3fe`.

---

# FCP-25 tensor-network / information-theoretic current claims

## FCP25-TENSOR-001 — Historical FW-TENSOR umbrella has no surviving source-bound foundational competitor at the frozen source scope

- `framework_ids`: `FW-TENSOR`
- `source_ids`: `SRC-FCP25-TENSOR-SCHOLLWOECK-2011`, `SRC-FCP25-TENSOR-VERSTRAETE-CIRAC-2004`, `SRC-FCP25-TENSOR-VIDAL-ER-2007`, `SRC-FCP25-TENSOR-PASTAWSKI-2015`, `SRC-FCP25-TENSOR-HARLOW-2017`, `SRC-FCP25-TENSOR-VAN-RAAMSDONK-2010`, `SRC-FCP25-TENSOR-JACOBSON-2016`, `SRC-FCP25-TENSOR-CAO-CARROLL-MICHALAKIS-2017`, `SRC-FCP25-TENSOR-BAO-2015`, `SRC-FCP25-TENSOR-JAHN-EISERT-2021`
- `claim_text`: Under the exact frozen 29-source FCP-25 corpus, the historical tensor-network / information-theoretic umbrella does not bind one stable foundational competitor and does not yield any source-bound successor framework. `FW-TENSOR` is therefore retained only as historical provenance with `REMOVED_WITH_REASON`; representation, computational, variational, RG, holographic-model, QEC/reconstruction, simulator, adjacent, and deferred material remains scientifically retained at its weaker source-qualified classification.
- `assumptions`: taxonomy precedes K1–K10; the exact frozen Stage-1 corpus is preserved; shared tensor diagrams, entanglement language, scale vocabulary, holographic motivation, representability, algorithms, and target-conditioned code structures do not by themselves establish a common foundational physical framework.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework taxonomy/source-binding level at the declared frozen source scope only.
- `weaker_framework_test`: the admitted clusters are adequately described by representation/tool/RG/model/QEC/reconstruction/proposal classes without positing a new common physical ontology or history selector.
- `physical_bridge`: no common framework-wide bridge from the historical umbrella to physical spacetime is source-bound.
- `empirical_binding`: no direct framework-level discriminator or framework-level empirical selection is established.
- `falsification_condition`: a future separately frozen source intake that source-binds one or more stable foundational physical objects from the deferred/adjacent material could supersede the current taxonomy boundary prospectively.
- `countermodels`: MPS/PEPS/DMRG methods, holographic tensor/code models, and heterogeneous information-first reconstruction proposals have materially different carriers, dynamics status, target dependence, realization burdens, and empirical burdens.
- `scope_ceiling`: `FCP25_TAXONOMY_OUTCOME = D_NO_STABLE_FOUNDATIONAL_COMPETITOR_AT_CURRENT_SOURCE_SCOPE`; `FW_TENSOR_SURVIVES = NO`; `FW_TENSOR_CURRENT_STATUS = REMOVED_WITH_REASON`; `SUCCESSOR_FRAMEWORK_COUNT = 0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical FCP-25 provenance: taxonomy adjudication blob `a415e89bc3fb0f1d76e88119d84f92e6fd6c91d8`; Stage-2 handoff blob `9dc6be064e102a6c337c46c3f23e36c9b0ce2b60`. This bounded result does not assert that tensor networks, QEC, holography, or information-first proposals are scientifically unimportant or impossible foundations in principle.

## FCP25-TENSOR-002 — K1–K10 is not instantiated because no source-bound FCP-25 framework object survives taxonomy

- `framework_ids`: `FW-TENSOR`
- `source_ids`: `SRC-FCP25-TENSOR-PEREZ-GARCIA-2007`, `SRC-FCP25-TENSOR-SCHUCH-2008`, `SRC-FCP25-TENSOR-GE-EISERT-2016`, `SRC-FCP25-TENSOR-HAEGEMAN-TDVP-2016`, `SRC-FCP25-TENSOR-ALMHEIRI-DONG-HARLOW-2015`, `SRC-FCP25-TENSOR-DONG-HARLOW-WALL-2016`, `SRC-FCP25-TENSOR-HARLOW-2017`, `SRC-FCP25-TENSOR-MILSTED-VIDAL-2018`
- `claim_text`: Because FCP-25 Stage 2 finds no surviving source-bound foundational object, no positive pooled `FW-TENSOR` K1–K10 baseline is instantiated. The K1–K10 artifact is a non-instantiation/object-specificity record: the frozen corpus contains scientifically real state representations, transformations, RG flows, code/reconstruction structures, geometry proposals, and realizations, but their materially different carriers, equivalence doctrines, dynamics, locality meanings, scale roles, globalization mechanisms, and calibration burdens cannot be converted into one framework-wide baseline.
- `assumptions`: K1–K10 applies to a source-bound scientific object; taxonomy-first ordering and successor-ID discipline are binding; absence of a surviving framework does not erase proposition-level scientific content.
- `classification`: `NONFORCED`
- `canonicity_level`: object-specific baseline gate; no framework-wide K-key value is asserted for the removed umbrella.
- `weaker_framework_test`: representation, computational, model, QEC, and target-conditioned classifications are sufficient for the retained propositions and block unnecessary foundational promotion.
- `physical_bridge`: proposition-specific mathematical/model/simulator bridges only; no common foundational spacetime bridge.
- `empirical_binding`: no K10 framework discriminator because no surviving foundational object has a comparator/prediction/uncertainty/decision-rule package.
- `falsification_condition`: a future source-bound successor object would permit its own separately frozen K1–K10 baseline and supersede this non-instantiation only for that new object.
- `countermodels`: pooling supplied-Hamiltonian evolution, algorithmic RG, code reconstruction, target-conditioned bulk dynamics, and proposal-specific emergence would fabricate a unified history selector that the sources do not establish.
- `scope_ceiling`: `K1_K10_BASELINE_STATUS = NOT_INSTANTIATED_NO_SURVIVING_SOURCE_BOUND_FRAMEWORK`; `OBJECT_SPECIFIC_BASELINE_COUNT = 0`; `POOLED_UMBRELLA_BASELINE_CREATED = NO`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: K1–K10 non-instantiation blob `c42fc9b59b72f0baff066ea3d26504c1dcf6081b`; taxonomy preregistration blob `c9f035fc840ab83ddf68582d648cedbc0eb7a007`.

## FCP25-TENSOR-003 — FCP-25 empirical contact reaches prepared-model simulator/analogue realization, not foundational framework selection

- `framework_ids`: `FW-TENSOR`
- `source_ids`: `SRC-FCP25-TENSOR-LI-2019`, `SRC-FCP25-TENSOR-BISWAS-2026`, `SRC-FCP25-TENSOR-SCHOLLWOECK-2011`, `SRC-FCP25-TENSOR-HAEGEMAN-TDVP-2016`, `SRC-FCP25-TENSOR-PASTAWSKI-2015`, `SRC-FCP25-TENSOR-HAYDEN-2016`, `SRC-FCP25-TENSOR-JAHN-EISERT-2021`
- `claim_text`: The strongest FCP-25 empirical contact is laboratory/simulator realization of supplied finite tensor/code models, including prepared perfect-tensor and holographic-code systems. These experiments and numerical successes validate implemented models and represented theories at their declared scopes; they do not observe physical spacetime emergence, identify a tensor/information ontology in nature, or provide a direct framework-level discriminator.
- `assumptions`: laboratory calibration applies to the prepared simulator/device and supplied code/model; represented-theory success and target-conditioned holographic behavior are not transferred to an unbound foundational framework.
- `classification`: `EMPIRICAL`
- `canonicity_level`: empirical realization of declared prepared models only; no foundational selection canonicity.
- `weaker_framework_test`: ordinary quantum simulation, numerical representation, and model-specific code behavior explain the observed evidence without requiring a new foundational spacetime framework.
- `physical_bridge`: calibrated device-to-prepared-model bridge; `PHYSICAL_SPACETIME_REALIZATION = NOT_ESTABLISHED`.
- `empirical_binding`: `HIGHEST_EMPIRICAL_SCOPE = SIMULATOR_OR_ANALOGUE_REALIZATION_OF_SUPPLIED_TENSOR_AND_CODE_MODELS`; `DIRECT_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR = NO_AT_CURRENT_SOURCE_SCOPE`; `FRAMEWORK_LEVEL_EMPIRICAL_SELECTION = NO_AT_CURRENT_SOURCE_SCOPE`.
- `falsification_condition`: failure to reproduce the declared prepared-model results would weaken the corresponding realization claims; a future independently calibrated natural-spacetime prediction with a material comparator and decision rule could supersede the present empirical ceiling.
- `countermodels`: the same prepared-state/code observations are explained as quantum-device realization of supplied models and therefore do not discriminate a foundational ontology.
- `scope_ceiling`: simulator/analogue and numerical/model empirical contact only; no framework winner, no physical-spacetime realization, no EMP4-level framework selection.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: realization/empirical ledger blob `9eaeeec6231a205d7975bf840624af235fa0acb7`; Stage-2 handoff blob `9dc6be064e102a6c337c46c3f23e36c9b0ce2b60`.

---

# Post-FCP-25 current-state durable claims

## FCP26-EMP-001 — Post-FCP-23 deltas retain model-level testability but yield no framework-level Stage-2 target

- `framework_ids`: `FW-STRING-M`, `FW-AS`, `FW-LOOP`
- `source_ids`: `SRC-FCP24-PHENOM-MARCHESANO-SHIU-WEIGAND-2024`, `SRC-FCP24-COSMO-BAUMANN-MCALLISTER-2015`, `SRC-FCP24-EMPIRICAL-LVK-2021`, `SRC-FCP-TSS-AS-PPRR-2025`, `SRC-FCP-TSS-AS-ALR-2026`, `SRC-FCP-TSS-AS-PPR-2023`, `SRC-FCP-TSS-AS-KNORR-2026`, `SRC-FCP19-AS-MRS-2011`, `SRC-FCP19-AS-SW-2025`, `SRC-FCP15-LOOP-BARRETT-2010`, `SRC-FCP15-LOOP-BMP-2009`, `SRC-FCP-TSS-LOOP-HHZ-2019`, `SRC-FCP-TSS-LOOP-HLL-2020`, `SRC-FCP-TSS-LOOP-HAN-2017`, `SRC-FCP-TSS-LOOP-BAHR-STEINHAUS-2016`
- `claim_text`: FCP-26 Stage 1 finds real post-FCP-23 realization and empirical content in the current String/M, asymptotic-safety, and LOOP records, but no source-qualified framework-level candidate target survives the preregistered bridge burden. `FW-STRING-M` and `FW-AS` reach model/parameter-level `EC2` testability, `FW-LOOP` reaches inherited/target-conditioned `EC1`, candidate-target count is zero, and an external Stage-2 empirical search is not justified at the current canonical scope.
- `assumptions`: exact FCP-26 canonical-only delta screen; Method 0.2.0 framework-first B1–B6 burden; post-FCP-23 novelty is not fabricated from pre-existing source evidence; model/trajectory/realization choices are not promoted to framework-forced signatures.
- `classification`: `NONFORCED`
- `canonicity_level`: current bounded program-level empirical-feasibility conclusion; no universal impossibility claim.
- `weaker_framework_test`: model or parameter constraints can be real without selecting the full foundational framework; absence of a compulsory bridge prevents framework-level promotion.
- `physical_bridge`: partial and framework-specific; model/vacuum/trajectory dependent for String/M and AS, target-conditioned recovery for LOOP.
- `empirical_binding`: `FW-STRING-M = EC2`; `FW-AS = EC2`; `FW-LOOP = EC1`; `CANDIDATE_TARGET_COUNT = 0`; `STAGE2_TARGET_COUNT = 0`; `FCP26_STAGE2 = NOT_JUSTIFIED_AT_CURRENT_CANONICAL_SCOPE`.
- `falsification_condition`: a later canonical framework-first bridge establishing a compulsory operational observable, framework-constrained signature, and qualified test conditions could supersede this bounded zero-target conclusion.
- `countermodels`: core-preserving model, realization, compactification, trajectory, truncation and calibration freedoms that retain the framework while changing the candidate observable block framework-level inference.
- `scope_ceiling`: successful zero-target screen at the exact post-FCP-23 delta window; no framework is falsified and future discrimination is not ruled out in principle.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FCP-26 Stage-1 scientific commit `9733e2a3671ca81e5f8696f625f60eb59cc0e8e8`; delta-screen blob `48cf7ba38df791443daefe6807b3c2a91575359d`; bridge/adjudication blob `63a8024e11e60c7b116b21c116ab1119bfe37366`. The informal atomic-clock idea received no target advancement and no canonical framework-to-clock bridge; it is not elevated to an independent durable row.

## FWCAT-001 — Historical FW-CAT umbrella is removed with reason and yields no successor framework

- `framework_ids`: `FW-CAT`, `FW-CQM`, `FW-GPTOPT`, `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-CQM-GS-2018`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-OPT-CHIRIBELLA-2014`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FW-CAT-STAGE1-BAEZ-STAY-2011`, `SRC-FW-CAT-STAGE1-TULL-2020`, `SRC-FW-CAT-STAGE1-SELBY-SCANDOLO-COECKE-2021`, `SRC-FW-CAT-STAGE1-CHO-EFFECTUS-2019`, `SRC-FW-CAT-STAGE1-ISHAM-BUTTERFIELD-1998`, `SRC-FW-CAT-STAGE1-DORING-ISHAM-2011`, `SRC-FW-CAT-STAGE1-HEUNEN-LANDSMAN-SPITTERS-2009`, `SRC-FW-CAT-STAGE1-WOLTERS-2013`, `SRC-FW-CAT-STAGE1-FLORI-2018`, `SRC-FW-CAT-STAGE1-DORING-2015`, `SRC-FW-CAT-STAGE1-FRITZ-2020`, `SRC-FW-CAT-STAGE1-COECKE-SPEKKENS-2012`, `SRC-FW-CAT-STAGE1-ATIYAH-1988`, `SRC-FW-CAT-STAGE1-BAEZ-DOLAN-1995`, `SRC-FW-CAT-STAGE1-FREED-2013`, `SRC-FW-CAT-STAGE1-OECKL-2003`, `SRC-FW-CAT-STAGE1-CRANE-1995`, `SRC-FW-CAT-STAGE1-BAEZ-HUERTA-2011`, `SRC-FW-CAT-STAGE1-COECKE-LAL-2013`, `SRC-FW-CAT-STAGE1-KISSINGER-UIJLEN-2019`, `SRC-FW-CAT-STAGE1-HARDY-2016`, `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-FW-CAT-STAGE1-RUBINO-2017`, `SRC-FW-CAT-STAGE1-ROZEMA-2024`
- `claim_text`: Under the exact frozen 32-source FW-CAT corpus, the historical categorical/process/topos umbrella does not bind one stable foundational competitor. Twelve source-bound scientific objects are separated before admission; four map to existing `FW-CQM`, `FW-GPTOPT`, `FW-AQFT`, or the GR sector represented by `FW-NULL-GRQFTSM`, six remain nonframework material, two remain deferred proposals, and no new successor framework is admitted. `FW-CAT` is therefore retained only as historical provenance with `REMOVED_WITH_REASON`.
- `assumptions`: taxonomy precedes K1–K10; framework separation and weakest-adequate admission are distinct; common categorical syntax, composition, reconstruction language, functoriality, or process notation do not by themselves establish one physical ontology, dynamics, scope, or empirical program.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework taxonomy/source-binding level at the exact frozen source scope only.
- `weaker_framework_test`: existing-framework, toolkit, representational, mathematical-infrastructure, model-family and research-program classifications adequately describe the retained source-bound objects without a new umbrella competitor.
- `physical_bridge`: object-specific only; no common FW-CAT physical bridge survives taxonomy.
- `empirical_binding`: no framework-wide empirical binding because no retained/new FW-CAT framework exists.
- `falsification_condition`: a future separately frozen source intake that binds a genuinely distinct foundational object from currently deferred or nonframework material could supersede this taxonomy boundary prospectively.
- `countermodels`: the frozen corpus contains materially distinct CQM/GPTOPT processes, topos reformulations, functorial AQFT, TQFT/classification, higher-gauge/QG proposals, causal-process models, and operational GR with different carriers, dynamics and empirical burdens.
- `scope_ceiling`: `TAXONOMY_VERDICT = B_EXISTING_FRAMEWORK_ASSIGNMENT_PLUS_NONFRAMEWORK_REMAINDER`; `FW_CAT_SURVIVES = NO`; `NEWLY_ADMITTED_FRAMEWORK_COUNT = 0`.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FW-CAT Stage-2 scientific commit `faa63b8073fdd0fc41cec4ec4e6b0957918ab3ec`; taxonomy blob `dfdaac236040da8ca3c752a3fc82b2362627de7c`.

## FWCAT-002 — FW-CAT K1–K10 baseline is not instantiated because no new framework survives taxonomy

- `framework_ids`: `FW-CAT`
- `source_ids`: `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-CQM-GS-2018`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-OPT-CHIRIBELLA-2014`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FCP4-AQFT-BFV-2003`, `SRC-FW-CAT-STAGE1-BAEZ-STAY-2011`, `SRC-FW-CAT-STAGE1-TULL-2020`, `SRC-FW-CAT-STAGE1-SELBY-SCANDOLO-COECKE-2021`, `SRC-FW-CAT-STAGE1-CHO-EFFECTUS-2019`, `SRC-FW-CAT-STAGE1-ISHAM-BUTTERFIELD-1998`, `SRC-FW-CAT-STAGE1-DORING-ISHAM-2011`, `SRC-FW-CAT-STAGE1-HEUNEN-LANDSMAN-SPITTERS-2009`, `SRC-FW-CAT-STAGE1-WOLTERS-2013`, `SRC-FW-CAT-STAGE1-FLORI-2018`, `SRC-FW-CAT-STAGE1-DORING-2015`, `SRC-FW-CAT-STAGE1-FRITZ-2020`, `SRC-FW-CAT-STAGE1-COECKE-SPEKKENS-2012`, `SRC-FW-CAT-STAGE1-ATIYAH-1988`, `SRC-FW-CAT-STAGE1-BAEZ-DOLAN-1995`, `SRC-FW-CAT-STAGE1-FREED-2013`, `SRC-FW-CAT-STAGE1-OECKL-2003`, `SRC-FW-CAT-STAGE1-CRANE-1995`, `SRC-FW-CAT-STAGE1-BAEZ-HUERTA-2011`, `SRC-FW-CAT-STAGE1-COECKE-LAL-2013`, `SRC-FW-CAT-STAGE1-KISSINGER-UIJLEN-2019`, `SRC-FW-CAT-STAGE1-HARDY-2016`, `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-FW-CAT-STAGE1-RUBINO-2017`, `SRC-FW-CAT-STAGE1-ROZEMA-2024`
- `claim_text`: Because FW-CAT Stage 2 yields no retained or newly admitted categorical/process/topos foundational framework, no positive pooled K1–K10 baseline is instantiated for the historical umbrella. Existing-framework K1–K10 baselines remain unchanged and the object-specific formal, representational, reconstruction, model and proposal content is preserved only at its own source-qualified scope.
- `assumptions`: K1–K10 applies to a source-bound scientific framework object; taxonomy-first ordering and no-double-counting discipline are binding.
- `classification`: `NONFORCED`
- `canonicity_level`: object-specific baseline gate; no umbrella K-key value is asserted.
- `weaker_framework_test`: pooling heterogeneous CQM, GPT/OPT, AQFT, topos, TQFT, higher-gauge, causal-process and operational-GR content would fabricate a unified carrier/history selector absent from the sources.
- `physical_bridge`: none common to the removed umbrella.
- `empirical_binding`: none at FW-CAT framework scope.
- `falsification_condition`: a future source-bound successor framework would receive its own separately frozen K1–K10 baseline and could supersede this noninstantiation only for that new object.
- `countermodels`: multiple source-bound objects in the frozen corpus realize categorical structure while differing materially in dynamics, measurement, causal structure and physical scope.
- `scope_ceiling`: `K1_K10_BASELINE_STATUS = NONINSTANTIATED_NO_SURVIVING_NEW_FRAMEWORK`; existing framework baselines are not rewritten.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FW-CAT K1–K10 noninstantiation blob `074e6d6f9bb2af0324a3f849053719e418b0fe71`; Stage-2 taxonomy blob `dfdaac236040da8ca3c752a3fc82b2362627de7c`.

## FWCAT-003 — Quantum-switch experiment reaches implementation-level EMP3 without FW-CAT framework selection

- `framework_ids`: `FW-CAT`, `FW-CQM`, `FW-GPTOPT`
- `source_ids`: `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-FW-CAT-STAGE1-COECKE-LAL-2013`, `SRC-FW-CAT-STAGE1-KISSINGER-UIJLEN-2019`, `SRC-FW-CAT-STAGE1-RUBINO-2017`, `SRC-FW-CAT-STAGE1-ROZEMA-2024`
- `claim_text`: The strongest direct empirical contact in the frozen FW-CAT corpus is the photonic quantum-switch causal-witness experiment at a specified quantum-process implementation. This reaches `REAL4` physical-system realization and `EMP3` direct model/implementation-level evidence, but it does not empirically select category theory, the historical FW-CAT umbrella, a general process-matrix ontology, or a quantum-gravity causal structure.
- `assumptions`: the reported photonic implementation, operational characterization and causal-witness analysis are kept at their declared model scope; model/extension evidence is not back-projected to an umbrella framework.
- `classification`: `EMPIRICAL`
- `canonicity_level`: direct experiment at specified implementation/model scope only; no foundational framework selection canonicity.
- `weaker_framework_test`: ordinary quantum mechanics/GPTOPT process models already describe the implemented system; categorical representation is not uniquely selected by the measurement.
- `physical_bridge`: calibrated photonic quantum-switch implementation with specified inputs, operations, controls and readout.
- `empirical_binding`: approximately seven-standard-deviation causal-nonseparability witness for the reported implementation; `HIGHEST_EMPIRICAL_SCOPE = MODEL_IMPLEMENTATION_LEVEL_EMP3`; `DIRECT_FRAMEWORK_LEVEL_EMPIRICAL_DISCRIMINATOR = NOT_APPLICABLE`.
- `falsification_condition`: failure to reproduce the reported causal-witness result would weaken this implementation claim; a future framework-level result would require a retained/new framework plus a compulsory decision rule linking the framework to observations.
- `countermodels`: the same implementation-level evidence is naturally accommodated as a quantum-information/process-model experiment without committing to category theory as physical ontology.
- `scope_ceiling`: direct model/implementation experiment only; no FW-CAT revival, category-theory confirmation, quantum-gravity inference, or framework winner.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical provenance: FW-CAT empirical-ceiling blob `badff8e3599b697f21000dc0d9343ed7b279a573`; quantum-switch evidence is explicitly firewall-protected from umbrella back-projection.

## FWCAT-004 — OBJ-CAT-11 is a distinct deferred causal-process remainder, not an existing GPTOPT/CQM assignment

- `framework_ids`: `FW-CAT`, `FW-CQM`, `FW-GPTOPT`, `FW-AQFT`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FCP4-CQM-AC-2004`, `SRC-FCP4-CQM-AC-2009`, `SRC-FCP4-CQM-CK-2017`, `SRC-FCP4-CQM-GS-2018`, `SRC-FCP4-GPT-BARRETT-2007`, `SRC-FCP4-OPT-CHIRIBELLA-2014`, `SRC-FCP4-GPT-PLAVALA-2023`, `SRC-FW-CAT-STAGE1-COECKE-LAL-2013`, `SRC-FW-CAT-STAGE1-KISSINGER-UIJLEN-2019`, `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-FW-CAT-STAGE1-RUBINO-2017`, `SRC-FW-CAT-STAGE1-ROZEMA-2024`
- `claim_text`: The bounded post-audit re-adjudication of `OBJ-CAT-11` corrects only its existing-framework-distinction criterion and disposition. Canonical FCP-4 explicitly treated process-matrix / indefinite-causal-order frameworks as materially distinct adjacent material rather than part of the established `FW-GPTOPT` or `FW-CQM` identities, and FCP-7/FCP-8 did not supersede that boundary. `OBJ-CAT-11` therefore has `G = PASS` and is retained as a `DEFERRED_REMAINDER`, not an existing-framework mapping. The current FW-CAT taxonomy has three existing-framework assignment objects, six nonframework remainders, three deferred remainders, zero successor frameworks, and unchanged `FW-CAT = REMOVED_WITH_REASON` / verdict-B status.
- `assumptions`: exact frozen FW-CAT object and sources; only criterion G/disposition reopened; A, B, C, D, E, F and H remain fixed; `C = FAIL` and the prior framework-admission failure remain controlling against new admission; no new literature or existing-framework substantive reanalysis.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: current bounded taxonomy correction for `OBJ-CAT-11`; historical FW-CAT Stage-2 artifacts remain accepted at their original scope.
- `weaker_framework_test`: categorical representation, operational language, local quantum laboratories, or a quantum implementation do not establish framework-identity coverage; conversely, distinctness from GPTOPT/CQM does not by itself justify a new framework ID.
- `physical_bridge`: process-matrix / higher-order local-laboratory semantics plus the specified photonic quantum-switch implementation at model scope; no framework-wide spacetime or quantum-gravity bridge.
- `empirical_binding`: the causal-nonseparability quantum-switch evidence remains direct model/implementation evidence only; it supplies no `FW-CAT`, GPTOPT, CQM, category-theory, or quantum-gravity framework selection.
- `falsification_condition`: a later separately frozen source-bound intake that either establishes genuine existing-framework identity coverage or satisfies a complete new-framework admission burden could supersede this deferred classification prospectively.
- `countermodels`: canonical FCP-4's explicit process-matrix / indefinite-order adjacent-family boundary and the FW-CAT Stage-1 Oreshkov core/identity source defeat the prior assumption that operational/process representability is existing-framework identity.
- `scope_ceiling`: `OBJ_CAT_11_CURRENT_DISPOSITION = DEFERRED_REMAINDER`; `FW_CAT_EXISTING_FRAMEWORK_ASSIGNMENT_COUNT = 3`; `FW_CAT_NONFRAMEWORK_REMAINDER_COUNT = 6`; `FW_CAT_DEFERRED_REMAINDER_COUNT = 3`; `FW_CAT_SUCCESSOR_FRAMEWORK_COUNT = 0`; no empirical promotion.
- `status`: `ACCEPTED`
- `supersedes`: `FWCAT-001` only for its present-tense OBJ-CAT-11 mapping and dependent 4/6/2 counts; `FWCAT-001` remains accepted at its original historical Stage-2 scope.
- `notes`: canonical scientific provenance: `FW_CAT_OBJ_CAT_11_EXISTING_FRAMEWORK_MAPPING_BOUNDED_READJUDICATION`; preregistration commit `5ef5d6b5555ef0d94498340e9bfad617325e16a6`; re-adjudication commit `4f73ea29cf4b89e42bf52876b4ad7c782030edbc`; re-adjudication handoff commit `6c71fb1b66d5e01bd03919cb21b9e271fb013243`. The FW-CAT-local `REAL4/EMP3` labels in `FWCAT-003` are historical local-scale tokens and must be read through the prospective empirical/realization namespace alias table; their scientific content is unchanged.


---

# FW-PROCESS-MATRIX current durable claims

## FWPM-001 — Process-matrix operational framework survives admission and hostile adjacent-framework subtraction

- `framework_ids`: `FW-PROCESS-MATRIX`, `FW-CQM`, `FW-GPTOPT`
- `source_ids`: `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-CPICO-ORESHKOV-GIARMATZI-2016`, `SRC-CPICO-COSTA-REVIEW-2026`
- `claim_text`: Under the dedicated causal-process frozen corpus and Method 0.2.1, the generalized process-matrix object is a source-bound foundational comparison object with local quantum laboratories/instruments, a global process object `W`, process-specific validity conditions, and operational causal/signalling structure. The later hostile admission audit preserves this admission after explicit CQM/GPTOPT, weakest-classification, one-object-unity, realizability-scope, and method-sensitivity attacks; it does not establish framework truth, unique physical realization, or empirical selection.
- `assumptions`: exact causal-process Stage-2 framework object and frozen source corpus; framework separation and framework admission remain distinct; ordinary quantum, categorical, process, probabilistic, and representational content is subtracted rather than treated as distinctive evidence.
- `classification`: `SOURCE_DERIVED`
- `canonicity_level`: framework identity/admission at the frozen source scope only.
- `weaker_framework_test`: generic process/category/probability structure and CQM/GPTOPT coverage are insufficient to reproduce the global-`W` validity/causal architecture as a whole.
- `physical_bridge`: native laboratory/instrument semantics and selected process realizations; universal physical realization remains unestablished.
- `empirical_binding`: model/property/subclass evidence only; no framework-level discriminator or selection.
- `falsification_condition`: a source-qualified showing that the admitted object is fully subsumed by an existing framework at the same physical scope, or that its asserted core architecture is not source-bound, would reopen the admission.
- `countermodels`: CQM/GPTOPT and generic process formalisms supply weaker descriptions without reproducing the complete admitted object; selected process subclasses do not exhaust the full `W` domain.
- `scope_ceiling`: `FW_PROCESS_MATRIX_STATUS = PAIRWISE_COMPARISON_COMPLETE`; admission survives hostile audit; no framework winner, truth claim, or empirical selection.
- `status`: `ACCEPTED`
- `supersedes`: `FWCAT-004` only for the present-tense disposition of the causal-process remainder; `FWCAT-004` remains accepted at its historical pre-intake scope.
- `notes`: canonical framework identity is carried by the dedicated causal-process Stage-2 taxonomy, K1–K10 baseline blob `42a991dcdb250f305e47ac4360fc780bb4e78a7b`, and hostile admission audit. The general Method-0.2.1 reformulation/meta-framework ambiguity remains a separate governance issue and does not change this frozen admission result.

## FWPM-NULL-001 — Process-matrix null control leaves a nonempty S3 residue while strict E2 rises to four after K9 repair

- `framework_ids`: `FW-PROCESS-MATRIX`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-CPICO-ORESHKOV-GIARMATZI-2016`, `SRC-CPICO-JIA-SAKHARWADE-2018`, `SRC-CPICO-ORESHKOV-TIME-DELOCALIZED-2019`, `SRC-CPICO-WECHS-QCQC-2021`, `SRC-FWPM-REAL-SILVA-MULTITIME-2017`
- `claim_text`: The current Method-0.2.1 process-matrix/null control contains E1=0, E2=4, E3=0, E4=0, E5=0, thirteen `NONE_ESTABLISHED` records, and one unresolved framework-wide physical-selection record. Standard-QM lineage and representation/realization relations are retained without erasing a nonempty bounded `S3_FRAMEWORK_WIDE` process-matrix-specific residue involving global-`W` validity/causal architecture and nontrivial composition restrictions.
- `assumptions`: exact GR+QFT+SM null comparator; exact admitted process-matrix object; K9 targeted reanalysis applied without reopening any other key; genericity, lineage, target-conditioning, empirical-inheritance, and residue/relation separation remain binding.
- `classification`: `NONFORCED`
- `canonicity_level`: bounded pairwise null-control result.
- `weaker_framework_test`: standard quantum operational machinery explains the four E2 relations but does not reproduce the complete process-matrix-specific residue.
- `physical_bridge`: selected standard-QM/time-delocalized and subclass realizations; no universal physical realization.
- `empirical_binding`: inherited/subclass evidence only; direct framework-level empirical discriminator after null remains `NO`.
- `falsification_condition`: a source-qualified null representation/recovery exhausting the remaining process-matrix-specific commitments, or a demonstrated error in the relation/residue partition, would alter the residue result.
- `countermodels`: valid process-matrix structures and composition/causal architectures not exhausted by the null comparator's ordinary operational layer.
- `scope_ceiling`: E2=4 at declared relation scopes; residue nonempty at `S3_FRAMEWORK_WIDE`; no E3/E4, framework identity, empirical selection, or scalar score follows.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: current null-control state combines the original null-control artifact blob `a9eea06aa3073e0c50707801fec327c6183be946` with the K9 delta blob `5e1365093398fc68f7b9aaa825b2f43da66250dd` and K9 adjudication blob `88073c891efa194ed7328a1a11853b91b83e55ed`.

## FWPM-REAL-001 — General conditional representation is established while universal deterministic realization and physical selection remain open

- `framework_ids`: `FW-PROCESS-MATRIX`
- `source_ids`: `SRC-FWPM-REAL-SILVA-MULTITIME-2017`, `SRC-CPICO-ORESHKOV-TIME-DELOCALIZED-2019`, `SRC-CPICO-WECHS-QCQC-2021`, `SRC-FWPM-REAL-SALZGER-VILASINI-2025`, `SRC-CPICO-GUO-VBC-2026`, `SRC-CPICO-QU-BELLLIKE-2026`, `SRC-FWPM-REAL-ARAUJO-PURIFICATION-2017`, `SRC-FWPM-REAL-VILASINI-RENNER-PRA-2024`
- `claim_text`: The repaired targeted realizability/physical-selection Stage-2 corpus establishes that every formally valid process matrix has an equivalent conditional pre/postselected multi-time standard-QM representation and probabilistic implementation recipe, and that selected deterministic, subsystem, spacetime-compatible, and concrete experimental realization classes are nonempty. It does not establish deterministic standard-QM realization for every `W`, a necessary-and-sufficient universal physical-selection criterion, unrestricted composition/globalization closure, or framework-level empirical selection.
- `assumptions`: exact frozen 27-source targeted-realizability corpus; representation, postselection, deterministic realization, subsystem realization, closed laboratories, spacetime embedding, and implementation remain distinct layers; no subclass is generalized to all valid `W`.
- `classification`: `NONFORCED`
- `canonicity_level`: source-qualified mixed realization result with framework-wide representation but incomplete framework-wide physical selection.
- `weaker_framework_test`: mathematical representation and selected implementations do not force deterministic or natural universal physical realization.
- `physical_bridge`: nonempty selected bridges up to concrete implementations; framework-wide deterministic/selection bridge unestablished.
- `empirical_binding`: concrete subclass implementation/certification exists; framework-level empirical selection remains `NONE`.
- `falsification_condition`: a general necessary-and-sufficient physical selection law, general deterministic realization theorem, or counterexample to the claimed general conditional representation would materially change this row.
- `countermodels`: assumption-scoped no-go/exclusion results and composition restrictions prevent generalization from selected positive realization classes.
- `scope_ceiling`: `AX3 = ESTABLISHED`; selected realization classes nonempty; `GENERAL_W_DETERMINISTIC_R1_REALIZATION = NOT_ESTABLISHED`; `GENERAL_COMPLETE_PHYSICAL_SELECTION_CRITERION = NOT_ESTABLISHED`; unresolved physical-realizability remainder nonempty.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: controlling repaired Stage-2 adjudication blob `256e73ffc68bacc1860d4b3368868161e9845da1`; external-audit accepted-findings repair changes provenance/role precision but not the AX/A–F scientific values.

## FWPM-K9-001 — K9 repair adds one framework-wide conditional E2 representation without resolving physical selection

- `framework_ids`: `FW-PROCESS-MATRIX`, `FW-NULL-GRQFTSM`
- `source_ids`: `SRC-FWPM-REAL-SILVA-MULTITIME-2017`, `SRC-CPICO-ORESHKOV-TIME-DELOCALIZED-2019`
- `claim_text`: The closed-corpus K9 targeted pairwise reanalysis adds `PMNC-K9-04`, a source-qualified `E2_REPRESENTATION` from every formally valid process matrix to the null comparator's standard quantum/probabilistic operational layer through a pre/postselected multi-time representation and probabilistic implementation recipe. The relation is `S3_FRAMEWORK_WIDE` at representation scope, `PR2_MODEL_BRIDGE`, and `IND-N_TARGET_CONDITIONED`; postselection is load-bearing. It does not supersede the narrower but physically stronger selected-class `PMNC-K9-01`, and `PMNC-K9-03` remains unresolved because general deterministic/physically admissible realization and a complete selection criterion remain unestablished.
- `assumptions`: `A_STDQM` and `A_POSTSEL`; exact K9 closed corpus; no comparator change or K1–K8/K10 reopening.
- `classification`: `VALID_CONDITIONAL`
- `canonicity_level`: pairwise representation relation only.
- `weaker_framework_test`: standard-QM pre/postselection machinery explains the representation; target conditioning blocks independent convergence credit.
- `physical_bridge`: conditional/probabilistic model bridge, not a general deterministic physical realization.
- `empirical_binding`: `EMP0_NONE` for the new pairwise relation; no framework-level empirical selection.
- `falsification_condition`: failure of the source-qualified all-`W` representation claim would remove/downgrade `PMNC-K9-04`; a general physical selection law could separately resolve `PMNC-K9-03`.
- `countermodels`: deterministic/localized/closed-laboratory realization burdens remain assumption-sensitive and are not solved by postselected representability.
- `scope_ceiling`: current strict process-matrix/null E2 count 4; NONE 13; unresolved 1; null-subtracted core residue unchanged; no E3/E4/empirical/recurrence consequence from the K9 delta alone.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical K9 scientific merge `48a047b2ee3757bc076c74fcdf61ca592d17c39a`; comparison delta blob `5e1365093398fc68f7b9aaa825b2f43da66250dd`; adjudication blob `88073c891efa194ed7328a1a11853b91b83e55ed`.

## FCP-NFCPM-001 — Reduced NFC and process matrices share five independent-origin but generic E5 roles only

- `framework_ids`: `FW-NFC-RED`, `FW-PROCESS-MATRIX`
- `source_ids`: `SRC-NFC-RED-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-CPICO-ORESHKOV-GIARMATZI-2016`, `SRC-CPICO-COSTA-REVIEW-2026`
- `claim_text`: The prospective closed-corpus Reduced-NFC/process-matrix comparison evaluates exactly ten K-aligned candidates and finds E1=E2=E3=E4=0, five mathematically generic S0 E5 organizational relations, five `NONE_ESTABLISHED`, zero unresolved records, zero non-generic relations, no pairwise empirical selection, and no empirical support for Reduced NFC. The five generic relations concern allowed-domain organization, test-relative equivalence, admissible-transformation organization, operational-interface mediation, and global-coherence/globalization roles.
- `assumptions`: exact frozen FCP-3 Reduced-NFC object; exact current process-matrix object after null subtraction, targeted realizability Stage 2 and K9 repair; closed canonical corpus; shared incompleteness and vocabulary are forbidden as positive relations.
- `classification`: `GENERIC_MATHEMATICS`
- `canonicity_level`: five generic E5 roles only.
- `weaker_framework_test`: all five roles are available in substantially weaker formal systems and do not require NFC-specific or process-matrix-specific physical commitments.
- `physical_bridge`: no cross-framework physical representation, recovery, realization, or calibrated measurement bridge.
- `empirical_binding`: pairwise E4=0; `PAIRWISE_EMPIRICAL_SELECTION = NO`; `NFC_EMPIRICAL_SUPPORT = NO`.
- `falsification_condition`: a source-qualified non-generic E1–E4 relation, cross-framework physical bridge, or comparator-qualified shared prediction could strengthen the current ceiling; a defect in an E5 functional-role assignment could reduce the generic E5 count without creating positive support.
- `countermodels`: process-matrix global `W`, causal/signalling and composition structure lacks an NFC counterpart; NFC finite-interface sufficiency/capacity, fixed-carrier stabilization, weak-coupling order separation, saturation, and colimit content lacks a process-matrix counterpart.
- `scope_ceiling`: E1–E4 zero; E5 5; NONE 5; non-generic 0; pairwise empirical selection `NO`; no framework winner or scalar score.
- `status`: `ACCEPTED`
- `supersedes`: `NONE`
- `notes`: canonical comparison merge `ff7724464a293ce52a918b68348c6aa6082b1d22`; scientific comparison blob `0e4226a3dfc616554c8829dc677aab5c23128626`; hostile adjudication blob `fc3bb6c71b419595739378d3d44ff477dc489ee8`.

## FCP-RECDELTA-001 — Current recurrence census expands to 15/7 while the 13-family vector and zero Reduced-NFC support remain invariant

- `framework_ids`: `FW-NFC-RED`, `FW-NULL-GRQFTSM`, `FW-AQFT`, `FW-CST`, `FW-CQM`, `FW-GPTOPT`, `FW-LOOP`, `FW-AS`, `FW-STRING-M`, `FW-PROCESS-MATRIX`
- `source_ids`: `SRC-FCP2-KEYS-001`, `SRC-FCP2-EQUIV-001`, `SRC-FCP3-COMP-001`, `SRC-FCP3-NFC-BIND-001`, `SRC-FW-CAT-STAGE1-ORESHKOV-COSTA-BRUKNER-2012`, `SRC-FWPM-REAL-SILVA-MULTITIME-2017`
- `claim_text`: The closed-corpus program-level recurrence delta reconstructs 19 historical pairwise operations, 15 supersession-adjusted current effective pairwise slots, and seven current Reduced-NFC comparator slots. The process-matrix/null current slot adds bounded lineage/target-conditioned E2 and inherited-success/burden support, while the Reduced-NFC/process-matrix slot adds five generic E5 incidences. The recurrence candidate-family count remains 13 with `R1..R10 = 0,0,1,1,7,0,1,3,0,0`; family support incidence changes but family count does not. No independent non-generic foundational recurrence, repeated independent support for Reduced NFC, framework-level EMP4, scalar framework score, or framework winner is established.
- `assumptions`: exact canonical corpus through merge `0bebb5167fa3feed630991c9cbfe007dfb519205`; the process-matrix K9 reanalysis updates rather than duplicates the process-matrix/null current slot; genericity, lineage, target-conditioning, empirical-inheritance, anti-double-counting, physical-bridge and calibration controls remain binding.
- `classification`: `NONFORCED`
- `canonicity_level`: current program-level recurrence epoch and census; no framework truth canonicity claimed.
- `weaker_framework_test`: the five new Reduced-NFC/process-matrix positives remain mathematically generic E5 roles, and process-matrix/null E2 agreement is lineage/target explained; neither supplies independent non-generic foundational recurrence.
- `physical_bridge`: no new common multi-family physical bridge; process-matrix selected realizations remain bounded and Reduced NFC receives no bridge by analogy.
- `empirical_binding`: `CURRENT_INDEPENDENT_FRAMEWORK_LEVEL_EMP4_SLOT_COUNT = 0`; `CURRENT_MULTI_FAMILY_EMP4_RECURRENCE_COUNT = 0`; `REDUCED_NFC_SUPPORTING_RECURRENCE_FAMILY_COUNT = 0`.
- `falsification_condition`: discovery of a missing/duplicated current pairwise slot, a source-qualified non-generic independent E1–E4 recurrence, qualifying repeated Reduced-NFC support across distinct comparator families, or a compulsory calibrated EMP4 discriminator would require revision.
- `countermodels`: the K9 reanalysis demonstrates why repeated operations on one pair do not create extra current slots; the NFC/process-matrix comparison demonstrates that additional generic E5 incidence can increase recurrence-family support without creating a new recurrence family or supporting NFC.
- `scope_ceiling`: historical operations 19; current effective slots 15; current Reduced-NFC slots 7; recurrence-family count 13; R1=0; R2=0; R5=7; Reduced-NFC supporting recurrence families 0; framework-level EMP4 slots 0; no framework winner or scalar score.
- `status`: `ACCEPTED`
- `supersedes`: `FCP-REC-001`; `FCP-REC-007` for present-tense denominator/repeated-support scope only; all historical rows remain accepted at their original evidence epochs.
- `notes`: canonical scientific provenance: `audits/PROGRAM_LEVEL_RECURRENCE_DELTA_2026_09_ADJUDICATION_0_1_0.md` from merge `0bebb5167fa3feed630991c9cbfe007dfb519205`; the preregistered provisional expectation of 14 current slots was explicitly corrected to 15 by exact reconstruction rather than forced to fit expectation.
