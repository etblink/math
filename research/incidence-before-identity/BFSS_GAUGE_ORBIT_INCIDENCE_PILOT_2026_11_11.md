# Incidence Before Identity — BFSS bosonic gauge-orbit reconstruction pilot

**Date:** 2026-11-11 Pacific.  
**Track:** bounded, candidate-neutral exploratory research.  
**Unified integration parent:** b603f4c1715e15f5f92c69d7fb071992dbaa9f40.  
**Research branch:** research/bfss-incidence-before-identity-20261111.  
**Evidence status:** conventional finite-dimensional proof plus exact integer fixtures; **not** a newly Lean-qualified source theorem, a physical Hilbert-space quotient, an original spectral theorem, a new FCP framework, or a GUT/ToE claim.

## Interpretation and scientific boundary

Use the phrase **incidence before identity** as a methodological instruction:
first identify invariant relations, intersections, relative orientations and gauge arrows; only then assign identities to the objects reconstructed from those relations. This is neither a physical ontology nor a substitute for dynamics. The original SU(2) BFSS theory supplies an excellent falsifiable test case.

The original source has nine spatial directions and three real adjoint color directions. Its G2A bosonGauge operation is the genuine SU(2) gauge conjugation on the source bosonic matrices; G3A adjointColorMatrix proves an orthogonal real 3-by-3 color action. The standard adjoint covering SU(2) -> SO(3) is surjective; **transporting determinant +1 and surjectivity to these exact source definitions remains a separate Lean gate** rather than an asserted accepted theorem.

Primary source files in the frozen integration ancestor:
- lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG2ABosonGaugeProbe.lean
- lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean
- research/unification/CATEGORY_THEORY_GAUGE_DESCENT_HOPF_NO_GO_2026_11_10.md
- research/unification/SPIN9_HOPF_BUNDLE_PHYSICAL_VALLEY_RP8_OBSTRUCTION_2026_11_10.md
- research/unification/BFSS_ORIGINAL_MAJORANA_BILINEARS_RP8_TWISTED_QUADRATIC_BUNDLES_2026_11_10.md
- research/unification/SPIN8_GAUGE_COMMUTANT_TRIALITY_AND_PROJECTOR_TESTS_2026_11_10.md

## IBI-0 — two incidence tensors separate classical color orbits

Write a bosonic configuration as nine real color vectors x_i in R^3. After choosing the original real oriented orthonormal color basis, define

~~~text
G_ij(X) = <x_i,x_j> = sum_A X_i^A X_j^A
D_ijk(X) = det(x_i,x_j,x_k)
         = sum_{A,B,C} epsilon_ABC X_i^A X_j^B X_k^C
~~~

Under the common SO(3) color action, both are invariant. G is a symmetric positive-semidefinite 9-by-9 matrix of rank at most three; D is an alternating 3-form on the nine spatial labels, with 84 unordered triple entries. They are **not** 45+84 independent physical coordinates: they satisfy constraints and are generally highly redundant.

### Proposition (conventional representation geometry, not Lean-qualified)

For X,Y in (R^3)^9, the following are equivalent:

1. G(X)=G(Y) and D(X)=D(Y);
2. there exists a **proper** rotation R in SO(3) such that y_i = R x_i for every i.

**Proof.** The second statement implies the first by preservation of inner products and oriented volumes. Conversely equality of Gram matrices makes the rule x_i -> y_i into a well-defined isometry of the subspaces spanned by the nine color vectors: a linear combination vanishes precisely when its Gram-squared norm vanishes. Extend this isometry to an orthogonal Q in O(3).

If the common span has dimension three, at least one triple determinant is nonzero. Its equality for X,Y gives det(Q)=+1. If the span has dimension at most two, the unused orthogonal complement has positive dimension; adjust the extension by a reflection on that unused complement to make det(Q)=+1 without changing any image of an x_i. In either case R=Q is in SO(3), proving the equivalence. QED.

The same classification applies to the ordinary **bosonic** SU(2)-adjoint orbits under the standard surjective adjoint map, provided the original G2A/G3A actions have been identified with that map. The conventional proof does not itself certify this source crosswalk in Lean.

### Why Gram alone fails at full rank

X = (e_1,e_2,e_3,0,...,0) and Y = (e_1,e_2,-e_3,0,...,0) have identical Gram matrices. But D_123(X)=+1 while D_123(Y)=-1. No SO(3) rotation relates them. At rank one or two, Gram *is* sufficient: the extension on an unused color direction can repair the sign of its determinant. There are two distinct SO(3) orbits with a fixed **rank-three** Gram matrix, related by a color reflection, and one orbit for each attainable rank-at-most-two Gram matrix.

### Cauchy–Binet incidence identity

For any spatial triples I,J (with ordered indices), the identity

~~~text
D_I(X) D_J(X) = det(G(X)_{I,J})
~~~

follows from G=X X^T and multiplicativity of the determinant of the corresponding 3-by-3 submatrices. In particular D_I^2=det(G_{I,I}), and all D_I vanish on rank-at-most-two configurations. These are necessary relations **not** asserted to form a full algebraic presentation of the invariant quotient.

### Rank strata and isotropy

For the **effective bosonic SO(3)** action, the stabilizer of nine color vectors spanning an r-dimensional subspace is the subgroup fixing that span pointwise. The strata are:

| Rank r | SO(3) stabilizer | Orbit dimension | Quotient stratum dimension |
| --- | --- | --- | --- |
| 0 | SO(3) | 0 | 0 |
| 1 | SO(2) | 2 | 9 |
| 2 | trivial | 3 | 17 |
| 3 | trivial | 3 | 24 |

For r>=1, the rank-r matrix manifold has dimension r(9+3-r), and the quotient-stratum dimensions follow by subtracting the corresponding orbit dimensions. The original SU(2) center acts trivially on bosonic adjoint labels, so the **SU(2) stabilizers are preimages** of these SO(3) groups. Whether its action on original Fock vectors has additional central phases must be tested with the genuine source gauge unitary.

## IBI-1 — commuting rank-one valleys recover RP^8, not a preferred axis

For a nonzero rank-one configuration X_i^A=n_i c^A with n in R^9 and c in R^3,

~~~text
G_ij = ||c||^2 n_i n_j,       D_ijk = 0.
~~~

The Gram matrix gives the radius rho=sqrt(tr G)>0 and the one-dimensional **unoriented** spatial eigenspace [n] in RP^8. Thus the coarse quotient of the nonzero rank-one bosonic stratum is homeomorphic to (0,infinity) x RP^8. This is not the whole bosonic quotient, a quantum Hilbert-space identification, or a statement about normalizable eigenfunctions.

Original gamma geometry changes sign under n -> -n. Its separately labelled positive/negative projectors exchange, even though a tautological-line-twisted gamma object may descend. This connects incidence reconstruction directly to the earlier Hopf descent obstruction without promoting an octonionic/Hopf analogy to physical particle generations.

## IBI-2 — incidence reconstruction does not reconstruct quantum physics

The full SU(2) gauge action also transforms the original 2^24-dimensional complex Fock fiber. The physical Hilbert space is a gauge-fixed subspace of vector-valued L2 functions with a closed differential supercharge column; it is **not** merely a scalar L2 space on the coarse invariant quotient.

G and D do not encode the full action groupoid, isotropy representations, center and Fock phase, quotient measure, singular Jacobians, source charge domains, or a physical Hamiltonian. Any physical quotient formalism must explicitly construct the Fock-equivariant section space and check the original Gauss and sixteen-charge operators. Do not infer these from the orbit-separation proposition.

The original real Majorana label module C3_color tensor S16_spin has no SU(2)-invariant vectors, but its invariant skew quadratic **coefficient** space is isomorphic to Lambda^2 S16 (dimension 120). This is a possible second incidence layer. It does not imply 120 conserved physical observables, 3 particle families or a source Spin9 Fock-vector lift. The next physical experiment would construct particular source CAR bilinears and test their exact original Gauss transformation and charge/domain relations.

## Exact-integer finite diagnostics (separate from proof)

The accompanying stdlib Python fixture tools/bfss_incidence_exact_checks.py was executed locally without floating-point arithmetic. It passed:
- SO(3) proper rotation preserves Gram and D;
- a rank-three improper reflection changes D but preserves Gram;
- a rank-two improper image is also reached by a proper rotation on an unused complement;
- rank-one sign reversal is a proper color rotation;
- the mixed-minor identity holds for all 84 x 84 pairs of spatial triples of an integer 9-by-3 configuration.

These are deliberately small falsification fixtures. They cannot certify the general proof, identify an original Lean source normalization, or establish physical operator invariance.

## Proof-DAG-first next gates

**IBI-G0 — exact source orientation.** Prove determinant-one and source G3A image surjectivity, with the precise original Pauli/color orientation and a nontrivial color sign-flip witness. No replacement by an unlinked textbook representation.

**IBI-G1 — finite source invariants.** Define finite G_ij, D_ijk on the literal original boson carrier. Prove invariance under G2A and the signed 3-by-3 determinant identities with independent consumers.

**IBI-G2 — orbit classification.** Formalize the rank-split Gram/triple classification, preserving the difference between orbit separation, a presentation of the polynomial invariant ring, and groupoid equivalence.

**IBI-G3 — isotropy and Fock.** Determine the exact original source stabilizer action and compatible Fock-equivariant section objects; separately verify scalar/groupoid descent versus individually labelled gamma-projector failure.

**IBI-G4 — physics stop gate.** Only if G3 succeeds, check the source physical Gauss kernel, sixteen-charge form domain, Jacobian and kinetic terms. Stop if the proposed coordinates do not simplify a concrete proof obligation.

The primary spectral research remains the original source-signed fermionic field bound, a nonempty physical reducing sector (or a separately audited 84-sector route), and the original closed-form-to-weighted-closure map J. **Incidence Before Identity must earn usefulness by simplifying one of these tasks; it is not a substitute for them.**

**Repository governance:** This pilot adds only new research notes and a diagnostic script to its isolated branch. It changes no Lean module, historical FCP record, strict-gate workflow, existing unified integration ref or main.
