# D1I — Original 24-mode Fock vector lift and gauge-aware cutoff prescreen

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Disposition:** **FINISHED PYTHON NUMERICAL/ANALYTIC PRESCREEN, NOT LEAN-QUALIFIED AND NOT A PHYSICAL-SPECTRUM THEOREM.**  
**Reproducible attachment:** `bfss_su2_d1i_explicit_fock_lift_2026_11_21.zip`, SHA256 `f8412861d84ca336a37d801eb1c0c15a517a44958b3a3d697ba42a9627115c07` (23 files; delivered to owner in the chat, **not stored in Git**). Full report `BFSS_D1I_EXPLICIT_FOCK_LIFT_GAUGE_TRIAL_2026_11_21.md`, SHA256 `746ce65d445b408c81bd9eff9d62d28550d589c43baa0e7a7777a3c14fdca37b`. The ZIP includes three new executable scripts, deterministic result JSON, earlier D1F/D1G/D1H original-source prescreens and per-member SHA256 manifests. Source pins and results below preserve the central findings in Git even if attachments expire.

## Frozen original source contracts

- `Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: 27 real bosonic coordinates, original smooth-core charge, source kinetic `-Δ/2`.
- `PotentialBasis.lean`, blob `bc9b526284166efcba5a8e296adc79ba88e6764d`: source massless quartic potential `V_B=Σ_{i<j}||X_i×X_j||²`, color `f=√2 ε`.
- `FermionQuantization.lean`, blob `c6b72d030225c707ef54f5285a18a7a8175ee280`: source `Q_F(K)=(i/2)Σ K_rs θ_rθ_s` with `{θ_r,θ_s}=δ_rs`.
- `SU2RealGammaProbe.lean`, blob `b9b8192055c70f0d001d7982669b9823c55562ed`: original nine real 16×16 Gamma9; `Γ_8=Z⊗I⊗I⊗I`.
- `SU2BFSSG1APairedThetaProbe.lean`, blob `152204ef15a6569534e0503824a697cb9ae8e4ce`: exact 8 paired-spin-index blocks × 3 color modes = 24 complex original Fock modes.
- `SU2BFSSG3B24ModeOrthogonalLiftProbe.lean`, blob `3cdf867357ea2955bf9d88ec6f5f6a0f9228e92a`: source exact 24-mode orthogonal color action; **its source comments explicitly do not construct a complete Fock-space implementer**.

## D1I-1 explicit reference eight-particle Fock vector

At `u_*=e_8` (nine-dimensional spatial direction) and `n_*=e_0` (three-color direction), set `s_j=(Γ_8)_{2j,2j}`. For `j=0,...,7`, the original exact Gamma word has `s_j=+1` (four) and `s_j=-1` (four). The actual 24-mode Fock seed is

\[
b_j^\dagger=(c_{j,1}^\dagger+i\,s_j c_{j,2}^\dagger)/\sqrt{2},\qquad
\boxed{\Omega_*=\prod_{j=0}^7 b_j^\dagger|0\rangle}.
\]

Color-0 complex modes are empty. Each `b_j†` occupies a distinct normalized orbital, so `||Ω_*||=1` and its parity is even. On each of the eight original three-mode blocks, compute all six real Majorana bilinears using actual 8×8 Fock matrices. They reproduce the **entire** source covariance
\[
C_*=-\Gamma_8\otimes J(e_0)-J_{\rm pair}\otimes(e_0e_0^T)
\]
with maximum block residual **8.16×10⁻¹⁶**, norm residual **2.22×10⁻¹⁶**. No dense `2^24×2^24` Fock matrix is constructed.

For any color stabilizer rotation `h(θ)=exp(θJ(e_0))∈SO(2)`, the occupied `b_j†` has exact character `exp(i s_j θ)`, so the full state has stabilizer character `exp(i θ Σ_j s_j)=1` **at all angles**, not merely zero average charge. Numerical phase residual ≤**8.88×10⁻¹⁵**. **Adversarial control:** an incorrect all-plus occupation gives nontrivial `exp(8iθ)` phase and fails by up to 1.93.

## D1I-2 constructed finite-dimensional Fock lift on a spatial patch

Let `Γ(u)=Σ_i u_iΓ_i`. On `u_8>-1`, the **smooth real orthogonal Gamma rotor**
\[
\boxed{S(u)=[I+\Gamma(u)\Gamma_8]/\sqrt{2(1+u_8)}}
\]
satisfies `S(u)Γ_8S(u)^T=Γ(u)` and `S(e_8)=I`. On 48 real Majorana labels, define
\[
T_u=I_{16}\otimes(e_0e_0^T)+S(u)\otimes(I_3-e_0e_0^T).
\]
This rotates **both** transverse colors 1 and 2 equally and leaves color0 fixed. It commutes with the SO2 stabilizer at `e_0`. The path from the identity on the contractible supported hemisphere has a smooth Spin(48) lift `\widehat T_u` on the canonical original 24-mode Fock space. For any proper SO3 color rotation `O e_0=n`, set
\[
\boxed{\Omega(u,n)=\Gamma(O)\,\widehat T_u\,\Omega_*},
\]
where `Γ(O)=⊕_{k=0}^{24} ∧^k(I_8⊗O)` is the ordinary **number-conserving exterior-power** action, not a merely projective Majorana-orthogonal ray action. Because the full occupied seed has **trivial stabilizer character** and `\widehat T_u` commutes with it, the definition is independent of `O` and yields an SO3-equivariant **vector** across the entire color 2-sphere, on the chosen spatial hemisphere. The actual original SU2 central element maps to identity under this adjoint-color action, as intended. Do not mistake this finite-dimensional construction for an already-qualified source Fock `GaugeData` interface.

Numerical controls: 25 spatial-rotor tests have max Gamma conjugation error **1.18×10⁻¹⁵** and covariance lift error **1.67×10⁻¹⁵**; 20 general-color combined transports have max covariance error **2.76×10⁻¹⁵**. **Wrong-color negative control:** rotating only color1 gives covariance error **1.81**, while equal rotation on both transverse colors has error **8.88×10⁻¹⁶**. The Fock gauge/spin rotor one-form expectation vanishes in tested infinitesimal directions; a full analytic proof of the Berry-flat phase on the source carrier is still required.

## D1I-3 exact SVD angular metric and Fock derivative cost

For `X=r u n^T+Y`, `u^TY=0`, `Yn=0`, `σ_max(Y)<r`, the original ambient Euclidean angular metric is
\[
G_{\rm ang}=\begin{pmatrix}r^2I_8+YY^T&-2rY\\-2rY^T&r^2I_2+Y^TY\end{pmatrix}.
\]
With pure-ray Fubini–Study tensor `diag(2I_8,4I_2)` and a Berry-flat locally chosen phase, the **complete fermionic angular derivative** is
\[
E_\Omega(r,Y)=\tfrac12\mathrm{tr}[G_{\rm ang}^{-1}\,\mathrm{diag}(2I_8,4I_2)]
=\boxed{\frac6{r^2}+3\sum_{k=1}^2\frac{r^2+\lambda_k}{(r^2-\lambda_k)^2}},
\]
where `λ_k` are eigenvalues of `Y^TY`. At `Y=0` this is **12/r²**, so gauge-equivariance does **not** justify deleting color-orbit derivatives. Thirty inverse-metric checks residual ≤**1.12×10⁻¹⁶**. Under the exact D1H Jacobian-weighted Gaussian, its asymptotic expectation is
\[
\mathbb E_j E_\Omega=12/r^2+36\sqrt2/r^5+294/r^8+O(r^{-11}).
\]
D1H selected boson/frozen-fermion contribution is `−26√2/r⁵−117/r⁸+O(r⁻¹¹)`. Combined selected-plus-Fock derivative is therefore `12/r²+10√2/r⁵+177/r⁸+...`. Thirty-thousand-sample checks at `r=5,10,20,50` returned `0.496998,0.120514,0.03001591,0.004800163` for the Fock kinetic, tracking the asymptotic prediction.

## D1I-4 compactly supported color-equivariant candidate and asymptotic coefficient

On a rank-one-dominant SVD tube and the spatial sign-fixed patch `u_8>0.15`, define
\[
\Psi_R(X)=\mathcal N_R\,\chi(r/R)\,\beta(u)\,\eta(\|Y\|/r)
\,(\sqrt2 r/\pi)^4e^{-\sqrt2 r\|Y\|^2/2}\,\Omega(u,n).
\]
Choose `χ(t)=exp[-1/(t-1)-1/(2-t)]` on `1<t<2` (zero outside), `β(u)=smoothstep((u_8-0.15)/0.45)`, and any C∞ tube cutoff `η` equal 1 for `||Y||<κr/2`, zero for `||Y||>κr`, `0<κ<1`. These avoid the singular SVD locus and can define a compactly supported smooth Fock-valued **candidate**. The scalar is invariant under source color rotations and the local Fock vector equivariant under canonical exterior-power color action. The still-missing source interface is the exact complete original GaugeData representation and physical charge/form domain.

With rank-one tube Jacobian `r^{10}det(I_2-Y^TY/r²)` and original kinetic normalization `-Δ/2`, the leading *prescreen* expression is
\[
\lim_{R\to\infty}R^2 E_{\rm asymptotic}(R)=K
=\frac{\int_1^2 t^{10}\{\tfrac12|\chi'|^2+(12+C_\beta/2)\chi^2/t^2\}\,dt}
 {\int_1^2 t^{10}\chi^2\,dt},\quad
C_\beta=\frac{\int_{-1}^1(1-z^2)^4|\beta'|^2dz}
 {\int_{-1}^1(1-z^2)^3\beta^2dz}.
\]
Independent deterministic quadrature gives radial cutoff **17.39253562074**, Fock derivative **4.91331745676**, spatial cutoff **3.75415241788**, total **K=26.06000549538**. Approximate finite-R values from an eighth-order Fock-metric expansion and leading beta metric (tube tails excluded):

| R | Approximate E | R² E |
|---:|---:|---:|
| 10 | 0.26065016 | 26.06502 |
| 20 | 0.06515158 | 26.06063 |
| 40 | 0.01628755 | 26.06008 |
| 80 | 0.00407188 | 26.06002 |
| 160 | 0.00101797 | 26.06001 |

**Crucial ceiling:** These are **NOT exact full physical Rayleigh quotients**: the source D1F massless-field/Fock identity remains Lean UNQUALIFIED after three strict REDs; original full Fock-vector gauge action/domain identification is missing; tube cutoff Gaussian tails, phase and all original form-domain/quotient terms still require a *rigorous* error audit. No spectral/Weyl theorem follows yet, even if the asymptotic candidate is physically credible.

## Scientific context and next decision

The underlying commuting-valley continuum mechanism is not newly discovered here. **B. de Wit, M. Lüscher and H. Nicolai (1989), _The supermembrane is unstable_**, proved continuous spectrum starting at zero in a class of supersymmetric matrix models. D1I provides an **independent source-convention reproducibility challenge** rather than a priority claim. It is neither a spatial Hobart–Derrick soliton result nor a BFSS gap or bound-state theorem.

**Decision:** stop numerical free-form extensions; run one adversarial source-to-form/domain audit of this explicit ansatz (Fock GaugeData source equality; D1F original interaction identification; smooth compact tube cutoffs and all derivatives; independent nonnegative form and potential symmetry), followed by Lean only for a bounded statement that survives this audit. Preserve negative controls. No live RHOPF, main, CI, or original Lean changes.
