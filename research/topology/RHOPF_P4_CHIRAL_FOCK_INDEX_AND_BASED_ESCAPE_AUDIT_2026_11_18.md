# RHOPF-P4 — Chiral symmetry, original BFSS gamma-index cancellation, and a fixed-boundary Fock escape

**November 18, 2026. Project Lead research audit.**  
**Parent:** RHOPF-P3 commit \`e82e983e0f60fe3ec5f82b3b310e77b6415f93d4\`.  
**Branch:** \`integration/bfss-unified-research-20261108\`.  
**Outcome:** \`SOURCE_GAMMA_AIII_WINDING_ZERO; INDEPENDENT_MINIMAL_AIII_POSITIVE_CONTROL; BASED_GAPPED_CLASS_A_ESCAPE; ORIGINAL_BFSS_PHYSICAL_INDEX_UNQUALIFIED\`.

**Mandate:** Seek truth, not validation of BFSS, the Standard Model, NFC, or a new topological-particle proposal. Admit new mechanisms only through a source-defined physical action and an independently distinguishable observation. Positive and negative knowledge have equal archival value.

## 1. Why this gate, and what it must not prove

RHOPF-P0–P1 identified the **actual** nine real \`16×16\` BFSS Spin(9) gamma matrices as a concrete octonionic Hopf presentation. P2 exhibited a bounded energy penalty and a gapped **toy** Fock coupling during unwinding; P3 established genuine original 48-Majorana Fock and SU(2) gauge interfaces but no physical three-dimensional index.

A reasonable counterfactual is: *could a chiral symmetry supply the missing protection?* Stable class AIII in dimension three supports a \`Z\` winding of the flattened off-diagonal unitary \`q:S³→U(n)\` when the **physical** gap and chiral symmetry are preserved. This is a real mathematical alternative to unprotected class A, but it is **not** a theorem that the original BFSS Hamiltonian has that symmetry.

Primary literature: Schnyder–Ryu–Furusaki–Ludwig, *Classification of topological insulators and superconductors* (2008/2009), https://arxiv.org/abs/0905.2029 and https://arxiv.org/abs/0803.2786 . A source explaining the fragility of class-A multiband Hopf topology is https://www.nature.com/articles/s41598-021-01888-x .

**Important distinction:** Here \`S³\` is an explicitly compactified **parameter** space. It could be a momentum-space band parameter in a separately declared physical model. We have **not** built a three-dimensional spatial Dirac/Yukawa operator on \`L²(R³,spinors)\`, a Fredholm/Callias index, a localized soliton bound state, a fermionic anomaly or a new particle.

## 2. Source-exact gamma experiment: the unexpected cancellation

The original BFSS gamma source is:
\`lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean\`,
**Git blob \`b9b8192055c70f0d001d7982669b9823c55562ed\`**.
The existing source-permutation fixture was checked against that original byte-pinned file in prior RHOPF gates. No gamma entry, Lean declaration or original BFSS field is changed in this audit.

For a four-component unit parameter \`y∈S³\`, consider **a newly defined comparison family using source matrices**

\`\`\`text
H16(y)=y0 Γ0+y1 Γ1+y2 Γ2+y3 Γ3
C16=Γ4
{C16,H16(y)}=0;  H16(y)^2=I16.
\`\`\`

This family has an exact gap and a mathematically exact chiral involution. For a normalized four-generator Dirac family, the three-dimensional chiral winding density has an overall Clifford trace factor proportional to

\`\`\`text
tr(C16 Γ0 Γ1 Γ2 Γ3).
\`\`\`

Set \`Ω=Γ4Γ0Γ1Γ2Γ3\`. Direct exact-integer matrix multiplication gives \`Ω²=I16\`, but

\`\`\`text
tr Ω = 0,   spec Ω = {+1 (×8), −1 (×8)}.
\`\`\`

**Algebraic explanation:** Γ5, one of the four remaining original nine matrices, anticommutes with every factor in the **odd** product Ω, hence Γ5 Ω Γ5=−Ω. Taking traces gives \`tr Ω=−tr Ω\`, thus it must vanish. The signed-permutation source consumer verified this identity with exact integer entries.

**Stronger source result:** the same argument holds for **every choice of five distinct gamma matrices out of the nine**. The consumer checked all \`C(9,5)=126\` five-gamma Clifford-volume products; every one squares to the identity and has zero trace, with a remaining gamma providing the sign-conjugation witness. Consequently the analogous **full 16-component complex class-AIII Dirac-family trace coefficient** vanishes in all these source five-gamma choices, not just one convenient orientation.

**Verdict:** The most immediate source-gamma chiral family has **net AIII winding zero** despite a gap and chiral symmetry. Do not infer a nonzero 3D index from octonionic Spin(9), original 16-component Clifford structure, or the mere existence of a fermionic Fock space.

This is an AIII result for the specified \`16×16\` family, **not** a theorem that every interacting/source BFSS fermionic index, real symmetry class, spatial defect, or model built from these matrices must vanish.

## 3. Independent positive control: chiral symmetry can protect something, but not automatically here

Construct the **NEW** minimal four-complex-orbital family

\`\`\`text
q(y)=y0 I2+i(y1 σx+y2 σy+y3 σz) ∈ SU(2)
H4(y)=[0 q(y); q(y)† 0]
C4=diag(I2,−I2).
\`\`\`

Here \`{C4,H4}=0\` and \`H4²=I\`. In a fixed orientation, the compactified stereographic map

\`\`\`text
y(x)=[(r²−1),2x1,2x2,2x3]/(1+r²),  r²=|x|²
\`\`\`

has degree **−1**, from the exact Jacobian density \`−8/(1+r²)³\` and the normalized volume \`vol(S³)=2π²\`:

\`\`\`text
degree = (1/(2π²))∫R³ −8/(1+r²)³ d³x = −1.
\`\`\`

The independent numerical consumer checked this Jacobian at several points and radial Simpson integration at two resolutions, recovering \`−1.0\`. The minimal Clifford volume has **trace +4**, not zero; the AIII winding has absolute value **1**, with sign convention depending on grading and orientation.

Adding 20 **trivial chiral one-particle orbitals** gives an abstract \`24×24\` family with the **same nonzero AIII winding**. This demonstrates why stable 3D class AIII is a meaningful positive mathematical competitor. It is **not** an original BFSS derivation or evidence of a fundamental particle.

For the **original gamma 16 block**, adding 8 trivial chiral orbitals also yields 24 complex one-particle orbitals, but its AIII winding remains **zero**. The two comparison families have the same numbers of one-particle modes and the same flat excitation spectra; their difference is a **symmetry-qualified topological invariant**, not their Fock-space dimension.

## 4. The essential boundary-condition repair: a BASED, gapped escape

A naive interpolation \`H_t(y)=cos(t)H0(y)+sin(t)C\`, with \`{H0,C}=0\` and \`H0²=C²=I\`, never closes the gap. **But it changes the Hamiltonian at the parameter-space boundary \`y∞\`, so it is only a FREE homotopy.** We explicitly rejected the premature inference that this alone proves a fixed-boundary escape.

There is a source-exact, more demanding repair. Let \`E=H0(y∞)\`, \`y∞=(1,0,0,0)\`, so \`{E,C}=0\`. Define

\`\`\`text
K=C E,    K†=−K,   K²=−I,
U_t=cos(t/2) I−sin(t/2) K,
H'_t(y)=U_t[cos(t)H0(y)+sin(t)C]U_t†,   0≤t≤π/2.
\`\`\`

**Exact consequences**, not guesses from the plots:

- \`H'_0(y)=H0(y)\`.
- \`[H'_t(y)]²=I\`, so the gap is **1** at every \`y,t\`.
- \`H'_t(y∞)=E\` for every \`t\`: the specified parameter-space boundary is **FIXED**.
- \`H'_(π/2)(y)=E\` for every \`y\`: the endpoint is the **constant vacuum**.
- For interior points and \`0<t<π/2\`, the original chiral condition \`{C,H'_t}=0\` is broken. Thus the path is allowed in **unrestricted class A** but **not** in the assumed protected chiral class AIII.

The independent consumer checked 40 free-path and **40 separate fixed-boundary** matrix configurations covering the two distinct 24-mode families, multiple parameter points, and several deformation stages. It verified the fixed boundary, endpoint, gap, fermion parity and actual interior chiral-symmetry violation. The explicit formula is continuous for all parameter-space points, giving a constructive nullhomotopy **without moving the boundary**.

This does **not** contradict the nonzero positive-control AIII winding: the symmetry needed to protect that winding is explicitly broken. A genuinely source-enforced symmetry could rule this path inadmissible. Whether BFSS or a new theory enforces such a symmetry is an entirely separate physical problem.

## 5. Fock space: necessary carrier, insufficient physical identification

The original source \`OAI.BFSSQuantum.Fermion 2\` is a complex Hilbert carrier of dimension \`2²⁴\`, with **48** self-adjoint original Majorana operators across 16 spinor × 3 SU(2) color labels. The original SU(2) Fock-vector gauge action, fixed-space projector and nonzero gauge-invariant vacuum **exist** in the imported source (OP2a, OP2b and OP2c). By contrast, the original Spin(9) action presently sourced for the Fock **operator algebra** and Hilbert–Schmidt operator columns does not automatically provide a globally gauge-compatible Fock-vector group lift or a physical spatial Dirac index.

We constructed **NEW number-conserving comparison second quantizations** \`dΓ(H24)\` on an abstract \`Λ• C24\`, not on a source-identified original 48-CAR BFSS Hamiltonian. Both families have exactly 12 occupied negative one-particle modes, 12 positive modes, a unique filled-negative-orbital ground state of energy **−12**, **even fermion parity**, and excitation gap **1** along the explicit fixed-boundary escape.

The source exact 16 gamma matrices are used **only in one of the two illustrative one-particle blocks**. There is NO source-certified identification of this one-particle block with the actual original 48-Majorana operators, their SU(2) gauge constraints, supercharges, domains, anomaly structure or Hamiltonian. A coincident dimension of Fock spaces does not discharge those obligations.

In addition, fixing \`C=Γ4\` as a physical grading selects a direction among the original nine gamma coordinates. The full Spin(9) source symmetry does **not automatically forbid** a perturbation involving this grading; protection would have to follow from actual physical symmetries or constraints, not the choice of index-friendly basis.

## 6. Evidence and qualification

The source and independent consumer have been executed locally with Python 3.13 and NumPy; their exact local Git blobs are:

- \`research/topology/tools/rhopf_p4_source_chiral_core.py\` — \`a083e7a8ad0de437ee430d1d9b4247b3d1468b6a\`
- \`research/topology/tools/rhopf_p4_independent_aIII_consumer.py\` — \`428f8c121d1323b2b4f334968c44498d05d6edeb\`

Both hashes match the staged GitHub blob contents. Checked: source gamma Clifford relations, all 126 five-gamma trace cancellations, minimal 4×4 positive control, degree/Jacobian integration, 24-mode spectral/parity properties, 40 free and 40 fixed-boundary deformation fixtures.

**No new native Lean CI, original BFSS Hamiltonian spectral qualification, full 2²⁴-dimensional Fock matrix, physical spatial Dirac/Fredholm operator, fermionic localized zero mode, experimental comparison, mass or elementary-particle claim.** The 27 accepted BFSS anchors, blocked W0C2B2, FCP main, frozen NFC retired forced-tower D-03 and physical SM-D1 ceiling remain unchanged.

## 7. Project Lead decision: do not keep inventing symmetries to make the topology work

**RHOPF-P4 = completed bounded mathematics, adverse original-source gamma-index result.** The original octonionic Hopf geometry remains true. The simplest original-source gamma chiral Dirac family has zero **net complex 3D AIII winding**, while a smaller independent chiral model can have \`|w|=1\`. Allowing an extra permitted term destroys the latter protection while the Fock gap and fermion parity stay intact—**even at fixed boundary**.

Therefore **do not** promote chiral AIII to a source-derived BFSS physical conservation law. The next warranted test is an **original-source physical symmetry admissibility audit**, not another decorative Hopf algebra or a larger toy simulation:

1. Specify a physical field, a genuine original or independently motivated \`3+1\`D fermionic action, a gauge/charge grading and a closed domain. Do its allowed perturbations actually forbid the symmetry-breaking generator?
2. Only if the answer is source-supported, compute a chiral winding/Callias/Dirac index or localized zero-mode count, including the **actual original Fock gauge constraint** and the full 48-Majorana normalization.
3. Demand an observable prediction unavailable from a simpler quaternionic/Faddeev–Skyrme field theory, and independently challenge it with an explicit weaker model.
4. Otherwise preserve \`NO_SOURCE_DERIVED_3D_PROTECTION\` and continue truth-seeking across alternative field mechanisms rather than retrofitting another symmetry.

**Scientific conclusion:** having octonions, \`Spin(9)\`, Fock space, or chiral symmetry individually is not the needed physical explanation. The missing object is a **dynamically enforced, source-compatible index with a distinct observable**.
