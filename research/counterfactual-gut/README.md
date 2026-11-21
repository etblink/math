# BFSS hopfion → particle physics → possible GUT: counterfactual research

**Status:** exploratory, explicitly **not a GUT claim, physical discovery, or Lean-qualified theorem**.  
**Created:** 2026-11-21. **Owner-authorized separate research branch** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Branch point:** `07d6a13c365ffcc581efcad25424025482c493ba` from `integration/bfss-unified-research-20261108` (fixed snapshot, not a live mirror).  
**Canonical scientific policy:** [Truth-first foundational research charter](../../research/methodology/TRUTH_FIRST_FOUNDATIONAL_RESEARCH_CHARTER_2026_11_18.md).

## Purpose and isolation

Use structural counterfactuals to discover what *would have to be true* if an original-BFSS physical hopfion contributed to chiral particles or a genuine unified gauge theory. Preserve both promising implications and decisive negative findings. This branch is a **research notebook and decision ledger**, not a second proof integration branch.

- Do not change `main`, the unified RHOPF branch, frozen original Gamma9/Fock source, accepted gate receipts, or canonical `BFSS_GATE_STATE.json`.
- No Lean modules, CI workflows, merges, PRs, or formal-gate promotions in this initial documentation-only intake. Later development requires an explicit narrow decision.
- No automatic source searches or dependency upgrades. Cite exact external sources or file/commit refs when available.
- Green Lean CI means a bounded theorem on exact source types under specified axioms, *not* that nature implements the model.
- A negative candidate result is preserved with the same fidelity as a positive one. Do not rewrite old entries to erase failed predictions; append dated dispositions.

## Counterfactual premise (not established)

**H0:** Assume the *original interacting BFSS theory* has a normalizable, dynamically persistent excitation with a nontrivial topology-protected Hopf invariant that survives **all admissible physical configurations and gauge operations**, rather than only a chosen finite-dimensional geometry or restricted ansatz. Assume a clear meaning for the relevant spatial topology and for the physical Hilbert/Gauss/domain conditions.

H0 is deliberately stronger than current RHOPF mathematics. Source-derived `S^1` actions, a (\mathbb C^2) model, a classical Hopf map, or finite-dimensional algebra **do not** establish H0. A topology on internal indices is not automatically a topological charge on emergent physical three-space.

**Counterfactual ladder (each arrow independently unproved):**

```text
H0 physical, stable original-BFSS hopfion
 -> H1 quantizable excitation with observable quantum numbers
 -> H2 coupled original Fock operator with protected states/zero modes
 -> H3 3+1-dimensional relativistic effective dynamics + chiral matter
 -> H4 consistent SM gauge reps, hypercharges, anomalies, EWSB, masses/mixings
 -> H5 candidate parent unification + breaking and new testable predictions
```

Failure of any arrow **does not** negate earlier established mathematics or automatically falsify H0. If H3/H4/H5 fail, hopfions might exist without being fundamental matter or a GUT.

## Five competing approaches (not a forced succession)

| Route | Mechanism to test | First discriminating obstruction |
| --- | --- | --- |
| A. Soliton as quantum excitation | Collective coordinates, spin/statistics, finite energy, normalizability | A topological soliton need not be a fermion or a Standard Model particle |
| B. Soliton-bound fermion modes | Original 48 Majoranas / 24-mode Fock operators in a topological background; spectral flow and index when defined | Hopf invariant is not a Dirac index; zero modes may be paired or unprotected |
| C. Emergent gauge connection | Hopf bundle connection, Berry holonomy, possibly higher Hopf structures | Fiber (U(1)) is not automatically electromagnetic gauge symmetry; (S^7) is not a Lie group |
| D. Emergent geometry / large-N limit | Relate finite SU(2) matrix excitation to an appropriate large-N, spacetime/local-QFT description | Finite matrix quantum mechanics is 0+1D; four-dimensional chirality does not follow |
| E. Representation-theoretic unification | Classify Spin(9), Spin(48), Spin(6) and Fock commutants; compare to SO(10)/Pati–Salam | Spatial Spin(6) ≠ internal SU(4) of Pati–Salam; BFSS gauge SU(2) ≠ SM weak SU(2) |

**Preferred order of research questions:** define admissible physical topology and quantum numbers; seek original-source fermion operators coupled to the texture; test for genuinely protected modes; demand a 3+1D chiral effective theory; only then compare unified gauge candidates. Other routes remain open as neutral controls. No favored answer.

## Nonnegotiable reality checks

Any candidate must eventually explain a *local* four-dimensional effective theory with observed Lorentz/causal structure; `SU(3)_C × SU(2)_L × U(1)_Y` and the correct chiral representations and hypercharges; three observed families without inferring them from color-index count; perturbative and global anomaly cancellation; electroweak symmetry breaking, Yukawa/mass/mixing structure (including neutrinos); and compatibility with precision tests, coupling evolution, proton-decay limits, and cosmology. An internally consistent GUT is a model, not proof nature uses it.

## Reuse boundaries and sources to inspect

- **Current original Hopf track:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/RHOPFP9C3D2G1D42OriginalGammaCircleComplexScalarBridge.lean` and `...G1D43OriginalGammaComplexFinrankTwo.lean` on the unified branch. D44/D45 qualifications are dynamic and **not inferred** from this branch snapshot.
- **Original gauge/Spin9 source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean`. This is label-level commutation, not a full 4D gauge or physical spectral theorem.
- **Fock/gauge source:** `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2aOriginalFockGaugeSource.lean` and related original source adapters. Do not replace their carrier with a convenient model.
- **Pinned Mathlib:** `d13f23b723b8a846827a245b89c10fc7d3f11612`, especially `Mathlib/Analysis/InnerProductSpace/PiL2.lean`, `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`, `Mathlib/LinearAlgebra/Projectivization/Basic.lean`.
- **External Physlib (read-only):** [SM gauge groups](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/StandardModel/GaugeGroup/Basic.lean), [anomaly equations](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/StandardModel/AnomalyCancellation/Basic.lean), [unbounded operators](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/QuantumMechanics/Operators/Unbounded.lean). **Toolchain mismatch:** external Physlib Lean 4.36.0 vs pinned project Lean 4.34.1; no imports presumed compatible.
- **External GUT notes:** Physlib [Spin10](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/BeyondTheStandardModel/Spin10/Basic.lean) and [Pati–Salam](https://github.com/leanprover-community/physlib/blob/56430c65b76f73c7c25fc03eed46be1d888520bb/Physlib/Particles/BeyondTheStandardModel/PatiSalam/Basic.lean) use `informal_definition` / `informal_lemma` for the embeddings. They **do not** constitute kernel-checked unification proofs.
- **Published reduction to cross-check:** [Bajaj–Lin, “Solving the SU(2) BFSS model”](https://arxiv.org/abs/2611.14512), a 2026 preprint, not a replacement for original-source proofs or empirical tests.

## Evaluation policy

Every ledger claim gets an **ID**, **premises**, **status**, **positive evidence**, **negative/alternative explanation**, **decisive falsification or gap**, and **next bounded test**. Use exact mathematical objects and typed maps where possible. Distinguish proofs from literature suggestions, external claims from source-qualified declarations, and 0+1D matrix quantum mechanics from 3+1D physics.

Use [COUNTERFACTUAL_LEDGER.md](./COUNTERFACTUAL_LEDGER.md) as the single entry point for updates. Add dated entries and keep prior negative results accessible. No present result is asserted to prove a GUT.

## First bounded test (2026-11-21)

[D0 / D1 original-source configuration topology and Fock index audit](./D0_D1_ORIGINAL_CONFIGURATION_TOPOLOGY_AND_FOCK_INDEX_AUDIT_2026_11_21.md) and the appended [ledger entries CF-016–CF-021](./COUNTERFACTUAL_LEDGER.md) document two narrow obstructions (ordinary bosonic orbit-space contractibility; zero full finite even/odd Fock Fredholm index), plus the **positive** original source supercharge/gauge/Fock operator interface. Both obstructions are carefully distinguished from a potential gauge-equivariant/gapped-sector topology or an index on the infinite-dimensional physical Hilbert space. **No new Lean or physical theorem is claimed.**


## D1A source-operator update (2026-11-21)

[D1A rank-three topology and original Fock operator](./D1A_RANK_THREE_ORBIT_TOPOLOGY_AND_ORIGINAL_FOCK_OPERATOR_2026_11_21.md) extends D0/D1: even excluding rank-deficient 9×3 matrices gives **π₃ of the ordinary SO(3) quotient equal to zero**; the quotient has **π₂=ℤ₂**. The original Gram invariant is insufficient to distinguish color orientation (a cubic 3-form `W` supplies the missing datum); genuine original gauge-covariant Gram/Fock operators already exist in JOIN0A but their physical gap and domain implications are unproved. The [append-only ledger](./COUNTERFACTUAL_LEDGER.md) adds CF-022–CF-027. This is a counterfactual falsification result, **not** a physical Hopf or GUT theorem.


## D1B source Fock spectral classification (2026-11-21)

[D1B algebra and near-origin spectrum](./D1B_ORIGINAL_GRAM_FOCK_SCALAR_KERNEL_AND_ZERO_GAP_AUDIT_2026_11_21.md) derives directly from inspected original CAR and Gamma9 interfaces that every **traceless symmetric** real 16×16 source coefficient gives **zero** JOIN0A Gram–Fock operator; the symmetric trace component is scalar and skew coefficients give the genuinely self-adjoint normalized fields. The existing source norm bound and genuine gauge-invariant Fock vacuum yield normalized **physical gauge-fixed radial** wavefunctions near the bosonic origin with arbitrarily small multiplier image: **zero approximate spectrum for this bounded field**, not an assertion about the true BFSS Hamiltonian's mass gap. [Ledger CF-028–CF-033](./COUNTERFACTUAL_LEDGER.md) records the positive and negative knowledge with scope limits.


## D1C determinant / orientation checkpoint (2026-11-21)

The [D1C original-source Yukawa coefficient audit](./D1C_SOURCE_YUKAWA_DETERMINANT_AND_ORIENTATION_OBSTRUCTION_2026_11_21.md) derives a new exact matrix identity from the pinned 16×16 Gamma9 matrices and normalized source Pauli-color f=√2ε: **det A_f(X)=2^40(det XᵀX)^8** for the specified 48×48 real quadratic-fermion coefficient. The **zero-eigenvalue gap locus is exactly rank-three X**, whose ordinary color gauge quotient already has **π3=0** (D1A). Eigenvalues and Pfaffian sign cannot distinguish a color reflection, and the W orientation sign is not a spatial SO9 scalar. The full native BFSS Hamiltonian/Fock spectral identification, parameter-family topology and 4D chirality remain **unproved**. The ledger adds **CF-034–CF-040**.


## D1D original fermion source identification and physical-domain boundary (2026-11-21)

[D1D exact coefficient, Fock quantization and domain audit](./D1D_SOURCE_PHYSICAL_FERMION_INTERACTION_AND_DOMAIN_BOUNDARY_2026_11_21.md) identifies D1C's 48×48 A_f as the **massless part** of the literal original `FermionQuantization.fermionCoefficient` and deduces the associated exact original Fock quantum interaction from existing upstream source identities. It refines its coefficient-kernel dimensions by bosonic rank: **48 at rank 0, 16 at ranks 1–2, 0 at rank 3**. Critically, mass-deformed `h=m=1` source frequency invertibility does **not** transfer to massless BFSS: its mass term is already invertible at X=0, whereas massless A_f(0)=0. **G4K9D core-form matching and P3M5BE0 natural physical Hamiltonian remain prospective in this frozen snapshot.** [Ledger CF-041–CF-048](./COUNTERFACTUAL_LEDGER.md) preserves all provenance and failed implications.


## D1E recovered acceptance evidence and new first-Chern obstruction (2026-11-21)

[D1E historical strict-green recovery and rank-three Fock-band topology audit](./D1E_HISTORICAL_GREENS_AND_FOCK_BAND_CHERN_VETO_2026_11_21.md) corrects D1D's dated **prospective** language using *exact original-source bytes and native+independent-green receipts*: [G4K9D / massless source #42325087575](https://github.com/etblink/math/actions/runs/42325087575), [M5BE0 physical H #43493125150](https://github.com/etblink/math/actions/runs/43493125150), [M5BF0 physical source graph #43498649514](https://github.com/etblink/math/actions/runs/43498649514). Both source-original smooth-core and closed physical Hamiltonian interfaces are qualified **within their separate scopes**, not jointly a new spectral conclusion. On the ordinary full-rank SU2 gauge quotient, the natural 24-dimensional negative-band **first Chern class is necessarily zero** since H²(Gr⁺₃(ℝ⁹);ℤ)=0. The ledger adds [CF-049–CF-055](./COUNTERFACTUAL_LEDGER.md), retaining all old findings.


## D1F Lean microgate launched (2026-11-21)

[D1F original massless Yukawa/Fock proof and evidence note](./D1F_ORIGINAL_MASSLESS_YUKAWA_FOCK_MICROGATE_2026_11_21.md) links the exact-source Lean candidate, independent original SU(2) consumer, and a **branch-only strict workflow**. Tested SHA: `deff085b1c26b606f81501a68eba50d81c56aedb`; [run #44934836209](https://github.com/etblink/math/actions/runs/44934836209) launched, **not presumed GREEN**. No original source, live RHOPF, main, or pins changed; the D1F candidate does not assert a physical hopfion or GUT.


## D1F R1/R2 RED preservation and source-donor stop (2026-11-21)

[Strict R1/R2 proof-process failure and donor-based next route](./D1F_R1_R2_STRICT_REDS_AND_SOURCE_DONOR_DECISION_2026_11_21.md) preserves [R1 #44934836209](https://github.com/etblink/math/actions/runs/44934836209) and [R2 #44935867919](https://github.com/etblink/math/actions/runs/44935867919). Both reach pinned native source compilation and fail at finite-sum/complex-scalar normalization; R2 has `sorryAx` in two downstream roots. **D1F UNQUALIFIED; two-RED stop rule active.** Do not launch a blind R3. Reuse the actually compiled upstream `FermionQuantization.deformedFermionField_quantized` and quantization-linearity subtraction instead.


## D1F R3 new proof architecture (2026-11-21)

[Source-donor R3 memorandum](./D1F_R3_SOURCE_DONOR_SUBTRACTION_MICROGATE_2026_11_21.md) documents replacement of the two failed direct double-sum tactics with the **compiled** original massive-plus-interaction Fock identity evaluated at `X` and `0`. R3 commit `6d2a9978005cac7f5cddf0bc5c5ed1fb9619a37c` and [run #44937500313](https://github.com/etblink/math/actions/runs/44937500313) **pending at launch**; proof must not be claimed qualified without strict native+independent consumer and allowed-axiom reports. CF-058 added append-only.


## D1F R3 strict RED and stop rule (2026-11-21)

[R3 first-causal diagnosis and staged-proof decision](./D1F_R3_STRICT_RED_AND_STAGED_RECOVERY_2026_11_21.md) verifies [run #44937500313](https://github.com/etblink/math/actions/runs/44937500313), tested at `6d2a9978005cac7f5cddf0bc5c5ed1fb9619a37c`. Original source/toolchain/dependencies PASS; new Lean module RED at frequency-subtraction helper plus source zero-at-origin simplification and local namespace projection errors. D1F public downstream roots carry `sorryAx`, consumer not reached. **No R4 until individual helper proofs have a source-exact validation plan.** Ledger adds CF-059/CF-060; do not infer physical falsification.


## D1G Python-first commuting-valley physics falsification (2026-11-21)

[Original-source bosonic Hessian, 48-Majorana spectrum, leading supersymmetric cancellation, Gaussian quartic and near-valley coefficient gap audit](./D1G_PYTHON_COMMUTING_VALLEY_ENERGETICS_AND_GAP_FALSIFICATION_2026_11_21.md) adds CF-061–CF-066. With exact source f=√2ε and Γ9, the rank-one valley has **16 transverse bosonic oscillators and 16 nonzero Fock frequencies both √2R**, canceling the leading fixed-background energies +8√2R/−8√2R. A selected transverse Gaussian has quartic expectation 7/R², **not** a Gauss-physical spectral theorem. Python bundle SHA256 `4b68099964de576cf26ce415f45c6e24ee514a030bfdb94224a145c471a07113` is delivered separately to owner. No D1F Lean proof, CI, original gamma/Fock, live RHOPF, or main changes.


## D1H gauge-covariant valley covariance, SVD measure and Fock quantum metric (2026-11-21)

[Read D1H source-pinned Python mathematical checkpoint](./D1H_GAUGE_COVARIANT_VALLEY_PYTHON_PRESCREEN_2026_11_21.md) (CF-067–CF-073). **Pure 48-Majorana Gaussian C** is SO3-equivariant and has zero connected stabilizer charge; exact SVD-tube Jacobian `r¹⁰det(I₂−YᵀY/r²)` changes the Gaussian transverse higher-order cancellation. Selected terms give `E_selected~−26√2/R⁵` **only before** the nonzero phase-independent Fock-vector kinetic contribution `12/R²`, radial/patch cutoffs and full Gauss-domain effects. No physical Weyl sequence or Hopf soliton established. Reproducibility ZIP SHA256 `f4749def49364eae243be97763bd6d8848d4a289ede88ee5bfea1463aec3c07e` is supplied to owner separately; D1F strict RED status unchanged.


## D1I explicit 24-mode Fock vector gauge lift + cutoff prescreen (2026-11-21)

[D1I source-pinned analytical/numerical checkpoint](./D1I_EXPLICIT_FOCK_LIFT_GAUGE_TRIAL_2026_11_21.md) (CF-074–CF-080): explicit 8-particle reference Fock Slater state has four ±SO2 color charges cancelling exactly; smooth Gamma9 rotor on spatial patch and ordinary 24-mode exterior-power color action produce a locally smooth gauge-equivariant **candidate many-body vector** (not just covariance). Correct full angular Fock derivative **12/r²**; one explicit smooth cutoff family has asymptotic **model coefficient 26.06000549538/R²**, **NOT** a source-domain-checked full physical Hamiltonian Rayleigh bound or new continuum theorem. User's 23-file checksum-pinned Python reproducibility ZIP SHA256 `f8412861d84ca336a37d801eb1c0c15a517a44958b3a3d697ba42a9627115c07` delivered separately. No change to original sources, D1F strict REDs, main or live RHOPF.


## D1K0 analytic Fock gauge/phase and direct massless expectation (2026-11-21)

[D1K0 source-anchored analytic audit](./D1K0_FOCK_GAUGE_BERRY_AND_MASSLESS_EXPECTATION_AUDIT_2026_11_21.md) (CF-087–CF-092) ties D1I's exact 8×3 color exterior action to the **existing** original G4A/G4E/G4J Fock gauge representation. The stabilizer-fixed eight-particle seed and equal-transverse-color Spin48 rotor yield an abstract smooth vector on the spatial hemisphere × full color sphere. The **canonical** vector lift has zero Berry one-form by trace, without deleting its nonzero Fubini–Study angular kinetic. Independently, direct use of the original compiled massless `deformedFermionField_bracket` and CAR covariance gives exactly `−8√2 r` even with doubly transverse Y; D1F's massless **operator** bridge remains three strict REDs, unqualified. These are finite-dimensional analytic/source-read findings, **not** a newly compiled Lean proof, Gauss-physical smooth core/form estimate, Weyl sequence or continuum theorem. No CI, original Lean, main or live RHOPF mutations.
