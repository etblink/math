# TD0 — BFSS top-down structural route: source Spin(9), gauge, orbit reduction and Hopf tests

**Date:** 2026-11-13 (Pacific). **Status:** RESEARCH ONLY / candidate-neutral / no new Lean root qualified. **Owner:** BFSS Project Lead. **Branch:** `integration/bfss-unified-research-20261108` (no main/NFC canon/FCP writes).

## Decision

Open a two-track top-down exploration without replacing the accepted original Hamiltonian or postponing the current auxiliary G0B2→G0B3 route: (A) **orbit/reduced-state geometry** on exact original bosons and (B) **source Spin(9) and Hopf spinor geometry**, with deliberately adversarial CAR, gauge-center and residual-Weyl controls. A separate representation bridge reuses the genuine original Fock star action and source gauge-implementer uniqueness. The first objective is a proved source-equivariant map, not a GUT/ToE assertion.

## 1. Evidence authority and current checkpoint

- Primary historical source: *The Relative SU(2) BFSS Quantum System*, internal monograph source-narrative edition 0.4, dated 2026-11-11, snapshot `etblink/math@d4870eb1ac58`; Chapters 7–9 give actual Spin(9) ninth-axis stabilizer/cover, Fock-operator star/trace action, 48 Majorana-label Spin/gauge commutation and **missing** physical Fock-vector implementer, gauge-unitary fixedness and 16-charge covariance. Chapters 10–11 distinguish rank-one escape valleys, fermionic growth, weighted form domains and conditional compactness. This is historical source narrative, NOT the latest live qualification checkpoint.
- The accepted original physical operator/Hamiltonian gate remains M5BF0 strict GREEN [#43498649514](https://github.com/etblink/math/actions/runs/43498649514), `H=(1/16)T†T` on its actual domain. Current R0A/R0B1/R0B2A/G0A/G0B0/G0B1 radial multiplier chain is accepted; G0B2 R3 [strict #43532571952](https://github.com/etblink/math/actions/runs/43532571952) was in progress at the outset of this exploratory study. No auxiliary H, Spin9 singlet, eigenstate, BFSS gap or GUT theorem is accepted here.
- Source exact `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: 9 spatial indices, 3 adjoint SU2 color indices, real `Boson 2` = R^27, sixteen original supercharge spinor indices, 48 real Majorana labels and complex Fock fiber of dimension 2^24. **Nine spatial labels are not nine total degrees of freedom; 27 configuration variables are not spacetime dimensions.**

## 2. TD-A — honest three-singular-value quotient of the *bosonic* configuration

Write the exact original bosonic field as the real matrix `X∈Mat(9,3,R)`; the genuine SU(2) adjoint-color image is SO(3), while the source Spin(9) vector action factors through SO(9) on the nine spatial rows. Thus the **bosonic** left-right action is `X↦R X C⁻¹` for `R∈SO(9)`, `C∈SO(3)` (matrix-layout transpose conventions are to be matched to original `spatialColor`).

Classical SVD gives ordered singular values `σ1≥σ2≥σ3≥0`. On the full two-sided **bosonic** quotient they classify orbits (orientation sign is absorbable in the unused six-dimensional spatial complement); generically the quotient has three real parameters. Gauge reduction alone is NOT three-dimensional: SU2 imposes only three group dimensions on 27 bosonic variables, and fermion-valued physical wavefunctions need additional fiber-equivariance and boundary data. Do not replace original `FullL2 2` with scalar functions on R^3.

Source reuse: [original `BFSSVLY0AOriginalBosonGramGaugeInvariant.lean`](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean), blob `5633ef2ed7cf182edaee171fb45273d325103b94`, defines the actual gauge-invariant **nine-by-nine spatial Gram matrix** `G(X)_{ij}=⟨spatialColor X i,spatialColor X j⟩`. It is positive semidefinite and rank≤3 by ordinary linear algebra; its three possible nonzero eigenvalues are `σ1²,σ2²,σ3²`. Its trace is `‖X‖²`; the sum of pairwise products `σ1²σ2²+σ1²σ3²+σ2²σ3²` describes quartic valley geometry up to the original color/energy normalization (which requires an exact source proof).

**Decisive valley test:** `σ2=σ3=0 ⇔ rank X≤1` identifies the nonzero commuting/flat-valley bosonic configurations. After SU2 gauge quotient, the rank-one moduli have relative vector `r∈R^9` with **Weyl identification** `r∼-r`; nonzero direction lines give `RP^8`. This is distinct from the *oriented* `S^8` base of the octonionic Hopf map. The Weyl sign originates in SU2 color gauge, NOT in the central `-1` of source Spin9 (which acts trivially on the spatial vector representation). Check exact source normalization before turning `V_quartic` into a theorem.

**Regular-orbit measure prospect:** in ordinary real `9×3` SVD coordinates, Lebesgue volume on regular full-rank distinct-σ strata has reduced scalar Jacobian proportional to `∏_i σ_i^(9−3) ∏_(i<j)|σ_i²−σ_j²|` on the ordered chamber, i.e. `∏σ_i^6∏_(i<j)(σ_i²−σ_j²)`. This is an external matrix-Jacobian formula, NOT a proved source physical-singlet measure: original Fock isotropy, source Fock vector Spin9 lift, stabilizers at σ equalities/zeros, Jacobian normalization and boundary conditions remain missing.

External corroboration: Michel–Scheinpflug–Yin [arXiv:2611.09837](https://arxiv.org/abs/2611.09837) and Bajaj–Lin [arXiv:2611.14512](https://arxiv.org/abs/2611.14512) achieve an SU2 × Spin9-singlet reduction to 2066 Fock-sector amplitudes over three singular-value variables. Their 2066 dimension is **not** a theorem about the current source `FullL2` until exact representation and normalization crosswalk exists. Their external auxiliary spectral results are independent of our accepted original H.

**First TD-A gates:** A1 original `spatialGram` PSD/rank≤3 and spatial Spin9 equivariance (independent gauge invariant already source-present); A2 trace/Gram invariant and source quartic rank-one zero-locus with exact coefficients; A3 proper-stabilizer/orbit SVD and Weyl-boundary test; A4 only after a true source physical Fock Spin9 unitary, derive equivariant Fock section description and physical SVD measure. Stop if all results reproduce standard SVD without yielding a usable operator/covariance identity.

## 3. TD-B — octonionic Hopf/Spin(9) connection, not an identification of BFSS with NFC

Mathematically, the octonionic Hopf fibration is `S^7→S^15→S^8`, equivalently `Spin(9)/Spin(7)→Spin(9)/Spin(8)`. It is equivariant between the real 16-dimensional Spin9 spinor and real nine-dimensional vector representations. See Ornea–Parton–Piccinni–Vuletescu, *Spin(9) geometry of the octonionic Hopf fibration* (2013), [arXiv:1208.0899](https://arxiv.org/abs/1208.0899), and [Clifford-system review](https://link.springer.com/article/10.1007/s12188-020-00229-5).

For the genuine source real symmetric `16×16` gamma matrices, a **candidate** homogeneous quadratic map is `h(s)_i=⟨s,Γ_i s⟩`, `s∈R^16`. Source-specified tests: (B1) the true `Spin9→SO16` source spinor action makes `h(D16(g)s)=π9(g)h(s)` with the correct inverse convention; (B2) the Clifford/Fierz identity `‖h(s)‖²=‖s‖⁴` needed to obtain `S15→S8`; (B3) identify the exact `Spin8` and `Spin7` stabilizers, central signs, and quotient; (B4) compare with the gauge-Weyl `RP8` valley, not a falsely identified `S8` physical direction.

The canonical NFC frozen scientific corpus is **not** evidence for a forced Hopf tower. In [NFC speculative holding](https://github.com/etblink/Nested-Fibrational-Cosmology/blob/archive/nfc-canonical-ed3047c2/NFC_SPECULATIVE_HOLDING.md), entry **D-03** explicitly retires the claim that the recursive Hopf tower is *forced at the NFC source*. Its NFR continuation is restricted bridge tooling, not Hopf-tower ontology or a Theory of Everything; [NFC provenance](https://github.com/etblink/Nested-Fibrational-Cosmology/blob/main/PROVENANCE.md) freezes canon at `ed3047c2cbc0abc34d2549dd27754e4d3d05af78`. FCP's latest comparisons yield no non-generic NFC/String-M or NFC/process-matrix convergence and no empirical support. This external Spin9 Hopf map may nevertheless be used as **independently established mathematics** to test a new source BFSS interface. Do not mutate or reinterpret frozen NFC/FCP scientific results.

## 4. Adversarial 3×16 Majorana-label controls

Three classical commuting real 16-spinors `s_a` carry `R^3⊗R^16`; a color-summed map `H(s)_i=Σ_a⟨s_a,Γ_i s_a⟩` is invariant under orthogonal SO3 color mixing and Spin9-equivariant *if* the source `D16/π9` intertwining is proved. This is a candidate **polynomial on the real 48-label space**, not a classical configuration field `X`, a Fock-vector action, or an observable.

**Crucial negative control:** H does NOT have the Hopf constant-length property on all of `S^47`. For the standard octonionic Hopf coordinates `s₊=(1,0)∈O²`, `s₋=(0,1)∈O²` one has `h(s₊)=+e9` and `h(s₋)=−e9`; the nonzero normalized triple `(s₊/√2,s₋/√2,0)∈S^47` has `H=0`. Hence the naive three-color sum cannot define a map `S^47→S^8` by its own normalization; do not confuse the standard single-spinor Hopf fibration with an alleged 48-Majorana Hopf tower.

**Even sharper physical negative control:** replacing the commuting classical coordinates with actual original anticommuting Majorana operators yields zero for the most natural symmetric-gamma quadratic vector. See companion [TD0N source CAR null-control memorandum](TD0N_MAJORANA_HOPF_QUADRATIC_NULL_CONTROL_2026_11_13.md) for the transparent derivation. A nontrivial fermionic bilinear transforming as a spatial angular generator instead needs antisymmetric gamma products `Γ_ij`, and exact source `gammaTwo`/Majorana ordering and factors. This is a strong reason to explore **Noether/Spin9 Lie generators** rather than claiming a new bosonic vector from a naive fermionic Hopf map.

## 5. TD-C — source gauge projection before the full Spin9 Fock-vector representation

Monograph Chapters 8–9 already have the source `Spin9→StarAlgEquiv(End_C(Fermion 2))`, adjoint preservation and original trace invariance, but NOT the strongly continuous Fock-vector implementer. The original source Spin center `z9` sends Majorana labels to `−I48`; implementing by scalar `−I` on Fock would give trivial conjugation and is a known false shortcut.

Source [C48C0OriginalSpinGaugeMajoranaCommutation.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/C48C0OriginalSpinGaugeMajoranaCommutation.lean), blob `9f9a5ce2186ded98a251efbc24c2b66f416044d5`, supplies original 48-label Spin/color commutation. [OP3C6COriginalFockActiveGammaCovariance.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean), blob `2d6f777568b0026737112ff8256e5ed50fc9e6e6`, binds the original active Majorana map. [P2bB3OriginalFockStarAutomorphismAction.lean](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P2bB3OriginalFockStarAutomorphismAction.lean), blob `b50ef04695587b267ad8519074b1293f98828749`, packages the original star action.

Existing [Nov 12 gauge-projection shortcut](../spectral-p2-original-field/P3_GAUGE_PROJECTION_SPIN_FIXED_ALGEBRAIC_SHORTCUT_2026_11_12.md) is crucial: gauge-fixed projection is `Submodule.starProjection` of a literal kernel intersection, **not** defined as a new Haar integral; abstract star algebra automorphism fixedness of the genuine gauge unitaries implies fixedness of the original gauge projection, *without* first constructing a full Spin9 Fock-vector implementer. The correct donor is source [S1H implementer uniqueness](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean), blob `eacab43f1b9112e9e1920e656bdf1166f824a5a8`, not an untyped generic claim that phases vanish.

**First TD-C join:** show that for each source Spin9 g, `q↦α_g(U_q)` is a genuine original SU2 representation and satisfies S1H's **exact 48-theta covariance premise** `hV`. Then S1H identifies it with the genuine `fermionGaugeLinearHom`. Only then invoke the previously derived star-algebra gauge-projection lemma. This yields an actual original operator-algebra gauge projector result, but not yet a unitary `U_F(g)` on Fock vectors and not a Spin-isotypic spectral reduction.

**Second TD-C join:** obtain an exact strongly continuous Spin9 action on original Fock vectors, preserving central phase/parity and true SU2 gauge, then establish original sixteen-charge column covariance `T U_g=S_g T` on an invariant graph core, transport to closed T and `H=(1/16)T†T`. Monograph Chapter 9 gives this graph-closure argument conditionally and forbids swapping in Hilbert–Schmidt operator-valued wavefunctions (`dim_C End(F)=2^48` versus Fock-vector `2^24`).

## 6. Decision gates and stop rules (research-only, not CI registration)

| Priority | Gate | Exact source question | Fail/stop condition |
| --- | --- | --- | --- |
| 1 | TD-C1 | Exact Spin star action fixes genuine original SU2 gauge representation via S1H hV | Only up-to-phase or covariance on a surrogate gamma/fiber |
| 2 | TD-A1 | Original Gram G is PSD rank≤3 and covariant for true source spatial Spin9 | No source-bound representation / wrong spatial-color orientation |
| 3 | TD-A2 | Original quartic potential vanishes exactly on rank≤1 and Weyl quotient sign is handled | Normalization mismatch, or false S8=RP8 identification |
| 4 | TD-B0N | Actual original CAR symmetric-gamma quadratic is scalar zero; no naive Fock Hopf vector | Any proof depends on unqualified gamma trace premise or wrong ordering |
| 5 | TD-B1 | Single-spinor source real16 Hopf quadratic norm and Spin9 equivariance | Does not produce a source-valid equivariant map; do not force the tower |
| 6 | TD-C2 | True Fock-vector Spin9 lift, compatible gauge and sixteen original Qs | Projective automorphism wrongly substituted for Fock-vector unitary |
| 7 | TD-A4 | Correct singlet reduced Fock sections over 3 singular values, with Jacobian/boundaries and preserved H form | 2066 external dimension treated as already source-qualified |

Parallel operating track: complete G0B2 fermionic reciprocal commutation, then G0B3 original physicalSpace preservation; separately original weighted sixteen-charge and Noether Clifford commutator. Do **not** make top-down completion a dependency of an already qualified auxiliary gate without mathematical need.

## 7. What success would mean

A positive result is an **explicit source-intertwining/covariance identity**, an independently qualified nontrivial invariant, a reduced exact physical closed form, or a new sector obstruction useful for a Hardy estimate. Merely recognizing familiar Spin9, octonion, triality, E8, three generations, category-language or M-theory patterns is NOT evidence for new physics or framework convergence. A negative result with exact source counterexample is a first-class scientific outcome.
