# D1Q — Original SU(2) BFSS Gaussian Fock line: global source-carrier smooth core and Gauss bridge

**Date:** November 21, 2026. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Audited baseline:** `74d6a07312af396e6c6125398d59f6effcdda8af` (D1P).  
**Disposition:** **SOURCE-ANCHORED ORDINARY MATHEMATICAL ARGUMENT + INDEPENDENT PYTHON FINITE-DIMENSIONAL FALSIFIERS. NO NEW LEAN/CI.** No formally kernel-qualified source `SmoothCore 2` trial, original physical form-domain membership, bound for the original associated Hamiltonian, essential-spectrum statement, hopfion, or unification theorem is claimed. No change to original Lean sources, unified integration, main, live RHOPF or CI.

## Executive decision

The key obstruction identified in D1N–D1P can now be sharpened into an explicit *source-carrier theorem architecture*. The original paired 48 Majoranas determine a polynomial rank-one Gaussian projector on the literal `Fermion 2` carrier. The BFSS covariance family has a flat Berry connection; its SVD deck holonomy was independently determined as `+1` in the full 24-orbital source-paired model. The line therefore supports a smooth global normalized parallel section on the physical sign-identified rank-one SVD base. Source `G4J` gauge covariance and the absence of nontrivial continuous characters of `SO(3)` give a route to the **exact gauge-equivariant phase**, not just an equivariant projector. An improved *squared-distance* compact tube cutoff is smooth at the zero transverse matrix and has support uniformly separated from singular-value collision.

This is a substantive **ordinary mathematical proof strategy** conditional on the individual source-indexed CAR/holonomy derivations and correct operator-to-vector identifications. In the present project governance it remains **unqualified in Lean**, and its connection to the actual original closed physical form requires a source-typed construction. The resulting Gaussian line is **topologically trivial** (zero curvature *and* trivial Z2 holonomy), hence cannot by itself supply nonzero Berry first Chern topology for a physical Hopfion. This places no restriction on topological structures carried by other fields/order parameters.

## Exact frozen source contracts used

| Literal source | SHA-1 blob | Critical original interface |
| --- | --- | --- |
| `Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | `Fermion 2`, `Boson 2`, `SmoothCore 2`, 16-charge `coreForm` |
| `GaugeCore.lean` | `e4990dadf1d8bde849e351467282ab3f14989c3b` | `GaugeData.physicalSpace`, `invariantCore`, pullback/fiber equality |
| `SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | `pairedLabelEquiv`, 48 exact CAR operators |
| `SU2BFSSG3AAdjointColorRepresentationProbe.lean` | `553869f1287c64893398c3b79c04fe010023bd08` | `adjointColorMatrix g` rows output colors, columns input |
| `SU2BFSSG4AExteriorGaugeActionProbe.lean` | `141fbe74fc4883f686e05dbc702efb12c6fb8fab` | true `ExteriorAlgebra.map` one-particle color action |
| `SU2BFSSG4EFermionHilbertUnitaryProbe.lean` | `7247844122ab870d31e92903db4c2ab561f98112` | true `Fermion 2` unitary G4E, `fockAlgebraToBFSS` transport |
| `SU2BFSSG4JExactGaugeDataAssemblyProbe.lean` | `e20c76fb22bc09d16dbcd8657333227cb34ed1ea` | literal `pairedGaugeData.fermion = fermionGaugeUnitaryHom`, theta covariance |
| `SpectralMasslessCoreFormIdentity.lean` | `3a8dd27bb573e62c8f86b79b83e0ab96f391602a` | original massless energy equality **on** `SmoothCore` |
| `SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | actual nine original Gamma9 matrices |

D1F three source-typed strict REDs and D1K1A R1 strict RED remain frozen, and the prospective `L6H5E8BF` original-graph crosswalk must not be promoted without its own qualification. The historical original normalized physical-H port is a separate source root; no new join was performed here.

## 1. The global Hermitian line on the true original Fock carrier

On the oriented SVD cover `E = S^8 × S^2`, for `u∈S^8`, `n∈S^2`, define

\[
C(u,n)=-\Gamma(u)\otimes J(n)-J_{\mathrm{pair}}\otimes nn^T,
\quad C^T=-C,\quad C^2=-I_{48}.
\]

By the original `pairedLabelEquiv`, the source Majoranas `θ_a` satisfy `{θ_a,θ_b}=δ_ab` on the literal `Fermion 2` of complex dimension `2^24`. Let `γ_a=√2 θ_a`, and

\[
H_C=-\frac{i}{4}\sum_{a,b}C_{ab}\gamma_a\gamma_b,\qquad
P(C)=\prod_{k=1}^{24}\frac{(k-12)I-H_C}{k}.
\]

The standard CAR argument of D1P (24 commuting Clifford involutions, trace vanishing for nontrivial Clifford monomials) shows **mathematically**, independent of matrix realization, that `P(C)` is a Hermitian rank-one projection. No global orthogonal frame is needed in its *definition*, which is polynomial in the entries of `C`; its image is therefore a smooth Hermitian complex line in the **source carrier**. The exact source `Gamma8` signs and three-mode Fock blocks identify the base reference vector with the eight-particle `Ω_*` from D1I. This is an ordinary mathematical consequence of the stated source CAR assumptions; it has not been checked by Lean in this candidate module.

Gauge transformation with `T_g = I_16⊗R(g)` follows from `G4J.fermion_adjoint`:

\[
U_gH_CU_g^{\dagger}=H_{T_gCT_g^T},\qquad
U_gP(C)U_g^{\dagger}=P(T_gCT_g^T).
\]

The color matrix has exactly the `G3A` output-row/input-column orientation; unlike an abstract Pin/Spin implementer, `U_g` is the original qualified 24-mode exterior-power unitary in `Fermion 2`. The SU(2) center acts trivially in this adjoint-color exterior representation.

## 2. Flat connection, Z2 deck descent, and exact gauge phase

The Berry curvature of the rank-one projector is `i tr(P[dP,dP])`. D1P's finite-CAR identity relates this to `tr(C[dC,dC])/16`; all spatial/spatial, spatial/color and color/color BFSS terms vanish by the source Gamma/color tensor algebra. Thus this Gaussian line is **flat** as an ordinary smooth line bundle. The cover `S^8×S^2` is simply connected, so Kato's rank-one parallel connection gives a global unit parallel vector `Ω(u,n)` after choosing `Ω(e8,e0)=Ω_*`.

The physical rank-one SVD base identifies `(u,n)~(-u,-n)`; this action is free and its quotient has `π1=Z2`. Zero Berry curvature alone is **not** enough to descend a single-valued vector: a flat line could carry `-1` holonomy on the generator. The D1M/D1P *full source-paired 24-orbital* half-turn path has zero occupied Berry trace along the path and endpoint wedge determinant `+1`. Hence the deck generator has trivial holonomy and `Ω(-u,-n)=Ω(u,n)` after parallel normalization. The Gaussian line is therefore a **trivial flat line on the quotient**, including its possible torsion obstruction; its first Chern class vanishes.

For `O∈SO(3)` in the original gauge action, the unitary `U(O)` carries the projector/connection at `(u,n)` to the one at `(u,On)`. Therefore `U(O)Ω(u,n)` and `Ω(u,On)` are globally parallel sections differing by a constant phase `χ(O)` independent of `(u,n)`. Since the gauge action is a genuine representation, `χ` is a continuous character of `SO(3)`, which must be trivial. This obtains the **vector** identity, not just ray covariance:

\[
\boxed{\Omega(u,On)=U(O)\Omega(u,n).}
\]

This argument depends on proving the exact source CAR gauge covariance, Berry-flatness, and `+1` deck holonomy. It does not replace the source-typed implementation of a Kato section or a formal `SmoothCore` object.

## 3. Source-ready analytic compact test-function formula

On any `X∈R^{9×3}` with simple largest singular value `r=σ1(X)>0`, write

`X=r u n^T + Y`, `u^T Y=0`, `Yn=0`, `(u,n,Y)~(-u,-n,Y)`.

For fixed `κ∈(0,1)` and `R>0`, choose the original `χ∈C∞_c((1,2))`, and choose a **squared-distance** smooth plateau `η∈C∞(R)` with `η(ρ)=1` for `ρ≤1/4`, `η(ρ)=0` for `ρ≥1`, all endpoint derivatives zero. Set

\[
\rho(X)=\frac{\|Y(X)\|^2}{\kappa^2r(X)^2},\qquad
\Psi_R(X)=N_R\,\chi(r/R)\eta(\rho)
(\sqrt2r/\pi)^4e^{-\sqrt2r\|Y\|^2/2}\,\Omega(u,n).
\]

Set `Ψ_R=0` outside the simple-SVD patch and the support. Since the cutoff depends on `||Y||²`, it is smooth even at `Y=0` (no nonsmooth norm composition). It is **deck invariant** and smooth as a source-Fock-valued vector conditional on the global Kato section. On the nonzero support:

- `R≤r≤2R`, `||Y||≤κr`, so `σ2(X)≤||Y||≤κr`; spectral gap `r−σ2≥(1−κ)r`;
- `||X||²=r²+||Y||²≤4(1+κ²)R²`, so support is compact and separated from `r=0` and the top-SVD collision set;
- flat cutoff derivatives imply smooth zero extension across radial/tube faces;
- at `r=3R/2`, `Y=0`, `χ>0`, `η=1`, `||Ω||=1`, so `Ψ_R` is not zero and its L² norm can be normalized;
- physical color rotations give `r` and `||Y||` invariant and `(u,n,Y)→(u,On,YO^T)`, so `Ψ_R(XO^T)=U(O)Ψ_R(X)`; with G4J's exact SU2 source interface, this is the literal pointwise Gauss condition.

Consequently, the ordinary analysis has an explicit route to `Ψ_R∈C∞_c(R^{27},Fermion 2)` and to source `pairedGaugeData.invariantCore`. The last step remains **unqualified in Lean** because the source has not constructed/checked the global Kato map into its exact dependent `TestFunction` carrier, nor the pointwise equality in that type.

### Uniform differential bound and improved cutoff derivative

For a perturbation `H∈R^{9×3}`, the pair `(du,dn)` solves

\[
\begin{pmatrix}rI&-Y\\-Y^T&rI\end{pmatrix}
\begin{pmatrix}du\\dn\end{pmatrix}
=\begin{pmatrix}(I-uu^T)Hn\\(I-nn^T)H^Tu\end{pmatrix}.
\]

This symmetric block system has smallest eigenvalue at least `r−σ2` (restricting to tangent subspaces). Hence

\[
\|(du,dn)\|\le\frac{\sqrt2\|H\|_F}{r-\sigma_2},\qquad
\|dC_X(H)\|_F\le\frac{8\sqrt5\|H\|_F}{r-\sigma_2}.
\]

The last bound uses `||Gamma(v)||F=4||v||`, `||J(w)||F=√2||w||`, `||Jpair||F=4`. It is deliberately coarse but uniform on the support and controls source CAR polynomial derivatives.

With `t=||Y||²` and `dr=u^THn`, exact SVD geometry gives `dt=2⟨Y,H⟩`, therefore

\[
\nabla_X\rho=\frac{2Y}{\kappa^2r^2}
-\frac{2t}{\kappa^2r^3}un^T.
\]

The independent Python implementation differentiates the squared cutoff and checks the above expression against ambient central differences. On the fixed tube transition (`κr/2≤||Y||≤κr`), derivatives of the scalar cutoff are polynomially bounded; the Gaussian tail is exponentially small as already established in D1M/D1N. Changing from norm-based to squared-norm cutoff therefore **does not change the leading D1N model coefficient**, although finite-R values would change in the exponentially small tail.

## 4. Independent D1Q falsifiers, outputs and negative controls

`d1q_svd_smooth_core_prescreen.py` uses the **actual original nine Gamma Pauli words** and 70 randomized original 9×3 matrices. It independently tests the SVD deck, exact color covariance, full ambient SVD derivatives and analytic covariance derivative bound, squared-cutoff gradient, compact support away from top-singular-value degeneracy, and gauge invariance of scalar and gradient. Maximum residuals:

| Check | Max discrepancy |
| --- | ---: |
| Original covariance under SO3 color | `7.727e-15` |
| Full ambient covariance derivative vs finite difference | `3.952e-10` |
| Squared-cutoff derivative vs independent finite difference | `3.782e-12` |
| Squared-cutoff gauge-gradient transformation | `8.865e-17` |
| Violations of spectral-gap / derivative-bound / off-tube vanishing inequalities | `0` in tested cases |

`d1q_kato_source_gauge_prescreen.py` uses a **reduced six-mode** (two source-paired Gamma7/Gamma8 signs) CAR Hilbert space. It constructs the actual exterior-power color `U(O)` by occupation-minor determinants, and compares it with Kato transport of the **unit vectors**, not merely their projectors. In 10 random rotations:

| Check | Max discrepancy |
| --- | ---: |
| Source-oriented Majorana covariance | `7.466e-16` |
| Projector conjugation | `1.590e-15` |
| Creation-operator covariance | `5.833e-15` |
| **Vector-level Gauss equality** | **`5.956e-16`** |
| Wrong-transposed-color negative control | **at least `0.7893`** |

The noncontractible `2π` SO3 rotation loop has Kato return phase `+1` at 24/48/96 subdivisions. The reduced-mode tests are **not** 24-mode original-carrier compile evidence. This is consistent with the D1M/D1P exact full-24-mode deck calculation, but not a replacement for it.

**Rejected implementations:** initial D1Q SVD finite-derivative test used an invalid matrix multiplication `u @ H.T @ u` for the color tangent, causing an immediate dimension error; the correct `u @ H @ n` was restored and all tests rerun. We also reject treating the SVD deck or source Gauss phase as proved by covariance invariance alone; both need the separate full-orbital holonomy/connection evidence. No silent matrix-size, orientation or source-Fock substitution is allowed.

## 5. Scientific implications and conservative next gate

**Positive:** At the ordinary finite-dimensional mathematical level, the construction supplies an explicit source-anchored route to a globally smooth, normalized and gauge-equivariant Fock vector, and a compactly supported `C∞` trial built from a frame-independent squared cutoff. This eliminates the earlier *geometric* reason for maintaining an artificial spatial patch and narrows the *formal* proof boundary to specific source declarations.

**Negative/topological:** The Gaussian line is flat **and** has trivial deck holonomy. Its first Chern class is therefore zero; it is **not itself a Berry-line hopfion charge**. This does not rule out nontrivial topology from a different physical field, a configuration map, or a composite order parameter.

**Unresolved and unpromoted:** No new original `SmoothCore 2` or `pairedGaugeData.invariantCore` membership declaration has been proved by Lean; `D1P`'s CAR normal form and global Kato construction remain an ordinary mathematical argument, not kernel-checked source theorems. The original full physical form bound and inferred continuum must still join to that exact source test. The conditional `K_global≈22.3058530775` is not upgraded to a source-qualified original-H result. Do not infer a stable/localized Hopfion, mass gap, Standard Model spectrum, or GUT.

**Recommended next action:** D1R should be *one source-exact proof pilot*, conditional on a local type-check: (i) define original 48-Majorana `H_C` and scalar `P(C)` on `Fermion 2`; (ii) source-typed rank one and gauge covariance from existing CAR/G4J; (iii) only then Kato section / smooth quotient zero extension / invariantCore; (iv) then the source massless form join. Avoid blind full-build CI while the exact Lean declarations remain unelaborated; **do not modify the original source or touch main/unified/RHOPF**.
