# Global gauge and Spin(9) covariance: direct source review

2026-11-25 Pacific. Baseline 4f0422e3181f84d82233f0a2d47d1a158425f8e6. Analytic deduction from source fields, no new native theorem qualification. Independent contraction experiment run 45710452362 in progress at review. Goal is truth, not validation of BFSS, and negative outcomes must be retained.

## Source pins and conventions

Core.lean blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60: AlgebraData.color_orthonormal, structureConstant, gammaTwo, charge, theta_CAR, theta_selfAdjoint. GaugeCore.lean blob e4990dadf1d8bde849e351467282ab3f14989c3b: GaugeData.boson_adjoint, fermion_adjoint, both continuous actions, physicalSpace. SpinPlaneCovariance.lean blob c262821f5532953048c9b2f3ecfbc04fa3b73f43: sourceSpinPlaneGenerator and gamma commutators. Read actual files at baseline; no substitution of HS column action.

Use color-column vectors x_i, R_{BA}=adjointCoefficient(g,A,B). The source orthonormal color coordinates and conjugation imply R^T R=I and boson g x = (R x_i)_i. F=fermion g is unitary. The physical action on full sections is U_g f(x)=F f((R^T x_i)_i), so its fixed space is precisely the source physicalSpace, not the intersection of separate bosonic and fermionic fixed spaces.

## Unrestricted gauge covariance

On the entire smooth compactly supported test core (not just invariant sections), the source fermion_adjoint gives
F theta_(beta,A) F^-1 = sum_B R_BA theta_(beta,B).
Consequently theta_(beta,A) F = F sum_D R_AD theta_(beta,D).
The chain rule gives partial_(i,A)(U_g f)(x) = F sum_C R_AC partial_(i,C) f(R^T x). Summing over A contracts sum_A R_AD R_AC=delta_DC. The kinetic term therefore commutes with U_g for each alpha separately.

Write w_ij(x) for the color-coordinate vector of bracket(sum_B x_iB color B, sum_C x_jC color C). The source bracket is -i times the matrix commutator, and w_ij,A=sum_BC structureConstant(A,B,C) x_iB x_jC. Conjugation is a bracket automorphism, hence w_ij(Rx)=R w_ij(x). The potential is (1/2) sum_ij beta A gammaTwo(i,j)_(alpha,beta) w_ij,A theta_(beta,A). Substitution of R^T x followed by F conjugation transforms its color coefficient back to w_ij(x); the original factor 1/2 is unchanged. Thus Q_alpha U_g = U_g Q_alpha on the full core. This deduction works without special SU(2) epsilon identities, or a choice of phase for F.

Because U_g preserves the core, is unitary, and commutes with Q_alpha there, it also preserves and commutes with the full graph closure. Haar averaging over compact SU(2) gives the orthogonal fixed-space projection P, and averaging is valid in the graph Hilbert norm: strong continuity of both components follows from the action's strong continuity on L2 (prove first on compact smooth sections by dominated convergence, then density). On smooth compact supports averaging preserves smoothness by differentiation under the integral over compact group; the union of rotated supports is compact. Therefore P maps the full test core into invariantCore. For a physical vector in the full closed graph, average any full-core graph approximation to obtain physical-core approximations. The closure of the restricted operator is exactly the restriction of the full closure; if full closure is self-adjoint, the fixed subspace reduces it. This fills the unrestricted-commutation premise in the physical implication memo without relying on D3B alone.

## Direct finite Spin(9) covariance

Use t_p=sqrt(2) theta_p, where p=(spin,color), so {t_p,t_q}=2 delta_pq I. For real skew matrices A on the 48-dimensional Majorana label space, let
K(A)=(1/4) sum_pq A_pq t_p t_q.
It is skew-adjoint. From [t_p t_q,t_r]=2(delta_qr t_p-delta_pr t_q) follows [K(A),t_r]=sum_p A_pr t_p. Applying this identity to both factors of K(B) gives [K(A),K(B)]=K(AB+BA^T)=K([A,B]) exactly, not only modulo a scalar. Restrict A to the source spin generators gamma_r gamma_s/2 repeated in color. This real skew Lie representation integrates to a unitary representation V of the simply connected Spin(9). The plane generator is (1/8) sum_(a,alpha,beta) (gamma_r gamma_s)_(alpha,beta) t_(alpha,a)t_(beta,a), agreeing with the G14 spin normalization.

Let S be the real 16-dimensional spin matrix and O its vector rotation. The Clifford commutators exponentiate to S gamma(v) S^-1=gamma(Ov); V t_(beta,a) V^-1=sum_delta S_delta,beta t_(delta,a). Both follow first on one-parameter groups by linear ODE uniqueness, then on their products. Define W f(x)=V f(O^T x), with spatial coordinate column for each color, and S^-1=S^T. For the full smooth core,
W partial_(i,a) W^-1=sum_j O_ji partial_(j,a);
sum_i O_ji gamma_i S^T=S^-1 gamma_j.
The potential transforms by the same argument with two O coefficients, using gammaTwo's bilinearity:
sum_ij O_ki O_lj gammaTwo(i,j) S^T=S^-1 gammaTwo(k,l).
Hence for the literal full charges,
W Q_alpha W^-1=sum_beta (S^-1)_alpha,beta Q_beta=sum_beta S_beta,alpha Q_beta.
This is exactly the column intertwiner convention: for a singlet psi, T(e_alpha)=Q_alpha psi satisfies W T=T S. No ambiguity from replacing S with its transpose.

Gauge compatibility is especially simple and does not require a choice of gauge curve or gauge phase: F_g K(A) F_g^-1=K(A) for spin A repeated in color, since sum_a R_ba R_ca=delta_bc. The orbital spatial and color actions commute. Thus W commutes with U_g and preserves invariantCore. Orthogonal mixing of the sixteen charge outputs preserves the column graph norm and coreForm. Pass to the closed graph by approximation; uniqueness of the associated nonnegative self-adjoint operator gives W H W^-1=H and resolvent commutation. On the common individual form domain, the finite charge transformation follows by the same approximation.

## Adversarial checks and scope

The transpose placement is substantive: using S instead of S^-1 in the displayed row identity gives the wrong infinitesimal sign and would invalidate the intertwiner proof. A gauge-invariant scalar average alone would not suffice for vector-valued physical equivariance. Equality of differential expressions on an invariant core alone would not establish full graph commutation, and phase-free CAR automorphisms alone would not establish an honest group representation; the explicit Lie bracket above removes that central defect on simply connected Spin(9).

This review reduces the previously stated analytic covariance uncertainty. It does not independently certify the concrete seed cancellations, finite raw occupations, Gaussian moment computation, full self-adjointness argument, Hardy anticommutator identities or final fidelity. Existing frozen qualifications remain unchanged.

## Computational experiment bookkeeping

The direct fixture run uses a sparse vectorized integer scatter with an explicit bound max_component * sum(abs(coefficients)) < 2^62 and literal Python-integer fallback; dot products are arbitrary precision. 400 single-term synthetic scatter/literal comparisons (5*2*5*2*4), one wide-integer fallback, cubic tensor controls, 21 vector Euler identities and 1368 ordered original receipt comparisons targeted. Only max(p,q)>=17 is compared; old-old archived zeros are placeholders. The full binary seed was inaccessible through text-only GitHub connector and direct git network access was unavailable in the chat runtime. The checkout-local workflow was therefore launched. Prior conversational preliminary-control claims did not include a standalone execution receipt; no qualification inferred from them. Await actual job logs and result artifact before assigning PASS or RED.
