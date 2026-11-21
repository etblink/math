# D1M — Original-source Gamma9 Gaussian line, SVD deck sign and smooth gauge-physical trial boundary

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.
**Status:** **ANALYTIC FINITE-DIMENSIONAL / EXACT 24-ORBITAL SYMBOLIC / SOURCE-MATCHED 48-MAJORANA PYTHON.** No new Lean/CI; no formally certified `SmoothCore 2`, physical source quadratic form, essential-spectrum result, hopfion, Standard Model or unification theorem. D1K1A R1 remains strictly RED.

## Decision summary

D1L's spatial **small-cap cutoff construction, taken literally on an oriented `S⁸×S²` cover, is not automatically a function of the physical bosonic matrix**: the rank-one SVD coordinates identify `(u,n,Y)` and `(-u,-n,Y)`. This is a stronger topological test than the separate south-pole spatial-rotor issue. We therefore checked the corresponding *many-body Fock-vector* sign, not merely covariance. **The sign is exactly `+1` in a source-paired 24-orbital calculation**, with a vanishing Berry phase along the specific deck path. Combined with the analytically flat Gaussian Berry line and the smooth covariance, this supports a global, gauge-equivariant smooth Fock vector **without any spatial patch cutoff**, at the finite-dimensional CAR level. This global smooth Fock lift is not yet constructed/qualified in the *literal Lean source carrier*.

Consequently, `K→22.3058530775` from D1L has a clearer interpretation: it is the candidate `β≡1` model coefficient **if** the global physical lift and full form are established. Do **not** infer a source-qualified spectral result.

## 1. Exact original 9×16×16 Gamma9 and pure 48-Majorana covariance

Inspected source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean`, blob `b9b8192055c70f0d001d7982669b9823c55562ed`. The nine real Pauli words `JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII` were reconstructed as integer Kronecker matrices. **All 9 source `perm` arrays and all 9 source `sign` arrays match exactly, coefficient by coefficient** (source read + independent parser). Gamma matrices are real symmetric, satisfy `Γ_iΓ_j+Γ_jΓ_i=2δᵢⱼI₁₆` exactly over integers, `Γ₈=diag(+I₈,−I₈)` and source paired spin labels give `s_j=(+,+,+,+,−,−,−,−)`.

For `u∈S⁸`, `n∈S²`, define the original-source-indexed covariance

`C(u,n)=−Γ(u)⊗J(n)−J_pair⊗(nnᵀ)`, where `J(n)_{bc}=∑_a n_a ε_{abc}` and `J_pair=⊕₈ [[0,1],[-1,0]]`.

Since `J(n)²=−(I−nnᵀ)`, `J(n)nnᵀ=0`, `Γ(u)²=I` and `J_pair²=−I`, **`C²=−I₄₈` globally**, so its even-purity Gaussian ray/projector is smooth everywhere on `S⁸×S²`. The covariance is invariant under the *physical* SVD deck map `(u,n)↦(−u,−n)` and transforms equivariantly under the source SO3 adjoint color action.

72 deterministic random tests: purity residual `7.77×10⁻¹⁶`, spatial Γ rotor `5.00×10⁻¹⁶`, full real orthogonal 48-lift `6.66×10⁻¹⁶`, covariance transport `5.00×10⁻¹⁶`, color covariance `3.89×10⁻¹⁶`. All tests are against literal source Pauli words, not a convenient replacement Gamma representation.

## 2. Flat Berry line: analytic argument and independent tests

The full Gaussian line `L` is a smooth Hermitian complex line over `S⁸×S²`. The standard finite-dimensional pure-Gaussian curvature identity gives, up to an overall convention-dependent scalar, `F(v,w) ∝ tr(C[d_v C,d_w C])`. The D1K0 local smooth Spin-based vector provides a direct independent proof that its Berry one-form vanishes on the spatial patch `u₈>−1`: both source color tangent and spatial transverse-rotor generator have zero `tr(KC)`. Thus `F=0` on that dense open patch. Because `C` and its derivatives are globally smooth and the curvature is a continuous invariant of the ray, **`F=0` extends across the missing pole**. This is an analytic curvature argument on the Gaussian line, not the assertion that an arbitrary chosen rotor frame is nonsingular.

Independently, all **three** 48×48 curvature contractions—spatial/spatial, color/color and mixed spatial/color—were evaluated on 72 seeded random tangent pairs: maxima `4.48×10⁻¹⁶`, `5.11×10⁻¹⁵`, `1.44×10⁻¹⁵`. The exact covariance quantum metric gives `g_u(v,v)=2‖v‖²`, `g_n(w,w)=4‖w‖²`, `g_{u,n}=0` with residuals below `2×10⁻¹⁵`. These confirm the analytic trace argument; numerical zeros alone do not prove it.

Because the **cover** `S⁸×S²` is simply connected, its flat Hermitian Gaussian line admits a globally smooth normalized Berry-parallel vector (standard parallel-transport theorem). Its phase under the *nontrivial SVD deck transformation* still must be checked: that quotient has fundamental group `ℤ₂` and can otherwise retain a sign obstruction.

## 3. The decisive **exact** eight-particle deck phase is +1

Use the source Gamma7=`XIII`, Gamma8=`ZIII` path

`u(t)=sin(t)e₇+cos(t)e₈`, `S(t)=cos(t/2)I₁₆+sin(t/2)Γ₇Γ₈`, `0≤t≤π`,

and a color half-turn `O(t)` around e₂ with `O(π)=diag(−1,−1,+1)`, sending `n=e₀` to `−e₀`. The source Pauli action `Γ₇Γ₈` preserves the original 8 real/imaginary spin-pair labels, so **along this path only** the spatial Majorana rotation is number conserving on the 24 complex source orbitals. Its 8-orbital matrix `S_c` has determinant +1; the complete spatial 24-orbital map and the color SO3 map also have determinant +1. Their canonical Spin lifts therefore agree with the ordinary vacuum-fixed exterior-Fock implementers along this path (no hidden half-determinant phase).

Let `V` be the exact 24×8 matrix of normalized occupied source orbitals `v_j=(e_{j,1}+i s_j e_{j,2})/√2`. The 24×24 deck transformation `Q=U_color(Oπ) U_spatial(Sπ)` obeys **exactly in SymPy**

`QV=VA`,  `A = ⊕₄ [[0,1],[-1,0]]`,  `det A=(+1)^4=+1`.

The state `v₀∧···∧v₇` therefore returns **as an actual eight-particle Fock vector**, not just a ray, with sign `+1`. Both the spatial and color infinitesimal one-particle generators have **exact zero occupied-state traces** along the construction, so this is also the **Berry-parallel deck holonomy**. Hence the flat line descends without `ℤ₂` holonomy obstruction to `(S⁸×S²)/[(u,n)∼(−u,−n)]`. A global parallel normalized section can be chosen consistent with the SO3 color action; the source exterior representation is genuine (not projective), and the residual continuous SO3 character is trivial. These are finite-dimensional mathematical consequences, not new compiled source declarations.

**Negative control:** covariance invariance `C(−u,−n)=C(u,n)` alone could **not** have established the sign; the exact occupied-subspace determinant is essential.

## 4. South-pole singularity is a rotor-frame artifact at ray level

For `u` with `u₈=−1+ε`, the explicit patch rotor `S(u)=(I+Γ(u)Γ8)/√[2(1+u₈)]` has a derivative growing as `O(ε⁻¹ᐟ²)`. At those points the *physical covariance derivative and Fubini–Study metric remain uniformly finite*:

| ε | raw rotor `‖dS‖_F` | covariance `‖dC‖_F` | Fock FS metric |
| ---: | ---: | ---: | ---: |
| 0.2 | 6.3246 | 5.6569 | 2.0000 |
| 0.01 | 28.2843 | 5.6569 | 2.0000 |
| 0.0001 | 282.8427 | 5.6569 | 2.0000 |
| 0.000001 | 2828.4271 | 5.6569 | 2.0000 |

The raw rotor's blowup is a singular *choice of basis*, not a diverging physical Gaussian ray derivative. For the tested tangent `tr((dT)Tᵀ C)=0` exactly, whereas `[ (dT)Tᵀ,C ]` matches the finite `dC` down to `ε=10⁻⁴` at `1.7×10⁻¹³` residual (numerical cancellation grows near `10⁻⁶`). The global parallel-section argument, not numerical extrapolation of the singular rotor, supplies the mathematical way around the pole.

## 5. Corrected spatial-cutoff interpretation and source trial boundary

**Important correction to D1L:** the small-south-cap `β_ε(u)` is **not invariant under** the physical SVD deck map and cannot by itself be treated as a scalar function of the bosonic matrix `X`. Using it over a sign-unfixed `S⁸×S²` cover would double-count inconsistent coordinates. D1L's tabulated `Cβ(ε)~ε³` is a legitimate **cover angular integral**, but *not independently* a well-defined gauge-physical trial state.

Once the global deck-even smooth Fock vector is justified as above, the cleaner candidate is **`β≡1`** on the **physical quotient**. Its leading fixed-tube **model** coefficient drops from `26.060005495379112` to

`K_global_model = 17.39253562073588 + 4.913317456761263 = 22.30585307749714`.

That is a *trial-design improvement* and **not** a qualified original-H Rayleigh quotient. The exact SVD chart still requires the top singular value be simple, addressed by a compact fixed tube `‖Y‖<κr`, `κ<1`; there the oriented SVD cover and its deck quotient vary smoothly. With a true `C∞` radial shell cutoff, fixed smooth transverse tube cutoff and source-indexed normalized Fock vector descending to the quotient, this provides an **analytic route** to a compactly supported smooth Fock-valued function on the 27-dimensional bosonic configuration space. Its identity with the original Lean `SmoothCore 2`, `pairedGaugeData.invariantCore` and exact closed form remains **unqualified** and must be checked independently, not presumed from this geometric argument.

## 6. Fixed-tube tails: an explicit analytic upper bound

At optimized oscillator frequency `α=√2`, the squared transverse Gaussian has 16 iid coordinates with variance `1/(2αr)`. The tube transition begins at `‖Y‖≥κr/2`. Thus for a fixed `κ∈(0,1)`, with `x=ακ²r³/2`,

`P(transition) ≤ P(χ²₁₆ ≥ x) ≤ 2^8 exp(−x/4) = 256 exp(−ακ²r³/8)`.

The last inequality follows by Chernoff's bound with moment parameter `1/4`. For `κ=0.5`, the **exact** `χ²₁₆` survival at `r=8` is `2.0152×10⁻¹²` (Chernoff upper bound `3.8131×10⁻⁸`) and at `r=10` it is `3.7252×10⁻²⁹`. Derivatives of any fixed flat-endpoint tube cutoff are polynomially bounded in `r` on its transition support, so weighted Gaussian cutoff errors are bounded by a polynomial times `exp(−c r³)` for some positive `c` (a detailed bound for all source-energy operators is still needed). This is stronger than a numerical claim that the tube is negligible.

## 7. Reproducibility and negative knowledge

- `d1m_geometry.py`: exact integer source-Pauli Gamma construction and 72 random 48-Majorana/pole stress checks; `d1m_geometry_results.json`.
- `d1m_deck.py`: exact SymPy 24×8 orbital matrix, four positive-determinant 2×2 deck blocks, and zero occupied Berry-generator traces; `d1m_deck_results.json`.
- `d1m_tube_tail.py`: exact 16D Gaussian chi-square tails and Chernoff inequalities; `d1m_tube_tail_results.json`.
- A Python scoping defect in the **first local experimental version** of the color covariance derivative had silently accessed a module-global `n`; refactoring exposed it and the accepted source now requires the explicit `dCn(u,n,w)` argument. The corrected module and deterministic results were rerun. **The uncorrected local code is rejected; it was not committed.**
- The `S⁸×S²` **cover is not the physical rank-one SVD base**. The nontrivial deck sign could have invalidated the D1L cap proposal. We tested it instead of silently assuming descent.

## Project Lead next gate: D1N, still Python/analysis first

Check the **full original-GaugeData charge-form trial** constructed with the globally smooth quotient Fock vector and `β≡1`: exact source bosonic pullback vs Fock color action, all tangent/radial/tube derivatives, a nonzero compactly supported smooth test function, original massless interaction expectation and a rigorous uniform `q[Ψ_R]≤(K_global+o(1))/R²` estimate. Independent source typing and allowed-axiom Lean checks should begin **only after** the analytic and Python falsifiers cease finding a mismatch. Do not rerun D1K1A or D1F now. Preserve all historical RED evidence and avoid touching main, live RHOPF or original BFSS source.
