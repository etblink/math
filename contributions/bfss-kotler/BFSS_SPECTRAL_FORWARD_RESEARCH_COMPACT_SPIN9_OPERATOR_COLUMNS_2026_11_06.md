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
