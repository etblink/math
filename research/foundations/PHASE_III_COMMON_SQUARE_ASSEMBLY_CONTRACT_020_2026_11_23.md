# Phase III common-square assembly contract 020
2026-11-23 Pacific. Research-only continuation of manuscript 019 at 50c60fa3d293c8835e23fc3c71f6ee54a7eda552. Unified source resolved 7463e4098aa8a55d0ebd8d3a51d2c4eebdd9d279. Owner correction: Lean is the internal mathematical verification mechanism, not external review. Manuscript 019 is an internal proof specification; outside review/approval is NOT a progression requirement. Independent native source-bound consumers, strict builds, allowed-axiom audit and immutable evidence remain the internal qualification requirements. External literature is reusable input; empirical applicability is distinct from mathematical validity. Retain 019's historical wording but supersede its proposed review dependency. Existing hold on premature implementation retained during this donor audit; any subsequent Lean work only on unified integration, no main edits.
## Exact recovered interfaces
Reopened historical P3_AUX_CERT_FORWARD_RESEARCH_EQUAL_NORM_SPINOR_SQUARE_DIFFERENCE_2026_11_15.md blob 2ddc312208f7d9ddfb3a346123d8b4176cecd696, full text. Reopened actual files in lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/ with prefix SU2BFSSPhysicalDomain:
- L6G3OriginalChargeNormalOrderProbe.lean 93b5f1eb20b4ff6f23f7f8334ad1c382d5ecd632: sourceAllSpinorCharge M w = sum_alpha (w alpha : C) • M.charge alpha.
- L6G4AOriginalCoreCalculusProbe.lean f28dd1e283ce824b406acd15529c2e101c844814: sourceD u = coordinateDerivative u.1 u.2 literally, not a new differential operator.
- L6G4BOriginalCoefficientCommutatorProbe.lean c043464e7e605d4a3f456060da9e66d3beecb549: sourceAllSpinorCharge_normalOrder_response.
- L6G5POriginalScalarMixedRemainderProbe.lean 980ddf4dd5593c2464476513b75b8e064eff2af2: sourceSU2HalfScalarSquare_kinetic_mixed_potential_apply, coefficient -n/2 second derivative plus half ordered mixed plus n quartic.
- L6G5QOriginalDiagonalMixedCommutatorProbe.lean 42d758cc80ecb9bea781f636e53877d285a17cf6: sourceSpinorOrderedMixedTerm_eq_rightOrdered = 2 times right-ordered mixed.
- L6G5WOriginalOrbitalGaugeTangentProbe.lean 7fccbe6d246eb12e238c1041e730926807512b98: sourceSpinorWeightedColor and sourceSpinorRightOrderedMixed_eq_originalGaugeTangent_apply. Exact pointwise -i times gaugeTangent component times sourceD u. 
- L6G6GOriginalFermionFullFierzCoefficientProbe.lean 5f0dc73797178184996c73299e4d2cd31bfc8fda: sourceAllSpinorResponsePoint_eq_fierzChannels.
- L6G6HOriginalOrderedMajoranaFierzAssemblyProbe.lean fa4c225a10c9d78b8dd35c42a8d5dc1e6d2d311d: sourceFierzChannelsReal and sourceOriginalOrderedFermionicResponse_apply, exactly half times i times real channel on theta_p(theta_q(f x)).
- L6G6IOriginalFermionColorCurrentProjectionProbe.lean 0be30a74442f65545b1c4fccf57de350a5b2b914: sourceOriginalFermionColorCurrent_eq_spinDiagonal, preserving original theta order and -i/2. Its generic diagonal projection is private, but the public exact current equality is sufficient; no duplicate Fierz/diagonal proof needed.
- L6G6KOriginalBoundedFermionColorCurrentProbe.lean b71adefca6898253e8c7b6c9ad72b70296f2e958: sourceFermionColorCurrent_apply_fiber and J_c=i C_c definition.
- L6G7POriginalSmoothCoreCoordinateGaugeGeneratorProbe.lean c20c8b9f52f4038988b022e197bb59cb8e298ba5, L6G7QOriginalSourceGaugeTangentSignProbe.lean d6884ac9f16fdafcb121f09117b252273486d1c7: sourceBosonGaugeTangent_apply used in P; sourceBosonGaugeTangent_eq_neg_originalGaugeTangent in Q, matches basis color e_c.
- L6G7SActualInvariantSmoothCoreInfinitesimalGaussProbe.lean da42e0ee766d0e065febcbf23e9fe1315d3682c5: actualInvariantCore_originalCoordinateGaussDefect_zero, exact coordinate derivative sum B_c minus J_c equals zero.
- L6G7TOriginalFullColorLieGaussIdentityProbe.lean dca9ab9edb0019189e275ee025d083eed5cc3f3c: actualInvariantCore_fullColorLieGauss_zero, pointwise all color directions.
NormalLinearization.lean e92baa890518bcc66493a4931eac087f276e5581: gaugeTangent x is already a real linear map in color direction. Its component evaluation uses EuclideanSpace.proj as demonstrated in G5W. No need to add an unbundled Pi instance.
All relevant donor hashes match the historical memo where listed; fresh strict transitive closure qualification not performed here. Roadmap still describes equal-norm assembly as unqualified; bounded audit found no final native theorem. Do not infer absence from a keyword search. Current canonical register still marks W0C2B2 blocked and separate MSY finite plane01 R3 pending, not a live provider verdict. MSY priority and active branch unchanged.
## A. Exact pointwise fermionic contraction
Notation only: n(w)=spinorSquareNorm w; h_k(w)=dotProduct w (M.gamma k *v w); W_w=sourceSpinorWeightedColor M w x. Let d_c=(W_w-W_z)_c, and t_pq=theta_p(theta_q(f x)). Under n(w)=n(z), literal G6H coefficient subtraction gives
\[
D_{pq}=-\mathbf{1}_{p.1=q.1}\sum_c f_{p.2 q.2 c}d_c.
\]
Proof: cancel the entire common gamma channel before any unfolding of theta. In the remaining trace channel, the weighted color evaluation is W_w(c)=sum_k h_k(w)x(k,c), obtained by applying EuclideanSpace.proj to the exact W sum. Finite distributivity and scalar commutativity give the displayed coefficient identity. No Fierz proof or new CAR calculation.
Then by G6H,
\[
F(w)f(x)-F(z)f(x)=(-i/2)\sum_{p,q}\mathbf{1}_{p.1=q.1}\sum_c (f_{p.2q.2c}d_c)t_{pq}.
\]
Move the c sum outside the p,q sums, preserving theta order and splitting the equality test as a scalar conditional. The remaining diagonal theta sum with factor -i/2 is exactly evaluation of G6I's public sourceOriginalFermionColorCurrent_eq_spinDiagonal. Apply a typed linear evaluation map SourceEnd 2 ->l[C] Fermion 2, T |-> (T f) x, using map_sum and map_smul rather than unfolding concrete Fock. G6I's named term is definitionally f coefficient times original fermionAction products, recovered pointwise by G6K. Finally G6K sourceFermionColorCurrent_apply_fiber gives
\[
F(w)f(x)-F(z)f(x)=\sum_c (d_c:\mathbb C)\cdot C_c(f(x)).
\tag{F}
\]
All mathematical steps justified from exact source statements and ordinary finite-sum algebra. This is analytic proof, not a compiled Lean theorem. A generic helper over finite S,C and complex module V can establish the subtraction/distribution independently, keeping V abstract. Avoid a second proof of the private finiteDiagonalSpinProjection: use public G6I equality and source evaluation. The generic helper should not need CAR, actual Hilbert topology or spinor dimension. Paired consumer hcolor/hgamma via literal G1A and concreteAlgebraData bindings, not free hypothesis assumptions in the final paired specialization. Independent consumer names the original response and fiber current, includes arbitrary w,z with equal norm.
## B. Coordinate Gauss shortcut (smaller than old fderiv assembly)
Define for exposition only
\[
B_c(f,x)=\sum_{p=(i,b)} \Big(\sum_a f_{bac} x_{ia}\Big)(\partial_{ib} f)(x).
\]
On paired original invariantCore, G7S is B_c-J_c(f x)=0, exact for every c. G5W gives right-ordered mixed evaluation with -i times tangent components, not fderiv. At fixed x, expand W_w-W_z=sum_c d_c e_c in the canonical color basis, and use gaugeTangent x linearity and G7Q:
gaugeTangent(x,W_w-W_z)=-sum_c d_c sourceBosonGaugeTangent(c,x).
After applying EuclideanSpace.proj to finite sums, sourceBosonGaugeTangent_apply gives sum_a f_{bac} x_{ia}. Using sourceD literal definition, distribute the complex scalar -i, and exchange c and p finite sums. Thus
\[
M(w)f(x)-M(z)f(x)=i\sum_c d_c B_c(f,x).
\tag{O}
\]
This uses no derivative-of-weight, new Frechet chain rule or unbounded gauge generator. It is a simpler alternate assembly than the older fderiv route. Preserve older route as comparator. No extra hcolor/hgamma beyond actual source pairing; G5W uses hgamma, normalized Pauli is needed for G5P/Q.
From (F), C_c=-i J_c, and (O), the surviving sum is i sum_c d_c (B_c-J_c(f x)), which is zero by G7S. G4B/G5P/Q cancel common n kinetic and quartic terms exactly. Therefore on the physical invariant smooth core the analytic equal-norm square identity is
\[
(Q(w)Q(w)f)(x)=(Q(z)Q(z)f)(x)
\tag{P}
\]
for all x. The narrower original coordinate constraint suffices: no standalone full direction fderiv adapter is required. G7T remains reusable and gives an independent conceptual check. Never claim the full equation for nonphysical f without its residual.
## C. Subsequent core and operator steps
Q(e_alpha)=M.charge alpha by finite singleton sum (G3), n(e_alpha)=1. Equation (P) implies all basis squares agree; source charge_symmetric then equal norms and original coreForm=||Q_alpha f||². For full polarized core anticommutator use w=e_alpha+e_beta, z=e_alpha-e_beta for distinct labels (equal norms exactly): subtract compositions and divide by 2, yielding Q_alpha Q_beta+Q_beta Q_alpha=0. This avoids a separate norm-homogeneity/sqrt adapter. Diagonal square and polarization imply common real directional square with n(w), and complex polarized form on core by symmetry. D3B preserves core and D2A/BF output bridge; closure graph norm equality gives common minimal domains and adjoint square H. Essential self-adjointness remains separate (003 and historical Nov14 averaged-resolvent memo), cannot infer it merely from symmetric norm identities. Sign normalization for bounded CAR uses common self-adjoint H and energy windows; no full gap assumption.
## D. Proposed bounded native gate sequence, NOT staged
CSQ-F0: abstract finite sum factorization with typed complex module, and source coefficient-difference/weighted color component adapter. Test equal norms with differing h weights and one diagonal/off-diagonal pair; sign and factor mutations. 
CSQ-F1: original pointwise fermionic response difference (F), exact G6H/I/K donor consumption and paired independent consumer, no replacement theta family.
CSQ-O0: original paired coordinate orbital difference (O), reuse G5W/Q, sourceD, exact tangent component and canonical projection, no fderiv expansion. Independent consumer verifies literal output.
CSQ-G0: original smooth-core equal-norm square via G4B/G5P/Q and G7S, with actual paired invariantCore and exact pointwise-to-core equality. 
CSQ-E0: basis norm identity and plus/minus off-diagonal anticommutator; split if needed. Only then individual graph closure adapter. Select earliest bounded source-facing exit that can qualify; F0 may be folded into F1 if small enough, but independent source consumption essential.
Before staging: reread actual unified HEAD, coordinate active MSY finite-plane work, inspect latest canonical state and source/consumer strict workflow donors, freeze source hashes and test contract, do not retry stopped W0C2B2, do not alter donor theorem statements or broaden resource limits. Stop after two comparable native REDs, preserve first causal diagnostics and exact artifacts. Use abstract algebra then narrow source binding (especially avoid inlined Fock sums, current MSY RED demonstrates same conversion failure). Existing user hold on premature Lean implementation respected in this audit; no CI launch or unified changes. No outside review requirement. No claim of native common-square, self-adjoint charges, spectrum or ground-state certificate.
