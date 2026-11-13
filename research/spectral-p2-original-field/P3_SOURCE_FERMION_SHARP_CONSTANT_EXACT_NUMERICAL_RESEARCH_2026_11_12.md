# P3 forward research — sharper source fermion coefficient bound (NOT a Lean qualification)

**Date:** 2026-11-12 Pacific. **Primary state:** M1 B3 qualified; B4A remains next. **Exploratory parallel calculation:** source-constrained M7 pre-gate, NOT a physical spectral result.

## Exact sources and earlier donor audits

Review source-original `SU2RealGammaProbe.lean` Git blob `b9b8192055c70f0d001d7982669b9823c55562ed`; `SU2ColorCrossProbe.lean` blob `209b3808222730ca5e817d83ed32253a67513f7f`; `contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py` blob `4dcc78016765253e8efe5f9f5697aba4999a6d6d`; `audit_spectral_source_premises.py` blob `d52cbb008099513399abaf33b11c82a1dc52b665`. Their exact integer signed coefficient audit tracks the original ordered CAR and physical factors but is **not** an accepted Lean source-field operator theorem.

**Reproduce independently in a full checkout:** `python3 research/spectral-p2-original-field/tools/audit_source_fermion_sharp_constant.py --output /tmp/bfss-sharp-fermion-receipt.json` (Python NumPy, optional SymPy for exact 12×12 symbolic crosscheck). Pinned exact-source checks fail on source blob drift. This research script is not run by a new strict Lean gate or hosted build.

## New conditional bound discovery

For source `X` as a 3×9 real color/spatial matrix, form the source coefficient matrix
`K0(X)[(a,alpha),(c,beta)] = sum_(d,i) X[d,i] epsilon[d,a,c] Gamma[i][alpha,beta]`
with 16×16 original signed-permutation real `Gamma_i`. The original physical field candidate is `K=sqrt(2)K0` and `B=(i/2) sum_(pq) K[pq] theta_p theta_q`, with source `theta_p²=I/2`; the **literal original signed physical-field operator equality** remains a proof obligation.

The pinned coefficient basis satisfies the exact integer identity `Tr(K0[d,i]^T K0[e,j])=32 δ_de δ_ij`. For a given configuration, `||B||` can be computed from the skew coefficients through the finite CAR normal-form identity `||B|| = sqrt(2)/4 sum_k singular_k(K0)` (the original source identification is not yet Lean certified).

The prior diagnostic used the **optional H2** spectral formula. We independently recomputed 200 random full configurations, the rank-one, rank-two, full-isotropic, anisotropic, oblique and near-valley examples. Direct 48×48 singular values agree with
`||B(X)|| = 8 sqrt(2) lambda_max(S(s1,s2,s3))`, where `s1>=s2>=s3>=0` are the singular values of `X` and
`S = [[0,s3,s2],[s3,0,s1],[s2,s1,0]]`.
Largest float mismatch across random configurations approximately `1.3e-14`. **This identity is numerically source-checked, not a universal formal theorem.**

Conditional on proving that global spectral formula and exact source operator binding, the **sharp candidate universal bound** is
`||B(X)|| <= 16 sqrt(2/3) ||X||`, numerically `13.0639452948 ||X||`,
improving conservative `8 sqrt(3)=13.8564064606` by `5.7191%`.

**Short conventional proof of sharp constant, given the H2 formula:** for unit `v∈R³`,
`v^T S v=2(s3*v1*v2+s2*v1*v3+s1*v2*v3)`.
By Cauchy–Schwarz, this is at most
`2 ||s|| sqrt(sum_{i<j} v_i² v_j²) <= (2/sqrt3)||s||`
because `sum_{i<j} v_i²v_j²=(1-sum_i v_i^4)/2 <=1/3`.
Equality occurs at `s1=s2=s3=||X||/sqrt3`, `v1=v2=v3=1/sqrt3`; hence the global constant is optimal **if** the H2 identity holds.

The exact source 48×48 coefficient `K0` also passed the **integer** polynomial test on 16 fixed and random integer configurations:
`K0^6 + 2P K0^4 + P² K0² + 4D I = 0`,
`P=||X||²`, `D=det(XX^T)`.
A **12×12 symbolic real Cl(3)/color model**, with arbitrary diagonal `X=diag(a,b,c)`, satisfies the identity as a polynomial in `a,b,c`, with exact characteristic polynomial `(t^6+2Pt^4+P²t²+4D)^2`; this may be a small model for an efficient Lean proof. The **full-source universal polynomial identity and SVD/Spin-gauge reduction remain unproved**. Polynomial annihilation alone also needs multiplicity control to derive the proposed norm formula.

## How the possible gain affects the roadmap

For conditional coercivity margin `sqrt(beta)*(m+9)-C_B` with `beta<1/2`:
- At **m=11, beta=0.49**: `14-8sqrt3=0.143593539` (old) vs `14-16sqrt(2/3)=0.936054705` (candidate), ~6.5× larger.
- At **m=10, beta=0.49**: old margin `-0.556406461`; candidate margin `+0.236054705`. Potentially one fewer excluded oscillator level, conditional operator weight `lambda2>m+12=22` and vector `lambda2>m+6=16` only after exact global vector lift.
- At **m=11, beta=0.45**: candidate margin `+0.352462570` while preserving unused kinetic coefficient `1/2-beta=0.05`, versus the illustrative `0.01` at beta=0.49. This may be the more robust *gradient-vs-moment* compromise if attaining m=11 is feasible.
- `beta_min` at m11 falls from `0.480000` to `0.426667`; at m10 the candidate needs beta `>0.472761`. The thresholds are conditional and cannot be substituted for actual source sectors.

**Geometric distinction:** rank-one `||B(X)||/||X||=8sqrt2=11.313708499`, not the full-isotropic worst-case 13.064. For `s=(1,epsilon,epsilon)`, `epsilon=0.01` yields ~11.31484 and `epsilon=0.1` ~11.42198. This suggests a near-valley refinement, but rank-one is measure-zero, and a pointwise rank-one constant cannot replace a global form bound without a quantitative localization proof and the original quartic potential.

## Proposed next bounded *mathematical* gates, not yet authorized or executed

A. Exact original signed field-to-`K0` binding (source pauli, gamma, 48 theta, signs, 1/16 charge factor). Reuse the existing coefficient audit; require an actual Lean declaration and independent source consumer.

B. Prove the original 48×48 coefficient matrix polynomial and its **multiplicities**, using 12×12 real Clifford/color symbolic reduction and exact source `Spin(9)×SU(2)` covariance/SVD reduction. Source element equality should be established generically, never only by random samples. If this fails, **do not** advertise the sharper bound.

C. Transport skew normal-form `(sqrt2/4) sum sv(K0)` into the actual source CAR operator, then deduce the sharp `16sqrt(2/3)` universal bound; keep original operator norm and exact `theta²=1/2`.

D. Recompute the coercivity balance with honest **physical reducing sectors**, correct operator vs vector thresholds, exact sharp color-sphere 1/2 factor, and same-closed-form gradient/moment bounds. Adversarial original physical escaping packets can refute the downstream inequality; no further spectral claim until all prerequisites hold.

**Project Lead decision:** preserve these as a high-payoff **parallel M7 pre-gate**, but keep **M1 D5-B4A surjectivity next**. Do not change active proof gate based on finite Python evidence. Review M7 priority after a source Lean norm theorem or a genuine counterexample, not on Monte Carlo magnitude alone.

**Nonclaims:** no accepted original physical field growth theorem, no proven source high-type coercivity, no normalized-to-unnormalized replacement, no source Fock-vector Spin unitary, no positive eigenpair or mass gap, no physical three-family theorem.
