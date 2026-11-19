# RHOPF-Q0 — Quadratic null sectors, linked Hopf vortices, and the Schwarzschild Proton counterfactual

**Date:** 2026-11-18. **Branch:** integration/bfss-unified-research-20261108. **Parent:** RHOPF-P4 commit 81c15ac90a46d74878db16ead0fe8f7cf4bc6bb5.

**Project Lead scientific verdict:** EXACT_MATHEMATICAL_OVERLAP_CONFIRMED; vortex/proton physical identification NOT established; original BFSS Fock and Hamiltonian unchanged. The purpose of this parallel bounded track is to test an observed resemblance among a torus, opposing null sectors, vortex lines, the d-z² orbital, Lorentzian cones, Rodin's toroidal arithmetic drawing, and the Schwarzschild Proton. Do not accept or dismiss a model for its origin; preserve exact mathematics and challenge physical claims on their own evidence.

## 1. The load-bearing source: the actual nine BFSS gamma matrices

Read-only original Lean source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean, **Git blob b9b8192055c70f0d001d7982669b9823c55562ed**. RHOPF-P1 and P4 already pinned this original 16×16 real Clifford source. This study does NOT alter it or the 48-Majorana Fock operators.

Restrict a real source spinor in R16 to the original coordinate indices (0,1,8,9): psi=(u0,u1,0,...;v0,v1,0,...). Let z1=u0+i u1, z2=v0+i v1. The exact signed-permutation source gamma matrices imply:

- Q_k(psi)=psi^T Gamma_k psi; every component except Q0,Q7,Q8 vanishes.
- Q7=2 Re(z1 conjugate(z2)).
- Q0=−2 Im(z1 conjugate(z2)).
- Q8=|z1|²−|z2|².
- Q7−iQ0=2 z1 conjugate(z2), with Q0²+Q7²+Q8²=(|z1|²+|z2|²)².

On the normalized S3 of complex pairs this is the **first Hopf map S3→S2**, in an original-gamma output coordinate convention. A unit quaternion may parameterize the same S3, but this is NOT automatically the second Hopf map S7→S4, nor a dynamically forced quaternionic subfibration of the full octonionic S15→S8.

The source indefinite real quadratic form Q8 on the four-real carrier has **signature (2,2)**. Its null cone, intersected with the unit S3, is exactly S1×S1, the Clifford torus. In the full 16-real original-gamma carrier Q8 has signature (8,8), whose unit-null level is S7×S7. Neither quadratic form is a Lorentzian spacetime metric merely because it has positive, negative, and null sectors.

## 2. The exact R3 pullback turns the quadratic-null surface into a ring torus

The 3D dependence is explicitly **chosen for this mathematical experiment**, not derived from BFSS bosonic matrix coordinates or original physical Hamiltonian.

Use inverse stereographic coordinates over R3, r²=x²+y²+z²:

z1(x)=2(x+i y)/(1+r²),
z2(x)=(r²−1+2 i z)/(1+r²).

Algebra gives |z1|²+|z2|²=1, and the field approaches (0,1) as r→infinity, so it extends to the one-point compactified domain S3. With rho=sqrt(x²+y²),

Q8 = [8rho²−(1+r²)²]/(1+r²)².

Its zero condition is

(1+r²)²−8rho² =
[(rho−sqrt2)²+z²−1][(rho+sqrt2)²+z²−1] = 0.

For rho≥0 the **second bracket is strictly positive**, so the null set is exactly

**(rho−sqrt2)²+z²=1.**

This is a ring torus, major radius sqrt2 and minor radius 1 (dimensionless). The result connects an **internal quadratic null cone**, normalization on S3, and a **nonlinear spatial torus preimage**. The torus is NOT the null cone of a Lorentzian 3D metric: in spatial coordinates the zero equation is quartic before factorization.

This addresses the proposed visual "opposing cones / vortices / barbells" connection precisely. A source quadratic form distinguishes signs and a null boundary, but the realized spatial appearance depends on the chosen field map and admissible dynamics. An orbital d-z² node is a distinct real quadratic zero set; a Minkowski light cone is a causal structure. Similar signature algebra is not a new common physical force.

## 3. Linking and phase winding, independently verified

The same two-complex-component field has two distinct complex zero loci:

- z1=0: the z-axis, completed at the point infinity, is a closed circle in S3.
- z2=0: the equatorial unit circle (cos t,sin t,0).

For a numerical linking certificate that uses **two finite closed curves in ordinary R3**, select the following two distinct regular fibers of the source gamma Hopf map:

C1(t)=(cos t,sin t,0), corresponding to z2=0 and Hopf north pole;
C2(t)=(1+sqrt2 cos t,sin t,sin t), corresponding to z1=z2 and Hopf equatorial point.

The curves are disjoint. One crosses the disk bounded by the other exactly once with orientation. A separate Gauss linking integral using 80, 160 and 320 trapezoidal samples per circle returned **−1 to floating-point precision** at every resolution; the sign depends on chosen orientations and the invariant magnitude is one. The fixed formula for C2 is analytically verified by substituting z1=z2.

Around a loop linked to the z-axis, arg(z1) winds once. Around a small meridional loop linked to the z2 ring, arg(z2) also winds once. Both were independently checked from the complex phase ratios, not inferred from a drawing.

**Key distinction:** zero sets of chosen complex components, phase winding, a null-level torus, linked Hopf fibers and a physical circulating fluid/Poynting current are **different observables**. The first four are proven/checked here for one mathematics-only field. A physical vortex requires an independently sourced complex field, current, action, conservation law and real measurement. Mark Dennis and collaborators' optical hopfion work supplies a legitimate example of how to reconstruct a physical complex optical field and analyze its topology; it does NOT identify this chosen BFSS field with a proton or a photon. A separate optical-source reference: https://doi.org/10.1186/s43593-022-00030-2 .

## 4. Schwarzschild Proton: primary-source arithmetic, not a physical endorsement

**Primary paper:** N. Haramein, *The Schwarzschild Proton*, AIP Conference Proceedings **1303**, 95–100 (2010), DOI https://doi.org/10.1063/1.3527190 ; indexed at https://www.osti.gov/biblio/21506835 . The author's published hypothesis postulates a Schwarzschild-scale mass sourced by vacuum fluctuations, rotating hypothetical proton systems, and a semi-classical magnetic-moment analogy. These are **hypotheses, not measured physical identifications**.

For the ACTUAL observed proton mass m_p≈1.67262192595×10^(−27) kg (CODATA 2022), the usual Schwarzschild-radius calculation gives

r_s=2Gm_p/c²≈2.48423×10^(−54) m.

The 2022 CODATA proton RMS ELECTRIC-CHARGE radius is about 0.84075 fm; it is **not** a horizon or a hard proton edge. Nonetheless, if one **hypothetically** equates it to a Schwarzschild radius, the implied M≈5.66073×10^11 kg, about 3.38435×10^38 times the measured m_p. The 2010 paper instead chooses 1.32 fm and obtains a rounded M≈8.85×10^11 kg; applying current constants gives 8.8875×10^11 kg (5.31351×10^38 times observed proton mass). **The paper's order-of-magnitude calculation checks out, but the assumed physical identification does not follow from the arithmetic.**

The Schwarzschild geometry itself is static, spherically symmetric and non-rotating; its horizon has spherical spatial sections, not a toroidal vortex. Adding rotation, torques, vacuum coherence, or hidden stress-energy changes the physical theory and requires independent Einstein-matter field equations, energy accounting, and observable predictions. A graphical toroid or a fitted magnetic-moment scale cannot substitute for those. The discrepancy alone is **not** a proof that no imaginable alternative vacuum-energy theory could be built; it identifies the enormous physical burden of the proposed identification.

Empirically grounded proton controls include measured electromagnetic charge/magnetic form factors and QCD energy–momentum-tensor form factors (pressure, shear, mass, spin). For source context, see the 2018 pressure analysis https://www.nature.com/articles/s41586-018-0060-z and the 2021 QCD mass-radius analysis https://doi.org/10.1103/PhysRevD.104.054015 . A useful new model must produce prespecified gauge-invariant, frame-defined observable predictions in these channels and be checked against independent holdouts.

## 5. Relational, Vortex Based Mathematics, SCC and Fock boundaries

- Rodin's six-term doubling cycle modulo nine is genuine finite group arithmetic, but a toroidal drawing of residues does **not** by itself define a spatial field, linked fibers, an operator algebra or a physical current. Keep the visual heuristic; demand a source-defined invariant that survives arbitrary reindexings, number-base changes and independent competitor models before attributing new physical content.
- **SCC counterfactual 1:** hold original quadratic gamma Q8 and vary the *physical map* into the spinor carrier. The null-level torus can change its embedded shape; "is a ring torus" is not a spacetime law unless source dynamics fixes the map.
- **SCC counterfactual 2:** permit original spinor components outside the selected four-real subspace. RHOPF-P2 proved an explicit based escape in S15; the restricted S3 Hopf charge does **not** impose absolute protection in the unrestricted carrier. One must specify the exact symmetry/admissibility constraint and its observable consequences.
- **SCC counterfactual 3:** distinguish a vortex in a complex phase from a real circulation/current derived from Maxwell, superfluid, gauge or quantum dynamics. The phase winding can remain mathematical when the physical current vanishes or is undefined.
- **Fock boundary:** Original BFSS SU(2) has a 2^24-complex-dimensional fermionic space with 48 real Majorana/CAR generators and bosonic configuration R27. The selected 16-real gamma field over R3 is **not** that Fock carrier, nor its supercharges, SU(2) gauge-fixed states, or Hamiltonian. No original-source 3+1D Fock-coupled current, vortex or fermionic index has been constructed. RHOPF-P4's chiral index cancellation and physical symmetry-admissibility obligations remain open.

## 6. Reproducibility and classification

**Executed exact original-source restricted algebra and independent consumer:**

- research/topology/tools/rhopf_q0_null_vortex_core.py — tested Git blob **baae99acbc114f5e9d87a85846ef17ce1c44e85b**.
- research/topology/tools/rhopf_q0_null_vortex_independent_consumer.py — tested Git blob **14fd445e39776924ba3744263025430344f82f7f**.
- research/topology/data/RHOPF_Q0_NULL_TORUS_VORTEX_PROTON_CONSISTENCY_2026_11_18.json — frozen input/output summary, original gamma source pin and claims guardrails.

Local Python with NumPy/SymPy: source 9×16 matrix sign/permutation restriction PASS; unit normalization PASS; symbolic factorization PASS; Hopf fiber analytic substitution PASS; linking integral −1 at three resolutions PASS; both component phase windings +1 PASS; two independent Schwarzschild mass/radius checks PASS. All physics-specific qualifications remain FALSE. This is **not** a native Lean or GitHub CI acceptance and does not alter any original physics source.

**Research ledger outcome:**

- **MATHEMATICS: PASS** — one explicit source-gamma-linked normalized field has both a quadratic null torus and linked phase fibers, with an independently checked unit linking number.
- **GEOMETRIC ANALOGY: ADMISSIBLE** — useful comparison across toroidal drawings, wavefunction nodes, and Lorentzian signatures, but no shared physical dynamics implied.
- **ACTUAL PHYSICAL VORTEX: UNQUALIFIED** — no sourced fluid/optical/proton current, Fock Hamiltonian or conservation theorem.
- **SCHWARZSCHILD PROTON AS ORDINARY PROTON: NOT ESTABLISHED** — astronomical mass discrepancy with the observed proton; no independently matched quantum/gravitational observable carried over.
- **NEW PARTICLE THEORY: NOT ADMITTED** — source-selected sector, SU(2) gauge coupling, fermionic index, stable dynamics and model-discriminating predictions remain missing.
- **P4 and BFSS project:** original 27 accepted anchors unchanged; W0C2B2 blocked; no new CI; FCP main unchanged; frozen NFC retired recursive Hopf tower D-03 unchanged; SM-D1 remains prospective.

**Next bounded priority (after preserving this result):** RHOPF-P5 source-first *physical symmetry/admissibility* audit. Seek the original or independently justified physical field action, gauge/Fock current, boundary constraints and measurable observable that could turn the geometric torus/link into a physical vortex, or accept NO_PHYSICAL_SELECTION. Compare first with a complex Hopf/Faddeev–Skyrme model; only attribute predictive advantage to octonions if the weaker model demonstrably fails on an independently testable prediction.
