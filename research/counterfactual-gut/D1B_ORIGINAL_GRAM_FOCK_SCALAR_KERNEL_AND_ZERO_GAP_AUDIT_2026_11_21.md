# D1B — Symmetric-coefficient collapse and zero-gap obstruction for the original BFSS Gram–Fock field

**2026-11-21 | Research-only mathematical source audit | NO new Lean/CI qualification or physical hopfion/GUT claim.**

**Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Parent:** [D1A](./D1A_RANK_THREE_ORBIT_TOPOLOGY_AND_ORIGINAL_FOCK_OPERATOR_2026_11_21.md). **Branch snapshot:** initial ancestor `07d6a13c365ffcc581efcad25424025482c493ba`. **Outcome:** `SYMMETRIC_TRACELESS_COEFFICIENTS_IN_KERNEL`; `NO_UNIFORM_ZERO_INVERTIBILITY_FOR_NORMALIZED_GRAM_FOCK_MULTIPLIER`; `PHYSICAL_HAMILTONIAN_SPECTRAL_AND_3D_CHIRAL_CLAIMS_OPEN`.

This investigation is an exact algebraic deduction from inspected **original carrier** definitions, with a tiny independent toy-CAR numerical sanity check. It has **not** compiled a new Lean consumer, established a spectral property of the full BFSS Hamiltonian or measured a physical observable. Existing source comments sometimes describe earlier modules as strictly qualified, but the assertions in this memorandum are **not independently requalified by this audit**.

## 1. Source files and exact operator (no replacements)

| Exact source | Git blob SHA | Relevant data |
| --- | --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | `Boson 2 ≅ ℝ^27`, `Fermion 2 ≅ ℂ^(2^24)`, `FullL2 2`, source `AlgebraData.charge` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | Real self-adjoint paired Majoranas with `{θ_{αa},θ_{βb}}=δ_{αβ}δ_{ab}I` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | Original nine symmetric real 16×16 gamma matrices with Euclidean Clifford anticommutators |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean` | `5633ef2ed7cf182edaee171fb45273d325103b94` | Original spatial Gram `G(X)` and SU(2) invariance |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0BOriginalGramGammaCoefficient.lean` | `e495f780f9ac382ac1e076ef20fa68b33c38f1cd` | `J_B(X)=∑_{i,j}G_{ij}(X) Γ_i B Γ_j` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean` | `cfd3e1eeed420ce92ca54821816f4a53e073ad4a` | Original color-summed bounded quadratic `Q(J)=∑_{αβa}J_{αβ}θ_{αa}θ_{βa}` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean` | `68fd2067b2dcdb6851afed269d25726dd5b634c5` | Genuine pointwise joint SU(2) covariance for `K_B(X):=Q(J_B(X))` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSJOIN0B1OriginalGramGammaTranspose.lean` | `4070cbb2b8e6538bb5c328651f8df5a2c77a4bf5` | `J_B(X)^T=J_{B^T}(X)` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSJOIN0B2OriginalFockQuadraticStarTranspose.lean` | `4c96a53f494ab0bd9891b686510aa59ea4e14044` | `Q(J)^*=Q(J^T)` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSJOIN0B3OriginalFockGramStarTranspose.lean` | `ecb6ab7935b0f46c1813aad2230cdd8ea0250d9a` | `K_B(X)^*=K_{B^T}(X)` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0COriginalNormalizedFockField.lean` | `84de66e73be2018b03ced898ebf70e691c07b40f` | `A_B(X)=i K_B(X)/(1+tr G(X))`; `‖K_B(X)‖≤C_B trG(X)`, `‖A_B(X)‖≤C_B` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D1OriginalFockFieldContinuity.lean` | `7cd3197dbef31af0fb25d8a47c41e037d8162f4e` | Pointwise continuity of both unnormalized and normalized source fields |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSNORM0D3OriginalFockL2Representative.lean` | `ab171b8649200491177a19ae366b440da22da397` | Source-defined FullL2 output and a.e. representative law; **not** a qualified bounded linear multiplier or spectral theorem in its own comments |
| `lean/OAI/MathematicalPhysics/BFSS/GaugeCore.lean` | `e4990dadf1d8bde849e351467282ab3f14989c3b` | `GaugeData.physicalSpace`, genuine bosonic pullback and fermionic fiber action |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean` | `a16d3573b737bb4453e42b0b543d63cbbac1cd1b` | Nonzero original Fock vacuum fixed by source gauge action |

`trG(X)=∑_{i,a} X_{ia}²=‖X‖²`. The scalar `i` in `A_B` is deliberate: it ensures self-adjointness **when the nonzero coefficient is skew**.

## 2. General original-CAR calculation: symmetric B collapses to the identity

Define `Sym(J)=(J+Jᵀ)/2` and `Alt(J)=(J−Jᵀ)/2`. The exact **original** self-adjoint Majorana CAR gives
\[
\begin{aligned}
Q(\mathrm{Sym}\,J)
&=\tfrac12\sum_{\alpha,\beta,a}J^{\mathrm{sym}}_{\alpha\beta}
 (\theta_{\alpha a}\theta_{\beta a}+\theta_{\beta a}\theta_{\alpha a})\\
&=\tfrac12\sum_{\alpha,a}J_{\alpha\alpha}I
=\tfrac32\,\operatorname{tr}(J)\,I_{\mathcal F}
\quad \text{(three original SU(2) colors).}
\end{aligned}
\]
In particular
\[
\boxed{Q(J)=\tfrac32\operatorname{tr}(J)\,I_{\mathcal F}
              + Q(\mathrm{Alt}\,J).}
\]
No unprovided 48-fermion simulation is involved; this follows by finite sum symmetrization and the exact CAR. The original CAR convention is `{θ,θ}=I` on coinciding labels, **not** `2I`; confusing the normalization would double the coefficient.

### Gamma–Gram trace identity

Using `G_{ij}=G_{ji}`, original real gamma symmetry and `Γ_j Γ_i+Γ_i Γ_j=2δ_{ij}I`:
\[
\begin{aligned}
\operatorname{tr}(J_B(X))
 &=\sum_{ij}G_{ij}\operatorname{tr}(\Gamma_i B\Gamma_j)
 =\operatorname{tr}\left(B\sum_{ij}G_{ij}\Gamma_j\Gamma_i\right)\\
 &=\operatorname{tr}(B)\,\operatorname{tr}G(X).
\end{aligned}
\]
As already expressed by the source transpose lemma, `J_B(X)^T=J_{B^T}(X)`. Therefore **for symmetric B**, `J_B(X)` is symmetric and
\[
\boxed{K_B(X)=\tfrac32\,\operatorname{tr}(B)\,\operatorname{tr}G(X)
\,I_{\mathcal F}.}
\]
For traceless symmetric `B`, `K_B(X)=0` for **all** `X`; for `B=I_{16}`, `K_B(X)=24\,‖X‖² I`.

The original nine gamma matrices `Γ_k` are symmetric and traceless: for `j≠k`, `Γ_j Γ_k Γ_j=−Γ_k`, so by cyclicity of trace `trΓ_k=−trΓ_k=0`. Hence
\[
\boxed{K_{\Gamma_k}(X)=0 \quad \forall k\in\{0,\ldots,8\},\;\forall X.}
\]

### Dimension and negative-knowledge consequence

The real 16×16 source coefficient space decomposes into
\[
M_{16}(\mathbb R)
=\underbrace{\mathbb RI}_{1}
 \oplus\underbrace{\mathrm{Sym}_0(16,\mathbb R)}_{135}
 \oplus\underbrace{\mathfrak{so}(16)}_{120}.
\]
The entire 135-dimensional **traceless symmetric** summand is invisible to `B↦K_B(X)` for *every* `X`. The pointwise source operator field depends on the coefficient only through `tr B` and `Alt(B)`. This gives an **at-most 121-dimensional effective coefficient space**; it does **not** prove that all 120 skew directions are independent or dynamically physical. The full BFSS Hamiltonian and the 48 original CAR operators are **not** reduced to 121 degrees by this observation: the claim concerns only this specific color-contracted Gram/Fock operator family.

The normalized field for symmetric `B` is `A_B(X)=i\,\tfrac32\,tr(B)\,‖X‖²/(1+‖X‖²)\,I`, which is generically **skew**-adjoint (not a self-adjoint energy observable). For real skew `B`, `J_B` and `K_B` are skew-adjoint, so `A_B(X)=iK_B/(1+trG)` is self-adjoint. In fact the scalar obstruction to self-adjointness depends on `tr B`; traceless symmetric components vanish regardless.

**Independent sanity check:** a separate 3-Majorana, one-color occupation-space CAR model (8×8 matrices, normalized `{θ_i,θ_j}=δ_ij I`) gave maximum numeric residual ~2.2e−16 for CAR, ~1.1e−16 for symmetric scalar collapse and 0 for skew-star properties. This is *only* a low-dimensional normalization control; the general identity above is proved abstractly from the source CAR and was not checked numerically as a 2²⁴-dimensional matrix.

## 3. Scaling and the origin: zero is unavoidable in the source normalized operator field

The source Gram matrix is homogeneous quadratic: `G(sX)=s²G(X)`. Hence
\[
K_B(sX)=s^2 K_B(X),
\qquad
A_B(sX)=\frac{i\,s^2 K_B(X)}{1+s^2\,\|X\|^2}.
\]
In particular `A_B(0)=0` **for every B**, and for `0≤s≤1` the original source bound supplies
\[
\|A_B(sX)\|\le C_B\,s^2\|X\|^2.
\]
The **eigenvectors and spectral projectors on rays** (when eigenvalues remain separated and `s>0`) depend only on the direction of `X`, because the multiplier along each ray is a positive real scalar. At the origin all eigenvalues are zero and a uniform invertibility gap closes.

A precise failure test for full `FullL2 2`: let `T_B` be the **mathematically inferred** bounded multiplication operator on `L²(ℝ²⁷;\mathcal F)`,
\[
(T_B f)(X)=A_B(X)f(X).
\]
The existing source norm bound, continuity, a.e. representative lemmas and FullL2 output make this construction natural; however **the bounded complex-linear FullL2 multiplier as a separate Lean object, and its gauge/physical restriction, are not newly native-compiled here.** The standard Banach-space proof is immediate from `‖A_B(X)‖≤C_B`.

For any `ε>0` choose a nonzero smooth radial bump `\phi_\epsilon(X)` supported in `‖X‖<ε` and normalized in `L²(ℝ²⁷)`. Let `v_0∈Fermion 2` be the **actual original nonzero normalized gauge-fixed Fock vacuum**, verified in the source `OP2c`, and define
\[
\psi_\epsilon(X)=\phi_\epsilon(X)\,v_0,\qquad \|\psi_\epsilon\|_{L^2}=1.
\]
By the source bosonic **linear isometric** SU(2) action and `v_0`'s genuine Fock gauge invariance, `\psi_\epsilon` belongs to the actual gauge-invariant FullL2 Hilbert subspace `pairedGaugeData.physicalSpace` as defined in `GaugeCore.lean`: under gauge transformations the radial factor and `v_0` are both fixed. The pointwise joint covariance of `A_B` and invariance of `trG` imply `T_B` maps that subspace into itself; this source-joining proof is **not separately Lean-qualified here**.

On the support of `\psi_\epsilon`:
\[
\|A_B(X)\|\le C_B\,\frac{\|X\|^2}{1+\|X\|^2}\le C_B\,\epsilon^2.
\]
Thus
\[
\boxed{
\|T_B\psi_\epsilon\|_{L^2}\le C_B\,\epsilon^2
\;\xrightarrow[\epsilon\to0]{}\;0
\quad\text{with }\|\psi_\epsilon\|=1.
}
\]

**Functional-analytic verdict:** `0` is in the **approximate point spectrum** of this bounded FullL2 multiplication operator, and likewise in its gauge-fixed restriction given the described invariant-domain construction. For skew `B`, the operator is self-adjoint on FullL2 and the invariant fixed subspace, so `0∈σ(T_B)`. There is **no positive uniform lower bound** `‖T_B f‖≥δ‖f‖` over all gauge-physical `f`. A single zero of the pointwise field `A_B(0)` would not suffice for this conclusion by itself (a measure-zero point need not affect multiplication spectrum); the proof uses **positive-volume neighborhoods** and normalized gauge-invariant test states.

**Exact scope:** We have **not** proved that `0` is non-isolated in the spectrum of the restricted operator in every skew `B`, or that a bounded spectral projection cannot separate an actual zero eigenspace from other bands. The conclusion is loss of **invertibility/uniform gap at zero**, not an indiscriminate "all spectral gaps vanish" claim.

**Most important nonimplication:** This is **not a theorem about the original BFSS supersymmetric Hamiltonian** `H=(1/16)T^*T`, its spectral gap, zero-energy state, mass gap, or ground-state index. The original supercharges include differential/kinetic terms. Radial localization near the origin incurs kinetic-energy cost (`ε^{-2}` scaling for a basic Laplacian), so the smallness of this **bounded multiplication field** does not make `H` small on those trial states. Neither do pointwise gaps imply fermionic bound-state chirality or physical hopfion protection.

## 4. Counterfactual consequences for the GUT route

- **Rejected D1B shortcut:** inputting an individual real Gamma9 vector matrix (or any traceless symmetric coefficient) into the **existing color-contracted Gram/Fock operator** to produce a nontrivial source fermionic spectrum. The operator is **identically zero**.
- **Source-preserving candidate:** real skew coefficients, especially original gamma-bivectors, lead to Hermitian normalized pointwise fields and genuine SU(2)-covariant original-Fock operators. They require explicit eigenvalue/gap analysis on physically justified **nonzero-configuration or spectral-parameter sectors** and a **source-defined protecting symmetry**.
- **Negative spectral control:** no skew `B` gives an everywhere-invertible normalized field on all original configurations; the zero is approached even by gauge-invariant FullL2 test states. Artificially excising the small-radius configurations or forcing a mass term would **change the physical model** unless justified by dynamics.
- **D1A orientation control:** `K_B(X)` and `A_B(X)` depend only on the Gram matrix, so they remain blind to the orientation-sensitive cubic three-form `W`; the actual BFSS source supercharge uses structure constants and differential couplings, which are a more relevant place to test whether orientation data matter **dynamically**. Do not add an arbitrary `W` term solely to force a desired topology.
- **Chirality still distinct:** an index of a gapped **parameter family** of bounded Fock operators is not a spatial Dirac/Fredholm index or a four-dimensional Weyl family count. Any true link must specify a 3+1D effective carrier, gauge reps, operator domain, and observation.

## 5. Next bounded test: D1C, if useful

Study the **original, not invented, 27-coordinate supercharge/historical fermionic Yukawa term** under the explicit Gram-equal but `W`-opposite configurations from D1A. Identify whether the actual Hamiltonian and gauge-physical observables distinguish them after allowing all original global spacetime/discrete symmetries, rather than confusing two gauge orbits with two physical particle sectors.

Independently, test a small set of **skew coefficient gamma-bivectors** for pointwise spectrum and gauge-fixed Fock action. Before adding a Lean gate, name the exact symmetry and spectral predicate. First prove, on source interfaces and an independent consumer, the three short implications: (i) symmetric traceless kernel; (ii) skew coefficient self-adjointness; (iii) bounded multiplier's zero approximate spectrum on full gauge-physical space. Do **not** launch a monolithic original Hamiltonian compilation to restate a finite CAR identity.

**Decision:** D1B mathematical obstruction found and preserved; ***NO_SOURCE_DERIVED_HOPF_CHIRAL_INDEX*** remains controlling. The larger physical BFSS and GUT counterfactuals remain open and falsifiable. No source files, RHOPF branch, `main`, dependency pins, existing CI, or accepted proof receipts have been changed.
