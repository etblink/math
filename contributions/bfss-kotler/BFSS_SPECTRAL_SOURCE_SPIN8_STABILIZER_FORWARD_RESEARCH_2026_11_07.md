# BFSS — source Spin(8) stabilizer, torus binding, and forward spectral research

**Date:** 2026-11-07  
**Status:** RESEARCH PRESERVATION / CONDITIONAL ANALYTICAL RESULTS — no new Lean qualification in this commit.  
**Repository:** etblink/math  
**Documentation branch:** research/bfss-original-gamma-faithfulness-20261107  
**Last independently reviewed strict mathematical gate:** gamma faithfulness, run [#42408460376](https://github.com/etblink/math/actions/runs/42408460376), tested commit [2b2b4b0b3134606b7c54784a147aeae2a5072064](https://github.com/etblink/math/commit/2b2b4b0b3134606b7c54784a147aeae2a5072064).  
**Scientific rule:** establish what is true, preserve adverse findings, distinguish source-exact Lean theorems from conditional analysis, and do not infer physical eigenvalues, confinement, or a mass gap from group representation results.

## 1. Research package and chronology

The following companion files are preserved with this memorandum:

1. [Adversarial frontier decision](BFSS_SPECTRAL_FRONTIER_ADVERSARIAL_DECISION_2026_11_07.md): conditional operator-column architecture; invalid M=6 bound for full operators; missing source/physical premises.
2. [Whole-sector oscillator exclusion](BFSS_SPECTRAL_WHOLE_SECTOR_OSCILLATOR_EXCLUSION_2026_11_07.md): a conditional analytical proof for the entire isotypic smooth core; it is *not* a Lean-qualified or physical spectral theorem.
3. [Source-exact representation-binding feasibility audit](BFSS_SPECTRAL_SOURCE_EXACT_REPRESENTATION_BINDING_AUDIT_2026_11_07.md): qualified inherited interfaces; source stabilizer, original operator algebra and continuity gaps; proposed gamma-faithfulness gate.
4. [Grok initial independent Spin(8) review](BFSS_SPECTRAL_SOURCE_SPIN8_GROK_INITIAL_REVIEW_2026_11_07.md): perpendicular-word proof architecture and center tests. **Historical only:** contains a wrong sign assignment for the source complex vector line and an incorrect statement about deleting a torus circle.
5. [Grok corrective review](BFSS_SPECTRAL_SOURCE_SPIN8_GROK_CORRECTION_2026_11_07.md): withdraws those errors and develops a compact connected-cover route. The corrections supersede those statements of the original report.
6. This document: integrated Project Lead analysis and future decision gates, not an additional independent proof certificate.

The original uploaded file SHA-256 values (before GitHub text/newline normalization) are recorded below for audit provenance; repository blob hashes are independent of these digests:

| Original supplied file | SHA-256 |
| --- | --- |
| BFSS_Frontier_Adversarial_Decision_2026-11-07.md | 6ad0ad09c712977080607e92d19e6a45c3c0a822b22041f991b6a497c49456b3 |
| BFSS_Whole_Sector_Oscillator_Exclusion_2026-11-07.md | ec1599bdf5386f434c65596331b7d46292ef8f1ea1639d22368f5ab885cc6781 |
| BFSS_Source_Exact_Representation_Binding_Audit_2026-11-07.md | fc88ff72b6f49d00271ea2b069571ae3cf24de03f6f02a3904874c4ca94987ab |
| Grok initial pasted text, 2026-11-07 20:51:57 filename timestamp | 1ad2761c095942dd5d93881597e7fabb11e763b69432f4ceb7d264d4e0b1d201 |
| Grok corrective pasted text, 2026-11-07 21:04:45 filename timestamp | 24f4e42e7fc32c847313c8473a8c8520e0d03777dc7199c0ddcea97e72348469 |

## 2. Accepted prerequisite and explicit acceptance evidence

At exact tested commit 2b2b4b0b3134606b7c54784a147aeae2a5072064, the strict run #42408460376 succeeded. Its archived source and independent consumer showed the six source gamma-faithfulness declarations, including:

- gammaNineRealLinear_injective;
- source9NegativeCentral_gamma and source9NegativeCentral_gamma_ne_one;
- source9SpinGamma_eq_one_iff;
- source9SpinGammaSpecialOrthogonalHom_injective;
- source9SpinGamma_fixes_iff_commutes.

The retained evidence includes source-closure and hash-pin checks, fresh compilation of the pinned ancestor closure, strict independent consumer, and axiom reports limited to propext, Classical.choice, Quot.sound. The previously failed #42406810092 was a strict unused-tactic consumer failure; it did not falsify the theorem. See the separate gamma gate note for the final receipt. The original source gamma homomorphism is now faithful **at its accepted tested commit**; this does not identify the spatial stabilizer with Spin(8) or construct the operator action.

## 3. Proposed axis-stabilizer theorem: source words supported in W

Let V = (Fin 9 -> Real), Q = source9Quadratic, e8 = source9CoordinateVector 8, and W = {v : V | v 8 = 0} = e8-perp under the original Euclidean transport. Define

\[
K=\{g:\operatorname{spinGroup}(Q)\mid
    R_9(g)e_8=e_8\}.
\]

Let P_W be the original source Spin elements expressible as even Clifford words in Q-unit vectors drawn entirely from W. The proposed exact result is

\[
\boxed{K=P_W,\quad
g\in K\Rightarrow
g=w_0w_1\cdots w_7,\quad Q(w_i)=1,\ (w_i)_8=0.}
\]

**Status:** analytical proof architecture from an independent external review, checked against original source interfaces; NOT yet kernel-qualified.

**Easy direction.** The source pair calculus gives the ordered product of two native hyperplane reflections for each Clifford unit-vector pair. A reflection with normal in W fixes e8; thus every even perpendicular word is in K. The exact source pair order matters.

**Hard direction, not supplied by the nine-dimensional C0-A3 theorem.** For g in K, its original determinant-one Euclidean isometry restricts to an element of SO(W). Apply Mathlib's reflection factorization on the eight-dimensional perpendicular subspace, rather than importing the nine-dimensional factor list; keep the reflection order, delete zero normals before parity, normalize to Q-units, and lift pairs through the original source construction. This obtains h with the same entire nine-vector action. F10CU gives g=h or g=(-1)h. Pad the perpendicular list with neutral repeated e0 pairs, then absorb a negative sign by negating the first perpendicular unit vector, yielding exactly eight factors while retaining W support. The empty-list and central-sign cases must be handled.

The **support constraint** is the new mathematical work. A black-box application of source9Spin_sourceUnitCartan_le_eight does not establish the normals lie in W. An ad hoc Clifford(W) inclusion or assumed reverse Lipschitz membership is not permitted as a shortcut.

Candidate Lean theorem (source names illustrative, not yet implemented):

~~~lean
source9Axis8Stabilizer_perpendicularWord (g : spinGroup source9Quadratic) :
  source9SpinVectorRepresentation g (source9CoordinateVector 8) =
      source9CoordinateVector 8
  ↔ ∃ w : Fin 8 → (SpaceIndex → ℝ),
      (∀ i, source9Quadratic (w i) = 1) ∧
      (∀ i, w i 8 = 0) ∧
      (g : CliffordAlgebra source9Quadratic) =
          source9CliffordWord (List.ofFn w)
~~~

Independent consumers must check 1, the actual negative center, perpendicular e0e1, mixed e0e8, plane rotors, central sign absorption, and exact reflection order. A strict compiler failure is a qualification failure, not automatically a counterexample. Preserve the same source types and foundational axiom policy.

## 4. Compact connected-cover shortcut, conditional on section 3

Let D be the eight-fold space of original Q-unit vectors supported in W. The positive quadratic form and exact same-label Euclidean transport identify D with (S^7)^8. D is compact and path-connected.

The already-qualified source map source9EightUnitSpinWord is continuous in the original PBW topology. Its restriction \(\Phi:D\to K\) is continuous and surjective *once* the perpendicular-word equivalence is established. Hence K is compact and path-connected. F10BE supplies the ambient Hausdorff topology, so K is closed. There is no need for a separate equalizer closedness proof.

A compact-to-Hausdorff continuous surjection is a quotient map. Define the source-compatible ordered perpendicular reflection map \(A:D\to SO(W)\). It is continuous by the standard Euclidean reflection formula and agrees with \(\rho\circ\Phi\), where \(\rho\) is the restricted original nine-vector action. The quotient property therefore proves \(\rho:K\to SO(W)\) continuous without a separately formalized PBW continuity theorem for the complete nine-vector representation.

Perpendicular Cartan factorization proves \(\rho\) surjective. The original two-sign source theorem F10CU gives its kernel exactly \(\{1,-1\}\). As a continuous compact-to-Hausdorff surjection with free finite central kernel, it is a two-sheeted group covering. Since K is path-connected, classical uniqueness of the connected two-fold cover of SO(8) identifies this covering pair with the standard Spin(8)->SO(8) covering, without a separate Clifford(W) construction.

**Source/theory boundary:** compactness, path connectedness, quotient argument, action continuity by factoring through \(\Phi\), the exact restricted kernel, and surjectivity remain to be packaged or proved as source-level consequences. Classification of connected double covers is classical mathematics, not a newly compiled source theorem. The covering equivalence must commute with the **original perpendicular vector projection**; an unspecified Spin(8) isomorphism would permit D4 triality and would not suffice.

The same quotient-map continuity argument is potentially reusable for the ambient original Spin(9)->SO(9) pair, starting from the existing continuous eight-word map on (S^8)^8.

## 5. Corrected source torus, center, and weight conventions

The four original perpendicular plane rotors are

\[
c_j(t)=\operatorname{source9PlaneSpinCurve}_{2j,2j+1}(t),
\qquad j=0,1,2,3.
\]

In F10BI/BJ/BS, their Clifford value is \(\cos(t/2)+\sin(t/2)e_{2j}e_{2j+1}\), their gamma derivative is \(\gamma_{2j}\gamma_{2j+1}/2\), and the vector derivative is \(F_{rs}=E_{rs}-E_{sr}\). Fix one character convention: a vector of weight w transforms as \(\exp(iwt)\). Then

\[
F_{rs}(e_r+i e_s)=i(e_r+i e_s).
\]

Thus the complexified vector line e_r+i e_s has weight **+1**, and a +i gamma-bivector eigenspinor has weight **+1/2**. Dual weights change sign. The original Grok report's vector weight -1 was wrong: it confused the coordinate z=x+iy of a real vector (which changes by exp(-it)) with the action on the complexified basis vector e_r+i e_s. The corrective report explicitly withdraws the error.

Both B4 and D4 have rank four. These same four circles form the common maximal torus; passing to K does **not** delete a circle. Restriction removes the B4 short roots ±eps_i, not a torus coordinate. The weight convention must match across the original vector, gamma16, paired 48 labels, and operator dual-input action.

A further proposed source torus lattice deduction is

\[
T(t)=\prod_{j=0}^3 c_j(t_j),\qquad
\ker T=\{2\pi n:n\in\mathbb Z^4,\ \sum_j n_j\ \mathrm{even}\}.
\]

The reasoning is that the SO(9) image forces each t_j to be 2pi integral and each c_j(2pi) is the same negative Spin center. Its character lattice is therefore

\[
X^*(T)=\mathbb Z^4\ \cup\ (\mathbb Z+\tfrac12)^4.
\]

This is a **new analytical deduction to be independently checked/qualified**, not an existing source declaration. It is the integral-or-half-integral lattice needed for the classical B4-to-D4 interlacing

\[
\lambda_1\ge\nu_1\ge\lambda_2\ge\nu_2\ge
\lambda_3\ge\nu_3\ge\lambda_4\ge|\nu_4|.
\]

D4 triality must not exchange the original vector eight-module with either half-spinor eight-module. The root-system identification must be carried by the original perpendicular vector action. The two half-spinor blocks need not be assigned names if the branching proof only uses the common weight lattice and source vector representation.

For \(\omega_W=e_0e_1\cdots e_7\), original reflection calculus predicts its source vector image diag(-I8,+1), distinct from 1 and -1. The explicit original signed-gamma tensor products give the finite identities \(\gamma_0\cdots\gamma_8=-I_{16}\) and \(\gamma_0\cdots\gamma_7=-\gamma_8\); this was independently checked as finite matrix arithmetic, **not Lean-qualified**. Thus 1,-1,omega_W,-omega_W are the four expected central elements of K; verify source membership, distinctness and centrality before promoting this to a source theorem.

## 6. Whole-sector oscillator result and operator-fiber boundary

The supplied analytical proof establishes, conditional on the literal source Spin(9)/Spin(8) group-and-action identification and the original CAR operator fiber, that for every smooth compactly supported Spin(9)-isotypic vector f,

\[
\boxed{\lambda_2>m+12
\Longrightarrow
(\Pi_{\le m}^{u,\beta}\otimes I_A)f_{\rm slice}=0,\quad u\ne0.}
\]

Its finite cyclic orbit-span argument makes the restriction and intertwiner pointwise meaningful for *all* vectors of the smooth isotypic core; it does not assume point evaluation on arbitrary L2 equivalence classes. The D4 branching bound is \(\nu_1\ge\lambda_2\), while oscillator level n together with A=End_C(F) has \(\nu_1\le n+12\).

The operator bound M=12 includes the contragredient input index. The former M=6 belongs to a Fock **vector**, not the entire operator carrier. The old type (24,18,0,0) can have a level-six slice; the replacement (24,24,0,0) excludes levels 0–11, not level 12. Strict inequality is necessary. These are negative findings to preserve.

The conditional gauge-physical construction using a source gauge-singlet vector, Spin averaging of a rank-one operator, and the nonzero color-invariant highest polynomial of type (2,2,0,0) yields nonzero smooth gauge-physical vectors of type (24,24,0,0), under the extra gauge and covariance premises. It is not a physical eigenstate or energy estimate.

**Open source action:** recover the complete complex original CAR/Clifford equivalence, not merely a real Clifford map; construct the continuous automorphism action on End_C(F), prove Hilbert adjoint and Hilbert–Schmidt preservation, verify alpha_{-1}=Ad_{original parity}, and retain output-only gauge action in the operator-column correspondence. A historical donor equivalence's imports total 131 contribution modules; the proposed cuts to 47 are uncompiled and not accepted. A global Fock-vector Spin lift is not necessary.

## 7. Qualitative coercivity without sharp constant optimization

A separate research observation is that the original source generic PotentialBounds.deformedFermionField_growth gives a finite (not necessarily sharp) massless fermionic growth constant C in the source norm. The proposed operator-column coercivity argument has the conditional form

\[
\widetilde q(f)\ge
(1/2-\beta)T(f)+
[\sqrt{\beta}(m+9)-C]J(f).
\]

For beta=1/4, choose m with m+9>2C and a high-weight polynomial sector (2k,2k,0,0) satisfying 2k>m+12. This avoids making the numerical estimate C=8sqrt(3), or the specific sector (24,24,0,0), essential for a **qualitative** result.

**This is only a conditional optimization of the research route.** Source-norm conversion, the actual massless original fermionic field, left multiplication on the Hilbert–Schmidt operator space, original physical core/form identity, gauge covariance, closure and reducing isotypic sectors remain separate mathematical obligations. No compact-resolvent or positive-eigenvalue result follows at this stage.

## 8. Stage gates and stop conditions

| Priority | Stage | Qualification / falsification criterion |
| --- | --- | --- |
| 0 | Retain exact gamma faithfulness | Run #42408460376 and its fixed artifact; no changing the accepted mathematical declarations |
| 1 | Perpendicular source exact-eight-word equivalence | Separate strict Lean source + independent consumers; fail on unsupported W normals, reflection-order inversion, zero-normal parity, or collapsed central signs |
| 2 | Connected cover and source torus correspondence | Establish correct restricted SO(8) covering and common oriented source torus; reject triality-swapped vector action, wrong character signs or unsupported topology |
| 3 | Complex original Fock-operator action | Test reduced donor recovery with original CAR crosswalk; verify full complex generation, original adjoint, HS norm, negative-center parity and continuity |
| 4 | Whole-sector exclusion source transfer | Actual source isotypic core and 16D slices, not only one special polynomial; preserve M=12 and strict threshold |
| 5 | Source physical form and closed domains | Prove gauge compatibility, form covariance, left-output direct-sum equivalence, reducing form-domain core and closure |
| 6 | Coercivity / compact resolvent / positive eigenvalue | Use finite C if possible; prove required compactness and nonempty positive spectral subspace, and challenge with same-sector escaping sequences |

Do not jump from representation facts or source Spin compactness to BFSS confinement. The original global model may still have scattering channels. A high-type point-spectrum statement would not prove a mass gap. Keep explicit counterexample searches and red CI outcomes as research data.

## 9. Source locators

- [Nine-vector Cartan factorization](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineUnitCartan.lean)
- [Same-order reflection-pair calculus](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineReflectionPair.lean)
- [Source two-sign word reconstruction](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineSignedWord.lean)
- [Exact eight-factor padding and sign absorption](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineExactEightWord.lean)
- [Eight-input map](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineEightInputSpinMap.lean)
- [PBW-continuous eight-input map](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineSpinWordContinuity.lean)
- [Original source compactness](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineCompactness.lean)
- [Source gamma-faithfulness declarations](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaFaithfulness.lean)
- [Original half-angle rotor](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BICoordinatePlaneSourceCurve.lean)
- [Gamma rotor derivative](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BJSourceCurveDerivatives.lean)
- [Native source vector velocity](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BSSourceMatrixCurveVelocity.lean)
- [Original positive source gamma square](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean)
- [Original BFSS potential bounds](../../lean/OAI/MathematicalPhysics/BFSS/PotentialBounds.lean)
- [Existing forward operator-column research](BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md)

**Final boundary:** This commit preserves analytical and strategic work, including superseded reasoning, but does not create or qualify any new theorem, proof-object manifest, workflow, Hamiltonian covariance or spectrum.
