# NORM-0: Original BFSS normalized Fock field — finite-coefficient route

**Date:** 2026-11-10 Pacific  
**Branch snapshot:** etblink/math, integration/bfss-unified-research-20261108 at 6fa8ef53cdaabfa23b3804c71f9e0243ec6271ec  
**Concurrent gate:** [JOIN-0B3 #42949497554](https://github.com/etblink/math/actions/runs/42949497554), IN PROGRESS when this research started. **Do not infer its conclusion or modify its files.**  
**Evidence tier:** MATHEMATICALLY DERIVED / LEAN NOT YET COMPILED. No physical Hamiltonian, supercharge-domain or mass-gap theorem.

## 1. Exactly what is frozen and already accepted

Original [Core](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean), verified Git blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60, defines literal Boson 2 as EuclideanSpace ℝ (SpaceIndex × ColorIndex 2), Fermion 2 as EuclideanSpace ℂ (Fin (2^(8*colorDim 2))), real GammaMatrix as Matrix SpinIndex SpinIndex ℝ, and FullL2 2 as Lp (Fermion 2) 2 (volume : Measure (Boson 2)). Thus the original finite Fock space is 2^24 dimensional. Do NOT replace any original carrier.

- [VLY-0A strict #42908736563](https://github.com/etblink/math/actions/runs/42908736563): source blob 5633ef2ed7cf182edaee171fb45273d325103b94, originalSpatialGram x i j = inner ℝ (spatialColor x i) (spatialColor x j), gauge invariant.
- [VLY-0B strict #42926845593](https://github.com/etblink/math/actions/runs/42926845593): source blob e495f780f9ac382ac1e076ef20fa68b33c38f1cd, originalGramGammaCoefficient x B = sum over i,j of M_ij(x) • (gamma_i * B * gamma_j).
- [BIL-0C strict #42924009228](https://github.com/etblink/math/actions/runs/42924009228): source blob cfd3e1eeed420ce92ca54821816f4a53e073ad4a, originalColorQuadratic J = sum over α,β,A of ((J α β : ℝ) : ℂ) • pairedTheta α A * pairedTheta β A, actual bounded original Fermion 2 operator.
- [JOIN-0A strict #42930427007](https://github.com/etblink/math/actions/runs/42930427007): source blob 68fd2067b2dcdb6851afed269d25726dd5b634c5, actual originalFockGramObservable x B = originalColorQuadratic (originalGramGammaCoefficient x B), pointwise genuine G2A/G4E SU2 covariance.
- [JOIN-0B1 strict #42934871831](https://github.com/etblink/math/actions/runs/42934871831): source blob 4070cbb2b8e6538bb5c328651f8df5a2c77a4bf5, real Gram–gamma transpose compatibility.
- [JOIN-0B2 strict #42947348625](https://github.com/etblink/math/actions/runs/42947348625): source blob 4c96a53f494ab0bd9891b686510aa59ea4e14044, consumer blob 1a2e9fd33c75c80c52cd028d44e02c87c474b18c, actual Fock star/transpose and independent skew-adjointness.
- [JOIN-0B3 candidate #42949497554](https://github.com/etblink/math/actions/runs/42949497554): source blob ecb6ab7935b0f46c1813aad2230cdd8ea0250d9a, independently checked candidate consumer 76eb1788cae1cb24b38059f41fc3a0ed54f9f3a7; do not treat as qualified pending strict green.
- Original gamma are FCP.BFSSGamma9.gamma i, exact [source signed permutations](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean), blob b9b8192055c70f0d001d7982669b9823c55562ed. The present first bound requires neither gamma Clifford identity nor gamma matrix norm.

## 2. Gram trace positivity and its universal coefficient envelope

For the literal original Gram M_ij(x), define T(x) := ∑_i M_ii(x) = ∑_i ‖spatialColor x i‖² ≥ 0.

It also equals ‖x‖² mathematically because original Boson 2 is a finite EuclideanSpace, but the exact Lean EuclideanSpace coordinate-norm adapter has NOT been qualified; do not use that equality without proving it. Trace is already sufficient for the denominator.

By real inner-product Cauchy–Schwarz and elementary two-square inequality, for all i,j:

|M_ij(x)| ≤ ‖c_i‖‖c_j‖ ≤ (‖c_i‖²+‖c_j‖²)/2 ≤ T(x).

This also holds when i=j (each nonnegative squared row norm is a summand of T). Therefore 1+T>0 and |M_ij(x)|/(1+T(x)) ≤ 1. As M itself is G2A gauge invariant, T is also G2A gauge invariant. These results do NOT depend on the full original gamma/Fock constructions.

Source-confirmed Mathlib lemma at frozen Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612: Mathlib/Analysis/InnerProductSpace/Basic.lean line 471 has abs_real_inner_le_norm. Use finite sum nonnegativity and a proven AM–GM helper; check the exact term-le-finite-sum lemma name before implementation. Source original spatialColor lives under OAI.BFSSQuantum.AlgebraData, not as a local abbreviation's projected field (lesson from B1's first red).

## 3. First robust operator bound: C_B finite, independent of x

For FIXED arbitrary real source B : GammaMatrix, define the literal original bounded Fock operator H_ij(B) := originalColorQuadratic (gamma_i * B * gamma_j) and the finite real number

C_B := ∑_{i=0}^8 ∑_{j=0}^8 ‖H_ij(B)‖ ≥ 0.

It contains exactly 81 norms of true bounded original Fermion 2 operators, so C_B is finite and source-faithful. Its value depends on B, exact original gamma, and actual Fock operators, never on x. No CAR norm estimate, direct Kx color-column equality, Clifford normalization, gamma isometry, auxiliary spectra or eigenvectors.

The missing small algebraic interface is REAL-LINEARITY of the ALREADY ACCEPTED originalColorQuadratic Q:

Q(J+K)=Q(J)+Q(K);
Q(r • J)=(r:ℂ) • Q(J), for r∈ℝ.

Both follow from the literal finite weighted source definition, but they still require an independent Lean gate. Use generic finite-weighted sum lemmas followed by the exact BIL-0C Q, with explicit real-to-complex casts. Beware the six B2 consumer reds: avoid untyped neg_smul placeholders and massive nested simplifier calls. Do not alter original BIL-0C.

Applying that map to VLY-0B's definition gives the key source-typed decomposition:

O_B(x) = ∑_{i,j} (M_ij(x):ℂ) • H_ij(B).

Consequently the operator norm triangle inequality and norm_smul imply

‖O_B(x)‖ ≤ ∑_{i,j}|M_ij(x)|‖H_ij(B)‖ ≤ T(x) C_B.

Define the normalized ACTUAL original Fock operator-valued field

Otilde_B(x) := (Complex.I * ((1/(1+T(x)) : ℝ) : ℂ)) • O_B(x).

Because norm of Complex.I is 1 and 0 ≤ T/(1+T) ≤ 1,

**UNIFORM ESTIMATE:** ‖Otilde_B(x)‖ ≤ C_B for EVERY original Boson 2 configuration x.

**This estimate is not yet Lean-qualified.** It is uniform in x for each fixed B; C_B itself depends on B. That level of uniformity suffices for one fixed-B bounded multiplication field on the full original L² space once its measurability/Lp adapter is separately proved.

Suggested source-root contracts for future separately frozen gates (LEAN PSEUDOCODE, NOT CHECKED):
- originalGramTrace : Boson 2 → ℝ := ∑ i, originalSpatialGram x i i.
- originalGramTrace_nonneg; originalGramTrace_gauge_invariant.
- originalGram_abs_le_trace x i j : |originalSpatialGram x i j| ≤ originalGramTrace x.
- originalColorQuadratic_add and originalColorQuadratic_real_smul, with exact source Q.
- originalFockGram_sum : O_B(x) = ∑ i j, (M_ij(x):ℂ) • Q(gamma_i * B * gamma_j).
- originalFockGammaBoundConstant B : ℝ := ∑ i j, ‖Q(gamma_i * B * gamma_j)‖.
- originalFockGram_norm_le_trace : ‖O_B(x)‖ ≤ T(x) * C_B.
- originalNormalizedFockGram_norm_le : ‖Otilde_B(x)‖ ≤ C_B.

Ensure exact actual Fermion 2 →L[ℂ] Fermion 2 is visible in signatures. Prefer explicit scalar casts and three-step calc proofs for sum distribution rather than broad simp. These names are planned, not established by this memo.

## 4. Optional stronger universal B-norm bound — not on first critical path

Let E_pq be the ordinary real 16×16 matrix entry basis. The frozen original real-linearity of gamma multiplication and pending qualified Q-linearity would imply:

B=∑_{p,q} B_pq E_pq;
H_ij(B)=∑_{p,q} B_pq H_ij(E_pq).

Define one fixed finite source-dependent constant

C_* := ∑_{i,j,p,q} ‖Q(gamma_i * E_pq * gamma_j)‖.

Then C_B ≤ C_* max_{p,q}|B_pq| and thus ‖Otilde_B(x)‖ ≤ C_*‖B‖_max for all x and B. This controls the whole real 256-dimensional coefficient carrier with ONE constant, and still needs no CAR/gamma isometric norm theorem. It adds a matrix-basis expansion and extra finite sum reshuffling. Preserve as an independent stronger follow-up, NOT a dependency for the first bounded operator multiplier.

The previously researched numeric constants 24‖B‖_F (via source color-column identification and sharp gamma bound) and 216‖B‖_F (via coarse Gram bound) are alternative still-unqualified quantitative targets. Neither is necessary for the fixed-B C_B route.

## 5. FullL2 multiplication is a separate analytic gate

Original Core defines FullL2 2 as a true Lp (Fermion 2) 2 space on original Boson 2 with volume. Pointwise uniform boundedness does not automatically yield a well-typed Lean FullL2 continuous linear map. Establish:
1. Continuous/strongly measurable x ↦ Otilde_B(x) in exact source coordinate topology. Gram coefficients are finite continuous quadratic polynomials and Q is finite real-linear; 1+T>0.
2. A.e.-independent representative mapping f ↦ (fun x => Otilde_B(x) (f x)), with strongly measurable composition and MemLp.
3. Exact continuous complex-linear FullL2 2 →L[ℂ] FullL2 2 with norm ≤ C_B and pointwise L² inequality.
4. Only then establish diagonal genuine SU2 gauge equivariance and any original invariant-subspace preservation using JOIN-0A covariance + T gauge invariance and actual source G-action on Lp.
5. Preservation of original unbounded charge domain/graph, closed quadratic form and Hamiltonian are independent and NOT automatic; do not claim a mass gap or physical eigenstates.

The existing original Core AlgebraData.smoothMultiplier is scalar multiplication on SmoothCore test functions, not an already constructed operator-valued multiplier on FullL2. Do not substitute it. Potential pinned Mathlib interface files: Mathlib/MeasureTheory/Function/LpSpace/Basic.lean, ContinuousFunctions.lean, Function/L2Space.lean; first review their exact definitions when advancing this stage.

For skew B, a future fully qualified B3 source/consumer yields pointwise IsSelfAdjoint (i • O_B(x)); multiplying by positive real (1+T)^(-1) preserves that exact finite-Fock property. Gauge covariance survives normalization because T is G2A gauge-invariant. Do not infer physical Hamiltonian self-adjointness from this.

## 6. Strict Lean workstream and explicit stop rules

**NORM-0A, independent of B3:** Import accepted VLY-0A original Gram only. Source: T≥0 and |M_ij|≤T (small local real-inner-product arithmetic). Independent consumer: T(g·x)=T(x) on actual G2A action plus positivity of denominator. No original gamma matrices, CAR or physical Lp.

**NORM-0B, independent of B3:** Import accepted BIL-0C and VLY-0B plus JOIN-0A. Source: originalColorQuadratic is real-linear and the actual O_B(x)=∑ M_ij • H_ij(B) identity. Distinct consumer: O_B(0)=0 or exact real scaling in Boson 2, only if its EuclideanSpace coordinate adapter is straightforward. No Fock star/transpose duplication.

**NORM-0C:** Combine qualified NORM-0A + NORM-0B. Prove C_B nonneg, ‖O_B(x)‖≤T C_B and uniform normalized bound. Independent consumer tests normalized pointwise original G2A/G4E gauge covariance; after B3 strictly greens, a separate source consumer can check normalized skew-input self-adjointness. Do not prematurely make C_B universal in B.

**NORM-0D:** Separately create the actual measurable source FullL2 2 bounded multiplication operator and its independent FullL2 consumer.

**NORM-0E (optional):** Entry-basis C_* bound independent of B, or later explicit CAR/gamma constants only if necessary for quantitative spectral applications.

At snapshot, the B1/B2 accepted union is 100 distinct frozen source/consumer blobs; running B3 has 102 CANDIDATE pins. No candidate parent is qualified merely because its branch commit exists. A new NORM gate must freeze all actual qualified imported parent blobs plus its new source and independent consumer, with exact path-hash conflict checks. Preserve Lean 4.34.1, Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, full cold source and independent consumer builds, standard permitted axioms only, and no sorry/admit/unsafe. On red inspect first causal compiler error and make the smallest repair. No edit to B3 during its run.

## 7. Project Lead decision

**Take the finite C_B route first.** It proves the important original Boson 2 uniform-in-x operator bound without a Clifford norm theorem, direct Kx three-color expansion, original CAR trace pairing, source gamma/Fock redefinition or physical spectral assumptions. Record its exact Lean gate qualifications before proceeding to the measurable FullL2 adapter; preserve the stronger C_* and explicit numeric constants for independently gated refinement.

This memo is SOURCE-GROUNDED FORWARD RESEARCH, not an accepted Lean proof or an original BFSS Hamiltonian spectrum statement.
