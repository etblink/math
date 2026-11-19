# RHOPF-P8 — Trapped GP energetic selection: a stationary saddle, a separated numerical equilibrium, and an adversarial Hopf-imprint failure

**Date:** November 18, 2026. **Project Lead research checkpoint.**  
**Repository:** etblink/math — branch integration/bfss-unified-research-20261108.  
**Exact parent:** RHOPF-P7 commit 8d70c28d693856738a242883859e657bec90225c.

**Verdict:** PHASE_SEPARATED_TRAPPED_GP_APPROXIMATE_EQUILIBRIUM_FOUND; SYMMETRIC_STATIONARY_STATE_HAS_NEGATIVE_FIXED-POPULATION_ENERGY_CURVATURE; SELECTED_HOPF_IMPRINT_NOT_A_ROBUST_ENERGY_MINIMUM; NO_ORIGINAL_BFSS_FOCK_PHYSICAL_INTERFACE.

Our charter remains **seek truth, preserve positive and negative knowledge, and compare with simpler existing physics**. This stage is not a proof of Kelvin's vortex atom, the Schwarzschild Proton, Vortex Based Mathematics, BFSS particles, NFC, or a candidate Standard Model extension.

## 1. Why the stability test matters

RHOPF-Q0/P5 proved that a four-real-coordinate restriction of the original BFSS nine real 16×16 gamma matrices generates a genuine complex Hopf field with a toroidal quadratic zero surface, linked regular fibers, and Hopf–Chern–Simons integral ±1. RHOPF-P6 distinguished configuration-space population conservation from actual GP dynamics. RHOPF-P7 simulated independent two-species GP time evolution, found conserved species populations and nearly conserved energy, but the late-time winding estimate had inadequate spatial convergence for a reconnection claim.

Here the research question is more demanding: **Can we identify an actual local energetic minimum and show it is robust against an explicitly chosen symmetry-breaking perturbation, before calling a knotted configuration a stable particle?**

Prior published work does obtain stable two-component condensate skyrmions under suitable physical parameters. Battye, Cooper and Sutcliffe, "Stable Skyrmions in Two-Component Bose-Einstein Condensates" (2002), DOI 10.1103/PhysRevLett.88.080401, found stable charged three-dimensional solutions in a phase-separated regime. Savage and Ruostekoski, "Energetically Stable Particlelike Skyrmions in a Trapped Bose-Einstein Condensate" (2003), DOI 10.1103/PhysRevLett.91.010403, identified population conservation and appropriate trap/rotation or pinning assumptions. Their later numerical study, DOI 10.1103/PhysRevA.72.043616, further showed dependence on scattering lengths, atom number and confinement.

These are **independent GP claims**, not evidence that the BFSS Fock space is a condensate or that the historical Kelvin theory describes atoms.

## 2. Exact source and independent physical comparison model

The original source gamma file remains exactly:
lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean
Git blob b9b8192055c70f0d001d7982669b9823c55562ed.

The source four-real subcarrier coordinates (0,1,8,9) supply two complex amplitudes, with source quadratic output Q7=2Re(z1 conjugate(z2)), Q0=−2Im(z1 conjugate(z2)), Q8=|z1|²−|z2|². The CHOSEN three-dimensional Hopf input is mathematical, not a source-derived BFSS dynamical field.

For the separate trapped GP experiment, take a TWO-COMPONENT BOSONIC complex field Ψ=(ψ1,ψ2) on a large periodic computational cube Ω=[−L,L)^3 with a harmonic confining potential V(r)=0.5*(0.6)²*r². The dimensionless Hamiltonian functional is

E[Ψ] = ∫Ω [ (|∇ψ1|²+|∇ψ2|²)/2 + V(n1+n2) + (g/2)(n1²+n2²) + g12 n1 n2 ] d³x,

where n_j=|ψ_j|², g=2 and g12 is 2 (miscible-interaction control) or 3.5 (immiscible-interaction parameter control). Both independently conserved component populations are fixed at N1=N2=50.

The continuous Hamiltonian GP equations are

i ∂t ψ_j = −(1/2) Δψ_j + [V+g n_j+g12 n_other] ψ_j.

An approximate stationary state solves

[−(1/2)Δ+V+g n_j+g12 n_other] ψ_j = μ_j ψ_j.

Imaginary-time normalized Strang minimization is used to prepare candidates. It is NOT real physical time evolution; separate normalization preserves each N_j. Stationary-equation residuals are computed separately with the original spectral operator, not inferred from slowing energy decay. Short REAL-time unitary Strang integration is then used to test candidate response.

**Boundary qualification:** Ω is periodic with an imposed harmonic potential that is not itself a globally smooth periodic function across the computational seam. The trap makes wavefunction amplitudes small at that seam, but not identically zero. Results at N40/N48 use L=6 where measured maximum face amplitude is about 0.006, markedly smaller than the N32 L=5 boundary amplitude of about 0.072. This is an approximation to a confined system, not an exact R³ or fixed-Dirichlet theorem.

## 3. Exact negative energy direction of an approximately stationary mixed state

Start with a symmetric mixed radial candidate ψ1=ψ2=φ, prepared under g12=3.5 while maintaining N1=N2=50. It becomes approximately stationary with norm-residual about 0.000765 at N40. But stationary does not mean stable.

Define a smooth periodic odd displacement f(x)=sin(πx/L). For any ε, impose **exact population preservation** via

ψ1(ε)=φ(1+ε f)/sqrt(1+ε² q),
ψ2(ε)=φ(1−ε f)/sqrt(1+ε² q),
q = (∫φ² f²)/(∫φ²).

Because φ is even and f is odd, both linear population corrections cancel and this common normalizer keeps both species populations fixed.

For the original discretized spectral GP functional, the energy along this direction has an **exact** rational form,

E(ε)=(K0+ε²K2)/(1+ε² q)+(I0+ε²I2+ε⁴I4)/(1+ε² q)²,

where

K0=∫(|∇φ|²+2V|φ|²), K2=∫(|∇(φ f)|²+2V|φ f|²),
I0=(g+g12)∫|φ|⁴,
I2=(6g−2g12)∫|φ|⁴ f²,
I4=(g+g12)∫|φ|⁴ f⁴.

Therefore, exactly within the stated discretization,

E''(0) = 2(K2−q K0+I2−2q I0).

This is **strictly NEGATIVE** in our independently evaluated candidate:

- N32, L=5: E''(0)=−38.350496.
- N40, L=6: E''(0)=−31.811777.
- N48, L=6: independent small-ε finite-difference estimate ≈−31.807313.

The exact rational E(ε) reproduces the full original spectral energy to floating-point error at ε=0.01, 0.03 and 0.08 in an independent N40 calculation. A population-preserving ε=0.03 shift lowers the N40 mixed-state energy by about 0.014297.

**Consequence:** this mixed GP configuration is an approximate stationary state but an **energetic saddle in an explicit fixed-N direction**. Calling it a stable toroidal particle because its shape is stationary would be wrong. The sign is consistent with physical phase separation under g12>sqrt(g11*g22).

This is an analytic curvature expression for the tested parameterized finite-grid state, not a complete spectral Hessian/Bogoliubov–de Gennes (BdG) theorem on continuum function spaces.

## 4. Separated positive control: lower energy, sampled positive direction, genuine dynamics

Starting instead from two displaced species Gaussians with exactly the same N1=N2=50 and g12=3.5, fixed-N imaginary-time minimization converges to a lower-energy separated state.

| Grid and domain | Symmetric mixed energy | Separated energy | Separation energetically preferred |
| --- | ---: | ---: | --- |
| 32³, L=5 | 218.088596 | 211.796453 | YES |
| 40³, L=6 | 218.241932 | 211.865494 | YES |
| 48³, L=6 (separate check) | 218.241926 | 211.865492 | YES |

At N40, the mixed-state interspecies overlap ∫n1 n2 is 13.17110 and the separated state's is 4.69461. For the g12=2 miscible-interaction control with the same populations, the overlap is about 15.63990. Thus the actual independently defined interaction changes the spatial field configuration as expected.

The separated N40 state has a stationary residual about 0.001278 and a **positive sampled even curvature**, about +66.72018, under ±0.03 times the same population-preserving opposite-displacement mode. Both E(+ε) and E(−ε) exceed the candidate's energy in this direction. This **does not establish positivity for all perturbation modes**.

Run its genuine real-time GP evolution for t=0.3 using dt=0.005. The separated N40 state has an absolute energy drift about 2.62×10⁻⁸, maximum species-population drift about 2×10⁻¹², and relative component-density drift about 1.28×10⁻⁴ from its prepared stationary density. A separate smooth amplitude perturbation with ε=0.15 raises its initial energy by about 1.0485; real-time energy and both populations remain nearly conserved.

This is a valid **numerically approximately stationary and short-time robust trapped phase-separated state**, our bounded positive **GP** control. It is **not** yet a global constrained energy minimum, a full BdG-stable eigenmode census, or a stable Hopf/skyrmion.

## 5. The original-source Hopf imprint fails this specific energetic-selection gate

Take the compact degree-magnitude-one complex Hopf profile from the *unchanged* RHOPF-P6 original-gamma restricted coordinates. Multiply it by a positive trap envelope and independently rescale both complex species amplitudes by positive constants so that N1=N2=50. The initial **normalized** two-component map still has unit winding magnitude by positive target-space deformation; the physical condensate is very dilute in the far tails.

At N40, g12=3.5, using this explicitly chosen initial condition:

1. The initial trapped GP energy is approximately **628.75049**.
2. Restricted symmetry-preserving normalized imaginary-time relaxation lowers it to approximately **223.91337**, still well ABOVE the separated equilibrium at **211.86549**.
3. Add a small generic symmetry-breaking component (ε=0.08 Gaussian) that fills the selected ψ1 axial zero while keeping both species populations fixed. The energy temporarily rises to **224.04977**.
4. Further unrestricted normalized imaginary-time relaxation decreases it to **211.87743**, close to the independently prepared separated reference.

At N32 the analogous comparison is 626.80327→223.98058→211.80727 versus separated reference 211.79645. This confirms the challenge is not solely a single coarse-grid outlier.

**Stop rule:** The final sampled total density in the trapped tails can be extremely small, about 1.8×10⁻²¹ at N40. Dividing by this density to compute an integer winding is numerically ill-conditioned. Therefore NO claim is made that we have detected, resolved or proved an exact continuum topological transition. We have shown only that **this particular Hopf-imprinted preparation does not withstand an adversarial energy-selection test as a robust local minimum** under the chosen interactions and trap. Other independently justified trapped and phase-separated skyrmions found in the literature are not ruled out.

The symmetry-breaking relaxation is imaginary-time minimization, **not an energy-preserving physical GP trajectory**, so it does not determine physical decay times.

## 6. Original BFSS Fock space: still a crucial separate boundary

The original SU(2) BFSS system is 0+1-dimensional matrix quantum mechanics with 27 real bosonic configuration variables, 48 original Majorana CAR generators acting on a 2^24-dimensional complex **fermionic** Fock Hilbert space. The actual original Fock SU(2) gauge-vector action, orthogonal fixed-space projection and nonzero gauge-fixed vacuum were previously sourced in OP2a/OP2b/OP2c. The original 16×16 spinor Clifford map used in our complex Hopf texture and the full 48-Majorana Fock representation are **different carriers**.

Nothing in this independently specified GP BOSONIC two-field action establishes a BFSS material circulation, condensate species number, index, source Fock-vector Spin(9) lift, conserved charge domain or 3+1D particle. The sourced Hopf S³→S² geometry remains mathematically genuine but has not acquired dynamical BFSS protection.

This P8 experiment therefore supports a disciplined principle: **a real stable mechanism requires the actual dynamical action and its permitted perturbations; imposing a beautiful topology or selecting a stationary picture does not supply it**.

## 7. Reproducibility, source pins, and governance

**Locally executed source byte hashes (Git blobs):**

- research/topology/tools/rhopf_p8_trapped_gp_core.py — **ece95bc5e22201ff8aad0277ce92af7ea41bd8fd**
- research/topology/tools/rhopf_p8_stationarity_independent_consumer.py — **c3094613050ed374bdffa3a2caeb417e5bdca95f**

Both Git blobs have been staged byte-identical to the locally executed test source. Independent default consumer PASS: N32 and N40 stationary mixed/separated comparisons; exact negative directional curvature; positive sampled separated curvature; independent fixed-population miscible control; genuine short-time GP dynamics, energy/Nj diagnostics and perturbation; adversarial original-gamma Hopf-imprint relaxation on both grids. Separately conducted N48 finite-grid refinement agrees closely with N40 energy and curvature. The full P8 consumer has an optional --full control to reproduce N48 as part of the same suite, at greater computational cost.

**Complete locally generated evidence:** research/topology/data/RHOPF_P8_TRAPPED_GP_STATIONARITY_PERTURBATION_EVIDENCE_2026_11_18.json, SHA-256 **e40f4f4af23a2c4073bfb67d468c28e2b67e2e5525e54cae3f43c315e648dcfd**. It is a generated local research artifact, not silently treated as a committed GitHub file. The accompanying committed curated JSON ledger and committed executable scripts are the reproducibility entrypoints.

**Reproduction command:** OPENBLAS_NUM_THREADS=1 python research/topology/tools/rhopf_p8_stationarity_independent_consumer.py. Use --full for optional expensive 48³ refinement. Python 3.13.5, NumPy 2.3.5 and SciPy 1.17.0, complex double-precision Fourier methods.

**No native Lean CI was launched; no original BFSS source, 27 previously accepted BFSS gates, FCP main, frozen NFC forced-Hopf-tower retirement D-03, or prospective SM-D1 qualification was altered.**

**Next Project Lead recommendation (P9):** Do not continue parameter-searching invented GP Hopf candidates without a specific source and discriminating experiment. The strongest available bounded contribution is the directional energetic-instability theorem for the approximate symmetric GP state and the independent phase-separated positive-control response. For an actual stable Hopf GP result, demand a nontrivial stationary solution with controlled nonzero density/boundary, full BdG mode spectrum, perturbations and reproducible continuum convergence. In the broader truth-seeking program, prioritize the **source-defined original BFSS 48-Majorana Fock-to-physical-field interface, Standard Model counterfactual comparison, and a measurable new prediction** before advancing fundamental-particle narratives.

**Conclusion:** A stationary-looking vortex is not enough. P8 explicitly falsifies one false stability inference, verifies an interaction-selected conventional lower-energy state, and identifies why our chosen source-gamma Hopf imprint is not yet a robust physical candidate.
