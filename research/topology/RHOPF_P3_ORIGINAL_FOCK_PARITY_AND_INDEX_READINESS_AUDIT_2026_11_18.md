# RHOPF-P3 — Original Fock interface and 3D index-readiness audit

**Date:** November 18, 2026. **Parent:** RHOPF-P2, commit 6b1af2ad0dd8cdf6ffe9a43baace1122705772f5, on integration/bfss-unified-research-20261108.

**Verdict:** SOURCE_FAITHFUL_FOCK_AUDIT_COMPLETE; HIGHER_DIMENSIONAL_TOPOLOGY_REAL; 3D_FOCK_INDEX_UNQUALIFIED; NO_NEW_NATIVE_CI.

We seek truth, not validation of BFSS, NFC, the Standard Model or a preferred theory. Mathematical identities, source-level physical interfaces, gauge-fixed quantum states, and experimental consequences are different evidentiary layers.

## 1. Original physical Fock carrier, not an invented replacement

Original BFSS Core.lean (Git blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60) defines SU(2) Fermion 2, complex dimension 2^24, and Boson 2, real dimension 27. The original source uses 16 spin indices and 3 color indices, hence 48 real Majorana operators, corresponding to 24 complex modes. The physical source CAR normalization for theta is one-half of the usual square-one normalized Majoranas; preserve the sqrt(2) conversion.

The REAL sixteen-dimensional Spin(9) spinor used in the gamma Hopf map is NOT the complex 2^24-dimensional Fock space, and the original nine 16-by-16 gamma matrices are NOT the 48 Fock Majorana operators.

Exact reviewed source Git blobs:

| File in Kotler Lean contribution directory | Git blob | Source-level role |
|---|---|---|
| SU2RealGammaProbe.lean | b9b8192055c70f0d001d7982669b9823c55562ed | Nine real Clifford gammas and source octonionic Q map |
| P3M4LB0OriginalSource48MajoranaBivectorCAR.lean | d08200fae8ef6c9c9544414307ad537f1eeaa4a4 | 48 normalized original CAR and bivector commutators |
| P2bB3OriginalFockStarAutomorphismAction.lean | b50ef04695587b267ad8519074b1293f98828749 | Original Spin(9) Fock OPERATOR star-automorphism group action |
| P3M4CS0OriginalSpin9CentralGammaSign.lean | 6b7e627d902f7f9c291cc54b1f3aa1e4dfd5bc1d | Staged source declarations: negative Spin(9) central element reverses all normalized Fock Majoranas |
| P3M4HS1OriginalSpin9FockHSUnitaryGroupAction.lean | a9c7b74e358eef4a56c2ae11eca5f138842d55a8 | Original OPERATOR Hilbert–Schmidt-column action, NOT Fock VECTOR action |
| OP2aOriginalFockGaugeSource.lean | 328d607ee2bb45edd4268e5592d784c4c84488a7 | ACTUAL original SU(2) gauge unitary on Fock vectors |
| OP2bOriginalGaugeProjectionBridge.lean | 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec | Source orthogonal projector onto fermionic SU(2) fixed space |
| OP2cNonzeroOriginalGaugeVacuum.lean | a16d3573b737bb4453e42b0b543d63cbbac1cd1b | Nonzero original fermionic gauge-fixed vacuum |
| P3M4W0B2BOriginalSchurScalarCommutant.lean | 6d5fbe98aa8d660c9b7c680efefde02501d8e253 | Source 48-Majorana scalar commutant |

**Important correction:** the original BFSS SU(2) gauge Fock-VECTOR action and vacuum really exist as source declarations. The separate unresolved interface is a globally compatible source Spin(9) Fock-vector action, the physical gauge/spectral domain, and a 3+1D spatial fermion operator coupled to a physical Hopf field. No new CI status for these Lean declarations was verified in RHOPF-P3.

## 2. Real octonionic topology survives, but not as a 3D Fock-particle charge

Let gamma_k be the original nine real symmetric sixteen-by-sixteen gammas. For y on S8, Gamma(y)=sum_k y_k gamma_k is a real symmetric traceless involution. The rank-eight real eigenbundle E_plus(y)=ker(Gamma(y)-I) has unit sphere bundle S15, the source-exact octonionic Hopf fibration.

The Euler class of E_plus is a generator of H^8(S8;Z), so its Euler number is plus or minus one: the Gysin exact sequence includes H^0(S8;Z) --cup Euler--> H^8(S8;Z) -> H^8(S15;Z)=0, hence the Euler multiplication must be surjective.

**However**, physical compactified 3-space is S3, and pi3(S8)=0. Every three-dimensional fixed-boundary map into S8 is nullhomotopic; pullback Euler class vanishes because H^8(S3;Z)=0. The source octonionic eighth-dimensional Euler invariant does NOT thereby become a three-dimensional soliton invariant.

The P2 toy occupied eigenspace projector P_minus(y)=(I16-Gamma(y))/2 is rank eight. With eight additional positive spectator bands it belongs to Gr_8(C24). Both pi3(Gr_8(C16)) and pi3(Gr_8(C24)) vanish: from the fibration U(k)×U(N−k) -> U(N) -> Gr_k(CN), the map Z×Z -> Z on pi3 is surjective for k,N−k at least two. This is compatible with known multiband fragility of simple 3D class-A Hopf insulators.

Another crucial separation: the fully occupied rank-eight Fock Slater determinant is a COMPLEX LINE bundle, det(E_minus tensor C), over S8. It is topologically trivial because H^2(S8;Z)=0; equivalently the original real E_minus is orientable there. This determinant-line fact does not trivialize the non-Abelian higher-dimensional geometry of the full rank-eight eigenbundle.

The P2 explicit based nullhomotopy remains a constructive gapped path through full S15. The P3 independently executed consumer checked source-exact Clifford gammas, 36 gapped source projector samples from four initial spinors, rank eight, and the vacuum endpoint. Numerical checks support but do not replace the general topology arguments.

## 3. Original 48-CAR parity and a precise conditional bridge

For n canonical complex fermion modes, choose Majoranas gamma_(2j)=a_j+a_j-dagger and gamma_(2j+1)=i(a_j-dagger−a_j). Under this explicit paired ordering, the occupation parity is

P=(-1)^F = product_j(1−2 a_j-dagger a_j)
         = (-i)^n product_(k=0)^(2n−1) gamma_k.

It squares to one, anticommutes with all odd Majoranas and commutes with even bilinears. A separate occupation-basis consumer tested n=1,2,3,4: all 120 Majorana CAR anticommutator pairs, the product/parity identity, odd sign action and even-bilinear invariance passed exactly.

The algebraic formula holds for arbitrary finite n, including 24, but NO full dense 2^24-dimensional Fock calculation was run. To claim the formula for the precise ORIGINAL source parity, the orientation and pairing of the 48 sourceNormalizedGamma operators must be source-pinned and proved in Lean.

**Conditional original-source target:** P3M4CS0 contains declarations that the original negative-central Spin(9) element reverses every real-linear normalized Fock Majorana. The CAR volume/parity operator also implements that automorphism. Given a qualified complete 48-Clifford-to-original-Fock algebra map, the two conjugation actions coincide on all original operators, and the implementing unitaries differ by a scalar (Schur). This is a good bounded source-consumer theorem, NOT a newly native-qualified Fock-vector Spin(9) group lift or fermionic index.

Pointwise, every star-automorphism of a full finite-dimensional complex matrix algebra is implemented by some unitary, unique up to scalar. Therefore do not misdescribe the gap as nonexistence of pointwise unitaries. The missing source theorem is a coherent, continuous, gauge-compatible action on actual original physical Fock vectors and the invariant closed Hamiltonian domain.

**Negative control:** parity is constant along the P2 full-target escape and cannot distinguish its endpoints. An even fermionic Hamiltonian can conserve parity without protecting a restricted Hopf texture.

## 4. A possible additional symmetry, but no posthoc protection claim

A separate source-defined CHIRAL class-AIII Hamiltonian with an off-diagonal unitary q(x):S3->U(2) can carry pi3(U(2))=Z winding when the chiral symmetry and the spectral gap are preserved. That is a legitimate *alternative hypothesis*, not a physical BFSS derivation. The unrestricted class-A Gamma(Q) toy lacks this imposed protection. We should test whether any candidate original physical action enforces that symmetry even when octonionic extra modes are allowed. We must not install it merely because it produces the desired integer.

## 5. Reproducibility and governance

Exact locally executed source files, preserved separately:
- research/topology/tools/rhopf_p3_original_gamma_projector_core.py, Git blob 82e113dab152f7330b1f2a32885b1799c208b0fc
- research/topology/tools/rhopf_p3_fock_parity_projector_consumer.py, Git blob 6bc55b47f0beffbc02f169e21e624e419eca1863

Python 3.13.5 / NumPy 2.3.5; both Git blobs checked byte-identical to local tested files. The cached original source gamma fixture was checked against the exact original GitHub Lean file. No full-dimensional Fock matrices, 3D Dirac/Yukawa domain, index theorem, zero-mode computation, or native Lean strict gate are claimed.

**Result:** real 8D octonionic topology established; no 3D class-A Fock projector invariant; source original gauge-fixed Fock vacuum preserved; fermion parity and Clifford source automorphism offer a specific future algebraic joining target, but no sourced particle protection or mass.

**Next gate:** RHOPF-P4 should not launch a fabricated spatial model. First source a candidate 3+1D fermionic action with a specified field carrier, physical spatial Dirac/Yukawa/Callias operator, chiral/gauge symmetries, boundary and closed domain; use original Fock gauge structure only under a proved intertwinement. Then compare index/spectral flow along the admitted extra-direction escape against a strict S2 Faddeev–Skyrme control and chiral class-AIII alternative. If no independent physical symmetry survives, preserve NO_PHYSICAL_PROTECTION instead of defending a particle interpretation.

The BFSS 27 accepted anchors, W0C2B2 status (not reaudited), frozen NFC retired forced Hopf tower D-03, FCP main, and accepted SM state are unchanged. No new Lean or Actions CI launched.

## References

Skolem–Noether: https://encyclopediaofmath.org/wiki/Skolem-Noether_theorem

CAR Fock parity: https://doi.org/10.1007/s00220-022-04521-8

3D Hopf insulator and band extension: https://pmc.ncbi.nlm.nih.gov/articles/PMC8602304/

Octonionic source geometry: https://arxiv.org/abs/1208.0899

Gysin octonionic sphere bundle: https://math.uchicago.edu/~may/VIGRE/VIGRE2010/REUPapers/Price.pdf
