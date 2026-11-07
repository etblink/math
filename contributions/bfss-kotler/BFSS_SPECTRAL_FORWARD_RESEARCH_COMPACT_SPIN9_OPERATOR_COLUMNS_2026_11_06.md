# BFSS forward research: compact source Spin(9) and physical operator columns

**Date:** 2026-11-06  
**Status:** EXPLORATORY RESEARCH MEMORANDUM — NO NEW LEAN-QUALIFIED SPECTRAL CLAIM  
**Research branch:** `research/bfss-spectral-confinement-roadmap-20261106`  
**Pre-document branch HEAD:** `c1f309ca6de85b6f9e6c76a38254140e333fe819`  
**Last strict mathematical gate verified:** [#42325087575](https://github.com/etblink/math/actions/runs/42325087575), green for the source-generic `massless_coreForm_energy` interface.  
**Separate contribution snapshot, READ ONLY:** [`etblink/math@fa00aa36...`](https://github.com/etblink/math/tree/fa00aa36e770ca516f57b41f5b02229a5033d50f), the physical-operator ancestry used in PR #77. Its full `OperatorDependencies` tree is **not** present on this research branch.

## Executive decision

Preserve a third research architecture alongside the existing direct Fock Spin(48) lift and the parity-even SO(9) descent:

> Prove the **literal original source Spin(9) compact** in its already-constructed PBW topology, construct its genuine **unitary action on the full original Fock operator algebra**, and apply spectral confinement to a **gauge-compatible operator-column Hilbert space** that is a finite direct sum of copies of the original physical BFSS Hilbert space.

This architecture might avoid a global Spin(9)-to-Fock-*vector* lift, explicit identification of all Spin-covering topology, and the parity-even restriction, while preserving the actual source Hamiltonian. It does **not** avoid the Spin(9)→Spin(8) branching theorem, core/form covariance, original gauge compatibility, or proof of the exact source closed-operator correspondence.

**No positive eigenvalue theorem is claimed here.** This record is an audit and feasibility charter, not a proof or invitation to create an upstream PR. The proposed interfaces below remain conditional until separately kernel-checked and independently consumed.

## A. Pinned inputs and accepted boundaries

The current branch retains:

- [F10Y nine-real PBW basis](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10YSourceNineCliffordPBWBasisProbe.lean), [F10BE PBW topology](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity.lean), [F10BF multiplication continuity](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BFPBWCliffordTopologicalRing.lean), and [F10BG group topology](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BGPBWSourceSpinTopologicalGroup.lean).
- [F10CW identity local chart](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CWOriginalSourceIdentityLocalChart.lean), [F10DE translated atlas](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DETranslatedSourceCharts.lean), [F10CU two-sign natural-action fibers](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers.lean), and the more recent accepted F10DW identity-differentiability theorem.
- [F10R original paired 48-label SO(48) homomorphism](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean). Its mathematical content is an **algebraic** homomorphism; continuity of the composed paired action still needs an exact consumer.
- [Original normalized Fock gamma CAR](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48NormalizedFockGammaProbe.lean), [self-adjoint gamma candidate](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockGammaSelfAdjointProbe.lean), and [exploratory universal Clifford-to-Fock homomorphism](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockCliffordUniversalLiftProbe.lean). Do **not** mistake their historical/prospective file headers for a fresh gate on this branch.
- The [massless core-form source theorem](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean) and source [`PotentialBounds.lean`](../../lean/OAI/MathematicalPhysics/BFSS/PotentialBounds.lean) containing `fermionGrowthConstant`, `deformedFermionField_growth`, and `deformedFermionField_inner_lower`. The first has a verified strict run; the latter source theorem is inherited, but its precise new consumer remains to be qualified.
- The [A/B](BFSS_SPECTRAL_CONFINEMENT_AB_AUDIT_2026_11_06.md), [C](BFSS_SPECTRAL_CONFINEMENT_C_AUDIT_2026_11_06.md), [D/lift](BFSS_SPECTRAL_CONFINEMENT_D_AND_LIFT_AUDIT_2026_11_06.md), [E averaging](BFSS_SPECTRAL_CONFINEMENT_E_GLOBAL_AVERAGING_2026_11_06.md) audits and three green linear-moment/smooth-core/weighted-closure gates. These are NOT a high-weight coercivity theorem.

Separate-snapshot **reader candidates** (not inherited by this branch) include `S1HSourceGaugeCovariantImplementerUniqueness`, `M3IOriginalComplexCliffordFockAlgebraEquiv`, `D2B10CFullHaarCoreCompatibilityAndDensity`, and `D2B28ConcretePairedSU2Hamiltonian`. Source declarations and manifest qualifications must be distinguished from an imported and newly consumer-qualified branch interface.

Pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` has `CliffordAlgebra.equivExterior` (LINEAR, not multiplicative), `CliffordAlgebra.equivOfIsometry`, and `Subgroup.isClosed_of_isLocallyClosed` in `Mathlib/Topology/Algebra/OpenSubgroup.lean`. Its `CliffordAlgebra.star` sends an **odd** real generator to its negative; it cannot be identified with Hilbert adjoint of a self-adjoint Majorana.

## B. New compactness route for the literal source Spin(9) (C0)

Write \(\mathrm{Cl}_{9,+}\) for the actual real positive-definite nine-axis source Clifford algebra and \(\widetilde{x}\) for word reversal. Let \(\operatorname{sc}\) be the coefficient of the empty monomial in the ordered PBW basis.

For ordered monomials \(e_I\) with source unit axes satisfying \(e_i^2=1\) and \(e_ie_j=-e_je_i\) for \(i\ne j\), the central algebraic identity is

\[
\operatorname{sc}(\widetilde{e_I}e_J)=\delta_{I,J},\qquad
\operatorname{sc}(\widetilde x x)=\sum_{I\subseteq[9]}c_I^2
\quad\text{when }x=\sum_Ic_Ie_I.
\]

A previous off-repository exact diagnostic checked all \(512^2=262{,}144\) ordered monomial pairs without contradiction. The diagnostic is **not** an accepted source theorem; the PBW-coordinate identity and normalization must be proved against F10Y's exact basis.

Define the ambient **even reversal-unitary** group
\[
K=\{x\in\mathrm{Cl}_{9,+}^{\mathrm{even}}:
   \widetilde{x}x=x\widetilde{x}=1\}.
\]
The equations define a closed subset in the finite-dimensional PBW topology. Its elements satisfy \(\sum_Ic_I^2=1\), making it bounded and therefore compact. Reversal gives inversion and multiplication remains continuous, so \(K\) is a compact Hausdorff topological group. Do **not** claim \(K=\operatorname{Spin}(9)\): the inclusion may be strict.

Mathlib's literal `spinGroup source9Quadratic` lies in \(K\): it is even and unitary, while on even elements the source Clifford `star` is reversal. Its topology is the inherited PBW subspace topology, the one used throughout F10BF/BG/CW/DE. The F10CW/DE open partial homeomorphisms to \(\mathbb R^{36}\) should supply a compact neighborhood of each source Spin element, i.e. local compactness of this *embedded subgroup*. A locally compact subgroup of a Hausdorff topological group, with the **subspace topology**, is closed; in pinned Mathlib one promising route is first establishing `IsLocallyClosed` and then applying `Subgroup.isClosed_of_isLocallyClosed`.

Proposed theorem boundary:
\[
\text{PBW positivity + compact }K
+\text{ source charts and local compactness}
\ \Longrightarrow\
\text{CompactSpace}(\operatorname{spinGroup}(Q_9)).
\]

**Falsification/hold:** failure of the actual PBW coefficient identity, different Clifford sign convention, lack of source chart/topology identification, or inability to prove local-closedness without importing new axioms. The abstract mathematical proof does **not** mean a Lean `CompactSpace` instance has been installed. No SO(9) surjectivity, Lie-group manifold, Fock vector lift or point-spectrum statement is implied.

## C. Operator-algebra Spin(9) action without vector phases (C1)

Let \(\mathcal F\) be the literal complex 24-mode source Fock space, \(\dim_\mathbb C\mathcal F=2^{24}\), and \(\mathcal A=\operatorname{End}_\mathbb C(\mathcal F)\), with the Hilbert adjoint and Hilbert–Schmidt inner product.

Define \(\Gamma_p=\sqrt2\,\theta_p\) using the **original paired Source48 labels**. Then \(\Gamma_p^\dagger=\Gamma_p\), \(\Gamma_p^2=1\), and \(\{\Gamma_p,\Gamma_q\}=0\) for \(p\ne q\).

**Minimal-generation candidate:** for every subset \(S\subseteq[48]\), let \(\Gamma_S\) be the ordered product. For nonempty \(S\), a Majorana generator anticommutes with \(\Gamma_S\): choose a label inside \(S\) when \(|S|\) is even and outside \(S\) when \(|S|\) is odd (possible since 48 is even). Cyclicity of the finite matrix trace then gives \(\operatorname{Tr}\Gamma_S=0\). Distinct monomials have products proportional to nonempty monomials, so
\[
\operatorname{Tr}(\Gamma_S^\dagger\Gamma_T)=2^{24}\delta_{S,T}.
\]
There are \(2^{48}=\dim_\mathbb C\mathcal A\) such elements, hence they would form a complete Hilbert–Schmidt basis. **Do not** attempt to enumerate those \(2^{48}\) operators computationally. This is a symbolic finite-CAR argument; source-exact \(\dim\mathcal F\), trace cyclicity and normalization need Lean evidence.

Compare this minimal route against recovering the separate snapshot's full M3I equivalence. The latter imports 109 declared `OperatorDependencies` among 131 contribution modules in its manifest closure, whereas this branch currently has four `OperatorDependencies` files. Manifest counts are dependency-surface indicators, **not** compile-time benchmarks, and the minimal route may itself be harder to prove.

F10R supplies the actual source-group action \(R_{48}(g)\) on original Majorana labels. An orthogonal action sends \(\Gamma(v)\mapsto\Gamma(R_{48}(g)v)\) and preserves the Clifford relations, inducing an algebra automorphism \(\alpha_g\) of \(\mathcal A\). Establish existence, the group law and continuity **on the original \(\mathcal A\)**, either via the full Clifford equivalence or the symbolic monomial basis.

Since \(\Gamma(v)\) is self-adjoint for real \(v\), each \(\alpha_g\) sends self-adjoint generators to self-adjoint operators. If these generate all of \(\mathcal A\), uniqueness of adjoint on the generators shows \(\alpha_g(T^\dagger)=\alpha_g(T)^\dagger\).

**Small trace-invariance lemma:** for any complex algebra automorphism \(\alpha\) of \(\operatorname{End}_\mathbb C(\mathcal F)\), \(L_{\alpha(T)}=\alpha L_T\alpha^{-1}\) as linear endomorphisms of \(\mathcal A\). Since \(\operatorname{Tr}_\mathcal A L_T=(\dim\mathcal F)\operatorname{Tr}_\mathcal F T\), we get \(\operatorname{Tr}\alpha(T)=\operatorname{Tr}T\). Thus any such adjoint-preserving \(\alpha\) is Hilbert–Schmidt unitary:
\[
\|\alpha(T)\|_{\mathrm{HS}}^2
=\operatorname{Tr}\alpha(T^\dagger T)
=\operatorname{Tr}(T^\dagger T).
\]

**Critical negative knowledge:** Mathlib Clifford `star` is *negative* on the original odd generators; the Fock Hilbert adjoint is *positive*. Do not call the existing real Clifford homomorphism a global star homomorphism. Use the original Fock adjoint and its generator properties explicitly. An action on \(\mathcal A\) is not yet a unitary action on \(\mathcal F\), and we must not assert one.

## D. Gauge projection and physical **left** ideal (C2)

Set \(W=\mathcal F^{SU(2)}\) under the *original* Fock gauge unitary action, and let \(P_W\) be the orthogonal projection. Earlier source work gives nonzero gauge-invariant Fock vectors, but construction of \(P_W\) in this branch and any Haar integration require exact acceptance. Nonzeroness and even/odd parity should never be guessed from a substitute representation.

For fixed \(s\in\operatorname{Spin}(9)\), assuming \(\alpha_s\) and its correct label covariance are proved, \(\alpha_s(U_g)\) and the original \(U_g\) implement the same SU(2) color rotation on all \(\Gamma_p\). Irreducibility/complete generation makes the difference scalar. Because \(\alpha_s\) preserves products, those scalars form a character of the **literal** SU(2) gauge group; triviality yields
\[
\alpha_s(U_g)=U_g,\quad\alpha_s(P_W)=P_W.
\]
The separate-snapshot S1H `original_source_gauge_representation_unique` is a possible ready-made consumer, **subject to its exact Majorana covariance hypothesis and substantial import closure**. Test the cheaper direct character argument before importing S1H wholesale. A phase ambiguity must not simply be set to one by definition.

Define
\[
\mathcal A P_W=\{TP_W:T\in\mathcal A\}.
\]
**Correction to prior conversation:** this is a **left ideal**, not a right ideal. As a Hilbert space it is isometric to \(\operatorname{Hom}_\mathbb C(W,\mathcal F)\), and \(\alpha_s(P_W)=P_W\) makes it Spin(9)-invariant. Its elements vanish on \(W^\perp\).

The correct gauge action on operator-valued wavefunctions uses **left multiplication on outputs** and the original bosonic color pullback; it is not automatically conjugation on both Fock indices. Since input vectors \(w\in W\) are gauge invariant, this action makes
\[
T(X)\longleftrightarrow \bigl(T(X)w_1,\ldots,T(X)w_d\bigr)
\]
an isometric finite-column identification with \(d=\dim W\) copies of the **original physical** full \(L^2\) space:
\[
\mathscr H_{\mathrm{col}}\simeq\mathscr H_{\mathrm{phys}}^{\oplus d}.
\]

The source differential charges and fermionic multipliers act **by left multiplication** on each column. Under the correct original physical core and closed-graph domains, the candidate operator is
\[
\widetilde H=H_{\mathrm{phys}}\oplus\cdots\oplus H_{\mathrm{phys}}.
\]
This equality must be proved at graph/domain level, not inferred from equality on arbitrary smooth functions. A nonzero eigenvector has at least one nonzero column, so a **proved** eigenpair of \(\widetilde H\) transfers to the genuine original physical Hamiltonian. Eigenpair transfer alone does **not** prove existence.

**Central-element diagnostic:** source \(-1\) acts as \(-I_{48}\) on Majorana labels; \(\alpha_{-1}\) acts as conjugation by Fock parity, not as scalar \(-1\) on \(\mathcal A\). This is compatible with the full operator-space action. The parity-even restriction and SO(9) quotient remain alternatives, but are **not prerequisites** for the full-Spin(9) plan.

## E. Representation weights and a nonempty high-type test (C3)

The canonical proposed source action preserves \(P_W\). The gauge-invariant spatial polynomial from the existing C audit,
\[
P(X)=\sum_{a<b}(\zeta_a\eta_b-\zeta_b\eta_a)^2,
\]
has Spin(9) highest weight \((2,2,0,0)\), subject to the *exact* source vector action and chosen pullback convention. Therefore
\[
T_{k,\chi}(X)=\chi(\|X\|)P(X)^kP_W
\]
is a prospective nonzero physical-column highest vector of weight \((2k,2k,0,0)\). Disjoint smooth radial cutoffs yield infinitely many independent vectors in that **same** isotypic type. This must be checked on the operator-column model; a polynomial vector alone is not an eigenstate or an invariant domain of \(H\).

For the enlarged fermion operator space, the proposed infinitesimal first-Cartan generator is the commutator derivation \(D(T)=[J,T]\), where the original 48-label skew generator comprises 24 rotation planes of frequency \(1/2\). The CAR quadratic implementation has \(\|J\|\le6\) under the original normalization, giving
\[
\|D\|_{\mathrm{HS}\to\mathrm{HS}}\le12.
\]
Thus the candidate first-coordinate fermionic weight cutoff is \(M\le12\), rather than the Fock-vector bound \(M\le6\). This **requires source-exact Lie-action identification**, not just a norm inequality on an unrelated matrix. No full operator-space character decomposition is necessary for the conservative bound.

The **largest open representation-theoretic obligation** remains the Spin(9)→Spin(8) interlacing/exclusion lemma \(\nu_1\ge\lambda_2\), applied to all vectors in the selected isotypic component, not just \(T_{k,\chi}\). Pinned Mathlib offers root-system and general representation infrastructure; our targeted lookup did not locate a ready-made B4→D4 branching theorem. Classical interlacing and Gate C's bounded diagnostics are not a Lean proof.

**Rejected shortcut:** two large commuting Cartan rotation weights do not imply large \(\lambda_2\). A scalar harmonic \((u_1+iu_2)^k(u_3+iu_4)^k\) can carry both angular weights while belonging to one-row highest weight \((2k,0,0,0)\). Similarly, vanishing of the *particular* \(P^k\) test family at valleys does **not** imply the entire isotypic subspace has that vanishing property; the kinetic operator can lower vanishing order. Preserve these failures.

## F. Qualitative first, quantitative later

The original `PotentialBounds.lean` already proves a finite nonnegative source coefficient \(C_M=M.\mathrm{fermionGrowthConstant}\) and
\[
\|M.\mathrm{deformedFermionField}(1,0,X)\|\le C_M\|X\|.
\]
Combining the green exact `massless_coreForm_energy` identity with a separately accepted SU(2) wedge-potential specialization should give a *core-level* lower bound using **the original** \(H\), with no sharp source skew-CAR diagonalization.

If the full-space one-color oscillator exclusion, rotated scalar-form averaging, and operator-column covariance all survive, choose
\[
\beta=\frac14,\qquad \frac{m+9}{2}>C_M,\qquad 2k>m+12.
\]
The candidate **qualitative** coercivity statement in the selected operator-column sector is
\[
\widetilde q(T)\ge\frac14\|\nabla T\|^2
+\Bigl(\frac{m+9}{2}-C_M\Bigr)
\int\|X\|\|T(X)\|_{\mathrm{HS}}^2\,dX.
\]
The coefficient is positive. The three previously green compactness-analysis gates may supply the analytic closure step, once the **actual source closed form**, sector reduction, and weighted-domain compatibility are proved. Compact resolvent on an infinite-dimensional nonnegative self-adjoint sector would yield infinitely many positive eigenvalues, with finite-dimensional zero kernel; no separate zero-mode exclusion is required.

The previously investigated explicit \(C=8\sqrt3,\lambda_2>17\) and optional near-valley \(\lambda_2>6\) strategies remain *strengthenings*, not critical dependencies of the qualitative argument. A continuous spectrum \([0,\infty)\) globally does not forbid embedded positive **point** eigenvalues, and we must not call this a full-spectrum mass gap.

## G. Decision gates, falsifiers and minimal-file preference

| Gate | First precise deliverable | Fail/hold criterion |
|---|---|---|
| **C0a** | PBW scalar-reversal orthonormality against original F10Y basis, no ambiguous Clifford sign convention | Nonpositive coefficient form or mismatched source axes |
| **C0b** | Original even reversal-unitary \(K\) is a compact Hausdorff group in the same PBW topology | Unproved continuity, subgroup law, or compactness |
| **C0c** | Local compactness of literal `spinGroup source9Quadratic` from F10CW/DE charts; closedness in \(K\); compactness of the original Spin(9) | A different topology, unproved embedding, or missing locally-closed argument |
| **C1a** | Source 48 normalized Majorana adjoint/CAR plus symbolic monomial trace orthogonality; assess minimal imports vs M3I | Substitute module or brute-force \(2^{48}\) enumeration |
| **C1b** | Genuine continuous algebra automorphism \(\alpha\), Fock adjoint preservation, trace invariance, HS unitarity | Confusing Clifford `star` with Hilbert adjoint, or mere projective action |
| **C2a** | Exact source SU(2) covariance and \(\alpha_s(U_g)=U_g\), then \(\alpha_s(P_W)=P_W\) | Undischarged character phase, gauge-action mismatch |
| **C2b** | Isometric physical-column identification and **closed-domain** equality \(\widetilde H\simeq H_{\rm phys}^{\oplus d}\) | A nonphysical gauge action, incorrect left/right ideal, wrong normalization or core |
| **C3a** | Source-exact Spin(9) form covariance and reducing-sector projection | Lie-algebra action substituted for global representation |
| **C3b** | Nonzero \((2k,2k,0,0)\) family and correct B4→D4 oscillator exclusion on full isotypic sector | Only a particular test vector excluded; half-integral/integral lattice mismatch |
| **C4** | Original-source coercivity with finite \(C_M\), accepted closure and compact resolvent, then original-column eigenpair extraction | Conditional premisses mistaken for certified eigenvalue existence |

**Dependency isolation:** C0 and C1a can advance independently. Do not import the entire PR #77 operator package to obtain one theorem unless its manifest closure and consumer value justify that cost. The current separate M3I snapshot has 109 transitive operator-dependency modules; S1H has 177, and D2B28 has 96 according to its declared import manifest. Those counts overlap and are *not* wall-clock predictions.

**Falsification controls:** audit the \(-1\) parity action; wrong Majorana \(1/\sqrt2\) scaling; group action that is only projective; trace identity without adjoint compatibility; singular gauge projector \(P_W=0\); high-weight polynomial that is not highest for the literal spatial action; a bounded-form-energy escaping Weyl family in the same fixed type; leakage of odd operators if a parity-even fallback is chosen; and any discrepancy between the source smooth core and the closed physical Hamiltonian.

## H. Research architecture decision and next bounded step

**Primary feasibility lane:** C0a→C0b→C0c, preserving each accepted intermediate result even if closure fails. In parallel, do a paper/Lean-API inventory for C1a and exact source gauge-character reuse. Once C0 is actually qualified, compare the *minimal* original-source Fock operator action with the direct Spin(48) implementation on proof-import count, failed-gate mechanisms and mathematical obligations.

**Fallbacks retained:** (i) parity-even operator subspace with source two-sign descent to SO(9), requiring exact quotient/surjectivity or a suitable compact image group; (ii) source-exact Fock-vector Spin(48) lift; (iii) finite generated compact group of one-parameter unitary rotations, requiring a separately verified stabilizer/branching theory. A bad result from one route must remain documented, not silently shifted to another carrier.

**Operational boundary:** this memorandum is the sole intended new repository file in the present commit. No changes to existing Lean sources, qualified runs, workflow YAML, cache validators, frozen source pin, existing roadmaps, original research branch or upstream PRs. New mathematical results require separately chartered source/consumer/axiom gates. A green documentation commit would show document integrity, **not** proof of any claim here.

**Guiding rule:** preserve the theorem/assumption boundary, learn from counterexamples and failed implementations, and prefer a smaller exact source theorem to a larger elegant substitute.
---

## I. Supplemental forward-research audit: 2026-11-06, after the first memorandum

**Status:** RESEARCH ADDENDUM; NOT A LEAN-QUALIFIED MATHEMATICAL RESULT. This section preserves the subsequent read-only investigation and updates the *preferred order of tests*. Sections A–H remain as contemporaneous evidence; this addendum explicitly supersedes their C0 ordering and simplifies the proposed C2 carrier. Nothing in this addendum asserts a new successful Lean run, physical eigenvalue, or formal resolution of the manuscript's spectral theorem.

### I.1. A second, constructive compactness route: bounded normalized Clifford words

Pinned Mathlib @ `d13f23b723b8a846827a245b89c10fc7d3f11612` contains the **Cartan–Dieudonné reflection factorization**, not merely generic reflection utilities: [`LinearIsometryEquiv.reflections_generate_dim`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean#L226-L241) represents a real orthogonal map as a product of at most the dimension's number of hyperplane reflections.

For the *natural nine-vector action* of the **literal** `spinGroup source9Quadratic`, an SO(9) element factors through at most 9 reflections. Its determinant is +1, so the number of reflections must be **even**, hence at most **8**. Pinned source [F10BH](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BHUnitVectorPairMembership.lean) already constructs genuine source Spin(9) elements from **two** unit source Clifford vectors, with correct Clifford multiplication and gamma image. [F10CU](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers.lean) classifies equal nine-vector action fibers as `g=h` or `g=(-1)h`.

**Target:** for every original source Spin(9) element `g`,
\[
\exists (u_1,\ldots,u_8)\in(S^8)^8,\qquad
g=\iota(u_1)\cdots\iota(u_8).
\]
A shorter even list can be padded with repeated unit pairs `ι(u)ι(u)=1`; to switch the sign when the natural representation only determines the element up to `±1`, negate one unit factor. If the map from `(S^8)^8` to the exact source Spin carrier is continuous in F10BG's topology, the fixed-eight-word theorem makes the source group a **continuous image of a compact space**. No ambient-even-unitary closed-subgroup or locally-closedness theorem is needed.

**Do not silently port 48D to 9D.** Previous V7I–V7Q and V7X–V7Y modules demonstrate exact same-label Cartan factorization and genuine Spin words for **source48Quadratic**, not `source9Quadratic`. The nine-dimensional work requires its own source-normalized hyperplane reflection formula, determinant-one theorem for the **nine-vector action**, order preservation and even-word product. Reuse the successful proof method, not a different representation's theorem conclusion. [F10Q](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10QSourceSpinOrientationDetOneProbe.lean) proves determinant +1 for the original **16-dimensional real gamma representation** and associated paired 48-label action; this is **not itself** the determinant-one theorem for the nine-vector representation.

**Failure criteria:** any incorrect reflection sign/order, odd determinant in the nine-vector image, failure to lift normalized reflection pairs as actual source Spin words, failure of the exact two-sign correction, or a mismatch between the image topology and source PBW topology. The result is not yet Lean-qualified.

**Competing C0 fallback (retained):** the original PBW reversal-positivity route from section B. There, compactness of an ambient even reversal-unitary Clifford group follows from the source coefficient identity, followed by local closedness of the literal Spin subgroup. The fixed-eight-factorization route should now be **tested first** because its final compactness step uses a single continuous map of compact spaces, but the two C0 proofs are independent and neither should be claimed before strict verification.

### I.2. Nine-dimensional orientation through the central Clifford volume

A source-specific way to avoid abstract determinant characters uses
\[
\omega=e_1e_2\cdots e_9.
\]
For an orthonormal positive Clifford basis, `ω` commutes with every generator (eight swaps), and `ω²=1`. If the natural action `R_g` is genuinely orthogonal and `g e_i g^{-1}=R_g e_i`, then
\[
g\omega g^{-1}=\omega,\qquad
\prod_{i=1}^9 \iota(R_g e_i)=(\det R_g)\omega
\]
(the latter for an orthonormal transformed frame, using the top-grade/volume identity). Hence `det R_g=1`.

**Unproved source-exact step:** the top-degree transformed-product/determinant identity, including the exact source vector action, orientation and original basis. [F10Y/F10Z](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10ZSourceNineExteriorPBWOrderedWordProbe.lean) and [F10CR/F10CT](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CTExteriorScalarKernel.lean) offer existing PBW/exterior coefficient technology. This is a **candidate proof route**, not an accepted determinant theorem. Preserve the generator-character and reflection-determinant alternatives if it fails.

### I.3. Physical-column simplification: use the full operator algebra, not an ideal

The left-ideal construction in section D remains valid **conditionally**, but is not necessary for the finite-column Hamiltonian comparison. Define the full operator-valued space
\[
\mathscr K=L^2(\mathbb R^{27},\,\mathcal A),
\qquad \mathcal A=\operatorname{End}_{\mathbb C}(\mathcal F),
\quad d=\dim_{\mathbb C}\mathcal F=2^{24}.
\]
Equip it with the *left-output* SU(2) gauge action
\[
(G_gT)(X)=U_g T(g^{-1}\!\cdot X)
\]
(with the precise source pullback convention to be audited). The input Fock index is **untransformed**, not conjugated. Choosing a constant orthonormal input basis `e₁,…,e_d` identifies the gauge-physical operator-valued subspace with **d copies** of the genuine source physical Hilbert space:
\[
\mathscr K_{\mathrm{phys}}\simeq\mathscr H_{\mathrm{phys}}^{\oplus d},
\qquad T(X)\mapsto (T(X)e_j)_j.
\]
The source charge column/fermionic multiplier/gradient acts **on outputs** and therefore diagonally on these columns. The desired identity
\[
\widetilde H\simeq H_{\mathrm{phys}}^{\oplus d}
\]
still requires equality of the exact source smooth cores, closed quadratic forms, operator graphs and domains—not merely a pointwise formal expression. A proved nonzero eigenvector of `H̃` then has a nonzero physical column with the same eigenvalue. This does **not** create an eigenpair.

For the proposed spatial action
\[
(S_sT)(X)=\alpha_s(T(s^{-1}\!\cdot X)),
\]
the **necessary gauge compatibility** is `α_s(U_g)=U_g`; it makes `S_s` commute with the *left-output* gauge action. This route removes the requirement that `\mathcal A P_W` be an invariant **left** ideal, and removes the full projector `P_W` from the **Hilbert-space carrier**. It does not eliminate the source group action, gauge uniqueness or form covariance proof.

**Scientific warning:** an automorphism-valued action on Fock operators need not integrate to a genuine Fock-**vector** group action. The operator-column action is a different honest representation on a finite-multiplicity extension; it can be useful only with an exact self-adjoint **original-source** column comparison.

### I.4. A single genuine gauge-singlet vacuum replaces the full gauge-singlet projector

The separate PR #77 contribution snapshot [G4K2A](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4K2ANonzeroVacuumRadialProfileProbe.lean) explicitly identifies a **nonzero original Fock vacuum fixed by every genuine SU(2) gauge element**. Subsequent L6G6P/L6G6S source interfaces identify the same original vacuum in generator constructions. No such file is silently assumed inherited by the active branch.

Pick a normalized original gauge-invariant vector `w` and the rank-one projection `P_w=|w⟩⟨w|`, so `U_gP_w=P_w`. If the proposed compact source Spin(9) action `α_s` is genuine, continuous, adjoint preserving, trace preserving, and satisfies `α_s(U_g)=U_g`, define the operator average
\[
T_0=\int_{\operatorname{Spin}(9)}\alpha_s(P_w)\,ds.
\]
Each integrand is positive with trace one. Consequently `T₀` is positive, has trace one and is **nonzero**; left gauge invariance and Spin invariance follow by the stated commutation and Haar invariance. The proposed test functions
\[
T_{k,\chi}(X)=\chi(\|X\|)\,P(X)^k\,T_0
\]
would provide high-weight physical-column witnesses **only after** source polynomial type, source gauge invariance, the group action, and compact-core requirements are proved. These functions are test vectors, not eigenvectors.

The separate contribution import manifest lists **38** operator-dependency ancestors for G4K2A versus **176** for S1G, an important *dependency-surface warning*, not a precise Lean timing forecast. One genuine gauge-singlet vector and a Spin average may be cheaper than constructing the full gauge-singlet projector; however the Haar machinery is not free.

### I.5. SU(2) gauge-phase elimination independently of compact Spin(9)

The separate [S1G source character proof](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1GExactSourceRelativeCharacterTrivialityProbe.lean) uses **the literal Pauli-normalized SU(2)**, quarter-turn source matrices, diagonal/off-diagonal curves, and Euler factorization to eliminate the relative scalar character.

For a source operator automorphism `α_s`, prove:
\[
\alpha_s\operatorname{Ad}_{U_g}=\operatorname{Ad}_{U_g}\alpha_s
\quad\Rightarrow\quad
\alpha_s(U_g)U_g^{-1}\in\mathbb C^\times I.
\]
This uses *complete complex* generation/irreducibility of the original Majorana operator algebra, not an unverified abstract Clifford equivalence. Then the scalar is a multiplicative character of literal SU(2) and must be trivial. Thus `α_s(U_g)=U_g`.

Because S1G establishes character triviality **algebraically**, this proof lane can be investigated before Spin(9) compactness or any Haar projector. The quoted snapshot S1G/S1H interfaces have extensive transitive imports; a smaller exact character proof may be preferable. Do not set the scalar equal to one by definition.

### I.6. Exterior-algebra weight bound without constructing quadratic CAR generators

For a spatial rotation in one plane, the original 48 real Majorana labels decompose into 24 two-dimensional rotation blocks of angular frequency `1/2`. Under complexification, each block has weights `±1/2`; on exterior powers, each block contributes `−1/2,0,+1/2`. Therefore the **full Fock-operator algebra's** conservative first-Cartan weight bound is
\[
|w_1|\le 24/2=12.
\]
The natural Clifford/exterior identification
`CliffordAlgebra.equivExterior` in pinned Mathlib is a **linear** equivalence. It may yield the needed representation-weight estimate without constructing the quadratic Fock generator `L(A)` or proving its exponential laws. The remaining theorem is **equivariance** under the *actual* source orthogonal automorphism, with exact Majorana scaling and real-to-complex transport. An abstract dimension count does not prove source-equivariance.

**Rejected shortcut preserved:** two large commuting angular momenta do not force a large second highest weight. The harmonic example `(u₁+iu₂)^k(u₃+iu₄)^k` is a **one-row** highest-weight type `(2k,0,0,0)`; its large Cartan weights alone cannot replace the required Spin(9)→Spin(8) restriction theorem. Vanishing of one polynomial family on the commuting valley does not imply vanishing of its entire isotypic sector.

### I.7. Exact source massless fermion frequency identity is within reach

Inspect [original `FermionQuantization.lean`](../../lean/OAI/MathematicalPhysics/BFSS/FermionQuantization.lean), specifically the existing `deformedFermionField_bracket`, `frequency_bracket_contraction` and `deformedFermionField_quantized`. The last is written for `(h,m)=(1,1)`, but the bracket identities isolate the massless piece directly.

Let
\[
K_0(X)_{rs}=-\sum_{j,C} f_{s_2r_2C}\,X_{jC}\,\gamma^j_{r_1s_1}.
\]
The natural exact-source **candidate** is
\[
M.\mathrm{deformedFermionField}(1,0,X)
=\bigl(M.\mathrm{quantizeFrequency}(K_0(X))\bigr)
.\mathrm{restrictScalars}\,\mathbb R.
\]
Its coefficients match the source massless `(-i/2)` cubic contraction after using the existing source lemma; it needs a separate Lean specialization and independent consumer/axiom gate. It is **not** the assertion that the existing `(1,1)` theorem itself proves `(1,0)`.

The already-inherited [`PotentialBounds.lean`](../../lean/OAI/MathematicalPhysics/BFSS/PotentialBounds.lean) still gives the **qualitative** source bound `‖B(X)‖≤C_M‖X‖` without finite-matrix diagonalization. Hence the massless frequency identity is valuable for source crosswalk and future quantitative estimates, **not a dependency of qualitative confinement**.

### I.8. Important real/complex Clifford dimensional obstruction

The real Clifford algebra has real dimension `2^48`, whereas
\[
\dim_{\mathbb R}\operatorname{End}_{\mathbb C}(\mathcal F)=2^{49}.
\]
Thus a real-linear Clifford-to-Fock algebra homomorphism cannot be **onto all complex-linear Fock operators as a real vector space**. The *complex span* of the `2^48` Majorana monomials has the correct complex dimension:
\[
\dim_{\mathbb C}\operatorname{End}_{\mathbb C}(\mathcal F)=2^{48}.
\]
The symbolic trace-orthogonality argument in section C can establish this complex basis, if the actual Fock dimension, original CAR and trace identities are formalized. Alternatively use the full **complexified** Clifford algebra. Never turn an exploratory real Clifford homomorphism into a surjective complex matrix-algebra equivalence by dimensional guesswork.

### I.9. Revised order of proposed gates and failure controls

| Order | Bounded feasibility experiment | Accepted outcome vs. rejection |
|---|---|---|
| **0A** | Source Spin(9) natural SO(9) orientation via central Clifford 9-volume **or** direct determinant theorem | Actual source-nine determinant +1, not the existing gamma16 determinant; record any volume sign/convention failure |
| **0B** | Native **nine-dimensional** reflection transport and even-list source Spin words using F10BH and pinned Cartan–Dieudonné | Exact fixed-eight normalized source factorization; fallback to section B PBW closedness if blocked |
| **0C** | Compactness of literal source Spin(9) as image of `(S⁸)^8` in unchanged PBW topology | Verified compact source carrier; do not infer from a surrogate abstract Spin group |
| **1A** | Source Majorana complex monomial generation and induced `α_s` | Actual complex Fock-operator automorphism, adjoint preservation, group law and continuity |
| **1B** | Separate gauge-character elimination using S1G as method reference | `α_s(U_g)=U_g` for every original SU(2) element, without hidden phase |
| **2A** | Full-operator Hilbert-space **left-output** gauge invariants | Exact finite-column Hilbert equivalence, followed by closed form/graph equivalence, not just core equalities |
| **2B** | One genuine source gauge-singlet vector and Spin-average witness | Nonzero gauge/Spin-invariant `T₀`; no unverified projector onto all fermion gauge singlets |
| **3A** | Exterior-equivariant first-Cartan weight bound; dedicated B4→D4 restriction | `M≤12` on actual operator space **and** oscillator exclusion for all of a fixed type |
| **3B** | Original source coercivity using finite `C_M`; reducing sector and weighted closure | Only after all assumptions hold: compact resolvent on infinite-dimensional original-source physical-column sector and nonzero physical-column eigenpair |

**Counterexample and provenance rules:** continue searching for bounded-energy escaping sequences within the *same actual* high-weight physical domain; test the negative-center parity automorphism; reject projected or left-output gauge conventions inconsistent with source `GaugeData`; never claim compact resolvent from abstract trace unitarity alone; keep source/theorem qualifications pinned to exact green runs. Never generalize from the original `(2k,2k,0,0)` polynomial's restriction to the entire isotypic space without a proper branching proof.

**Research decision:** fixed-eight-factor source compactness and full operator-column Hilbert space become the **preferred feasibility path**. PBW ambient-unitary compactness, parity-even SO(9) descent, and literal Spin(48) Fock-vector lift remain explicit alternatives. The direct massless source fermion identity is a separate, small proof opportunity. All are conditional until separately formally accepted.

**Operational boundary:** this addendum changes only the existing memorandum's contents. Do not interpret this documentation commit as a mathematical gate, alter Lean modules/workflows or create upstream PRs without a new owner instruction.
---

## J. Source-exact compactness and gamma-covariance follow-up (2026-11-06)

**Status: read-only research findings promoted to a documentation-only addendum. No new Lean theorem or spectral result is admitted.** This section appends the next hostile review after the I-series and does **not** replace its original findings. All theorem names below identify existing interfaces or *proposed* statements as explicitly marked; inspect exact source and strict gate before relying on them.

### J.1. Source-normalized pair action is the minimum useful C0-A gate

The working research branch already contains:

- [F10BH](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BHUnitVectorPairMembership.lean): `source9UnitVectorPairSpin`, genuinely in the literal `spinGroup source9Quadratic`.
- [F10BR](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BRSourceVectorOrthogonalHom.lean): `source9SpinVectorOrthogonalHom`, the genuine orthogonal **nine-vector** action.
- [F10CU](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers.lean): equality of nine-vector images implies equality of source Spin elements up to the **actual central sign**.
- Pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, [`LinearIsometryEquiv.reflections_generate_dim`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean), a bounded Cartan–Dieudonné decomposition.

**Exact convention audit, not optional:** for a **unit** Clifford vector `u` in a positive-definite 9D Clifford algebra,
\[
\iota(u)\,\iota(z)\,\iota(u)^{-1}
=\iota(2\langle u,z\rangle u-z).
\]
Define the line-preserving involution `L_u(z)=2⟨u,z⟩u-z`. Ordinary hyperplane reflection in `u^\perp` is `H_u(z)=z-2⟨u,z⟩u`, so `L_u=-H_u`. **One Clifford vector acts by the line-preserving map, NOT by the hyperplane reflection.** In 9D, `det(L_u)=(-1)^8=+1`, while `det(H_u)=-1`.

The two signs cancel for a **pair**:
\[
R_9(\iota(u)\iota(v))=L_uL_v=H_uH_v.
\]
This is the intended compactness lemma, with original source conjugation, multiplication order and inverse conventions. Do not silently identify single-vector Clifford conjugation with `H_u`. The F10BH pair is genuinely in Spin9; a **single** vector need not be. The product must be checked against F10BR's exact `mulVec` order.

**Candidate first theorem (not currently qualified):**
\[
\forall u,v,\quad Q_9(u)=Q_9(v)=1\Longrightarrow
R_9(\mathrm{source9UnitVectorPairSpin}(u,v))=H_u\circ H_v.
\]
Keep the quadratic-unit locus `\{u:Q_9(u)=1\}` and the ordinary norm sphere separate until an explicit Euclidean-topology identification is established; `SpaceIndex → ℝ` may have a default function-space norm not definitionally equal to the quadratic Euclidean norm.

**Acceptance:** fresh exact source compilation, a second independent consumer, theorem type and axiom reports, original quadratic form and paired labels unchanged. If orientation or source unit-pair semantics fail, stop C0-A at that precise boundary; do not keep patching by replacing the source carrier.

### J.2. Three candidates for the **nine-vector** determinant +1

**(a) Central 9-volume:** the odd-dimensional Clifford volume `ω=e_1⋯e_9` is central and invertible, and under a genuine orthogonal action top degree transforms by determinant. Thus the equation `gωg⁻¹=ω=(det R_9(g))ω` would establish `det R_9(g)=+1`. New theorem required: the exact *source* transformed-volume/determinant identity in the original PBW order, not multiplication preservation of `equivExterior`.

**(b) Finite generating words:** Mathlib's [`lipschitzGroup` definition](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean) is the `Subgroup.closure` of invertible Clifford vectors. The pinned [`Subgroup.closure_induction''`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Group/Subgroup/Pointwise.lean) supports generators, inverses, identity and product. A normalized-word property may therefore be proved by closure induction. In positive signature, write each nonzero generator as a positive scalar times a `Q_9`-unit vector, absorb its inverse by the unit square relation, and prove
\[
g=c\,\iota(u_1)\cdots\iota(u_\ell),\quad c>0,\quad Q_9(u_j)=1.
\]
For a **source Spin9** element, its actual Clifford-star unitarity and `star(ι(u))=-ι(u)` give `1=c^2(-1)^\ell`, hence `\ell` even and `c=1`. Then `det R_9(g)=1` by the line-preserving unit-vector determinant. This is an **outline**; subgroup generated-word extraction, positive normalization and correct star/conjugation transport remain to be formalized. It is not an accepted finite-word theorem.

**(c) Exterior/coordinate determinant:** reuse the original source nine-dimensional exterior PBW basis [F10Y/F10Z](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10ZSourceNineExteriorPBWOrderedWordProbe.lean) and top-degree determinant transformation. A previously accepted determinant for **gamma16** or **paired48** is not a substitute: [F10Q](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10QSourceSpinOrientationDetOneProbe.lean) concerns those other representations.

**Decision:** investigate (a) and (b) as independently bounded approaches. Keep (c) if the top-degree transport already costs less than generator normalization. Do **not** claim the nine-vector representation is SO(9)-valued until this exact determinant theorem is proved.

### J.3. Fixed eight-factor compactness: the remaining topology check

If `det R_9(g)=1` is proved, the pinned Cartan–Dieudonné theorem gives **at most nine hyperplane reflections**. Their number is even, hence at most **eight**. Group them into pairs and apply J.1's proven source-pair correspondence. F10CU recovers `g` up to central `±1`; negating one factor corrects the sign. Repeated identical unit pairs pad the list to exactly eight Clifford unit vectors:
\[
\forall g\in \operatorname{Spin}(9),\quad
\exists u_1,\ldots,u_8\in\{u:Q_9(u)=1\},\quad
g=\prod_{j=1}^8\iota(u_j).
\]
This is **still conditional**, not a Lean theorem.

The factor domain is the **quadratic unit locus** in the nine-dimensional source real vector space. Prove its compactness from `Q_9(u)=\sum_i u_i^2` and finite-dimensional real topology; only after that may it be identified with the familiar sphere `S^8`. Continuity of the literal source Spin product must use **F10BF/F10BG's existing PBW topology**. Surjectivity of the fixed-eight-factor map, plus compactness of its domain, would prove compactness of the genuine source Spin9 directly, without requiring an SO(9) surjectivity/covering theorem.

**Reject** any proof that silently switches to a replacement abstract Spin group, changes the quadratic form, assumes the hyperplane reflection sign of a single Clifford conjugation, or uses a merely algebraic group homomorphism as a continuous one.

### J.4. Rival C0-B path: identity chart and explicit PBW-word positivity

There is now a particularly concrete **local compactness** library entry point:
[`ChartedSpace.locallyCompactSpace`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Geometry/Manifold/ChartedSpace.lean), applicable to the original source [F10DE charted-space value](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10DETranslatedSourceCharts.lean) into `Fin 36 → ℝ`. The source also has an [F10CW identity chart](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CWOriginalSourceIdentityLocalChart.lean); the entire translated atlas may be avoidable if a compact identity neighborhood suffices to prove **local closedness at the identity**. Mathlib has [`Subgroup.isClosed_of_isLocallyClosedAt`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Algebra/OpenSubgroup.lean). The interface requires `IsLocallyClosedAt` in the **ambient** Clifford group; a locally compact chart **alone does not automatically provide that hypothesis in Lean**. The subgroup embedding/topology and compact-neighborhood-to-local-closedness argument must be spelled out.

The ambient compact group candidate is the **even reversal-unitary** source Clifford locus `K`. F10Y [`source9CliffordPBWBasis`](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10YSourceNineCliffordPBWBasisProbe.lean) was made through a **real linear**, not multiplicative, Clifford-to-exterior equivalence. F10Z proves an *exterior ordered word* identity, **not automatically a Clifford ordered-product identity**. Before
\[
\operatorname{scalar}(\widetilde x x)=\sum_I c_I^2,
\]
prove that the **actual F10Y PBW vectors equal ordered original Clifford coordinate words**, using vanishing cross-coordinate contractions and original `Q_9` normalization. The off-repository `512²` signed-monomial diagnostic checks combinatorics only and does not discharge the F10Y identification or source ring topology.

**Head-to-head test:** C0-A begins with exact unit-pair reflection correspondence; C0-B begins with exact Clifford PBW word correspondence. Run these as separate future strict gates, rather than wrapping both in a large compactness file.

### J.5. An algebraic P1 target independent of either compactness route

[F10BC](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BCSourceSpinGammaSpecialOrthogonalHom.lean) exposes the original source Clifford-to-gamma16 algebra homomorphism, while [F10BO](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BOSourceVectorConjugationDerivative.lean) gives source-exact Clifford conjugation on embedded nine-vectors; F10BP packages the nine-vector representation.

Applying the algebra homomorphism to the source-conjugation identity should give the **global algebraic gamma covariance candidate**
\[
\gamma(g)\,\gamma(v)\,\gamma(g)^{-1}
=\gamma(R_9(g)v).
\]
Prove it at the actual source names and both matrix orientations, with precise meaning of the gamma action. This **does not require** a Fock-vector lift, Haar averaging, compact source Spin9, or an infinitesimal approximation. It is a useful independent gate on the way to original supercharge covariance. The original 48-label and SU(2) color covariance must still be proved separately.

**Rejected shortcut:** source Spin9→SO(16) or Spin9→SO(48) mapping into a compact matrix group does **not** make the source Spin9 compact. [F10X](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10XSourceCliffordGammaKernelCriterionProbe.lean) explicitly leaves even-Clifford gamma injectivity as a hypothesis, not a proof; a faithful closed topological embedding has not been certified from that interface.

### J.6. Frozen decisions and next narrowly scoped gates

1. **C0-A1 first:** native nine-vector Clifford **pair** vs hyperplane-pair action, with the `L_u=-H_u` sign made explicit. Verify on the original source representation, not gamma16/paired48.
2. **C0-A2 independently:** native nine-vector determinant +1 by central 9-volume or normalized-word induction. Do not use F10Q as the determinant proof.
3. **C0-B1 independently:** original F10Y PBW coordinate words vs actual Clifford ordered products; then reversal positivity, local compactness and ambient local-closedness.
4. **P1-gamma microgate independently:** global gamma covariance from F10BC/F10BO/F10BP, exact source group and matrix orientation.
5. If C0-A1 and C0-A2 pass, test Cartan bounded factorization and the **fixed eight** compact image. If they fail, retain their individual mathematics, use C0-B as fallback and record the exact failure.
6. **Separate spectral blockers remain:** full operator-algebra/Fock adjoint action, source gauge character elimination, original closed-Hamiltonian column correspondence, B4→D4 branching/exclusion over **every** vector in the fixed isotypic sector, and source form coercivity. No spectral theorem, physical zero-mode exclusion or global mass gap follows from this memo.

**Operational status:** original strict massless source gate [#42325087575](https://github.com/etblink/math/actions/runs/42325087575) remained the latest verified scientific gate during this read-only session. This section is a *documentation-only* preservation action; source Lean declarations, axiom conditions and workflow results are unchanged.


## K. Post-C0-A1 source audit: odd-dimensional Lipschitz determinant candidate

**Research status:** this addendum preserves a proposed route and a bounded
work-selection decision. It does not establish the nine-vector determinant
or compactness. The independently audited C0-A1 reflection-pair result is
recorded in its [scoped gate](BFSS_SPECTRAL_SOURCE_NINE_REFLECTION_PAIR_GATE_2026_11_07.md);
that acceptance does not qualify the new arguments below.

The source48 S1V37 rank-one determinant proof uses
`Matrix.det_one_add_replicateCol_mul_replicateRow` and `Matrix.det_neg`.
For a normalized polar row ell with ell dot a = 2, the matrix
`-(I - a ell^T)` has determinant `(-1)^n (1-2) = (-1)^(n-1)`.
The source48 theorem's result -1 is tied to n=48. In **nine** dimensions
the candidate value is +1. This matches the accepted single-vector sign:
untwisted positive-Clifford conjugation is line reflection, hence minus
hyperplane reflection, with eight transverse minus signs.

This suggests a third C0-A2 proof architecture: extend literal source9
Clifford conjugation to its actual algebraically generated Lipschitz subgroup,
prove its real-linear representation and exact agreement with F10BP on
Spin9, identify every invertible Clifford-vector generator's actual matrix
with the normalized polar rank-one matrix, and propagate determinant +1
through subgroup closure. In odd dimension this may avoid both top-degree
volume transport and extraction of even normalized words. It is an outline,
not a formal proof; source generator invertibility/Q normalization, matrix
identification, representation laws, inverse cases and the restriction
bridge are separate obligations.

The source48 K1D18F/G/H action/representation modules and K1D18L use of
`Subgroup.closure_induction''` provide inspected proof patterns. Their
48-dimensional conclusions do not prove anything on the nine-vector
carrier. Reuse the method without importing a replacement source action.
Compare this architecture with J.2's volume and normalized-word alternatives
on the first source-exact obligation each can discharge. Keep all failures
and accepted intermediate results; no compactness follows from the outline.

**Bounded next selection:** while C0-A2 remains a feasibility obligation,
execute J.5's independent algebraic gamma-covariance microgate from the
existing F10BC/F10BO/F10BP interfaces. It tests an exact compatibility law
without introducing a full Lipschitz representation or using a derivative
as global evidence. Its [new charter](BFSS_SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_GATE_2026_11_06.md)
keeps Fock implementation, all of P1, determinant, topology and spectral
claims outside acceptance. After that bounded test, return to C0-A2.


## L. Gamma compatibility accepted; C0-A2 action bridge isolated

Green #42341006499 at a57dee28569da0a1db3a947ba63fcee836a1cbee survived
retained-evidence review: 94 cold builds, 124 input pins, eight consumers
and twelve public-root reports, with no compiler warnings. The
[P1-gamma gate](BFSS_SPECTRAL_SOURCE_NINE_GAMMA_COVARIANCE_GATE_2026_11_06.md)
now qualifies global original gamma16 covariance under the literal source
Spin9/nine-vector actions, including multiplication and inverse orientations.
This is an algebraic compatibility result, not a physical Fock action or
a discharge of all P1. No C0-A2 or compactness conclusion follows.

To resume K's determinant route without assuming an extended action, the
next candidate explicitly constructs the original nine-vector action of
`lipschitzGroup source9Quadratic` via the accepted Clifford vector projection
and Mathlib's actual range-preservation theorem. It packages real-linear
equivalences and a determinant-unit character, then proves pointwise and
whole-representation equality with F10BP after the actual Spin-to-units
inclusion. See the [bounded C0-A2 bridge charter](BFSS_SPECTRAL_SOURCE_NINE_LIPSCHITZ_REPRESENTATION_GATE_2026_11_06.md).
This candidate has not yet qualified. A unit-valued determinant character
is not a determinant-one theorem. After its independent strict gate, the
source-normalized generator matrix, odd-nine determinant and closure
propagation remain separate proof obligations; the volume/word alternatives
and all topology/spectral boundaries remain available and explicit.


## M. Exact Lipschitz restriction accepted; orientation remains a candidate

The repaired source-nine Lipschitz gate qualified at ce15a36619804d51aff1c958ff3dd5f398ba416e
in #42344283019 after retained-evidence review: 94 cold builds, twelve
consumers and twenty axiom reports. It constructs the actual real-linear
Lipschitz action and determinant-unit character and identifies its exact
Spin restriction with F10BP. The prior red source and scalar/inverse
elaboration repairs remain in the scoped gate's evidence. A determinant
unit character does not yet establish its value.

The [new C0-A2 candidate](BFSS_SPECTRAL_SOURCE_NINE_ORIENTATION_GATE_2026_11_06.md)
now attempts K's complete odd-dimensional argument: original polarization
and normalized row; actual Clifford generator/rank-one matrix equality;
`(-1)^9(1-2)=+1`; character propagation through algebraic Lipschitz closure;
and restriction to the original F10BP/F10BR action, with algebraic SO(9)
packaging. Clifford-generator invertibility is the actual generator premise;
quadratic invertibility is derived inside the proof. No normalized-word
existence, topological closure, source connectedness or gamma16 determinant
is substituted. Sixteen proposed public roots and sixteen independent
consumers remain pending a dedicated strict gate and evidence review.

If this candidate qualifies, the next question is bounded normalized
Cartan factorization for the literal source action, using the accepted
reflection-pair identity and source two-sign fibers. Source quadratic
unit-locus compactness, padding/sign correction and exact PBW continuity
remain separate; no source compactness or spectral conclusion follows
from an algebraic homomorphism into the compact target SO(9).


## N. C0-A2 qualified; ordered source-unit Cartan list proposed

Green #42347858285 at 3482485c9290ac8e01011d0a76e988a0c7e0ac3f survived
full artifact review: 97 cold builds, sixteen consumers and 42 strict root
reports without compiler warnings. The [orientation gate](BFSS_SPECTRAL_SOURCE_NINE_ORIENTATION_GATE_2026_11_06.md)
now qualifies the original nine-vector determinant +1 and algebraic SO(9)
packaging through the actual untwisted Lipschitz character. This is an
accepted source-exact algebraic result, not source compactness, covering
or a Fock/gauge/physical-domain theorem. The prior strict style red remains
retained; it was repaired with four proof-local keyword changes only.

The [next candidate](BFSS_SPECTRAL_SOURCE_NINE_UNIT_CARTAN_GATE_2026_11_06.md)
transports the same original action to the already qualified same-label
Euclidean space, proves its norm/determinant bridges, and applies native
Cartan--Dieudonne. Zero-normal hyperplane identity factors are deleted;
nonzero normals are normalized without reordering or changing the product.
Unit reflection determinants give even length, and the actual dimension
nine then gives length at most eight. Finally, the normals are pulled
back to original source-Q-unit vectors via the same coordinate map.

Twenty proposed roots and twenty complete-type consumers remain pending
strict compilation and evidence review. Their intended result concerns
the exact original vector action, including a pointwise source consumer.
It is not yet an exact product of embedded Clifford vectors equal to g.
If qualified, the next task is ordered pair lifting, central two-sign
correction and exact eight-factor padding, followed separately by the
source-unit parameter compactness and original-PBW continuous-image proof.


## O. C0-A3 accepted; exact source word is the next research obligation

**Status at 2026-11-07.** The [Cartan strict gate](BFSS_SPECTRAL_SOURCE_NINE_UNIT_CARTAN_GATE_2026_11_06.md)
records scoped acceptance of green [#42352505826](https://github.com/etblink/math/actions/runs/42352505826)
at `b3bb2bd77498251dc6361e143ac7713b05d150a3`. Its preceding red
[#42349933839](https://github.com/etblink/math/actions/runs/42349933839)
at `760e00536e40887254b38f4f01cb021b090f8c1c` failed because the final
determinant transport left coercion of the unit one unequal definitionally
to real one. The tested repair adds `Units.val_one` to that one proof
line and refreshes only its manifest pins. No statement or proof policy changed.

The failed compiler emitted `sorryAx` for the determinant transport and
the two final Cartan existence declarations. These are recovery reports
from the rejected compilation, not accepted assumptions or evidence.
The independent consumer was never compiled on that red. The green job
has 99 compilation entries, all 75 expected strict reports in exact
manifest order with only the permitted foundational axioms, all five
source/consumer markers, and the final gate-pass marker. The twenty
complete-type consumers include the original pointwise action and zero
normal deletion. Complete timestamped job logs and the limits of this
follow-up review are retained in the
[run-pair audit](evidence/spectral-confinement-2026-11-06/source-nine-unit-cartan-run-pair-audit-2026-11-07.json).
The earlier scoped acceptance record contains the retained-archive review;
this follow-up replay checks job logs and repository source, rather than
claiming another independent download of that ZIP.

**Accepted scope.** For every literal source Spin element, its original
nine-vector action has an ordered, even list of at most eight original
Q-unit hyperplane reflections. Equality of vector actions is not equality
of source Spin elements. F10CU explicitly gives two distinct source signs.

**Proposed C0-A4 target, still research:** for every original
`g : spinGroup source9Quadratic`, find `w : Fin 8 → (SpaceIndex → ℝ)`
with `source9Quadratic (w i) = 1` for every i and with the ordered product
of the eight original `CliffordAlgebra.ι source9Quadratic (w i)` equal to
`(g : CliffordAlgebra source9Quadratic)`. The finite order must be explicit
and agree with the accepted pair action. This is a target statement,
not a new Lean declaration or theorem admission.

Use the following bounded proof seams, independently auditable:

1. Induct on consecutive pairs of an even Q-unit list. Construct an
   actual source Spin element h from F10BH's
   `source9UnitVectorPairSpin`. Track both its literal Clifford product
   and its original action on every source vector. Use C0-A1 for the pair
   and F10BP for composition. Do not reverse the ordered list or assert
   Spin membership of an individual positive Clifford vector.
2. Apply this pair lift to the accepted C0-A3 list. Compare the attained
   original matrices through F10BR's action bridge. Invoke exactly
   `source9NaturalMatrix_eq_iff_two_sign_fiber` from F10CU, obtaining
   g = h or g = source9NegativeCentral * h. No injectivity or target
   surjectivity may be substituted.
3. **Pad before sign correction.** Append repeated copies of one original
   Q-unit coordinate axis in pairs until the list has exactly eight
   entries. Each appended pair has Clifford product one because its
   vector squares to Q = 1. This handles the initially empty list
   uniformly and leaves both the word and its action unchanged.
4. In the negative fiber, negate the first of the now eight unit factors.
   Prove preservation of Q, linearity of the original Clifford embedding,
   and equality to multiplication by the actual negative central source
   element. This avoids the undefined operation of negating a factor of
   an empty list. Check both signs when the original action is identity.
5. Convert the exact-length list to the explicitly ordered Fin 8 family.
   Recheck literal source equality after the conversion. A fixed eight-
   input map can then be defined by four actual Spin pairs; no continuous
   selection of a factorization depending on g is required.

The empty-list case, h = 1, g = source9NegativeCentral, repeated-axis
padding, and order-sensitive noncommuting pairs are required consumer
cases. Pair-lift equality, the two-sign recovery, and fixed-length padding
may be separate small gates if combining them obscures causal failures.

**Later gate only:** prove compactness of the original Q-unit locus and
continuity of this fixed word map in the existing F10BF/F10BG PBW topology.
The action map to SO(9) supplies neither source compactness nor a
topological embedding. No replacement group, quadratic form, norm or
topology is authorized by this plan. Fock/gauge action, physical closed
domains, full-sector branching, coercivity and spectral existence remain
separate unresolved obligations.


## P. C0-A4a candidate: actual even-list Spin lift isolated

The [new bounded gate](BFSS_SPECTRAL_SOURCE_NINE_EVEN_LIST_LIFT_GATE_2026_11_07.md)
attempts only O's first proof seam and its Cartan specialization. It tracks
an actual source Spin element h, its literal original Clifford word and
its ordered original nine-vector action, including the empty list and
repeated-pair identity. Four proposed public roots and eight independent
consumers remain pending strict compilation and retained-evidence review.
The separate gate rebuilds the unchanged original closure and all four
accepted spectral source modules; acceptance of C0-A3 is not reused as
proof of this new construction.

Even after this candidate qualifies, equality of actions will not identify
h with g. F10CU two-sign recovery, padding before sign correction, exact
eight-factor equality and original PBW continuity remain the next separate
obligations. This is a candidate-status update, not source compactness or
a spectral theorem.
