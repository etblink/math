# BFSS — Original source Spin(8) covering: forward-research consolidation

**Recorded:** 2026-11-07 (America/Los_Angeles)  
**Repository:** etblink/math  
**Branch:** research/bfss-original-gamma-faithfulness-20261107  
**Read-only research baseline:** 5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0  
**Status:** Research and implementation planning only. No new Lean compilation, theorem qualification, axiom, CI run, or physical spectral theorem is asserted here.

> Seek truth, not green indicators. Preserve rejected methods and exact original source conventions. The next milestone is an *original-source* covering, not an abstract replacement Spin(8).

## 1. Exact accepted foundation and qualification boundaries

| Strict gate | Run | Mathematically tested commit | Qualified scope |
| --- | --- | --- | --- |
| Original nine-gamma faithfulness | [42408460376](https://github.com/etblink/math/actions/runs/42408460376) | 2b2b4b0b3134606b7c54784a147aeae2a5072064 | Original gamma map injectivity, faithful source Spin gamma, and gamma fixed-vector/commutator equivalence |
| Source perpendicular exact-eight words | [42421286452](https://github.com/etblink/math/actions/runs/42421286452) | 7bea5ca3353dd64d8c8b68ec3229aadc9296ec56 | Actual original ninth-axis stabilizer equals source Clifford words of eight perpendicular Q-unit factors |
| Stabilizer path connectedness | [42426258689](https://github.com/etblink/math/actions/runs/42426258689) | 19b007c2d46243a803a958c6595e61911d21e41c | Path-connected original stabilizer in source PBW topology |
| Compact quotient parametrization | [42429216538](https://github.com/etblink/math/actions/runs/42429216538) | 8f22713d9e14a7e851badfb0f680056f1fab1987 | Compactness, closedness, continuous quotient eight-word map into the original stabilizer |
| Restricted original vector SO(9) continuity | [42435908276](https://github.com/etblink/math/actions/runs/42435908276) | 74f8c0624d61527bda7aec3a2b38f8c13475e1d1 | Continuity of the unchanged original SO(9)-valued action on the literal stabilizer; original matrix and joint vector-action companion declarations |

The final gate passed 142 source/consumer cold compilations with 172 pinned inputs and 146 strict declaration/axiom reports; see [scoped acceptance](evidence/source-axis-stabilizer-2026-11-07/acceptance-42435908276.json). Its documentation acceptance commit is this memorandum's research baseline. Successful checks qualify precisely their tested commits, not all adjacent analytical claims.

Not accepted yet: a group homomorphism onto all fixed-axis SO(9) rotations; arbitrary-target source lifting; an explicitly defined coordinate SO(8) target; its kernel/covering theorem; an external Spin(8) group identification; torus period/lattice formalization; Fock operator conjugation; or BFSS spectral assertions.

## 2. Actual source and target; never substitute a surrogate

Let V = SpaceIndex -> Real, SpaceIndex = Fin 9, Q = source9Quadratic, G = spinGroup Q, and a = source9CoordinateVector 8. The original source group action is source9SpinVectorRepresentation and its original matrix-valued homomorphism is source9SpinVectorSpecialOrthogonalHom.

The actual source stabilizer is

    K = {g : G | source9SpinVectorRepresentation g a = a}.

Its accepted topology is the inherited PBW topology. The original *matrix* fixed-axis target should be

    H = {A : Matrix.specialOrthogonalGroup SpaceIndex Real |
          ((A : Matrix SpaceIndex SpaceIndex Real).mulVec a) = a}.

The intended group homomorphism rhoK : K ->* H sends g to the **unchanged original** source9SpinVectorSpecialOrthogonalHom g.val. On the underlying matrices, the equality is witnessed by source9SpinVectorSpecialOrthogonalHom_mulVec, never assumed as an abstract representation identification.

Construct subgroup versions of K and H with exactly these predicates; verify that their carriers bridge to the already accepted literal subtype K without changing its topology. K inherits a topological group from the qualified source9Spin_isTopologicalGroup_pbw and pinned Mathlib Subgroup topological-group instance. The SO(9) target is a genuine matrix group; the complete H is a subgroup of it. Preserve multiplication order and Fin 9 labels.

**Negative guard:** evaluating the vector representation at a is not a group homomorphism to the additive vector space; do not attempt to define K as its kernel. It is a point stabilizer subgroup.

## 3. NEW reduction: surjectivity needs NO perpendicular factorization

This is the strongest new simplification of this session.

For any A in H, it is sufficient to construct a source g in G with original **full nine-vector action** equal to A. Because A fixes a, that very equality implies g fixes a, hence g belongs to K.

An unrestricted Euclidean Cartan–Dieudonne factorization of A is sufficient. Supported reflection normals are not necessary for this *surjectivity* claim. The accepted support-preserving theorem is needed for the exact-word characterization of elements **already in K**, but applying source9Axis8Euclidean_unitCartan to an arbitrary A would be circular: its input is already a source Spin element.

Two noncircular routes are available:

**Route A, preferred for the first gate:** transport an arbitrary target SO(9) matrix A into a genuine same-label Euclidean linear isometry phi_A. Use Mathlib LinearIsometryEquiv.reflections_generate_dim; remove zero normals and normalize with the qualified source9EuclideanUnitNormals. Since det(phi_A)=+1, the qualified source9EuclideanUnitReflectionList_even_of_det_one shows the list has even length. Although the raw bound is at most 9, parity forces at most **8**. Translate the Euclidean unit normals to original Q-unit source vectors via source9ToEuclidean.symm, apply source9EvenUnitList_lift, and prove equality of actions on every original nine-vector. The resulting g then automatically fixes a.

**Route B, optional if matrix transport is already convenient:** use the previously qualified generic reflections_generate_fixing_nine on phi_A with the fixed axis a. Normalize, obtain even length and support in a-perp, then lift. It supplies stronger witnesses, but also incurs axis-support and fixed-axis proof obligations not needed for surjectivity.

**Route C, an alternate staging cut:** first prove surjectivity onto an independently defined determinant-one subgroup of EuclideanSpace Real (Fin 9) linear isometries, where Cartan factorization applies directly, then bridge this target to the original SO(9) matrix H. This avoids early matrix-to-isometry transport at the cost of an extra target-isomorphism gate. Do not replace the original matrix target silently.

Recommended minimal gap to inspect before any implementation: constructing phi_A with exact original matrix action and det(phi_A)=1. The rest of the lift should reuse the accepted Cartan normalization, parity and even-word lift. There is no generic source9SpinVectorSpecialOrthogonalHom surjectivity theorem accepted as of this research pass.

## 4. Explicit algebraic proof checklist for K -> H

1. **Subgroup carriers.** Build K and H from their exact source predicates, with identity/multiplication/inverse proofs. Bridge their subtype membership to the already qualified K type. Do not install global PBW instances.
2. **Same-label matrix-to-Euclidean isometry.** For A : SO(9), apply the pinned Matrix.UnitaryGroup.toLinearEquiv and transport across the accepted source9ToEuclidean. Prove the norm preservation explicitly from orthogonality (with no accidental Pi-norm/L2-norm identification), and prove determinant +1. Alternatively construct the Euclidean isometry directly from the original A.mulVec action.
3. **Any-target Cartan.** Invoke pinned LinearIsometryEquiv.reflections_generate_dim on phi_A. Apply accepted zero-free unit-normal cleanup and determinant parity: even length <=9 implies <=8. Do not reuse a lemma requiring an existing original source Spin input.
4. **Source lift in ORIGINAL Clifford algebra.** Apply source9EvenUnitList_lift to the transported even list. Its conclusion already binds the genuine source word and the SAME ordered original nine-vector action. Use the exact source9ToEuclidean isomorphism and matrix mulVec identity to identify the lift with A.
5. **Restrict into K.** Since A fixes a and rho9(g)=A, g fixes a. Produce the exact target preimage rhoK(<g, hfix>)=A.
6. **Exact fibers and kernel.** For equality rhoK(g)=rhoK(h), reduce to equality of the original full source nine-vector actions and invoke source9Action_eq_iff_two_sign_fiber / source9NaturalMatrix_eq_iff_two_sign_fiber. At identity, the kernel is the **two distinct** elements 1 and the actual source9NegativeCentral. Prove source9NegativeCentral belongs to K and is not 1.

The full-nine-dimensional source lift can prove a stronger global surjectivity theorem if justified by the same construction, but the next strict gate should be accepted or rejected on the **bounded K -> H result**, not enlarge the source closure merely for a generalization.

**Adversarial tests:** identity, the original negative center, a perpendicular e0e1 rotor, a mixed e0e8 rotor (must NOT lie in K), arbitrary A not known to be source-attained, empty/zero-reflection list, determinant-parity and reflection-order tests.

## 5. A separate coordinate-exact H <-> SO(8) equivalence

Let i : Fin 8 -> Fin 9 be the *original ordered inclusion* i(j)=j (Lean Fin.castSucc). For A in H, define

    B_A(p,q) = (A : Matrix (Fin 9) (Fin 9) Real) (i p) (i q).

Because A fixes the last source coordinate, its **last column** is (0,...,0,1). Orthogonality gives the corresponding **last row**. Hence B_A is orthogonal. Det(A)=1 and the fixed last column imply det(B_A)=1.

A precise pinned simplification: Mathlib Matrix.det_succ_column (in LinearAlgebra/Matrix/Determinant/Basic.lean) expands det(A) along **any** column. Apply it at column Fin.last 8, where all contributions except row 8 vanish and the surviving sign is (-1)^(8+8)=+1. The minor is exactly the original top-left Fin 8 submatrix. This avoids an unnecessarily general block determinant theorem. An alternative is Matrix.det_fromBlocks_zero₂₁ after verifying the exact block decomposition.

The inverse maps B in SO(8) to diag(B,1) on the **original Fin 9 coordinates**, not a permuted abstract basis. Show both composites equal the identity entrywise. The restriction is a group homomorphism **only on the fixed-axis subgroup**; Matrix.submatrix on arbitrary 9x9 matrices is not multiplicative. Prove the missing multiplication identity using the vanishing cross-block entries, not an invalid general rewrite.

For continuity, pinned Mathlib Topology/Instances/Matrix.lean has Continuous.matrix_submatrix; the inverse block embedding is continuous by entrywise continuous_matrix and constants. After the algebraic group equivalence, this gives a target **homeomorphism** H ≃ₜ SO(8) respecting the original vector eight-module.

This is a separate gate from source lifting. The coordinate identification is the guard against D4 triality.

## 6. Quotient and two-sheeted covering: concrete Mathlib endpoint

Once rhoK is a continuous surjective monoid homomorphism, qualified CompactSpace K and T2Space H imply rhoK is closed and a quotient map. The original matrix subtype provides a Hausdorff target. The inherited PBW subtype provides a topological group on K (use local source9Spin_isTopologicalGroup_pbw, and Mathlib Subgroup.isTopologicalGroup).

The two-sign kernel is finite. In a Hausdorff space a finite subset is discrete; pinned Mathlib Set.Finite.isDiscrete (Topology/Separation/Basic.lean) supplies the exact statement.

Most importantly, the pinned theorem

    Topology.IsQuotientMap.isQuotientCoveringMap_of_isDiscrete_ker_monoidHom

in Mathlib/Topology/Covering/Quotient.lean applies to a quotient-map monoid homomorphism with discrete kernel and a **topological-group domain**. It does not separately require an IsTopologicalGroup assumption on the target in its displayed signature. Its output .isCoveringMap yields a genuine topological covering.

This avoids constructing local sheets by hand. The verified algebraic kernel has two distinct elements, so every fiber has cardinality two. A covering plus two-sign fibers is a **two-sheeted** covering, not merely a two-to-one set map.

**Do not overclaim:** establishing this covering does not, by itself, create a Lean-checked isomorphism to a separately constructed Clifford Spin(8). The classical uniqueness of the connected double cover of SO(8) requires topology/classification hypotheses, and the comparison must commute with the *actual vector projection*. Keep classification and triality transport as a separate obligation.

A useful algebraic first-isomorphism side-result is K ⧸ rhoK.ker ≃* H using QuotientGroup.quotientKerEquivOfSurjective. It is not a homeomorphism until its continuity/topological inverse is proved.

## 7. NEW center theorem shortcut from accepted connectedness

Let z in K have rhoK(z) central in H. For g in K, define

    c_z(g) = z*g*z^-1*g^-1.

The image under rhoK equals 1; hence c_z maps K into its discrete two-element kernel. As multiplication/inversion are continuous, c_z : K -> rhoK.ker is continuous. The already-qualified K is path-connected; by pinned Mathlib TotallyDisconnectedSpace.eq_of_continuous, every continuous map from a preconnected space into a discrete space is constant. At g=1, c_z(1)=1. Therefore **z is central in K**.

This proves a general conditional lemma:

    rhoK(z) in center(H)  =>  z in center(K)

when K is connected and ker(rhoK) discrete. The reverse implication follows from surjectivity; therefore the centers correspond by inverse image once the hypotheses are qualified.

For the perpendicular source volume word omega=e0*e1*...*e7, ordered native reflection-pair calculus predicts rhoK(omega)=diag(-I8,+1), the nontrivial central element of H under H ≅ SO(8). Then omega is central in K by the connectedness shortcut, avoiding an eight-generator Clifford commutator expansion. Its square omega^2=1 still requires a source proof; it is not a consequence of the two-sign fiber alone (that fiber would only give omega^2 in {±1}).

After separately proving center(SO8)={±I8}, the center of K is exactly {1,-1,omega,-omega}, using the two fibers. Without that standard-target center theorem, do not claim the center exhaustion.

External classical cross-check: Spin(8) has three inequivalent eight-dimensional modules, with kernels generated by distinct nontrivial central elements. See [LMS Bulletin, Codes, vertex operators and topological modular forms, §4.3](https://londmathsoc.onlinelibrary.wiley.com/doi/10.1112/blms.12624). The original source vector kernel is the genuine -1, not an arbitrary triality-swapped center involution.

## 8. Torus, center characters and correct source signs

The source four-plane curves are the genuine existing source9PlaneSpinCurve (2j) (2j+1), j=0..3, and satisfy the **qualified algebraic Clifford value**

    c_j(t) = cos(t/2)*1 + sin(t/2)*e_(2j)e_(2j+1).

The formula is accepted in F10BI; it does **not** alone qualify a four-parameter continuous group homomorphism or its entire lattice.

Mathematically expected exact values, to be formalized: c_j(0)=1, c_j(pi)=e_(2j)e_(2j+1), c_j(2*pi)=-1, c_j(t+2*pi)=-c_j(t). All four disjoint bivector factors commute. The ordered product T(t)=∏_{j=0}^3 c_j(t_j) is expected to satisfy

    ker T = {2*pi*n : n in Z^4, sum_j n_j is even},
    X*(T) = Z^4 union (Z^4 + (1/2,1/2,1/2,1/2)).

Proof concept: the source vector SO(8) image of T(t) is the four independent coordinate rotations. Identity forces each t_j to be 2*pi-integral. The source negative-center sign of each 2*pi turn is -1; the total source sign is (-1)^(sum n_j). The claimed weight lattice is the dual of that period lattice.

The center candidate is omega=∏_j c_j(pi). It is the perpendicular volume element and is predicted to act on the original eight-vector coordinates as -I8 while fixing e8. The prior signed-gamma tensor calculation predicts gamma0*...*gamma7=-gamma8; this is a finite arithmetic research check, **not a Lean-qualified gamma identity**.

Predicted source-specific character consistency table (gamma8 labels are eigenspaces, do not silently rename as abstract positive/negative chirality):

| Source element | Vector 8_v | gamma8=+1 block | gamma8=-1 block |
| --- | --- | --- | --- |
| 1 | +I | +I | +I |
| -1 | +I | -I | -I |
| omega | -I | -I | +I |
| -omega | -I | +I | -I |

The previously corrected source complex-vector weight is **+1** for e_r+i e_s under the chosen action convention, while a +i gamma-bivector eigenspinor has weight +1/2. The coordinate function x+iy may carry the opposite sign; conflating it with a complexified basis vector was a rejected reasoning step. Both B4 and D4 have rank four; no torus direction disappears in restriction. The target must preserve the vector module 8_v, not exchange it with either half-spinor through triality.

The torus lattice, omega sign, source center exhaustion, B4/D4 branching and chiral block actions are candidate analytical checks, **not conclusions of the latest strict gate**.

## 9. Earlier source-Spin48 method: transfer proof strategy, not imports

The repository contains the older original source48 series:

- K1D18V7S: source48-to-sourceSO surjectivity by even Cartan list, paired Spin lift and same-label transport injectivity.
- K1D18V7T: every original sourceSO fiber is exactly two distinct sign-related preimages.
- K1D18V7U: algebraic quotient via pinned QuotientGroup.quotientKerEquivOfSurjective.
- K1D18V7W and V7Z: explicit negative-central quotient and native determinant-one Euclidean target correspondence.
- K1D18V7Y: determinant-one Euclidean isometry subgroup and sourceSO target equivalence.

They establish a useful *proof-engineering pattern*, but their source48 carrier, independent import graph, and historical strict acceptance are **not revalidated by this memo**. Do not import a 48-dimensional chain or infer a nine-dimensional theorem from matching names. The current source9-even-list lift and Cartan factorization already provide a compact native proof route.

## 10. Negative knowledge: precise pitfalls

1. **Circular generation:** source9Axis8Euclidean_unitCartan begins with g in original Spin9. It cannot directly prove existence of g over arbitrary A in H. Instead apply generic Cartan to an independently constructed target isometry.
2. **Unnecessary support:** perpendicular normals are not needed to prove surjectivity K -> H, once full action equality is established. Do not re-prove the earlier difficult support theorem to solve a weaker task.
3. **Naive submatrix hom:** an upper-left matrix block is not multiplicative on all matrices. Restrict to H and prove cross blocks vanish.
4. **Missing inverse block row:** fixed last column plus orthogonality, not fixed-column alone, supplies the vanishing last row. Det block reduction is a separate argument.
5. **Two-to-one is not covering:** prove continuous quotient map, finite discrete kernel, then apply pinned Mathlib covering theorem; retain true source PBW topology.
6. **Classical uniqueness is not a formalized model:** a connected two-cover of SO8 requires explicit vector-preserving identification before transferring B4/D4 branching.
7. **Triality ambiguity:** do not identify vector 8_v with an abstract spinor 8; center-character and original gamma8 block tests detect permutations.
8. **Center overclaim:** connectedness gives centrality of lifts of central images when the kernel is discrete; it does not alone prove omega^2=1, gamma block signs, or exhaust the center.
9. **Old false torus/weight deductions:** preserve the corrected +1 vector weight, four torus coordinates and half-integral lattice; earlier -1 vector weight and rank-3 suggestion are superseded.
10. **Overlarge Lean elaboration:** red run [42432065694](https://github.com/etblink/math/actions/runs/42432065694) timed out at whnf in generic ContDiff->Continuous source composition. Red run [42434082524](https://github.com/etblink/math/actions/runs/42434082524) timed out at whnf in an untyped consumer composition. Typed intermediate PBW operations, original equations and explicit consumers yielded qualified [42435908276](https://github.com/etblink/math/actions/runs/42435908276), with **no heartbeat increase or policy weakening**.
11. **Representation does not imply confinement:** no BFSS mass gap, compact resolvent, physical closed-domain equality, or positive eigenvalue follows from these group-cover statements. Keep oscillator/fermion/physical-form research conditional, with M=12 for the full operator carrier rather than the invalid old M=6 vector-carrier substitution.

## 11. Bounded next-gate decision procedure

**Research-first interface spike (read-only):** identify the shortest accepted Mathlib route from arbitrary Matrix.specialOrthogonalGroup (Fin 9) Real to the original EuclideanSpace Real (Fin 9) linear isometry, and the exact determinant-transport proof. Use the existing source9ToEuclidean, Matrix.UnitaryGroup.toLinearEquiv, LinearIsometryEquiv.reflections_generate_dim and finite-dimensional orthogonality. Inspect pinned interfaces; never assume an unstated isometry constructor.

**Gate A (recommended next strict gate):** original-source algebraic surjectivity rhoK : K ->* H and two-sign fiber/ker, exact matrix and original-vector action. Allow a smaller first subgate for target matrix/isometry transport if that interface is the actual obstruction. Keep the accepted vector-continuity module unchanged.

**Gate B:** quotient-map and two-sheeted covering from compactness, source topological-group structure and discrete kernel. Use the existing Mathlib isQuotientCoveringMap_of_isDiscrete_ker_monoidHom, then a separate consumer for the fiber cardinality. Avoid manual local sheet construction unless the pinned theorem is unusable.

**Gate C:** coordinate-exact homeomorphic group equivalence H to Matrix.specialOrthogonalGroup (Fin 8) Real. Main interface: last row/column, det_succ_column, upper-left submatrix and its inverse diagonal extension.

**Gate D:** source omega and four-plane torus laws, center and gamma eigenspace character tests, vector-labelled Spin8 comparison, classical D4 branching transfer.

A single implementation gate should not combine all four. The first expensive run should target the exact first causal missing interface, freeze inherited input and environment pins, retain source-only and independently authored consumer checks, and publish a complete receipt at the exact tested commit. On red, inspect the first causal error and preserve it before changing anything.

## 12. Primary source and pinned Mathlib locators

All source links below refer to the exact research baseline, not an unspecified default branch.

- [Source orientation and exact SO9 hom](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineOrientation.lean)
- [Original full nine-vector source representation](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BPSourceVectorLinearRepresentation.lean)
- [Unit Cartan, normalization, determinant parity](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineUnitCartan.lean)
- [Even-list source lift and ordered reflection-pair action](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineEvenListLift.lean)
- [Original two-sign full-action fiber theorem](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineSignedWord.lean)
- [Generic fixed-axis Cartan diagnostic already in accepted closure](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/diagnostics/BFSSAxisCartanSupportDiagnostic.lean)
- [Source exact perpendicular word theorem](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerWords.lean)
- [Source connectedness](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerConnectedness.lean)
- [Source compact quotient parametrization](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerQuotient.lean)
- [Qualified original restricted SO9 continuity](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineAxisStabilizerVectorContinuity.lean)
- [Source PBW topological group](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BGPBWSourceSpinTopologicalGroup.lean)
- [Real source rotor and gamma value](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BICoordinatePlaneSourceCurve.lean)
- [Source gamma faithfulness](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaFaithfulness.lean)
- [Original source48 surjectivity analogy](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7SOriginalSourceSpinSOImageSurjectivityProbe.lean)
- [Original source48 algebraic quotient analogy](https://github.com/etblink/math/blob/5f60e05c1ce6c5bdf1e74078e0cdea5f9b9878d0/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPhysicalDomainS1V52K1D18V7UOriginalSourceSpinSOQuotientKernelIsomorphismProbe.lean)
- Pinned Mathlib [Cartan reflections](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean), [matrix determinant expansion](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean), [matrix continuity](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Instances/Matrix.lean), [quotient covering](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Covering/Quotient.lean), [connected to discrete map](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Connected/TotallyDisconnected.lean), and [finite discrete set](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Topology/Separation/Basic.lean).

**Final boundary:** This is a reasoned implementation architecture and archive of negative knowledge, not a new formal result, CI pass, Lie-level differential identification, Fock conjugation action, physical Hamiltonian core transfer, or BFSS spectral conclusion.
