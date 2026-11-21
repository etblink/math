# D1L — Adversarial Python-first SU(2) BFSS commuting-valley trial-energy audit

**Date:** 2026-11-21. **Research branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Disposition:** **FINITE-DIMENSIONAL SOURCE-ANCHORED MODEL + EXACT GAUSSIAN MOMENTS + NUMERICAL QUADRATURE. NOT A NEW LEAN PROOF, PHYSICAL GAUSS-DOMAIN CHECK, CERTIFIED FULL BFSS FORM ESTIMATE, SPECTRAL RESULT, HOPFION OR UNIFICATION CLAIM.**

## Executive decision

The D1I trial's selected `R^(-2)` behavior survives independent source-normalized Gaussian moment reconstruction, full SVD angular-inverse metric integration, smooth radial and angular cutoffs, and a fixed smooth transverse tube. But the construction is **highly sensitive to Gaussian width** and to **the rate at which the transverse tube narrows**. We also discovered a substantial simplification: the artificial spatial Gamma-rotor patch cutoff energy can be made arbitrarily small in this model by excluding a vanishing cap around its singular pole on `S^8`. The full source `SmoothCore 2` membership and original GaugeData intertwiner remain unqualified. The correct next test is analytic control of source-typed smoothness/domain, not another broad Lean gate or an unsupported spectral claim.

## Frozen mathematical input and exact scalar reconstruction

Original blobs retained: `Core.lean` `9882359ced78b0a3bd7e2f057974bd0a031b3e60` (27 real bosons and kinetic `1/2`), `PotentialBasis.lean` `bc9b526284166efcba5a8e296adc79ba88e6764d` (`V_B=r^2||Y||^2+det(Y^T Y)` on the tube), `FermionQuantization.lean` `c6b72d030225c707ef54f5285a18a7a8175ee280` (massless bracket), `SU2RealGammaProbe.lean` `b9b8192055c70f0d001d7982669b9823c55562ed` (real Gamma9), and G1A `152204ef15a6569534e0503824a697cb9ae8e4ce` (24-mode source relabeling). The accepted original core energy is `M.massless_coreForm_energy` in `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`. This audit does not upgrade its domain scope.

Let `Y` be 8×2, let `t=||Y||^2`, `d=det(Y^T Y)`, `r>σ_max(Y)`, and let `α>0` be the transverse Gaussian frequency coefficient:

`φ_{r,α}(Y)=(αr/π)^4 exp[-(αr/2)t]` so that each of the sixteen transverse real coordinates under `|φ|²` has variance `v=(2αr)^(-1)`.

For the SVD chart, `j_r(Y)=det(I_2−Y^T Y/r²)=1−t/r²+d/r⁴`. Exactly for flat Gaussian moments,

- `Et=16v`, `Et²=288v²`, `Et³=5760v³`;
- `Ed=56v²`, `E(td)=1120v³`, `E(t²d)=24640v⁴`, `Ed²=5040v⁴`.

Therefore `Z(r,α)=E[j]=1−8/(αr³)+14/(α²r⁶)`. For `α=√2`, symbolic substitution into the source-normalized scalar kinetic + `V_B` + previously source-bracket-contracted fermion expectation `−8√2 r` gives **exactly** D1H's selected formula

`E_selected(r)=−13(2√2 r³−7)/(r²(r⁶−4√2r³+7))`.

This identity was checked by SymPy simplification to exact zero difference. It includes the radial Gaussian kinetic, quartic potential and SVD Jacobian; omitting any of these breaks cancellation. This exact statement is an **untruncated Gaussian moment identity**; the actual smooth chart uses an explicit tube cutoff.

## Counterfactual A — Gaussian width is a sharp obstruction to arbitrary deformations

For general `α`, the coefficient of the *linear* energy is

`E_leading(r) = [4α + 8/α − 8√2] r = 4(α−√2)² r/α ≥ 0`.

With `α=√2(1+δ)`, `E_leading(r)=4√2 δ² r/(1+δ)`; equality occurs only for `δ=0`. Thus a fixed fractional width error destroys the desired asymptotic energy decay. To keep the width penalty `O(R^(-2))`, one needs at least `|δ_R|=O(R^(-3/2))` in this trial family. The source oscillator frequency is not numerology; it is structurally decisive.

At `R=40`, the exact-moment + Sobol model gives the following `R² E` (fixed physical tube `κ=.5`):

| Width ratio α/√2 | R² E_model |
|---:|---:|
| 0.90 | 6353.568 |
| 0.97 | 554.493 |
| 0.99 | 83.605 |
| 1.00 | 26.060117 |
| 1.01 | 82.417 |
| 1.03 | 523.567 |
| 1.10 | 5202.663 |

The leading prediction for the extra `R² E` is `4√2 δ²/(1+δ) * (I11/I10) R³`, `I11/I10=1.5728971542458055`; finite-R corrections remain. A one-percent error is already readily observable.

## Counterfactual B — Exact Fock/angular/cutoff integration at optimized width

Use D1I's `χ(s)=exp[-1/(s−1)−1/(2−s)]` for `1<s<2`, the truly flat-endpoint `C∞` spatial step `β(z)` between `z=.15` and `.60`, and a `C∞` tube function `η(x)=1−smoothstep(2x−1)` with `x=||Y||/(κr)` (unity for `x≤1/2`, zero for `x≥1`). Its explicit radial and transverse derivatives are included.

Exact angular matrix-inverse formulas from D1I are evaluated at **each** transverse matrix, not just `Y=0`:

`E_F=6/r²+3∑_{k=1}² (r²+λ_k)/(r²−λ_k)²`,

`E_β=(Cβ/16)[6/r²+∑_{k=1}² (r²+λ_k)/(r²−λ_k)²]`, with `Cβ=18.337845828622427`.

The second expression uses uniform left singular-vector averaging in the isotropic Gaussian 8×2 transverse measure. The color gauge-compatible, canonical Berry-flat vector construction and its original-source smoothness are **assumptions to be qualified**, not new results of this quadrature.

Independent exact-moment radial quadrature finds:

- radial-cutoff contribution `17.39253562073588`;
- Fock angular contribution `4.913317456761263`;
- spatial patch contribution `3.7541524178819703`;
- total `K=26.060005495379112`.

Deterministic eigenvalue quadrature (`κ=.5`, optimized width) gives:

| R | R² E_model |
|---:|---:|
| 10 | 26.067177451 |
| 20 | 26.060900705 |
| 40 | 26.060117379 |
| 80 | 26.060019491 |
| 160 | 26.060007333 |

Independent randomized Sobol integration of 16D Gaussian transverse coordinates reproduces these to approximately the displayed five or six decimals. The leading subasymptotic correction is independently obtained by expanding the exact Wishart-weighted angular metric and the radial/normalization factors:

`R² E_model = K + A/R³ + O(R^(-6))`, with `A≈7.16021036924` for this selected cutoff family (where exponentially small fixed-tube tails are suppressed). The independently computed deterministic values have the expected trend.

For `κ=.5` and `r≥8`, the uncut Gaussian probability of entering the tube transition is bounded above by `P(χ²_16 ≥ (ακ²/2) r³)`; at `α=√2,r=8` this is roughly `2.0×10^(-12)` and falls rapidly. This quantifies why the fixed-tube cutoff has no visible effect at the tested radii, though it is **not** by itself a bound on every cutoff-derivative contribution.

## Counterfactual C — Transverse tube shrinking rate

The 16D Sobol method **FAILED convergence** for severe cutoff shrinkage: at `R=40`, `κ_R=.5/R`, independent QMC seeds yielded `R²E≈96.55`, `133.83`, `186.77`; at `κ_R=.5/R^(3/2)` values differed by orders of magnitude. These unstable estimates were **rejected**. First-causal reason: importance mass remaining under the shrinking tube becomes small while the control-variate subtraction of large terms loses relative precision.

We replaced that experiment with **deterministic two-eigenvalue Wishart quadrature**. For a real 8×2 Gaussian, if `λ±` are the eigenvalues of `Y^T Y`, the independent variables

`x=α r (λ+ + λ−) ~ Gamma(shape=8, scale=1)`,

`w=((λ+−λ−)/(λ+ + λ−))² ~ Beta(1,7/2)`

have simple normalized densities. Integrating `x` on the compact physical tube, `w` with Gauss-Jacobi weights, and radial shell with Gauss-Legendre removes the rare-sample instability. We checked 96/160/240 transverse integration nodes.

| R | Fixed κ=.5 | κ_R=.5/R | κ_R=.5/R^(3/2) |
|---:|---:|---:|---:|
| 20 | 26.060901 | 1014.189091 | 712568.8034 |
| 40 | 26.060117 | 103.370263 | 5700277.3122 |
| 80 | 26.060019 | 26.219799 | 45601945.38 |
| 160 | 26.060007 | 26.060008 | 364815289.95 |

All cells represent `R²E_model`; they are **not** physical source-domain Rayleigh quotients. Rate `κ_R∝R^(-1)` creates a large finite-size effect but ultimately recovers the optimized width because the physical tube is still wider than the natural Gaussian fluctuation scale. Rate `κ_R∝R^(-3/2)` leaves tube width comparable to the Gaussian fluctuation scale and yields `E_model` growing linearly rather than tending to zero. This isolates a **geometric scaling threshold**: for fixed tube-prefactor families, `p<3/2` is a sufficient heuristic condition for asymptotically negligible tube-cutoff effect, while `p≥3/2` is dangerous. The exact cutoff prefactor, radial support and smooth transition matter near threshold.

## Counterfactual D — Spatial Γ-rotor patch energy is adjustable

The `u` rotor is smoothly constructed away from the south pole `u_8=−1`. The original `β` cut (from `.15` to `.60`) costs `Cβ≈18.3378458`, or `3.75415` in the leading energy coefficient. Instead choose `β_ε=0` until `u_8=−1+ε` and `β_ε=1` after `u_8=−1+2ε`, using the same smooth flat-endpoint step. Since the angular measure on `S^8` is `(1−z²)^3 dz`, direct integration yields

`Cβ(ε) ~ 152.547965597 ε³` as `ε→0`.

| ε | Cβ(ε) | leading K(ε) |
|---:|---:|---:|
| 0.20 | 0.633145 | 22.435472 |
| 0.05 | 0.016284 | 22.309187 |
| 0.01 | 0.000147876 | 22.305883 |
| 0.005 | 0.0000187748 | 22.305857 |

Thus the **infimum of the model's spatial-patch contribution is zero**, yielding `K→17.39253562073588+4.913317456761263=22.30585307749714` for the fixed radial shell choice. This is a consequence of the high-dimensional angular measure near an excluded point, **not** evidence that the exact source Fock vector/Spin lift has a globally smooth extension. Investigate that original-carrier phase/regularity before using the small-cap improvement for a physical conclusion.

## Independent controls and computational negative knowledge

1. Exact SymPy difference of selected energy and D1H source formula: **zero**. Width obstruction identity: **exact**.
2. 32 randomized independent 10×10 SVD angular metric inversions: maximum Fock expression residual `1.11×10⁻¹⁶`; spatial inverse trace residual `6.94×10⁻¹⁸`; Jacobian determinant residual `4.33×10⁻¹⁵`.
3. Finite-difference radial and transverse derivatives of the actual smooth tube-amplitude: residuals `4.11×10⁻¹¹` and `4.94×10⁻¹⁰`.
4. At `R=20, κ=.5`, QMC sample counts 4096/16384/65536 with different seeds give `R²E=26.060900670/26.060900742/26.060900715`; deterministic result is `26.060900705`.
5. A **first implementation error** used `smoothstep` where `1−smoothstep` was needed, producing obviously negative/absurd energies; it was corrected **before any result promotion**. The subsequent rare-event QMC instability under a shrinking tube is retained as a **rejected numerical method**. Neither may be presented as physical evidence.

## Evidence ceilings and stop rule

The calculation is a fully specified **coordinate trial-energy model** using D1I's covariant finite-dimensional pure-Gaussian/Fock data. It assumes the chosen Berry-flat lift and Fock angular metric represent the exact original source Hilbert state and that the gauge-equivariant cutoffs extend to the exact physical smooth core. It does **not** prove those assumptions, establish the required source `pairedGaugeData.invariantCore`, rigorously control all tube/angular derivative tails, or show `q[Ψ_R]→0` in the original associated closed positive form. The D1F and D1K1A strict Lean REDs remain RED and untouched.

**Project Lead decision:** keep Python/analytic research primary. Next bounded challenge: (i) independent source-exact smoothness and gauge-equivariance of `Ω(u,n)` on the full color sphere, especially near the excluded spatial pole; (ii) explicit error bound for tube derivatives on `κ=.5`; (iii) original BFSS `SmoothCore 2` construction and form equality. Only after a mathematically sound route is identified should an isolated Lean microgate resume. Main, live RHOPF and original source remain unchanged.