# D1P — Full CAR rank-one projector, exact Berry-flatness and source 24-orbital deck holonomy

**Date:** 2026-11-21. **Research branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Read-only source baseline:** `39b0d068359dcff02bf3fd2975547316a23c004b` (D1O checkpoint).  
**Disposition:** Stronger **ordinary finite-dimensional mathematical proof architecture**, source-matched *exact* integer/Clifford algebra checks, exact 4-Majorana symbolic curvature basis proof, 36 dense Fock counterfactual controls (1–6 modes), and full source 24-orbital deck-path test. **No new Lean build/CI proof, no exact source-typed `SmoothCore 2`/`invariantCore` construction, no closed physical-form, essential-spectrum, hopfion or GUT result.** Original Lean, `main`, unified integration and live RHOPF untouched.

## Executive decision

The D1O projector identity does **not require** a newly implemented spatial Spin(48) representation and does **not require** a dense `2^24 × 2^24` Fock matrix to establish its algebraic rank-one property. A CAR-only argument uses 24 commuting involutions, a Clifford trace trick, and the exact source carrier dimension `2^24`. The BFSS Gaussian family also has **identically zero** Berry curvature by a direct tensor-trace identity for arbitrary real spatial and color variables—not just at random sphere samples. Generic Gaussian families do have nonzero curvature, so this is a meaningful structural fact. The deck holonomy is `+1` along the full original-source 24-orbital path with identically zero occupied Berry trace; an incorrect all-plus eight-orbital seed fails to close. These results strengthen the ordinary mathematical route toward a global smooth Gaussian **vector** on the exact source carrier, but Lean source typing and original physical-domain membership are separate open gates.

## Frozen source contracts (no edits)

- `Core.lean`, blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: `Fermion 2 = EuclideanSpace ℂ (Fin (2^24))`, `SmoothCore 2` is a compactly supported smooth `TestFunction` over original 27 real bosons, original `coreForm=(1/16)Σ‖charge‖²`.
- `SU2BFSSG1APairedThetaProbe.lean`, blob `152204ef15a6569534e0503824a697cb9ae8e4ce`: source's literal `pairedTheta` and relabeling 48 original CAR generators into 24 modes, irreducibility.
- `SU2BFSSG3AAdjointColorRepresentationProbe.lean` blob `553869f1287c64893398c3b79c04fe010023bd08`, `SU2BFSSG4AExteriorGaugeActionProbe.lean` `141fbe74fc4883f686e05dbc702efb12c6fb8fab`, G4E `7247844122ab870d31e92903db4c2ab561f98112`, G4J `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`: exact output-color/input-color matrices and original Fock gauge action in `pairedGaugeData.fermion`.
- `SU2RealGammaProbe.lean`, blob `b9b8192055c70f0d001d7982669b9823c55562ed`: `JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII`, signed 16×16 source real Gamma9 matrices. Gamma7 and Gamma8 are crucial for the deck path.
- `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b`: source `physicalSpace = ⋂_g ker(bosonPullback g−fiberAction g)`, `invariantCore=physicalSpace.comap coreToL2`.
- `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a`: original massless energy identity, **only** after membership in `SmoothCore`.
- D1O report and scripts in `research/counterfactual-gut/d1o/` commit `ed6b33384ec98a7c4bfe52f2fde75cf701f4bbb9`; D1F R1/R2/R3 and D1K1A R1 strict REDs stay **UNQUALIFIED**.

## 1. CAR-only rank-one projector proof: no Spin representation

Let `m=24`, `γ_a=√2 pairedTheta_a` on the original `Fermion 2`, so `{γ_a,γ_b}=2δ_ab I`. For any real skew `C` with `C²=−I_{2m}`, choose **a basis at one point** of oriented orthonormal pairs `e_j,f_j` such that `C=O C_vac Oᵀ` and `C_vac|_j = [[0,−1],[1,0]]`. This pointwise basis does **not** need to vary smoothly and does **not** produce a spin lift.

Define `A_j = i γ(e_j)γ(f_j)`. The Clifford relations alone give:

1. Every `A_j` is a Hermitian involution: `A_j†=A_j`, `A_j²=I`.
2. Distinct `A_j` commute because their Majorana pairs have disjoint indices.
3. The flattened original-Majorana quadratic operator
   `H_C=−(i/4)Σ_{a,b} C_ab γ_aγ_b = (1/2)Σ_{j=1}^m A_j`.
4. Each `p_j=(I−A_j)/2` is an orthogonal projection and their product `Q=∏_j p_j` is a projection onto the joint `A_j=−1` space.
5. **Clifford trace trick:** for every nonempty subset `S⊆{1,…,m}`, conjugate `∏_{j∈S}A_j` by `γ(e_k)` with `k∈S`. This changes its sign while preserving matrix trace; hence `tr(∏_{j∈S}A_j)=0`. Expanding `Q=2^{−m}∏(I−A_j)` yields `tr Q=dim(Fermion 2)/2^m=2^24/2^24=1`. Thus `Q` has **rank exactly one** in the *literal* original irreducible source carrier. This avoids a large dense matrix and an existence assumption about a Fock vacuum in the rotated basis.
6. On each joint eigenspace of the commuting involutions, `H_C` has eigenvalue `−m/2+k`, with `k` the number of `+1` eigenvalues. The polynomial
   `p_m(H_C)=∏_{k=1}^m [((k−m/2)I−H_C)/k]`
   equals `Q` on every joint eigenspace, therefore **identically as an operator**. For `m=24`, the ground eigenvalue is `−12`, and `P(C)=p_24(H_C)` is the unique rank-one lowest projector. Different orthonormal pair choices do not matter because the final definition uses only `C` and the original `γ` operators.

This is an **ordinary finite-dimensional CAR proof** that requires translation into Lean on exact `pairedTheta` and `Fermion 2` before it counts as a new source-qualified theorem. The smoothness of `P(C)` is immediate from its globally polynomial coefficients, but the existence of a **global unit vector** is not immediate from this alone.

### Counterfactual computation 1 — general Bogoliubov rotations

`d1p_car_rank_one_factorization.py` constructs the actual irreducible Jordan–Wigner CAR for 1 through 6 complex modes. It tests **36 arbitrary real orthogonal** frames of both determinant signs, hence includes pairing/Bogoliubov transformations *not obtainable by number-conserving Slater rotations*. Each case independently compares:

- polynomial projector vs. `∏_j(I−A_j)/2`;
- projector idempotence, trace one, unique Gaussian covariance and `H_C=(1/2)Σ A_j`;
- vanishing trace of each nonempty product of commuting involutions;
- parity **negative control:** orientation reversal `det(O)=−1` reverses Fock parity but **does not** spoil projector rank one.

Largest polynomial-vs-factor discrepancy is `1.281×10⁻¹⁵`; covariance recovery error is `1.100×10⁻¹⁵`; largest nonempty-product trace from floating arithmetic `3.45×10⁻¹⁴`. **These numerical matrices are a control of the proof, not its justification**.

## 2. Berry curvature is exactly zero for the special BFSS covariance

Write original source 48-real-label covariance on arbitrary `(u,n)∈ℝ⁹×ℝ³` as

`C(u,n)=−G(u)⊗J(n)−K⊗P(n)`, where `G(u)=Σ_i u_i Γ_i`, `K=J_pair=⊕₈[[0,1],[-1,0]]`, `J(n)_{bc}=Σ_a n_a ε_{abc}`, `P(n)=nnᵀ`.

The structural identities inherited from the original real Gamma9 and cross-product matrices are

`G(u)^2=|u|²I₁₆`, `tr G(u)=0`, `K²=−I₁₆`, `tr K=0`, `J(n)n=0`, `P J=J P=0`, `J(n)²=P−|n|²I₃`.

For spatial directional `v` and color directional `w`,

`D_u C[v]=−G(v)⊗J(n)` and `D_n C[w]=−G(u)⊗J(w)−K⊗(w nᵀ+n wᵀ)`.

### Exact trace proof

The Gaussian Berry two-form has the source-CAR normalization

`F(v,w)=i tr(P(C)[D_vP(C),D_wP(C)]) = (1/16)tr(C[D_v C,D_w C])`.

A CAR derivation uses the anti-Hermitian Lie-algebra implementer `L(A)=(1/4)Σ A_ab γ_aγ_b`, for which `[L(A),γ_j]=Σ_i A_ij γ_i`, `D_A C=[A,C]`, `D_A P=[L(A),P]`. Split `A` into components commuting and anticommuting with `C`: only the anticommuting parts move `P`. Using `C²=−I` and `C_ab=i⟨γ_aγ_b⟩`, the commutator expectation gives the displayed factor `1/16`. This is a mathematical CAR identity, not a newly source-compiled Lean theorem.

The tensor trace on the right **vanishes identically** for every pair of spatial/color derivatives, not just unit/tangent vectors:

- **Spatial/spatial:** `tr(J³)=0` eliminates the `G` part of `C`; `P J²=0` eliminates the `K` part.
- **Spatial/color:** the `(G,G,G)` spin trace is `tr(G G(v) G)=tr(G(v)G²)=|u|²tr G(v)=0`. Remaining terms have either `tr(J²D_nP)=0` (from `J²=P−|n|²I`) or `PJ=JP=0`, where `D_nP=wnᵀ+nwᵀ`.
- **Color/color:** every spin trace of a cubic word in `G,K` vanishes by cyclicity and `G²=|u|²I`, `K²=−I`, `tr G=tr K=0`. Color factors need not vanish individually for this case.

This proves `tr(C[D C,D C])=0` as a **tensor algebra identity for all real u,n**. On unit spheres, `C²=−I` so it is the curvature of the actual Gaussian rank-one line. It is **not** an automatic property of pure Gaussian projectors.

### Counterfactual computations 2–4 — exact integer and symbolic checks

- `d1p_berry_curvature_exact.py` evaluates **726** exact-integer trace contractions, all **66 ambient two-planes** at each of 11 original-source Gamma9 configurations, including unnormalized integer `u,n`: maximum integer residual **0**.
- `d1p_berry_tensor_atoms.py` checks **1,836 individual** tensor-trace contributions separately over nine integer configurations. Every individual term vanishes without relying on cancellation between tensor-type contributions.
- `d1p_berry_symbolic_clifford.py` uses exact **SymPy** 4-Majorana Fock operators and checks all 15 unordered pairs of the six `so(4)` basis generators. It proves by bilinearity for all `so(4)` tangents that the projector Berry curvature equals `tr(C[dC,dC])/16`; four basis two-planes have **nonzero** curvature.
- `d1p_generic_berry_control.py` calibrates the same relation with projector polynomial **exact directional derivatives** (not finite differences) for 2,3,4 modes: **28 of 30** generic pure-Gaussian tangent pairs have nonzero curvature; the coefficient `1/16` matches with maximum absolute difference `0` in tested floating arithmetic. **Negative control:** the zero BFSS curvature is not produced by a generally degenerate testing method.

## 3. Entire source 24-orbital deck-path phase, not just endpoint

The source Gamma7/8 half-turn is `S(t)=cos(t/2)I₁₆+sin(t/2)Γ₇Γ₈`, 0≤t≤π, and preserves each of the eight original real/imaginary spin-index pairs. Thus it gives the source **8×8 real complex-orbital** transform `S₈(t)` acting equally on transverse colors 1 and 2. Compose with the **source 3×3 real color rotation** `O(t)` in the `(color0,color1)` plane, sending `n=e₀` to `−e₀` at π.

Let `V₀` be the exact original 24×8 normalized occupied-orbital matrix with four `s_j=+1` and four `s_j=−1`. Along the path set `V(t)=(I₈⊗O(t)) U_spatial(t) V₀` and use the normalized Slater wedge `Ω(t)=v₁(t)∧···∧v₈(t)`.

- The occupied Berry one-form is **exactly** `tr(V†V̇)` and vanishes along this path: the color generator sends the occupied transverse-color plane into the empty color-0 direction (zero expectation); the spatial generator has zero trace on the occupied subspace by the original Gamma7/Gamma8 block structure.
- The exact source endpoint calculation from D1M gives `V(π)=V₀ A`, `A=⊕₄[[0,1],[-1,0]]`, `det A=+1`. Since the continuous occupied Berry one-form vanishes, the **Berry-parallel deck holonomy is +1**.
- `d1p_full24_deck_holonomy.py` checks the *entire* path at 24/96/384 subdivisions, using only 24×24 one-particle matrices. Maximum instantaneous occupied trace residual `3.44×10⁻¹⁶`; endpoint subspace error `5.36×10⁻¹⁶`; endpoint phase error `1.78×10⁻¹⁵`.
- **Deliberately false state:** make all eight Gamma8 signs positive. Its endpoint occupied-subspace error is `2.828427...`, strongly failing the deck descent. The correct sign balance is not cosmetic.

The source color stabilizer character is identically one (D1O exact three-mode block identities, four plus and four minus). The original `pairedGaugeData.fermion` is an honest unitary representation, not a projective group action, including the SU2 central element acting trivially on its adjoint color exterior representation.

## 4. What this establishes and what remains unqualified

**Ordinary finite-dimensional mathematics, strong:** The CAR algebra proves the unique Gaussian rank-one projector exists on an irreducible `2^24` carrier without requiring a new spin lift; the BFSS-specific Gaussian projector line is smooth and Berry flat; the source Gamma7/8 deck path has +1 holonomy and exact SO3 color stabilizer character; therefore an abstract global smooth normalized flat section can be chosen on simply connected `S⁸×S²` and descends to the physical sign quotient at the finite-dimensional Hilbert-space level. Covariance under G4J's source action can then be established from its `fermion_adjoint` theorem and uniqueness of parallel transport. These conclusions are an **analytical proof program**, whose source-type bridges still need independent verification before formal acceptance.

**Still OPEN (fail closed):**

1. Convert the CAR involution factorization and polynomial `P(C)` into **exact source-typed Lean** objects on `pairedTheta`, `Fermion 2` with allowed-axiom independent consumer. The D1K1A R1 `ColorIndex 2` numeral errors remain frozen, not repaired here.
2. Source-type the global Kato/flat transport and its gauge action, including deck and SU2 center, then build zero-extended `Ψ_R : SmoothCore 2` from the principal singular-value chart and prove `Ψ_R∈pairedGaugeData.invariantCore`. A smooth *projector* is not itself a global smooth *vector* without the curvature/holonomy argument.
3. Join the resulting test to the exact source `massless_coreForm_energy`, prove every cutoff/fermion derivative error and `q[Ψ_R]≤(22.3058531+o(1))/R²`. Do **not** confuse membership of the **form domain** with the stronger `Dom(H)` of the normalized self-adjoint Hamiltonian.
4. Physical and interpretive boundary: even an eventual strict success would be a *known-type commuting-valley continuum mechanism*, **not** a newly discovered mass gap, bound hopfion, Standard Model family or Grand Unified Theory.

**Project Lead recommendation:** do **not** initiate an unbounded Lean formalization sequence or rerun D1F/D1K1A from this mathematical audit. The next **D1Q** gate should test the global source-typed smooth zero-extension and the exact original physical Gauss action analytically with a minimal reusable interface, while recording each failing atom. Any Lean work should be one tightly scoped gate justified by the complete CAR/flatness mathematical argument and preflighted against source declarations.

## Reproducibility

Six independent scripts plus exact machine-result JSONs, this report, a reproduction README and a SHA256SUMS manifest form the 15-file bundle. Tested Python 3 / NumPy / SymPy, deterministic seeded inputs. The package was rerun from a clean ZIP extraction, including exact byte-identity checks on all six JSON files. **This package does not include a native Lean theorem or a 2^24 dense Fock numerical matrix.**
