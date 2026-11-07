# BFSS — whole-sector oscillator exclusion

**PROVED CONDITIONALLY.**

The strict bound \(\lambda_2>m+12\) excludes all oscillator levels \(0,\ldots,m\) on the entire isotypic smooth core. The proof below derives the fiber bound and branching implication and treats slice evaluation explicitly. It does not prove that all source-identification hypotheses are qualified at the fixed repository baseline.

**Date:** 7 November 2026. **Repository baseline:** etblink/math at 5fbe86b73784efa429d01c5b338990540896b1de. **Primary input:** BFSS_Frontier_Adversarial_Decision_2026-11-07.md, section 6. No repository edits, donor recovery, Lean implementation or CI work were performed. This is an analytical proof, not a new kernel-qualified or spectral result.

## 1. Exact hypotheses and theorem

Let \(E=\mathbb R^9\), with its Euclidean metric, and write \(X=(x^1,x^2,x^3)\in E^3\).

**H1 — group and source binding.** Work with the standard compact group \(G=\operatorname{Spin}(9)\), its vector representation \(R:G\to SO(E)\), and its real 16-dimensional spinor representation \(S\). The label space is
\[
V=\mathbb R^{16}\otimes\mathbb R^3,\qquad R_{48}=S\otimes I_3.
\]
To apply the theorem to the literal source group, assume a specified topological group identification intertwining its actual nine-vector and original paired-label actions with these representations, including the negative center. This is an explicit sufficient transfer premise, not a consequence asserted from C0 compactness. Equivalent direct source proofs of the same group/stabilizer/representation facts can replace that identification.

Fix the torus rotating planes (1,2), (3,4), (5,6), (7,8), oriented so \(e_{2j-1}+i e_{2j}\) has weight \(+\varepsilon_j\). Its spinor infinitesimal action is \(\gamma_{2j-1}\gamma_{2j}/2\), for real symmetric Clifford gamma matrices. This is spatial-angle normalization: a \(2\pi\) turn is the negative central element, not identity in \(G\).

**H2 — original CAR carrier.** \(F\) is the original complex Hilbert space of dimension \(2^{24}\). On its actual paired 48 real labels, the self-adjoint operators satisfy
\[
\{\theta_p,\theta_q\}=\delta_{pq}I,\qquad
\Gamma_p=\sqrt2\,\theta_p,\quad
\{\Gamma_p,\Gamma_q\}=2\delta_{pq}I.
\]
There is no replacement Fock module or assumed global Fock-vector Spin(9) lift.

Section 2 constructs from H1–H2 the unique continuous action \(\alpha:G\to\operatorname{Aut}_{\mathbb C,*}A\), \(A=\operatorname{End}_{\mathbb C}F\), satisfying \(\alpha_g(\Gamma(v))=\Gamma(R_{48}(g)v)\). Equip \(A\) with its unnormalized Hilbert–Schmidt inner product and set
\[
\mathcal H=L^2(E^3,A),\qquad
(U_gf)(X)=\alpha_g\!\left(f(R_g^{-1}x^1,R_g^{-1}x^2,R_g^{-1}x^3)\right).
\]
Let \(\mathcal H_\lambda\) be its full Hilbert isotypic component, equivalently the image of
\[
d_\lambda\int_G\overline{\chi_\lambda(g)}\,U_g\,dg.
\]
B4 dominant weights use orthogonal coordinates
\(\lambda_1\ge\lambda_2\ge\lambda_3\ge\lambda_4\ge0\); all four coordinates are integral or all half-integral. D4 dominant coordinates are
\(\nu_1\ge\nu_2\ge\nu_3\ge|\nu_4|\).

For \(u\ne0\), put \(r=\|u\|\), \(a=u/r\), and
\[
x^2=t_2a+z_2,\quad x^3=t_3a+z_3,\qquad z_i\in a^\perp .
\]
The stabilizer is the actual preimage
\[
K_a=\{g:R_ga=a\}\simeq\operatorname{Spin}(8),
\]
not SO(8) acting on an assumed descended fiber. Define on \(L^2((a^\perp)^2)\)
\[
H_{\beta,u}=-\beta\Delta_z+r^2\|z\|^2,\qquad \beta>0.
\]
Its Friedrichs/self-adjoint harmonic-oscillator realization has level-\(n\) eigenvalue
\(2\sqrt\beta\,r(n+8)\). Write \(\Pi_{\le m}^{u,\beta}\) for the sum of its first \(m+1\) level projectors, tensored with \(I_A\) when acting on operator-valued functions.

**Theorem.** If \(m\in\mathbb N_0\), \(\lambda_2>m+12\), and
\(f\in C_c^\infty(E^3,A)\cap\mathcal H_\lambda\), then
\[
(\Pi_{\le m}^{u,\beta}\otimes I_A)
 \big[z\mapsto f(u,t_2a+z_2,t_3a+z_3)\big]=0
\]
for every \(u\ne0\) and every \((t_2,t_3)\in\mathbb R^2\). In particular the statement holds almost everywhere in the disintegrated Euclidean measure. No gauge, Hamiltonian, coercivity or closed-domain hypothesis is used.

## 2. Honest operator action; fiber bound including the input index

### 2.1. Complete complex generation and the action

For an ordered subset \(I\subseteq\{1,\ldots,48\}\), write \(\Gamma_I\) for the ordered Majorana product. Every nonempty product has trace zero: if \(|I|\) is even, conjugate by a generator inside \(I\); if odd, use a generator outside \(I\), which exists because 48 is even. In both cases conjugation negates the product. Consequently
\[
\operatorname{Tr}(\Gamma_I^\dagger\Gamma_J)=2^{24}\delta_{IJ}.
\]
These \(2^{48}\) elements form a complex basis of \(A\), whose complex dimension is \(2^{48}\).

A real orthogonal transformation of the labels gives another self-adjoint CAR family and hence a unique algebra automorphism on this algebra; its inverse is supplied by the inverse orthogonal transformation. One can obtain it through the complex Clifford universal property, whose representation here is an isomorphism by this basis argument. Uniqueness on generators proves the group law. Coefficients in a finite Majorana basis are polynomial functions of the label matrix, proving continuity.

It preserves adjoints on generators and therefore on the whole algebra. An automorphism of the full complex matrix algebra preserves trace: conjugating the left-multiplication map on \(A\) by the automorphism preserves its trace, and \(\operatorname{Tr}_A L_T=(\dim F)\operatorname{Tr}_F T\). Thus \(\alpha\) is Hilbert–Schmidt unitary. No use is made of Mathlib Clifford star or a global vector implementer.

### 2.2. Independent derivation of \(M=12\)

On the real 16-label spinor carrier, a first-plane generator is \(B=\gamma_1\gamma_2/2\). It is skew and \(B^2=-I/4\). Hence the three-copy real 48-label carrier has 24 real rotation planes, each of frequency \(1/2\).

For a real skew label generator \(B_{48}\), set
\[
L=\frac12\sum_{p,q}(B_{48})_{pq}\theta_p\theta_q.
\]
CAR gives \([L,\theta(v)]=\theta(B_{48}v)\). Therefore conjugation by \(e^{tL}\) is the required operator action along this one-parameter subgroup, by uniqueness on generators. This is a local implementation calculation, not a global Fock-vector group lift.

In block coordinates \(L=\tfrac12\sum_{j=1}^{24}\theta_{2j-1}\theta_{2j}\). The Hermitian generator \(-iL\) is a sum of 24 commuting terms with eigenvalues \(\pm1/4\). Every sign choice occurs: the standard 24-mode CAR occupation projectors have rank one, as follows either from their trace expansion or from the original Fock realization. Thus its spectrum runs from \(-6\) to 6.

On \(A\cong F\otimes F^*\), the generator is the commutator. For matrix units between generator eigenvectors its weights are
\[
h_{\rm output}-h_{\rm input}\in[-12,12].
\]
The minus sign is exactly the contragredient input representation. The endpoints occur. Using \(M=6\) for this carrier would discard the input index.

There is also a vector-lift-free check. Clifford antisymmetrization is an equivariant **linear** identification \(A\simeq\Lambda^\bullet(V_{\mathbb C})\). First-torus label weights are 24 copies of \(+1/2\) and 24 of \(-1/2\); an exterior monomial has maximum weight 12. The usual spinor weights are all \((\pm1/2,\pm1/2,\pm1/2,\pm1/2)\), each once per color. This can be checked directly: the four commuting half-gamma generators have rank-one joint projectors, since every nonidentity even gamma word of grades 2, 4, 6 or 8 has trace zero.

The weight-12 face in \(A\) is one-dimensional, has full weight \((12,0,0,0)\), and is highest: raising by a root with positive first coordinate exceeds 12; raising by a positive root with zero first coordinate would require another weight on that face. Hence \(A\) contains a copy of the B4 type \((12,0,0,0)\), a fact used in the counterexample test below.

### 2.3. Actual center

H1 identifies the source negative center \(z=-1\) with the \(2\pi\) spatial turn, for which \(R_{48}(z)=-I\). If \(P\) is original Fock parity, both \(\alpha_z\) and \(\operatorname{Ad}_P\) negate every Majorana. Generation gives
\[
\alpha_z=\operatorname{Ad}_P.
\]
It is not a scalar action on \(A\). Odd operators carry the nontrivial center, even operators the trivial center. Half-integral and integral branching sectors are therefore retained rather than silently identifying the full action with an SO(9) representation.

## 3. Independent B4-to-D4 branching derivation

Use the common torus and positive roots \(\varepsilon_i\pm\varepsilon_j\) (\(i<j\)), with \(\varepsilon_i\) also positive in B4. Let
\[
\rho_B=(7/2,5/2,3/2,1/2),\quad \rho_D=(3,2,1,0),\quad
L_j=\lambda_j+4-j.
\]
The Weyl denominators satisfy
\(\Delta_B=\Delta_D\prod_i(z_i^{1/2}-z_i^{-1/2})\).
Dividing rows in the B4 determinant formula gives the Laurent-polynomial identity
\[
\Delta_D\chi^B_\lambda
 =\det_{i,j}\left(\sum_{k=-L_j}^{L_j}z_i^k\right),
\]
where each inner sum has step one and the integral or half-integral lattice of \(\lambda\).

For a D4 dominant \(\nu\), put \(t=\nu+\rho_D\). Its absolute coordinates strictly decrease:
\(t_1>t_2>t_3>|t_4|\).
The coefficient of \(z^t\) on the left is the branching multiplicity: multiplying each D4 character by its denominator gives its Weyl alternant, and distinct dominant shifted weights have disjoint Weyl orbits.

On the right this coefficient is
\[
\det_{i,j}\mathbf1_{\{|t_i|\le L_j\}},
\]
and is zero when the lattices differ. The \(L_j\) strictly decrease. Each row is a prefix of ones, and row prefix lengths are nondecreasing. The determinant is nonzero exactly when those lengths are \(1,2,3,4\); it then equals one. Thus
\[
L_1\ge t_1>L_2,\quad L_2\ge t_2>L_3,\quad
L_3\ge t_3>L_4,\quad L_4\ge|t_4|.
\]
Converting strict inequalities on the same lattice yields precisely
\[
\lambda_1\ge\nu_1\ge\lambda_2\ge\nu_2\ge
\lambda_3\ge\nu_3\ge\lambda_4\ge|\nu_4|.
\]
In particular every restricted type has \(\nu_1\ge\lambda_2\). The argument covers half-integral coordinates and both signs of \(\nu_4\). It agrees with the classical rule stated in Rajan–Shrivastava, Theorem 2, but does not use the earlier bounded branching diagnostic as a proof.

## 4. Oscillator types and the whole-sector proof

At \(a=e_9\), the transverse real coordinates are two copies of the K-vector representation \(\mathbb R^8\). The level-\(n\) eigenspace is K-equivariantly
\[
\mathcal E_n\simeq\operatorname{Sym}^n((\mathbb C^8)^{\oplus2}),
\]
via oscillator creation operators; changing \(r\) or \(\beta>0\) only dilates the oscillator. Vector weights have first coordinate in \(\{-1,0,1\}\). Therefore every torus weight of \(\mathcal E_n\otimes A\) has first coordinate at most \(n+12\), and every irreducible K constituent has highest coordinate \(\nu_1\le n+12\). The low sum \(n\le m\) has only \(\nu_1\le m+12\). Conjugating K to \(K_a\) preserves this conclusion.

Now fix an arbitrary \(f\) in the theorem. Its cyclic orbit span
\[
W_f=\operatorname{span}\{U_gf:g\in G\}
\]
is finite dimensional even if the isotypic multiplicity is infinite. Indeed write \(\mathcal H_\lambda\simeq V_\lambda\otimes\mathcal M_\lambda\); if \(f=\sum_{i=1}^{d_\lambda}e_i\otimes m_i\), its orbit lies in \(V_\lambda\otimes\operatorname{span}\{m_i\}\), of dimension at most \(d_\lambda^2\).

Every orbit function is smooth with compact support, and equality of smooth functions in L2 is equality everywhere. Thus \(W_f\) is a genuine finite-dimensional representation of smooth representatives, not a space on which arbitrary L2 point evaluation has been invented.

For fixed \(u\ne0\) and \(t_2,t_3\), restriction is a well-defined K_a-equivariant linear map
\[
\operatorname{res}_{u,t}:W_f\longrightarrow
 C_c^\infty((a^\perp)^2,A).
\]
The stabilizer fixes \(u\) and the longitudinal scalars and acts simultaneously on the two transverse vectors and on \(A\). The oscillator projector commutes with that action. Hence
\[
(\Pi_{\le m}^{u,\beta}\otimes I_A)\operatorname{res}_{u,t}
 :W_f\longrightarrow\bigoplus_{n=0}^{m}\mathcal E_n^{u,\beta}\otimes A
\]
is an intertwiner between finite-dimensional K_a representations.

By section 3 the domain has only types with \(\nu_1\ge\lambda_2\); by the oscillator/fiber bound the codomain has only \(\nu_1\le m+12\). When \(\lambda_2>m+12\) the two type sets are disjoint. Complete reducibility forces the intertwiner to be zero. This proves the assertion for arbitrary \(f\), not just a polynomial highest vector.

## 5. Parameter dependence and the almost-everywhere statement

One does not need a global frame for \(a^\perp\). On local sphere patches choose smooth orthonormal frames, giving local trivializations \((a^\perp)^2\simeq\mathbb R^{16}\). The oscillator's finitely many low Hermite functions depend smoothly on \(r>0\) by dilation. Integrating against a smooth compactly supported slice gives continuous, indeed locally smooth, coefficients in \((u,t)\); on compact parameter sets away from \(u=0\), the integrations have uniform compact support and dominated differentiation is valid.

Transitions between frames are orthogonal and preserve the radial oscillator and its projectors, so the definitions agree on overlaps. This gives a measurable field of low-level projectors. For each fixed \(u\), the decomposition \(x^i=t_i a+z_i\) is an orthogonal measure decomposition:
\[
dx^1\,dx^2\,dx^3=du\,dt_2\,dt_3\,dz_2\,dz_3.
\]
Fubini applies in these local measurable frames. The exceptional set \(u=0\) has measure zero. The established everywhere-on-nonzero-slices result therefore implies the requested almost-everywhere conclusion.

No derivative of a moving frame enters the proof. No assertion about arbitrary L2 point values, Hamiltonian graph domains or form closure is needed.

## 6. Concrete counterexample attempt and sharpness

The following construction defeats the false transfer of the old \(M=6\) threshold to full operator columns. It does not violate the proved strict \(M=12\) theorem.

Choose a highest operator \(B_+\ne0\) of the type \((12,0,0,0)\) constructed in section 2. For K its highest type is \((12,0,0,0)\). The oscillator function
\[
h_n(z)=(z_{2,1}+iz_{2,2})^n
 e^{-\|z\|^2/(2\sqrt\beta)} B_+
\]
at \(r=1\) lies in exact level \(n\): the null-coordinate polynomial is harmonic. Its K-orbit span has highest type \(\nu=(n+12,0,0,0)\).

Whenever \(V_\lambda|_K\) contains this type, take a nonzero K-intertwiner
\[
L_1:V_\lambda\longrightarrow\operatorname{span}_K h_n
\]
and choose \(v_0\) with \(L_1v_0=h_n\). Set \(L_r=D_rL_1\), where \(D_rh(z)=r^4h(\sqrt r\,z)\); this puts its image in level \(n\) at radius \(r\).

Take nonnegative smooth compact cutoffs \(\chi(r)\), \(\eta(t)\), \(\zeta(\|z\|^2)\), with \(\chi(1)\eta(0)>0\) and \(\zeta\) positive on a ball. For \(a=R_ge_9\), \(y=R_g^{-1}z\), define
\[
f_v(ra,t_2a+z_2,t_3a+z_3)
=\chi(r)\eta(t)\zeta(\|z\|^2)
 \alpha_g\!\left[(L_r\pi_\lambda(g^{-1})v)(y)\right].
\]
K-equivariance makes this independent of the choice of g over a. Local smooth sections show it is smooth; support away from \(r=0\) and the cutoffs give global compact support. Direct substitution gives \(U_sf_v=f_{\pi_\lambda(s)v}\), so its nonzero image is entirely of type \(\lambda\).

At \(u=e_9,t=0\), its level-\(n\) projection is nonzero, because
\[
\langle h_n,\zeta h_n\rangle>0.
\]
Normalize the nonzero \(f_{v_0}\) in L2 if desired.

Applications:

| Type | Consequence in full operator-valued smooth space |
| --- | --- |
| \((24,18,0,0)\) | Branching contains \((18,0,0,0)\). Taking \(n=6\) constructs a nonzero level-six slice projection. Thus exclusion through 11 cannot be transferred from the old vector argument. The correct general guarantee is only levels 0–5. |
| \((24,24,0,0)\) | The theorem excludes levels 0–11. The same construction with \(n=12\) shows level 12 can occur, so no stronger exclusion follows from these bounds. |
| \((m+12,m+12,0,0)\) | Taking \(n=m\) gives a boundary example. The strict inequality in the theorem is essential in the full operator space. |

These constructions do not assert that their gauge projection is nonzero. They are not physical escaping sequences or bounded-energy tests. Gauge invariance is absent from the theorem, so the full-space boundary examples are nonetheless relevant and exact. No counterexample satisfying its strict hypothesis survived.

## 7. Nonzero gauge-physical realization of \((24,24,0,0)\)

For this section alone assume additionally the **original** continuous unitary SU(2) gauge representation \(U_h\), with its actual color-adjoint action on the three labels of each spinor component and its matching bosonic color action. These are extra source-binding premises, not consequences of the slice theorem.

The spatial and color label actions commute. Generation shows \(\alpha_g(U_h)U_h^{-1}\) is scalar; these scalars form a continuous SU(2) character and hence are one. Thus \(\alpha_g(U_h)=U_h\), with no Fock-vector spatial lift assumed.

A nonzero gauge-singlet vector exists under these original CAR/gauge hypotheses. Pair the original spinor labels into the 24 annihilators
\(a_{j,c}=(\theta_{2j-1,c}+i\theta_{2j,c})/\sqrt2\).
Their common vacuum line is one dimensional (the vacuum occupation projector has trace one). Color gauge rotations preserve that annihilator span, so U preserves the line. Its line action is a continuous character of SU(2), necessarily trivial. Choose a normalized fixed vector w.

With normalized Haar probability on G,
\[
T_0=\int_G\alpha_g(|w\rangle\langle w|)\,dg
\]
is positive, has trace one, is G-invariant, and is left-gauge fixed: \(U_hT_0=T_0\). Positivity and trace prevent its average from vanishing.

Let \(w_1=e_1+ie_2,\ w_2=e_3+ie_4\), and set
\[
P(X)=\sum_{a<b}
 [(w_1\cdot x^a)(w_2\cdot x^b)
 -(w_1\cdot x^b)(w_2\cdot x^a)]^2 .
\]
The dot products are bilinear, not Hermitian. Since \(w_1\wedge w_2\) is a highest vector of weight \((1,1,0,0)\), P is highest of \((2,2,0,0)\). Color invariance follows from
\((\zeta\cdot\zeta)(\xi\cdot\xi)-(\zeta\cdot\xi)^2\). It is nonzero: at \(x^1=e_1,x^2=e_3,x^3=0\), P equals one.

For a suitable nonzero smooth radial compact cutoff,
\[
F_\chi(X)=\chi(\|X\|^2)P(X)^{12}T_0
\]
is nonzero, smooth, compactly supported and left-output gauge physical. It is a highest vector of \((24,24,0,0)\), hence belongs entirely to that isotypic component; the cutoff multiplication is equivariant. Disjoint radial supports give infinitely many independent such core vectors. This proves conditional nonemptiness, not an energy estimate or an eigenstate statement.

## 8. Source applicability, negative findings and one next milestone

The primary memorandum's proposed abstract exclusion is established under H1–H2; its physical nonempty-sector construction additionally uses the stated original gauge representation and covariance. H1 is not certified merely by the accepted source compactness result. The source plane formula and negative-central declaration are consistent with the normalization used here, but this review does not qualify an action, a source Spin(8) identification or any imported donor package.

Preserved negative findings:

- The operator fiber requires \(M=12\), including its dual input; \(M=6\) is false there.
- The old full operator type \((24,18,0,0)\) can have a level-six slice component.
- Equality \(\lambda_2=m+12\) does not imply exclusion.
- Large commuting Cartan weights alone do not establish a large second highest weight.
- Compactness of the source group alone supplies neither stabilizer branching nor an operator action.
- Point evaluation of arbitrary L2 representatives, or exclusion for one test polynomial alone, cannot replace the finite-orbit slice proof.
- No same-sector escaping sequence, physical form coercivity, closed-domain identity or spectral existence was established or assumed.

**One next research milestone:** bind this canonical action/stabilizer representation to the literal source data in one source-exact identification result: original source Spin(9) and its nine-vector stabilizer, original paired 48-label action with half-gamma normalization, and the induced complex Majorana operator action, including \(\alpha_{-1}=\operatorname{Ad}_P\). This is the remaining transfer premise for the proved theorem. Do not substitute another numerical weight census, generic conditional wrapper or CI sequence for that binding.

## References and source limits

- Primary decision memorandum: BFSS_Frontier_Adversarial_Decision_2026-11-07.md, section 6.
- Fixed research memorandum: [operator columns, section V](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/contributions/bfss-kotler/BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md).
- Original normalization: [F10AV coordinate-plane formula](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10AVOriginalGammaCoordinateLinearMapSkewImage.lean).
- Original negative center: [F10U paired-label image](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.lean).
- Independent primary literature check: C. S. Rajan and S. Shrivastava, [Relative Weyl Character formula, Relative Pieri formulas and Branching rules for Classical groups](https://arxiv.org/abs/2310.00323), Theorem 2 and section 3. The branching computation above is supplied explicitly; the earlier finite diagnostics are not used as proof.
