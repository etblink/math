# RHOPF-P2 — Fock-space sector selection and explicit bosonic escape counterexample

**Date:** November 18, 2026. **Parent:** RHOPF-P1 989b2615c6845240c2bbb58d24339173076036eb. **Status:** local independent mathematical/numerical consumer PASS; conditional physical countermodel; original BFSS physical source and native Lean CI unchanged.

## Scientific question and decision

Can a Fock space with conserved fermion parity and a spectral gap dynamically preserve a quaternionic/complex Hopf texture embedded inside an unrestricted octonionic 16-component spinor target?

**Answer:** NOT AUTOMATICALLY. A source-gamma-informed toy coupling on a 24-complex-mode exterior Fock space retains a unique even-parity many-fermion ground state and constant positive gap along a concrete boundary-fixed bosonic unwinding path. Finite anisotropy penalties can generate finite barriers but not an absolute topology obstruction. This is a counterexample to an inference, NOT a simulation of original BFSS, a generic impossibility theorem for all Fock couplings, or a new elementary particle model.

Our aim remains seeking truth rather than validating BFSS, NFC, the Standard Model or any preferred theory.

## Original BFSS source and type boundaries

Read-only source pins in etblink/math:

- Original BFSS Core.lean at Git blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60 defines Fermion 2 as a complex Hilbert carrier of dimension 2^24, obtained from 16 real spinor labels times three color labels, i.e. 48 Majorana generators / 24 complex modes. Its N=2 bosonic carrier has 9 times 3 = 27 real matrix-mechanical coordinates, NOT a three-space 3+1D field.
- Original SU2RealGammaProbe.lean at Git blob b9b8192055c70f0d001d7982669b9823c55562ed defines the source nine symmetric 16×16 real Clifford gamma matrices used here, whose octonionic Hopf norm/fiber identities were reproduced by RHOPF-P0 and RHOPF-P1.
- OP3C6AOriginalFockOperatorSpinAction.lean at Git blob 94ba1beb876aaf9af7eaa50b444dc45c9ec9bc69 transports a Spin(9) *operator-algebra* action onto original Fermion 2 operators. It does not automatically construct the physical Fock-VECTOR group unitary, original gauge-fixed Hamiltonian action or unbounded-domain covariance.
- P3M4HS1OriginalSpin9FockHSUnitaryGroupAction.lean at Git blob a9c7b74e358eef4a56c2ae11eca5f138842d55a8 acts on original operator Hilbert–Schmidt columns, not by a sourced physical unitary on Fermion 2 vectors.

**No identification of the 16 classical gamma-spinor coordinates with the 48 original Fock Majoranas is permitted.** The new 24-mode Fock model below is a chosen finite comparator, and matching Hilbert-space dimension with Fermion 2 does not identify their physical theta operators, SU(2) gauge action, supercharges or state spaces.

## Layer 0 — strict Hopf topology and energy

Let Φ(x) be a real 16-component unit vector field over three-space, approaching a chosen constant vacuum outside a compact region. With the exact original gamma matrices define Q_k(Φ)=Φ^T Γ_k Φ, k=0,...,8. The RHOPF-P1 source identity proves Q:S15→S8 has unit norm.

Choose the exact original source coordinate restriction V4=span(e0,e1,e8,e9). Its Q image lies on the coordinate S2 supported at indices 0,7,8; this is the **first complex Hopf map** from S3 spinors, which may also be written in a unit-quaternion/SU(2) representation. It is NOT the second quaternionic S7→S4 Hopf fibration, whose source restriction was separately identified at RHOPF-P1.

The established Faddeev–Skyrme competitor has a declared S2-valued field and quadratic-plus-quartic derivative energy. On R3 under rescaling n_L(x)=n(x/L), the two positive contributions scale respectively as L and 1/L; they can resist Derrick collapse *within a strictly fixed Hopf sector*. The literature's 2026 global minimality theorem has its own S3 domain, target, couplings and energy assumptions and is not a theorem about an unrestricted S15 field. See Guerra–Lamy–Zemas, https://doi.org/10.1007/s00220-026-05702-5 .

## Layer 1 — model extension and exact finite-energy escape

To make an explicit counterexample choose the following **NEW toy energy**, not a BFSS or Standard Model action:

Eκ[Φ] = a∫|∇Q(Φ)|² + b∫Σ_i<j |∂iQ(Φ)∧∂jQ(Φ)|² + κ∫||P_perp Φ||²,

where a,b>0, finite κ≥0, P_perp projects off V4, and the spatial boundary is fixed. On V4 the first two terms have an S2 Faddeev–Skyrme form; the last term vanishes.

Use the already established explicit based homotopy with one **extra** source coordinate e2 outside V4. Let Φ0=e0, u=Φ·Φ0, v=Φ-uΦ0, c=cos t, s=sin t:

H_t(Φ) = (c²u+s²)Φ0 + c v + sc(1-u)e2,  for 0≤t≤π/2.

It is exactly normalized, starts at the original field, ends at Φ0, and fixes Φ0 at each t. A compactly supported sufficiently regular field remains compactly supported along this path. Since all coefficients are finite, Eκ remains finite. Therefore **finite anisotropy cannot make the chosen Hopf sector topologically disconnected**. An infinite hard constraint changes the admissible configuration space; it cannot be silently substituted for a finite energy penalty.

The existence of a finite-energy escape says nothing about the least-energy escape path, a local energy minimum, a tunneling/decay rate, or an experimentally realized field.

## Layer 2 — model Fock adapter and exact constant gap

Construct a deliberately illustrative ONE-PARTICLE Hamiltonian on C24 = C16⊕C8:

hΦ = (Σ_k Q_k(Φ) Γ_k) ⊕ I8.

Let Ftoy=Λ• C24, of dimension 2^24, with Htoy_F(Φ)=dΓ(hΦ). This is number-conserving and **NOT** the original BFSS Majorana, gauge, charge, Hamiltonian, or physical-state operator. Eight positive spectator one-particle levels are chosen by hand.

The exact source Clifford and Hopf identities give (ΣQ_k Γ_k)²=I16 and trace zero. Thus this 16-dimensional block has exactly eight -1 and eight +1 eigenvalues for every Φ, while the spectator adds eight +1 eigenvalues. The Fock many-body ground state fills the eight negative orbitals, has energy -8 and **even parity**, and has a single-particle excitation gap of 1. None of these change during the based unwinding. Its negative-energy projector varies continuously while the gap remains positive.

This is a constructive counterexample: **a Fock-space gap and parity alone do not enforce a classical Hopf charge**. The example does NOT rule out other fermionic Yukawa couplings, zero modes, index obstructions, spectral flow, nontrivial gauge bundles, fermionic anomalies, or source-determined state-selection rules. Those require a sourced physical spatial operator and appropriate admissible domain.

A published distinct system—Dzhunushaliev, Folomeev, Kunz and Shnir (2025), Gravitating Skyrmions with localized fermions, https://doi.org/10.1140/epjc/s10052-025-14074-4—reports Yukawa-dependent localized fermionic modes and spectral flow in a specified field theory. It is evidence that **fermionic dynamics can matter**, not that BFSS has already supplied the required spatial coupling.

## Layer 3 — independent execution and negative controls

Executed locally with Python 3.13.5, NumPy 2.3.5, OPENBLAS_NUM_THREADS=1:

- Source core at research/topology/tools/rhopf_p2_boson_fock_core.py — Git blob **942fe853304797107ce8ad47fa15504c3afbccb5**. Reconstructs the original gamma 16×16 matrices from the pinned source fixture, asserts the Clifford relations, calculates Q and energies, and independently diagonalizes the hΦ one-particle block.
- Independent consumer at research/topology/tools/rhopf_p2_independent_consumer.py — Git blob **eadc76a02fabb2cc0d6828633e437eb1eea89a89**. Computes a compact-support spatial hedgehog and based escape on a 21³ grid; tests 17 deformation parameters and κ=0,10,100,1000,10000. Reproduces the selected S2 support at the start and confirms departure into extra target coordinates. It also constructs actual 3-mode creation/annihilation matrices independently and checks all nine CAR pairs plus its 8×8 dΓ spectrum.
- The original signed-permutation fixture is unchanged at research/topology/data/BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json. Full 17×5 local curves can be regenerated by the consumer and written to research/topology/data/RHOPF_P2_ENERGY_FOCK_GAP_NUMERICAL_WITNESS_2026_11_18.json.
- The companion **curated** data/RHOPF_P2_FOCK_SECTOR_SELECTION_NEGATIVE_CONTROL_2026_11_18.json retains input/source pins, selected numerical outputs, exact Fock gap logic and evidence ceilings; it is not a reconstructed physics experiment.

The locally executed source and consumer Git object hashes exactly matched the corresponding GitHub-created blobs, establishing byte identity. This is NOT Lean-kernel formal verification or full quantitative physics qualification.

**Illustrative grid results (dimensionless, discrete, no physical units):**

| Scenario along the chosen path | Maximum sampled energy |
|---|---:|
| Initial field | 237.5758 |
| κ=0 | 237.5758 |
| κ=100 | 237.5758 |
| κ=1000 | 241.2840 |
| κ=10000 | 985.0271 |
| Final constant field for any finite κ | approximately 0 |

The initial E2 and E4 terms are 39.0913 and 198.4845. The high κ toy has a finite path barrier, not an infinite restriction; a new route or variational minimization might yield a smaller maximum. The Fock toy gap remains exactly 1 and parity stays even for each inspected configuration. Its exact spectral invariance follows analytically from the Clifford relations; finite-grid eigenvalue checks are diagnostics.

## Verdict, governance and scientific priority

**Successful:** a source-informed but clearly marked Fock comparison establishes a precise negative implication: neither octonionic Hopf geometry nor the mere presence of a well-defined, parity-conserving, gapped Fock space guarantees a protected particle when the target admits escape.

**Not established:** a source-typed physical 3+1D BFSS-Fock interaction; original 48-CAR-to-hopfion identification; an invariant SU(2) gauge state, Fock-vector Spin(9) group lift, closed physical Dirac/Hamiltonian operator; a zero-mode index or anomaly; actual metastability or lifetime; mass, charge, statistics, and empirical signature. A three-space field is not BFSS's original 27-coordinate SU(2) bosonic matrix carrier.

**Project Lead next gate RHOPF-P3 (not launched):** locate an original or separately justified physical spatial Dirac/Yukawa/fermionic-determinant operator coupled to the Hopf field and establish its parity, gauge covariance, Hilbert domain, zero-mode index and spectral flow under the *actual allowed extra-direction homotopy*. Determine whether any restriction that blocks the explicit escape is an independently derived physical law rather than an arbitrary infinite penalty. Then compare it with the weaker strict-S2/quaternionic Faddeev–Skyrme model. No particle theory may receive credence solely from a successful toy Fock simulation.

**Preserved:** 27 existing BFSS anchors; W0C2B2 remains blocked; no new Lean or GitHub Actions CI; original BFSS source files and original Fock operator algebra unchanged; frozen NFC's rejected forced-Hopf-tower D-03 remains retired; FCP main and existing SM-D1 qualification unchanged.

## Sources

- Exact BFSS Core and source-gamma / operator-Spin(9) files pinned above; see the linked branch.
- Guerra–Lamy–Zemas, Faddeev–Skyrme global minimality: https://doi.org/10.1007/s00220-026-05702-5 .
- Dzhunushaliev–Folomeev–Kunz–Shnir, fermionic spectral flow in specified Skyrmions: https://doi.org/10.1140/epjc/s10052-025-14074-4 .
- Octonionic Spin(9) geometry: https://arxiv.org/abs/1208.0899 .
