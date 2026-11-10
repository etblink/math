# Spin(8) triality versus original gauge SU(2): exact commutant, center and source projector tests

**Date:** 2026-11-10 (America/Los_Angeles)  
**Scientific purpose:** investigate reality, using BFSS as one testbed, not assume it is nature's final theory.  
**Disposition:** **EXPLORATORY** source inspection, abstract representation theory and exact finite arithmetic; no new accepted Lean theorem, physical selection, FCP canonical admission, empirical prediction or modification of any strict gate.

**Current operational separation:** Original C48-1A0 gate [#42798054277](https://github.com/etblink/math/actions/runs/42798054277) was still in progress when the user requested this parallel investigation. This work **does not poll, repair, launch or change** that run. Retain the accepted C48-0 [#42779878513](https://github.com/etblink/math/actions/runs/42779878513) and C48-0B [#42787913738](https://github.com/etblink/math/actions/runs/42787913738) as exact source-level ancestry only.

## 1. Stronger no-go: all gauge-equivariant projectors on the original 48 source labels have rank divisible by three

The literal original Majorana real generator module is

    V48 = R3_color ⊗ R16_spin

with SU(2) acting via its 3-dimensional **real adjoint** representation on color and trivially on the multiplicity/spinor factor. In the **standard** SU(2) adjoint representation, this real three-dimensional module is irreducible of real type, and its commutant is only the scalar identity. Therefore, on the original (abstractly identified) source carrier,

    End_SU2(V48) = I3 ⊗ End_R(R16).

For any SU(2)-equivariant idempotent P = I3 ⊗ A, A²=A, so

    rank_R(P) = 3 · rank_R(A).

**All SU(2)-invariant real subspaces of V48 have dimension divisible by 3.** In particular, there is NO nonzero gauge-invariant rank-16 projector acting on the literal 48-real-generator space, let alone three independent such projectors. However rank-24 is allowed: P=I3⊗P8 when P8 has rank 8. The set of allowable ranks is exactly {0,3,6,...,48} as an **abstract adjoint-source module**.

This is stronger than the prior “no three color rank-one projectors” observation. It is a finite-dimensional representation-theoretic obstruction, not a no-go theorem for three *emergent four-dimensional physical fermion generations* built from nonlinear gauge singlets, composite Fock states, additional degrees of freedom, or modified dynamics.

**Exact symbolic check:** For the standard real so(3) generators Jx,Jy,Jz, solve [Ji,M]=0 for nine arbitrary real matrix entries of M. All 27 linear equations have rational coefficient rank **8**, nullity **1**; the kernel is span{I3}. In addition, just two finite real **90-degree** rotations Rx(π/2), Ry(π/2) already give 18 equations of rank **8** and kernel span{I3}. A simple finite-witness proof therefore may avoid differentiating a Lie group action.

The actual original G3A `adjointColorMatrix q B A` is source-bound and oriented **rows = output, columns = input**, and the C48 source exactly reindexes `R3 ⊗ R16` using the true G1A map. For a **source-specific Lean theorem**, the two proposed group witnesses must first be matched to concrete original SU(2) gauge elements and their exact G3A coefficient matrices; do not assume equality to textbook Rx/Ry matrices definitionally, nor introduce a substitute gauge action. The existing S1G original Pauli/source curve witnesses may enable this at half of its previous quarter-turn parameter, **but** signs and normalization require source verification.

Source: [G3A original color adjoint](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean); [C48-0 source gauge and Spin9](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean); [S1G literal SU2 Pauli curves](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1GExactSourceRelativeCharacterTrivialityProbe.lean).

## 2. Triality twisting: a non-obvious mathematical construction that fails the unchanged gauge-commutation test

Spin(8) has three inequivalent real irreducible eight-dimensional representations 8v, 8s, 8c, permuted by the S3 outer automorphism group (triality). In the actual Spin(9) real 16 spinor restricted to Spin(8), the standard branching is 16→8s⊕8c, so on the original three-color module the **unmodified** content is

    V48|Spin8 = 3·8s ⊕ 3·8c.

**Mathematically possible alternate abstract representation:** choose a different triality twist on each of the three nominal 16-dimensional blocks,

    (8s⊕8c) ⊕ (8c⊕8v) ⊕ (8v⊕8s)
      = 2·8v ⊕ 2·8s ⊕ 2·8c.

The second representation has triality-symmetric multiplicities! This is not nonsense as an *abstract Spin(8) representation*. **But it is not the original source BFSS Spin(8) restriction**, and the three blocks then have inequivalent Spin(8) actions. Exact unbroken SU(2) adjoint color rotations cannot mix these three inequivalent representation blocks while commuting with Spin(8).

Reason: any source-compatible Spin(8) action that commutes with the full unchanged original color SU(2) must lie in the color commutant I3⊗End(R16). It must act **identically on all three color copies**, excluding a different triality twist in each block. Equivalently, the three triality-twisted 16-representations have different central characters, so no invertible intertwiner exists between them as modules of a *fixed Spin(8)*.

This does **not** exclude an altered theory with additional fields, broken or coupled gauge symmetry, or an independently justified extension; it excludes silently importing the alternative triality-twisted representation as the *same original SU(2) BFSS source*.

**Second abstract obstruction:** SU(2) is connected, while the discrete outer-automorphism group S3 has the discrete topology; any **continuous** homomorphism SU(2)→S3 is trivial. Therefore the original continuous SU(2) gauge symmetry cannot literally act by nontrivial discrete permutations of the three triality types. This does not exclude a separate discrete flavor symmetry.

## 3. New cheap certificate: central-character traces reveal whether triality is truly present

Let the center of Spin(8) be Z2×Z2 with three nontrivial central elements `zv,zs,zc` distinguished by their kernels on 8v,8s,8c. The central signs on each real eight-dimensional irrep are:

| Representation | zv | zs | zc |
| --- | ---: | ---: | ---: |
| 8v | +1 | −1 | −1 |
| 8s | −1 | +1 | −1 |
| 8c | −1 | −1 | +1 |

Consequently, the trace triple `(Tr ρ(zv), Tr ρ(zs), Tr ρ(zc))` is:

- **Original three copies of (8s⊕8c):** `(-48, 0, 0)`.
- **Artificially triality-balanced 2·(8v⊕8s⊕8c):** `(-16,-16,-16)`.
- **Three individually twisted 16 blocks:** `(-16,0,0)`, `(0,-16,0)`, `(0,0,-16)`.

A **necessary** condition for an order-three triality automorphism to be implemented on a fixed representation is that the representation's trace be invariant under cyclic permutation of the three nontrivial central elements. The original `(-48,0,0)` trace triple fails that check. Hence no invertible linear implementation of the *full order-three triality* can act on the unmodified 48-dimensional Spin(8) representation in the straightforward intertwining sense. By contrast, a Z2 exchange of 8s and 8c preserves the source representation *type* and remains possible.

This is a **candidate-neutral diagnostic** for other proposed triality-based family models. It uses finite traces rather than an elaborate decomposition algorithm.

Public mathematical context: [Spin(8) triality and outer automorphism group (SIGMA)](https://www2.math.ethz.ch/EMIS/journals/SIGMA/2021/079/sigma21-079.pdf) and [Spin(8) triality representations](https://www.mdpi.com/2073-8994/17/9/1414).

## 4. The positive alternative: original gamma ± projectors, Spin(9) mixing and an actual 24+24 splitting

Use **the original source real gamma**, not an alternative matrix model. Pick the original unit ninth direction `e9 := source9CoordinateVector (8 : SpaceIndex)`, define `G9 := gammaNineRealLinear e9 : GammaMatrix`. The accepted source all-vector Clifford square identity yields

    G9² = I16.

Define source matrix projectors, as *proposals awaiting Lean acceptance*:

    Pplus  = (I16+G9)/2
    Pminus = (I16-G9)/2.

Direct algebra: `P±²=P±`, `PplusPminus=0`, `Pplus+Pminus=I`. F10L's **accepted original** eight positive and eight negative real gamma eigenvalues suggest each `P±` has rank 8; the actual rank/eigenbasis bridge is still a new proof obligation.

For the original source ninth-axis stabilizer `K = {g∈Spin9 : R9(g)e9=e9}`, the existing **exact global original gamma covariance** implies the original 16-real gamma image `G(g)` commutes with `G9`, hence with `P±`, so the eigenspaces are K-invariant. The existing source axis-stabilizer two-sign results do not automatically identify K with a separately formalized abstract Spin(8); that remains an open interface.

For any original source vector `u ⟂ e9`, polarizing the source Clifford square identity yields `gamma(u) G9 = -G9 gamma(u)`. Thus

    gamma(u) Pplus = Pminus gamma(u),
    gamma(u) Pminus = Pplus gamma(u).

The Spin(9) **bivector** generator `X_u = gamma(u) G9` has the same off-diagonal property and is in the extra eight-dimensional complement of spin(8) in spin(9). This is the source-algebra explanation of the 8+8 halves recombining to 16 under the larger group. Distinguish these *infinitesimal* bivectors from claiming gamma(u) itself is a Spin(9) group element (the latter is an odd Clifford generator).

A concrete **group-level exchange candidate** is the accepted original Spin(9) even unit-pair element from perpendicular coordinate axes `e1,e9`. It maps the ninth axis to **minus** itself by a π-rotation in their plane; original gamma covariance then conjugates `Pplus` to `Pminus`. This Spin(9) element would exchange the two rank-8 eigenspaces, and its source `I_color⊗G(g)` action commutes with the original SU(2) gauge action. **A new exact-source Lean theorem and independent consumer are still needed** for the stated axes/group element and signs.

Lift to actual 48 labels with the **accepted G1A source crosswalk**, not an arbitrary color-major copy:

    Π± = reindexRingEquiv_G1A (I_color3 ⊗ P±).

Then source-exact `Π± C_q = C_q Π±` follows via the same Kronecker multiplication technique used at accepted C48-0, and rank `Π±=3×8=24`. Stabilizer invariance, complementary 24+24 splitting and a potential Spin(9) interchange are mathematically coherent. None shows physical four-dimensional chirality, family multiplicity or any BFSS Hamiltonian spectral statement.

Existing accepted source:
- [Original gamma algebra and quadratic square](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceCliffordGammaLiftProbe.lean).
- [F10L exact positive/negative eigenvalue counts](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10LSourceRealEigenvalueEightEachProbe.lean).
- [Original gamma covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean), [source stabilizer/commutation iff](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaFaithfulness.lean).
- [Source ninth-axis stabilizer](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisProjection.lean).
- [Source Spin9 original 48 Kronecker action](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean).

## 5. Smallest independent formalization/falsification gates

1. **S48-COM0 — real 3-color commutant:** identify two explicit original SU2 gauge witnesses whose **actual source G3A adjointColorMatrix** values are perpendicular SO3 90° rotations up to proven source basis conventions; then prove any real 3×3 matrix commuting with those two is scalar. Use exact finite witnesses, not an assumed derivative map. Negative control: a non-scalar diagonal matrix must fail at least one commutation equation.
2. **S48-COM1 — 48-source gauge-equivariant rank:** transport COM0 through exact G1A original paired matrix isomorphism and prove any source SU2-commuting idempotent is I3⊗A and has rank divisible by 3. Consume independently at ranks 16 (impossible) and 24 (permitted). This is a theorem about real **generator labels** only.
3. **S48-P0 — source gamma projectors:** define `P±` on original SpinIndex and prove complementary idempotence and commutation with **actual source** ninth-axis stabilizer, using only accepted Clifford square/gamma covariance.
4. **S48-P1 — rank and 48 lift:** connect actual F10L eight/eight spectral counts to rank(P±)=8, construct exact original 48-label `Π±`, prove gauge invariance/rank 24 with independent consumer.
5. **S48-X — source group exchange:** construct a specific original Spin(9) unit-pair element sending e9 to -e9 and rigorously prove conjugation exchanges `P±` and `Π±`; do not infer a full Spin8 triality action.
6. **S48-T — triality center test:** only after a separately qualified exact source stabilizer↔Spin8 identification, check the three distinct Spin8 center characters and formally rule out order-three triality on the original 48 module. Without the source identification, keep this as generic abstract representation theory.

**Stop line:** The strongest mathematically accepted future result would concern an invariant **24+24 source-generator split**, a potential exchange by Spin(9), and a gauge-rank/center-character obstruction to naive threefold identifications. Even if all these gates succeed, they would **not** derive a chiral Standard Model, three gauge-invariant generations, quantum gravity, dark matter, GUT or Theory of Everything without independently derived low-energy dynamics and empirical comparison.

## 6. Reproducibility

[Exact finite rational checker](tools/spin8_triality_su2_commutant_exact.py) verifies: 27×9 Lie commutant coefficient rank 8, 18×9 finite-witness rank 8, scalar identity kernel, allowed ranks 3k, center-character signatures, and mutually inequivalent triality-twisted 16 blocks. Python 3 standard library only, with no approximate eigenvalue or threshold comparisons. This is a **model-level exact arithmetic test**, not a Lean/source-gate acceptance or empirical validation.

The checker and this memo are added only to exploratory `research/unification/`; FCP canonical claims and all BFSS strict workflow/manifests remain unmodified. Preserve the prior [Spin48/Spin8/Spin9 original audit](SPIN48_SPIN8_SPIN9_SOURCE_REPRESENTATION_AUDIT_2026_11_10.md) as historical context.
