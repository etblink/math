# BFSS JOIN-0 forward research — skew Fock observables, bounded coefficient field and CAR trace interface

**Date:** 2026-11-10 (Pacific).  
**Branch / research snapshot:** `etblink/math` / `integration/bfss-unified-research-20261108` at `feae0ee52eecaa3c5e496cf62582d6b9ae28e590`, while strict VLY-0B run #42926845593 was running.  
**Status:** SOURCE-FAITHFUL MATHEMATICAL DERIVATIONS, SMALL PYTHON CHECKS AND FUTURE LEAN GATE DESIGN. **NOT** new Lean qualification, physical form-domain compatibility, Hamiltonian conservation or spectral theorem.  
**No original source, accepted strict manifests, toolchain, branch ancestry or live workflow changed in this research pass.**

## 0. Exact existing sources and accepted gates

1. Original `Boson 2`, `SpaceIndex = Fin 9`, `SpinIndex = Fin 16`, `ColorIndex 2 = Fin 3`, original finite `Fermion 2` with `dim_ℂ = 2^24`: [original BFSS Core](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean), blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`.
2. Original G1A true `pairedTheta` and delta-one CAR `{θ_{αA},θ_{βC}}=δ_{αβ}δ_{AC} I`, plus true Hilbert self-adjointness: [G1A source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean), blob `152204ef15a6569534e0503824a697cb9ae8e4ce`.
3. Source original real 16×16 symmetric gamma with exact Clifford square and 9-vector linear lift: [original gammas](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean) blob `b9b8192055c70f0d001d7982669b9823c55562ed`; [all-vector lift](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean) blob `f53d7c52559d8e00061716d2746a87154e35e3fa`.
4. Qualified spatial Gram M on literal `Boson 2`: [VLY-0A](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean), strict [#42908736563](https://github.com/etblink/math/actions/runs/42908736563).
5. Qualified arbitrary-real-spinor-coefficient original Fock quadratic Q(J) and exact SU2 covariance: [BIL-0C](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean), strict [#42924009228](https://github.com/etblink/math/actions/runs/42924009228) at `617d75216c1120418ab9209d679a735491dc2db9`.
6. VLY-0B [Gram–gamma map candidate](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0BOriginalGramGammaCoefficient.lean), blob `e495f780f9ac382ac1e076ef20fa68b33c38f1cd` and independent trace consumer; **gate #42926845593 was not polled or promoted during this parallel research**.
7. Reuse [F1B original bivector skew-adjoint source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1BOriginalThetaBivectorSkewAdjoint.lean), blob `75cdfab1c25e961ba777c9788e77a3e6e4ee6d70`; [T1 original Fock trace](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/T1OriginalFockTraceInvariance.lean), blob `3be6c9a6f2898484df66690f94fdfa1877660897`; [B3 physical Fock-star action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean), blob `b50ef04695587b267ad8519074b1293f98828749`. **F1B/T1 do not already assert the exact skew-coefficient trace formula below.**

## 1. Pointwise JOIN is logically simpler than direct Kx color expansion

Define for arbitrary real spinor matrix B and original bosonic configuration x:

\[
G_x(B)=\sum_{i,j=0}^8 M_{ij}(x)\gamma_iB\gamma_j,\qquad
F_B(x)=Q(G_x(B)).
\]

Here `Q = BIL-0C.originalColorQuadratic` accepts any real `Matrix SpinIndex SpinIndex ℝ`. No skewness hypothesis is required to DEFINE or GAUGE-TRANSPORT F_B.

From the accepted BIL-0C theorem, for any real J and original g,v:
\[
U_gQ(J)v=Q(J)U_gv.
\]
From VLY-0B **if its source gate qualifies**:
\[
G_{g\cdot x}(B)=G_x(B).
\]
Consequently:
\[
\boxed{ U_g F_B(x)v = F_B(g\cdot x)U_gv .}
\]

This is a direct pointwise theorem on actual `Fermion 2` with genuine original G2A boson gauge and G4E Fock unitary. It needs no direct color-column Kx identity, eigenvector, actual spinor Spin9 Fock vector lift, S3D source, physical `FullL2` or unbounded-domain machinery. Do **not** make JOIN-0A artificially depend on the later color-column or spectral gates.

### Minimal Lean root and consumer (not compiled in this memo)

Import only BIL-0C and VLY-0B. Define `originalFockGramObservable (x : Boson 2) (B : GammaMatrix) : Fermion 2 →L[ℂ] Fermion 2 := originalColorQuadratic (originalGramGammaCoefficient x B)`. Prove `fermionGaugeUnitaryHom g (originalFockGramObservable x B v) = originalFockGramObservable (bosonGaugeEquiv g x) B (fermionGaugeUnitaryHom g v)` by exact rewrites using the accepted BIL-0C root and VLY-0B root. Independent consumer: norm equality under simultaneous G2A/G4E gauge action using qualified G4E unitary isometry, not just an identical rewriting of the source theorem. Freeze all accepted parent blobs, new source and new consumer, cold pinned Lean/Mathlib and standard axioms.

## 2. CAR forces symmetric quadratic coefficients to collapse to a scalar

For a real coefficient J define its symmetric and skew parts `S=(J+Jᵀ)/2` and `A=(J-Jᵀ)/2`. From exact original delta-one CAR and the three colors,
\[
Q(J)=\sum_{\alpha,\beta,A} J_{\alpha\beta}\theta_{\alpha A}\theta_{\beta A},
\qquad
\boxed{Q(J)=\tfrac32\,\mathrm{tr}(S)I+Q(A).}
\]
Proof: for fixed original color A, the S-weighted sum is one-half the S-weighted CAR sum; it equals `(1/2)tr(S)I` since off-diagonal anticommutators vanish. There are exactly 3 colors. Scalar contribution equals `(3/2)tr(J)I` because `tr(A)=0`; in particular every symmetric trace-free J maps to zero in Q.

For real skew A, original Fock self-adjoint theta gives
\[
Q(A)^*=-Q(A),\qquad \boxed{i\,Q(A)\text{ is Fock self-adjoint}.}
\]
Pair `(\alpha,\beta)` with `(\beta,\alpha)`; use the correct **physical Hilbert adjoint**, not the odd-generator star of a surrogate Clifford algebra. Reuse F1B and original G1A self-adjointness. This is a new statement about `Q(A)`, **not yet compiled**.

## 3. Source Gram–gamma map preserves real skew coefficients

The literal source gammas are real symmetric, and the Gram of real spatial color vectors is symmetric: `M_{ij}(x)=M_{ji}(x)`. Thus for real skew B:
\[
\begin{aligned}
G_x(B)^\mathsf{T}
&=\sum_{ij}M_{ij}\gamma_j B^\mathsf{T}\gamma_i\\
&=-\sum_{ij}M_{ji}\gamma_i B\gamma_j\\
&=-G_x(B).
\end{aligned}
\]
No spectral projector or topological assumption. Accordingly `iQ(G_x(B))` is pointwise **actual Fock self-adjoint**, with source symmetry and real CAR sufficient. Normalization by a positive real scalar preserves skewness.

There are additional simple coefficient identities. Set `T(x)=\sum_i M_{ii}(x)=\|x\|^2`. By the exact Clifford anticommutation and Gram symmetry,
\[
\boxed{G_x(I)=T(x)I,\qquad \mathrm{tr}_{16}(G_x(B))=T(x)\,\mathrm{tr}_{16}(B).}
\]
For the trace equality: cycle the real matrix trace, and use `∑_{ij}M_{ij}\gamma_j\gamma_i=T I`. Both identities can be proved without a color-column expansion.

## 4. Sharp source gamma bound and a useful cheap fallback

Define original true color columns `x_A=(x_{iA})_{i=0}^8\in ℝ^9` and `Γ_A(x)=\sum_i x_{iA}\gamma_i`. Original M is `M_{ij}=\sum_A x_{iA}x_{jA}`. The finite sum identity
\[
\boxed{ G_x(B)=\sum_{A=0}^2\Gamma_A(x)B\Gamma_A(x) }
\]
is an elementary distributivity computation, but its exact `spatialColor`/`WithLp` source binding is **still unqualified in current Lean**. Use it as an independent VLY-0B2 proof task rather than treating notation as definitional equality.

The qualified gamma all-vector square law gives `Γ_A^\mathsf{T}=Γ_A` and `Γ_A^2=\|x_A\|^2I`. For nonzero `x_A`, `Γ_A/\|x_A\|` is a real orthogonal matrix. Therefore for the real Frobenius/Hilbert–Schmidt matrix norm,
\[
\|\Gamma_A B\Gamma_A\|_F=\|x_A\|^2\|B\|_F,\qquad
\boxed{\|G_x(B)\|_F\leq T(x)\|B\|_F.}
\]
The zero-column case is immediate. Do not confuse Frobenius on 16×16 real matrices with Hilbert–Schmidt on the `2^{24}`-dimensional complex Fock carrier.

**Proof-engineering fallback avoiding VLY-0B2:** use `|M_{ij}|\leq\sqrt{M_{ii}M_{jj}}` (Gram Cauchy–Schwarz) and `∑_{ij}|M_{ij}|\leq9 T`, plus gamma conjugation isometric. Already from the Gram-index expression:
\[
\boxed{\|G_x(B)\|_F\leq9\,T(x)\|B\|_F.}
\]
This is weaker but may reach a bounded original-Fock multiplier with a smaller Lean dependency DAG. Select the **proof route** based on source complexity, not a desire for a sharp constant.

### Fock operator norm, source exact normalization

From `θ_{\alpha A}^2=(1/2)I` and true self-adjointness, `‖θ_{\alpha A}‖_{op}=1/\sqrt2`, so `‖θ_{\alpha A}θ_{\beta A}‖_{op}\leq1/2`. For any real J,
\[
\|Q(J)\|_{op}\leq\tfrac32\sum_{\alpha,\beta}|J_{\alpha\beta}|
\leq\tfrac32\sqrt{16^2}\,\|J\|_F
=\boxed{24\|J\|_F}.
\]
This loose explicit constant is sufficient; better constants are possible but not needed. In fact a finite-dimensional continuous real-linear map `Q : Mat16(ℝ) → End_ℂ(F)` automatically has some finite operator bound C_Q, so no explicit CAR-norm constant is needed for the *first* boundedness gate.

The normalized field
\[
\widetilde F_B(x)=iQ\!\left(\frac{G_x(B)}{1+T(x)}\right)
\]
obeys **the sharp-route estimate**
\[
\boxed{\|\widetilde F_B(x)\|_{op}\leq24\|B\|_F\quad\forall x}
\]
and **the cheap Gram-only-route bound** `≤216‖B‖_F`. The functions are continuous in the finite-dimensional source coordinates; a uniformly bounded measurable field defines a bounded multiplication operator on original `FullL2 2`, once the source-typed measurability and integration library adapter are supplied.

**Important separate obligation:** preserving the original `GaugeData` physical-invariant subspace, closed supercharge graph and form domain is NOT automatic merely from boundedness or pointwise gauge covariance. Even a bounded gauge-invariant multiplier need not preserve the original charge domain or commute with the original Hamiltonian.

## 5. Exact CAR trace pairing: a potentially valuable new *faithful* 120D bridge

An additional finite-dimensional identity should be tested and then proved using original CAR plus the **true original Fock trace**, which already has a source adapter in T1.

Let `D=dim_ℂ Fermion 2=2^24`. For distinct Majorana labels p<q, set `E_pq=2 θ_p θ_q`. The exact delta-one CAR implies `E_pq^*=-E_pq`, `E_pq^*E_pq=I`. Distinct unordered Clifford grade-two words are trace-orthogonal:
\[
\operatorname{Tr}(E_{pq}^{*}E_{rs})=D\,\delta_{(p,q),(r,s)}.
\]
For distinct pairs the trace vanishes: the product is a nonidentity Clifford word of positive even grade, and conjugation by a Majorana from its support reverses its sign while leaving the trace invariant by cyclicity. For equal pairs the product is the identity.

For real skew B, `Q(B)=\sum_{A,\alpha<\beta} B_{\alpha\beta}E_{(\alpha,A),(\beta,A)}`. Consequently, for real skew B,C:
\[
\boxed{\operatorname{Tr}_{Fock}\big(Q(B)^*Q(C)\big)
=\frac{3D}{2}\sum_{\alpha,\beta}B_{\alpha\beta}C_{\alpha\beta}.}
\]
The factor 3 is the number of colors; `D/2` reflects the two orientations of each skew pair; the normalization is the **original δ-one CAR**, not `{Γ,Γ}=2δ` unless `Γ=\sqrt2 θ` is explicitly used.

If qualified, this proves that `Q|_{\mathfrak{so}(16)}` is a scaled **isometric injective real-linear embedding** into the actual Fock Hilbert–Schmidt operator space. It does **not** prove that `Q` is injective on all real matrices (symmetric trace-zero matrices lie in its kernel).

**Why it matters:** the 120D original gamma coefficient geometry can be carried faithfully into a 120D subspace of *actual Fock observables*. One could define an induced auxiliary superoperator on that subspace by conjugating `K_x` with this injective map, transferring its finite-dimensional inertia without claiming an original physical Hamiltonian reducing sector or positive BFSS eigenvalue. This is a stronger concrete algebraic correspondence than a bare dimension count.

**Lean dependencies:** use T1's original-Fock trace adapter and Mathlib `LinearMap.trace_map` only where needed; first isolate a CAR-grade-two word trace orthogonality theorem. The existing B3/T1 trace **invariance under Spin9** is not this new CAR trace orthogonality theorem. Do not substitute it.

## 6. Independent numerical checks and their limits

A new [source-Git-blob-pinned Python checker](tools/bfss_join0_skew_field_car_trace_probe.py) reuses the earlier `bfss_kx_exact_moment_spectrum_check.original_gamma` source parser and fails on any drift of the original `SU2RealGammaProbe.lean` Git blob. From repository root execute:

```sh
python3 research/unification/tools/bfss_join0_skew_field_car_trace_probe.py
```

This checker was staged as reproducible forward research; its post-commit execution and source-copy availability must be verified separately. Do not infer a new independent CI qualification merely from the script's existence.


A local Python check using the exact extracted signed-permutation gamma tables (frozen original source blob `b9b819...`) on **12 seeded 9×3 integer configurations** verified:
- Gram-index and color-column formulas coincide on arbitrary skew and general test inputs;
- `G_x(B)` is skew for skew B;
- `tr(G_x(C)) = T tr(C)` for arbitrary real C;
- `‖G_x(B)‖_F ≤ T‖B‖_F`.

The maximum sampled ratio `‖G_x(B)‖_F/(T‖B‖_F)` was approximately `0.756916`. This is a sample, **not** the proof of the bound (the Clifford derivation above is).

A separate **3-color × 2-spin** toy original-normalization model (6 Majoranas, `D=8`) constructed Jordan–Wigner matrices `θ_{0,A},θ_{1,A}`, checked the delta-one CAR, symmetric scalar collapse, skew adjointness and the exact trace pairing with `3D/2=12`. The test is a normalization cross-check, **not** an executable demonstration of the full 48-Majorana Fock trace identity.

The source-pinned exact original Kx moment/near-valley numerical investigation is preserved separately in [Kx moments](BFSS_KX_MOMENTS_POTENTIAL_VOLUME_AND_VALLEY_DISCRIMINANT_2026_11_10.md). Avoid promoting any Python result directly to Lean-certified topology or a Hamiltonian spectrum.

## 7. Recommended future gates with explicit stopping rules

| Gate | Small new source theorem | Separate consumer | Do not include |
| --- | --- | --- | --- |
| **JOIN-0A** *after VLY-0B strict green* | Pointwise genuine G2A/G4E covariance of `Q(G_x(B))` for any real B | Norm equality for transformed x and v | Eigenvalues, skewness, physical L2 |
| **JOIN-0B1** | Real skew preservation by Gram–gamma coefficients | Test `tr(G_x(B))=0` or another independent skew consequence | Physical self-adjointness |
| **JOIN-0B2** | Original CAR skew-adjointness of `Q(B)` for real skew B; `iQ(B)` self-adjoint | Self-adjointness of one actual source-typed field | Full physical charge-domain |
| **VLY-0B2** | Equality of Gram `G_x(B)` with exact original three-color gamma-column sum | Test diagonal `G_x(I)=T I` | Kx moment/spectral classification |
| **NORM-0** | Uniform normalized coefficient + Fock operator bound (cheap or sharp route) | Boundedness of original `FullL2 2` multiplication | Physical L2 gauge fixedness/domain |
| **CAR-TRACE-0** | `Tr(Q(B)^*Q(C))=(3·2^{24}/2)⟨B,C⟩` on source skew carrier | Injectivity/scaled norm identity | Claim of physical-sector eigenstates |
| **PHYS-0** later | True gauge physical Hilbert restriction, charge/form-core preservation | Independently typed original closed form test | Mass gap or point spectrum without coercivity |

The first JOIN gate is **independent of VLY-0B2 direct color columns** and the 56/64 auxiliary eigenbundle. Keep that DAG edge absent so a topological/analytic difficulty does not block an already available algebraic interface.

## 8. Scientific and maintenance boundary

- No new Fock-vector Spin9 unitary, true source Spin8 stabilizer, original physical `L²` multiplier, source Hamiltonian symmetry, spectral confinement, positive point spectrum, mass gap, or three-generation model has been established here.
- The `56/64` signature belongs to an auxiliary operator on real skew 16×16 coefficients; until CAR-TRACE and physical form connections are qualified, do not identify it with BFSS Hamiltonian eigenspaces.
- Current BIL-0C cold strict accepted [#42924009228](https://github.com/etblink/math/actions/runs/42924009228) with two nonfatal deprecated sum/smul proof-lemma warnings. Do not touch that accepted source for cosmetic fixes.
- No original-gamma source refactor, no weakening warnings/axioms, no inherited FCP-gate promotion, and no workflow edits while #42926845593 runs.
