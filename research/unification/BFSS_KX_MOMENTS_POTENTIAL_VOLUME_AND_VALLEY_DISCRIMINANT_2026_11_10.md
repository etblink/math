# Original BFSS Kx: exact trace moments, quartic potential and near-valley signature

**Date:** November 10, 2026. **Research boundary:** C48–VLY–BIL forward investigation, while original Fock BIL-0B strict #42920891450 is in progress. **Status:** exact Python/integer examples and self-contained mathematical identities; **not** a Lean-qualified theorem, BFSS Hamiltonian spectrum, compact-resolvent theorem, or empirical result. No modification to any C48, VLY, BIL source, original BFSS definition, or strict CI gate.

**Source pin:** original nine real symmetric signed-permutation gammas at etblink/math, Git blob b9b8192055c70f0d001d7982669b9823c55562ed, original module lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean. The new Python checker [bfss_kx_exact_moment_spectrum_check.py](tools/bfss_kx_exact_moment_spectrum_check.py) reads the exact Lean source, checks its Git-blob SHA-1, extracts the nine permutation/sign rows, verifies all real Clifford relations, and independently checks the stated finite-dimensional identities on six explicit and ten seeded arbitrary integer configurations. It requires NumPy. Run from the repository checkout with: python3 research/unification/tools/bfss_kx_exact_moment_spectrum_check.py . Source drift is fail-closed. The same calculation was independently executed with frozen extracted tables on the working Python kernel before preservation; fresh post-commit Python CI is not asserted.

## Definition and source-normalization control

Let X be the original nine-spatial by three-color REAL bosonic matrix (Boson 2). Write color columns x_A in R^9 and source gamma combination G_A=Gamma(x_A)=sum_i x_(i,A) gamma_i. On W = so(16,R) with dimension 120, define:

    K_x(B) := sum_{A=0}^2 G_A B G_A.

All source gammas are real symmetric, so this is a self-adjoint linear operator on W in its trace inner product, with coordinate action sum_A wedge^2(G_A). The original gauge SU2 adjoint mixes the three colors by real orthogonal R; the color-contracted sum is invariant. This is a polynomial auxiliary operator on the **real skew spinor coefficient carrier**, not yet an operator on the original Fermion 2 or full BFSS L2.

Define C=X^T X, a three-by-three real PSD matrix; the 9x9 spatial Gram M=XX^T is already qualified on Boson 2 by [VLY-0A #42908736563](https://github.com/etblink/math/actions/runs/42908736563). The nonzero eigenvalues of M and C coincide. Set:

    T = tr(C) = sum_A ||x_A||²,
    V = sum_(A<B) (||x_A||² ||x_B||² - <x_A,x_B>²)
      = sum_(A<B) ||x_A wedge x_B||²,
    D = det(C) = ||x_0 wedge x_1 wedge x_2||².

The V normalization is the literal original FCP S2A source **pairedAlgebraData.deformedBosonicPotential 1 0**, not a surrogate coupling: [S2A source](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-concrete-potential/experiments/openai-math-su2-physical-domain/SU2BFSSPhysicalDomainS2ASpatialWedgePotentialProbe.lean), theorem pairedPotential_eq_spatialWedges, Git blob 2574f86c7e0c99a1275ef55b51bb0c19a217cd5b. Its historical FCP acceptance is separate from a new current-branch source qualification.

## Exact three moments: the geometric operator already knows the original quartic potential

The proposed exact polynomial identities for all real X (checked with integer matrices):

    Tr_120 K_x     = -8 T,
    Tr_120 K_x²    = 120 T² - 224 V,
    Tr_120 K_x³    = -8 T³ + 96 D.

Thus, V=(120 T² - Tr K²)/224 and D=(Tr K³ + 8 T³)/96. The first three moments recover the three elementary symmetric invariants T,V,D of the three nonzero Gram eigenvalues, hence determine the unordered squared singular values via:

    z³ - T z² + V z - D = 0.

**Elementary proof plan:** diagonalize the PSD spatial Gram orthogonally: K_x=sum_(j=1)^3 lambda_j K(n_j), where K(n)(B)=Gamma(n) B Gamma(n). The Clifford rule makes each K(n_j) a symmetric involution and the orthogonal-axis involutions commute. The exact source spinor matrices give traces Tr I_W=120, Tr K_j=-8, Tr K_j K_k=8 and Tr K_1 K_2 K_3=8 for different orthogonal axes. Expand the first three powers; replace elementary symmetric sums by T,V,D. Alternatively avoid choosing eigenvectors by using the identity Tr_(wedge² 16)(wedge² A)=((tr A)²-tr A²)/2 and original Clifford traces. Neither method needs a replacement Hamiltonian or additional dimensions.

This is an **algebraic re-expression of already-defined classical potential information**. It is not an independent new force term, mass spectrum or evidence that BFSS physically realizes the auxiliary 120-dimensional operator.

## Exact auxiliary spectrum and rank-change discriminator

For three pairwise orthogonal spatial gamma directions, the 120-dimensional skew carrier decomposes into the joint K_j sign spaces:

| K_1 K_2 K_3 signs | Exact multiplicity |
|---|---:|
| +++ | 16 |
| ++-, +-+, -++ | 12 each |
| +--, -+-, --+ | 16 each |
| --- | 20 |

The checker verifies these dimensions via 8 exact character traces, not floating-point eigenspace rank. For Gram eigenvalues lambda_1 >= lambda_2 >= lambda_3 >= 0, the *full* auxiliary spectrum consists of sign sums ±lambda_1 ±lambda_2 ±lambda_3 with those multiplicities. Numerical eigvalsh is only a second independent sanity check.

Define the gauge-invariant, polynomial discriminator:

    Delta := T³ - 4 T V + 8 D
           = (lambda_1-lambda_2-lambda_3)
             (lambda_1-lambda_2+lambda_3)
             (lambda_1+lambda_2-lambda_3).

For a nonzero configuration, Delta>0 is **equivalent**, not mathematically stronger, to lambda_1>lambda_2+lambda_3; its new value is avoiding any explicit selection or differentiation of Gram eigenvectors. The last two factors are nonnegative on sorted PSD eigenvalues. Delta<0 corresponds to lambda_1<lambda_2+lambda_3. In terms of the K moments alone:

    168 Delta = -80 T³ + 3 T Tr(K²) + 14 Tr(K³).

**Inertias (positive, zero, negative):**
- Delta > 0: (56, 0, 64).
- Delta < 0: (52, 0, 68).
- Delta = 0, rank-three: (40, 28, 52).
- Delta = 0, rank-two and equal nonzero Gram eigenvalues: (28, 56, 36).
- X=0: (0, 120, 0).

At threshold, the **auxiliary** kernel appears; no physical BFSS Hamiltonian eigenvalue or gap is implied. The original finite-dimensional construction is SO(9)-covariant under source spinor gamma conjugation and gauge invariant under adjoint SU2, but the exact current Lean implementation of full source-Spin9 covariance and topological projectors still requires its own typed acceptance.

## Python observations, exact moments and signatures

| Case | T | V | D | Delta | inertia (+,0,-) |
|---|---:|---:|---:|---:|---|
| Rank one (2e0,0,0) | 4 | 0 | 0 | 64 | 56,0,64 |
| Rank two orthonormal | 2 | 1 | 0 | 0 | 28,56,36 |
| Valley dominant (2e0,e1,e2) | 6 | 9 | 4 | 32 | 56,0,64 |
| Threshold (Gram 4,2,2) | 8 | 20 | 16 | 0 | 40,28,52 |
| Three orthogonal unit color columns | 3 | 3 | 1 | -1 | 52,0,68 |
| Generic non-orthogonal integer columns | 12 | 39 | 36 | 144 | 56,0,64 |

All first, second and third trace moment identities passed on these six, and on ten seeded arbitrary integer 9×3 configurations. The checker's numerical eigenvalue comparisons are marked separately from exact integer traces.

## Best next formal milestones / no-gos

1. **VLY-KX0:** Prove the finite real-skew Gamma(n) operator transformation and its original SU2 gauge invariance. It uses only current original source gamma, G3A and qualified VLY-0A Gram; do not first construct the Fock lift.
2. **VLY-KX1:** Prove the three trace-moment polynomial identities in a small exact real matrix module and consume at least one with the already qualified original S2A potential identity. A direct trace/wedge calculation may be cheaper than globally choosing eigenvectors.
3. **VLY-KX2:** Prove the signed-character ranks and Delta threshold; only later build smooth spectral projectors on Delta>0 (and separately on Delta<0). The threshold locus must not be ignored.
4. **BIL-0B and BIL-0C:** Preserve the concurrent actual-Fock S3G2 pair-gauge gate and historical S3G3 arbitrary-J quadratic operation. Only after their current-source exact qualification, map W into original Fock gauge-invariant bilinears with correct CAR normalization.
5. **JOIN / PHYS:** Examine whether the K-moment identity corresponds to a useful bounded original Fock-observable identity. Any relation to original sixteen charge operators, closed physical quadratic form, or spectral confinement requires **new** separate proofs. Topological 56/64 does not imply particle generations.

**Negative knowledge preserved:** K_x is not a universal involution away from rank one; Delta=0 produces large auxiliary kernels, and a fixed global spinor 16→8→4→2 flag is topologically obstructed as a globally physical splitting. The near-valley 56/64 rank is a mathematically natural auxiliary geometry but not a new physical Hilbert-space reducing sector or mass gap. Use the exact source-verified witness rather than inferring physics from a visually suggestive Hopf analogy.
