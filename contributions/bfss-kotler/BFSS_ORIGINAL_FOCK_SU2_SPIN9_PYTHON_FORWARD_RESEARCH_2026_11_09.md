# BFSS original-Fock SU(2)/Spin(9) forward research — exact Python checks and bounded Lean gates

**Research date:** 2026-11-09 (America/Los_Angeles; green CI receipts in UTC 2026-11-10).  
**Repository:** `etblink/math`; **branch:** `integration/bfss-unified-research-20261108`.  
**Mode:** forward research, original-source inspection and finite computation; **no accepted Lean theorem is inferred from Python**.  
**Executable record:** [`BFSS_ORIGINAL_FOCK_SU2_SPIN9_FORWARD_CHECKS_2026_11_09.py`](BFSS_ORIGINAL_FOCK_SU2_SPIN9_FORWARD_CHECKS_2026_11_09.py), frozen Git blob `2e205c1806e2125f4c9e2a4b3ca4a0d6381d2869`. Re-run the exact/combinatorial checks using `python3 contributions/bfss-kotler/BFSS_ORIGINAL_FOCK_SU2_SPIN9_FORWARD_CHECKS_2026_11_09.py`; optionally add `--matrix-check` with NumPy and SciPy installed. The matrix path uses seed `20261109` and performs **no network access or repository mutation**.

## 0. Accepted mathematical baseline and scientific boundary

The exact original physical Hilbert operator carrier is `Fermion 2 →L[ℂ] Fermion 2`, not a substitute matrix algebra. The following are now **strictly accepted**, each only at the exact tested commit:

- **B2 global physical-star:** run [#42759465245](https://github.com/etblink/math/actions/runs/42759465245), B2 tested commit `f21db5d7fdf36b8ee07c230787af8691859956a9`.
- **B3 original Spin(9) star-automorphism group action:** run [#42764649026](https://github.com/etblink/math/actions/runs/42764649026), tested commit `ac7438a9ae069db323863562c5462f3c59753a22`, acceptance marker `P2BB3_ORIGINAL_FOCK_STAR_AUTOMORPHISM_INDEPENDENT_STRICT_PASS`.
- **T1 exact original Fock trace + independent trace pairing:** run [#42769361446](https://github.com/etblink/math/actions/runs/42769361446), tested commit `b05b97260bb56718110f014a1052b54bc74bafa2`, acceptance marker `T1_ORIGINAL_FOCK_TRACE_INDEPENDENT_STRICT_PASS`. Its 55 frozen Git blobs, Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold build and independent allowed-axiom checks passed. Retained artifact [#13742365725](https://github.com/etblink/math/actions/runs/42769361446/artifacts/13742365725), digest `sha256:3929be4f22e74a045dbbe1345762760ab5d2665ad146ed740debc9ffce7d2bb1`.

Thus `Tr_F(α_g T) = Tr_F(T)` and `Tr_F((α_g S)†(α_g T)) = Tr_F(S†T)` are **qualified algebraic finite-dimensional results**. They do **not** imply a Fock-vector implementing representation, topological continuity, SU(2) gauge commutation, closed original physical Hamiltonian symmetry or any mass gap.

See [`BFSS_P2BB3_STRICT_ACCEPTANCE_AND_T1_TRACE_HANDOFF_2026_11_09.md`](BFSS_P2BB3_STRICT_ACCEPTANCE_AND_T1_TRACE_HANDOFF_2026_11_09.md) for the T1 initial red and bounded repair.

## 1. Source-bound SU(2) exterior-Fock representation and exact character checks

The exact source `G3C.complexOneParticleMatrix_block` gives eight color-adjoint (3×3) blocks indexed by `Fin 8` and `ColorIndex 2`. The genuine `G4A.exteriorGauge` is `ExteriorAlgebra.map` of this 24-mode action, and `G4E.fermionGaugeUnitaryHom` identifies its induced action with the literal original `Fermion 2` unitary carrier.

**Pinned reference Git blobs:**
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3CComplexOneParticleUnitaryProbe.lean` — `161861a9494836fcd2fad02a76e25cc6a81cf20b`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4AExteriorGaugeActionProbe.lean` — `141fbe74fc4883f686e05dbc702efb12c6fb8fab`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4EFermionHilbertUnitaryProbe.lean` — `7247844122ab870d31e92903db4c2ab561f98112`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2bOriginalGaugeProjectionBridge.lean` — `13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec`
- `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean` — `a16d3573b737bb4453e42b0b543d63cbbac1cd1b`

**Representation identification requiring a new strict Lean binding:** the complexification of the three-dimensional real color adjoint of SU(2) is its integer spin-one irreducible. Eight source blocks therefore constitute $W=8V_1$. The actual exterior construction is $F=\Lambda^\bullet W$, with complex dimension $2^{24}=16,777,216$. For one block,

$$
Λ^\bullet V_1 = Λ^0 V_1 ⊕ Λ^1 V_1 ⊕ Λ^2 V_1 ⊕ Λ^3 V_1
                \cong 2V_0 ⊕ 2V_1.
$$

Consequently $F\cong256(V_0\oplus V_1)^{\otimes8}$. For the torus weight variable $q$ and exterior-degree variable $t$, the character is exactly

$$
\chi_F(t,q)=(1+t)^8(1+tq)^8(1+tq^{-1})^8.
$$

The spin-$j$ multiplicity is $m_j=256[\binom{16}{8-j}-\binom{16}{7-j}]$, $0\le j\le8$. These **exact arithmetic/representation-theoretic predictions** follow from the stated representation identification, independently of the later numerical approximations:

| spin $j$ | copies $m_j$ | sector dimension $(2j+1)m_j$ |
|---:|---:|---:|
| 0 | 366,080 | 366,080 |
| 1 | 878,592 | 2,635,776 |
| 2 | 931,840 | 4,659,200 |
| 3 | 652,288 | 4,566,016 |
| 4 | 322,560 | 2,903,040 |
| 5 | 112,640 | 1,239,040 |
| 6 | 26,624 | 346,112 |
| 7 | 3,840 | 57,600 |
| 8 | 256 | 4,352 |

The weighted sum is exactly (2^{24}). The singlet count is

$$
\boxed{\dim F^{SU(2)}=m_0=256 C_8=256(1430)=366,080}.
$$

This is approximately 2.1820068359375% of $F$. The gauge-fixed operator algebra compressed to this sector would have complex dimension $366080^2=134014566400$, versus $2^{48}=281474976710656$ for the full operator algebra. **Neither is a statement about the full bosonic × fermionic physical BFSS Hilbert space.**

**Independent verification paths executed in Python:** (a) exact torus-character weight subtraction $m_j=w_j-w_{j+1}$; (b) exact integer Clebsch–Gordan recurrence for eight tensor copies of $2V_0\oplus2V_1$; and (c) SU(2) Weyl/Haar integral

$$
m_0=\frac{2}{\pi}\int_0^\pi\sin^2\psi\;2^{24}\cos^{16}\psi\;d\psi,
$$

whose deterministic Simpson quadrature gives `366079.9999999999`, agreeing numerically with the two exact integer paths. The Haar integral is an **independent numerical check**, not an axiom or proof substitute.

## 2. Graded gauge singlets, center parity and explicit odd witness

The exact exterior-degree singlet polynomial is obtained by the coefficient difference

$$
P_0(t)=[q^0-q^1]\,(1+t)^8(1+tq)^8(1+t/q)^8.
$$

Its coefficients in fermion degrees $k=0,\dots,24$ are:

`[1,0,28,120,406,1512,4060,8856,17605,29512,41392,51520,56056,51520,41392,29512,17605,8856,4060,1512,406,120,28,0,1]`.

They are nonnegative, palindromic under $k\leftrightarrow24-k$, sum to 366,080, and split equally:

- even-parity original SU(2) singlets: **183,040**
- odd-parity original SU(2) singlets: **183,040**.

This yields the predicted singlet supertrace `Tr_{F^G}((-1)^N)=0`. In addition to OP2c's strictly accepted nonzero **even** gauge-fixed vacuum, the original exterior **three-color volume wedge** in any one spin-pair block is a concrete candidate **odd** fixed vector: it transforms by the determinant of the three-dimensional color adjoint, which should be (+1). Its exact source occupation labels and nonvanishing need a new source-bound Lean proof. This is not a theorem imported from the generic three-mode numerical test.

For source Spin(9) center, existing F10U proves genuine `source9NegativeCentral` acts by $-I_{48}$ on the original 48 Majorana labels (not a trivial kernel element). Original fermion parity $P_F=(-1)^N$ anti-commutes with each original Majorana generator. This strongly suggests

$$
\alpha_{-1}(T)=P_F T P_F^{-1},
$$

but the **original-source Fock parity implementer and equality of automorphisms are open**. In the small **three-mode** exterior model, Python independently checked normalized CAR, $P_F\gamma_aP_F=-\gamma_a$, gauge-vacuum fixedness, and parity/gauge commutation to machine precision. This neither proves original 24-mode parity identification nor provides a global Spin(9) unitary.

Pinned F10U blob: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.lean` — `353978608b978b00d0e36deb1c1a47c32641ea59`.

## 3. Original 48-label commutation: a high-value proof opportunity

G1A/F10F uses the **literal source index ordering** for each spin pair $0\le j<8$, color $0\le A<3$, and real/imaginary label $r\in\{0,1\}$:

$$
\ell(j,A,r)=2(3j+A)+r,
$$

while an auxiliary color-major view uses (16A+(2j+r)). The permutation (P) from color-major to `Source48Label` is therefore exact.

At the tensor-factor level, a spatial Spin(9) transformation acts as (I_3\otimes R_{16}) in color-major coordinates; the SU(2) color adjoint acts as (R_3\otimes I_{16}). After the **same** (P) reindexing,

$$
[P(I_3\otimes R_{16})P^{-1},\;P(R_3\otimes I_{16})P^{-1}]=0.
$$

**Numerical adversarial test:** sampled a generic orthogonal (R_{16}=\exp(A-A^T)) (scaled in the executable script) and a random (R_3∈SO(3)), seed `20261109`. The correctly transported 48×48 commutator Frobenius norm was exactly zero to floating precision. A deliberate bug omitting (P) on the gauge matrix produced a norm of approximately **9.004133**. This is a finite Kronecker/permutation sanity check, *not* a numerical evaluation of the source Spin(9) representation itself and *not* the Lean theorem.

Pinned source F10F blob: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean` — `9dc5713dfea7c40d8c9f58088392e144c3c28517`.

**Proposed strict proof path:**
1. Identify original gauge one-particle `G3C` and source Spin(9) `F10F` matrices in exactly the same `Source48Label` carrier (preserving row/column directions), and prove the full literal matrix commutator equals zero.
2. Use existing OP3C5B/C6A Clifford generator covariance, M3I original full-image surjectivity and B3 packaging to show the resulting **conjugation automorphisms** commute on all original Fock operators.
3. The operators `α_g(U_q)` and `U_q` may a priori differ by a central scalar even if their conjugation actions commute. Prove this scalar defines a character of the genuine SU(2) gauge group and kill it using a source-bound SU(2) perfectness/no-one-dimensional-character theorem; do **not** assume it vanishes from commutation of adjoint actions alone.
4. Only then apply generic `GaugeFixedProjectionOP1.starAlgEquiv_fixed_gaugeFixedProjection` to the exact OP2b/OP2c original projection, obtaining `α_g(P_gauge)=P_gauge` subject to exact typed bridge and strict compilation.

Step 1 is probably the next best **small, high-leverage bounded Lean gate** after T1 acceptance. Step 3 is a genuine obstruction, not merely a tactic problem.

## 4. Finite SU(2) gauge Casimir: a *constraint* gap, never a BFSS mass gap

On the representation in Section 1, the only SU(2) irreducibles have integer spin $0\le j\le8$. With the **standard** angular-momentum normalization, the gauge quadratic Casimir $C_G=-\sum_{i=1}^3J_i^2$ acts on spin $j$ as $j(j+1)$. The spectrum of the finite fermionic gauge Casimir is therefore predicted to be

`0, 2, 6, 12, 20, 30, 42, 56, 72`.

The smallest nonzero eigenvalue is 2, with spin-1 sector dimension $3m_1=2,635,776$. It follows **under the original-generator-normalization and source representation-identification obligations** that

$$
\langle v,C_Gv\rangle\ge 2\lVert (1-P_G)v\rVert^2.
$$

This could give a quantitative estimate on approximate fermionic gauge constraints; it is **not** positivity of the full BFSS Hamiltonian, a spectral gap for the full physical model, compactness, confinement or a BFSS mass gap. The original infinitesimal gauge generators, their skew adjoints and normalization still require source-bound Lean construction.

A reusable nearby mathematical antecedent is `lean/OAI/MathematicalPhysics/BFSS/NormalCocycle.lean`, Git blob `b60bef3dd30de44a970fba5745eff67474662e5e`, whose sum-of-skew-squares kernel lemma suggests an alternative qualitative kernel argument.

## 5. Pointwise Fock implementers, scalar obstruction, continuity, and weight control

The B3 algebraic star automorphism and T1 trace pairing make **pointwise unitary implementation** a compelling algebraic next objective. The frozen original full-endomorphism intertwiners in `FCPM3JRankOneModuleExistence.lean` (Git blob `baeb15d2bbc984db631ba712aa465aaa51aa6a4a`) and Hilbert normalization in `FCPM3LUnitaryCliffordModuleExistence.lean` (`188eff243ec082c9cc8bc04c140af8dbed020754`) are concrete reusable inputs, rather than rebuilding the full Fock module. They are **candidate adapters**; neither alone gives the actual source Spin(9) action on Fock vectors.

If (U_g) implements `α_g` pointwise, its composition may only be projective: (U_gU_h=c(g,h)U_{gh}). The inventory contains `OAI/RepresentationTheory/ProjectiveInduction/CosetTransport.lean` (Git blob `dc61316fcf75ce70561d58ac6b42b013a1e3cbf7`), with `ScalarCocycle` and `ProjectiveUnitaryRepresentation` interfaces. These can **record and study** the cocycle, not automatically trivialize it.

For source continuity, finite-dimensional generator covariance plus F10BG PBW source topological-group structure could be simpler than further global Lie atlas work; this is only a strategy until a pointwise `Continuous`/operator action theorem compiles.

Finally, a **conditional** exterior spin-lift character with 24 real rotation planes, each at spatial half-angle, predicts Fock-vector weights from $-6$ to $+6$ and conjugation operator weights from $-12$ to $+12$. This recovers the hypothesized $M=6$ vector and $M=12$ operator bounds without certifying that the original source Spin(9) Fock-vector lift exists with that normalization. Do **not** confuse the original 48-real Majorana space with 48 independent complex fermion creation modes.

## 6. Project Lead decision gates and negative knowledge

**Recommended order** (each new Lean gate independently source-pinned, cold built, independently consumed and axiom audited):

- **C48-0:** exact original spin/color index crosswalk and 48-label matrix commutator; accept only an equality on the *actual* F10F/G3C carrier; retain the deliberately wrong-permutation Python negative control.
- **C48-1:** lift to all original Clifford/Fock-operator adjoint actions, using OP3C5B/C6A/M3I.
- **C48-2:** independently eliminate the SU(2) scalar character obstruction on actual gauge implementers; only then derive exact OP2b gauge projection fixedness via OP1. Do not merge C48-1 and C48-2.
- **P-0:** source-exact parity `(-1)^N`, anticommutes with every original 48 Majorana generator; prove the F10U central action matches `Ad(parity)` on all operators.
- **G-0:** one-block complexified adjoint-character identification and the odd gauge-fixed cubic-wedge witness; then graded singlet count and projected trace/rank.
- **G-1:** original infinitesimal generator normalization and finite gauge Casimir eigenvalues/inequality.
- **U-0:** exact B3 `StarAlgEquiv` pointwise unitary implementation using M3J/M3L; treat scalar cocycle and continuity as separately open gates.

**Failed patterns to avoid:** pretending random orthogonal (R_{16}) is the source Spin(9) action; assuming `Ad(U)` commutation implies (U) commutation; assuming a representation-theoretic arithmetic dimension equals the physical boson–fermion Hilbert dimension; silently changing source index order; inferring a BFSS mass gap from the fermionic gauge Casimir gap; or promoting a standalone Python calculation to Lean-verified mathematics.

**Governance:** Git history and the exact green receipts are canonical. B2/B3/T1 proof source and strict artifacts remain untouched by this read-only research. The Python script and this memorandum are research-preservation artifacts only.
