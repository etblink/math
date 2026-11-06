# Gate C analytical audit — weight six, explicit sectors, and the source-lift hold

**Status: analytical argument and exact finite diagnostics; original-source Gate C remains OPEN.**
Zero new Lean roots, no independent human review, and no confinement or spectral acceptance.
Prepared with Codex on `research/bfss-spectral-confinement-roadmap-20261106`.
Baseline: `1895d7891589aa171295998062a0d395c76a1101`; the [A/B audit](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md)
and all inherited Lean sources/workflows remain unchanged.

The question is whether the proposed `M<=6`, oscillator exclusion and nonempty-sector
construction survive a normalization-aware analytical check. The finite algebra and
canonical continuous-lift argument survive. A specific sector can replace the roadmap's
unspecified fermion highest vector. **This is not an acceptance of the actual source
global representation, which still needs its own exact construction and binding.**

## 1. Source inventory and the exact remaining bridge

The original [evergreen guide](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/handoffs/FCP_PROJECT_LEAD_EVERGREEN_RESEARCH_GUIDANCE_0_1_0.md)
remains the decision standard. The [roadmap](BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md)
and [current handoff](FCP_K1D18_PROJECT_LEAD_CURRENT_STATE_HANDOFF_2026_11_02.md) are scoped records, not replacements for it.

The C diagnostic pins the six original files from A/B, the unchanged A/B reader,
and these five source files below `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/`:

| Source | Exact Git blob | What its interface supplies |
|---|---|---|
| `SU2BFSSPairedSpin9V10HF10AVOriginalGammaCoordinateLinearMapSkewImage.lean` | `bc895ed60f03a3e2091ff11ebd0b87e456f4408c` | Literal quarter-sum gamma lift on spatial matrices |
| `SU2BFSSPairedSpin9V10HF10BBOriginalGammaCanonicalSkewLieHom.lean` | `cbf92737d81c5e69efc2fa85735d6af239540070` | Same lift packaged as the source-native skew Lie homomorphism |
| `SU2BFSSPairedSpin9V10HF10BCSourceSpinGammaSpecialOrthogonalHom.lean` | `7798089cb8ac4ec4fffc3ead4caa474def81b3f8` | Literal algebraic original-gamma Spin(9) to SO(16) map |
| `SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean` | `75a679f2a1435d747e219617feea266b4508c53d` | Same action on the actual paired 48 labels, valued in SO(48) |
| `SU2BFSSPairedSpin9V10HF10DWNativeRepresentationDifferentiability.lean` | `8542aedf65081043c1ce0e1d7c8255bd5e275995` | Accepted native differentiability at identity; not the global physical Fock action |

F10BB's `coordinateToOriginalGammaSkewLieHom` supplies the algebraic infinitesimal map.
Its F10AV formula is `(1/4) sum_(r,s) A_rs gamma_r gamma_s`; on the oriented spatial
plane `E_rs-E_sr` this is `(1/2) gamma_r gamma_s`, not `gamma_r gamma_s`.
All four Cartan-plane specializations are independently checked by exact integer contraction.
The full intrinsic comparison with F10BC remains outside the accepted F10DW conclusion.

The separate package at `fa00aa36e770ca516f57b41f5b02229a5033d50f`, identified in the A/B
audit, contains source gauge/Fock implementation infrastructure. In particular,
`SU2BFSSPhysicalDomainS1V52L9E5F14OriginalNativeSixteenSpin48FockRepresentationHomProbe.lean`
has **domain `GaugeGroup 2`**. Its sixteen-block gauge construction is not already
a Spin(9)-domain Fock homomorphism. The source module name must not be used to erase this distinction.

For the standard compact simply connected Spin(9), the three-copy real spinor map
to SO(48) lifts continuously to Spin(48). The actual CAR module then implements that
lift. This is the canonical model used in the analytical calculation below. To admit
it for the source program, construct the corresponding map on the literal source group,
bind its underlying paired-label action to F10R, bind its Fock implementation to the
original theta operators and its gauge action to `pairedGaugeData`, and prove the needed
continuity/core covariance. Neither character arithmetic nor F10DW alone discharges those obligations.

## 2. Normalization: why the fermion bound is six

Take spatial Cartan planes `(1,2),(3,4),(5,6),(7,8)` inside the Spin(8) stabilizer
of `e_9`, with vector generators `J_rs=E_rs-E_sr`. In the real spinor carrier set

```math
A_j=\frac12\gamma_{2j-1}\gamma_{2j},\qquad
A_j^2=-I/4.
```

The four `A_j` commute. On the complexified 16-real label space their joint weights
are all sixteen `(s_1/2,s_2/2,s_3/2,s_4/2)`, `s_j=+/-1`, each once.
The diagnostic proves this directly from the pinned gamma arrays using the sixteen
joint projectors

```math
\Pi_s=2^{-4}\prod_{j=1}^4
 (I-i s_j\gamma_{2j-1}\gamma_{2j}).
```

It checks completeness, trace/rank one, idempotence, and all 64 Cartan eigenvalue
identities by Gaussian-integer matrix arithmetic, with no numerical eigenvalue solver.
The real 48-label generator consists of three copies of `A_j`: 24 real rotation planes
of frequency `1/2`. Twelve exact spin/gauge generator commutators vanish before and
after the original paired-label permutation `ell(alpha,a)=2(3 floor(alpha/2)+a)+(alpha mod 2)`.

For any real skew label generator `A`, its CAR implementer is

```math
L(A)=\frac12\sum_{p,q}A_{pq}\theta_p\theta_q,
\qquad [L(A),\theta(w)]=\theta(Aw),
\qquad H(A)=-iL(A).
```

The source CAR is `{theta_p,theta_q}=delta_pq`, so a real plane of frequency `a`
contributes weights `+/-a/2` to `H(A)`. Here each contribution is `+/-1/4`.
It follows that every first-coordinate Fock weight lies in `[-6,6]`:

```math
M=24\cdot\frac14=6.
```

Using normalized Clifford generators in place of theta without adjusting the quadratic
coefficient, or using `gamma_r gamma_s` in place of its half, would double this bound.
The latter generator has square `-I`, contradicting the pinned label-generator normalization.
The weight bound applies to the **full** Fock module, hence also to the gauge-invariant
part; restriction to one fermion-parity subspace is not made.

## 3. A concrete gauge-invariant highest vector in the same CAR space

Choose the complex polarization in which all eight spinor weights have positive first
coordinate. Write them as `w_s=(1,s_2,s_3,s_4)/2`; each has three color copies.
Form the corresponding annihilators as complex linear combinations of the **actual**
theta operators. This selects a state/polarization in the original irreducible CAR
module; it does not replace the original module or assert that its older paired vacuum is this vector.

The annihilators satisfy ordinary 24-mode CAR. Occupation lowering produces a nonzero
common vacuum, and irreducibility makes its common kernel a single line. Its maximal
first-coordinate weight is `24/4=6`; the other coordinates sum to zero. Thus

```math
\mu=(6,0,0,0)
```

has multiplicity one in the full Fock character. Every positive B4 root has nonnegative
first coordinate. Adding a root with positive first coordinate exceeds six; adding a
root with zero first coordinate would require another weight on the first-coordinate-six
face, which does not exist. The vacuum is therefore a highest vector of this dominant weight.

Color rotations preserve this polarization: they mix only the three color copies of
each spinor eigenspace. The source gauge unitaries preserve the common annihilator
line. Their action there is a continuous character of SU(2), hence trivial. The vector
is gauge invariant. This argument also rules out an undischarged arbitrary vacuum phase.
For a global canonical Spin(9) action, commutation with gauge follows in the same
source-exact way: commuting label actions give a scalar implementer commutator by
CAR irreducibility, and the resulting continuous SU(2) character is trivial.

The full exact character calculation is an independent check, not a prerequisite for
this vacuum argument. For each `s=(1,+/-1,+/-1,+/-1)` use the color exterior factor

```math
(1+z^{-3s/2})+(z^{-s/2}+z^{-s})(t^{-1}+1+t).
```

Multiply the eight factors with vacuum shift `z^(6,0,0,0)`; the exponent of `t` is
the integer gauge weight. The gauge-singlet character is the coefficient at `t^0`
minus that at `t^1`. Integer dynamic programming gives:

| Exact character check | Outcome in the canonical continuous-lift model |
|---|---|
| Full Fock dimension | `2^24=16,777,216` |
| Gauge-singlet dimension | `366,080` |
| Independent dimension formula | `2^8 [binom(16,8)-binom(16,9)]=366,080` |
| First-coordinate-six face | Only `(6,0,0,0)`, multiplicity one |
| Spin(9) component of that highest weight | Dimension `2,508`, multiplicity one |
| Complete gauge-singlet character | 32 distinct highest weights; exact Weyl-numerator reconstruction and dimension sum pass |
| Joint Spin(9)/SU(2) scalar singlet | Multiplicity one |

**Prior-work control.** After this calculation, a primary-source check found agreement
with Michishita, [arXiv:1009.3256v2](https://arxiv.org/abs/1009.3256v2),
*J. Math. Phys.* **51**, 122309 (2010), [DOI 10.1063/1.3527280](https://doi.org/10.1063/1.3527280).
Equation (2.19) gives 183,040 states in each parity at gauge spin zero, and the discussion
identifies the unique joint singlet. These are checks of known finite-fermion structure,
not a new discovery or a source-operator theorem. No claim is made that every table row
was independently transcribed or externally compared. The local 32-component list is generated by the diagnostic.

## 4. Explicit physical polynomial family

Use `w_1=e_1+i e_2`, `w_2=e_3+i e_4`, the bilinear spatial dot product, and
`zeta_a=w_1 dot x^a`, `eta_a=w_2 dot x^a`. The roadmap polynomial is

```math
P(X)=\sum_{a<b}(\zeta_a\eta_b-\zeta_b\eta_a)^2
 =(\zeta\cdot\zeta)(\eta\cdot\eta)-(\zeta\cdot\eta)^2.
```

The last equality is an exact identity in six commuting indeterminates, checked by
sparse integer polynomial expansion. It proves color-orthogonal invariance, including
the actual adjoint gauge action. No complex conjugate is inserted into these bilinear products.

The bivector `w_1 wedge w_2` has weight `(1,1,0,0)` and is killed by all positive
root operators. The diagnostic checks this using all sixteen positive B4 root matrices
`T(w_i,w_j)`, `T(w_i,bar(w_j))` for `i<j`, and `T(w_i,e_9)`, where
`T(u,v)=u v^T-v u^T`. Its four Cartan identities are also exact. Under spatial pullback,
`w -> (w dot x^a)` intertwines the vector representation with linear polynomials.
Consequently `P` is highest of weight `(2,2,0,0)` and `P^k` of weight `(2k,2k,0,0)`.

Let `v` be the adapted vacuum from section 3 and choose nonzero
`chi in C_c^infinity((0,infinity))`. Then

```math
\Psi_\chi(X)=\chi(\|X\|_F)P(X)^9v
```

is smooth and compactly supported away from the origin, and obeys the original
pointwise gauge covariance because both scalar factors are gauge invariant and `v`
is gauge fixed. At `X=(t e_1,t e_3,0)`, `P=t^4` and `||X||=sqrt(2)t`; a shell on which
`chi` is nonzero therefore contains an open set where the state is nonzero.
Under the canonical Spin(9) action it is highest of

```math
\lambda=(24,18,0,0).
```

Radial cutoffs with pairwise disjoint supports give infinitely many independent
smooth-core vectors in this same type. A highest vector in the finite polynomial-times-
fermion representation has only its stated highest-weight isotypic component, even
if that type has multiplicity. This establishes the analytical nonempty-sector route
under the canonical action. Binding that type to the actual source global action is still required.

## 5. Restriction and oscillator exclusion: audit the whole implication

For B4 highest weight `lambda` restricted to the D4 stabilizer, the needed inequality
is `nu_1>=lambda_2`. Integral and half-integral coordinates must remain on the same lattice.
The manuscript's character proof extracts the coefficient at `t=nu+(3,2,1,0)` as

```math
\det\left(\mathbf1_{\{|t_i|\le L_j\}}\right),
\qquad L_j=\lambda_j+4-j.
```

The `L_j` strictly decrease, and regular D4 dominance makes the `|t_i|` strictly
decrease. Each row is a prefix of ones. A nonzero determinant needs four distinct
nonzero prefix lengths; they must be `1,2,3,4`. The first row then implies
`nu_1>lambda_2-1`. The equal coordinate lattice makes the difference integral, giving
`nu_1>=lambda_2`. A mixed integral/half-integral lattice has zero coefficient.
The finite diagnostic checks 2,967 compatible-lattice pairs, including both signs of
the fourth D4 coordinate, against the full interlacing rule; 540 have nonzero multiplicity.
This is an exact bounded diagnostic, not an exhaustive proof for all highest weights.

For a smooth vector in one fixed Spin(9) isotypic subspace, its cyclic span is finite:
in `V_lambda tensor multiplicitySpace`, a single vector uses at most `dim V_lambda`
coefficient vectors, hence its orbit span has dimension at most `(dim V_lambda)^2`.
All its representatives are smooth; equality in L2 implies pointwise equality by
continuity. Restriction at fixed one-color slice parameters is therefore a well-defined
equivariant map of this finite span for the Spin(8) stabilizer, rather than an undefined
point evaluation of an arbitrary L2 representative.

The sixteen transverse coordinates form two vector copies of Spin(8). Oscillator level
`n` consists of an invariant Gaussian times degree-at-most-`n` polynomials; every first
weight is at most `n`. Tensoring with the full fermion module gives an upper bound
`nu_1<=n+6`. Its oscillator projector commutes with the stabilizer. The slice can only
have `nu_1>=18`, whereas levels `n<=11` have `nu_1<=17`; thus those levels vanish.
At `lambda_2=17`, these bounds alone do not exclude level eleven. This explains the
strict inequality without advertising an actual counterexample state at the boundary.

The first unexcluded level is twelve, with energy
`2 sqrt(beta) r (12+8)`. Combined **conditionally** with the A/B source form and density
bridges, `beta=49/100` yields the same `14-8 sqrt(3)` radial margin. This argument has
not been extended or admitted on the original closed-form domain.

## 6. Receipt, scope and next decision

Reproduce from the repository root with Python 3 and NumPy:

```sh
python contributions/bfss-kotler/tools/audit_spectral_confinement_c.py
```

The [receipt](evidence/spectral-confinement-2026-11-06/c-diagnostic-receipt.json)
records twelve source/reader pins, script SHA-256, environment, projectors, character
components, branching count and polynomial controls. All mathematical checks in this
C diagnostic use integer/rational arithmetic, including Gaussian integers represented
as separate real/imaginary integer matrices. The full Fock matrices are never allocated.
Source pins fail closed; code success is explicitly not source Gate C acceptance.

| Obligation | Current evidentiary status |
|---|---|
| Half-gamma label normalization, weight-six count | Analytical derivation; exact gamma/projector diagnostics pass |
| Gauge-invariant adapted vacuum | CAR/covariance/character-triviality analytical argument; exact character check supports it |
| Explicit `lambda=(24,18,0,0)` family | Analytical construction and exact finite root/polynomial checks |
| General restriction and one-color exclusion | Analytical argument and bounded branching diagnostics; no new Lean theorem |
| Canonical lift equals literal source global action | **OPEN source construction/binding obligation** |
| Original core-form identity, closed forms, reducing sectors | **OPEN**; not supplied by the finite character computation |
| Fixed-sector escape test and actual compactness/spectrum | **OPEN** |

**Lead decision:** retain H1 and this explicit sector as analytical candidates. Do not
spend another gate merely recounting rotation planes or refining the already sufficient
finite constants. The next source task should isolate the original Spin(9)-domain
continuous Fock lift and its gauge/core binding; preserve every premise if only a
conditional interface is possible. A separate high-information mathematical task is the
Gate D escape test in this exact sector and source form. No original research branch,
upstream PR, Lean source, workflow or guarded-cache object is changed by this record.
