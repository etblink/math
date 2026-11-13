# BFSS — Gauss law, Maxwell, and radial auxiliary research

**Date:** 2026-11-13. **Status:** RESEARCH-ONLY / CANDIDATE-NEUTRAL / UNQUALIFIED. **Project Lead checkpoint:** R0A and R0B1 strictly GREEN; original physical M5BF0 accepted; R0B2A strict run #43518502567 pending when investigation began. This memorandum is not a new Lean theorem, does not advance the active gate, and changes no original source or main.

## 1. Exact analogy and its limits

Maxwell electric Gauss law, div E = rho/epsilon_0, serves both as a flux relation and as a canonical gauge constraint. Pure nonabelian Yang-Mills has covariant Gauss law D_i E^i = 0 (with charged-matter source terms if present). Under dimension reduction to BFSS matrix quantum mechanics, a residual SU(2) Gauss operator annihilates gauge-singlet physical states; its bosonic component schematically contains f^{abc} X_i^b P_i^c and it has a fermion bilinear. **No ordinary spatial-divergence Maxwell PDE remains in the 0+1-dimensional model.** The original 27-dimensional bosonic *configuration* is not physical 27-dimensional space. The exact numerical coefficients and unbounded Gauss-domain equivalences are not sourced here.

Background:
- https://pmc.ncbi.nlm.nih.gov/articles/PMC12916482/ (matrix action and time-gauge Gauss constraint)
- https://doi.org/10.1103/PhysRevD.99.046011 (BFSS Gauss generator/physical Hilbert singlets)
- https://link.springer.com/article/10.1007/s10670-022-00597-9 (Maxwell canonical and Bianchi constraints)

## 2. Most economical near-term theorem: radial multiplier is gauge-compatible

The frozen original Core.lean source, blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60, defines Boson 2, Fermion 2 and FullL2 2. GaugeCore.lean, blob e4990dadf1d8bde849e351467282ab3f14989c3b, defines GaugeData with a bosonic real-linear isometry and fermionic complex-linear isometry. Its exact physicalSpace is the intersection over g in GaugeGroup of kernels of bosonPullback(g) minus fiberAction(g). GaugeOrbits.lean, blob d6343a145884b289716c04b2bdc6acb99bfa839a, supplies gauge-conjugation inner-product preservation, tangents, stabilizers and slices.

Accepted R0A defines the actual source weight w_epsilon(x) = sqrt(norm(x)^2+epsilon^2), epsilon>0. The bosonic gauge action is an isometry, so w_epsilon(g x)=w_epsilon(x), and likewise b_epsilon(g x)=b_epsilon(x) for its reciprocal. This is a mathematically immediate scalar candidate; a **new exact Lean interface remains to be compiled** using the actual G.boson or paired bosonGaugeEquiv.

R0B1 strict #43516234402 GREEN proved b_epsilon belongs to actual complex L-infty with an AE representative on Boson 2. R0B2A strict #43518502567 tests the original bounded FullL2 2 scalar multiplication, unqualified until independently accepted. **Conditional** on construction of B_epsilon, prove:
- B_epsilon commutes with the original Lp bosonPullback(g), using scalar gauge invariance and Lp almost-everywhere composition.
- B_epsilon commutes with the original fermion fiberAction(g), because the multiplier is a scalar while fermion action is complex-linear.
- Therefore B_epsilon maps the actual G.physicalSpace to itself; with a separately verified original Haar projection P_G, prove P_G B_epsilon = B_epsilon P_G.
- After the finite 16-output PiLp lift and injectivity, revisit the graph-comap strategy for a closed weighted physical charge.

**Do not claim an unbounded infinitesimal commutator [G^a,B_epsilon]=0 has been proved solely from group-level commutation**; generator domain and differentiation require a separate theorem. Do not infer source Q charge covariance without checking exact original charge/gauge interfaces.

## 3. Hidden geometry: gauge orbit tangents versus radial directions

A formal infinitesimal bosonic gauge tangent is delta_theta X_i=[theta,X_i]. By invariance of the color inner product,
d(norm(X)^2)[delta_theta X] = 2 sum_i <X_i,[theta,X_i]> = 0.
Thus the radial gradient is orthogonal to gauge-orbit directions. Existing normal-slice material in GaugeOrbits/GaugeGeometry makes this a promising source-exact theorem, but the exact normalization and tangent interfaces still require compilation.

**Speculative analytical benefit:** gauge reduction alters the quotient metric, Jacobian and strata where the stabilizer jumps. Any radial/Hardy argument that silently counts 27 ambient coordinates as physical radial degrees of freedom risks being wrong. Inspect quotient measure and symmetry sectors before importing any Hardy constant. This is a research hypothesis, not a mass-gap result.

## 4. Spatial Gram matrix is already present; beware orientation

SU(2) adjoint bosonic conjugation factors through SO(3). The nine original color vectors x_i ∈ R^3 share one proper rotation. The 9×9 Gram matrix Gamma_ij(X)=<x_i,x_j> is gauge-invariant. There is already a candidate declaration originalSpatialGram_gauge_invariant in BFSSVLY0AOriginalBosonGramGaugeInvariant.lean, blob 5633ef2ed7cf182edaee171fb45273d325103b94. Its independent strict qualification has NOT been checked as part of this investigation. Radius squared is the trace of the native Gram matrix (with original Euclidean norm convention).

**Non-obvious blind spot:** Gram matrices classify up to O(3), whereas gauge conjugation uses SO(3). For spanning triples, oriented scalar triple products det(x_i,x_j,x_k) can distinguish mirror configurations with identical Gram data but different SO(3) orbits. The fermionic Fock-fiber equivariance is not encoded by bosonic Gram data alone. Therefore do not treat Gram-only coordinates as a complete physical gauge quotient.

## 5. Maxwell magnetic Bianchi becomes a matrix Jacobi identity

Nonabelian spatial field strength under reduction is proportional (with convention-dependent factors) to [X_i,X_j]. The spatial Bianchi identity reduces to
[X_i,[X_j,X_k]] + [X_j,[X_k,X_i]] + [X_k,[X_i,X_j]] = 0.
This is an algebraic Jacobi identity, useful as a source-convention consistency check, not a new BFSS dynamical equation. The matrix magnetic-like energy is quartic in commutators, vanishes along commuting/collinear SU(2) valleys, and Gauss singlet selection **does not itself** establish a gap.

Classically the commuting SU(2) color vectors lie on collinear configurations. Modulo conjugation one expects a valley R^9/Z_2, with residual Weyl reflection; verify exact source normalization and the singular origin independently. Stabilizer jumps and quotient Jacobian may be germane to a Hardy comparison, but this is not proved here.

## 6. Maxwell Hopfion topology — informative, not promoted

Maxwell theory does have genuine linked/knotted electromagnetic field-line solutions organized by S^3→S^2 Hopf constructions (Irvine/Bouwmeester 2008; Irvine 2010; later stable-knot analysis). Useful references:
- https://www.nature.com/articles/nphys1056
- https://doi.org/10.1088/1751-8113/43/38/385203
- https://link.springer.com/article/10.1007/s00220-021-04219-3

That topology is an established feature of 3+1 electromagnetic fields, **not** evidence that the original BFSS 0+1 theory has Maxwell field lines, a Hopf tower, a protected topological ground-state sector, or an NFC unification map. A BFSS topology candidate must name an actual gauge-invariant observable and a source-compatible map before promotion.

## 7. Project Lead prioritized falsifiable actions

**Priority A: after classifying strict R0B2A**, source-compile actual bosonic gauge invariance of the scalar w_epsilon and b_epsilon. Reuse GaugeData.boson isometry and GaugeCore. If R0B2A qualifies, separately prove B_epsilon gauge equivariance via Lp AE equality and preservation of actual original physicalSpace. Haar commutation can then be inherited from the already-source-compatible projection. Keep this a bounded gate.

**Priority B:** qualify finite 16-charge PiLp lift and injectivity of the reciprocal multiplication; only then execute inverse-graph comap on the original physical charge T and independently establish weighted-core density. No Hamiltonian promotion before operator-domain gates.

**Priority C, parallel only:** revisit native Gram/orientation and orbit normal-slice interfaces, characterize stabilizer strata and candidate quotient measure. Test whether those yield a rigorous estimate useful for the Spin(9) Hardy inequality in the auxiliary-ground-state paper. Do not bypass the exact source-to-paper normalization crosswalk.

**Non-claims:** No Maxwell-to-BFSS physical equivalence, Yang-Mills 3+1 mass gap, physical BFSS positive gap, nonzero ground state or fidelity estimate is proved by this note. All proposed source-level commutation, gauge and Hardy theorems remain unqualified.
