# RHOPF-P5 — Kelvin vortex atoms, Hopf helicity, and original Fock admissibility

**Research date:** 2026-11-18. **Parent:** RHOPF-Q0 at fb59ea2b8f2c905e6e007e1c5c47bdafa19b804c. **Branch:** integration/bfss-unified-research-20261108.

**Verdict:** SOURCE_PINNED_EXACT_HOPF_HELICITY = YES; KELVIN_PHYSICAL_CIRCULATION = NOT_ESTABLISHED; FOCK_ORIGINAL_VORTEX_PROTECTION = NOT_ESTABLISHED.

**Mandate:** Seek truth. Extract useful mathematics from historical or unconventional theories without treating it as independent physical evidence. Preserve negative knowledge and discriminate models using equations and observables rather than imagery.

## 1. Why Kelvin's original vortex atom matters

William Thomson (Lord Kelvin), *On Vortex Atoms* (1867), https://www.cambridge.org/core/journals/proceedings-of-the-royal-society-of-edinburgh/article/abs/4-on-vortex-atoms/12A04500F99264C9BFB6B029DF7F798E, proposed atoms as durable vortex rings and knots in a perfect fluid, following Helmholtz's vortex-motion theorems. The physical identification of atoms did not survive, while the inquiry helped develop knot theory. Moffatt's history and mathematical analysis of ideal vortex topology: https://multimediafluids.uam.elogim.com/core/journals/journal-of-fluid-mechanics/article/some-topological-aspects-of-fluid-dynamics/E139B6426152FE1971F49427533A9301 .

**Kelvin's conditional theorem:** A sufficiently smooth, inviscid barotropic Euler flow driven by conservative forces preserves circulation around a *material* loop:

Gamma[C(t)] = integral_C(t) v·dx;
dGamma/dt = integral_C(t) [-dp/rho - dPhi + d(|v|²/2)] = 0.

The result uses barotropic pressure p=p(rho), conservative force and regular material motion so every integrand is an exact differential. If the flow remains a smooth diffeomorphism, transported vortex-line knot types cannot reconnect. **Not every vortex-shaped structure satisfies these hypotheses.**

A distinct quantum-fluid comparison disproves unconditional knot persistence. Kleckner, Kauffman and Irvine, *How superfluid vortex knots untie*, https://www.nature.com/articles/nphys3679, modeled 322 knotted/linked vortices in Gross–Pitaevskii dynamics and found reconnections and untying. Stasiak et al. (2025) experimentally examined reconnection in superfluid helium, https://pmc.ncbi.nlm.nih.gov/articles/PMC12130869/ . A fluid configuration whose complex phase becomes undefined at an amplitude zero can reconnect without contradicting the smooth ideal Euler theorem.

## 2. Literal original BFSS source and the chosen field

The unchanged original BFSS gamma file at lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean has Git blob **b9b8192055c70f0d001d7982669b9823c55562ed**.

The original nine 16×16 signed permutation and sign tables were independently re-extracted and compared exactly against the retained fixture at research/topology/data/BFSS_GAMMA9_SOURCE_PERMUTATION_FIXTURE_2026_11_18.json, Git blob **684680e139cfcd09c37bf075c0c014bdaa80ba35**.

Restrict the 16 real source spinor coordinates to (0,1,8,9), reassembled as two complex components z1,z2. The original source quadratic map gives Q7=2Re(z1 conjugate(z2)), Q0=−2Im(z1 conjugate(z2)), Q8=|z1|²−|z2|², with Q1–Q6=0. This is a chosen complex Hopf S3→S2 **restriction** of the original octonionic S15→S8 structure. It is not a dynamical subfibration or a physical BFSS field.

For a NEW mathematical field on compactified R3, choose

z1=2(x+i y)/(1+r²); z2=(r²−1+2i z)/(1+r²); r²=x²+y²+z².

The spinor has unit norm and tends to (0,1) at spatial infinity. The source quadratic null surface Q8=0 is the ring torus

(sqrt(x²+y²)−sqrt(2))²+z²=1.

The individual zero components z1=0 (z-axis compactified) and z2=0 (equatorial unit circle) are linked as shown at RHOPF-Q0. **The ring torus is a level surface, NOT either of these vortex cores**.

## 3. Exact source-compatible Hopf–Chern–Simons quantity

Define the geometric one-form A = Im(conjugate(z1) dz1+conjugate(z2) dz2). It is a mathematically specified Hopf/Berry connection, **not** automatically a material fluid velocity.

Direct symbolic differentiation gives its Cartesian components:

A_x=−4(xz+y)/(1+r²)²,
A_y= 4(x−yz)/(1+r²)²,
A_z= 2(x²+y²−z²−1)/(1+r²)².

Its curvature B=curl A is

B_x=16(xz+y)/(1+r²)³,
B_y=−16(x−yz)/(1+r²)³,
B_z=−8(x²+y²−z²−1)/(1+r²)³.

Therefore

A·B = −16/(1+r²)³.

Since integral_0^infinity r²/(1+r²)³ dr = pi/16, integration yields integral_R3 A·B = −4pi², and

**(1/(4pi²)) integral_R3 A·(curl A) d³x = −1.**

Thus the *same* chosen source-compatible complex Hopf field has a genuine integer geometric invariant. The absolute value is one; the sign depends on orientation. The independent SymPy 1.14 consumer verified connection, curl, density and exact integral.

Under common rephasing z→exp(iχ)z, independent differentiation confirms A→A+dχ. The curvature B is invariant; the integrated quantity remains invariant under smooth single-valued phase changes with suitable boundary decay. This projective U(1) is NOT the original BFSS SU(2) color gauge or an assumed physical fluid U(1).

## 4. Negative: component phase winding is NOT Berry connection circulation

For the shrinking circle x=Rcosφ,y=Rsinφ,z=0 around the z1 component zero, arg(z1) has winding +1, but

integral_C(R) A·dl = 8pi R²/(1+R²)², tending to ZERO as R tends to zero.

Exact comparison at R=0.4: 2.9884353423; at R=0.1: 0.2463752694; at R=0.01: 0.0025127715. The component winding stays +1 for all radii. The full normalized spinor does not vanish on the individual component zero line, so A is smooth there. **No Kelvin-quantized circulation for A follows.**

A physical Gross–Pitaevskii condensate with specified mass and phase velocity v=(hbar/m)grad(arg ψ) can have quantized loop circulation away from its zeros. The conditions of that **different** field theory must be independently imported; even there, reconnection can occur. Source: https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/on-the-zero-helicity-condition-for-quantum-vortex-defects/D3179B7C80BF4D55AC394E1CED9F28E0 .

## 5. Exact projected-carrier failure during full-spinor escape

Using the previous based S15 escape, take the actual spatial boundary spinor e8 (because the chosen z2 approaches 1) and an allowed extra direction e2. For selected unit φ with u=φ·e8, v=φ-u e8, c=cos t,s=sin t:

H_t(φ)=(c²u+s²)e8 + c v + sc(1-u)e2.

It preserves full S15 norm, starts at φ, ends at e8, and fixes e8 for every t. At spatial origin φ=−e8, and at t=pi/4 the full normalized field equals e2, whose selected complex doublet (coordinates 0,1,8,9) is identically zero. The selected normalized Hopf target and A cease to be defined there despite no singularity in the full 16-spinor.

**A real three-dimensional protection law must forbid this escape dynamically or identify a new conserved invariant on the entire admissible space.** Finite anisotropy is not an infinite physical prohibition.

## 6. Source Fock relevance and its exact current boundary

The original SU(2) BFSS system is 0+1 dimensional matrix mechanics: Boson 2 has 27 real configuration coordinates; Fermion 2 has dimension 2^24 complex with 48 original real Majorana generators. The SU(2) Fock-vector gauge source exists at OP2aOriginalFockGaugeSource.lean (blob 328d607ee2bb45edd4268e5592d784c4c84488a7), its original orthogonal projection at OP2bOriginalGaugeProjectionBridge.lean (blob 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec), and nonzero fixed vacuum at OP2cNonzeroOriginalGaugeVacuum.lean (blob a16d3573b737bb4453e42b0b543d63cbbac1cd1b).

These genuine source findings must NOT be confused with a physical 3D vortex, spatial Kelvin material flow, original Fock-valued Hopf current or 3+1D Hamiltonian. Our review has not derived any such physical bridge or new source exact Noether charge.

The distinct structures are: (i) common-phase U(1) of complex Hopf spinors, (ii) SU(2) BFSS color gauge, (iii) occupation-number U(1) in an explicitly chosen fermion basis, (iv) fermion-parity Z2. A small independent CAR toy explicitly confirms that a single odd Majorana gamma=a+a† has [N,gamma]=a†−a≠0 for N=a†a, while fermion parity flips its sign. This does **not** assert which quantum numbers are conserved by the original full BFSS Hamiltonian. It shows why treating Fock parity or Fock dimension as Kelvin circulation is invalid.

## 7. Evidence and decisions

**Executed local source and independent mathematical consumer**:
- research/topology/tools/rhopf_p5_kelvin_hopf_core.py — Git blob **a873c7ae139775db2dcb4011f913f60a17f0a762**
- research/topology/tools/rhopf_p5_kelvin_hopf_independent_consumer.py — Git blob **51163025b8df79d097b5535b596c3217ba41f6df**

Checks PASS under local Python 3.13 + SymPy 1.14: original gamma-source crosswalk, exact connection/curl/helicity integral, individual phase winding vs smooth connection circulation, rephasing derivative, divergence-free curvature, fixed-boundary full-S15 projected-doublet zero, and one-mode CAR parity/number controls. The original GitHub Lean blob and committed original fixture match on every signed-permutation entry. Both executable source Git hashes match the locally executed file bytes.

**Preserve without promotion:** real Hopf helicity is established as mathematical structure; ideal-fluid Kelvin conservation is established in a separate physical theory under its own assumptions; quantum-vortex reconnection is a relevant real-world counterexample; neither the historic vortex atom nor the Schwarzschild Proton nor Rodin's arithmetic visualizations thereby acquire a new physical derivation.

**Not qualified:** Kelvin Euler flow on source BFSS variables; local fluid velocity, conserved circulation, 3+1D source action, original 48-Majorana Fock/Hopf coupling, source closed Hamiltonian domain, proton properties, mass spectrum, new elementary particle, measured prediction. No native Lean CI was launched; 27 prior BFSS accepted anchors, FCP main, frozen NFC rejected forced Hopf tower D-03 and SM-D1 status remain unchanged.

**Project Lead next decision:** RHOPF-P6 should advance only when an independently sourced physical action or current is provided. Compare at least one actual conserved-current model (ideal Euler, GP superfluid, Faddeev–Skyrme, or source-compatible gauge/Fock) against an allowed zero/reconnection escape. Then require a physical observable that weaker models cannot reproduce. If no physical selection mechanism exists, record NO_SOURCE_DERIVED_VORTEX_PARTICLE and preserve the correct topology.

**Bottom line:** Kelvin's historic question is exactly ours: *what physics, not just what knot, makes a particle persist?* This checkpoint supplies a stronger integer topology result and a precise reason that neither Kelvin circulation nor original Fock physics can yet be inferred from it.
