# Standard Model Foundations — SM0 truth-first empirical requirements atlas, version 0.1

**2026-11-18. Research-only comparative investigation. No BFSS theorem gate.**
**Purpose:** assess which proposed foundational structures can account for observed particle physics, rather than attempting to validate a favored framework. This document is a scientifically independent comparison lens; it is **not** a Standard Model derivation, a new particle-physics result, or a qualification of any Lean source.

Canonical charter: [TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md](../methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md).
BFSS original source and CI acceptance ledgers are evidence about mathematical theorems, not observational confirmation.

## Public empirical baseline and primary references

- **[Particle Data Group, Review of Particle Physics 2026 — Standard Model and Related Topics](https://pdg.lbl.gov/2026/reviews/standard_model_and_related.html)**: use the 2026 reviews of electroweak constraints, Higgs status, CKM, CP violation, neutrino masses/mixing, and QCD for up-to-date numerical data. Do not silently mix benchmark values or dates from different PDG editions.
- **[CERN — The Standard Model](https://home.cern/science/physics/standard-model/)**: established particle generations, force content, strengths and well-known omissions (gravity, dark matter origin, family count).
- **[US Department of Energy — Standard Model, updated March 11, 2026](https://www.energy.gov/science/doe-explainsthe-standard-model-particle-physics)**: independent official physics overview.
- **[Particle Data Group 2026 home](https://pdg.lbl.gov/2026/)**: authoritative source for future numerical benchmark tables and provenance.

Avoid extrapolating these background resources into a claim that one particular beyond-Standard-Model framework is experimentally supported. No attempt here to reproduce 2026 precision parameter tables; each numeric candidate requires its own exact measurement/error/source.

## First pass: requirements-to-evidence matrix

| Requirement or constraint | Status in established particle physics | Exact underlying test we must demand from any proposed framework | BFSS original finite-SU(2) context (NOT a derivation) |
|---|---|---|---|
| Four-dimensional relativistic effective QFT | SM is 3+1-dimensional relativistic gauge theory | Define a controlled spacetime, Lorentz action, effective fields and domain where observables are computed | BFSS SU(2) is 0+1-dimensional matrix quantum mechanics; **no source-exact 4D effective QFT constructed here** |
| Local gauge Lie algebra and representations | \(\mathfrak{su}(3)_C\oplus\mathfrak{su}(2)_L\oplus\mathfrak{u}(1)_Y\) with measured charges | Construct the **specific** gauge action, correct normalization and global-group subtleties | BFSS SU(2) matrix gauge action is **not** the electroweak SU(2)_L; Spin(9) rotations are not the SM gauge group |
| Chiral fermion spectrum | Three observed quark/lepton generations with different left/right electroweak representations | Obtain exactly the chiral Weyl representation content and electric charges; count families | The 48 real source Majorana operators do not imply three SM generations or 4D chirality |
| Gauge anomaly consistency | SM fermion representations satisfy perturbative gauge and relevant global-anomaly conditions | Verify \(SU(3)^2U(1), SU(2)^2U(1), U(1)^3\), mixed gravitational-hypercharge and SU(2) global constraints in proposed matter representation | Existing Fock/Clifford commutators alone do not provide an SM chiral anomaly calculation |
| Electroweak breaking and Higgs | Observed Higgs sector and W/Z mass relations, subject to precision tests | Produce appropriately transforming scalar/Higgs effective field and gauge-invariant Yukawa couplings | No BFSS finite-SU(2) original gamma identity constitutes a Higgs sector |
| Quark and lepton masses and mixing | CKM, lepton flavor oscillations, mass patterns measured | Produce controlled masses, mixings and explicit statistical predictions with uncertainty | No observed SM mass matrices derived; SM minimal massless neutrinos require extension to model observations |
| Strong interactions | QCD \(SU(3)_C\), running coupling, confinement and hadronic spectrum | Obtain QCD interactions and quantitatively defensible strong-coupling observables | Commuting gamma operators does not reconstruct QCD |
| Gravity/cosmology and missing sectors | Gravity outside SM; dark matter origin and baryon asymmetry remain open | Distinguish separate gravitational and cosmological hypotheses; do not retrofit an unobserved mechanism without tests | BFSS M-theory motivation is not evidence of a completed 4D gravity+SM theory |
| Operator/symmetry mathematics | Consistent representation identities are necessary but not sufficient | Prove exact interface maps, covariance and domains, then attach observed signatures | Existing qualified BFSS Fock source actions may be **reusable algebraic tools only** |

**Caution about formal logic:** any mismatch of groups, dimensions, representations or spectra must be recorded as a **missing bridge**, not automatically a rigorous no-go theorem. Equally, a matched number or abstract isomorphism is not evidence that a physical identification is correct.

## Worked, falsifiable structural benchmark: one chiral family

Use **left-handed Weyl notation**, with electric charge \(Q_{\mathrm{electric}}=T_3+Y\) and conjugated right-handed particles included as left-handed fields. One ordinary Standard Model family without right-handed neutrino has these gauge representations:

| Field | \(SU(3)_C\) | \(SU(2)_L\) | Hypercharge \(Y\) |
|---|---|---|---|
| \(Q_L\) | \(\mathbf 3\) | \(\mathbf 2\) | \(+1/6\) |
| \(u_R^c\) | \(\overline{\mathbf 3}\) | \(\mathbf 1\) | \(-2/3\) |
| \(d_R^c\) | \(\overline{\mathbf 3}\) | \(\mathbf 1\) | \(+1/3\) |
| \(L_L\) | \(\mathbf 1\) | \(\mathbf 2\) | \(-1/2\) |
| \(e_R^c\) | \(\mathbf 1\) | \(\mathbf 1\) | \(+1\) |

A transparent **necessary** anomaly benchmark on one family is:

- \(SU(3)^2 U(1): 2(1/6)-2/3+1/3=0\) (up to the common Dynkin index).
- \(SU(2)^2 U(1): 3(1/6)-1/2=0\).
- \(U(1)^3: 6(1/6)^3 +3(-2/3)^3+3(1/3)^3+2(-1/2)^3+1=0\).
- Mixed gravitational-U(1): \(6(1/6)+3(-2/3)+3(1/3)+2(-1/2)+1=0\).
- The original generation contains **four** left-handed \(SU(2)_L\) doublets when colors are counted (three quark-color copies and one lepton doublet), consistent with absence of the elementary SU(2) Witten anomaly.

These are representation consistency checks, **not** proofs that the number of generations is three, of the exact global SM gauge quotient, or of massive-neutrino phenomenology. Do not infer them from BFSS fermion counting. Future typed formalization could check these rational identities without assuming any BFSS model.

## How to use our existing BFSS proofs without privileged inference

- Exact original Clifford/Fock algebra and source gamma-action theorems provide mathematical mechanisms for implementing certain representation relations.
- E0 says *conditional* equality of gamma actions implies commuting operator difference. E1 verifies the original bracket gamma action. E2 source individually compiled its target gamma action but the E2 R1 independent consumer failed recursion; **E2 remains unqualified** until a distinct strict source+consumer Green and archive. None of these theorems establishes chiral 4D SM matter.
- Distinguish **source theorem** (Lean kernel verified), **candidate physical interpretation**, and **observable prediction** with separate columns in every future comparative report.
- Apply the same evidence standards to other candidate theories; no reverse burden where alternatives must meet stronger criteria than BFSS.

## SM0 research decisions and immediate investigations

1. **Track A — observed input:** prepare a version-controlled 2026 PDG measurement matrix (Higgs, electroweak precision, CKM, neutrino oscillations, quark/lepton masses, flavor/CP tests) including uncertainties, dates, definitions and original PDG source links. Do not copy values without verifying data tables.
2. **Track B — mathematical interface:** characterize the precise source, target and obstruction for any proposed 0+1 to 3+1 field-theory map, chiral representation and anomaly-cancellation mechanism. Distinguish an abstract Clifford `Cl_48(C)` representation from an observed chiral four-dimensional multiplet.
3. **Track C — adversarial comparison:** independently evaluate established 4D QFT, BFSS/M-theory suggestions, and geometric/algebraic alternatives against identical SM criteria. Record counterexamples, absence of predictions and missing source-exact maps.
4. **Track D — minimal formal benchmark:** if prioritization justifies it, make an isolated Lean arithmetic/representation anomaly-consistency theorem independent of BFSS before contemplating an "emergence" claim. A known SM identity is not a novel physical discovery.

**SM0 qualification ceiling:** independent research memo and requirements atlas only. No new BFSS canonical anchor, no Standard Model derivation, no prediction, and no peer review. The next update should report which constraints are met, missing, contradicted, or simply untested—and by what evidence.
