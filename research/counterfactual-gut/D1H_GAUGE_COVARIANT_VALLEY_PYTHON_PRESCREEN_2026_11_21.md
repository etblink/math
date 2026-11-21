# D1H — Source-exact Python gauge-covariant commuting-valley trial prescreen

**Date:** 2026-11-21. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Evidence disposition:** **FINITE-DIMENSIONAL PYTHON / EXACT LOCAL ALGEBRA + SELECTED GAUSSIAN MOMENTS** — NOT new Lean; NOT a Gauss-physical normalizable state; NOT a full BFSS H spectral result.

**Reproducibility delivered to owner:** `bfss_su2_d1h_gauge_covariance_research_2026_11_21.zip` SHA256 `f4749def49364eae243be97763bd6d8848d4a289ede88ee5bfea1463aec3c07e`, containing 16 files: the D1F/D1G original-source Python prescreens, two D1H executable scripts, JSON results, full 16KB D1H scientific report and SHA256SUMS. The full report `BFSS_D1H_GAUGE_COVARIANT_VALLEY_TRIAL_PRESCREEN_2026_11_21.md` has SHA256 `b32dc0380f5b019311a049df62941bb9040d61a548eace133ba5b4d8974d0e58`. Chat attachment is NOT hosted in the Git repo; this note preserves exact standalone formulas and scope in canonical history. Executable scripts require Python 3, NumPy, SciPy and SymPy, deterministic seeds and no network.

## 1. Exact original mathematical source pins

- `Core.lean` `9882359ced78b0a3bd7e2f057974bd0a031b3e60` (27 real bosons, 48 real Majoranas / original smooth-core charge).
- `PotentialBasis.lean` `bc9b526284166efcba5a8e296adc79ba88e6764d` and `PotentialSquares.lean` `a42500d241692b42532482fe8fad639bbdc17881` (massless source potential `V_B(X)=Σ_{i<j}||X_i×X_j||²`).
- Original normalized color `f_{abc}=√2 ε_{abc}`, probe `713b4f7301c5788a407f3679d5d52c59332805e3`.
- Source real Gamma9 Pauli words, `SU2RealGammaProbe.lean` `b9b8192055c70f0d001d7982669b9823c55562ed`.
- `FermionQuantization.lean` `c6b72d030225c707ef54f5285a18a7a8175ee280`, source `Q(K)=(i/2)Σ_{rs}K_{rs}θ_rθ_s`, original CAR `{θ_r,θ_s}=δ_rs`.
- Original paired 24 complex modes / 48 Majoranas `SU2BFSSG1APairedThetaProbe.lean` `152204ef15a6569534e0503824a697cb9ae8e4ce`.

## 2. A 48-Majorana Gaussian *ray* passes source and gauge-stabilizer tests

At rank-one valley `X_0=r u n^T` with `u∈S⁸`, `n∈S²`, define:
\[
\Gamma(u)=\sum_{i=0}^8 u_i\Gamma_i,\quad
J(n)_{bc}=\sum_a n_a\epsilon_{abc},\quad
J_{\mathrm{pair}}=\bigoplus_{j=0}^{7}\begin{pmatrix}0&1\\-1&0\end{pmatrix}.
\]
Original massless skew coefficient `K(X_0)=√2r Γ(u)⊗J(n)`. Define real fermion Gaussian covariance for `r≠s` by `C_{rs}=2i⟨θ_rθ_s⟩`:
\[
\boxed{C(u,n)=-\Gamma(u)\otimes J(n)-J_{\rm pair}\otimes nn^\mathsf T.}
\]
It satisfies `C^T=-C` and **`C²=-I₄₈`**, the pure Gaussian condition; the second term is essential to polarize the 16 real zero Majoranas. Omitting it yields `||C²+I||_F=4`, a controlled negative test.

Source-normalized fixed-X expectation:
\[
\langle Q(K)\rangle_C=\tfrac14\sum_{r,s}K_{rs}C_{rs}
=-8\sqrt2\,r.
\]
This equality persists at `X=r u n^T+Y` for any `u^T Y=0` and `Y n=0`. It is an expectation on a chosen **fixed-orientation pure Gaussian ray**, not an eigenstate of the full X-dependent matrix Hamiltonian.

For proper `O∈SO(3)` with `S=I₁₆⊗O`:
`C(u,On)=S C(u,n) S^T` and `K(r u (On)^T)=S K(r u n^T) S^T`. For the unbroken SO2 color generator `B_n=I₁₆⊗J(n)`, both `[B_n,C]=0` and `⟨Q(B_n)⟩=0` because `trΓ(u)=0`. A pure Gaussian covariance uniquely determines a Fock ray up to phase, so these data remove the connected stabilizer-charge obstruction to a color-equivariant lift; **a global smooth many-body phase and the full gauge-invariant wavefunction are still not explicitly constructed**.

Twelve random original gamma/color orientation/radius trials: purity max `3.18×10⁻¹⁵`; energy residual max `2.56×10⁻¹³`; proper SO3 covariance max `3.05×10⁻¹⁵`; stabilizer charge residual max `1.79×10⁻¹⁶`. Fifteen doubly transverse random `Y` cases: expectation error max `7.4×10⁻¹³`. The covariance is invariant under joint SVD sign flip `(u,n)↦(-u,-n)`.

## 3. The *exact* rank-one SVD tubular volume measure

On an SVD tubular chart with principal singular value `r`, `X=r u n^T+Y`, `u^TY=0`, `Y n=0` and `s_max(Y)<r`, the local ambient Euclidean measure is:
\[
\boxed{dX=r^{10}\,j_r(Y)\,dr\,d\Omega_{S^8}(u)\,d\Omega_{S^2}(n)\,dY,~
j_r(Y)=\det(I_2-Y^T Y/r^2).}
\]
The 10×10 angular metric block is
\[
\begin{pmatrix}r^2I_8+YY^T&-2rY\\-2rY^T&r^2I_2+Y^TY\end{pmatrix};
\]
its volume square root is `r¹⁰j_r(Y)`. Tested 24 random tubes against independent metric determinants; max error `3.22×10⁻¹⁵`. This is a Jacobian of **BFSS configuration coordinates**, not Hobart–Derrick spatial scaling.

The source bosonic potential decomposes **exactly** on that tube:
\[
V_B(r u n^T+Y)=r^2\|Y\|^2+\det(Y^TY).
\]

## 4. Gaussian selected energy and the missing Fock derivative

With the 16-dimensional transverse conditional amplitude
`φ_r(Y)=(√2r/π)^4 exp(-(√2r/2)||Y||²)` and squared-state variance `v=(2√2r)^{-1}`, let `t=||Y||²`, `d=det(Y^TY)`. Then `j=1-t/r²+d/r⁴` and exact **untruncated** Gaussian expectation `Z_r=E j=1−4√2/r³+7/r⁶`.

The color-gauge-invariant scalar `φ(X)=φ_{r(X)}(Y(X))` has ambient derivative
\[
\nabla_X\log\phi=(4/r-(\sqrt2/2)t)\,u n^T-\sqrt2r\,Y.
\]
Using this **scalar** kinetic form, original bosonic potential, fixed Gaussian Fock expectation and proper Jacobian, but OMITTING the *variable fermion spinor derivative*, radial cutoff and angular cutoffs:
\[
\boxed{E_{\mathrm{selected}}(r)
=-\frac{13(2\sqrt2 r^3-7)}
 {r^2(r^6-4\sqrt2 r^3+7)}
\sim-\frac{26\sqrt2}{r^5}.}
\]
The exact formula follows from Gaussian/Wishart moments `Et=16v`, `Ed=56v²`, `Et²=288v²`, `E(td)=1120v³`, `Ed²=5040v⁴`. This calculation extends the tube Gaussian to all Y with an exponentially small large-r tail: it is NOT a globally smooth trial state. The signed **negative partial energy is not a negative eigenenergy** of the nonnegative physical BFSS Hamiltonian; it flags omitted positive pieces.

The many-body Gaussian **Fubini–Study quantum metric** is `g=(1/16)tr((dC)^T dC)`, independently calibrated with an explicit 4×4 Fock spinor overlap: direct `0.2499999985` vs covariance `0.25`. Metric on the 8 spatial sphere tangents = 2 each; on the 2 color sphere tangents = 4 each; mixed zero. Thus the **phase-independent** fermionic-state derivative kinetic at exact rank-one, summed over ambient X:
\[
\boxed{\frac12\sum_{\mathrm{ambient}}\! g_X=\frac{12}{r^2}.}
\]
A chosen manybody phase can add a nonnegative Berry-connection term. Numerical Gaussian Berry curvature trace across 14 random orientations was ≤`2.53×10⁻¹⁵`, but this is not proof of a global trivial Fock line or phase. Do not discard color-orbit derivatives merely because combined Gauss covariance is expected.

| r | Selected incomplete energy | Phase-independent Fock derivative at Y=0 |
| ---: | ---: | ---: |
| 5 | −0.0120743 | 0.48 |
| 10 | −0.00036887 | 0.12 |
| 20 | −0.0000114951 | 0.03 |
| 50 | −0.00000011767 | 0.0048 |
| 100 | −0.000000003677 | 0.0012 |

150,000-sample controlled Monte Carlo checks at r=5,10,20 agree with analytically computed Jacobian-weighted moments to the reported sampling errors; the exact tiny energy cancellation is established **in the Gaussian moment model**, not by subtracting noisy O(r) MC energies.

## 5. The remaining Gauss-physical falsifier (D1I)

The natural *candidate* gauge-physical smooth-core wavefunction is
\[
\Psi_R(X)=\mathcal N_R\chi(r/R)\,\beta(u)\,\eta(\|Y\|^2/r^2)\,
(\sqrt2r/\pi)^4 e^{-\sqrt2r\|Y\|^2/2}\,\Omega(u,n),
\]
where `χ` is a compact radial cutoff on `1<r/R<2`, `β` is a smooth spatial patch cutoff, `η` is a rank-one tube cutoff, and `Ω` must be a **smooth norm-one actual Fock spinor** with covariance C, correct color equivariance, and controlled derivatives. Those source-defined geometric/covariance ingredients exist; **the complete many-body lift, Gauss projection, exact normalization, cutoffs, original source charge-graph/form domain and full Rayleigh quotient have not been checked**. The selected cancellation and Fubini–Study metric support the prospect of an O(R⁻²) energy trial, but **no Weyl sequence, 0-essential-spectrum theorem, or physical BFSS mass-gap conclusion is claimed**.

A successful next D1I gate must explicitly construct the smooth color-equivariant many-body Fock lift and verify original Gauss law and all kinetic terms; otherwise record the precise obstruction. Keep D1F Lean formally UNQUALIFIED (three strict source REDs), and do not conflate matrix-coordinate scaling with 3D Hobart–Derrick or derive Hopf soliton/GUT from these tests.

**Governance:** no original source, pinned Lean/Mathlib, main, live RHOPF branch or CI workflow changes. No CI triggered by this documentation-only checkpoint.
