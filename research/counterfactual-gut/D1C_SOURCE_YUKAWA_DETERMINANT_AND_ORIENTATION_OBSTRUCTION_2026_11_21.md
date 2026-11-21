# D1C — Original-source Yukawa coefficient: exact determinant, color-reflection invariance and rank-three gap obstruction

**Date:** 2026-11-21. **Project:** BFSS hopfion → GUT counterfactuals.  
**Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`. **Prior gate:** [D1B](./D1B_ORIGINAL_GRAM_FOCK_SCALAR_KERNEL_AND_ZERO_GAP_AUDIT_2026_11_21.md).  
**Disposition:** **SOURCE-TYPED ALGEBRAIC POSITIVE RESULT / NARROW SPECTRAL-TOPOLOGY OBSTRUCTION.** The coefficient matrix below is defined using the literal source Gamma9 and Pauli-color structure constants, but this memo **does not** prove equality of its quantized quadratic form to the currently source-normalized complete physical Hamiltonian. No new Lean/native consumer qualification, dynamical Hopf protection, 4D chirality, experimental result or GUT.

## 1. Source pins and preserved scientific boundaries

| Source | Git blob SHA | Use |
| --- | --- | --- |
| `lean/OAI/MathematicalPhysics/BFSS/Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | Original `Boson 2`, `Fermion 2`, `AlgebraData.charge` with **27-coordinate derivatives** and source `f_{abc}` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean` | `b9b8192055c70f0d001d7982669b9823c55562ed` | Actual nine real symmetric `16×16` Clifford matrices, four-letter Pauli words |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | Actual paired 48 Majoranas on original `Fermion 2` |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean` | `553869f1287c64893398c3b79c04fe010023bd08` | Original real color-adjoint SO(3)-type action |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G5LSourcePauliCyclicCoefficientProbe.lean` | `713b4f7301c5788a407f3679d5d52c59332805e3` | Original normalized Pauli source: `f_{abc}=√2 ε_{abc}`, under its explicit `hcolor` normalization premise |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean` | `9f9a5ce2186ded98a251efbc24c2b66f416044d5` | Spin(9)/SU(2) **48-label orthogonal commutation**, not full Fock-vector/physical Hamiltonian symmetry |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinGammaOrthogonalProbe.lean` | `3979ea1d3c64e4a3cb82e4baf2c10cbc6b5cb627` | Source Spin(9) real 16-spinor orthogonal matrix; source comments have prospective qualification caveat |
| `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6G5MSourceColorWedgeEnergyProbe.lean` | `fdb08c13a1f401c3b330660dd5973edd62262977` | Original bosonic bracket-square / wedge-area identity, no new Hamiltonian operator |

Previous results: D0 says **unrestricted ordinary** `Boson 2 / SU(2)` is contractible; D1A says the rank-three ordinary quotient has `π₃=0` and `π₂=ℤ₂`; D1B says symmetric-traceless inputs to the **different, Gram-only** `JOIN0A` operator vanish and its normalized multiplier has zero in its approximate spectrum. P1–P4 provide further bosonic escape, toy-Fock-gapped escape, and original-gamma-AIII zero-winding controls. These source/math ceilings are not reclassified.

## 2. Corrected interpretation of orientation: gauge-invariant does not mean rotationally scalar

Represent the original bosonic configuration as `X∈ℝ^(9×3)`, with color columns on the right. `G(X)=XXᵀ` is the genuine spatial Gram matrix and `W(X)=X_{\cdot1}∧X_{\cdot2}∧X_{\cdot3}∈Λ³ℝ⁹` is the orientation-sensitive three-form from D1A. For a color reflection `R∈O(3)` with `det R=−1`,
\[
G(XR)=G(X),\qquad W(XR)=-W(X).
\]
Thus `W` distinguishes certain **SU(2)-only gauge orbits**, but transforms under global spatial `SO(9)` as a three-form. It is not a scalar "color chirality" or a conserved topological charge.

**Stronger finite-dimensional orbit fact:** for every `X∈ℝ^(9×3)` and every `R∈O(3)` with `det R=−1` there exist `S∈SO(9)` and `T∈SO(3)` such that
\[
\boxed{XR=SXT.}
\]

- **Rank three proof:** choose SVD `X=UΣVᵀ`, where `U∈ℝ^(9×3)` has orthonormal columns, `Σ>0` is diagonal and `V∈O(3)`. Let `D=diag(-1,1,1)` and `Q=VDVᵀ`, a color reflection commuting with the right singular-value metric. Choose a unit `w⊥im(U)`. Define the **spatial rotation** `S=I₉−2u₁u₁ᵀ−2wwᵀ∈SO(9)` with `u₁=Ue₁`. Then `SX=XQ`. Let `T=QR∈SO(3)`. As `Q²=I`, `SXT=XR`.
- **Rank at most two:** choose a unit `v∈ker X`, put `Q=I₃−2vvᵀ`, so `XQ=X` and `T=QR∈SO(3)`. Choose `S=I₉`.
- **Null control:** `S` generally depends on `X`; the map `X↦XR` is **not** thereby a single fixed Spin(9) transformation on the whole original Hilbert space. It is not license to claim an additional O(3) gauge symmetry or a new full-Hamiltonian unitary.

Thus ordinary **spatial-rotation-and-gauge-invariant scalar functions** cannot distinguish this color-reflection pair. The statement does not erase tensor-valued observables, external spatial reference frames, or potential Berry/equivariant data on a parameter family.

## 3. The genuine original supercharge contains orientation, but an improper color reflection is not a source symmetry

The frozen `Core.AlgebraData.charge α` is the actual first-order matrix quantum-mechanical supercharge:
\[
Q_\alpha=-i\sum_{i,a,\beta}(\Gamma_i)_{\alpha\beta}\,\theta_{\beta a}\,\partial_{X_{ia}}
+\frac12\sum_{i,j,a,b,c,\beta}
f_{abc}(\Gamma_{ij})_{\alpha\beta}\theta_{\beta a}X_{ib}X_{jc}.
\]
These derivatives are with respect to **27 matrix-configuration coordinates**, not derivatives on physical three-space.

The original SU(2) color action acts properly (adjoint image SO(3)), and `f_{abc}=√2 ε_{abc}` is preserved. Under an *improper* color reflection `R`, simultaneous rotation of `X, θ, ∂` preserves the kinetic contraction, but the `ε`-dependent potential piece acquires an extra `det R=-1` sign. Therefore **"extend the original gauge symmetry to O(3)" is not established, and is false for the naive unchanged supercharge transform**. The bosonic bracket-square potential is insensitive to this sign because it squares the bracket, but a source supercharge is not merely that scalar potential.

Source Spin(9) / SO(9) covariance is physically expected for the BFSS model, and original Gamma9/48-label group algebra exists. A **single coherent Fock-vector implementer, gauge-physical projection, natural closed-domain intertwiner, and full normalized Hamiltonian equality** are distinct original-source proof obligations. Pairwise point-orbit equivalence must not be promoted to a globally implemented physical symmetry without them.

## 4. Source-derived quadratic-fermion Yukawa coefficient

To isolate the standard SU(2) color/Yukawa spectral discriminator, define a new **source-typed 48×48 real coefficient matrix**, with indices spinor `α=1…16` and adjoint color `b=1…3`:
\[
A_f(X)_{(\alpha,b),(\beta,c)}
 := \sum_{i=1}^{9}\sum_{a=1}^{3}
 X_{ia}\,(\Gamma_i)_{\alpha\beta}\,f_{abc},
\qquad f_{abc}=\sqrt2\,\epsilon_{abc}.
\]
Define `A_ε=A_f/√2`. The original symmetric Gamma matrices and antisymmetric color tensor imply
\[
A_f(X)^\mathsf T=-A_f(X).
\]
Thus `i A_f(X)` is Hermitian after complexification. Its eigenvalues may be used as a **matrix-level, one-particle Yukawa-coefficient diagnostic**, *not* as the full `2²⁴`-dimensional physical BFSS Hamiltonian spectrum or source-proved fermionic energy normalization.

The norm/second spectral moment is source-invariant:
\[
-\operatorname{tr}(A_\epsilon(X)^2)=32\,\|X\|^2,\qquad
-\operatorname{tr}(A_f(X)^2)=64\,\|X\|^2,
\]
because `tr(Γ_iΓ_j)=16δ_ij` and `tr(C(u)^2)=-2|u|²` for `C(u)_{bc}=∑_a ε_{abc}u_a`.

## 5. NEW exact determinant identity: invertibility ↔ full color rank

**Precise algebraic claim (new mathematical deduction):**
\[
\boxed{
\det A_\epsilon(X)
  =2^{16}\left[\det(X^\mathsf T X)\right]^{8},
\qquad
\det A_f(X)
  =2^{40}\left[\det(X^\mathsf T X)\right]^{8}.
}
\]

**Proof:** The real 9-vector/Spin(9) and proper color rotations reduce `X` to singular-value diagonal form without changing `det A`. Put `σ₁,σ₂,σ₃≥0` on three spatial rows, zero elsewhere. Renumber the corresponding three symmetric, anticommuting Gamma matrices `Γ₁,Γ₂,Γ₃`. For `A_ε`, the 3×3 color-block matrix with `16×16` real blocks is
\[
A_\epsilon(\sigma)=
\begin{pmatrix}
0&\sigma_3\Gamma_3&-\sigma_2\Gamma_2\\
-\sigma_3\Gamma_3&0&\sigma_1\Gamma_1\\
\sigma_2\Gamma_2&-\sigma_1\Gamma_1&0
\end{pmatrix}.
\]
Set `U_*=diag(I₁₆, Γ₃, −Γ₃Γ₁)`, an orthogonal block matrix, and `J=Γ₁Γ₂Γ₃`. Clifford anticommutation gives `Jᵀ=−J`, `J²=−I₁₆` and `det J=+1`. Direct conjugation yields
\[
U_*^\mathsf T A_\epsilon(\sigma) U_* =
\begin{pmatrix}
0&\sigma_3 I&\sigma_2 J\\
-\sigma_3 I&0&\sigma_1 I\\
\sigma_2 J&-\sigma_1 I&0
\end{pmatrix}.
\]
All blocks lie in the commutative real algebra `ℝ[J]≅ℂ`, so the determinant of this 3×3 block matrix over that algebra is `2σ₁σ₂σ₃J`. Taking the ordinary real 48×48 determinant,
\[
\det A_\epsilon
=\det(2\sigma_1\sigma_2\sigma_3J)
=(2\sigma_1\sigma_2\sigma_3)^{16}.
\]
Since `det(XᵀX)=(σ₁σ₂σ₃)²`, the first identity follows. For the **actual normalized source f=√2 ε**, `A_f=√2 A_ε`, so multiply the 48×48 determinant by `(√2)^{48}=2^{24}` and obtain `2^{40}`.

The formula also covers rank-deficient `X` by continuity or the same diagonal calculation. **Therefore**
\[
\boxed{\det A_f(X)\ne0 \iff \operatorname{rank}X=3.}
\]

**Independent exact-arithmetic checks:** Using the **nine source four-factor real Pauli words** (`JIIJ, JIJX, JXJZ, JZJZ, JJIZ, JJXX, JJZX, XIII, ZIII`) and standard 3×3 epsilon coefficient matrices, Python+SymPy checked all nine Gamma symmetries and 81 Clifford anticommutators, and exact 48×48 integer determinants for `A_ε`:
- `diag(1,1,1)` in first three spatial rows: `det A_ε = 65,536 = 2¹⁶`.
- `diag(1,2,3)`: `det A_ε=2¹⁶×36⁸`.
- Rank-three integer sample with rows `(1,2,-1),(0,-1,2),(2,0,1),(1,1,1),(-1,2,0)` and four zero rows: `det(XᵀX)=368` and `det A_ε=2¹⁶×368⁸`.
- Rank-two canonical sample: `det A_ε=0`, matrix rank 32.
These are exact integer spot checks **supporting** the algebraic proof, not independent Lean kernel qualification. Source Pauli-word choices were checked to be symmetric and obey the exact Clifford relation; the source file explicitly describes them as the signed-permutation gamma arrays. No 2²⁴-dimensional Fock matrix was assembled.

**Physical negative control:** The fully gapped pointwise one-particle coefficient sector `{X: det A_f(X)≠0}` is **exactly the rank-three matrix sector** already studied in D1A. Its ordinary gauge quotient has `π₃=0`. A fixed `X` in that sector has a nonzero one-particle zero-energy gap; however its gap need not be uniform as `X` approaches rank≤2, where the spectrum reaches zero. In particular, the source BFSS commuting valleys `rank X≤1` lie in the gapless locus. Excision of those valleys is not automatically physically allowed.

**This falsifies the narrow proposed shortcut** "remove zero modes of the source quadratic SU(2) Yukawa coefficient, then recover a nontrivial ordinary three-dimensional Hopf class on the resulting gauge quotient". It does **not** falsify a topological index on a differently justified effective spatial field, a nontrivial associated eigenbundle, or an index of the full interacting unbounded physical Hamiltonian.

## 6. A second negative discriminator: improper color reflection does not affect the one-particle spectrum or Pfaffian sign

For `R∈O(3)` acting on columns, define `P_R=I₁₆⊗Rᵀ∈O(48)`. The Levi-Civita tensor identity yields
\[
A_f(XR)=\det(R)\,P_R A_f(X)P_R^\mathsf T.
\]
If `det R=-1`, then `A_f(XR)=-P_R A_f(X)P_Rᵀ`. Every real skew-symmetric matrix has eigenvalues in `±iλ` pairs, so
\[
\operatorname{spec}(iA_f(XR))
=\operatorname{spec}(iA_f(X)).
\]
Hence **all pointwise characteristic-polynomial/eigenvalue spectral diagnostics are blind to the orientation sign of W**.

Additionally for real skew 48×48 matrices, `Pf(PAPᵀ)=det(P)Pf(A)` and `Pf(-A)=(-1)^{24}Pf(A)`. Here `det(P_R)=(det R)^{16}=+1`, so
\[
\boxed{\operatorname{Pf} A_f(XR)=\operatorname{Pf} A_f(X).}
\]
Moreover the full-rank `9×3` locus is connected; the determinant is strictly positive there, so `Pf A_f` has a fixed sign on that locus (its convention depends on the source ordering). In fact `|\operatorname{Pf} A_f(X)|=2^{20}[\det(XᵀX)]^4`. Thus **no orientation Z₂ invariant of the pointwise Pfaffian sign** is generated.

**Careful ceilings:** This is about eigenvalues/Pfaffians of the **48×48 real quadratic coefficient**. It does not prove that all Fock-vector matrix elements, geometric phases/eigenbundles, parameter-family invariants, domain-sensitive supercharges or the full physical Hamiltonian are blind to orientation. Also, a "per-configuration" `S,T` in `SO(9)×SO(3)` need not define a single global Fock/FullL2 symmetry operator as `X` varies.

## 7. Next justified research target — D1D

**D1D = physical-operator and symmetry-admissibility audit**, not a new topological substitute:

1. Identify the exact source-normalized **fermionic interaction term and cross terms** in the physical `H=(1/16)\,T^*T`, and its operator domain. Prove a typed equality to `A_f`'s second-quantized term **only if true** under the original theta normalization and signs.
2. Test whether a physically justified **restricted/spacetime parameter carrier** and a gauge-compatible, Spin(9)-consistent eigenbundle/defect operator exist. Standard full-rank and Gram-only sectors now have explicit negative controls.
3. Specify the actual protecting symmetry and a measurable invariant; distinguish a 0+1D supersymmetric/Witten index, finite Majorana Pfaffian, Berry invariant, 3D Dirac/Callias index, and 4D chiral fermion content. Their integers cannot simply be equated.
4. If no protecting structure follows from original dynamics or an independently justified effective theory, archive `NO_SOURCE_DERIVED_3D_HOPF_CHIRAL_INDEX` and give priority to neutral Standard Model comparisons rather than retrofitting restrictions.

**Governance:** No original source edited; no Lean module or CI run created; no merge/PR; no changes to `main`, unified RHOPF, BFSS frozen gate receipts or FCP canon. This is an isolated research result to be challenged by a later narrow independent consumer.
