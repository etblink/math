# BFSS — source-exact representation binding feasibility audit

**Finding: feasible in principle; source transfer remains incomplete.** The minimum bridge is source-compatible compact-group/stabilizer branching plus an honest Majorana-induced action on the complete original complex operator algebra. A global Fock-vector lift is unnecessary. A full inverse equivalence with a separately chosen global Spin model is also unnecessary if the required pair/representation facts are transported directly.

**Fixed baseline:** etblink/math at 5fbe86b73784efa429d01c5b338990540896b1de. **Date:** 7 November 2026. **Primary input:** BFSS_Whole_Sector_Oscillator_Exclusion_2026-11-07.md. The accepted C0-A endpoint is a78c80da46bc8167df4753017b37cf1323008ac1, run #42397460623.

This is a read-only source and proof-architecture audit. No repository files or refs, donor sources, PRs or CI were changed; no Lean declaration was created or compiled. Qualification below refers to recorded inherited results, not new acceptance. Donor proof bodies and dependency graphs were inspected; their historical CI certificates were not re-adjudicated.

## 1. Source-to-theorem dependency map

Q = recorded qualified interface; I = source-specific instantiation/composition needed; M = genuine missing source-level lemma or formal representation theorem; D = inspected donor construction, not accepted on this branch.

| Endpoint | Exact source interface | Status and remaining bridge |
| --- | --- | --- |
| Original positive nine-vector geometry | source9Quadratic_eq_dot; source9Quadratic_eq_zero_iff; source9Quadratic_pos_of_ne | Q. These identify the positive form, not the default Pi norm with the Euclidean norm. |
| Euclidean transport | source9ToEuclidean; source9Quadratic_eq_euclidean_norm_sq in SpectralSourceNineReflectionPair | Q in C0-A1. Same labels and quadratic form are retained. |
| Actual nine-vector action | F10BP source9SpinVectorRepresentation; F10BR source9SpinVectorOrthogonalHom_mulVec | Q inherited. This is original Clifford conjugation, not a substituted O(9) action. |
| Source orientation, signs, words, topology | C0-A2–A5c; F10CU source9NaturalMatrix_eq_iff_two_sign_fiber | Q. Determinant +1, two distinct signs, exact even unit words and compactness are available. |
| Original gamma16 group action | F10BC source9SpinGammaSpecialOrthogonalHom_apply | Q inherited: exact restriction of source9GammaCliffordAlgHom. |
| Global gamma/vector agreement | SpectralSourceNineGammaCovariance.source9GammaSpecialOrthogonal_global_covariance | Q by #42341006499. |
| Three actual paired-label copies | V10F gamma16ToOriginalPaired48 and source9SpinOriginalPaired48OrthogonalHom_apply; F10R SO packaging | Q inherited. The literal formula is original-label reindexing of \(I_3\otimes S(g)\). |
| Plane normalization | F10BI source9PlaneSpinCurve_gamma; F10BJ gamma derivative; F10BK plane comparison; F10BS vector-matrix derivative | Q inherited plane interfaces; exact group curve already gives the half factor. |
| Ambient/native differentiability | F10DK source9SpinIdentityGammaDifferential_native_apply; F10DW native differentiability at identity | Recorded inherited interfaces. DK compares the ambient gamma differential with the Lie map; DW alone does not identify the full intrinsic SO(16)-valued differential. Neither is needed for the rotor-based weight argument. |
| Paired-label continuity | F10BE gamma continuity plus V10F finite Kronecker/reindex formula | I. Entrywise composition proves the exact F10R map continuous. Algebraic SO membership alone is insufficient. |
| Actual Spin(8) stabilizer and B4/D4 labels | \(K=\{g:R_9(g)e_8=e_8\}\), using Fin 9 index 8 | M. The inspected sources do not contain its identification with the perpendicular Spin group and compatible root data. |
| Complete complex Fock realization | Donor M2, M3D/H/I | D. Applicable mathematical construction exists; minimal recovery still needs a fresh exact consumer and qualification. |
| Full operator action, adjoint and HS structure | Complex realization + orthogonal Clifford functor + original Hilbert adjoint | I/M. No accepted action on all original complex Fock operators was located. |
| Branching and oscillator theorem in Lean | Analytical whole-sector proof | Mathematical conditional proof supplied; source-compatible representation/branching transfer and Lean formalization remain separate. |

The original StabilizerProfiles.lean concerns **gauge** stabilizers of configurations. It does not supply the spatial Spin(8) stabilizer required here.

## 2. What the stabilizer identification really needs

The positive-form identity and nine-vector action are necessary but not sufficient by themselves. An orthogonal image does not identify a group's stabilizer or its double cover.

Let \(W=\{v:v(8)=0\}\), with \(Q_W=Q_9|_W\). The intended exact statement is that the Clifford inclusion
\[
j:\mathrm{Cl}(W,Q_W)\longrightarrow\mathrm{Cl}(V,Q_9)
\]
restricts to an embedding of the actual perpendicular Spin group whose image is precisely K. Topology must be the finite-dimensional Clifford/subtype topology compatible with the named original PBW topology.

A source-faithful proof route is available:

1. Establish the Clifford inclusion's injectivity and its compatibility with grading, reversal and source Spin membership. An isometry of the whole nine-space transports Clifford algebras by the pinned equivOfIsometry API; an inclusion of an eight-subspace is not itself such an equivalence. The needed embedding/naturality proof cannot be skipped.
2. Unit pairs in W give actual source Spin elements fixing \(e_8\), by the accepted pair action.
3. If g fixes \(e_8\), restrict its original determinant-one vector action to W. Its restriction is in SO(8). Cartan–Dieudonné produces an even list of at most eight perpendicular unit normals.
4. Lift those pairs in the original Clifford algebra. They reproduce g's full vector action. F10CU gives the exact remaining sign; \(-1\) is itself a perpendicular unit-pair word. Pad before absorbing the sign, as in the accepted C0 proof.
5. Thus K is exactly the perpendicular even-unit-word subgroup. Together with the faithful Clifford inclusion this identifies K with Spin(8). Finite-dimensional embedding topology supplies the topological identification.

This is a proof architecture, not a newly qualified source theorem. The pinned Mathlib SpinGroup.lean is algebraic and does not supply a ready-made source stabilizer theorem. In particular, its Lipschitz group is defined by generated units; vector-range preservation is not licensed as a reverse membership criterion.

**Weight conventions must be transported, not renamed.** Use source spatial planes (0,1), (2,3), (4,5), (6,7), fixing axis 8, with generator \(E_{rs}-E_{sr}\). Vector weights are \(\pm\varepsilon_i\). B4 dominance is
\(\lambda_1\ge\lambda_2\ge\lambda_3\ge\lambda_4\ge0\);
D4 is \(\nu_1\ge\nu_2\ge\nu_3\ge|\nu_4|\), on matching integral/half-integral lattices. These are orthogonal coordinates, not fundamental-weight coefficients. D4 triality cannot silently exchange the stabilizer's vector and spinor representations.

A full abstract global equivalence is stronger than the exclusion proof needs. It suffices to transport the compact-group pair and its restricted representations/branching, with these torus labels. Even a surjective comparison homomorphism with the correct stabilizer preimage and label intertwining suffices to pull back source irreducibles; an inverse equivalence need not be constructed as a prerequisite.

## 3. Three-copy spinor normalization: more is already available than F10DW alone

F10BC/F10R alone give algebraic matrices and literal three-copy transport; covariance alone does not fix a generator's scale. However the existing source rotor does:
\[
c_{rs}(t)=\cos(t/2)+\sin(t/2)e_re_s,
\]
as an actual source Spin element, with F10BI's exact image
\[
S(c_{rs}(t))=\cos(t/2)I+\sin(t/2)\gamma_r\gamma_s.
\]
F10BJ differentiates this to \(\gamma_r\gamma_s/2\). F10BS gives the corresponding vector velocity \(E_{rs}-E_{sr}\). F10BK compares the same plane with the accepted Lie homomorphism. F10DK also supplies an ambient differential comparison; there is no need to finish a stronger intrinsic target-manifold comparison for this application.

Consequently the **plane normalization is not a new mathematical gap**. Transporting the formula through the original paired reindexing and proving the associated torus/subgroup laws are source-specific compositions. An exact three-copy plane consumer and continuity statement would suffice for the M=12 calculation.

The remaining assertion that the whole matrix action is the canonical real spinor representation needs source-compatible group/root-data transport, or an equivalent character/module identification. It does not follow from differentiability alone. The full Clifford restriction and rotor formula make this feasible without integrating a newly supplied Lie algebra map.

An exact missing character endpoint can be stated without an abstract replacement representation. Let \(T(t)=\prod_{j=0}^{3}c_{2j,2j+1}(t_j)\), in that order. Prove for the literal paired-label map
\[
\operatorname{Tr}_{48}\rho_{48}(T(t))
=3\prod_{j=0}^{3}\bigl(e^{it_j/2}+e^{-it_j/2}\bigr)
=48\prod_{j=0}^{3}\cos(t_j/2),
\]
together with identification of these source circles as the common maximal torus of the actual B4/D4 pair. Equivalently the sixteen gamma weights are all \((\pm1/2,\pm1/2,\pm1/2,\pm1/2)\), once each, and the paired module repeats them three times. This source character statement plus pair/root binding is the needed canonical-spinor identification; its full theorem type is not supplied by F10DW. For the single-coordinate bound alone, the first-circle formula and multiplicity suffice.

For exclusion, a still weaker endpoint suffices: actual stabilizer branching, together with 24 real label planes of frequency 1/2. One does not need a new global irreducibility theorem for the 16-real action merely to obtain the first-coordinate bound.

## 4. Minimum full-operator action and the actual center

After an exact complex algebra equivalence
\[
\rho:\mathrm{Cl}(Q_{48,\mathbb C})\simeq
 (Fermion\,2\to L[\mathbb C]Fermion\,2)
\]
is qualified with the original generator normalization, complexify the actual source R48 orthogonal isometry and define
\[
\alpha_g=\rho\,\mathrm{Cl}(R_{48}(g)_{\mathbb C})\,\rho^{-1}.
\]
Required checks are isometry/base-change compatibility, functorial group law, the exact original Majorana generator equation, source-PBW continuity, and Hilbert-adjoint preservation. Adjoint preservation follows by uniqueness on self-adjoint real Majoranas generating the complete complex algebra. Trace preservation then gives Hilbert–Schmidt unitarity.

Two Lean conventions require explicit treatment:

- Mathlib Clifford star negates odd generators; Fock Hilbert adjoint fixes the normalized Majoranas. An AlgEquiv is not automatically the required StarAlgEquiv.
- The usual norm on continuous endomorphisms is operator norm. It is not the Hilbert–Schmidt Hilbert norm. Use an explicit HS carrier/transport with equivalent finite-dimensional topology; do not install an incompatible Hilbert instance on the unchanged operator norm.

At the actual source negative center z, F10U gives \(R_{48}(z)=-I\). Therefore \(\alpha_z(\Gamma_p)=-\Gamma_p\). In original ordered mode pairs a parity candidate is
\[
P_\Gamma=\prod_{j=0}^{23}(-i\,\Gamma_{(j,0)}\Gamma_{(j,1)}).
\]
The original creator/annihilator definitions identify each factor with \(1-2N_j\). Hence \(P_\Gamma\) is original Fock parity and anticommutes with every Majorana. Complete generation forces
\[
\alpha_z=\operatorname{Ad}_{P_\Gamma}.
\]
This is the explicit analytical central test. Its original-source parity identification and action equality still need qualified consumers; no global Fock-vector action has been inferred.

No Spin(48) covering, simply-connectedness theorem, global vector implementer or gauge Haar construction is needed for this operator-action step. Gauge compatibility is not a hypothesis of the oscillator-exclusion theorem.

## 5. Donor recovery versus a new CAR generation proof

I recursively read contribution imports at the two fixed snapshots. Counts below include contribution modules only, including roots; they exclude Mathlib, other OAI modules, new source/audit files, and do not predict runtime.

| Route | Measured contribution closure | Interpretation |
| --- | ---: | --- |
| Donor M3I, as written | 131: 109 OperatorDependencies + 22 other contribution modules | Complete existing complex-equivalence construction, with substantial historical ancestry |
| Donor graph after one proposed chronology cut | 48: 31 + 17 | Replace L9E2's import of L9E1 with its actual source-label V5 import, retaining G1A and Mathlib |
| Above, also remove M2's unused M1 import | 47: 30 + 17 | Proposed rebased closure, preserving the mathematical construction |
| Active normalized-CAR / paired-mode inputs | 17 existing modules | No complete generation/equivalence theorem follows from this count |
| Active paired concrete-mode input alone | 12 existing modules | Label/CAR interface only |

The 17 existing common modules in the 47-module plan were byte-for-byte equal between the two snapshots. The two cuts were evaluated **only as import-graph substitutions**. They were not applied to files, compiled, or proved sufficient for all implicit instances.

The key cut is precise: L9E2 defines the normalized original paired Majorana and proves its square. Its body uses the source-label types from V5 and G1A's paired theta CAR, not the historical native sixteen-block gauge theorem L9E1. M2 does not use M1's independent-module intertwiner theorem. The downstream M3D Schur/Jacobson proof and M3H/I dimension/packaging mechanism can therefore be preserved as recovery candidates rather than replaced wholesale.

A native CAR alternative uses ordered Majorana trace orthogonality and \(d^2=2^{48}\) to prove full complex generation. It would require new finite-word sign, trace, dimension, basis and universal-map proofs; 17 existing inputs are not a completed shorter proof.

**Selection for the eventual operator construction:** first test the 47-module rebased donor mechanism with exact provenance and normalization consumers. Retain the monomial route if rebasing, historical qualification or scalar interfaces fail. This avoids both importing 131 modules unnecessarily and rebuilding known Schur/PBW mathematics merely because the CAR argument is shorter on paper.

Namespace compatibility remains explicit: active pairedTheta and donor G1A pairedTheta have different qualified names despite matching formulas. Their equality requires a source crosswalk. The old unspecified thetaLabelEquiv is not the pairedLabelEquiv permutation.

## 6. New analytical deduction: a smaller source binding gate

A useful group-faithfulness theorem follows from already available source facts, without assuming F10X's stronger even-Clifford injectivity premise.

Write \(S=source9SpinGammaSpecialOrthogonalHom\) and
\(\gamma(v)=gammaNineRealLinear(v)\).

First, \(\gamma\) is injective. If \(\gamma(v)=0\), its accepted square law gives \(Q_9(v)I=0\). Evaluating a diagonal entry gives \(Q_9(v)=0\), and source9Quadratic_eq_zero_iff gives v=0. Apply this to differences.

Now suppose \(S(g)=I\). Qualified global covariance implies
\(\gamma(R_9(g)v)=\gamma(v)\) for every original v, hence \(R_9(g)=I\).
F10CU gives \(g=1\) or \(g=z\). But \(S(z)=-I\), directly from the original AlgHom and z's underlying Clifford value \(-1\). Thus \(g=1\), and the group map is injective.

This is a new analytical composition found in this audit, not a new Lean qualification. It neither proves nor assumes injectivity of the entire even Clifford algebra map.

With accepted continuity and compactness, this would give a topological embedding onto the existing original gamma matrix image. Within that image the actual stabilizer has the exact criterion
\[
R_9(g)e_8=e_8
\quad\Longleftrightarrow\quad
S(g)\gamma_8=\gamma_8S(g),
\]
again by covariance and gamma-vector injectivity. This characterizes the actual subgroup in matrices; it does not, by itself, prove that this centralizer inside the image has been identified with Spin(8).

## 7. One recommended independently testable Lean gate

**Single target:** unconditional faithfulness of the actual original gamma16 group homomorphism:
\[
\boxed{\operatorname{Function.Injective}
 \bigl(source9SpinGammaSpecialOrthogonalHom\bigr).}
\]
Equivalently, for all actual source \(g,h:\operatorname{spinGroup}(source9Quadratic)\),
\(S(g)=S(h)\Rightarrow g=h\).

This is a proposed theorem statement, not an implemented declaration.

**Required inputs:** original all-vector gamma square law and positive-definiteness; F10BC evaluation; qualified global gamma covariance; F10BR action/matrix bridge; F10CU two-sign kernel; actual negative-central Clifford value. A recursive import read gives 112 existing contribution modules for the F10CU-plus-global-covariance roots, zero OperatorDependencies. All but the separately qualified global-covariance source are already in the compactness manifest's source closure.

**Permitted assumptions:** no new mathematical hypotheses. Use the fixed source types, gamma matrices, quadratic form and maps. Retain only the established foundational axiom policy (propext, Classical.choice, Quot.sound). Do not assume even-Clifford faithfulness, Spin(8) identification, Fock action, a covering theorem or an independently supplied representation equivalence.

**Independent consumers:**

1. Recover equality of actual g and h from equality of their original coerced gamma matrices, not only subtype equality.
2. Check \(S(z)=-I\ne I\), while \(R_9(z)=I\); the source signs remain distinct.
3. Derive the displayed stabilizer/centralizer criterion in both directions using complete original types.
4. Test the criterion on identity, z, a perpendicular unit pair, and the original mixed pair \(e_0e_8\), whose vector action sends \(e_8\) to \(-e_8\).

The consumers must compile independently with exact type and transitive axiom audits. A private gamma-vector-injectivity helper is acceptable; no guessed private Lean name is needed in the consumer.

**Falsification/hold:** a nontrivial original source gamma kernel element, gamma-vector collision, wrong conjugation/inverse orientation, collapsed negative center, or use of an unproved even-injectivity assumption rejects the claimed theorem. A compiler/type/resource failure blocks qualification but is not automatically a mathematical counterexample. Keep source pinning, strict diagnostics and default fresh-proof budgets; change no accepted statement or representation to obtain a green result.

The gate is smaller than constructing a new eight-dimensional Clifford group or importing the Fock package. It closes the source-action faithfulness endpoint and supports the next stabilizer identification. It does not complete the entire transfer by itself. No gate was launched.

## 8. Circularity and remaining boundary

Do not infer Spin(8) from compactness, a faithful gamma image, or a centralizer label alone. Prove the perpendicular subgroup/root-data identification. Do not infer the full operator algebra from a real Clifford map or a dimension count without a source-faithful map and bijectivity. Do not use a global Fock-vector lift to justify the operator action and then cite the operator action as its construction. Do not use physical compactness or spectral claims to supply a representation premise.

The whole-sector analytical proof transfers once its actual pair/branching and full-fiber action endpoints are discharged. It does not require global vector phases, a Spin(48) lift, or completion of the stronger intrinsic SO(16) differential program.

No physical coercivity, closed-domain correspondence or eigenvalue conclusion is authorized or established here.

## Source locators

All active paths are below lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler at the fixed baseline.

- [Source quadratic form and gamma universal map](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean)
- [F10BC actual gamma group map](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BCSourceSpinGammaSpecialOrthogonalHom.lean)
- [F10BI exact source rotor](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BICoordinatePlaneSourceCurve.lean)
- [V10F exact original paired transport](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean)
- [Qualified global gamma covariance](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean)
- [F10CU exact natural-action fibers](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10CUNaturalActionTwoSignFibers.lean)
- [F10X conditional even-Clifford criterion](https://github.com/etblink/math/blob/5fbe86b73784efa429d01c5b338990540896b1de/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10XSourceCliffordGammaKernelCriterionProbe.lean)
- [Donor M3I](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean)
- [Donor normalization file containing the proposed chronology cut](https://github.com/etblink/math/blob/fa00aa36e770ca516f57b41f5b02229a5033d50f/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52L9E2OriginalFockMajoranaSourceCliffordAxisNormalizationProbe.lean)
- [Pinned Mathlib algebraic Spin group](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean)
