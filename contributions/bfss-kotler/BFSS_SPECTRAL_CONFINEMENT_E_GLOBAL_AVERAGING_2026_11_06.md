# Global full-space averaging and the conditional closed-form bridge

**Status: conditional analytical proof and finite diagnostics; zero new Lean acceptance.**
Prepared with Codex on `research/bfss-spectral-confinement-roadmap-20261106`.
Baseline: `834ee74907dc633fbfd4b9a7a0fb65f36acfc51c`.
This record does not construct the missing source Spin(9) action, admit the source core-form
identity, identify closed operators, certify independent human review, or publish a spectral claim.
The [A/B](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md),
[C](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md), and
[D/source-lift](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md) records remain unchanged.

**Lead finding.** For the conservative H1 route, average the rotated **one-color scalar
inequality**, not the state's density. Its full-space extension needs no gauge invariance.
This yields a global Cartesian estimate with the existing threshold. No moving-frame,
Berry-term or IMS estimate is needed for this route. The D frozen-channel analysis remains
a useful adverse check; its larger frozen gap is not substituted into the full operator.

## 1. Exact statement and source obligations

Use the actual source 48-Majorana Fock space, actual nine gamma matrices, normalized
Pauli colors and original charges. On the smooth compact full-space core, write

```math
T(f)=\int\|\nabla f\|^2,\quad
W(f)=\int V(X)\|f(X)\|^2,\quad
J(f)=\int\|X\|_F\|f(X)\|^2.
```

The analytical implication below retains these premises explicitly:

| Premise | Required source meaning; current limit |
|---|---|
| **P1: actual full-space action** | The literal original Spin(9) action on the actual Fock module and bosonic coordinates, with the stated gamma covariance and Spin(8) restriction/weight normalization. C's canonical-action argument supports it analytically; its source lift/binding is still unqualified. |
| **P2: actual core form** | On **all** original smooth compact states, `q=(1/2)T+W+integral <f,Bf>`, with `V=sum_(a<b) |x^a wedge x^b|^2`, original ordered theta products and `||B(X)||<=8sqrt(3)||X||_F`. The full exact source identity is not inferred merely from A/B's finite coefficient checks. |
| **P3: closed physical interpretation** | The original gauge action, physical smooth core, Spin(9) core/form covariance and reducing-sector projection, and the actual normalized source Hamiltonian as the associated operator of **that same** closed form on its correct domain. Separate from the manuscript's independent abstract module. |

Under P1/P2, for a full-space smooth compact state of Spin(9) type `lambda` satisfying
`lambda_2>m+6`, `m` a nonnegative integer and `0<beta<1/2`, the claimed implication is

```math
q(f)\ge(1/2-\beta)T(f)
 +[\sqrt\beta\,(m+9)-8\sqrt3]J(f).
```

This is a full-space statement. P3 is additionally required to interpret the closed
physical-sector and spectral consequences. None of P1–P3 is introduced as a new axiom
or represented as a newly qualified Lean theorem.

## 2. The one-color estimate extends to the full space

The C slice argument uses a Spin(9) isotypic vector's finite-dimensional cyclic span,
pointwise restriction of smooth representatives, B4-to-D4 branching and the full
fermionic weight bound. It does **not** use gauge invariance. On the full-space isotypic
subspace its orbit span is still finite, of dimension at most `(dim V_lambda)^2`.
Restriction at fixed one-color parameters remains an equivariant map for the stabilizer.
Every image type has `nu_1>=lambda_2`; oscillator level `n` tensored with all fermions
has `nu_1<=n+6`. Therefore the levels `n<=m` vanish by the same argument.

At fixed `u=x^1`, decompose the two other nine-vectors into longitudinal scalars and
transverse vectors `z` in `(u^perp)^2`. The transverse potential is bounded below by
`|u|^2 |z|^2`, and the transverse kinetic energy uses only a subset of the full gradient.
Fubini with fixed-`u` orthogonal frames gives on the **full** smooth isotypic core

```math
A_\beta(f):=\beta T(f)+W(f)
 \ge\kappa I(e_1;f),\qquad
\kappa=2\sqrt\beta\,(m+9),
\quad I(v;f)=\int\|v^TX\|_2\|f(X)\|^2dX.
```

No frame is differentiated with respect to `u`. The zero set `u=0` has measure zero.
The oscillator is sixteen-dimensional, with energies `2sqrt(beta)|u|(n+8)`; excluding
through `m` leaves the coefficient `m+9`, not `m+8`.

## 3. Rotate the estimate; do not assume the density is invariant

For `O in SO(3)`, define the auxiliary bosonic-only pullback

```math
(C_Of)(X)=f(O^{-1}X).
```

This is an auxiliary transformation of the same full-space core. It is not declared to
be the original gauge action; it leaves the Fock value unchanged and generally does
not preserve physical gauge invariance. The needed properties are:

1. It preserves smoothness, compact support, L2 norm and `T`, because the 27-dimensional
   coordinate change is orthogonal and volume preserving.
2. It preserves `W`. With `G=XX^T`,
   `V(X)=((tr G)^2-tr(G^2))/2`; color conjugation `G -> OGO^T` preserves this value.
3. It commutes with the full spatial/Fock Spin(9) action. With rows as color vectors,
   `D_g f(X)=U_g f(XR_g)`. Both compositions give `U_g f(O^{-1}XR_g)`.
   Thus `C_O` preserves the full-space Spin(9) type, with no gauge/Fock commutation
   theorem needed for this auxiliary transformation.

Applying section 2 to `C_Of` and changing variables gives

```math
A_\beta(f)=A_\beta(C_Of)
 \ge\kappa I(O^Te_1;f).
```

Every unit color direction is `O^T e_1` for some proper rotation. Average these inequalities
over normalized sphere probability. Tonelli and the sharp A/B geometric lemma give

```math
A_\beta(f)\ge\kappa\int_{S^2}I(v;f)d\sigma(v)
 =\kappa\int F(X)\|f(X)\|^2dX
 \ge\frac\kappa2 J(f).
```

All core integrals are finite. No measurable choice of `O(v)` is needed: the inequality
holds for each `v`, and its right side is the measurable directional integral itself.
The numbers `I(v;f)` need not be equal. For example a unit mass at the rank-one matrix
`X=e_1 e_1^T` has `I(e_1)=1`, `I(e_2)=0`, and sphere average `1/2`. This is a measure
fixture, not a high-type wavefunction or a counterexample to coercivity.

**Critical boundary:** only the scalar form `A_beta` is rotated. The full `q`, including
`B(X)`, is generally not invariant under bosonic-only color pullback. The diagnostic
checks a noninvariance fixture for the actual skew coefficients. The fermionic estimate
is applied at the original state, after scalar averaging:

```math
q(f)\ge(1/2-\beta)T(f)+A_\beta(f)-8\sqrt3J(f).
```

This proves the conditional implication in section 1. A/B's gauge-density argument
remains a valid sufficient special-case proof; the full-space extension supplies a
different proof requiring less state invariance. It does not alter the source model.

## 4. A uniform conservative bound and exact rational corollary

For `beta=49/100`, `m=11`, `lambda_2>17`, one has `kappa=28`, and

```math
q(f)\ge\frac1{100}T(f)+(14-8\sqrt3)J(f)
 \ge\frac1{100}T(f)+\frac17 J(f).
```

The second coefficient is a convenient separate corollary; the original exact H1
coefficient is unchanged. Its rational certificate is
`(14-1/7)^2=9409/49>9408/49=192=(8sqrt(3))^2`, with positive sides.
Thus `14-8sqrt(3)>1/7` exactly, without a floating-point positivity test.

For any normalized core state in this same sector supported in `r>=R`,
`q(f)>=R/7`. More generally, at form energy at most `E`, the estimate gives

```math
T(f)\le100E,\quad J(f)\le7E,\quad
\int_{r>R}\|f\|^2\le\frac{7E}{R}.
```

These are global Cartesian estimates, uniform near and away from every rank-one valley,
conditional on P1/P2. The support version excludes a bounded-energy escaping core
sequence with radii tending to infinity in this fixed type under those premises.
The tail bound is stronger for compactness than merely excluding annular supports.
It is not an acceptance of global escape exclusion for the unqualified source realization.

The D moving-frame comparison is therefore unnecessary for **conservative H1**.
It remains an optional route for sharper thresholds or frozen-channel analysis; no
new `lambda_2>2` or `lambda_2>6` result is admitted and the optional-H4 ordering is unchanged.

## 5. Closure and compactness need only the linear moment

Assume P3 provides a form core inside the actual physical type. For a form-norm
approximating core sequence `f_n`, apply the estimate also to `f_n-f_k`, which remains
in the same linear type and physical core. Both `grad f_n` and `sqrt(r) f_n` are Cauchy
in L2. The distributional gradient is closed, and multiplication by `sqrt(r)` is closed
(identify its limit first on bounded balls). The limits are the actual gradient and
weighted function of the L2 limit `f`. Passing to limits extends the **same** inequality
to the actual closed restricted form domain, not to an independently chosen operator domain.

For a bounded form-norm family, finite-dimensional Fock-valued local Rellich compactness
applies on every ball. The tail mass bound `7E/R` is uniform. Select a diagonal locally
convergent subsequence and use that tail bound to make it globally L2 Cauchy. The
embedding of the restricted form domain into the physical-sector Hilbert space is compact.
The associated self-adjoint sector operator consequently has compact resolvent.

**Source reuse boundary.** These existing files were inspected at the baseline:

| Source below `lean/OAI/MathematicalPhysics/BFSS/` | Git blob | Useful interface / limitation |
|---|---|---|
| `RellichCompactness.lean` | `d7641afe2857b7d253d225a510e142e5af1fbc7f` | Finite-dimensional vector-valued local Rellich machinery |
| `WeightedCompactness.lean` | `368cdf0386dfa39e4be2af08300ef7f8bdf481bb` | `bump_family_totallyBounded`, `totallyBounded_of_eventual_approximation`, and quadratic-moment bump/tightness estimates |
| `FormClosure.lean` | `2f82213fed6d6d2c27c188cca941b29334488258` | Graph/weighted-closure and core approximation infrastructure |
| `FormCompactness.lean` | `f0264994e3a212011316206f74287aac8e32e99a` | `core_moment_totallyBounded` uses a **quadratic** radius moment; `weightedClosure_totallyBounded` assumes `c||x||^2<=w(x)^2` |

With our controlled weight `w=sqrt(r)`, that last hypothesis would require `c r^2<=r`
for every radius. It fails for any `c>0` when `r>1/c`. Do not instantiate that theorem
by silently upgrading the linear moment to a quadratic one. Source presence is an
interface inventory, not fresh strict qualification of these modules or a new result.

An explicit functional-analytic countercheck: take a normalized symmetric smooth bump
`h` supported in the unit ball and, for `R>2`, set
`f_R=sqrt(1-1/R) h + R^(-1/2) h(.-R e_1)`. Supports are disjoint. Its H1 norm is fixed,
its first moment is at most `m_1(h)+1`, but its second moment is `m_2(h)+R`.
This is a Sobolev/moment fixture, not a physical BFSS escape state or a bounded-`q` example.

The exact small formal additions to design are instead:

- A linear version of `compactLp_bump_error`: `R * dist(f,chi_R f)^2 <= integral r||f||^2`.
  The existing pointwise bump proof adapts with `R<=r` outside the inner ball.
- Linear-moment tightness from local total boundedness. Use
  `totallyBounded_of_eventual_approximation` and `bump_family_totallyBounded`, with
  `R=(C+1)/epsilon^2` for a uniform first-moment bound `C`. No quadratic-moment premise.

These are precise analysis lemmas, not replacements for P1–P3. They require their own
fresh source/consumer and axiom gate before formal reuse.

## 6. Conditional physical spectral consequence and admission boundary

Under P1–P3, the source charge covariance preserves the core form and extends to its
closure. The character projection onto a fixed type is bounded in form norm; its
compact-group integral maps the physical smooth compact core into itself. Projecting
core approximations makes that projected core a form core. Closed-form invariance gives
resolvent commutation, so the sector reduces the **same** source physical Hamiltonian.
These steps must be proved at the literal source interfaces; they are not inferred
from identity differentiability of F10BC.

C's adapted gauge-invariant vacuum and `P^9` radial family make the candidate sector
`lambda=(24,18,0,0)` infinite dimensional under the actual action/binding premises.
Nonnegative self-adjoint compact-resolvent theory then gives infinitely many domain-qualified
positive eigenvalues tending to infinity. No separate kernel-triviality gate is needed
for that conclusion. Reduction identifies them as eigenpairs of the full **same** source
physical Hamiltonian; it does not assert a positive gap in its entire spectrum.

This is the conditional closed-form/spectral implication, not acceptance that its
source premises are discharged. A direct proof on the original Fock/core/Hamiltonian
interfaces does not need an additional comparison with the manuscript's independent
abstract Clifford module. If that second model is used, its exact unitary/domain bridge
remains mandatory. No existing conditional transport theorem supplies missing eigenpairs.

**Lead decision.** Keep H1 and the explicit candidate type. Prefer the global full-space
directional estimate for its conservative proof. Preserve the linear/quadratic moment
signature mismatch as negative knowledge, and qualify the two linear-tail lemmas only
under their actual statements. The dominant source obligations remain P1 (the global
action/lift binding), P2 (the exact original core identity), and P3 (physical reduction
and closed-source Hamiltonian interpretation). No original branch, upstream PR, Lean
source, workflow or guarded-cache contract is modified by this analytical record.

## 7. Reproduction and scope of the finite checks

```sh
python contributions/bfss-kotler/tools/audit_spectral_confinement_e.py
```

The [receipt](evidence/spectral-confinement-2026-11-06/e-diagnostic-receipt.json) binds
seventeen source/reader pins and the script hash. Integer checks cover twenty matrices,
four rational proper color rotations, three rational spatial rotations, the scalar
potential/kinetic coordinate identities, and literal space/color coordinate transport.
Fraction arithmetic checks the exact coercivity constants and linear-tail bounds.
It includes controls against assuming either density invariance, full-q bosonic-only
rotation invariance, or a quadratic moment. It does not generate arbitrary trial-state
energies and label them as a test of high-type coercivity. No Lean compilation or new
root acceptance is represented by exit zero.
