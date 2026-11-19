# RHOPF-P9 — The source Spin(9) Hopf circle and its physical-identifiability obstruction

**Checkpoint date:** November 18, 2026  
**Branch:** integration/bfss-unified-research-20261108  
**Parent:** 777ef9ef6e9122b046c508ecaff97e8c3e94c7ae (RHOPF-P8).  
**Verdict:** SOURCE_EXACT_SPIN9_HOPF_CIRCLE; THREE_INEQUIVALENT_FULL_SOURCE_LIFTS; ORIGINAL_GAUGE_FOCK_QUADRATIC_REUSE; NO_PHYSICAL_U1_OR_PARTICLE_CLAIM.

**Scientific charter:** seek truth, preserve useful positive and negative knowledge, avoid interpreting visual torus/hopfion analogies as a physical theory without dynamics, a unique model and an observable.

## 1. Source-first motivation after RHOPF-P8

RHOPF-Q0/P5 established a real first-complex-Hopf restriction inside the original BFSS gamma matrices and an exact toroidal spatial level surface for a separately chosen profile. P6-P8 compared GP and Faddeev–Skyrme physical constraints and found no stable source-derived Hopf particle in the specifically tested model. More invented GP initial conditions would add little information. The priority is now **original physical source selection**.

Original BFSS N=2 is (0+1)-dimensional SU(2) supersymmetric matrix quantum mechanics. Its Boson 2 is R^(9*3)=R^27, Fermion 2 has complex dimension 2^24, and the theta operators are 48 Majoranas. This is NOT physical spatial R3 fluid mechanics. Independent background: https://mathworld.wolfram.com/BFSSModel.html . The Spin(9) action on the octonionic Hopf fibration is established mathematics: https://arxiv.org/abs/1208.0899 .

## 2. Source pins and an actual original-Fock building block

At the live branch, the following exact Lean source Git blobs were inspected:

| Role | File basename | Exact source Git blob |
| --- | --- | --- |
| Real Spin(9) 16-spinor gamma matrices | SU2RealGammaProbe.lean | b9b8192055c70f0d001d7982669b9823c55562ed |
| Original BFSS Fock, bosonic variables and supercharge | Core.lean | 9882359ced78b0a3bd7e2f057974bd0a031b3e60 |
| Source SU2 gauge-invariant original 48-Majorana quadratic | BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean | cfd3e1eeed420ce92ca54821816f4a53e073ad4a |
| Pointwise original boson/Fock gauge covariance | BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean | 68fd2067b2dcdb6851afed269d25726dd5b634c5 |
| Uniform pointwise original normalized Gram/Fock operator norm | BFSSNORM0COriginalNormalizedFockField.lean | 84de66e73be2018b03ced898ebf70e691c07b40f |
| Exact original paired 48-real generator SU2/Spin9 Kronecker commutation | C48C0OriginalSpinGaugeMajoranaCommutation.lean | 9f9a5ce2186ded98a251efbc24c2b66f416044d5 |
| Original Fock operator-algebra Spin9 star-action | P2bB3OriginalFockStarAutomorphismAction.lean | b50ef04695587b267ad8519074b1293f98828749 |
| Original negative central Spin9 sign on each normalized Majorana | P3M4CS0OriginalSpin9CentralGammaSign.lean | 6b7e627d902f7f9c291cc54b1f3aa1e4dfd5bc1d |
| Original normalized native H=(1/16)T-adjoint T, STAGED/PROSPECTIVE | P3M5BE0OriginalNativeHamiltonianPort.lean | f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1 |

The original gamma signed-permutation fixture was independently re-extracted from the source Lean text in this research interval and matched **every entry**; fixture Git blob 684680e139cfcd09c37bf075c0c014bdaa80ba35.

The original Fock quadratic is not an invented 24-mode model:

  O_J = sum_(alpha,beta=1..16) J_(alpha,beta) sum_(A=1..3) theta_(alpha,A) theta_(beta,A).

BIL0C contains a source proof declaration commuting this with the *original* SU2 fermionic gauge action for arbitrary real spinor coefficient J. JOIN0A assembles this with the actual bosonic Gram coefficients, and NORM0C bounds the resulting normalized original-Fock operator uniformly in the bosonic configuration for fixed coefficient matrix. **These are promising algebraic and boundedness interfaces, not a theorem that this is a conserved current of the physical Hamiltonian, a vortex or a particle.** No newly claimed Lean strict native gate was launched.

## 3. Exact source-positive discovery: the Hopf common phase lies in Spin(9)

The original source 16-spinor real coordinates 0,1,8,9 define

  z1=v0+i*v1, z2=v8+i*v9.

The original nine gamma quadratic map Q_k(v)=v-transpose Gamma_k v restricts to Q7=2Re(z1 conjugate z2), Q0=-2Im(z1 conjugate z2), Q8=|z1|²-|z2|², with Q1-Q6 zero. Thus the common complex phase on this selected 4-real-dimensional carrier is the fiber circle of a first complex Hopf map S3->S2.

The **exact original gamma product**

  K13=Gamma1 Gamma3

is skew symmetric, K13^2=-I16, and preserves the selected four-dimensional carrier. Its restriction is precisely the real complex-structure rotation J sending (v0,v1,v8,v9) to (-v1,v0,-v9,v8). Therefore

  U(t)=exp(tK13)=cos(t)I16+sin(t)K13

acts on the chosen doublet exactly as (z1,z2)->(exp(it)z1,exp(it)z2), preserving Q0,Q7,Q8. This is an original **Spin(9) bivector subgroup restriction**, not simply a visual analogy or an arbitrarily declared new U1.

At t=pi, U(pi)=-I16 on the full spinor. The corresponding vector action is identity, and on three original color copies of the 16-spinor real Majorana labels it is -I48. P3M4CS0 contains a source Spin9 operator-star-automorphism theorem that this central sign reverses every original normalized Majorana. Abstract 24-mode fermion parity conjugates all odd Majoranas likewise. **A coherent source Fock-vector implementation and its identification with actual original parity up to phase remain a separate strict-qualification and physical-domain obligation.** The independent consumer tested small CAR n=1..4; it did not construct a dense 2^24 matrix.

## 4. Exact source-negative discovery: three inequivalent full lifts, one Hopf circle

There are **three** particularly simple original source bivectors:

  K13=Gamma1Gamma3,
  K25=-Gamma2Gamma5,
  K46=-Gamma4Gamma6.

Every one preserves the same real four-dimensional source subspace and induces the **same** common complex phase on z1,z2. Every one squares to -I16 and is skew. But their full 16-spinor action is pairwise distinct; their Spin9 induced nine-vector rotations lie in *different planes* (1,3), (2,5), and (4,6), respectively.

This is a rigorous SCC identifiability failure: changing the proposed physical generator among these three leaves all restricted complex Hopf observations unchanged (torus, linked fibers, projected Q, helicity), yet changes the transverse original spinor, bosonic vector-plane transformation and possible Noether angular momentum operator. The Hopf field alone does **not** identify which full physical generator was used.

Moreover, the naive internal J which only rotates the four selected real coordinates and fixes the other 12 is **not** itself in the source Spin9 Lie-algebra image. The 36 exact source gamma bivectors have mutually orthogonal integer Frobenius inner products of norm squared 16. Their only nonzero pairings with this J are +4 for Gamma1Gamma3 and -4 for each of Gamma2Gamma5, Gamma4Gamma6. Thus

  ||J||_F² = 4,
  ||proj_spin9(J)||_F² = (4²+4²+4²)/16 = 3,
  ||J-proj_spin9(J)||_F² = 1 != 0.

This proves that **source Spin9 extensions exist but cannot act trivially on every unselected spinor coordinate**. This is a much sharper selection boundary than asserting the source Hopf U1 is or is not a symmetry in general.

The independent executable used exactly the signed-permutation source gamma fixture and performed exact-integer checks for all nine Clifford matrices, all 36 Spin9 bivectors, all three restricted lifts, their full inequivalence, and the projection residual.

## 5. Why this cannot yet be called a physical conserved Hopf charge

For K=s Gamma_iGamma_j, the original Clifford commutators satisfy

  [K,Gamma_i]=-2s Gamma_j,
  [K,Gamma_j]=+2s Gamma_i,
  [K,Gamma_k]=0 for k distinct from i,j.

The full quadratic Hopf vector Q(v) thus generally changes under the original subgroup's induced **nine-vector** rotation; it is stationary on our specially selected complex Hopf carrier because those rotated vector coordinates vanish there. This is **not** a global fiberwise circle preserving Q for all unit 16-spinors.

Crucially, original Core.lean defines the sixteen supercharges with terms contracting Gamma_i and theta with bosonic coordinate derivatives, plus Gamma_ij/theta with quadratic bosonic coordinates and SU2 color structure. A genuine **global Spin9 transformation of this original physical model** must rotate the bosonic nine-vector indices together with spinor indices. Rotating only the selected Hopf complex doublet while freezing the bosonic coordinates is therefore not automatically a BFSS Hamiltonian symmetry.

C48C0 provides a source proof of Spin9/SU2 color *real-generator coefficient* commutation in the actual paired 48 Majorana labels, but explicitly does **not** supply coherent Fock-vector group implementers, scalar phases, full physical gauge projection or natural closed-Hamiltonian domain invariance. The small independent consumer separately checked just the color-by-spin Kronecker matrix identity for representative 3x3 color rotations; this is not the original paired-label reindex theorem. BIL0C, JOIN0A and NORM0C provide reusable source operators, not an extra Noether U1 or a three-dimensional Dirac/Callias index.

Likewise, this is no identification with Standard Model U1 hypercharge or electromagnetic gauge symmetry. Such claims demand the actual representation on physical fields, coupling to gauge potentials, anomaly constraints, and observational predictions. A subgroup already present in Spin9 should not be counted as an independently discovered conservation law without additional evidence.

## 6. Executable evidence and gate

Two **byte-tested local exact-source** Python files:

- research/topology/tools/rhopf_p9_spin9_hopf_lift_core.py — Git blob d32b09d60c2bf1d5ff5873cdc7023802fd036054.
- research/topology/tools/rhopf_p9_spin9_hopf_lift_independent_consumer.py — Git blob 08fd05edb145931f7e01dc8a190d0c7e5233b922.

Python 3.13.5, NumPy 2.3.5, independently source-verified fixture. The consumer PASS output is reproducible; generated local JSON SHA256 f1bcf7f664d316e432187d35d579c0c10ab6ede4f6f55234253f93a90d3553ff. Core tests: source Clifford identities, three distinct Spin9 lifts to the same C2 Hopf U1, integer-orthogonal Lie span projection, full R16 witness of changed Q, central -I16/-I48 labels, factorized color-spin commutation, small occupation CAR parity. All tests remain at their stated mathematical/operator-index levels.

**Evidence ceilings:** no new native Lean CI, original source changes, full source original Fock vector Spin9 lift, original physical Hamiltonian closed-domain Noether commutator, real spatial 3D Hopf field, fermionic index, observed particle, proton model or mass. Preserve all previously accepted BFSS gates, FCP main, NFC rejected forced-tower D-03, and the Standard Model program qualification.

## 7. Project Lead decision

**Accept P9 as source-pinned mathematical research with a real positive group-geometry discovery and a strict negative physical-identifiability finding.**

The next justified *small* proof gate, if launched, is native Lean on **original gamma four-coordinate preservation, two or three distinct Spin9 bivector lifts, and J's nonzero transverse residual**. Keep it isolated from monolithic full Hamiltonian imports and use an independent source consumer and strict axiom reports. After qualification, investigate a **combined boson-plus-original-Fock Spin9 Noether charge** and its natural physical domain. Only a genuinely distinguishing physical observable would justify treating the restricted Hopf fiber as more than a mathematical face of the existing symmetry.

**Bottom line:** The actual original BFSS gamma algebra contains the complex Hopf fiber circle. But three distinct physical-source extensions fit exactly the same restricted observations; no uniquely selected protected particle or new fundamental gauge charge follows.
