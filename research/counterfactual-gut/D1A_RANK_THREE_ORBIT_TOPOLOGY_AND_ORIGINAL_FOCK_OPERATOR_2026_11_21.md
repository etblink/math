# D1A — Rank-three SU(2) orbit topology, orientation-sensitive invariants, and an original Fock operator

**Date:** 2026-11-21. **Status:** source-grounded mathematical research; **NO** new Lean qualification or physical Hopf/gauge/chirality claim.  
**Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Parent:** [D0/D1 audit](./D0_D1_ORIGINAL_CONFIGURATION_TOPOLOGY_AND_FOCK_INDEX_AUDIT_2026_11_21.md).  
**Decision:** restrict the next investigation to an **original-source gapped operator family**; preserve no-go findings even if they invalidate a hoped-for interpretation.

## 1. Source-typed carrier and precise limits of the identification

In frozen `lean/OAI/MathematicalPhysics/BFSS/Core.lean` (Git blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`), `Boson 2` is `EuclideanSpace ℝ (SpaceIndex × ColorIndex 2)`, i.e. a real 9×3 coefficient matrix `X`. The literal gauge group is `GaugeGroup 2` = SU(2).

- `OperatorDependencies/SU2BFSSG2ABosonGaugeProbe.lean` (blob `898c987cbcc0840f9c137682c3be345baca809d1`) defines `bosonGaugeEquiv g : Boson 2 ≃ₗᵢ[ℝ] Boson 2`.
- `OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean` (blob `553869f1287c64893398c3b79c04fe010023bd08`) defines the genuine 3×3 **real orthogonal** adjoint color coefficient matrices and proves composition laws.
- Standard Lie theory identifies the SU(2) adjoint image as SO(3), with kernel {±I}. This **surjectivity and orientation identification is not claimed as a newly qualified source Lean theorem here**. The ordinary matrix-quotient results below apply under this standard identification. It must be proved in a source-exact adapter if later reused in Lean.
- `BFSSVLY0AOriginalBosonGramGaugeInvariant.lean` (blob `5633ef2ed7cf182edaee171fb45273d325103b94`) defines the genuine nine-by-nine spatial Gram matrix
  \[
  G_{ij}(X)=\sum_{a=1}^{3}X_{ia}X_{ja}=(XX^\mathsf T)_{ij}
  \]
  and proves its source SU(2) gauge invariance.

None of the above makes `X` a map defined over physical three-space. In the original 0+1D quantum mechanics it is a **configuration-coordinate variable**.

## 2. Stronger D0 negative gate: imposing maximal color rank still does not give \(\pi_3=\mathbb Z\)

Let `C₃ = { X ∈ ℝ^(9×3) : rank(X)=3 }`. The standard SO(3) color action is right multiplication, up to a transpose convention.

For each full-rank `X`, set `P=(XᵀX)^(1/2)` positive definite and `U=X P⁻¹`. Then `UᵀU=I₃`. The explicit polar homotopy
\[
H_t(X)=U\big((1-t)P+tI_3\big),\qquad 0\le t\le1,
\]
is well defined on `C₃`, remains full rank, fixes orthonormal frames, and is SO(3)-equivariant because the positive square root conjugates naturally under right rotations. Thus
\[
C_3/SO(3)\simeq V_3(\mathbb R^9)/SO(3)
=\mathrm{Gr}^{+}_3(\mathbb R^9).
\]

Here `V₃(ℝ⁹)` is the Stiefel manifold of orthonormal three-frames. It is `(9−3−1)=5`-connected. The principal bundle
\[
SO(3)\longrightarrow V_3(\mathbb R^9)
\longrightarrow \mathrm{Gr}^{+}_3(\mathbb R^9)
\]
has long exact homotopy sequence. Since `π₃(V₃)=π₂(V₃)=0` and `π₂(SO(3))=0`, exactness forces
\[
\boxed{\pi_3(C_3/SO(3))=0.}
\]
Furthermore `π₁(V₃)=0` and `π₁(SO(3))=ℤ₂` give
\[
\boxed{\pi_2(C_3/SO(3))\cong\mathbb Z_2.}
\]
Thus the full-rank ordinary orbit sector has genuine lower-dimensional topology, but **no ordinary three-dimensional integer Hopf class**. Its `π₂=ℤ₂` is a possible mathematical input for a *separately justified* two-dimensional defect/boundary problem, not yet a monopole or a chiral generation mechanism.

Classical references: https://math.uchicago.edu/~may/REU2018/REUPapers/Ni.pdf (Stiefel connectivity); https://www.few.vu.nl/~trt800/papers/AT2.pdf (principal Stiefel bundles); https://mathworld.wolfram.com/StiefelManifold.html (orthonormalization/deformation).

**Critical physical caveat:** Rank≤2 matrices have positive codimension (rank=2 has dimension 20, codimension 7), hence are measure zero for Lebesgue `dX`, but their removal can matter for topology and operator domains. In particular for the **classical SU(2) commuting valleys** of BFSS, pairwise commutation of all nine traceless Hermitian matrices is equivalent, through the su(2) cross product, to all color-row vectors being parallel: `rank X ≤ 1`. The **rank-three restriction excludes the entire zero-commutator flat-valley set**. No accepted physical constraint allows that excision merely to manufacture a desired topological sector.

This rank-three result is about the bosonic color-orbit space. It neither falsifies the independently proven Gamma9 complex Hopf restriction nor establishes a physical three-space topology.

## 3. Positive new invariant, with a negative control against Gram-only completeness

The SU(2) color action preserves **orientation**, unlike an arbitrary O(3) reflection. Define a spatial alternating three-form
\[
W_{ijk}(X)=\sum_{a,b,c=1}^{3}\epsilon_{abc}\,
X_{ia}X_{jb}X_{kc}
\quad(i,j,k=1,\ldots,9).
\]
Equivalently `W(X)=X_{\cdot1}\wedge X_{\cdot2}\wedge X_{\cdot3}`. For any color `R∈SO(3)`,
\[
G(XR)=G(X),\qquad W(XR)=W(X).
\]
For a reflected color frame `R∈O(3)` with `det R=−1`,
\[
G(XR)=G(X),\qquad W(XR)=-W(X).
\]
**Exact elementary witness:** `X` has only `X₁₁=X₂₂=X₃₃=1` nonzero; `Y=X·diag(−1,1,1)`. Then `G(X)=G(Y)`, but `W₁₂₃(X)=+1` and `W₁₂₃(Y)=−1`. They are distinct SO(3)-color orbits.

More precisely, `G` alone classifies O(3) right orbits. For rank-three matrices, equality of `G` yields `Y=XR` for some `R∈O(3)`; adding equality of `W` forces `det R=+1`. For rank below three, `W=0`, but the nontrivial kernel lets an O(3) reflection be absorbed into the stabilizer so an SO(3) representative exists. Therefore the **pair (`G`,`W`) separates all standard SU(2)-adjoint color orbits**.

This is a **positive, source-compatible candidate observable**, not yet a qualified source declaration. We must not say `W` is a conserved charge: an orientation-sensitive component can vanish as the frame rotates in spatial nine-space without losing rank. `W` transforms under global Spin(9); a component is not a global spatial scalar. Nor does it prove a protected Hopf texture or a fermion chirality index.

## 4. Existing original Fock operator: a genuine positive starting interface

`BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean` (blob `68fd2067b2dcdb6851afed269d25726dd5b634c5`) already contains the **literal original carriers**
\[
\mathcal K_B(X)
=\mathrm{originalColorQuadratic}\!\left(
  \sum_{i,j}G_{ij}(X)\,\Gamma_i B\Gamma_j\right)
\in\mathrm{End}_{\mathbb C}(\mathrm{Fermion}\ 2),
\]
for each original real 16×16 coefficient matrix `B`. It proves **pointwise SU(2) covariance**:
\[
\rho_F(g)\,\mathcal K_B(X)\,v
=\mathcal K_B(\rho_B(g)X)\,\rho_F(g)v.
\]
The components come from:
- `BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean`, blob `cfd3e1eeed420ce92ca54821816f4a53e073ad4a`: real-matrix-weighted quadratic operators on actual 2²⁴-dimensional original Fock space, commuting with its true SU(2) unitary action.
- `BFSSVLY0BOriginalGramGammaCoefficient.lean`, blob `e495f780f9ac382ac1e076ef20fa68b33c38f1cd`: polynomial Gram/gamma coefficient on actual Boson 2, invariant under its true SU(2) action.

These modules state that the original physical `FullL2` multiplier, unbounded-domain covariance, eigenvalue gaps, or BFSS Hamiltonian symmetry are **separate unproved questions**. We preserve that distinction.

**Counterfactual comparison:** `K_B` depends on `X` only through `G(X)`, so it is necessarily blind to the `X/Y` reflection witness **at the same original Fock vector `v`**. A new `W`-dependent gauge-covariant bounded pointwise Fock family *could* distinguish those color orientations, but its formula, self-adjointness, nonzero action, spectral gaps, original-Hamiltonian relevance and Spin(9) covariance would need separate proof. This is **not** license to add arbitrary `W` couplings to BFSS.

The original `Core.AlgebraData.charge` is already a source-defined differential operator on the 27 matrix coordinates using actual theta and gamma data. Its structure constants depend on the **su(2) orientation tensor**; however, an orientation-sensitive **gauge-invariant physical prediction** has not been obtained merely by noticing that tensor.

## 5. A bounded D1B target that could change our decision

**Question:** Is there an **original-source** continuous family of gauge-compatible physical operators whose spectral-gap locus `B_gap` has nontrivial topology relevant to a specified, physically justified parameter/spacetime domain, *and* with a symmetry-protected integer or other discriminating index?

The next work should inspect the exact source-normalized Hamiltonian and actual supercharges, their gauge-fixed domains, and existing pointwise `K_B` interface. Before constructing a new theorem, write a type-correct candidate:
\[
\text{physical configuration/parameter carrier}
\overset{F}{\longrightarrow}
\text{original gauge-physical operators},
\]
specify `F`'s domain, action, symmetry, topology, and measurable consequences. Do **not** identify a 0+1D matrix parameter family with a 3+1D spatial Dirac operator. For the simplest test, compare `G`-only and `(G,W)`-sensitive families while holding Fock labels fixed, then ask whether the **original** dynamics distinguishes them.

**Null controls:** unrestricted full orbit contraction (D0); rank-three orbit `π₃=0`; prior P1/P2 boundary-fixed bosonic escape and gapped toy Fock escape; P4 zero full-gamma AIII winding; scalar Gram-only source `K_B`; no-hopfion original BFSS physical states; conventional gauge/chiral EFT with independently sourced indices.

**Stop criteria:** No source-enforced protecting symmetry or no physically justified gap/parameter domain means no promotion to a topological particle/4D chirality. If the only new ingredient is an arbitrary coefficient `W` chosen to force a nonzero winding, record it as a toy model, not original BFSS.

## 6. Verdict and qualification

**Positive:** source SU(2) actions and real color Gram/Fock operator covariance are already provided; `(G,W)` is a mathematically complete color-orbit-separating invariant candidate and suggests an SCC adversarial test.

**Negative:** full orbit space is contractible (D0), **rank-three sector has zero π₃** (D1A), Gram alone misses color orientation, and rank-three excision discards classical zero-commutator valleys.

**Still OPEN:** source-normalized dynamical preservation of a topological subspace; a spectral-gap locus with nontrivial index; the original gauge-physical operator domain; any spatial chiral zero mode, four-dimensional particle content, empirical GUT.

**No new Lean compilation, CI artifact, or physical experiment. No changes to frozen original BFSS files, live RHOPF, FCP, or main.**
