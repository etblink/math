# D1K0 — Original Fock gauge action, Berry-flat lift and direct massless expectation

**Date:** 2026-11-21. **Branch:** \`research/bfss-hopfion-gut-counterfactuals-20261121\`.
**Parent:** [D1J](./D1J_SOURCE_TO_HAMILTONIAN_BRIDGE_AUDIT_2026_11_21.md), verified head \`ba2fd0f506230a3e7043f70cc0830e7f5ffb3bd2\`.
**Disposition:** **SOURCE-READ + FINITE-DIMENSIONAL ANALYTIC ARGUMENT; NO NEW LEAN COMPILATION, CI, SOURCE-TYPED VECTOR PROOF, PHYSICAL FORM-DOMAIN OR SPECTRAL QUALIFICATION.**
No mutation of original Lean sources, pinned toolchain, main or live RHOPF branch.

## Decision

The remaining D1I obstacle is not the mathematical *existence* of a color Fock implementer or a local Berry-flat phase. The exact source contains the former, and the latter can be justified by an explicit finite-dimensional trace argument. Moreover, evaluating the original **massless** fermion field need not depend on D1F's three-RED direct massless quantization/subtraction bridge: the already-present source \`deformedFermionField_bracket\` suffices for an exact *mathematical* expectation contraction. What remains open is source-typed implementation of the particular rotor/state, a fully closed and gauge-physical \`SmoothCore 2\` trial, and the complete normalized quadratic-form estimate.

## 1. Exact source gauge action and 24-mode identification

These unmodified source files were inspected on the counterfactual branch:

- \`Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean\` blob \`152204ef15a6569534e0503824a697cb9ae8e4ce\`: \`spinPairEquiv\`, \`colorModeEquiv\`, and \`pairedTheta\` identify precisely eight paired spin indices and three colors with 24 original modes, transported to \`Fermion 2\`.
- \`.../SU2BFSSG3AAdjointColorRepresentationProbe.lean\` blob \`553869f1287c64893398c3b79c04fe010023bd08\`: \`adjointColorMatrix g B A = pairedAlgebraData.adjointCoefficient g A B\`; **rows are output colors**.
- \`.../SU2BFSSG3B24ModeOrthogonalLiftProbe.lean\` blob \`3cdf867357ea2955bf9d88ec6f5f6a0f9228e92a\`: \`oneParticleMatrix_block\` is exactly \`δ_jk R(g)_{BA}\`.
- \`.../SU2BFSSG3CComplexOneParticleUnitaryProbe.lean\` blob \`161861a9494836fcd2fad02a76e25cc6a81cf20b\`: complex scalar extension preserving the same 24 orbital indices.
- \`.../SU2BFSSG4AExteriorGaugeActionProbe.lean\` blob \`141fbe74fc4883f686e05dbc702efb12c6fb8fab\`: \`exteriorGauge g = ExteriorAlgebra.map (orbitalGauge g)\`, fixing the exterior vacuum and transforming each source creator by the exact color *column* coefficients.
- \`.../SU2BFSSG4EFermionHilbertUnitaryProbe.lean\` blob \`7247844122ab870d31e92903db4c2ab561f98112\`: \`fermionGaugeUnitaryHom\` is transported by \`fockAlgebraToBFSS\` to the exact \`Fermion 2\` Hilbert carrier.
- \`.../SU2BFSSG4JExactGaugeDataAssemblyProbe.lean\` blob \`e20c76fb22bc09d16dbcd8657333227cb34ed1ea\`: \`pairedGaugeData.fermion = fermionGaugeUnitaryHom\` **definitionally**.

Consequently, the D1I *color* action \(\bigoplus_{k=0}^{24}\wedge^k(I_8\otimes R(g))\) agrees with the source exterior action **at the level of the defining one-particle matrices**, and G4E/G4J already provide its exact carrier transport. This is a source-definition match, not a newly compiled theorem about D1I's particular \(\Omega\) vector. Verify the exterior-to-BFSS transport explicitly in any eventual independent Lean consumer.

The SU2 central element acts trivially under its 3-dimensional adjoint representation, hence also under the resulting exterior action; no projective sign is introduced by the source color map.

## 2. Exact seed, stabilizer and smooth descent in color

Let \(\mathcal V=\mathbb C^8\otimes\mathbb C^3\) with normalized occupied orbitals
\[
v_j=e_j\otimes(e_1+i s_j e_2)/\sqrt2,\qquad s_j\in\{+1,-1\},~~\sum_{j=0}^{7}s_j=0.
\]
The wedge \(v_0\wedge\cdots\wedge v_7\) is a normalized **eight-particle vector**, not merely its ray; G1A/G4A supply the exact original indexing and creator action. For \(h_\theta\in SO(2)\subset SO(3)\) fixing \(e_0\), each \(v_j\) has eigencharacter \(e^{\pm i s_j\theta}\), with the global sign depending only on the convention for the oriented \(e_1,e_2\) plane. Their product is \(\exp(\pm i\theta\sum_j s_j)=1\) for **every** angle.

Let \(S(u)=(I+\Gamma(u)\Gamma_8)/\sqrt{2(1+u_8)}\), \(u_8>-1\), and \(T_u=I_{16}\otimes P_0+S(u)\otimes P_\perp\) on real Majorana labels. This lies in \(SO(48)\), is smoothly based at the identity, and is given on the contractible hemisphere. A based Spin(48) lift \(\widehat T_u\) exists abstractly on the irreducible original CAR module. At the *matrix* level \(T_u\) commutes with all color stabilizer rotations because \(S(u)\) acts identically on **both** transverse color directions. The chosen connected lifts commute (their possible central commutator is discrete and equals 1 at the identity). Thus
\[
\Omega(u,n)=U(R)\widehat T_u\Omega_*,\qquad R e_0=n,
\]
is independent of the choice \(R\mapsto Rh\), \(h\in SO(2)\). It descends to a globally smooth **color-\(S^2\) vector** for every \(u\) on the spatial hemisphere; no global smooth section \(S^2\to SO(3)\) is needed. **This smooth Spin48 vector lift has not yet been built as a typed Lean map into the original source carrier.**

## 3. Exact Berry one-form is zero for the canonical lift

At an arbitrary \((u,n)\), the real Majorana covariance is
\[
C(u,n)=-\Gamma(u)\otimes J(n)-J_{\rm pair}\otimes P_n,\quad P_n=nn^{\mathsf T},
\]
where \(J(n)\) is skew, \(J(n)n=0\), \(J_{\rm pair}\) is skew and \(\mathrm{tr}\,\Gamma(u)=0\) by the nine-dimensional Clifford relations. For a skew Majorana generator \(K\), the vacuum expectation of its quadratic CAR lift, and thus its infinitesimal Berry phase, is proportional to \(\mathrm{tr}(KC)\), with the proportionality determined by the source CAR normalization. Since we prove this trace vanishes, the convention-dependent scalar factor is immaterial.

For a color tangent generated by \(B\in\mathfrak{so}(3)\), \(K_c=I_{16}\otimes B\), so
\[
\mathrm{tr}(K_c C)
=-\mathrm{tr}(\Gamma(u))\,\mathrm{tr}(BJ(n))
-\mathrm{tr}(J_{\rm pair})\,\mathrm{tr}(B P_n)=0.
\]
For a spatial-rotor tangent, the relevant transported infinitesimal generator has the form \(K_u=A\otimes P_\perp\), \(A\in\mathfrak{so}(16)\), \(P_\perp=I-P_n\); hence
\[
\mathrm{tr}(K_u C)
=-\mathrm{tr}(A\Gamma(u))\,\mathrm{tr}(P_\perp J(n))
-\mathrm{tr}(A J_{\rm pair})\,\mathrm{tr}(P_\perp P_n)=0
\]
because \(\mathrm{tr}(P_\perp J(n))=\mathrm{tr}J(n)=0\) and \(P_\perp P_n=0\).

The color exterior action is number conserving with \(I_8\otimes R\) of complex determinant one; its Lie generator has zero trace and adds no independent scalar \(U(1)\) term. The based spatial Spin lift likewise has no arbitrary point-dependent scalar in its infinitesimal bivector generator. **Therefore the canonical chosen vector lift has \(i\langle\Omega,d\Omega\rangle=0\)**. A nonconstant *rephasing* of \(\Omega\) changes this connection; the claim is existence of a preferred Berry-flat phase, not that every representative has zero connection.

The nonzero Fubini–Study metric remains \(\mathrm{diag}(2I_8,4I_2)\) on spatial/color tangents, giving 12/r² at \(Y=0\); zero Berry connection is **not** zero fermionic derivative energy.

**Independent exact arithmetic:** on the \(\Gamma_8=\mathrm{diag}(I_8,-I_8)\) reference and paired \(J_{\rm pair}\), symbolic 48×48 Kronecker traces of color generators and a skew spatial generator all vanish exactly. An independent single-particle calculation with occupied orbitals \(v_j\) gives total \(\sum_j v_j^\dagger B v_j=0\) for all three standard \(\mathfrak{so}(3)\) basis generators; individual \(e_1,e_2\) charges remain nonzero, canceling only after summing four signs of each kind. These are checks of the finite-dimensional algebra, not source-Lean compiled consumers.

## 4. Exact massless **source-bracket** Fock expectation, without D1F

The original \`FermionQuantization.lean\` blob \`c6b72d030225c707ef54f5285a18a7a8175ee280\` provides the **already-compiled source** \`deformedFermionField_bracket\` (lines 195–198) and \`cubicFermionComponent\` (lines 111–116). With the pinned normalized \(f_{ABC}=\sqrt2\,\varepsilon_{ABC}\), the source field at \(h=1,m=0\) is
\[
F_{\rm massless}(X)=(-i/2)\sum_{i,A,B,C,\beta,\delta}
f_{ABC} X_{iC}(\Gamma_i)_{\beta\delta}\,\theta_{\delta B}\theta_{\beta A}
\]
(restricted to the underlying real Hilbert space). For distinct CAR labels, the D1H/D1I convention \(C_{rs}=2i\langle\theta_r\theta_s\rangle\) yields
\[
\langle F_{\rm massless}(X)\rangle_\Omega
=-\tfrac14\sum_{i,A,B,C,\beta,\delta}
f_{ABC}X_{iC}(\Gamma_i)_{\beta\delta}
 C_{(\delta,B),(\beta,A)}.
\]
Diagonal-label terms vanish here by antisymmetry of \(f\). Substitute \(X=r\,u n^{\mathsf T}+Y\), \(u^{\mathsf T}Y=0\), \(Yn=0\), and the above \(C(u,n)\). The term from \(J_{\rm pair}\otimes P_n\) vanishes because symmetric \(\Gamma_i\) contracts to zero with skew \(J_{\rm pair}\). The remaining spin contraction is \(\sum_i X_{iC}\mathrm{tr}(\Gamma_i\Gamma(u))=16(rn_C+(u^{\mathsf T}Y)_C)=16r n_C\). The color contraction is \(\sum_{A,B,C}\varepsilon_{ABC}n_C J(n)_{BA}=-2\), giving
\[
\boxed{\langle\Omega(u,n), F_{\rm massless}(r u n^{\mathsf T}+Y)\,\Omega(u,n)\rangle_{\mathbb R}=-8\sqrt2\,r}.
\]

This is an **exact finite-dimensional contraction based on the literal compiled source bracket and original CAR**. An independent SymPy calculation using the reference source \(\Gamma_8\), 48×48 covariance and three-color epsilon tensor evaluates it to exactly \(-8\sqrt2\) at \(r=1\), without numerical tolerances. It independently reproduces D1H's earlier expectation. It **bypasses D1F for this expectation calculation only**; it does not produce the unqualified D1F operator identity, requalify three RED runs, or create a new Lean theorem.

## 5. Outstanding physical boundary and next bounded gate

- **Source typed**: identify the based \(\mathrm{Spin}(48)\) spatial lift on the precise \`Fermion 2\` carrier, prove its Majorana covariance and equality of the D1I color action with \`pairedGaugeData.fermion\` applied to the specific seed; retain exact choice of sign/phase.
- **Compact smooth physical trial**: prove the cutoff/extension across the SVD chart is in original \`SmoothCore 2\`; use truly flat-endpoint \(C^\infty\) \(\chi,\beta,\eta\), not a finite-degree smoothstep. Prove source \(SU(2)\) equivariance and normalized nonzero norm.
- **Full form**: apply accepted massless-core identity to the explicit trial. Bound *all* radial, angular, tube-boundary, Jacobian, Berry, fermion and boson terms and prove a genuine \(q[\Psi_R]\to0\) estimate. The previously quoted \(K=26.06000549538\) remains a **model prescreen**, not a physical form quotient.
- **Spectral implication only afterward**: disjoint radial support would provide orthogonality; if the exact form tends to zero, apply the nonnegative closed form's spectral projection/min-max principle to infer \(0\in\sigma_{\rm ess}(H)\). No direct operator-domain Weyl sequence is necessary for that route, but none has been established.

**Stop rule:** no D1F R4, broad Lean CI, original-source edits, main/RHOPF changes or claims of a BFSS spectrum theorem. The next typed proof target should be the narrow source gauge/stabilizer vector identification and then the direct bracket expectation, rather than an all-at-once Hamiltonian proof. Preserve earlier counterfactuals and strict RED evidence.
