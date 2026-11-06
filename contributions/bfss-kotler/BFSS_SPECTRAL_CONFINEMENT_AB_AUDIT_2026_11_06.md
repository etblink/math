# Spectral confinement A/B mini-audit — source normalization and gauge averaging

**Status: analytical derivation plus independent finite diagnostics; zero new Lean-qualified roots.**
This is a scoped research record, not an independent human review, confinement acceptance,
closed-operator identification, or positive-eigenvalue theorem. Prepared with Codex; no new human review is represented.

Research branch: `research/bfss-spectral-confinement-roadmap-20261106`.
Frozen analytical baseline: `c288e2827e6eb9970398217502fe6528813db6bd`, descended from
accepted F10DW handoff `4d7a0aef7d64d38fc6e15e9927489f54e4e2db5e`.
Question: do the normalization and global direction average invalidate H1 before a larger formalization?
Decision: **the two bounded analytical ingredients survive this audit; the actual source confinement claim remains on hold.**

## 1. Source authority and the locator correction

The [roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md) is a proposal, not evidence.
The [current-state handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md)
retains F10DW qualification. The FCP [evergreen guide](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md)
(read blob `f5b53f680e7b3c119491be01306a33d83586bd9a`) and
[procedural review](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_BFSS_PROJECT_LEAD_PROCEDURAL_SUCCESS_FAILURE_REVIEW_AND_EXECUTION_PLAN_2026_10_26.md)
(read blob `539940a0b696ebe4ece856420d2a3222716971eb`) motivate the small, source-exact diagnostic and explicit model boundary. Neither document is modified.

The exploratory tree does **not** contain `Contrib/Kotler/CLAIMS.md` or
`Contrib/Kotler/OperatorDependencies`. They exist in the separate PR #77 head snapshot
`etblink/math@fa00aa36e770ca516f57b41f5b02229a5033d50f`, branch
`contribution/bfss-lean-v040-20261105`. They are not restored by the F10DW strict workflow.
No files from that snapshot were imported or merged here. This corrects a source-locator
assumption in the original roadmap; it does not invalidate F10DW.

| Read source at baseline, paths below `lean/OAI/MathematicalPhysics/BFSS/` unless stated | Exact Git blob | Role |
|---|---|---|
| `Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | Literal CAR, gamma convention, charge, and `1/16` core form |
| `GaugeCore.lean` | `e4990dadf1d8bde849e351467282ab3f14989c3b` | Physical space and invariant-core density invariance |
| `Contrib/Kotler/SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | Actual nine symmetric signed-permutation gamma matrices |
| `Contrib/Kotler/SU2ColorCrossProbe.lean` | `209b3808222730ca5e817d83ed32253a67513f7f` | Normalized Pauli colors and orientation-dependent epsilon convention |
| `Contrib/Kotler/SU2PairedThetaLabelCrosswalkProbe.lean` | `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e` | Actual paired label packing, not the older `Fintype.equivFin` order |
| October 5 TeX, `preprints/Positive-eigenvalues-of-the-relative-SU-2-BFSS-Hamiltonian-October-5-2026/build/positive-eigenvalues-relative-su2-bfss.tex` | `12c5fffb5f90b48856f60fb0e93c18e2490c5f1b` | Equations `supercharges`, `potential`, `one-color`; their mathematical claims remain subject to audit |

The [diagnostic receipt](evidence/spectral-confinement-2026-11-06/ab-diagnostic-receipt.json)
also records SHA-256 for all six sources. Alternate-snapshot definitions inspected:

| Path under `Contrib/Kotler/` at `fa00aa36e770ca516f57b41f5b02229a5033d50f` | Git blob | Source meaning only; no fresh qualification here |
|---|---|---|
| `CLAIMS.md` | `e448d291f10a5a7cc91ec0fbc1f5b2ecc13219ee` | Reader crosswalk, with explicit conditional operator claims |
| `OperatorDependencies/SU2BFSSFullAlgebraDataProbe.lean` | `de8242615e4b2959e2dfa57cf0c6fdf43896acb7` | `concreteAlgebraData` selects the normalized Pauli colors and `FCP.BFSSGamma9.gamma` |
| `OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | `pairedAlgebraData` preserves concrete color/gamma and uses the paired theta family |
| `OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean` | `e20c76fb22bc09d16dbcd8657333227cb34ed1ea` | Literal six-field `pairedGaugeData` assembly |
| `OperatorDependencies/SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe.lean` | `031acfec5aabe8f099592c7d2de35f18f961a770` | Actual normalized Hamiltonian/weak-form interface, without spectral existence |

## 2. Exact finite-dimensional proposition A

Let `theta_p`, `p=(a,alpha)`, be self-adjoint operators on a nonzero finite-dimensional
complex Hilbert space with `{theta_p,theta_q}=delta_pq I`. Let the nine real symmetric
16-by-16 matrices satisfy `{gamma_i,gamma_j}=2 delta_ij I`. For any real 3-by-9 matrix
`X=(x_i^a)`, set `r=||X||_F` and

```math
K_{(b,\beta),(c,\delta)}(X)
 =\sqrt2\sum_{a,i}\varepsilon_{abc}x_i^a(\gamma_i)_{\beta\delta},
\qquad
B(X)=\frac{i}{2}\sum_{p,q}K_{pq}(X)\theta_p\theta_q.
```

Then `K` is real skew, `B` is self-adjoint, and

```math
\|B(X)\|_{\rm op}\le 8\sqrt3\,r.
```

**Derivation.** The gamma anticommutator and trace cyclicity give
`tr(gamma_i^T gamma_j)=16 delta_ij`. Also
`sum_{b,c} epsilon_{abc} epsilon_{dbc}=2 delta_ad`. Consequently
`||K||_HS^2=64 r^2`. Real orthogonal skew normal form has 24 two-by-two blocks,
including zero frequencies, with `a_j>=0` and `sum_j a_j^2=32 r^2`.
Transform the theta generators by the same real orthogonal matrix. This preserves
self-adjointness and CAR directly; **no global Spin(48) implementer is needed for this bound**.
Each block contributes `i a_j theta'_(2j-1) theta'_(2j)` of norm `a_j/2`, since
`theta'_p^2=I/2`. The triangle inequality and Cauchy–Schwarz give

```math
\|B\|\le\frac12\sum_{j=1}^{24}a_j
 \le\frac12\sqrt{24}\sqrt{32}\,r=8\sqrt3\,r.
```

Irreducibility is unnecessary for the **upper bound**. In the full irreducible complex
48-generator module, the commuting block involutions realize every occupation sign
(successive Clifford generators flip the individual signs), so the norm equals
`(1/2) sum_j a_j = (1/4) sum_{ell=1}^{48} singularValue_ell(K)`.
The diagnostic uses this finite one-particle expression; it does not allocate the
`2^24`-dimensional Fock matrix or restrict to one fermion-parity sector.

| Convention | Value / consequence |
|---|---|
| Source CAR | `{theta,theta}=delta`; `theta^2=I/2` |
| Unit Clifford generator | `c=sqrt(2) theta`, so `{c,c}=2 delta` |
| Same quadratic operator in `c` | `B=(i/4) sum K_pq c_p c_q` |
| Ordered-pair sum vs one skew block | Both orders combine; the block coefficient is `i a theta'_1 theta'_2` |
| All 48 singular values | Norm in the full irreducible module is one-quarter their sum |
| Rank-one configuration | `||B||=8 sqrt(2) r`, consistent with the proposed scale |
| Color handedness | `+sqrt(2) epsilon` requires the oriented Pauli basis; changing handedness negates the tensor, leaving this norm bound unchanged |

The manuscript's pre-contraction multiplication remainder has coefficient
`-i/16 sum_(i,j<k) (partial_(ia) y^c_jk) (gamma_i gamma_jk)_(beta,delta)`
in the **original ordered** product `theta_beta^a theta_delta^c`.
The diagnostic checks every one of its 243 color/spatial coefficient matrices against
`(i/2) f_dac gamma_ell`, with exact integer arithmetic after removing `i sqrt(2)/16`.
Thus the displayed finite coefficient contraction agrees for the actual gamma family;
it is not a Lean theorem equating the complete original core or closed form to the manuscript decomposition.

## 3. Exact geometric and measure propositions B

Use normalized surface probability `sigma=dArea/(4 pi)` on `S^2` and ordinary
Euclidean/Frobenius norms. For every real 3-by-9 matrix `X`,

```math
\frac12\|X\|_F\le
 F(X):=\int_{S^2}\|v^T X\|_2\,d\sigma(v)
 \le\frac1{\sqrt3}\|X\|_F.
```

Both constants are sharp. At `X=0` this is immediate. Otherwise diagonalize `XX^T`
with singular values `s_i`, set `a_i=s_i^2/r^2`, and use sphere rotation invariance.
The weighted Cauchy–Schwarz inequality, with `sum a_i=1`, gives pointwise

```math
\sqrt{\sum_i a_i v_i^2}\ge\sum_i a_i|v_i|.
```

Each coordinate has `integral |v_i| d sigma=1/2` (use `v_3=z` and
`d sigma=dphi dz/(4 pi)`). This proves the lower bound, with equality for rank one.
Jensen gives the **upper** bound from `integral v_i^2=1/3`; equal singular values
attain it. In particular Jensen cannot replace the lower coefficient by `1/sqrt(3)`.

For a measurable density `rho>=0` on `R^(3x9)`, suppose for every `R in SO(3)` that
`rho(RX)=rho(X)` for almost every `X`. Define extended nonnegative integrals
`I(v)=integral ||v^T X|| rho(X) dX` and `J=integral ||X||_F rho(X) dX`.
Orthogonal change of variables shows `I(v)=I(R^T v)`; transitivity makes it constant
on unit directions. Tonelli applies to the jointly measurable nonnegative integrand,
without assuming the first moment finite, and yields

```math
I(v)=\int F(X)\rho(X)\,dX\ge\frac12 J.
```

One almost-everywhere identity **for each fixed rotation** suffices. No uncountable
intersection of full-measure sets is taken. On the smooth compact physical core all
these moments are finite, and pointwise covariance is already the source's
`GaugeData.invariantCore_equivariant`; `invariantCore_norm_gauge` gives norm invariance.
For the normalized Pauli colors, the SU(2) adjoint action covers SO(3): conjugation by
`cos(t/2) I - i sin(t/2) (n dot sigma)` gives axis-angle color rotations (with the
sign of the angle determined by the conjugation convention). Thus this is the
appropriate density lemma for the actual source gauge action. A formal specialization
must still bind the Pauli action and the exact source declarations; no arbitrary unitary
representation is being substituted for the given `GaugeData`.

**Adversarial sharpness.** A uniform color rotation of `X=u e_1^T`, `||u||=1`, has
`J=1`, `I(v)=1/2` and isotropic color second moment. This is a measure supported on
the rank-one orbit, not a smooth physical wavefunction or an escaping fixed-sector state.
Convolving that probability measure with an SO(3)-invariant smooth approximate identity
gives invariant densities with the same limiting first-moment ratio. This defeats any
purported `1/sqrt(3)` lower bound based only on isotropic density covariance. It does
**not** refute H1, whose coefficient is the sharp `1/2`.

## 4. What the two ingredients would imply, conditionally

Let `T=||grad Psi||_2^2`, `W=integral V||Psi||^2` and
`J=integral r||Psi||^2` on the actual smooth physical core. Assume the **same** form has
`q=(1/2)T+W+integral <Psi,B Psi>`. Assume also, in the actual chosen Spin(9) sector,
the first `m+1` transverse oscillator levels are absent for one fixed color direction,
so for `0<beta<1/2` its source-bound estimate is

```math
\beta T+W\ge 2\sqrt\beta\,(m+9) I(e_1).
```

The factor two is essential: `-beta Delta_z+r^2|z|^2` has sixteen-dimensional
energies `2 sqrt(beta) r (n+8)`; the first permitted level is `n=m+1`.
At `beta=1/4` this recovers the manuscript's `r(m+9)` convention.
Combining A and B, by ordinary subtraction of finite core integrals, gives

```math
q(\Psi)\ge(1/2-\beta)T+
 [\sqrt\beta\,(m+9)-8\sqrt3]J.
```

Only the **one fixed direction** oscillator estimate is needed: gauge invariance already
identifies its density moment with the spherical average. This removes the need to
construct a separate rotated oscillator family for this step. It does not remove the
actual Spin(9)/Spin(8) action and exclusion obligations underlying that one-color estimate.

For `beta=49/100`, `m=11`, the kinetic coefficient is `1/100` and the radial coefficient
is `14-8 sqrt(3)`, approximately `0.14359353944898245`. Positivity is exact because
`14^2=196>192=(8 sqrt(3))^2`. The proposed threshold `lambda_2>17` still depends on
the actual fermionic weight bound `M<=6`, branching, and a nonempty sector; none is admitted here.

## 5. Reproduction and diagnostics

From the repository root, with Python 3 and NumPy:

```sh
python contributions/bfss-kotler/tools/audit_spectral_confinement_ab.py
```

The recorded run used Python 3.12.14 and NumPy 2.3.5. The script refuses any mismatch
in six original-source Git blob pins and records its own SHA-256. Its reader decodes
the actual literal gamma permutation/sign tables, rather than a recalled Pauli-word family.
The coefficient checks and Gram checks use integers. Floating-point diagnostics use
explicit tolerances; numerical values can vary slightly between BLAS/LAPACK implementations.

| Check | Recorded outcome and interpretation |
|---|---|
| Actual gamma symmetry / Clifford | 9 / 81 exact matrix equalities pass |
| Ordered multiplication remainder | 243 exact coefficient-block equalities pass; no theta reordering assumed |
| 27 coefficient matrices for `K/sqrt(2)` | Full 729-entry Gram matrix is exactly `32 I` |
| 48-by-48 samples | 71 configurations: zero, rank one including oblique, rank two, rank three, unequal singular values, near valley, 64 seeded integer matrices; conservative bound passes |
| Actual paired-label packing | Explicit `2(3j+a)+r` permutation and spectral comparison pass; the old theta-label equivalence is not assumed |
| Small CAR coefficient fixture | 12 six-generator skew matrices on an 8-dimensional module; direct quadratic matrix norm agrees with the one-quarter singular-value sum to less than `1e-10`; this is only a coefficient diagnostic |
| Bad CAR substitution | Factor-two mistake is detected on the rank-one configuration: it would exceed the proposed conservative constant |
| Sphere quadrature | Six rank/anisotropy cases with normalized `320 x 512` midpoint rule; rank-one ratio `1/2`, isotropic ratio `1/sqrt(3)` |
| Optional H2 formula | On 71 samples, maximum absolute discrepancy approximately `4.55e-13`; no proof or sharper-constant admission, and H1 does not depend on it |

The script's process exit zero means these diagnostics completed; its receipt says
`DIAGNOSTICS_PASS_NOT_FORMAL_ACCEPTANCE`. No CI workflow or Lean source was changed,
no Lean gate was dispatched, and accepted-root counts do not increase.

## 6. Lead decision and next bounded obligation

**Proceed to a small formalization design, retain H1 provisionally, hold source confinement.**
The finite norm argument and sphere-average lemma are worth formalizing independently:
neither requires completing the F10DW differential-comparison program or assuming a
global physical Spin(9) lift. Inventory pinned Mathlib's real skew normal-form/operator
norm infrastructure before writing a CAR gate; do not hide a missing normal-form theorem
as an instantiated physical premise. The sphere proof can be staged as weighted finite
Cauchy–Schwarz, a normalized sphere-coordinate integral, then the density/Tonelli lemma.
Reuse `invariantCore_norm_gauge` rather than rebuilding gauge covariance.

The **next decisive analytical risk** is Gate C: does the actual source full-space
Spin(9) action yield the stated stabilizer action, `M<=6`, and one-color low-level
exclusion on a nonzero physical high-weight sector? Do not promote a first-coordinate
count or F10DW's identity differentiability into that group action. Keep the exact
original charge-to-form identity, form closure/reducing-sector bridge and adversarial
fixed-sector escape test visible as separate obligations. No compactness or spectral
existence conclusion follows from this mini-audit.
