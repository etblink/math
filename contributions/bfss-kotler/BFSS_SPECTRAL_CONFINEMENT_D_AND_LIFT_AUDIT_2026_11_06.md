# Frozen-valley escape test and exact source-lift obstruction

**Status: analytical/finite diagnostic record; global escape question and source lift remain OPEN.**
Zero new Lean roots, no new confinement/compactness/spectral result, and no independent human review.
Prepared with Codex on `research/bfss-spectral-confinement-roadmap-20261106`.
Baseline: `dd2cbe02ea96c1e301dcb4de3d50efaba792102d`.
The [A/B](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md) and
[C](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md) records remain unchanged.

Two concrete outcomes: a proposed direct unital Clifford-map shortcut is rejected by
the accepted source central action; the ordinary cancelling valley ground channel cannot
carry the candidate `lambda=(24,18,0,0)` in the canonical-action model. Neither outcome
constructs the missing source lift or excludes all escaping states of the full Hamiltonian.

## 1. Central sign: a shortcut that cannot work

Let `z_9=source9NegativeCentral`, with underlying Clifford value `-1`. Accepted F10U gives

```math
R_{48}(z_9)=-I_{48}.
```

Exact source: `SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.lean`,
blob `353978608b978b00d0e36deb1c1a47c32641ea59`, declaration
`FCP.BFSSPairedSpin9Clifford.source9NegativeCentral_originalPairedSO48_image`.
The [F10U acceptance record](FCP_K1D18V10H_F10U_ACCEPTANCE_AND_F10V_CENTRAL_INVOLUTION_SIGN_CANDIDATE_2026_11_01.md)
binds this to strict run 41309779978. This audit does not recount those accepted roots.

Suppose one tries to construct the required lift by restricting a unital real algebra map
`F:Cl_9 -> Cl_48` to the source spin group. Necessarily `F(-1)=-1`. In the target spin
group, scalar `-1` acts trivially on vector labels:

```math
(-1)\,\iota(v)\,(-1)^{-1}=\iota(v).
```

Thus the induced target vector action at `z_9` would be `+I_48`, contradicting F10U.
The matrix discrepancy has exact Hilbert–Schmidt square `192`. This is an obstruction
to this **specific restriction-of-unital-algebra-map construction**, not to a group lift.
The same scalar argument excludes using a unital `Cl_9 -> End(Fock)` map to implement
the desired conjugation on all 48 theta generators: its scalar image commutes with them,
whereas the source negative central action must negate them. Dropping half the Fock
space does not solve the original problem because the actual theta operators act on the full module.

A genuine group lift can instead send `z_9` to one of the target lifts of `-I_48`,
represented in the classical positive Clifford algebra by the two signs of the even
48-volume element. They square to one and act by vector negation. The precise sign/phase
must be fixed by the actual continuous lift and the original source conventions, not guessed.
The legitimate **target** `Cl_48 -> Fock` universal map remains useful after a group lift
has been constructed; it is not the rejected source `Cl_9` shortcut.

## 2. The source-lift task is now specific

Source files below `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/` inspected and pinned:

| Interface | Exact Git blob | Interpretation |
|---|---|---|
| F10BE `SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity.lean` | `db887aa6e495eb2a74c2e826018ffb5453158806` | `source9SpinGammaSpecialOrthogonalHom_continuous_pbw` supplies actual SO(16) continuity in the named source topology |
| V7Z `SU2BFSSPhysicalDomainS1V52K1D18V7ZOriginalSpinQuotientNativeEuclideanDetOneEquivProbe.lean` | `371a7406509091917b523828613be415857b9965` | Actual Spin(48)/negative-center to native determinant-one Euclidean group **algebraic** equivalence; no topological covering is inferred |
| `SU2BFSSSource48FockCliffordUniversalLiftProbe.lean` | `f057756e42d30c8069a9c934001cf75c1e2d1ed2` | Local staged target-Clifford/Fock port; its header explicitly says it is not strict-qualified |

F10R supplies the exact paired-48 group action; its matrix entries are Kronecker/reindex
expressions in F10BE's continuous gamma action. This is the direct route to the needed
48-label continuity statement, with the source topology and label transport preserved.
Do not substitute the gauge-domain sixteen-block Fock homomorphism identified in C.

**Pinned Mathlib census.** At `d13f23b723b8a846827a245b89c10fc7d3f11612`, the following
primary source files were read:

| Mathlib source | Git blob | Relevant supplied API / limit |
|---|---|---|
| `LinearAlgebra/CliffordAlgebra/SpinGroup.lean` | `f06d1130ec5d8d4a552fdb9e670c650135e75f9c` | Algebraic spin definitions and vector-preserving conjugation; this file does not supply the needed simply-connectedness or covering theorem |
| `Topology/Covering/Basic.lean` | `c19662de3e595c9ce71ed4980b9b5d7fe3c51648` | General covering-map infrastructure |
| `Topology/Homotopy/Lifting.lean` | `f5a47dfa109fb307cf105a6bfef0da78a03d6d21` | `IsCoveringMap.existsUnique_continuousMap_lifts`, requiring a simply connected, locally path connected domain; also a fundamental-group range criterion |

The [pinned lifting source](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Homotopy/Lifting.lean)
already provides generic lift existence and uniqueness. No new generic lifting wrapper
is justified merely to hide missing source premises. The following are exact obligations:

1. Supply the actual source Spin(48)-to-native-SO(48) **topological covering**, in
   compatible named/native topologies. V7Z's algebraic quotient equivalence is insufficient.
2. Supply the actual source Spin(9) simply-connectedness and local path connectedness,
   or discharge the library's actual fundamental-group lifting criterion for F10R.
   A manifold atlas alone does not imply simply-connectedness. A bounded search of
   the tracked Kotler modules found no declaration discharging these endpoints; this
   is not a claim of absence from all mathematical libraries.
3. Lift the literal continuous F10R map through that cover, based at identity. Prove
   multiplicativity by uniqueness of lifts of `h -> R_48(gh)`, with equality at identity.
   Require its source-negative-central vector action to be exactly `-I_48`.
4. Compose the resulting **group** map with the genuine target-Clifford/Fock map,
   and prove unitarity, all original theta conjugations and the correct continuous
   phase. Integrating a Lie algebra map without its existence hypotheses is not an alternative proof.
5. Bind the original gauge action, smooth core, and actual sixteen-source-charge
   covariance. Closed-form reduction and operator domains remain later obligations.

This isolates the remaining mathematical inputs. The algebraic Clifford shortcut cannot
replace them, and a green generic theorem with these inputs as premises would not discharge them.

## 3. Test the channel where supersymmetric cancellation actually occurs

Freeze a rank-one background in an adapted color/spatial frame:
`x^3=r e_9`, `x^1=x^2=0`, with `r>0`. Let the sixteen transverse coordinates be
`y=(y^1,y^2) in (e_9^perp)^2`. Use the source conventions `f=sqrt(2) epsilon`,
`{theta,theta}=delta` and the A/B form normalization. The frozen leading operator is

```math
H_{\rm fast}=-\tfrac12\Delta_y+r^2|y|^2+B_0(r),
\qquad B_0(r)=i\sqrt2 r\sum_{\alpha,\beta}
 (\gamma_9)_{\alpha\beta}\theta^1_\alpha\theta^2_\beta.
```

This is a defined frozen transverse model, not an asserted equality to the full
moving-frame or gauge-reduced Hamiltonian. The actual pinned `gamma_9` is diagonal,
with eight eigenvalues of each sign; it commutes with all 28 Spin(8) bivector generators.
The actual 48-label skew coefficient has square `2r^2 diag(-I_32,0_16)`.

Set `c_alpha=(theta^1_alpha+i theta^2_alpha)/sqrt(2)`. Then
`i theta^1_alpha theta^2_alpha=N_alpha-1/2`. In a gamma eigenbasis,

```math
B_0(r)=\sqrt2 r\sum_\alpha\chi_\alpha(N_\alpha-1/2),
\qquad \chi_\alpha=\pm1.
```

The massive ground occupies the eight negative-chirality modes and none of the positive
ones. It is unique in the 32-real massive CAR factor, has residual color-SO(2) charge
zero, and energy `-8 sqrt(2) r`. Its line is preserved by Spin(8); a continuous character
of this connected semisimple group is trivial. It therefore contributes no stabilizer weight.

| Frozen factor | Lowest energy | Ground-state multiplicity |
|---|---|---|
| Sixteen transverse bosons | `+8 sqrt(2) r` | 1 |
| Thirty-two massive real fermions | `-8 sqrt(2) r` | 1 |
| Sixteen residual real fermions | 0 | 256 |
| Combined frozen channel | 0 | 256 |

Thus the zero-point cancellation is retained, not removed by a crude absolute-value
fermionic bound. The residual sixteen real fermions carry the single-color 256-state
Clifford module. The usual `44+84+128` Spin(9) decomposition is a known finite-fermion
fact; see Hoppe, Lundholm and Trzetrzelewski, [arXiv:0809.5270v2](https://arxiv.org/abs/0809.5270v2),
Introduction, published in *Nucl. Phys. B* **817** (2009), 155–166,
[DOI 10.1016/j.nuclphysb.2009.01.020](https://doi.org/10.1016/j.nuclphysb.2009.01.020).
This prior-work control is not a claim about full source eigenstate existence.

The independent integer character calculation gives its Spin(8) decomposition:

| Highest weight in orthogonal coordinates | Dimension |
|---|---|
| `(2,0,0,0)` | 35 |
| `(3/2,1/2,1/2,+/-1/2)` | 56 each |
| `(1,1,1,0)` | 56 |
| `(1,1,0,0)` | 28 |
| `(1,0,0,0)` | 8 |
| `(1/2,1/2,1/2,+/-1/2)` | 8 each |
| `(0,0,0,0)` | 1 |

These sum to 256; the full D4 Weyl-numerator identity also checks exactly.
The maximal first coordinate in the **zero fast-energy channel** is therefore two,
not the full three-color Fock bound six.

## 4. Why the ordinary valley ground channel misses this sector

Assume the canonical Spin(9)/Spin(8) action and the source binding required in C.
The restriction of `lambda=(24,18,0,0)` can only contain stabilizer types with
`nu_1>=18`. The zero fast channel has `nu_1<=2`. They cannot overlap.
Equivalently, sections of the valley ground-channel bundle can contain a Spin(9)
type only if its restriction shares a stabilizer type with that fiber. This fails
for the candidate. Residual gauge and Weyl projection may remove channels, but
cannot add missing stabilizer types when the actions commute.

Increasing the longitudinal spherical-harmonic degree is not a counterexample:
it can increase the first highest-weight coordinate indefinitely while the fiber
still restricts the second coordinate. The candidate uses a large **second** coordinate.

More generally let `n` be the transverse boson level and `k` the number of massive
fermion excitations above the filled ground, `0<=k<=16`. Their combined energy is

```math
E_{n,k}=\sqrt2 r(n+k).
```

Each massive quasiparticle has a spinor stabilizer weight. Their fixed-`k` first-coordinate
maximum is `min(k,16-k)/2`; the exact character calculation checks every `k`, with
degeneracy `binom(16,k)`. Adding the residual module and level-`n` bosons gives

```math
\nu_1\le n+2+\tfrac12\min(k,16-k)\le n+k+2.
```

Hence an eligible stabilizer type in the candidate requires `n+k>=16`.
On that part of the **frozen** model,

```math
H_{\rm fast}\ge16\sqrt2 r.
```

This rejects the ordinary cancelling ground-channel construction as an escape
mechanism for this sector. It is not a proof that every full-Hamiltonian escape
reduces to this model, and it is not a new global `lambda_2>2` confinement theorem.
The roadmap's conservative H1 threshold and optional-H4 ordering are unchanged.

## 5. Two controls on the adversarial search

**A separated trial family is an insufficient test.** If `v` is a fixed gauge-invariant
fermion vector, the expectation `X -> <v,B(X)v>` is a color-invariant linear function
of `X`. No nonzero such color-vector functional exists, so it vanishes. The family
`f(X)v`, including the C polynomial/radial family, does not realize the negative
fermionic valley ground energy. High energy in this family alone would not be an
independent test of supersymmetric escape. A serious adversarial state must allow
the appropriate configuration-dependent fermion factor.

**Necessary annular scale.** Let `delta` be Frobenius distance to rank-at-most-one matrices.
For singular values `s_1>=s_2>=s_3`, `delta^2=s_2^2+s_3^2` and
`V=sum_(i<j) s_i^2 s_j^2 >= r^2 delta^2/3`. For a normalized smooth physical state
supported in `R<=r<=2R`, assume the original form identity and `q<=E`. A/B gives

```math
\int V\rho\le E+2CR,
\qquad \int\delta^2\rho\le\frac{3E}{R^2}+\frac{6C}{R},
\qquad C=8\sqrt3.
```

Thus bounded-energy annular escape must concentrate at the natural average transverse
scale `delta=O(R^-1/2)`. This is a necessary moment condition, not a pointwise tube
bound or a proof of fast-ground projection. General escape states still need an
annular localization argument; its errors cannot be assumed away.

## 6. What remains and the next discriminating task

To turn the frozen-channel rejection into a global exclusion, prove a uniform
near-valley comparison in the actual source core/form, preserving the exact sector.
It must control the moving color/spatial frame, gauge/orbit measure and constraints,
derivative/Berry terms, the remaining fermionic multiplication terms, quartic remainder,
patch covering and IMS losses. A fixed-color frozen slice cannot be substituted for
an adapted moving frame without those estimates. The comparison must retain a positive
linear-in-radius margin on the eligible excited channels. No such uniform estimate is supplied here.

**Lead decision:** preserve the central-sign obstruction as negative knowledge; use the
existing generic covering-lift API only after its actual source endpoints are discharged.
For spectral research, the next decisive analytical task is the uniform annular
near-valley error comparison just stated, or a valid same-sector escaping family that
defeats it. Do not spend a gate testing only separated polynomial states or recounting
the already checked full Fock constant. Global escape exclusion, source lift, closed-domain
identification and spectral existence remain open.

## 7. Reproduction

```sh
python contributions/bfss-kotler/tools/audit_spectral_confinement_d.py
```

The [receipt](evidence/spectral-confinement-2026-11-06/d-diagnostic-receipt.json) records
seventeen source/reader pins, script SHA-256, exact chirality projectors, all massive
occupation degeneracies, the residual D4 character and its full Weyl-numerator check.
All finite calculations use integers/rationals; no full Fock matrices are constructed.
The central algebra-map obstruction is proved above; its matrix discrepancy is a diagnostic,
not a computer proof over every algebra map. Mathlib sources are separately pinned in section 2.
Exit zero means the finite diagnostics completed, not source Gate C/D acceptance.
No Lean source, workflow, guarded cache, original research branch or upstream PR changes.
