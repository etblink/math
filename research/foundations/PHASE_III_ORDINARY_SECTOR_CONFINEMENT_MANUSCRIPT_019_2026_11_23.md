# Vacuum-excluded rotation sectors of the relative SU(2) BFSS Hamiltonian
## An analytic source-interface manuscript: invariant-line implementation, confinement, and a concrete infinite-dimensional sector

Internal research manuscript, revision 0.1, November 23, 2026 (Pacific). Evidence-led unification, Phase III consolidation 019. Not peer reviewed, not a new native Lean qualification, not a claim of first discovery of positive-energy BFSS eigenvalues. This is an analytic proof conditional on the original mathematical source interfaces specified in §1. The finite computations verify the stated character and orientation data, not the infinite-dimensional arguments.

**Abstract.** We assemble a route from the original relative SU(2) BFSS Clifford and gauge data to ordinary rotation-sector confinement. A unique joint spatial/color invariant fermionic line fixes the scalar phase of the existing Fock star-automorphism action and produces a coherent vector representation. The closed averaged charge form is invariant under the combined spatial pullback and fermion action. In a fixed-color rank-one cone, the joint lowest transverse oscillator and frozen fermionic space transforms as a 256-dimensional Spin(8) module. Exact stabilizer branching identifies total rotation types disjoint from this space. Reserving a small part of the kinetic and quadratic energy gives a uniform positive radial coercivity coefficient for all such types. Localization and graph closure imply compact resolvent on the excluded physical rotation subspace. A squared complex bosonic minor multiplied by the invariant fermionic reference vector produces infinitely many independent smooth physical states of highest weight (2,2,2,0). Thus, under the declared interfaces, the corresponding reducing restriction has infinitely many positive eigenvalues with finite sector multiplicity. This argument does not require equality of all individual closed supercharge squares, a zero-energy state, or scattering completeness. Transfer to supersymmetry multiplicity sectors is a separate conditional result.

## 1. Scope and mathematical inputs

Let X be a real 9 by 3 matrix, with columns x_a, a=0,1,2, and rho=||X||_F. Spatial indices range over 0,...,8; spinor indices over 0,...,15. The fermionic Hilbert space F is the original finite-dimensional complex CAR module, dimension 2^24. Let theta_{alpha,a} be the original self-adjoint delta-one CAR, and c_{alpha,a}=sqrt(2)theta_{alpha,a}, so {c_p,c_q}=2delta_pq I. The actual source pairing is alpha=2j+r, m=3j+a, r=0,1:
\[
c_{m,0}=a_m^\dagger+a_m,\qquad c_{m,1}=i(a_m^\dagger-a_m).
\]
All Clifford labels below refer to this original paired ordering, with explicitly reindexed tensor products where needed.

Write Gamma_i for the actual real symmetric 16 by 16 Euclidean Clifford matrices. Gamma(x)=sum_i x_i Gamma_i, GammaTwo_ij=(Gamma_i Gamma_j-Gamma_j Gamma_i)/2. Use the source color normalization f_abc=sqrt(2)epsilon_abc. For real skew 48 by 48 A define
\[
K(A)=\frac14\sum_{p,q}A_{pq}c_pc_q.
\]
The original smooth charge Q_alpha has kinetic term -i sum Gamma_i[alpha,beta] theta_{beta,a} partial_{i,a} and potential term (1/2) sum f_abc GammaTwo_ij[alpha,beta] theta_{beta,a} X_{i,b}X_{j,c}. Let D_0 be the gauge-invariant smooth compactly supported core, in the original physical L² fixed space H_phys. The original closed charge column T is the graph closure of the 16 core charges on D_0, and
\[
q(f)=\frac1{16}\|Tf\|^2,\quad D(q)=D(T),\qquad H=\frac1{16}T^\dagger T.
\]
Use the closed positive form and its associated self-adjoint operator, not a formal differential operator on an unspecified domain.

**Source-interface hypotheses.** This manuscript uses the following mathematical statements recovered from the source at unified commit 7463e4098aa8a55d0ebd8d3a51d2c4eebdd9d279. Their combination is not claimed to be a Lean theorem at that commit; individual historical acceptances have different tested SHAs. The exact blob ledger in §10 gives source references.
- (I1) Original paired Clifford representation, irreducibility, finite-dimensional Hilbert star, and exact CAR. Original K(A) is skew-adjoint for skew A, satisfies [K(A),c(v)]=c(Av), and the commutant of all original Majoranas is scalar.
- (I2) Actual source positive Euclidean Clifford Spin group G, inherited finite-dimensional PBW topology, natural orthogonal R_g and gamma16 orthogonal S_g from Clifford conjugation/evaluation, original paired R48(g) reindexing of three copies of S_g, exact two-sign natural fibers and central sign. Continuous algebra operations and coefficient maps in the specified topology. Original Fock-operator star-automorphism group action alpha_g satisfies alpha_g(c(v))=c(R48(g)v).
- (I3) Actual original gauge action on bosons by adjoint color rotation (SO3), and on F by pairedGaugeData.fermion. Its one-color flows coincide with exponentials of the original K(color generator) with the source angular scale/orientation. Spatial and color coefficient actions commute.
- (I4) Original dense invariant smooth core, closed charge-column graph and normalized adjoint-square weak-form identity. On D_0 the exact averaged charge energy equals the differential form below, with the same constants and Fock carrier:
\[
q_{\rm diff}(f)=\frac12\|\nabla f\|^2+\int \langle f,(V_B(X)+iK(A(X)))f\rangle,\qquad
V_B=\sum_{a<b}|x_a\wedge x_b|^2,\quad
A_{a\alpha,b\beta}=\sqrt2\sum_c\epsilon_{abc}\Gamma(x_c)_{\alpha\beta}.
\tag{1}
\]
In local estimates q_diff is defined for all smooth compactly supported F-valued functions; only on D_0 is it identified with the physical q. Do not extend that equality to arbitrary localized functions.

We also use standard finite-dimensional compact Lie algebra representation theory (Weyl character and B4-to-D4 branching formulas), Euclidean Cartan–Dieudonne, Haar averaging for compact groups, finite-dimensional spectral calculus, the closed-form representation theorem, and Rellich compactness on bounded balls. These are mathematical inputs, not newly formalized donors in this manuscript. The representation-theoretic counts below can alternatively use the cited literature, with convention crosswalk.

## 2. Literal source group and infinitesimal representation

**Lemma 2.1 (compact source group and stabilizer).** Under (I2), G is the ordinary Spin(9) group in its actual Clifford carrier and is compact and connected in the inherited PBW topology. The stabilizer of a unit vector n under R is its embedded Spin(8), generated by plane paths in n-perp.

**Proof.** The nine-fold Clifford volume product is central and invertible in odd dimension nine. Conjugation by g sends it to det(R_g) times itself, so det(R_g)=1. For unit vectors u,v their Clifford product is even and unitary and belongs to the Lipschitz subgroup, hence to the source Spin group. Indeed each vector is a unit of square 1, its Clifford star is its negative, and the star of the product is its inverse. This is the same membership argument as the recovered source negative-central theorem. Ordinary conjugation by uv implements two Euclidean hyperplane reflections (each single-vector conjugation is the negative of a reflection). Every element of SO9 is a product of an even number at most eight of reflections. Lift it by such a word; the exact two-sign source kernel says that every g above it is that word or its negative. A pair of opposite unit vectors gives -1, and a pair of equal vectors gives +1. Padding yields a word of length ten for every g. Conversely every such word belongs to G. Thus the continuous multiplication map from (S^8)^10 onto G proves compactness and connectedness. This identifies G with the standard even-unit-vector-word group, with its finite Clifford algebra topology. The same reflection argument in n-perp lifts SO(n-perp); both signs lie there, and any element fixing n has such a lift. Products of two unit vectors in n-perp can be expressed as plane paths cos(t/2)+sin(t/2)iota(a)iota(b) for orthonormal a,b in n-perp, including limiting parallel or antiparallel cases. This proves the stabilizer assertion. No simple-connectedness assumption is needed. ∎

**Lemma 2.2 (finite Lie representation, analytically).** The map K is a Lie algebra homomorphism on real skew coefficients.

**Proof.** Its covariance on generators and Jacobi imply that [K(A),K(B)] and K([A,B]) have identical commutator with every c(v). Their difference is scalar by (I1). Both terms have trace zero: trace of a commutator vanishes, and K(skew) is a sum of off-diagonal Majorana products with trace zero by conjugation by one of their generators. The scalar is therefore zero. ∎

The native general K-bracket gate W0C2B2 is still blocked. Lemma 2.2 is the ordinary mathematical argument through the recovered covariance and Schur interfaces, not a claim that the stopped gate qualified. Quantize the spatial generators A_ij, the reindexed three copies of Gamma_i Gamma_j/2, and the unscaled angular color generators B_a. They give commuting unitary Lie algebra actions of so9 and so3; the corresponding original source color generators differ by the declared nonzero scale and consistent orientation. Their joint kernel is unaffected by that scale. We have not assumed the desired global Fock-vector action in this step.

## 3. A joint invariant line and a phase-coherent Fock action

**Lemma 3.1 (joint invariant line).** The joint kernel of the spatial and color generators on F is one-dimensional.

**Proof.** The complex weights of the real 16-dimensional spinor are all (±1/2)^4 once. This follows by simultaneously diagonalizing four commuting half-plane matrices; any nontrivial product of the underlying plane Clifford products has length 2,4,6 or 8 and trace zero, so every simultaneous eigenspace has dimension one. The color weights are -1,0,1 in angular normalization. The real 48-dimensional coefficient space therefore has 24 opposite joint weight pairs. In each orthogonal real plane the CAR quantizer contributes the two shifts ± one half of the coefficient weight. Thus the entire Fock character is the product of 24 two-term factors, not an exterior character without its vacuum shift.

For an exact finite calculation scale the spatial weights by 4 and color weights by 2. Choose representatives
\[
a=(1,s_2,s_3,s_4,c),\qquad s_i=\pm1,\quad c=-1,0,1.
\]
Start with W(0)=1 and convolve by delta_a+delta_{-a} for each of the 24 representatives. The sum of W is 2^24 and its support has 59081 weights. For the B4 Weyl vector r=(14,10,6,2) in the scaled coordinates, set
\[
m(j)=\sum_{w\in W(B_4)}\det(w)\,W(r-wr,\,2j).
\]
This is the Weyl numerator coefficient at zero spatial highest weight and color weight j. There are 384 signed permutations. Exact convolution and alternating sums give m(0)=2, m(j)=1 for 1<=|j|<=6, and zero otherwise. The angular color weights are integers; the multiplicity of color spin j is m(j)-m(j+1). Hence the spatial singlet space is the direct sum of one trivial color representation and one color spin-6 representation, 14=1+13. The joint kernel is exactly one-dimensional.

This finite calculation is reproduced in the pinned script 015 and was independently repeated in JavaScript in the present consolidation (same 59081 weights, dimension 16777216, 384 Weyl terms and joint multiplicity one). It agrees with Hynek–Trzetrzelewski's published uniqueness calculation [2]. The character argument invokes the standard finite-dimensional Lie character theorem, not an unverified assumption of a native Spin9 group lift. ∎

Let Omega be a unit vector spanning that joint kernel. Put
\[
C_s=-\sum_{i<j}K(A_{ij})^2,\qquad C_c=-\sum_a K(B_a)^2,\qquad C=C_s+C_c.
\]
Each summand is positive, and ker C=C Omega. (Here C Omega denotes the complex span of Omega, not the action of the operator C on Omega.) To avoid that notational ambiguity write L=span_C{Omega}=ker C. By generator covariance, alpha_g(K(A))=K(R48(g) A R48(g)^T). Under this coefficient conjugation the spatial generator basis rotates by the orthogonal wedge-square action of R_g, and the color generators remain fixed. Summing squares gives alpha_g(C)=C. The kernel projection P=|Omega><Omega| is a real polynomial in C by finite-dimensional spectral calculus and is invariant. On the spatial-singlet subspace alone the color Casimir has eigenvalues 0 and 42, so one can also use P=P_s(I-C_c/42) with P_s the spatial kernel projector and angular normalization.

**Lemma 3.2 (rank-one implementer).** If a group acts by complex-linear star automorphisms alpha of End_C(F), preserving a rank-one projection P onto a unit vector Omega, then
\[
U_g v=\alpha_g(|v\rangle\langle\Omega|)\Omega
\tag{2}
\]
defines a genuine unitary representation implementing alpha and fixing Omega.

**Proof.** Use inner product conjugate-linear in its first argument. R_v=|v><Omega| satisfies R_vP=R_v and R_v^*R_w=<v,w>P. After applying alpha_g, these identities show R_{U_gv}=alpha_g(R_v), that U_g preserves inner products, and that it fixes Omega. Applying the first identity twice gives U_gU_hv=U_{gh}v; U_1=I supplies inverses. Finally TR_v=R_{Tv}, so U_gT=alpha_g(T)U_g. ∎

Equation (2) fixes the phase independently of the chosen unit vector spanning L: replacing Omega by a phase gives the same U_g. A higher-rank invariant projection or the identity operator alone does not suffice. For instance the projective spinor action of SO3 on End(C²) preserves I but no line. The construction above does not use a covering space, Lie group integration, or a new global topology instance.

By (I2) the original gamma matrix is a continuous-linear Clifford evaluation composed with the PBW subtype inclusion. Hence R48 is continuous. Every fixed Clifford word transforms as a polynomial in its entries; a finite word basis spans End(F), so alpha is continuous and (2) makes U continuous. This requires no expansion of all 2^48 operator coefficients.

For a plane path g(t) with real coefficient generator A, exp(tK(A)) implements the same Majorana action as U_{g(t)}, by (I1) and the finite-dimensional exponential. Their ratio commutes with every Majorana and is scalar. Both fix Omega, because K(A) is a linear combination of the spatial generators. Hence U_{g(t)}=exp(tK(A)). This is the essential consistency check connecting the coherent action with the infinitesimal generators used below.

By (I3), every original coordinate color flow fixes Omega; SU2 Euler generation gives actual gauge fixedness for every group element. The spatial star action fixes K(B_a) and its exponentials, hence every gauge unitary, so U commutes with the actual gauge action.

**Central sign.** Define Pi=product_m(1-2a_m^*a_m). In the literal mode order product_m c_{m,0}c_{m,1}=i^24 Pi=Pi. For the original doubled plane J=-Gamma_7 Gamma_8 on each color, the single-spinor matrix has matching (k,k+8), k=0,...,7, all upper signs positive, and Pfaffian +1 (28 inversions). Three copies retain this sign, and the reindexing moves whole two-Majorana blocks and is even. Thus Pf(J48)=1. Disjoint matching bilinears commute, so exp(pi K(J48))=Pf(J48) product_p c_p=Pi. Since K(J48)Omega=0, Pi Omega=Omega. The actual central element z=-1 acts by negative sign on all original Majoranas (CS0); Pi implements the same action, and both U_z and Pi fix Omega, so Schur gives U_z=Pi. Receipt 016 checks all 36 original planes and a sign-flipping label-transposition control. This is a parity statement about a finite Fock reference line, not a zero-energy claim for H.

## 4. Combined rotation action and exact closed-form reduction

Define W_g f(X)=U_g f(R_g^{-1}X). The orthogonal inverse pullback preserves Lebesgue measure, so this is a unitary representation on the original FullL2 carrier. Its strong continuity follows first on smooth compactly supported functions by dominated convergence and continuity of U,R, then by density and unitary bounds. Spatial/color commutation preserves the physical fixed space and D_0.

For real w let Q(w)=sum_alpha w_alpha Q_alpha. The Clifford evaluation gives S_g Gamma_i S_g^{-1}=sum_k R_ki Gamma_k and the analogous two-index formula for GammaTwo. Under conjugation by W_g, both partial_{i,a} and multiplication by X_{i,a} transform with coefficient R_ki, while theta(v,a) transforms to theta(S_gv,a). The kinetic coefficient is theta(Gamma_i w,a) since Gamma_i is symmetric; the potential coefficient uses GammaTwo_ij^T w, which retains the same transpose sign after conjugation. Contracting R with its transpose gives
\[
W_g Q(w)W_g^{-1}=Q(S_gw).
\tag{3}
\]
This is an identity on the original smooth core, not yet a native source theorem. In column notation it yields T_0 W_g=(S_g tensor W_g)T_0, where T_0 is the core column. The inverse action gives equality, not just inclusion, of the transformed graph. Both component actions are unitary, so graph closure gives
\[
W_gD(T)=D(T),\qquad TW_g=(S_g\otimes W_g)T.
\tag{4}
\]
The polarized closed form is invariant. By the weak-form characterization of the original adjoint-square H, its domain is invariant and HW_g=W_gH there. In particular the shifted resolvent and spectral projections commute with W_g.

For a finite set of irreducible Spin9 types, let E be its isotypic projection (sum of the normalized Haar character projections). Its action is bounded on the graph Hilbert space D(T) by (4) and preserves D_0: compact group averaging has common bounded support, differentiates under the integral and preserves gauge invariance. Projecting core approximants therefore gives a form core in the reducing isotypic subspace. An arbitrary closed sum of isotypic types is handled by finite type truncations converging in the graph norm, since the form graph also carries a unitary compact group representation. No common-square or individual self-adjoint-supercharge premise appears in (3)–(4).

## 5. Exact transverse-vacuum exclusion

Fix a nonzero first color column u, r=|u| and n=u/r. Write the remaining two columns as x_b=s_b n+z_b with z_b perpendicular to n. Denote by X_parallel the parallel configuration, by Z the transverse part, and by R=(r²+s_1²+s_2²)^{1/2} its parallel radius (R here is scalar, not R_g). Then rho²=R²+|Z|² and V_B>=r²|Z|².

The oscillator h_r=-Delta_z/2+r²|z|² on the 16 real transverse coordinates has frequency omega=sqrt(2)r, ground energy 8omega and gap omega. At X_parallel a constant color rotation aligns the longitudinal color vector. The skew matrix A(X_parallel) has 16 nonzero skew-plane frequencies omega_R=sqrt(2)R and eight zero-frequency planes. Consequently iK(A(X_parallel)) has lowest energy -8omega_R, gap omega_R, and fast vacuum dimension one times the slow Clifford16 module of dimension 256.

The stabilizer of n is the actual Spin8 from Lemma 2.1. The Gaussian oscillator ground state is fixed by it. In a complex fast polarization formed by the two transverse color copies, the spinor action is number-conserving and preserves the occupied eigenspace of Gamma(n), real dimension eight. Its infinitesimal action there is real skew and has trace zero. The filled determinant line is therefore fixed along every stabilizer plane path, and hence by the whole stabilizer. The exponential consistency of §3 ensures that this is true in the reconstructed U action, with no projective phase omitted. The only nontrivial representation of the joint vacuum is the slow Clifford16 module.

The slow Spin8 weights and dimensions, with multiplicity one, are:
| Highest weight | Dimension |
|---|---:|
| (0,0,0,0) | 1 |
| (1,0,0,0) | 8 |
| (2,0,0,0) | 35 |
| (1,1,0,0) | 28 |
| (1,1,1,0) | 56 |
| (1/2,1/2,1/2,±1/2) | 8 each |
| (3/2,1/2,1/2,±1/2) | 56 each |
The dimensions sum to 256. These follow from the single-color Spin9 decomposition 44+84+128 and ordinary branching. Independently, receipt 018 extracts all nine weights directly with the 192-term D4 Weyl alternating sum from the 8-plane character. No gauge projection on the vacuum is needed for this sufficient exclusion criterion.

For a dominant B4 weight lambda=(l1,l2,l3,l4), call it **vacuum-excluded** if its restriction contains none of these nine D4 types. The branching rule is multiplicity-free with
\[
l_1\ge\nu_1\ge l_2\ge\nu_2\ge l_3\ge\nu_3\ge l_4\ge|\nu_4|,
\]
on the same integral or half-integral lattice. Checking the nine types gives exactly the complement:
- Integral lambda is vacuum-compatible iff l2<=1, or l2=2 and l3=0.
- Half-integral lambda is vacuum-compatible iff l2<=3/2 and l3=l4=1/2.

Indeed, in the integral case l2=0 forces lambda=(l1,0,0,0) and admits the scalar; l2=1 admits (1,0,0,0), (1,1,0,0), or (1,1,1,0) according to l3,l4, and l2=2 admits only (2,0,0,0), requiring l3=0. Higher l2 cannot interlace any listed nu1. In the half-integral case the only nu2,nu3,|nu4| are 1/2, requiring l3=l4=1/2, and one of nu1=1/2 or 3/2 serves for the corresponding l2. Compatibility is not proof of an escaping channel or absence of compactness.

In particular lambda_*=(2,2,2,0) restricts to (2,2,k,0), k=0,1,2 (dimensions 300,840,840). All are excluded. By contrast (2,2,0,0) contains the 35-dimensional slow type; l2>=2 alone is insufficient.

**Slice lemma.** If a smooth compactly supported section f has only finitely many vacuum-excluded total rotation types, then for each fixed u!=0 and s_1,s_2 its transverse restriction is orthogonal to the joint oscillator/frozen-fermion vacuum. Proof: the span of translates of f is finite dimensional (a single vector in V_lambda tensor M_lambda has at most dim V_lambda multiplicity components); smooth L² equality implies pointwise equality. Restriction to fixed u,s intertwines the stabilizer on this span with the transverse coordinate/fiber action. The joint ground projector intertwines it as well. Disjoint representation types force that projection to vanish. This is an exact frozen-slice argument, not a Born–Oppenheimer approximation and not pointwise restriction of arbitrary L² representatives.

## 6. Uniform coercivity with fixed-color cone localization

The coefficient Frobenius norm satisfies ||A(Y)||_F²=64||Y||² by the original Gamma trace and epsilon contraction. For its 24 skew-plane frequencies t_j>=0,
\[
\|iK(A(Y))\|\le\frac12\sum_j t_j\le\sqrt{192}\|Y\|.
\tag{5}
\]
The first inequality follows from the commuting skew-plane CAR quantization; the second uses sum_j t_j²=||A||_F²/2.

Let delta=1/18 and kappa=32/33. Consider f of finite excluded type supported in rho>=1, r>=kappa rho. Reserve delta of the full kinetic term and of the transverse quadratic lower bound. On every fixed slice that meets the support, R/r<=1/kappa. On the vacuum complement, the operator (1-delta)h_r+iK(A(X_parallel)) has lower energy
\[
9(1-\delta)\omega-8\omega_R
\]
because its first excitation costs min((1-delta)omega,omega_R)=(1-delta)omega. By (5),
\[
\delta r^2|Z|^2-\sqrt{192}|Z|\ge-\frac{864}{r^2}.
\]
Since 9(17/18)-8(33/32)=1/4, the slice lower bound, integrated by Fubini with the reserved kinetic part, gives
\[
q_{\rm diff}(f)\ge \frac1{36}\|\nabla f\|^2+
\int\left(\frac{\sqrt2}{4}r-\frac{864}{r^2}\right)\|f(X)\|^2\,dX.
\tag{6}
\]
The transverse frame depends on u but only transverse derivatives are used after reserving the full kinetic fraction, so no moving-frame derivative is dropped. Any fixed unit color direction e in place of the first column is handled by a constant color rotation, with its genuine gauge fiber action; this preserves total rotation type.

For localization, let sigma1 be the largest singular value of X. There is a finite net of unit color directions e_j such that every unit v has |v dot e_j|>99/100 for some j. For example normalize the nonzero integer vectors in [-7,7]^3: rounding 7v coordinatewise gives distance <=sqrt(3)/14 from v before normalization and hence squared dot product >=1-3/196. If sigma1>=0.99rho, taking its right singular vector gives some |Xe_j|>0.9801rho>kappa rho. Otherwise
\[
V_B\ge \sigma_1^2(\rho^2-\sigma_1^2)>\rho^4/200
\]
since sigma1²>=rho²/3. Thus the angular cones and far region cover the unit configuration sphere. Choose smooth square partition functions subordinate to these open sets directly from the invariant scalar ratios |Xe_j|²/rho² and V_B/rho^4, normalized by their square sum. They are invariant under spatial rotations. Multiply by a radial outer cutoff supported in rho>=1 and add a smooth inner complement with bounded radius. The finite partition chi_j has sum chi_j²=1 and globally bounded sum |grad chi_j|². Angular gradients are O(1/rho) outside the inner ball.

On each cone (6) gives radial coefficient b=(sqrt2/4)kappa=8sqrt2/33 and bounded subtraction. On the far region quartic/200-sqrt192 rho dominates b rho minus a constant, and on the inner region the potential is bounded below. Retain kinetic coefficient at least 1/36 everywhere. The differential IMS identity
\[
q_{\rm diff}(f)=\sum_j q_{\rm diff}(\chi_j f)
-\frac12\int\sum_j|\nabla\chi_j|^2\,\|f\|^2
\]
then yields one finite C_0 independent of rotation type:
\[
\boxed{q_{\rm diff}(f)\ge
\frac1{36}\|\nabla f\|^2+
\frac{8\sqrt2}{33}\|\sqrt{\rho}\,f\|^2-C_0\|f\|^2.}
\tag{7}
\]
The local cutoffs may break gauge invariance. We use the differential form on the localized sections, and the physical energy identity (1) only on the original unlocalized physical core f. No assumption about commutation of gauge averaging with each cutoff is required.

## 7. Restricted compact resolvent and explicit nonemptiness

Let E_ex be the projection onto the closed sum of all vacuum-excluded total Spin9 types in H_phys. Equations (3)–(4) give an actual reducing subspace, not merely a compressed operator. By §4, finite excluded type core functions approximate every f in D(q) intersect ran E_ex in form norm. Apply (7) to differences. The gradients and sqrt(rho) weighted functions are Cauchy in L²; their limits are the actual weak gradient and weighted multiplication by closedness. Thus (7) extends to the restricted closed form. Its form-norm unit ball has uniformly bounded H¹ norm and weighted moment. In particular its squared L² tail beyond radius L is O(1/L). Rellich on each bounded ball for the finite-dimensional Fock fiber and this tail estimate give compact embedding of the restricted form domain into the Hilbert space. Equivalently use historical GM5E5 for joint strong input/charge/weighted limits. Hence the restricted H has compact resolvent. This uniform conclusion includes all excluded types simultaneously, not just individual compact restrictions.

**Proposition 7.1 (infinite-dimensional concrete sector).** The physical ordinary total type lambda_*=(2,2,2,0) has infinite dimension.

**Proof.** In the complexification of the standard spatial vector module choose isotropic highest-weight directions z_j=e_{2j}+i e_{2j+1}, j=0,1,2, with positive roots chosen consistently. Set
\[
p(X)=\det[(z_j^T x_a)_{j,a=0}^2].
\]
The bilinear pairing of z_0 wedge z_1 wedge z_2 with x_0 wedge x_1 wedge x_2 gives an equivariant polynomial of highest weight (1,1,1,0) for the inverse spatial pullback. Its square is killed by all raising operators by the product rule and has highest weight (2,2,2,0). The polynomial orbit is finite-dimensional, so it lies in that isotypic type. Color rotations preserve p because their determinant is one. For any nonzero smooth radial cutoff chi supported in an annulus of positive radii, chi(rho²)p(X)^2 Omega is therefore in the physical invariant core and the desired total type. At x_a=t e_{2a}, p(X)=t³, so suitable t makes this vector nonzero on an open set; its L² norm is nonzero. Infinitely many disjoint annuli yield infinitely many normalized mutually orthogonal such vectors. ∎

**Main conditional theorem.** Under (I1)–(I4) and the standard mathematical inputs in §1, the original physical Hamiltonian has compact resolvent on the vacuum-excluded total rotation subspace. In the ordinary lambda_*=(2,2,2,0) reducing subspace, the Hilbert space is infinite-dimensional and the restriction is nonnegative self-adjoint with compact resolvent. The spectral theorem gives a finite-dimensional kernel and infinitely many positive eigenvalues, tending to infinity, with finite multiplicity within the sector. Its eigenvectors are actual eigenvectors of the full H. They need not be isolated from other spectral sectors. Neither a zero mode nor a full mass gap follows. The squared-minor witnesses prove nonemptiness and infinite dimension; they are not asserted to be eigenvectors.

## 8. Separate supersymmetry multiplicity theorem: remaining bridge

Assume additionally that the 16 physical charges have self-adjoint closures with common square H and the polarized anticommutators extending on the appropriate common form domain. On positive energy the bounded normalized charges sign(Q_alpha) then satisfy the complex Cl16 CAR and commute strongly with H. This requires actual operator-domain proof, not just the average square. The resulting factorization is H_+=S tensor M, with S=44+84+128 the 256-dimensional Clifford module and H=I tensor h. Divide total rotation by its internal Clifford representation to obtain a commuting multiplicity representation on M.

If W has dominant highest weight w with w2>0, the highest-weight constituent in W tensor 84 has lambda=w+(1,1,1,0), which is vacuum-excluded by §5. Thus the multiplicity Hamiltonian for W embeds into the excluded total rotation restriction. Distinct W contributions are orthogonal there, even if selected total types coincide. Uniform compactness implies finite-rank bounded-energy spectral projections on the sum of all such W multiplicities, not just individual compactness. A nonempty such sum on positive energy has a positive lower spectral bound relative to that sum, not relative to the full H. This does not exclude symmetric traceless W=(l,0,0,0), including the odd ones; a Weyl selection argument would be an additional input. W84-specific nonemptiness/infinite dimension requires a distinct witness (Phase III 002 conditional high-momentum projector), not merely Proposition 7.1.

The original Fierz and Gauss donors already exist (011–012), including L6G2 homogeneous Fierz, G4B/G5P/Q/W square terms, G6G/H/I/K fermionic contractions and L6G7T original Gauss cancellation. The next mathematical task is their exact equal-norm square-difference assembly on D_0, then closure and individual essential self-adjointness. The November 14 and 15 historical memoranda and receipt 003 provide the analytic routes. None of those native conclusions is claimed here.

## 9. Limitations, falsifiers and review questions

- Existing [3] proves positive eigenvalues via coarse high-weight confinement. The present proposed refinement is exact vacuum representation exclusion and the specific lower weight witness, not first discovery of positive eigenvalues. No priority or publication-ready novelty claim.
- Rank-one versus higher-rank invariance, source orientation under Majorana label swaps, one color generator's two-dimensional kernel versus full joint kernel, and (2,2,0,0) vacuum compatibility are essential negative controls.
- Check the color/gamma sign and factor in (1) against original source; the quantizer has coefficient 1/4 for CAR2, not for delta-one theta. Check the positive half-plane convention versus the doubled negative plane; the parity sign is invariant under full plane sign reversal, not under arbitrary label exchange.
- Check the stabilizer fast determinant action against the coherent global U, rather than assume that an arbitrary projective implementer is sufficient. Check the slice restriction only on finite-type smooth representatives and the differential IMS identity only with its legitimate scope.
- Check the graph closure and actual reducing operator domain, rather than replace the physical Hamiltonian with a formal differential expression or a compressed operator.
- The invariant reference line is coordinate-independent in the finite fermion space, not a normalizable whole-space ground state. The smooth cutoff witness has no asserted zero energy. No full BFSS mass gap, all-N extension, physical Hopfion, GUT, or empirical unification conclusion.
- Mathematical proof interfaces and native qualification are distinct. No new Lean declaration, CI, or canonical gate promotion results from this manuscript. A complete independent mathematical review of this manuscript remains outstanding.

## 10. Source ledger and reproducibility

Source root: [unified integration at exact 7463e4098aa8a55d0ebd8d3a51d2c4eebdd9d279](https://github.com/etblink/math/tree/7463e4098aa8a55d0ebd8d3a51d2c4eebdd9d279/lean/OAI/MathematicalPhysics/BFSS). Paths below are under this BFSS root. Source hashes are recovered from the cited audits; no new full dependency/CI qualification audit here.

| Interface | Source file (under BFSS root) | Git blob / historical evidence |
|---|---|---|
| I1 | Contrib/Kotler/SU2FermionFockProbe.lean | dbe9241436c7d3633547e559bccd5fe1fd82de9a |
| I1 | Contrib/Kotler/SU2FermionF2Probe.lean | 93d7ae00d4ee21ce59ab137c349590e2c496ff38 |
| I1 | Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean | 152204ef15a6569534e0503824a697cb9ae8e4ce |
| I1 | Contrib/Kotler/SU2RealGammaProbe.lean | b9b8192055c70f0d001d7982669b9823c55562ed |
| I1 | Contrib/Kotler/P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean | c2e7a7c665121283cde13ae5dabc183362b6b420; #43901524171 |
| I1 | Contrib/Kotler/P3M4W0B2BOriginalSchurScalarCommutant.lean | 6d5fbe98aa8d660c9b7c680efefde02501d8e253; #44180157170 |
| I2 | Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BRSourceVectorOrthogonalHom.lean | 8aa718eba564ae945e618aefbee9329f952256f0 |
| I2 | Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers.lean | bfd6c019f57f7a6a1201cbfedf543dcc16efb91b |
| I2 | Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DKAmbientGammaManifoldDifferential.lean | 12a6684a6553b7da3d2182407052f70f37c7280a |
| I2 | Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean | b50ef04695587b267ad8519074b1293f98828749 |
| I2 | Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean | 2d6f777568b0026737112ff8256e5ed50fc9e6e6 |
| I2 | Contrib/Kotler/SU2BFSSPairedSpin9V10HF10TSourceSpin9NegativeCentralMembershipProbe.lean | 251a9375d3f99e04d3bf547c8052185ebcf2b768; central gamma sign CS0 #43806215702 |
| I3 | Contrib/Kotler/OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean | e20c76fb22bc09d16dbcd8657333227cb34ed1ea |
| I3 | Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G7KOriginalSourceFlowExactGaugeImplementationProbe.lean | d659c8343048307df8ef49a1c57084234c1e876e |
| I4 | Core.lean | 9882359ced78b0a3bd7e2f057974bd0a031b3e60 |
| I4 | PotentialBasis.lean | bc9b526284166efcba5a8e296adc79ba88e6764d |
| I4 | Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean | f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1; #43493125150 |
| I4 | Contrib/Kotler/BFSSGM5AOriginalPhysicalMasslessCorePairing.lean | 66b088543e802268657232862a363506fc7000ae; #45094611903 |
| I4 | Contrib/Kotler/BFSSGM5E5OriginalWeightedGraphCompactness.lean | fd39e85e5d7c2d6009c53416072ba23b7440a81f; #45128649701 |

Additional PBW/topology, spatial plane, Fock Lie, source Gauss, graph and normalization paths and exact historical scope are retained in 006–008 and 011–018. The conditional abstract Spin9 structural bundle was qualified #43799204363 on its own source/consumer SHA; not a native proof of the present composition.

Research ancestry (all under research/foundations at research parent e8b4707b6a31d875cddee2ee0efbb3930cf18d80):
- 006 partner confinement: ba76f4b7ce6c1198acd7f5092e30864946d19160; 007 uniform audit: 3f22f95abb5885a8d74e0e6e90ec3fa3f3d03b18.
- 014 rank-one construction/topology: c8af4a3b6834e297fa4cea662bce9c442c9ec5a6.
- 015 invariant-line receipt: 51c1ac235fbf5acea4bdb5334d03980ac0fbaee6. Python script PHASE_III_INVARIANT_LINE_015_2026_11_23.py blob 03c3a7bccecbf4dca68ee16c16c71eeb2b19082c, commit ba0fdff8ac6b285ed9765dc45cd69fea61c86e96. Earlier execution provenance in 015. Fresh separate JavaScript convolution in this consolidation reproduced all counts; no fresh Python execution claimed.
- 016 parity/source orientation: 70dfd2ba32520a529d386a828d28e53a000135b4; 017 covariance and sector witness: d1b018c64147aaf10937d9b976ad13216d983098.
- 018 adversarial review: e8b4707b6a31d875cddee2ee0efbb3930cf18d80, exact 192-term D4 count and analytic compactness/plane phase check.

### Literature
[1] J. Hoppe, D. Lundholm, M. Trzetrzelewski, Construction of the Zero-Energy State of SU(2)-Matrix Theory: Near the Origin, Nucl. Phys. B817 (2009), 155–166, [arXiv:0809.5270](https://arxiv.org/abs/0809.5270).
[2] M. Hynek, M. Trzetrzelewski, Uniqueness of the coordinate independent Spin(9) x SU(2) state of Matrix Theory, [arXiv:1004.3397](https://arxiv.org/abs/1004.3397), §§2–3.
[3] OpenAI, Positive eigenvalues of the relative SU(2) BFSS Hamiltonian, October 5, 2026, [original manuscript directory](https://github.com/openai/math/tree/main/preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026), §§2–3; [unofficial HTML transcription](https://wcook04.github.io/plectis-atlas/papers/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026.html). Prior inspections in 006–007/018, not a fresh literature search in this consolidation.
[4] Sanjurjo–Zikopoulos, Bound States of Two D0-Branes and the Three-Graviton Coupling, [arXiv:2611.17325v2](https://arxiv.org/html/2611.17325v2), §IV, for the separate supersymmetry partner motivation.
[5] Standard B4/D4 highest-weight theory, Weyl character formula and Spin9-to-Spin8 interlacing (used explicitly, not claimed as original). Standard finite CAR quantization, Cartan–Dieudonne, IMS, closed form and Rellich theorems.

## 11. Decision
Freeze revision 0.1 as a coherent internal mathematical review target; retain all antecedent receipts. Do not stage new Lean/CI or modify unified integration, main, NFC or gate state. Continue the historical donor-first audit of the actual equal-norm charge-square and common self-adjoint domain. Keep independent MSY ground-state certificate as the primary physical milestone. Ordinary confinement and protected multiplicities are distinct, and this manuscript supplies no new empirical support for a foundational theory.
