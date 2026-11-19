# RHOPF-P6 — Original-gamma Hopf texture under actual model constraints: GP Noether charges, density-zero escape, and strict Faddeev–Skyrme comparison

**Project Lead research checkpoint | 2026-11-18 | Unified branch** `integration/bfss-unified-research-20261108`
**Parent:** RHOPF-P5 commit `5d093628274dd2288aa325831da400c3b5f9510a`.
**Decision:** `TWO_GP_SPECIES_CHARGES_AND_FIXED_BOUNDARY_DO_NOT_FORCE_HOPF_SUPERSELECTION; GP_TIME_EVOLUTION_NOT_SIMULATED; STRICT_S2_SKYRME_SIZE_BARRIER_PRESERVED; BFSS_FOCK_PHYSICS_UNQUALIFIED`.

**Charter:** Seek truth, not a proof of Kelvin's vortex atom, Rodin's diagrams, Schwarzschild Proton, NFC, BFSS or the Standard Model. Preserve source-exact positive geometry and negative physical controls. A mathematically admissible field-space path is not automatically a trajectory of the equation of motion.

## 1. Scientific question and source-level dependency

RHOPF-Q0/P5 supplied a **source-derived** complex Hopf restriction of the original BFSS real gamma matrices, and an exact geometric helicity integral. Kelvin's ideal-fluid conservation and GP quantized vortex circulation require their own dynamic hypotheses. P6 asks how much *actual dynamical structure* one needs before the chosen three-dimensional texture can persist.

The source gamma block, not a substitution, is `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean`, original Git blob **b9b8192055c70f0d001d7982669b9823c55562ed**. The four selected original real coordinates (0,1,8,9) form a complex pair (z1,z2); the original quadratic output satisfies

Q7=2Re(z1 conjugate(z2)), Q0=−2Im(z1 conjugate(z2)), Q8=|z1|²−|z2|².

The full nine 16×16 gamma signed-permutation data remain unchanged; this source subspace is an algebraic **choice**, not a BFSS dynamical field selection. Original N=2 BFSS is **0+1-dimensional** matrix quantum mechanics with 27 real bosonic variables and 48 real Majorana operators acting on the complex 2^24-dimensional **fermionic** Fock carrier. There is **no** claim that the GP condensate's two bosonic species are those 48 Majoranas.

The original source Fock-vector SU(2) gauge action, projection and nonzero vacuum exist in OP2aOriginalFockGaugeSource.lean (blob 328d607ee2bb45edd4268e5592d784c4c84488a7), OP2bOriginalGaugeProjectionBridge.lean (blob 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec), and OP2cNonzeroOriginalGaugeVacuum.lean (blob a16d3573b737bb4453e42b0b543d63cbbac1cd1b). None provides the 3D GP action or a BFSS Fock-hopfion Hamiltonian.

## 2. Three competing physical mathematical contracts

**A. Independent two-component Gross–Pitaevskii comparison.** For a complex two-component condensate Ψ=(ψ1,ψ2) in a bounded cube Ω=[−2.5,2.5]^3, set dimensionless units with

E_GP[Ψ]=∫Ω { (1/2)(|∇ψ1|²+|∇ψ2|²) + (g/2)(|ψ1|²+|ψ2|²−1)² } d³x, g=2.

The independently specified action uses the usual first-order Schrödinger symplectic term; its evolution is

i ∂t ψ_j = −(1/2)Δψ_j+g(|ψ1|²+|ψ2|²−1)ψ_j.

There is no Rabi interconversion. The separate U(1) phase symmetries imply continuity equations

∂t |ψ_j|²+∇·Im(conjugate(ψ_j)∇ψ_j)=0,

so N_j=∫Ω|ψ_j|² are conserved for GP solutions with vanishing normal flux. The GP **energy** is independently conserved by true isolated solutions. Our fields are constant (0,1) in a collar of the cube boundary and satisfy both the chosen fixed boundary value and no-normal-gradient compatibility. We **do not solve** the GP PDE.

**B. Strict Faddeev–Skyrme competitor.** A normalized two-spinor defines the source-compatible first Hopf target n=(Q7,Q0,Q8)∈S². A *separately enforced* S² constraint and energy

E_FS[n]=(1/2)∫|∇n|²+(1/2)∫Σ_{i<j}|∂i n × ∂j n|²

have a quartic positive term. Under uniform physical scaling n_L(x)=n(x/L) on R³,

E_FS(L)=L E2(1)+E4(1)/L.

This has a positive optimal scale for any fixed shape with both terms nonzero. It does **not** alone establish a global minimizing soliton or a real particle. The established Faddeev–Skyrme theory uses a genuine S² target; allowing density zeros or an extra S15 target changes the admissible space.

**C. Kelvin ideal Euler vortex.** Kelvin's theorem preserves circulation around smoothly advected material loops if the fluid satisfies ideal barotropic Euler dynamics, conservative forces and sufficient regularity. In GP, phase zeros and vortex reconnection lie outside the required smooth phase-velocity flow. The GP source is not an Euler velocity model. Our chosen Hopf Berry connection and its integer Chern–Simons integral do not automatically become Kelvin's material circulation.

## 3. The key topology: a compact normalized Hopf profile with exact boundary

Use the chosen source-complex spinor on R³, with r=|x| and R=2, defined by

f(r)=π[1−(6u⁵−15u⁴+10u³)], u=min(r/R,1),
ψ1=(sin f/r)(x+i y),
ψ2=cos f+i (sin f/r)z.

At r=0 use the regular extension: ψ1=0, ψ2=−1. At r≥R, ψ1=0, ψ2=+1. The field is sufficiently regular (at least H¹ and C² locally) and has **unit total density at every point**, so defines a based map S³_space→S³_spinor.

The radial degree magnitude is exactly one:

|deg| = −(2/π)∫_0^R sin²f f′ dr = 1,

where the sign depends on ordering/orientation conventions. A separately implemented angular radial integration gives the starting kinetic energy ≈55.757553 and species-one population ≈5.221873 in declared dimensionless units. The exact finite-cube population N2 is 125−N1≈119.778127.

**This compact-support profile is not the prior rational stereographic profile whose quadratic null level was an exact ring torus.** It represents the same kind of unit-degree source-Hopf topology in the same original gamma coordinates. We do not falsely transfer the earlier torus's exact geometric equation into this new, compact profile.

## 4. Rigorous fixed-boundary, N1/N2-preserving, density-zero field-space escape

The naive linear interpolation (1−s)Ψ+s(0,1) violates separate species population. We explicitly repaired that objection. Fix the entire initial ψ1 for all deformation parameters s∈[0,1]:

ψ1(s,x)=ψ1(0,x).

For the second field, set R_s(x)=(1−s)ψ2(0,x)+s, and introduce the smooth enough nonnegative compensating bump

b(r)=[r²/(r²+0.04)] [max(0,1−(r/2.35)²)]⁴.

Then define

ψ2(s,x)=R_s(x) exp(λ(s)b(r)),

with λ(s) the **unique** real solution of

F_s(λ)=∫Ω |R_s(x)|² exp(2λ b(r)) d³x = N2(0).

Why does a solution exist for *every* s, not just discrete sampled values? F_s(λ) is continuous and strictly increasing because the integrand is positive on a region where b>0. For λ→−∞ the integral tends to the volume where b=0, which (up to the measure-zero origin) is

125−(4π/3)(2.35)³ ≈ 70.638404.

That is less than the target N2≈119.778127. For λ→+∞ the integral diverges: on the annulus 2<r<2.35, R_s=1 and b>0. Hence the intermediate-value theorem gives a **unique finite λ(s)** for all s; the implicit-function theorem gives continuity. At s=0, λ=0.

The construction enforces, **exactly as configuration constraints**:

- N1 fixed because ψ1 is unchanged.
- N2 fixed by the defining scalar equation.
- Both component fields fixed to (0,1) for every r≥2.35, including all boundaries of Ω.
- Every configuration has finite GP kinetic and density-potential energy.
- At the spatial origin ψ1=0, b=0, ψ2(s,0)=2s−1. Thus at s=1/2 the **entire condensate Ψ vanishes**.
- At s=1, ψ2=exp(λ(1)b)>0 is real everywhere, so the final normalized spinor lies in a contractible open hemisphere of S³ and has degree **zero**. The initial degree magnitude was **one**.

This is a **constructive field-space path** from a nontrivial to a trivial Hopf sector *without ever changing the individually conserved population values or the boundary*. It necessarily passes through a zero of the total local density. The normalized degree is undefined at that moment, while the original unnormalized GP field remains regular and has finite energy.

**Limitation, crucial:** This path is **not a solution of the time-dependent GP equations** and generally does not keep total energy constant, angular momentum or every other physical invariant. Therefore it shows the absence of an **absolute topological superselection rule from N1, N2 and boundary alone**, not decay of a real trapped skyrmion, an accessible Hamiltonian trajectory or any finite lifetime.

## 5. Independent numerical tests and source controls

Original source gamma signs/permutations were read from the checked research fixture and used to validate the exact Q0/Q7/Q8 output at 24 independent samples per grid. A fully independent radial integration checked degree and N1, and separately checked the GP kinetic integral. Three-grid convergence used 3D tensor-product trapezoid integration and finite-difference gradients, with N∈{25,41,57}, cube volume exactly 125, and nine deformation parameters s=0,1/8,...,1.

| N³ grid | GP starting energy | GP endpoint energy | Max detected |N_j(s)−N_j(0)| |
|---|---:|---:|---|
| 25³ | 50.70731 | 18.55856 | < 5×10⁻¹⁰ |
| 41³ | 53.83759 | 19.81859 | < 5×10⁻¹⁰ |
| 57³ | 54.76268 | 20.19658 | < 5×10⁻¹⁰ |

At each tested grid, energy **decreased at every sampled parameter** along this particular charge-preserving configuration path; its total local density reached zero exactly at the origin at s=1/2. Energy convergence improves toward the independent continuum radial kinetic value 55.757553. This is numerical evidence for that constructed route, **not proof of monotonicity at every s, a GP dynamical instability, or an actual time evolution**.

On the 41³ grid the **separately constrained** S² Faddeev–Skyrme energy had E2≈135.742708, E4≈253.562832 in our arbitrary coefficient convention. The *single-profile uniform-scale* minimum is at L*=√(E4/E2)≈1.366736, E(L*)≈371.048813. No comparison between these absolute arbitrary-unit energies is a physical mass prediction.

The unrestricted GP radial gradient energy rescales Ekin(L)=L Ekin(1)→0 as L→0, but simultaneously its species-one population rescales N1(L)=L³N1(1). **Thus unrestricted Derrick shrinkage is not by itself an admissible fixed-N1 argument.** This is why the stronger N1/N2-preserving path above matters.

The independent consumer additionally checked the Rabi-conversion countermodel on the *single-boson sector* of a two-species **bosonic** Fock space:

N1=diag(1,0), N2=diag(0,1), H_Rabi=[[0,1],[1,0]].

Then [N1,H_Rabi]≠0 while [N1+N2,H_Rabi]=0. Adding interconversion changes which Noether charges are protected. This **bosonic** Fock example is emphatically **not** the original BFSS **fermionic** Fock representation or a sourced Rabi term in BFSS.

## 6. Independent literature and fairness to viable alternatives

Ruostekoski and Anglin proposed 3D skyrmion configurations in two-component BECs: https://doi.org/10.1103/PhysRevLett.86.3934 .

Battye, Cooper and Sutcliffe (2002) found stable 3D skyrmions for **phase-separated** two-component condensates: https://doi.org/10.1103/PhysRevLett.88.080401 .

Savage and Ruostekoski (2003) explicitly reported energetically stable trapped GP skyrmions, with **separate species conservation** resisting shrinking, plus rotation/laser confinement resisting drift: https://doi.org/10.1103/PhysRevLett.91.010403 .

The newer GP study https://doi.org/10.1103/PhysRevA.111.013301 reported dynamically unstable overlapped rings that can separate into linked vortex rings/skyrmions. Rigorous GP reconnection constructions also exist (https://doi.org/10.1007/s00220-021-04177-w).

**Our result does not contradict these papers**: the symmetric homogeneous model with a constructed charge-fixed but energy-changing path is neither their trapped/phase-separated physical system nor its on-shell GP evolution. Their extra model parameters, trapped geometry and conserved populations can produce energetic/metastable stability even though population alone is not an absolute topological prohibition.

## 7. Original BFSS Fock relevance and next scientific decision

The original original BFSS 48-Majorana CAR and gauge projection are preserved as source truth; no change to the 27 accepted anchors, blocked W0C2B2, NFC retired source-forced Hopf tower D-03, FCP main or SM-D1 qualification. No native Lean CI gate was launched.

There is **no direct identification** of GP bosonic U(1)^2 particle numbers, an optical Hopf Berry connection, Kelvin fluid circulation, original fermionic BFSS Fock parity, or the source SU(2) BFSS color gauge. Their associated Hilbert carriers, currents and dynamics are different.

**P6 accepted as research mathematics and model-based counterfactual:**
1. Genuine original-gamma first-Hopf structure remains.
2. An independently specified GP model demonstrates that exact conservation of *both* species numbers plus spatial boundary does not make the normalized 3D Hopf charge an absolute superselection sector if total density is allowed to vanish.
3. Strict Faddeev–Skyrme quartic size stabilization remains a valid **competing model**, but it relies on a genuinely constrained target and specified action.
4. The original fermionic BFSS Fock model remains a necessary source interface, **not yet a particle-protection or physical 3D fluid theorem**.

**Project Lead recommendation RHOPF-P7:** Choose the next test by information gain: (a) source-resolved actual GP *time evolution* with exactly conserved energy and N1/N2 and no-flux boundary, including perturbation/instability and trapped/phase-separated controls; or (b) a newly independently motivated 3+1D fermion–field action with actual original BFSS 48-Majorana source compatibility and a calculable index/observable. Do not invent an action simply to force an integer topological charge, and do not promote these model results into proton or fundamental-particle claims.

**Reproduction:** The executed local Python 3.13 / NumPy 2.3.5 / SciPy 1.17 consumers are research/topology/tools/rhopf_p6_gp_dynamics_core.py (Git blob **3297ad8bfdc943f624ed16b0d0de5dac044bfcea**) and research/topology/tools/rhopf_p6_gp_charge_preserving_consumer.py (Git blob **ee224ece8ba0bd24c0cda4ed539c1bc7a8be1d11**). Both blobs were checked byte-identical to local executed sources before this commit. The independent consumer reconstructs the complete N=25,41,57 × nine-step numerical evidence file. No unverified physical model or CI claim.
