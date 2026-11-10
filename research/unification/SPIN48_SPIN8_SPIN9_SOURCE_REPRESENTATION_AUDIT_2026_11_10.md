# Source-audit memorandum — three 16-Majorana blocks, Spin(48), Spin(8), Spin(9)

**Date:** 2026-11-10. **Status:** exploratory mathematical/source audit, NOT a new Lean theorem, strict qualified gate, FCP canonical result, GUT/ToE derivation or empirical claim.

**Motivating intuition:** The original three copies of 16 real BFSS Majoranas may carry a more natural Spin(48) / Spin(8) / Spin(9) structural story than a proposed Spin(10) unification. Examine that story without presupposing BFSS is physical truth.

## 1. What the source actually constructs

Core: [original BFSS Core.lean](../../lean/OAI/MathematicalPhysics/BFSS/Core.lean) gives 16 real spinor indices and 3 color-adjoint indices for SU(2). Therefore the real Majorana label carrier is the **orthogonal vector space** V48 ≅ R^3_color ⊗ R^16_spin ≅ R^16 ⊕ R^16 ⊕ R^16. Our actual source uses interleaved G1A paired Fock labels, so an exact source equivalence is essential before substituting block-major order.

An orthogonal sum gives a **graded Clifford-algebra factorization** Cl(V48) ≅ Cl(R16) graded_tensor Cl(R16) graded_tensor Cl(R16). On complexification each 16-Majorana block has an irreducible module of dimension 2^8; full original Fock space has dimension 2^24. This is algebraic, not a gauge-invariant factorization into three physical families.

**Spin(48) is not merely three Spin(16) groups.** The full Lie algebra has dimension 48×47/2=1128. Three separate so(16) block algebras account for 3×120=360 generators; the three pairs of cross-block mixing terms account for 3×(16×16)=768 more, 360+768=1128. Clifford factorization is not Spin-group product decomposition.

Exact source files:
- [F10F source original paired SO(48) action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean): original I_color ⊗ rho16(Spin9) through accepted pairedColorSpinEquiv.
- [F10R actual source SO(48) group map](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean): algebraic Spin(9) -> SO(48), NOT a proved Spin(48) source lift.
- [S1V31 actual original source Spin(48) vector action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V31CanonicalAllSpin48RealVectorActionProbe.lean) and [K1D13 representation package](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D13OriginalSpin48LinearRepresentationProbe.lean): source Spin(48) acts on original real 48-space, but their existence does not identify the F10R Spin(9) action with a concrete Spin(48) lift.
- [C48-0](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean) and [C48-0B](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0BOriginalSourceGaugeS1JMatrixIdentity.lean) source-check the commuting true SU(2) adjoint-color action and the preexisting S1J gauge action on original 48 labels. Strict acceptance runs #42779878513 and #42787913738.

## 2. Correct direction: Spin(8) subgroup, Spin(9) extension, 48-space representation

Abstract standard math:
- Spin(8) is a subgroup of Spin(9), not its quotient.
- Spin(9)/Spin(8) ≅ S^8.
- The 16-dimensional **real** Spin(9) spinor restricts to the pair of inequivalent real half-spinors 8s ⊕ 8c of Spin(8).
- The original 48-real-label representation therefore restricts to 3·8s ⊕ 3·8c.
- As Spin(8) modules, spin(9) Lie algebra decomposes as spin(8) ⊕ 8v (36=28+8); the extra eight directions act off-diagonally between 8s and 8c, via Clifford multiplication. This is the precise mathematical sense in which the 8+8 halves can be recombined into a Spin(9) sixteen.

Sources: [Bryant, *Remarks on Spinors in Low Dimension*](https://sites.math.duke.edu/~bryant/Spinors.pdf), §§2–3, explicitly constructing Spin(8) diagonal on O⊕O and Spin(9) off-diagonal eight-dimensional additions; [Stanford/Sage branching rules](https://sporadic.stanford.edu/thematic_tutorials/lie/branching_rules.html).

The *existing* source Spin(9) stabilizer of a chosen ninth spatial axis has a qualified two-sign covering of the actual matrix fixed-axis subgroup, with the target continuously equivalent to SO(8); see runs #42452043377 and #42498367504 and [source axis research memorandum](../../contributions/bfss-kotler/BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md). This does not by itself formally construct an explicit identification of source stabilizer with an independently defined Spin(8).

**New reuse candidate:** [F10L original 8+8 source gamma eigenvalue result](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10LSourceRealEigenvalueEightEachProbe.lean) proves exactly 8 positive and 8 negative real eigenvalues for the original gamma matrix of any nonzero source 9-vector. For a chosen unit ninth axis, its source gamma has eigenspaces ±1, each dimension 8. The previously qualified original [gamma covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean) ensures these eigenspaces are invariant under the actual source stabilizer. **New proof still needed:** show the invariant eight-dimensional modules really identify with the two inequivalent 8s,8c irreps; the eigenvalue count does not alone prove the classification. This is a genuinely useful direct bridge from prior accepted mathematical work.

A **continuous** Spin(9)->SO(48) representation admits a standard topological lift through Spin(48)->SO(48) because Spin(9) is simply connected, but the precise source-exact lift, its central element and physical Fock implementation have not been qualified by the original imported declarations. Do not rebrand the accepted SO(48) hom as the missing Spin(48) lift.

## 3. Triality: a genuine lead plus a strict obstruction

Spin(8) has three inequivalent 8-dimensional irreducible real representations: 8v (vector), 8s and 8c (spinors). Its outer automorphism group S3 permutes them (triality). The color SU(2) adjoint **three** is a different representation; numerical equality with three triality objects is not a correspondence.

A direct representation-multiplicity falsifier:
- Original restricted representation: 3·8s ⊕ 3·8c (no 8v).
- Under an order-three triality twist, the pair of irreducible types moves to another pair, for example 3·8c ⊕ 3·8v.
- The twisted and original Spin(8) representations are not isomorphic (different irreducible multiplicities). Therefore the full order-three triality is **not automatically implemented on the original 48-dimensional source representation**.

This is not a no-go for all dynamical/twisted larger models; it excludes a *naive identification* without additional representations or structure. References: [Spin(8) triality and branching](https://sporadic.stanford.edu/thematic_tutorials/lie/branching_rules.html), [SIGMA paper on Spin(8) outer automorphisms](https://www2.math.ethz.ch/EMIS/journals/SIGMA/2021/079/sigma21-079.pdf). The source real SU(2) color gauge action rotates the three copies continuously; it is not S3 triality.

## 4. Next source-exact and physical gates

1. **S48-E8:** On original real SpinIndex and chosen unit ninth axis, construct ±1 eigenspace submodules, prove 8+8 dimension using F10L and source gamma covariance under the actual stabilizer. Reuse existing source interfaces; do not assume representation classification.
2. **S48-REP:** Identify the two actual stabilizer modules with 8s and 8c and the eight additional Spin(9) mixing generators. Independently verify group actions, global central signs and label ordering. Distinguish source Spin8 identification from matrix SO8 quotient.
3. **S48-T:** Test whether any proposed triality on the original 48 source labels is an honest symmetry of both the source Spin(9) and true SU(2) color-gauge actions. Expect order-three raw triality to fail by representation multiplicity. Preserve the negative theorem if established.
4. **S48-L:** Investigate source-exact Spin(9)->Spin(48) group lift and Fock implementation only after explicit source group/representation compatibility and central-sign tests; do not silently promote a Lie algebra action.
5. **Reality discriminator:** To claim three Standard Model generations, explicitly derive three **gauge-invariant, 3+1-dimensional chiral fermion families**, correct observed gauge quantum numbers and real dynamics, with independent observational tests. The 48 real Majoranas and triality alone do not do so. No gravity, dark matter, GUT or ToE claim follows automatically.

**Statuses:** Source 48 carrier and Spin9/SU2 commuting matrix action = SOURCE_DERIVED at exact accepted gates. Spin8 branching and Clifford factorization = GENERIC_MATHEMATICS. Source eigenspace classification, exact global Spin48 lift and physical emergent family map = OPEN. Raw equation 48=3×16 and triality = NONFORCED as physical generation evidence. **No empirical selection**.

**Isolation:** This memorandum adds no new Lean or CI assertions and does not alter the running C48-1A0 strict gate or FCP canonical history.
