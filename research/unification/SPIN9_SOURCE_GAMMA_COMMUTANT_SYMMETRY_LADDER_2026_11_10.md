# Source-exact Spin(9) commutant and the conditional 24+24 Spin(8) split

**Date:** 2026-11-10. **Scientific purpose:** determine which mathematical structures might help explain reality, without assuming BFSS is the ultimate physical theory.
**Status:** EXPLORATORY FINITE-ARITHMETIC CERTIFICATE; NOT A NEW LEAN-QUALIFIED THEOREM, NOT AN FCP CANONICAL FRAMEWORK RESULT, NOT A DERIVED FOUR-DIMENSIONAL PARTICLE THEORY.
**Operational separation:** The independently running C48-1A1a candidate [#42802526685](https://github.com/etblink/math/actions/runs/42802526685) was not checked or modified during this investigation. No accepted Lean source, manifest, CI workflow, or existing FCP corpus was changed.

## 1. Key discovery: the *literal* original gamma matrices have a one-step symmetry jump

Instead of importing an abstract Spin(9) irreducibility assertion or inventing gamma matrices, we extracted **all 288 signed-permutation table entries** from the accepted BFSS original [`SU2RealGammaProbe.lean`](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean), exact **Git source blob `b9b8192055c70f0d001d7982669b9823c55562ed`** (9 permutations × 16 columns and 9 sign rows × 16 coefficients). The repository already qualifies the required signed-permutation Clifford identities; the new arithmetic recomputes them as an independent finite source-data check.

Let `γ_i`, `i=0,...,8`, be these exact original **real 16×16 gamma matrices**, satisfying `γ_i²=I`, `γ_i γ_j = -γ_j γ_i` for `i≠j`. By original source `source9UnitVectorPairSpin_gamma`, the matrices `B_ij = γ_i γ_j` occur as actual Spin(9) unit-pair group images, not proxy Lie-algebra generators. They are signed permutations and therefore finite coefficient constraints on an unknown real `16×16` matrix `X`:

```text
  X B_ij = B_ij X
```

The exact coefficient equations connect `X_(r,c)` and `X_(p(r),p(c))` with sign `±1`. A **signed union/find** computes the nullspace dimension over the reals: a connected component with inconsistent sign cycle is forced to zero, otherwise it contributes one free scalar. This is exact elementary linear algebra (no floats, modular probabilistic ranks or floating tolerances).

**Eight original source unit-pair elements suffice:**

```text
 B_01, B_02, B_03, B_04, B_05, B_06, B_07 | plus B_08
```

Their successive real commutant dimensions are:

| Pair constraints added | Real dimension of commutant |
| --- | ---: |
| `B_01` | 128 |
| `B_01,B_02` | 64 |
| through `B_03` | 32 |
| through `B_04` | 16 |
| through `B_05` | 8 |
| through `B_06` | 4 |
| **through `B_07`: seven witnesses inside the ninth-axis stabilizer** | **2** |
| **plus `B_08`: eighth witness outside the stabilizer** | **1** |

Recomputing the commutant of **all 28** `B_ij`, `i,j < 8`, likewise gives dimension **2**. Recomputing all **36** pairs `0≤i<j<9` gives dimension **1**.

This is source-specific evidence for the standard representation-theory rule `End_{Spin(9)}(R16)=R·I16` and makes it particularly cheap to formalize using only eight literal source group-element witnesses and finite integer signs, not a new abstract classification theorem. The corresponding group embedding into original SO(16) is already constructed; see [source gamma group](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinGammaOrthogonalProbe.lean), [source unit-pair covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SpectralSourceNineGammaCovariance.lean).

## 2. Explicit source stabilizer commutant: exactly two independent matrices

Our exact gamma source has **literal** `γ_8 = diag(+1,+1,+1,+1,+1,+1,+1,+1,−1,−1,−1,−1,−1,−1,−1,−1)`. This makes the candidate projectors `P±=(I±γ_8)/2` trivially diagonal, with `rank P+=rank P−=8`. F10L's independently derived exact eight/eight eigenvalue counts are consistent with this and provide a more invariant proof route for arbitrary nonzero axes.

Each `B_0j = γ_0 γ_j`, `1≤j≤7`, represents a π-rotation in a plane perpendicular to the chosen ninth axis and **fixes** it. Therefore it lies in the **actual source** ninth-axis stabilizer `K = {g : R9(g)e_8=e_8}`. The seven elements have **two-dimensional** commutant, and both `I16` and `γ_8` commute with them. Since these are linearly independent, their commutant is **exactly** `span_R{I16,γ_8}`.

The source covariance / stabilizer criterion proves `γ_8` commutes with **every** member of `K`, so
```text
 End_K(R16) = { a I16 + b γ_8 | a,b∈R }.
```
No separately constructed abstract Spin(8) group is needed for this conditional source group interface; the exact subgroup `K` is already declared in `SpectralSourceNineAxisProjection.lean`. The abstract identification `K≅Spin(8)` remains a separate theorem.

It follows over `R` that the **only K-invariant idempotents** in the original real 16-spinor endomorphism algebra are
```text
      0,  P+=(I+γ_8)/2,  P−=(I−γ_8)/2,  I16.
```
Each nontrivial proper one has rank eight; there are no further invariant projection ranks or hidden third stabilizer-equivariant sector on this literal carrier.

## 3. One additional original Spin(9) element removes the split

The eighth witness `B_08 = γ_0 γ_8` is an actual original even (Spin) unit-pair element. The original Clifford relations imply

```text
   B_08 γ_8 = −γ_8 B_08.
```

Since `B_08` is invertible (indeed its square is `−I16`), its conjugation exchanges `P+` and `P−`. It does **not** stabilize the selected ninth axis. The extra condition `[X,B_08]=0` turns `X=aI+bγ_8` into `b=0`. Thus

```text
   End_{full Spin9}(R16) = R·I16,
```

and the only source 16-real-spinor **full Spin(9)-invariant** projectors are `0` and `I16`. This is a strong negative result for treating the spinor's 8+8 split as a universal physical chirality or family index; the split requires a direction/stabilizer reduction.

A direct source-Lean proof candidate is to show `B_08 P+ = P− B_08`, `B_08 P− = P+ B_08` using original Clifford square and anticommutation, then present the eight signed-pair finite commutant calculation as an independent all-projectors uniqueness check.

## 4. Combine with original SU(2) adjoint color: only a 24+24 stabilizer split survives

The accepted original BFSS Majorana **generator-label carrier** is
```text
     V48 = R3_color ⊗ R16_spin .
```
The actual `SU(2)` action is the original 3-dimensional real adjoint matrix on color, with commutant `R·I3`. It is independent of the original `Spin(9)` action on the 16-spinor factor; C48-0 and C48-0B have strictly qualified their commuting and exact original 48-label indexing.

Combine the two commutants, transporting through the accepted *literal* `pairedColorSpinEquiv` (not silently changing to color-major Fock order):

```text
 End_{SU2 × K}(V48) = I3 ⊗ span_R{ I16, γ_8 }.
 End_{SU2 × Spin9}(V48) = R·I48.
```

The first has **exactly four invariant idempotents**, of ranks `0,24,24,48`, with nontrivial projectors `Π± = reindex_G1A(I3⊗P±)`. The second has only `0,I48` as invariant idempotents. Under original gauge alone all projection ranks are multiples of 3; adding the source ninth-axis stabilizer narrows the ranks to 0/24/48; restoring full Spin(9) eliminates the proper split.

**Source-fidelity boundary:** The algebraic group actions are source verified, and the finite signed-permutation and SO(3) adjoint checks were computed exactly. Their complete combined commutant/idempotent classification has **NOT** been separately admitted in the Lean strict gate, nor has the exact full original 48-label projector theorem been written yet. These are concrete, low-cost theorem candidates with a finite proof plan.

## 5. Scientific implications: no unjustified three-generation claim

This result supports a precise and falsifiable structural observation: the original 48-real-generator module contains a source-natural stabilizer-dependent two-halves structure, and the larger Spin(9) group can exchange those halves. It is not a threefold physical family decomposition.

It does **not** establish 3+1D Lorentz chirality, individual SM generations, realistic chiral gauge fields, gravity, dark matter, or a GUT/ToE. Its common-carrier SU(2)/Spin(9) symmetry is an **internal mathematical property of the specified BFSS model** until linked to experimentally grounded physics.

**Further adversarial test:** A physical mechanism would have to explain why selecting a spatial ninth axis (or a dynamical equivalent) is legitimate, whether that breaks observed rotational invariance, and how the resulting source eigenprojections would act on **physical gauge-invariant Fock states** rather than merely on real fermionic-generator labels. The latter is not automatic from Clifford covariance.

## 6. Reproducibility and next formalization

- [Pinned original gamma-pair exact checker](tools/spin9_original_gamma_pair_commutant_exact.py) reads the actual `SU2RealGammaProbe.lean` bytes and refuses to run if the **Git blob differs** from `b9b8192055c70f0d001d7982669b9823c55562ed`; it verifies the source Clifford signed-permutation identities, 7+1 witness commutant dimensions, all 28/36 source bivector pair constraints, gamma8 diagonal and unit-pair exchange.
- The same finite equations were independently evaluated in Python over exact integers/signs and recomputed directly from the **fetched GitHub source blob** in the GitHub connector's JavaScript execution environment. Both found seven-source-pair nullity **2** and eight-source-pair nullity **1**, with no floating tolerance. **The committed Python checker is a new source-reproducibility helper, not a GitHub Actions or Lean gate; its separate CI execution is not asserted.**
- [Earlier two-quarter-turn SO(3) color commutant checker](tools/spin8_triality_su2_commutant_exact.py) supplies the independent abstract color factor. Concretely identifying the standard quarter-turns with two **actual original G3A SU(2) group elements** remains a pending source-Lean bridge.

**Recommended bounded source-Lean gates, kept separate from C48-1A1a:**
1. `S48-P0`: original Gamma8 diagonal ± eigenspace projectors; orthogonality, idempotence, rank 8 and stabilizer covariance, independent consumer.
2. `S48-P1`: exact original G1A-indexed 48 projectors `Π±`; SU(2)-commutation, original source stabilizer invariance, ranks 24/24.
3. `S48-X`: one actual source gamma unit-pair `B_08` provably exchanges `P±` and `Π±`.
4. `S48-COM`: eight finite witness commutant certificate elevated into strict Lean source theorem: seven source stabilizer group elements force `aI+bγ_8`; eighth forces scalar. Combine with exact G3A source color commutant for rank/idempotent no-go on original 48.
5. **Only later** test whether such structures have a defensible four-dimensional physical-realization bridge; do not optimize for making BFSS a ToE.

**Research governance:** This memo and checker are intentionally in exploratory `research/unification`. The active [C48 roadmap](../../contributions/bfss-kotler/BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md) and strict manifest are not changed by these findings. Preserve exact original source hash as the only admissible input for this particular finite arithmetic certificate.
