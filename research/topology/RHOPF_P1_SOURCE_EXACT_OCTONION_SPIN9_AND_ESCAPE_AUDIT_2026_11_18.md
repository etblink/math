# RHOPF-P1 — Source-exact octonion identification, quaternionic restrictions, and escape obstruction

**November 18, 2026 — Project Lead bounded research checkpoint.**

**Parent:** RHOPF-P0 at 6840ec57077b6f68bf646fd00c4435f92fe9115f on integration/bfss-unified-research-20261108. Original BFSS gamma source remains unmodified. FCP main, frozen NFC canon, BFSS 27 accepted anchors and prospective physical SM-D1 remain unchanged.

**Scientific mandate:** Seek truth; preserve useful mathematics from any theory without defending the theory. A striking isomorphism is mathematical evidence, not yet evidence that nature realizes a fundamental particle.

## Outcome

**Source-specific mathematical result:** The original nine Euclidean real symmetric BFSS gamma matrices of shape 16×16 give an explicit eight-dimensional unital norm-composition product with a Fano-plane table and nonzero associator. It is the octonion algebra up to displayed signed-orthogonal coordinate maps. The associated BFSS quadratic spinor map is an isometric-coordinate presentation of the octonionic Hopf fibration S15→S8. Its fibers are S7. Exact original-source Clifford commutators establish infinitesimal Spin(9) covariance.

**Source-specific negative result:** Restricting the exact same matrices to selected four or eight real spinor coordinate subspaces reproduces complex S3→S2 and quaternionic S7→S4 Hopf forms, respectively, BUT the source does not force these subspaces dynamically. For compactified three-dimensional physical space, allowing one extra target coordinate produces an explicit boundary-fixed nullhomotopy of an otherwise nontrivial quaternionic S3 spinor texture. The target-space topology alone **does not protect a physical particle** in unrestricted S15.

## 1. Immutable source, exact basis changes and unital product

Original file: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean, Git blob b9b8192055c70f0d001d7982669b9823c55562ed. Source gamma labels k=0,...,8, spinor labels 0,...,15. Their existing signed-permutation and Clifford identities are used *without modification*.

Split a real spinor ψ=(u,v) into u,v∈R8. The original matrices with k<8 exchange the two halves; gamma_8=diag(+I8,−I8). Define the bilinear multiplication from the source sign/permutation arrays:

B_k(u,v) = ∑_{i=0}^7 sign[k][i] u_i v_{perm[k][i]−8},  k=0,...,7.

Then Q(ψ)=(2B(u,v), ||u||²−||v||²), and the previously exact-certified eight-squares identity is ||B(u,v)||²=||u||²||v||².

Let e0 denote the first source basis vector in either input R8 and E0,...,E7 the basis in output R8. Define two source-induced orthogonal signed-permutation matrices:

α(u)=B(u,e0), β(v)=B(e0,v).

The **literal basis images**, indexed by input 0,...,7, are:

| input | α basis image | β basis image |
|---|---|---|
| 0 | +E7 | +E7 |
| 1 | −E0 | +E0 |
| 2 | −E3 | +E3 |
| 3 | −E1 | +E1 |
| 4 | −E4 | +E4 |
| 5 | −E6 | +E6 |
| 6 | −E2 | +E2 |
| 7 | −E5 | +E5 |

Define a **single-output-space product** x⋆y=B(α⁻¹x,β⁻¹y). By construction E7 is a two-sided unit, and the source's eight-squares identity becomes ||x⋆y||=||x||||y||. This is a real eight-dimensional unital positive-definite normed division algebra. The Hurwitz theorem therefore identifies it with the octonions; the signed-permutation construction gives a reproducible identification rather than dimensional guesswork.

The independent consumer explicitly checks all 64 basis products, seven imaginary basis units with e_i²=−E7, imaginary anticommutation and alternative associator identities. It derives seven Fano lines (unoriented triples):

(0,1,3), (0,2,5), (0,4,6), (1,2,6), (1,4,5), (2,3,4), (3,5,6).

There is an explicit nonassociative witness:

(e0⋆e1)⋆e2 − e0⋆(e1⋆e2) = −2 E4.

With x=α(u), y=β(v), the source map reads Q=(2 x⋆y, ||x||²−||y||²); conjugate/reorient x to match a conventional expression (2 \bar X Y, ||X||²−||Y||²). Thus it is the standard octonionic Hopf construction up to explicit orthogonal coordinate choices, not a claim that the quantum BFSS fermionic Fock operator has become a classical physical octonion field.

## 2. Exact Lie-level covariance and the full S7 fiber, not merely the dimensions

The original symmetric Clifford gamma matrices obey Γ_aΓ_b+Γ_bΓ_a=2δ_ab I. For each a<b, the bivector Γ_aΓ_b is real skew-symmetric. Exact matrix arithmetic checks, for every a<b and every k,

[Γ_k,Γ_aΓ_b]=2(δ_ka Γ_b−δ_kb Γ_a).

There are 36 bivectors, 324 generator-output-component brackets, and 82,944 source matrix-entry equalities; every check passed. Exponentiating half these bivectors induces the standard so(9) vector rotations on Q, by differentiating the quadratic map. This is a source-specific infinitesimal Spin(9) intertwiner with standard finite-dimensional integration, **not yet a new native Lean group-level theorem**.

For **every unit y∈S8**, Γ(y)=∑ y_k Γ_k is a real symmetric involution Γ(y)²=I with trace zero. Its +1 eigenspace therefore has real dimension 8. The exact original map satisfies ||Q(ψ)||=||ψ||², and for ||ψ||=1,

Q(ψ)=y  iff  Γ(y)ψ=ψ.

Proof sketch: If Γ(y)ψ=ψ, the scalar y·Q(ψ)=1 forces Q=y between unit vectors. Conversely, Q=y implies ψᵀΓ(y)ψ=1; the symmetric involution has spectral radius 1, so equality forces the +1 eigenspace. Thus **Q⁻¹(y) is the unit sphere in an eight-dimensional real eigenspace: S7**. The eigenspaces exist for every y; this is a complete fiber characterization, not just one north-pole numerical test.

This agrees with the established Spin(9) geometry of the octonionic Hopf fibration (Ornea, Parton, Piccinni and Vuletescu, https://doi.org/10.1007/s00031-013-9233-x ).

## 3. Exact chosen quaternionic and complex restrictions

The octonion basis {E7,E0,E1,E3} closes into a quaternion subalgebra with identity E7 and imaginary relations E0⋆E1=E3, E1⋆E3=E0, E3⋆E0=E1.

When the **original source 16 spinor coordinates** are restricted to these explicit subsets, the original Q is supported on exactly the corresponding target coordinates:

| Chosen original spinor coordinate support | Output Q coordinate support | Sphere map |
|---|---|---|
| {0,1,8,9} | {0,7,8} | S3→S2, complex Hopf |
| {0,1,2,3,8,9,10,11} | {0,1,3,7,8} | S7→S4, quaternionic Hopf |
| all 16 | all 9 | S15→S8, octonionic Hopf |

This is a **reproducible source-exact coordinate restriction**, not a canonical Spin(9)-equivariant subfibration, a source-forced hierarchy, or a dynamical selection principle. The 2018 mathematical literature explicitly warns that the complex and quaternionic Hopf bundles are not automatically subfibrations of the full octonionic Hopf bundle (https://www.mdpi.com/2075-1680/7/4/72).

The frozen NFC speculative-holding ledger also explicitly **retired** its once-proposed source-forced recursive Hopf tower (D-03). This new independently source-derived BFSS algebra **does not reinstate** that rejected NFC theorem. Its topological sector selection remains a new open hypothesis.

## 4. Physical obstruction: an explicit based nullhomotopy

A localized field in three-dimensional physical space with a fixed vacuum boundary is a based map from S3_space. Its ordinary Hopf projection into S2 can have integer Hopf charge. But π3(S4)=π3(S8)=π3(S15)=0: the same integer does not protect a general field whose allowed internal target is S15 or its octonionic base S8.

**Stronger constructive counterexample:** For any unit quaternionic spinor q∈S3 embedded in S15, choose its fixed boundary vacuum q0∈S3 and one unit vector e orthogonal to that chosen four-real-dimensional subspace. Write a=q·q0 and v=q−a q0, c=cos t, s=sin t. Define

H_t(q)=(c²a+s²)q0+c v+s c(1−a)e,   0≤t≤π/2.

Direct algebra verifies ||H_t(q)||=1 for all q,t; H_0(q)=q; H_{π/2}(q)=q0; and H_t(q0)=q0. This contracts the **entire quaternionic spinor texture in the full S15 while holding its spatial boundary fixed**. A local consumer verified the identity on representative states and intermediate parameters.

For a smooth spatial configuration constant outside a bounded region, this homotopy remains constant outside the region. Any smooth finite-coefficient local gradient and polynomial potential energy on the full target has a **finite-energy path** along it. A finite anisotropy penalty for the extra target coordinate might create a metastable energy barrier, but by itself does **not** restore an exact topological prohibition. Only an actually enforced target constraint, a nontrivial gauge/quotient structure, a singularly costly direction, or another independently specified conserved obstruction could change the conclusion. Such constraints have NOT yet been demonstrated from BFSS, NFC or an original new Lagrangian.

This distinguishes genuine strong topological protection from visual knotting and metastability. Modern Faddeev–Skyrme minimization theorems concern **models with an S2 target and specified energy**, not automatically an unrestricted S8 target (https://doi.org/10.1007/s00220-026-05702-5). Dennis's optical measurements show how a fully reconstructed field can support topological metrology; they do not supply the energy or particle spectrum for a new octonionic field (https://doi.org/10.1038/s41467-021-26171-5).

## 5. Evidence ceiling, dimension and next decision

**Local independent Python 3.13 consumer PASS**, with the exact 64 basis products, all alternative-law basis tests, original gamma source matrices, 82,944 Lie commutator entry checks, actual coordinate-support assertions and boundary-fixed nullhomotopy fixtures. The committed consumer Git blob is compared with the exact locally executed file. Its P0 original-source fixture SHA was separately rechecked against GitHub original Lean source. This is **not** native Lean formal qualification, experimentally measured Hopf charge or a derived physical energy law.

A 16-component real spinor is an **internal representation carrier**, not automatically fifteen extra physical spacetime dimensions. If a candidate hypothesis imposes a ≤9-dimensional cap on *all* degrees of freedom, instead of spacetime only, its compatibility with S15 requires an explicit reformulation; the cap cannot be silently reinterpreted.

No new BFSS accepted anchor, FCP scientific phase, frozen NFC theorem, SM-D1 physics gate, experimental particle identification or mass/charge prediction is claimed.

**Project Lead conclusion:**
1. **RHOPF-P1 mathematical bridge is successful**: source-exact octonionic multiplication, standard Hopf fiber and infinitesimal Spin(9) geometry identified, with chosen quaternionic and complex restrictions.
2. **Physical protection remains blocked**: the unrestricted spinor admits an explicit vacuum-preserving escape path. A topologically stable particle claim without source-derived constraints fails this test.
3. **Next bounded RHOPF-P2 is physical**, not another ornamental proof gate: choose a source-defined 3+1D field with measurable relational observables, write its action and admissible target/gauge constraints, and compare strict S2 Faddeev–Skyrme protection against an extended S15/S8 escape model. Quantify whether any barrier or topological invariant survives the *actual admissible* field fluctuations. If not, record NO_ABSOLUTE_PROTECTION and consider only metastability under falsifiable time/energy scales.
4. **Octonionic predictive advantage must survive the weaker-model control**: compute a genuinely different observable not already available to the complex/quaternionic restricted theory. Nonassociativity or Spin(9) resemblance alone is not a physical observable.

### References

- Original gamma source and P0 previous accepted research checkpoint on etblink/math unified integration branch.
- Ornea, Parton, Piccinni, Vuletescu, Spin(9) geometry of the octonionic Hopf fibration, https://doi.org/10.1007/s00031-013-9233-x .
- Parton and Piccinni, The Role of Spin(9) in Octonionic Geometry, https://www.mdpi.com/2075-1680/7/4/72 .
- Octonionic norm composition / Hurwitz, https://sites.science.oregonstate.edu/coursewikis/GO/book/content/octonionsn.html .
- Guerra, Lamy and Zemas (2026), Global minimality of the Hopf map in the Faddeev–Skyrme model with large coupling constant, https://doi.org/10.1007/s00220-026-05702-5 .
- Sugic et al. with Mark Dennis, Particle-like topologies in light, https://doi.org/10.1038/s41467-021-26171-5 .
- Frozen NFC canon at ed3047c2cbc0abc34d2549dd27754e4d3d05af78, NFC_Book_III.tex and NFC_SPECULATIVE_HOLDING.md entry D-03.
