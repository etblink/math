# RHOPF-P7 — Actual GP time evolution: Noether charges, energy drift, immiscible-parameter response, and a topological convergence stop rule

**Project Lead checkpoint | 2026-11-18 | unified integration branch:** integration/bfss-unified-research-20261108  
**Exact parent:** d9e01d2915e27f535eec257a557064f7e9a8319b (RHOPF-P6).

**Decision:** REAL_TIME_GP_SIMULATED_WITH_BOUNDED_NUMERICAL_ACCURACY; TWO_INDEPENDENT_SPECIES_CHARGES_CONSERVED; ENERGY_NEARLY_CONSERVED; REPULSION_REDUCES_OVERLAP; NO_RESOLVED_VORTEX_RECONNECTION_OR_STABLE_PARTICLE; ORIGINAL_BFSS_48CAR_UNTOUCHED.

Our scientific charter remains *seek truth and preserve evidence*, not validation of BFSS, NFC, Kelvin's vortex atom, Rodin's mathematics or a Schwarzschild Proton model. Any claimed physical symmetry, soliton or observable must be sourced independently of an appealing geometric picture.

## 1. What changed from RHOPF-P6

RHOPF-P6 constructed a continuum *configuration-space* homotopy that preserved both species populations and a fixed boundary but was explicitly NOT an energy-conserving solution of Gross–Pitaevskii (GP) dynamics. This was valuable evidence against automatic topological superselection, but could not show what a physical condensate actually does over time.

P7 advances to a genuine numerical time integrator for an independently specified 3D two-component GP equation. The simulation starts with P6's compactly supported complex Hopf spinor whose two complex components are exactly representable in the original BFSS real 16-gamma subcarrier. The physical model is **NOT the original BFSS Hamiltonian**.

P7 adds an interspecies repulsion control and numerical convergence diagnostics. These tests attempt to find robust *dynamic* behavior, not to infer a stable atom from a knot.

## 2. Original-source boundary and the two model Hamiltonians

The unmodified original source file is:
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean
Git blob **b9b8192055c70f0d001d7982669b9823c55562ed**.

The P6 original-sign/permutation fixture, selected source real coordinates (0,1,8,9), and first complex Hopf map are reused unchanged. Original outputs are Q7=2 Re(z1 conjugate(z2)), Q0=−2 Im(z1 conjugate(z2)), Q8=|z1|²−|z2|². This **source-exact** Clifford construction determines the mathematical initial profile, not a BFSS fermionic field or spatial equation.

Set Ω=[−6,6)^3 **with periodic boundary conditions** (a three-torus T³, not exact fixed-Dirichlet R³). For Ψ=(ψ1,ψ2), define n_j=|ψ_j|² and n=n1+n2. In dimensionless units the energy is

E=∫Ω{ 1/2 (|∇ψ1|²+|∇ψ2|²) +(n−1)²+(g12−2)n1 n2 } dx,

and its Hamiltonian evolution is

i ∂t ψ_j=−1/2 Δψ_j + [2(n−1)+(g12−2)n_other] ψ_j.

Use g11=g22=2, compare **g12=2** with **g12=3.5**. The latter is above the standard homogeneous-mixture miscibility threshold sqrt(g11*g22)=2: the intercomponent contact interaction disfavors overlap. We therefore call it an **immiscible-parameter control**. It is NOT by itself a prepared, dynamically stable, trapped or phase-separated skyrmion.

Without interconversion (no Rabi term), each component has a U(1) phase symmetry, continuity equation and a conserved population N1,N2. Energy E is also conserved for the **continuum GP equations** with regular periodic solutions. Numerical algorithms need independent checks and will not preserve E exactly unless designed to do so.

The initial Ψ is the P6 unit-norm, degree-magnitude-one compact radial map supported within radius R=2; the far field is (ψ1,ψ2)=(0,1). At time zero, the periodic box faces are exact vacuum. During evolution they are not clamped: we explicitly measure the deviation on all box faces.

## 3. Numerical method and qualification ceiling

A second-order Fourier pseudospectral Strang split applies an exact half-step kinetic Fourier phase, an exact pointwise nonlinear potential phase and another half kinetic phase. Both linear and nonlinear substeps are norm-preserving for each component in exact arithmetic, so the discrete N1 and N2 are conserved up to floating-point roundoff.

Energy is evaluated independently via Fourier Parseval kinetic energy and the real-space interaction functional. It is **NOT EXACTLY CONSERVED by this Strang method**; temporal refinement measures the truncation error.

The normalized complex doublet gives a map into S³ only when n(x)>0. We estimate its winding on T³ by integrating det(q,∂xq,∂yq,∂zq)/(2π²) using Fourier derivatives of the normalized four-real-component field. **This diagnostic is not guaranteed integer on a coarse grid and is not valid at a density zero.** A strictly positive *sampled* minimum density does not rule out an unsampled continuum zero. We use spatial refinement as a STOP RULE before claiming topology changes.

The solver also validates the stationary uniform vacuum Ψ=(0,1) under both parameter choices, a genuine positive *numerical* control. This does not qualify a metastable Hopf soliton.

## 4. Executed results and adversarial controls

**Local execution:** Python 3.13.5, NumPy 2.3.5, OpenBLAS single-thread. The automated independent consumer passed N=40,48,64 across both g12 controls, t∈{0,.18,.36}, dt=.003; an additional independently executed N=80 control for each interaction is preserved as a supplemental local evidence file. The exact same source file may run all grids with the optional "--full" flag. Reproducible executable Git SHA pins are in section 7.

At the N=80 grid, time t=.36:

| Quantity | g12=2, equal coupling | g12=3.5, stronger repulsion |
|---|---:|---:|
| Initial energy | 55.757509 | 59.222411 |
| Relative energy drift | −2.88×10⁻⁶ | −2.03×10⁻⁶ |
| Component overlap integral ∫n1 n2 | 3.586420 | 3.080229 |
| Approximate normalized S³ degree | −0.985717 | −0.979885 |
| Sampled minimum total density | 0.149832 | 0.130767 |
| Periodic face deviation from initial vacuum | 0.000632 | 0.000631 |

The overlap decrease is approximately **0.50619, or 14.1%** under the stronger repulsion. Both species populations remain constant within relative errors below approximately 10⁻¹³. In this 12-side-length periodic box, initial N1≈5.221873 and N2≈1722.778127. No conversion between bosonic species was introduced.

The original energy difference at equal initial Ψ is exactly (3.5−2)∫n1 n2. This explicitly tests the interaction-parameter wiring and guards against a baseline/control implementation accidentally using the same coupling.

**Time-step refinement:** For N=48, g12=3.5, dt .003→.0015 at t=.36 gives relative energy errors −2.0362×10⁻⁶→−5.0925×10⁻⁷, nearly a fourfold improvement, consistent with second-order Strang. The overlap and sampled minimum densities agree to much better than 10⁻⁴.

**Spatial convergence is decisive for the topology claim.** At t=.36 in the equal-coupling case, the winding estimator gives:

| N³ | Estimated degree | Absolute discrepancy from −1 |
|---|---:|---:|
| 40³ | −0.823035 | 0.176965 |
| 48³ | −0.907879 | 0.092121 |
| 64³ | −0.966022 | 0.033978 |
| 80³ | −0.985717 | 0.014283 |

At t=.18 the N=80 estimate is already approximately −0.9998745. The late-time coarse-grid apparent winding loss is thus dominated by SPATIAL RESOLUTION and cannot be promoted into a reconnection or changed integer. At t=.36 even N80 remains visibly noninteger; the calculation is **not sufficiently converged to certify an exact topology invariant**, and no inter-grid zero-finding theorem was applied.

Likewise, the immiscible control is not shown to stabilize the texture. It reduces overlap and changes density profiles during this short evolution. It is not a phase-separated GP ground state, an energy minimizer or a trapped metastable soliton.

## 5. Literature comparison

The time-dependent GP and two-component vortex/skyrmion program has independent literature support.

- Savage and Ruostekoski (2003), "Energetically Stable Particlelike Skyrmions in a Trapped Bose-Einstein Condensate," DOI 10.1103/PhysRevLett.91.010403, identifies particular trapped mixtures, separate species conservation and rotation/laser confinement conditions producing energetic stability. This is **not** a universal theorem for an unconfined equal-coupling GP initial texture.
- "Spontaneous creation of skyrmions in a two-component Bose-Einstein condensate" (2025), DOI 10.1103/PhysRevA.111.013301, reports numerically unstable overlapped vortex rings that can separate into linked vortex rings and form 3D skyrmions.
- Split-step spectral GP methods and their finite time/space convergence are established, e.g. https://arxiv.org/abs/cond-mat/0411154 and https://www.sciencedirect.com/science/article/pii/S0010465520300205 . Our implementation is a local research prototype, not a validated substitute for those publications' exact numerical methods.
- Large-domain and phase singularity pitfalls matter when interpreting reconnections: https://iris.univr.it/handle/11562/1055635.

We should credit the established GP literature for existing stabilization mechanisms; our calculation does not confer new BFSS/octonionic physical explanatory power merely because we used the source-compatible complex Hopf spinor.

## 6. Original BFSS Fock-space role: retained, not misidentified

The original BFSS SU(2) model has 27 real bosonic matrix-mechanical coordinates, 48 real Majorana fermionic generators and an original complex Fock Hilbert carrier of dimension 2²⁴. Existing original-source SU(2) gauge-vector representation, fixed-sector projector and nonzero vacuum live in the OP2a/OP2b/OP2c modules in the unified branch. Existing original source Spin(9) Fock operator-level actions are also distinct from a globally qualified Fock-vector group action and closed Hamiltonian domain.

The TWO GP bosonic species numbers N1,N2 in this study are conserved charges in an independently specified bosonic field equation; they are **not** original BFSS fermionic Fock occupation numbers, Majorana parity, SU(2) color gauge charges or a conserved Kelvin circulation. Matching symbols, Hilbert dimensions or Hopf geometry do not create a physical operator equality.

No original source-admissible fermion–3D Hopf interaction, spatial Dirac/Fredholm index, BFSS Gauss-physical numerical wavefunction, or novel empirical observable was derived here.

## 7. Evidence, negative knowledge and Project Lead decision

**Exact locally executed artifacts** (both matching prepared GitHub blob hashes):

- research/topology/tools/rhopf_p7_gp_realtime_core.py — Git blob **76780f09e1316b814aaf5643a95f1722317bc2b1**.
- research/topology/tools/rhopf_p7_gp_realtime_independent_consumer.py — Git blob **448dbdd3568735010fa19abed15cd4cc22bf8d00**.

Full generated local data:

- research/topology/data/RHOPF_P7_GP_REALTIME_CONSERVATION_AND_SPATIAL_CONVERGENCE_2026_11_18.json — SHA256 c85ccedb438887568800d500dff400d3836f06b4f99ff9407d5a1861dd09693a.
- research/topology/data/RHOPF_P7_GP_N80_SPATIAL_SUPPLEMENT_2026_11_18.json — SHA256 6772e7a6a7659e528bc73f3c267741f4f59d383043630c72b75b833012bc6445.

These complete numerical outputs are **locally generated evidence files** and not automatically committed just because their paths are named. The Git repository will retain their exact hashes, source code and a concise machine-readable results ledger; the scripts can reconstruct them.

**Stop rules:**
1. Any purported topology jump must survive spatial/time refinement and account for a genuine zero of the *continuum* two-component field. This checkpoint does NOT meet that threshold.
2. Replacing the phase-separation parameter with an actual stable trapped skyrmion requires preparing a fixed-charge minimizer and demonstrating its stability, not merely raising g12.
3. A BFSS/Fock particle claim requires an original 48-Majorana, SU(2) gauge-compatible physical interaction and a distinguishable observation. The sourced 0+1D BFSS system cannot silently be reinterpreted as 3+1D GP.
4. Native Lean CI and original accepted BFSS source qualification remain separate. No new Lean CI was launched and no existing 27 qualified anchors, blocked W0C2B2, FCP main or frozen NFC D-03 were modified.

**Project Lead recommendation:** Accept P7 as a bounded positive dynamic-method result with **NO demonstrated topology-changing event and NO positive skyrmion-stability result**. Before expanding further simulations, prioritize information gain: either specify a real trapped/phase-separated fixed-number equilibrium and its perturbation test (P8), or pivot to an independently motivated original-source-compatible fermion–Hopf physical coupling and measurable index. If neither supplies a prediction beyond established two-component GP or strict Faddeev–Skyrme theory, preserve the mathematics and stop adding physical layers.

This distinction respects Kelvin's question: the structure alone does not make an atom; a physically sourced law and independent observation must do that work.
