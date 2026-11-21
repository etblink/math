# D1G — Python-first original SU(2) BFSS commuting-valley falsification

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Qualification:** **PYTHON NUMERICAL + CLOSED-FORM LOCAL ANALYTIC TESTS; NOT NEW LEAN, NOT FULL GAUGE-PHYSICAL SPECTRUM**.  
**Local reproducible package:** `bfss_su2_valley_python_research_2026_11_21.zip`, SHA256 `4b68099964de576cf26ce415f45c6e24ee514a030bfdb94224a145c471a07113`, supplied to owner in the ChatGPT conversation; not a permanent repository asset. The zip contains full Python scripts, prior D1F prescreen, deterministic machine-readable results and expanded 2026-11-21 report. Verify its SHA before interpreting results. This memo preserves the central derivation/results in canonical Git history in case the chat attachment expires.

## Exact source contracts (original, massless BFSS)

- `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`; original charge smooth-core kinetic normalization `(1/2) Σ‖∂ψ‖²`.
- `PotentialBasis.lean` blob `bc9b526284166efcba5a8e296adc79ba88e6764d`; source massless potential = `(1/2) Σ_{A,i<j} (coordinateBracketAll X i j A)^2`, explicitly paired with `PotentialSquares.lean` blob `a42500d241692b42532482fe8fad639bbdc17881`.
- Original color `f_{abc}=√2 ε_{abc}` as in `SU2BFSSPhysicalDomainL6G5LSourcePauliCyclicCoefficientProbe.lean` blob `713b4f7301c5788a407f3679d5d52c59332805e3`.
- Original Gamma9 `SU2RealGammaProbe.lean` blob `b9b8192055c70f0d001d7982669b9823c55562ed`, Pauli words `JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII`.
- `FermionQuantization.lean` blob `c6b72d030225c707ef54f5285a18a7a8175ee280`; exact massless coefficient `K(X)=F(X)-F(0)`; `Q_F(K)=(i/2) Σ_{r,s} K_{rs} θ_r θ_s`.
- Original paired Fock `SU2BFSSG1APairedThetaProbe.lean` blob `152204ef15a6569534e0503824a697cb9ae8e4ce`; 48 CAR Majoranas on 24 canonical complex modes, `{θ_r,θ_s}=δ_rs`.

The source-normalized bosonic potential is, with `X∈ℝ^{9×3}` and `G=XᵀX`,
\[
V_B(X)=\frac14\sum_{i,j,a}\big(\sum_{b,c}f_{abc} X_{ib}X_{jc}\big)^2
=\sum_{i<j}\|X_i\times X_j\|^2
=\tfrac12[(\mathrm{tr}G)^2-\mathrm{tr}(G^2)].
\]
The original massless 48×48 **real skew** Yukawa coefficient is
\[
K_{(\alpha,b),(\beta,c)}(X)=
\sum_{i,a} X_{ia}\,(\Gamma_i)_{\alpha\beta}\, f_{abc}.
\]
This is a `0+1`D matrix quantum-mechanical configuration potential, NOT an effective 3D spatial field.

## D1G1 — transverse Hessian on the rank-one classical commuting valley

At `X₀=R e₀⊗e₀` (R>0), exact differentiation of `V_B` yields Hessian eigenvalues:
- `2R²` **16 times**, corresponding to `8` spatial directions × `2` color-perpendicular directions;
- `0` **11 times** (9 directions tangent to the commuting rank-one locus after accounting for 2 SU2 color-gauge orbit tangents; 11 total before quotient).

With source kinetic `−Δ/2`, the 16 normal oscillator frequencies are **`ω=√2 R`**. Their harmonic bosonic zero-point energy is **`E_B,⊥ = 16ω/2 = 8√2 R`**. Direct source-bracket vs independent Gram potential checks across rank1/2/3 configurations differ by at most `1.14×10⁻¹³`. Independent Hessian finite differences of the **source bracket**, step `10⁻⁴`, differ from analytic Hessian by at most `3.07×10⁻⁶`.

## D1G2 — original Majorana fixed-X spectrum and cancellation

At `X₀`, `iK(X₀)` is Hermitian with `+√2 R` eigenvalues (16), `−√2 R` eigenvalues (16), and `0` eigenvalues (16). The **fixed-X quadratic Fock** ground contribution, using the source `(i/2)Kθθ` and CAR normalization, is
\[
E_F^{\mathrm{min}}=-(1/2)\sum_{\lambda>0}\lambda=-8\sqrt2 R.
\]
An independent **explicit 2×2 Fock operator** check verified a single skew block `K_{01}=k` has eigenenergies `±k/2`. This guards against factor-of-2 or imaginary phase mismatches.

**Main result (quadratic local calculation only):**
\[
\boxed{E_{B,\perp}^{(0)}+E_F^{\mathrm{min}}=0}.
\]
Six radii `R=0.5,1,2,5,10,30` gave zero numerical residual at printed precision. **Ten additional independently randomized spatial 9-vector and color 3-vector orientations** gave maximum cancellation/frequency deviation `2.14×10⁻¹⁴`, retaining 16 transverse bosonic and 16 nonzero fermionic frequencies each.

**Do NOT infer:** 256 **physical** ground states from the 16 real Fock zero directions; any complete Gauss-law projection, Born–Oppenheimer state, normalizable zero eigenfunction, closed-domain bound, or global vanishing effective potential. These are frozen-X oscillator facts only.

## D1G3 — Gaussian transverse quartic correction

For 16 massive transverse real bosons `Y_{i=1..8,a=1..2}`, hold `X₀`'s spatial and color directions fixed and use independent normalized Gaussian variance `v=(2ω)^{-1}`, `ω=√2 R`. The quartic source potential on this 16-coordinate subspace is **exactly**
\[
V_B(X₀+Y)=R^2\sum_{i,a}Y_{ia}^2+
\sum_{1\le i<j\le8}(Y_{i1}Y_{j2}-Y_{i2}Y_{j1})^2.
\]
There are 28 quartic terms, each with expectation `2v²`. Thus
\[
\boxed{\langle V_{\mathrm{quartic},\perp}\rangle=56v^2=7/R^2}.
\]
The partial Gaussian shape derivative yields `\tfrac12\|\partial_R\psi_R\|^2=1/R²` along a fixed ray; adding *these two selected terms only* gives `8/R²`. The full geometry/gauge/longitudinal derivative/Berry/fermionic zero-mode contributions are NOT included. This is **not** a physical trial-state upper bound.

| R | Exact quartic Gaussian expectation | 40k-sample Monte Carlo | Quartic + partial Gaussian shape derivative |
|---:|---:|---:|---:|
| 2 | 1.75 | 1.74950 | 2.00 |
| 5 | 0.28 | 0.27901 | 0.32 |
| 10 | 0.070 | 0.06995 | 0.080 |
| 20 | 0.0175 | 0.01743 | 0.020 |
| 50 | 0.0028 | 0.00279 | 0.0032 |

## D1G4 — rank-three invertible DOES NOT imply a uniform coefficient gap

Near the rank-one valley, set `X=diag(R,ε,ε)` in the first three spatial rows. `K(X)` is invertible for `R ε ≠0`, but its numerically smallest positive eigenvalue fits the **candidate closed form**
\[
\lambda_{\min}(R,\varepsilon)
=\frac{\sqrt2}{2}\big(\sqrt{R^2+8\varepsilon^2}-R\big)
\sim\frac{2\sqrt2\,\varepsilon^2}{R}.
\]
Numerical residual from the formula in 12 cases was ≤`1.35×10⁻¹³`; **formula is not newly Lean-proved**. For `R=100, ε=0.03`, `λ_min≈2.55×10⁻⁵`, while `V_B≈18`. Therefore coefficient small-frequency ≠ low-energy physical H state. The rank-three pointwise gap **cannot** be promoted to a uniform gap as the valleys are approached.

## Independent controls

- Proper SO3 color covariance of `K` and source `V_B`: maximum errors ≈`10⁻¹⁵`. An improper O3 reflection has the required **pseudotensor sign** and does not satisfy proper SO3 covariance; no new reflection gauge symmetry.
- Original **massless** `K(0)=0`, whereas the separately source-defined **mass-deformed** `F(0)=(3/2)Γ012⊗I3` has singular frequencies `3/2`. The latter is NOT evidence of a gap in original massless BFSS.
- The numeric matrix and Gaussian checks concern the 0+1D BFSS configuration scale `R`, **not** the physical space-rescaling hypotheses of the Hobart–Derrick theorem.
- Earlier D1F three Lean strict native REDs [R1 #44934836209](https://github.com/etblink/math/actions/runs/44934836209), [R2 #44935867919](https://github.com/etblink/math/actions/runs/44935867919), [R3 #44937500313](https://github.com/etblink/math/actions/runs/44937500313) are preserved and unaffected. These Python checks do not compile or qualify the missing D1F Lean theorem.

## Project Lead recommendation

**Physics-first decision:** do not interpret the quartic bosonic potential as a confining term in the massless SU2 theory without accounting for the fermionic cancellation. The calculation quantitatively exposes a **nonconfining candidate escape channel**, but it has **not** proved the full physical spectrum contains one.

**Next falsifier, not new Lean:** derive/compute a genuinely SU2-gauge-physical normalizable trial family with radial cutoffs and both transverse/longitudinal kinetic terms, fermionic spinor transport, Berry connection, and genuine original closed-form domain. Assess whether a Weyl sequence exists; **do not claim one before constructing and checking it**. Preserve Hobart–Derrick as a separate gate applicable only after a real spatial field and energy functional are derived.

The scripts/results are attached to the owner as the SHA-pinned reproducibility zip; this memorandum is the durable Git mathematical checkpoint.
