# RHOPF-P9 Forward Research — relational Spin(9) projector, Clifford residual, and Fock discrimination

**Checkpoint:** 2026-11-18 US Pacific.
**Branch:** `integration/bfss-unified-research-20261108`.
**Status:** **READ-ONLY SOURCE-EVALUATED FORWARD RESEARCH** — not a new native Lean qualification.
**Exact source:** `SU2RealGammaProbe.lean` blob `b9b8192055c70f0d001d7982669b9823c55562ed`; independently source-matched signed permutation fixture blob `684680e139cfcd09c37bf075c0c014bdaa80ba35`.

## 1. Accepted boundary and current diagnostic

P9A0 R2 (run #44464409223) and P9A1A R1 (run #44466224648) remain strict qualified. The three original 16-real bivectors
`K1 = gamma 1 * gamma 3`, `K2 = -(gamma 2 * gamma 5)`, `K3 = -(gamma 4 * gamma 6)`
are skew, square to -I and pairwise full-source unequal.

P9A1B R1 [#44468240191](https://github.com/etblink/math/actions/runs/44468240191) was RED: excessive `whnf` heartbeats in unrolled real 16-summand coordinate proofs. R2 [#44469465063](https://github.com/etblink/math/actions/runs/44469465063) was RED: `import all` not permitted for the imported original pre-module gamma file. D0 [#44470885693](https://github.com/etblink/math/actions/runs/44470885693) at `34ec48d7b62dbbab86ee3b7149d796c4a8c2f765` is RED: all six `rfl` probes of concrete two-cell matrix products failed definitional reduction; source preflight, Lean/Mathlib restoration and original gamma build passed, independent Lean consumer skipped. Failed declarations printed `sorryAx` because elaboration failed; they are NOT accepted axioms-free proofs. Retained [D0 artifact #14504880605](https://github.com/etblink/math/actions/runs/44470885693/artifacts/14504880605) downloaded with ZIP SHA-256 `5a6c15848eadb872add316da19066086bb1f28a462c67bdca7e0f15b4ca7f9ea`, matching GitHub digest. Original compiler log remains retained.

## 2. Exact original-source finite-matrix new findings (NOT Lean-qualified)

Independently re-extracted 9x16 signed permutations from the exact fixture. Constructed `G_i` and all three signed bivectors. Tested all pairwise commutators `[K_i,K_j]=0`. For each difference `D_ij=K_i-K_j`:
- `D_ij` has rank **8** over the exact integer source matrices, squared Frobenius norm **32**, and its selected rows/columns at indices `(0,1,8,9)` vanish.
- Therefore `K1,K2,K3` span a three-dimensional abelian Lie subalgebra of the original gamma bivector image, and the restriction to selected four-real `V` has a two-dimensional Lie-algebra kernel. No global physical gauge-redundancy claim is warranted.

The **relational orthogonal projector**
```
P = (I - K1*K2 - K1*K3 - K2*K3)/4
  = ((I-K1*K2)/2)*((I-K1*K3)/2)
```
was checked entry-by-entry to be exactly `diag(1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0)`, with `P^2=P`, `trace(P)=4`, and `im(P)=ker(K1-K2) ∩ ker(K1-K3)=V`. This is coordinate-free **relative to the selected triple**, not proof that the Hamiltonian selects the triple.

The selected-only skew complex structure `J=K1*P=K2*P=K3*P` obeys `J^2=-P`, and the exact original source reveals
```
J = (K1 + K2 + K3 - K1*K2*K3)/4.
```
The last (grade-six original GAMMA-SPINOR) word is exactly orthogonal to all 36 source gamma bivectors under Frobenius pairing. Its squared norm is 16, hence the Lie-span projection is `(K1+K2+K3)/4`, with squared norm 3 and residual `-K1*K2*K3/4` of squared norm 1. This explains the previously recorded residual structurally. **This six-gamma spinor word is not a six-fermion original Fock operator**.

The remaining original directions 0,7,8 yield `A=gamma0*gamma7`, `B=gamma0*gamma8`, `C=gamma7*gamma8`; they commute with all three `K_i`, preserve `V`, square to -I and obey `AB=-C, BC=-A, CA=-B`. Their quaternionic action on real-four `V` commutes with the common complex `J`, suggesting a `U(2)`-type restricted action. This is **not** the quaternionic Hopf fibration S7->S4 nor physical evidence of a hopfion. The actual complex Hopf S3->S2 remains a selected restriction inside Spin9-equivariant octonionic Hopf S15->S8.

## 3. External existing proof architecture (prior art, not certification)

The September 24, 2026 OpenAI BFSS research manuscript section 02-algebra.tex uses FOUR commuting original-type gamma complex structures and the product of three projectors `(I-K_i K_j)/2` to select a common REAL TWO-plane by trace computation. Our three-complex-structure construction selects real FOUR dimensions. See:
https://github.com/openai/math/blob/main/preprints/The-unique-threshold-bound-state-of-the-SU-N-BFSS-model-September-24-2026/build/manuscript/sections/02-algebra.tex .
This is structural method reuse, not an endorsement/verification of that manuscript's physical-spectrum conclusions. The established Spin9-equivariant octonionic Hopf background is https://arxiv.org/abs/1208.0899 .

## 4. Two source-specific counterfactual discriminators

**Bosonic:** In actual `Boson 2 = EuclideanSpace ℝ (SpaceIndex×ColorIndex 2)`, let `R2(X)=sum_(I,A) X[I,A]^2`, `S1(X)=sum_A X[1,A]^2`, and the bounded multiplication-observable candidate `F(X)=S1(X)/(1+R2(X))`. This is invariant under original SU2 adjoint color rotations because the color sum uses the Euclidean norm. At configuration `X[1,0]=1` and all other entries zero, `F=1/2`. The Spin9 nine-vector rotation induced by `exp((pi/4)K1)` rotates the (1,3) plane by pi/2 and yields `F=0`, whereas `K2` and `K3` rotate disjoint planes, leaving `F=1/2`. The vector action, actual SU2 invariant multiplication-operator status, domains and quantum-state matrix elements still require exact typed source proofs before physical promotion.

**Original Fock:** `BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean` supplies a source arbitrary-real-coefficient color-contracted quadratic `O_D=sum_(α,β,A) D[α,β] θ[α,A] θ[β,A]`, with a source gauge-commutation declaration. Take `D=K1-K2` or `K1-K3`. The differences vanish on selected Hopf V but are nonzero on original transverse spinor coefficients. Next prove actual original Fock nonzero action using CAR commutators, then an independent nonzero **physical gauge-invariant state** witness if possible. Full-Fock operator nonzero does not imply it acts nontrivially on the physical gauge-singlet subspace. Neither this quadratic nor the Hopf phase is a qualified conserved Noether charge without combined boson/Fock Spin9 implementers and natural closed Hamiltonian domain invariance. Central half-turn/parity is a negative discriminator because all three lift to the same central `-I` action on 48 Majoranas.

## 5. Recommended bounded proof architecture

**Next candidate `P9A1C0` (not launched):** build original public gamma bivectors from accepted P9A0 source, prove pairwise commutation and `P^2=P` and `K1 P=K2 P=K3 P` using only Clifford ring algebra and disjoint-index identities. Keep statements resource-limited and separately qualified. Extend in microgates to `trace P=4`, `J^2=-P`, and grade-six residual orthogonality. The 2026 manuscript's projector method suggests a tractable pathway.

**Coordinate bridge (separate):** only after the abstract projector gate is GREEN, establish `P` matches the original indexed 4-plane via dedicated original-source matrix-entry lemmas or a rank-plus-four-basis-witness argument; do not repeat huge real-sum expansions or attempt private import-all. Preserve all R1/R2/D0 REDs. Independently qualify both original Lean source and consuming declarations, with full axiom reports and artifacts.

**Physics follow-up (not yet authorized by mathematics):** distinguish original gauge-invariant bounded bosonic multiplication operators first, then source Fock quadratics, and only then combined Noether/domain questions. Structural Counterfactual Capacity is observed relative to a specified observable algebra: nonidentifiable under the restricted Hopf data is NOT the same as physically indistinguishable in the complete BFSS observable algebra.

**No repo original source, original Fock, physical Hamiltonian, FCP canon, or retired NFC forced Hopf tower was changed for this research.**
