# D1N — Original SU(2) BFSS global Fock trial: source-gauge and full-form boundary audit

**Date:** 2026-11-21.  **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Work type:** original-source-read + 27-coordinate finite-dimensional form differential + 24-mode exterior-Fock gauge check + independent deterministic quadrature + exact symbolic Gaussian moments.  
**Disposition:** **ANALYTICAL / NUMERICAL SOURCE-CONVENTION PRESCREEN, NOT NEW NATIVE LEAN QUALIFICATION, NOR A SOURCE-TYPED SMOOTHCORE, PHYSICAL HAMILTONIAN DOMAIN OR ESSENTIAL-SPECTRUM THEOREM.**  No Lean source, CI workflow, main or live RHOPF branch altered.

## Executive decision

The D1M flat Gaussian Fock line/deck-even construction withstands a stronger, *27-ambient-coordinate* kinetic check and a separate source-label 24-orbital gauge stabilizer test. **The full exact local trial-form integrand** agrees with the original-source quartic and fermionic expectations, including nonzero doubly transverse `Y`, and has independently checked angular kinetic and scalar cutoffs. Together with exact Gaussian moments and fixed-tube exponential bounds, this gives a **conditional analytic global trial estimate** with leading `22.305853077497…/R²`. The remaining key interface is the literal proof that the abstract global spinor is the source `Fermion 2` vector with the correct `pairedGaugeData` action and that its zero-extended compactly supported representative belongs to the exact `SmoothCore 2` / `pairedGaugeData.invariantCore` feeding the source closed-charge form. Do **not** promote the condition into an unconditional BFSS spectral theorem or a Hopfion/GUT claim.

### Exact original definitions inspected

- `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: 27 real bosons; actual `SmoothCore N` compactly supported test functions; `coreForm f = (1/16)∑_α ||coreToL2 (M.charge α f)||²`, nonnegative.
- `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`: exact `cubicFermionComponent` and `deformedFermionField_bracket` at `h=1,m=0`, original Majorana normalization.
- `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`: source identity `M.massless_coreForm_energy`, using `½Σ_p||∂_p f||² + ∫(V_B||f||² + ⟨f,F_massless f⟩_ℝ)` *on source `SmoothCore`*; historical qualified result, not newly rerun.
- `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`: `GaugeData.physicalSpace = ⋂_g ker(bosonPullback g − fiberAction g)` and `invariantCore = physicalSpace.comap coreToL2`; pointwise equivariance is the relevant construction target.
- `SU2BFSSG1APairedThetaProbe.lean` `152204ef15a6569534e0503824a697cb9ae8e4ce`: literal 8 paired spin labels × 3 color labels and `pairedTheta`.
- `SU2BFSSG3AAdjointColorRepresentationProbe.lean` `553869f1287c64893398c3b79c04fe010023bd08`: `R(g)[output B,input A] = pairedAlgebraData.adjointCoefficient g A B` with group law.
- `SU2BFSSG4AExteriorGaugeActionProbe.lean` `141fbe74fc4883f686e05dbc702efb12c6fb8fab`, G4E `7247844122ab870d31e92903db4c2ab561f98112`, G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`: original color exterior map and its **actual 24-mode → Fermion 2 Hilbert unitary** and `pairedGaugeData` construction.
- `SU2RealGammaProbe.lean` `b9b8192055c70f0d001d7982669b9823c55562ed`: all nine source signed-permutation Γ Pauli words, independently reconstructed by D1M.
- `P3M5BE0OriginalNativeHamiltonianPort.lean` `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1`: natural-domain `H=(1/16)T†T` original physical self-adjoint operator (separately historically qualified). **Do not assume an arbitrary compactly supported ansatz is in that operator domain.**
- `SU2BFSSPhysicalDomainL6H5E8BFOriginalSourceGraphAndPairedHamiltonianProbe.lean` `fd137fc6f62f42d96bcf6ff3eb9355839a59d562` contains a *prospective/unqualified* original source-graph crosswalk. We do **not** count it as qualified or rely on it in an unconditional conclusion.

## 1. Full SVD differential, not merely an angular-metric surrogate

Use unique rank-one dominant SVD data modulo deck:

`X = r u nᵀ + Y`, `u∈S⁸`, `n∈S²`, `uᵀY=0`, `Yn=0`, `σ_max(Y)<r`, deck `(u,n,Y)~(-u,-n,Y)`.

For a perturbation `H` of the **original 9×3 bosonic matrix**, define `a = (I−uuᵀ)Hn`, `b = (I−nnᵀ)Hᵀu`. The exact first variation is

```
dr = uᵀ H n,
dt = 2⟨Y,H⟩,                       t = ||Y||²,
[rI₉  −Y  ][du] = [a]
[−Yᵀ  rI₃][dn]   [b] .
```

The matrix is invertible on the top-simple SVD tube. For the source covariance

`C(u,n) = −Γ(u)⊗J(n) − J_pair⊗nnᵀ`,  `J(n)_bc = ε_abc n_a`,

its derivative is

`dC = −Γ(du)⊗J(n) − Γ(u)⊗J(dn) − J_pair⊗(dn nᵀ+n dnᵀ)`.

Compute `E_Fock = (1/32)Σ_(i,a)||∂_(i,a) C||_F²` directly over all **27** ambient real coordinates, and independently compare with the *exact* SVD inverse-metric identity

`E_Fock = 6/r² + 3Σ_{k=1}² (r²+λ_k)/(r²−λ_k)²`, where λ₁,λ₂ are the two nonzero eigenvalues of `YᵀY`.

The 12 random original-source configurations give **maximum difference `1.67e−16`**. Eight random 9×3 perturbations tested against central differences of the actual leading singular vector: `du` residual `4.50e−11`, `dn` `2.25e−11`, `dC` `4.03e−11`. Exact scalar-gradient cutoff derivative residual (normalized to local Gaussian prefactor): `7.66e−9`. **The local source kinetic expression does not acquire a hidden leading angular term** from the SVD mixing.

### Negative knowledge — rank-two determinant trap

An initial independent implementation erroneously computed `det(YᵀY)` using the full 3×3 color Gram matrix. Because `Yn=0`, **that determinant is zero**. The source quartic requires `det` on the 2-dimensional subspace `n⊥`, or equivalently the product of the **two nonzero eigenvalues**, `λ₁ λ₂` (the second elementary symmetric polynomial of the 3×3 Gram spectrum). The error caused residuals up to `1.3183` in the bosonic potential and an extra `3/r²` in a mistakenly three-eigenvalue fermion sum. The code was corrected before acceptance. The final independent 9×3 row-cross-product potential matches `r²t+λ₁λ₂` within **`2.84e−13`**, and the Fock kinetic within **`1.67e−16`**. This is a **rejected implementation**, not a correction to D1H/D1I/D1L's properly rank-two formulas.

## 2. Direct original massless fermion expectation and gauge action

For `C=2i⟨θ_r θ_s⟩` and the original `(-i/2) Σ f_ABC X_iC Γ_i[βδ] θ_(δ,B) θ_(β,A)`, with `f_ABC=√2 ε_ABC`, the exact finite 48-label contraction is

`⟨F_massless(X)⟩ = −(√2/4) Σ_{A,B,C,i,β,δ} ε_ABC X_iC Γ_i[βδ] C[(δ,B),(β,A)]`.

At `X=r unᵀ+Y` with `uᵀY=Yn=0`, this evaluates to `−8√2 r`. Independent 12-point 48-label NumPy contractions give max residual **`1.99e−13`**; no use of D1F's unqualified massless operator theorem.

On the **actual source 8×3 = 24** original mode labels, take `V_(j,1),j=1/√2` and `V_(j,2),j=i s_j/√2` with signs `s_j=(+,+,+,+,−,−,−,−)`. The source color action has `U(O)=I₈⊗O` for proper adjoint `O∈SO(3)`; the true gauge representation is its exterior power. The fixed-color-axis stabilizer `h(θ)` yields individual characters `exp(−i s_j θ)`, and `det(V† U(h) V)=exp(−iθΣ s_j)=1` **for every θ**. Forty seeded SO3 tests find max stabilizer wedge phase error **`2.67e−15`**, color-orbit representative ambiguity **`4.44e−15`**, covariance gauge residual **`3.33e−16`**, and gauge-invariance of the full local energy **`1.25e−12`**. The **wrong all-positive sign pattern** instead has phase error **1.768** at θ=.271. This tests the same color-index orientation as the already compiled source G3A/G4A, not a substitute abstract gauge action. A source-typed theorem for the globally transported vector is still absent.

The global Gaussian line's Berry flatness and deck-even (+1) phase were established analytically/source-matched in [D1M](../d1m/D1M_GLOBAL_FOCK_DESCENT_AND_SMOOTHNESS_AUDIT_2026_11_21.md). D1N tests the gauge action and ambient derivative against that construction, **not** a new all-X explicit Lean Spin48 map.

## 3. Smooth compact support — ordinary analytical construction and exact source boundary

Choose `R>0`, fixed `0<κ<1` (tests use `.5`), a flat `C∞` radial `χ` supported on `1<s<2`, and a flat `C∞` tube cutoff `η(ρ)` equal to 1 for `ρ≤1/2` and 0 for `ρ≥1`. With the **globally smooth, deck-even, normalized, color-equivariant Fock vector** `Ω(u,n)` from D1M, set

```
Ψ_R(X) = N_R χ(r(X)/R) η(||Y(X)||/(κ r(X)))
         (√2r(X)/π)^4 exp[−(√2r(X)/2)||Y(X)||²] Ω(u(X),n(X)) .
```

The support `R≤r≤2R`, `||Y||≤κr` stays strictly inside the top-simple SVD tube because `σ_max(Y)≤||Y||<r`. The **quotient**, not either orientation sheet, is the physical coordinate base; `Ω(-u,-n)=Ω(u,n)` and the scalar depends only on invariant `r,t`. A flat-endpoint cutoff extends by zero across every cutoff face; `η` is constant near `Y=0`, avoiding a nondifferentiable norm. The support is compact in 27-dimensional configuration space. For `r=1.5R, Y=0`, all scalar factors are positive and `||Ω||=1`, hence the candidate is nonzero. Disjoint shells, e.g. `R_j=3^jR_0`, give orthogonality after normalization. Color equivariance is `Ψ_R(X Oᵀ)=U(O)Ψ_R(X)`; SO3 output/input orientation matches source G3A. No angular `β` cutoff is used.

This gives an **ordinary finite-dimensional analytical route** to a smooth gauge-equivariant Fock-valued compactly supported trial **conditional on** the original-carrier global Gaussian lift and its source-`GaugeData` identification. It is **not** a newly kernel-checked Lean object of type `SmoothCore 2`; membership in the original `pairedGaugeData.invariantCore` is therefore an explicit separate obligation. In particular, we do not promote an informal `C∞_c` label into a certified physical form-domain theorem.

## 4. Exact fixed-width Gaussian moment/energy reduction

For `α=√2`, `t=||Y||²`, `d=λ₁λ₂`, Gaussian variance `v=1/(2αr)`, and exact SVD Jacobian `j=1−t/r²+d/r⁴`, the untruncated Gaussian moments give

```
Z(r)   = E[j] = 1 − 4√2/r³ + 7/r⁶,
Eb(r)  = E[j(4/r−√2 t/2)] = (2√2 r³−7)/r⁷,
S(r)   = E_j[½|∇logφ|² + V_B − 8√2r]
       = −13(2√2 r³−7)/(r²(r⁶−4√2r³+7)).
```

These symbolic expressions are independently recomputed and **exact SymPy difference is zero**. The exact radial-cutoff scalar numerator (before angular integration) is

`Z S χ² + Eb χ χ′ + (Z/2)(χ′)²`.

For `λ_k/r²=z_k≤κ²`, the complete Fock angular derivative satisfies the elementary pointwise bound

`0 ≤ E_Fock−12/r² ≤ 9t/[r⁴(1−κ²)²]`.

Under the 16D ground Gaussian, `E[t]=4√2/r`; the fixed-tube weighted moment is also `O(1/r)` by a uniform positive norm lower bound. The Fock correction is therefore `O(r⁻⁵)`; `S=O(r⁻⁵)`, `Eb/Z=O(r⁻⁴)`, and `Z=1+O(r⁻³)`. The tube-cutoff transition begins at `t≥κ²r²/4`; the exact `χ²₁₆` survival is bounded by

`Pr(transition)≤256 exp(−√2 κ² r³/8)`.

Derivatives of the **fixed** smooth tube cutoff and original polynomial potential are polynomially bounded on support; weighted tail errors are `O(poly(r)e^(−c r³))`. **Conditional on the source-identified smooth state and form equality**, normalizing the `r¹⁰` Jacobian gives the asymptotic estimate

```
E_trial(R) = K_global/R² + O(R⁻⁵) + O(poly(R) e^(−cR³)),
K_global  = [½∫₁² t¹⁰(χ′(t))²dt + 12∫₁² t⁸χ(t)²dt]
            / ∫₁² t¹⁰χ(t)²dt
          = 17.392535620736 + 4.913317456761
          = 22.305853077497… .
```

This estimate is for the *specified mathematical trial family using the source-normalized local energy model*, **not** an independently qualified original physical Hamiltonian Rayleigh quotient. It does not assert a new result about the known BFSS commuting-valley continuum, a localized Hopf soliton, Standard Model physics, or unification.

## 5. Independent fixed-tube numerical checks and limitations

The third independent deterministic implementation integrates the real `8×2` Gaussian Wishart eigenvalue variables: `x=αr t ∼ Gamma(8,1)` and eigenvalue split `w=((λ₁−λ₂)/(λ₁+λ₂))² ∼ Beta(1,7/2)`. It includes the **exact** tube-cutoff derivatives, `j`, full SVD Fock angular metric and original quartic potential. The full 27-coordinate finite-difference derivation in section 1 is separate from this eigenvalue integrator.

| R | R² E_global,model (64×160×24 quadrature) |
|---:|---:|
| 8 | 22.3159571583 |
| 10 | 22.3110181754 |
| 20 | 22.3064977777 |
| 40 | 22.3059336526 |
| 80 | 22.3058631669 |
| 160 | ~22.3058545 (float cancellation deteriorates) |

Independent `80×240×36` quadrature agrees at R10 to `1.1e−11` and at R40 to `7.1e−10`. R160 direct quadrature is **NOT** reliable to the last displayed decimal because positive and negative `O(r)` terms cancel: trace quadrature resolutions shift `R²E` by about `1.6e−7`; the exact symbolic moments plus asymptotic analysis are the stronger large-R check. All computed radial normalization masses are strictly positive (scaled radial norms `0.00696…0.00699…`).

**Negatives retained:** (i) original full-3×3 determinant and third angular zero-eigenvalue mistake in D1N first independent implementation; corrected before acceptance, (ii) D1L severely shrinking-tube QMC sampling was rejected, (iii) D1L one-sided spatial small-cap scalar is not deck invariant, repaired conceptually by D1M `β≡1` global section, (iv) D1F 3 native strict REDs and D1K1A R1 native strict RED remain unqualified.

## 6. Recommended D1O boundary — no speculative Lean

The analytic route is more credible now than at D1I. But one must not confuse a globally descended *finite CAR ray* with an explicit source-typed smooth wavefunction. The decision gate is **source-carrier correspondence**:

1. Exhibit the global Berry-parallel Gaussian section explicitly or by a precise finite-dimensional smooth-lifting argument as a map into the **literal original** `Fermion 2` Hilbert carrier via `fockAlgebraToBFSS`, and check its covariance against `pairedTheta`, including all sign/phase conventions.
2. Prove equality of its SO3 color action with **exact original** `pairedGaugeData.fermion`, including the SU2 center, and establish `Ψ_R` satisfies pointwise original GaugeData equivariance (not merely ray covariance).
3. Formalize the compactly supported zero-extension in original `SmoothCore 2` and membership in `pairedGaugeData.invariantCore`; pass to the exact 1/16 charge form on that domain. Distinguish this **form-domain** question from membership in `Dom(H)`.
4. Only after a source-identified trial and a rigorous bound is established should a Lean microgate be considered. Do not repeat D1K1A or D1F without an analytically motivated source-typed repair. Preserve known positives and negatives; no publication or novel mass-gap/hopfion inference.

**Provenance:** D1N scripts, machine result JSONs, SHA-256 manifest and ZIP checksum are frozen with this memorandum in the counterfactual branch; original source and CI unaffected.
