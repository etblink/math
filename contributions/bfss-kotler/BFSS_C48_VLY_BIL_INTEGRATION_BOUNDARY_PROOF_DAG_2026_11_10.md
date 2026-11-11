# FCP–BFSS C48 / VLY / BIL source-faithful integration boundary

**Date:** 2026-11-10 (Pacific)  
**Branch:** `etblink/math` / `integration/bfss-unified-research-20261108`  
**Base SHA:** `1bbe4d38aa1a51aad85d0601f44dd7197402fe35`  
**Gate status:** **VLY-0A candidate** (cold source and consumer strict verification required); **BIL-0, VLY-0B, JOIN-0, VLY-1, PHYS-0 open**. No empirical, spectral or family claim.

## 1. Qualification ceiling and accepted parents

- [C48-1A1d0 run #42901799764](https://github.com/etblink/math/actions/runs/42901799764) GREEN at exact SHA `1bbe4d38aa1a51aad85d0601f44dd7197402fe35`: 84-blob original G4E Fock / S1J source-axis intertwiner plus independent norm consumer. This does not yet imply arbitrary-vector covariance or color-contracted bilinear invariance.
- [Original G2A boson gauge](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG2ABosonGaugeProbe.lean) provides the genuine `Boson 2` linear isometry action.
- [Upstream spatialColor_gaugeConjugate](../../lean/OAI/MathematicalPhysics/BFSS/GaugeGeometry.lean) and [upstream colorConjugate_inner](../../lean/OAI/MathematicalPhysics/BFSS/GaugeOrbits.lean) give VLY-0A's complete existing mathematical ingredients. Colors are `ColorIndex 2` (three adjoint dimensions), spatial indices `SpaceIndex = Fin 9`.
- [G4H exact original theta Fock covariance](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4HExactThetaCovarianceProbe.lean) and [G3A color orthogonality](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG3AAdjointColorRepresentationProbe.lean) are the intended BIL-0 inputs.
- [Original nine real gammas](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2RealGammaProbe.lean) have exact source blob `b9b8192055c70f0d001d7982669b9823c55562ed`. The [original Majorana bilinears/RP8 research](../../research/unification/BFSS_ORIGINAL_MAJORANA_BILINEARS_RP8_TWISTED_QUADRATIC_BUNDLES_2026_11_10.md) remains **exploratory**.

## 2. Proof-DAG-first plan

| Node | Exact carrier and target | Gate |
| --- | --- | --- |
| **VLY-0A** | `originalSpatialGram : Boson 2 → Matrix SpaceIndex SpaceIndex ℝ` invariant under genuine `G2A.bosonGaugeEquiv` | **CURRENT CANDIDATE** |
| **VLY-0B** | `K_x(B)=Σ_A Γ(x_A) B Γ(x_A)` on real-skew 16×16 matrices, gauge-invariant and source-Spin(9)-covariant | OPEN, distinct |
| **BIL-0** | Original-color-contracted Majorana commutators on genuine bounded `Fermion 2 →L[ℂ] Fermion 2` intertwine with G4E | OPEN, distinct |
| **JOIN-0** | Correctly typed `B ↦\mathcal B(K_x(B))` at each original bosonic configuration | OPEN |
| **VLY-1 / PHYS-0** | Near-valley auxiliary 56/64 projections; separately original closed Hamiltonian/form-domain tests | OPEN |

The source-Spin(9) gamma matrix carrier, the 48-real-Majorana generator labels, and the actual complex Fock operators are **different types**. Source reindexing, `√2` normalization, real/complex coefficients, and central Spin signs are not permitted to disappear in a generic tensor abstraction.

## 3. Why the geometric interface is worth proving

For actual original bosonic coordinates `x_i(A)`, define `M(x)_{ij}=Σ_A x_{iA}x_{jA}`. Its SU(2) gauge invariance comes directly from orthogonality of color conjugation, not from a choice of preferred spatial axis. It therefore supplies the source-compatible Gram matrix for later singular-value/near-valley analysis.

On the **different** 120-dimensional real-skew spinor matrix carrier, the exploratory proposal `K_x(B)=Σ_A Γ(x_A)BΓ(x_A)` is polynomial, preserves real skew matrices, and is gauge-invariant by original color orthogonality. On a rank-one commuting configuration `x_{iA}=n_i c_A` with `‖n‖=1`, it becomes `‖c‖² Γ(n)BΓ(n)`, yielding the previously finite-checked **auxiliary** 56+64 splitting. Away from rank one this is not a universal involution. A perturbation regime `λ₁>λ₂+λ₃` is a proposed later gate, **not yet Lean-qualified** and not a physical mass gap.

The separate BIL-0 candidate uses color-contracted `[θ_{αA},θ_{βA}]` acting on the *original* `Fermion 2`, with the original CAR convention `{θ,θ}=δI` and an explicit normalization. Use the already qualified G4H/C48 action and G3A `R^TR=I`. Do not claim that an auxiliary matrix (B) acts on the actual Fock space without constructing the map.

The original CH fixed 16→8→4→2 source flag remains finite-matrix mathematics, not a physically selected family tower. The Hopf bundle global-splitting obstruction and 56/64 quadratic-bundle topology are independent conditional findings. The next JOIN must not silently assume a Spin(9) Fock-vector unitary or closed Hamiltonian domain reduction.

## 4. VLY-0A strict contract

New [importable source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0AOriginalBosonGramGaugeInvariant.lean) proves full matrix equality using the original `spatialColor_gaugeConjugate` and `colorConjugate_inner`. New [independent consumer](../../lean/diagnostics/BFSSVLY0AOriginalBosonGramNormConsumer.lean) deduces the **distinct** color-row norm-square invariance.

A separate [strict gate](../../.github/workflows/bfss-vly0a-original-boson-gram-strict.yml) freezes the accepted **84 C48 ancestor/source/consumer Git blobs plus these two new source/consumer blobs**. It requires pinned Lean v4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, cold source build, independently compiled norm consumer, exact `#print axioms` audit, forbidden-warning scan, retained diagnostics. Only `propext`, `Classical.choice`, and `Quot.sound` are allowed.

**Stop conditions:** manifest drift, first causal Lean error, `sorryAx`, missing independent consumer, a change to original physics, or a mistaken interpretation of the auxiliary geometry as a physical Hamiltonian theorem. No weakening of the accepted C48 pins or source normalization.

**Next bounded unit upon green:** inspect BIL-0 original theta commutator signatures and construct one source-level color contraction identity with a separate consumer; do not combine VLY-0B/BIL-0/JOIN-0 in one speculative cold gate.

**Method:** [Proof-DAG First](BFSS_PROOF_DAG_FIRST_METHOD_AND_C48_FAILURE_LEDGER_2026_11_10.md), [Interface First](BFSS_INTERFACE_FIRST_PROOF_PROTOCOL_AND_OP3A_LESSON_2026_11_09.md), and [Bounded Execution](BFSS_BOUNDED_EXECUTION_PROTOCOL_2026_11_08.md) remain binding.


## 6. VLY-0A accepted and BIL-0A separately staged — 2026-11-10

**Accepted VLY-0A:** [run #42908736563](https://github.com/etblink/math/actions/runs/42908736563) GREEN at exact source commit `9aa46a17ea95902067383c30a39da3d743314cd1`. The 86-pinned-blob closure, pinned Lean 4.34.1/Mathlib, original `Boson 2` spatial Gram source, independent color-row norm consumer, standard-only axiom checks and retained diagnostics passed. Thus the original G2A SU(2) action preserves the complete nine-by-nine spatial Gram matrix. This does not qualify spectral splitting or the Majorana-bilinear theorem.

**BIL-0A new candidate:** The actual G3A original adjoint matrix is `R(q)[B,A]` (output B, input A). Its existing strict source theorem `adjointColorMatrix_orthogonal` establishes `Rᵀ R=I`, whereas the sum over original INPUT colors in a color-contracted theta bilinear needs `R Rᵀ=I`. A small new source uses G3A's existing `R(q)R(q⁻¹)=I` and `RᵀR=I` to prove real row orthogonality; a distinct independent consumer casts the coordinate contraction into the original complex scalar field for G4H theta covariance. Neither statement constructs a Fock bilinear.

- [BIL-0A source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSBIL0AOriginalGaugeColorRowOrthogonality.lean) — original output-row matrix orthogonality.
- [BIL-0A independent consumer](../../lean/diagnostics/BFSSBIL0AOriginalGaugeColorComplexConsumer.lean) — precise complex coefficient contraction for future two-theta action.
- [BIL-0A strict workflow](../../.github/workflows/bfss-bil0a-original-gauge-color-row-strict.yml) — the 86 prior VLY/C48 pins stay exact, plus two new BIL source/consumer pins.

**Acceptance:** only the new source + independent consumer at exact tested commit, with 88 frozen Git blobs and standard-only axioms on a pinned cold Lean/Mathlib build. If red, inspect the first causal error, do not alter original CAR, theta source, accepted parents or change the claim. **Next after green:** BIL-0B color-contracted product/commutator under the *actual original Fermion 2 Fock unitary*, independently consumed; then and only then attempt JOIN-0 with configuration-dependent geometry.


## 7. First BIL-0A strict red — recovered S3G proof, bounded repair (2026-11-10)

**Failed CI receipt:** [run #42913624979](https://github.com/etblink/math/actions/runs/42913624979), exact commit `3f73584623cb942226b8750295473258fb32143d`, completed failure, job `130170320180`. Original 88-blob preflight and pinned Lean 4.34.1/Mathlib restored and verified; cold original source build reached **9016/9016**. The new source failed at **line 24:49** with `unexpected token 'ᵀ'; expected ':=', 'where' or '|'`, then a type mismatch from the failed parse. **The consumer did not run**, and the printed `#print axioms` of the ill-formed declaration does not count as accepted proof. Historical ancestors remain unchanged. Artifact `13810095440`, SHA-256 `0c26d5f53919f6bc08358950270013b8856de939ec4bd637bdc473b5b1d9eeef`.

**Causal finding and stronger reuse:** new source omitted `open Matrix`, required by transpose notation. The accepted [FCP S3G source](../../research-sources/fcp/physical-spin-source-20261021/SU2BFSSPhysicalDomainS3GActualFermionSpinGaugeCompatibilityProbe.lean), archived Git blob `0b6d2c422cb6755d60fa2db3f279adabc419a580`, explicitly opens `Matrix Finset` and already proves the identical row statement with the pinned `mul_eq_one_comm.mp (adjointColorMatrix_orthogonal g)`. Reuse this short source proof rather than preserving a newly written, unnecessary inverse-matrix argument. Its complex-contraction proof avoids `exact_mod_cast` by explicit `Complex.ofReal_mul`, sum rewriting and `by_cases`. Port that proof shape into the separate consumer to avoid repeating the historical S3G cast failure.

**Bounded repair:** change only the NEW BIL source, NEW independent consumer, those two workflow blob pins, and append this note. Preserve the 86 previously accepted C48/VLY pins, original source theorem statement, consumer theorem statement, exact source carrier, dependency/toolchain pins, all allowed-axiom checks, and previous red diagnostics. This is **not qualification** until a full strict rerun passes. After success, compare S3G2/S3G3 donor declarations against the current branch before adding the smallest missing genuine Fock quadratic gauge-invariance theorem.

## 8. BIL-0A strict accepted; BIL-0B FCP S3G2 source-faithful port staged — 2026-11-10

**BIL-0A is now strictly QUALIFIED:** [run #42917435336](https://github.com/etblink/math/actions/runs/42917435336), job `130183381303`, exact source commit `4f4b5594d220480d776a43cc148f37ac34443070` — 88 source Git-blob pins passed, pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original source cold build, independent complex consumer, no disallowed axioms, and `BIL0A_ORIGINAL_COLOR_ROW_STRICT_PASS`. Earlier red #42913624979 remains historical failure evidence, not the status of the corrected source. The intervening documentation-only evergreen commit `e4acf60e36194a5e092fac16937afd83db81b895` did **not** change this accepted source or consumer.

**BIL-0B proposed gate:** Use the exact preserved [S3G2 original Fock source](../../research-sources/fcp/physical-spin-source-20261021/SU2BFSSPhysicalDomainS3G2GaugeInvariantMajoranaPairsProbe.lean), Git blob `f5cbdf691953770df6636d6fb7b7ceb7b1cab6f6`, and its [S3G real/complex color contraction](../../research-sources/fcp/physical-spin-source-20261021/SU2BFSSPhysicalDomainS3GActualFermionSpinGaugeCompatibilityProbe.lean), Git blob `0b6d2c422cb6755d60fa2db3f279adabc419a580`, as donor proof patterns. Historical [S3G Gate #155](https://github.com/etblink/Foundational-Convergence-Program/actions/runs/38089835677) accepted all original three-file S3G/S3G2/S3G3 chain under frozen source. Current imported module `BFSSBIL0BOriginalFockColorPairGaugeInvariant` imports the **qualified BIL-0A source** and **G4H exact original theta covariance**, not historical import paths. Its one primary result proves, for all original spinor labels `α,β`, all original gauge `g` and Fock vectors `v : Fermion 2`:
```
U_g ((Σ_A theta_(α,A) theta_(β,A)) v)
  = (Σ_A theta_(α,A) theta_(β,A)) (U_g v).
```
The importable source includes four explicitly named supporting lemmas: original complex color-row contraction, exact theta covariance, general double-color contraction and exact pair covariance. The [independent consumer](../../lean/diagnostics/BFSSBIL0BOriginalColorPairCommutatorConsumer.lean) tests the distinct original-Fock vector commutator-zero consequence. Source `#print axioms` checks all five source theorems; consumer checks primary source root and its own root.

**Gate contract:** New workflow `.github/workflows/bfss-bil0b-original-fock-color-pair-strict.yml` freezes all **88 accepted BIL-0A/C48/VLY ancestry blobs** plus exactly two new BIL-0B source and consumer blobs. It retains pinned toolchain, cold source build, separate consumer build, strict warning diagnostics and standard-only axiom checks. **BIL-0B is UNQUALIFIED until a green run at its exact source commit.** A red must be diagnosed from its first causal job error; do not change original theta normalization, `pairedAlgebraData`, earlier pins or Gate-155 donor bytes.

**After BIL-0B green:** BIL-0C is the historically proven S3G3 arbitrary-real-spin-matrix quadratic sum result, using its abstract finite weighted-sum lemma and distinct reindexing. Then VLY-0B/JOIN-0 may connect bosonic `K_x(B)` coefficients to genuine Fock operators pointwise. No statement here proves source-Spin(9) Fock-vector unitary, original Hamiltonian symmetry, spectral gap or NFC three generations.

## 9. BIL-0B strictly accepted; BIL-0C historical S3G3 coefficient bridge staged — 2026-11-10

**BIL-0B acceptance:** [strict #42920891450](https://github.com/etblink/math/actions/runs/42920891450), accepted source commit `8d707e6394055b4e0f06620777c94f312c2d4752`, successful job `130195154715` (2026-11-10 23:24:59 UTC). All **90 pinned blobs**, cold source import, independent original-Fock commutator-zero consumer and standard-only axiom checks passed. Marker `BIL0B_ORIGINAL_FOCK_COLOR_PAIR_STRICT_PASS`. The theorem `originalColorPair_gauge_invariant` now binds the historical FCP S3G2 proof to the **current actual Fermion 2 / G4E / G4H original-source carrier**. This is stronger than scalar row-contraction, but is not yet a Hamiltonian or Spin9 Fock-vector theorem.

**New BIL-0C candidate:** [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSBIL0COriginalFockQuadraticGaugeInvariant.lean) defines `originalColorQuadratic (J : Matrix SpinIndex SpinIndex ℝ) : Fermion 2 →L[ℂ] Fermion 2` by finite real-`J` weighted sums of the original BIL-0B color pairs, and proves `originalColorQuadratic_gauge_commutes` for every original `g, J, v`. The proof explicitly reuses the historical FCP [S3G3 finiteWeightedGaugeCommutes method](../../research-sources/fcp/physical-spin-source-20261021/SU2BFSSPhysicalDomainS3G3FullQuadraticGaugeCommutationProbe.lean), original pinned blob `981320cfc1e1de731ef3cce9d8dee9090b5d89c2`, but **does not import** the much larger S3D source or infer equality to historical `pairedFermionSpinQuadraticColor` without a separate theorem. The distinct [norm consumer](../../lean/diagnostics/BFSSBIL0COriginalFockQuadraticNormConsumer.lean) uses the actual G4E unitary isometry to prove `‖Q(J)(U_gv)‖=‖Q(J)v‖`.

**Strict contract:** Separate [92-pin BIL-0C workflow](../../.github/workflows/bfss-bil0c-original-fock-quadratic-strict.yml), 90 accepted parent source/consumer blobs byte-identical, two new blob pins, exact original Lean 4.34.1/Mathlib, source cold build, independent norm consumer, allowed-axiom diagnostics and preserved artifacts. **Not qualified until its new exact-commit gate is green.** Old accepted source and donor copies unchanged; no unbounded operator domain or BFSS spectral claim.

**After BIL-0C:** VLY-0B can build the real-skew 16×16 coefficient operator `K_x` from actual `Boson 2` and source gamma. The new exact arithmetic research [Kx moments and valley discriminant](../../research/unification/BFSS_KX_MOMENTS_POTENTIAL_VOLUME_AND_VALLEY_DISCRIMINANT_2026_11_10.md) suggests a source-potential invariant bridge, but is still Python/exploratory and requires an independent source-exact Lean theorem. JOIN-0 must explicitly map these real coefficients into the correct actual Fock operator type and prove gauge invariance pointwise before form-domain claims.

## 10. BIL-0C qualified; VLY-0B original Gram/gamma coefficient atom staged (2026-11-10)

**BIL-0C strict GREEN:** [#42924009228](https://github.com/etblink/math/actions/runs/42924009228), job `130205719622`, exact tested SHA `617d75216c1120418ab9209d679a735491dc2db9`, successful 2026-11-10 23:46:40 UTC. Original 92-blob pin closure, pinned Lean 4.34.1/Mathlib, cold source/independent norm consumer, accepted foundational axioms only. Marker `BIL0C_ORIGINAL_FOCK_QUADRATIC_STRICT_PASS`. This **qualifies original real-16×16-spinor-matrix-weighted Majorana color quadratic** on genuine `Fermion 2`, with source Fock SU2 gauge commutation and independent norm consumer. Source log has two **nonfatal deprecation warnings** on `ContinuousLinearMap.sum_apply` and `.smul_apply`, neither an axiom failure nor an excuse to weaken the accepted source gate.

**VLY-0B new independent candidate:** [source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSVLY0BOriginalGramGammaCoefficient.lean) defines, with source original `GammaMatrix`, literal `Boson 2`, actual qualified `originalSpatialGram` and pinned `FCP.BFSSGamma9.gamma`,
```
G_x(B) = ∑ i : SpaceIndex, ∑ j : SpaceIndex,
  (originalSpatialGram x i j) • (gamma_i * B * gamma_j).
```
The primary theorem proves `G_(bosonGaugeEquiv g x)(B) = G_x(B)`. Its independent [trace-test consumer](../../lean/diagnostics/BFSSVLY0BOriginalGramGammaTraceConsumer.lean) verifies `tr(G_(g·x)(B) C)=tr(G_x(B) C)` for any real original 16×16 test matrices `B,C`. This does **not** assert direct equality `G_x(B)=∑_A Γ(x_A)BΓ(x_A)`; that expansion depends on source-normalized coordinate/inner equivalence and remains a separate **VLY-0B2** proof. The Python Kx moment identities and the 56/64 near-valley spectral projectors remain exploratory until formally transferred.

**Proof guardrails:** new [VLY-0B strict workflow](../../.github/workflows/bfss-vly0b-original-gram-gamma-coefficient-strict.yml) retains *all 92 qualified ancestor source and independent-consumer exact Git blobs*, pins precisely the two new VLY source/consumer blobs, original toolchain/axiom enforcement, source cold build and independent trace consumer; no original BFSS sources or accepted manifests change. No BIL/physical scalar extension in this single gate.

**Next decision on green:** separately verify `G_x(B)=∑_A Γ(x_A)BΓ(x_A)` using the original spatial ColorIndex source, then instantiate `BIL-0C.originalColorQuadratic (G_x(B))` and show combined simultaneous bosonic SU2/Fock gauge covariance **pointwise**. Only then consider original physical Hilbert-space multiplier/domain and original quartic-potential/form consequences.

## 11. Parallel source CAR/normalization research and corrected JOIN critical path (2026-11-10)

**Forward-research memo:** [JOIN-0 skew Fock observables, uniform bounds and CAR trace interface](../../research/unification/BFSS_JOIN0_SKEW_FOCK_BOUNDED_FIELD_AND_CAR_TRACE_INTERFACE_2026_11_10.md), with [source-pinned Python checker](../../research/unification/tools/bfss_join0_skew_field_car_trace_probe.py). This was investigated **while VLY-0B #42926845593 was running**, without polling the gate, changing its candidate Lean source, or claiming new strict qualification.

**Critical-path refinement supersedes the final recommendation of §10:** As soon as VLY-0B passes, define `F_B(x)=BIL0C.originalColorQuadratic (VLY0B.originalGramGammaCoefficient x B)` for arbitrary real B. BIL-0C's *already qualified* universal `J` statement and VLY-0B's pending coefficient equality suffice to prove exact original G2A/G4E **pointwise simultaneous gauge covariance**. There is **no need to qualify the direct color-column expansion first**. That identity remains an independent VLY-0B2 task for sharp norm bounds and the Kx moment/geometric interpretation, not a mandatory JOIN-0A parent.

A separate CAR chain promises stronger observable content: symmetric coefficients collapse to `(3/2)tr(J)I`; skew B remains skew under original gamma/Gram `G_x`; `iQ(G_x(B))` becomes pointwise self-adjoint; normalized by `1+T(x)` it is uniformly operator bounded (analytically `24‖B‖_F`, with an easier `216‖B‖_F` Gram-only fallback). An exact original-Fock Hilbert–Schmidt pairing `Tr(Q(B)^*Q(C))=(3·2^24/2)⟨B,C⟩_F` on skew B,C is a new future CAR-TRACE-0 proof obligation. **None of these new deductions is Lean-qualified by the running VLY gate or prior BIL-0C green.** No positive original Hamiltonian eigenvalue, mass gap or empirical generation inference follows.

## 12. VLY-0B strictly qualified; JOIN-0A pointwise original gauge bridge staged — 2026-11-10

**VLY-0B accepted:** [run #42926845593](https://github.com/etblink/math/actions/runs/42926845593), exact tested commit `feae0ee52eecaa3c5e496cf62582d6b9ae28e590`, successful original-gram-gamma-and-trace-consumer job `130215369682`, completed 2026-11-11 00:02:51 UTC. Strict marker `VLY0B_ORIGINAL_GRAM_GAMMA_STRICT_PASS`; all 94 pinned blobs, original cold Lean/Mathlib, source and independent trace consumer, allowed axioms only. Its actual source theorem `originalGramGammaCoefficient_gauge_invariant` proves `G_(g·x)(B)=G_x(B)` on real source `GammaMatrix` and genuine `Boson 2`. Direct original color-column `K_x` equality, trace moments and near-valley projectors are NOT established by this gate.

**JOIN-0A new candidate:** Define `originalFockGramObservable x B := BIL0C.originalColorQuadratic (VLY0B.originalGramGammaCoefficient x B)` as an actual bounded complex-linear original `Fermion 2 →L[ℂ] Fermion 2` operator. For any `g : GaugeGroup 2`, `x : Boson 2`, source `B : GammaMatrix` and `v : Fermion 2`, prove
```
fermionGaugeUnitaryHom g (originalFockGramObservable x B v)
 = originalFockGramObservable (bosonGaugeEquiv g x) B
     (fermionGaugeUnitaryHom g v).
```
This is the pointwise genuine G2A boson plus G4E Fock gauge covariance predicted in the independent [JOIN-0 forward memo](../../research/unification/BFSS_JOIN0_SKEW_FOCK_BOUNDED_FIELD_AND_CAR_TRACE_INTERFACE_2026_11_10.md). Its source imports **only qualified BIL-0C and VLY-0B**, not color-column VLY-0B2, proposed skew/spectral decompositions, physical `FullL2`, or unbounded charge-domain assertions. The distinct norm consumer tests preservation under simultaneous boson/Fock gauge transformation using genuine G4E unitarity.

**Qualification requirements:** Separate `bfss-join0a-original-boson-fock-gauge-strict.yml` must freeze all 94 accepted prior Git blobs plus exactly two new JOIN source/consumer blobs, cold pinned build, strict warning controls and printed-axiom audit. **Do not promote JOIN-0A from historical source equivalences or this commit; wait for its own green.** The research-only memo/ledger commit `469b2fe2fef0860e6e54e42963edb3e845a6705b` is an accepted tree ancestor but did not modify any qualified source files.

**Next after green:** JOIN-0B1 real skew preservation; JOIN-0B2 true Fock star/self-adjointness; VLY-0B2 source normalized `K_x` color expansion and independent Frobenius bound; CAR-TRACE-0 faithful 120-dimensional skew-to-Fock Hilbert-Schmidt embedding. Keep the physical `FullL2` gauge-fixed multiplier and all source supercharge-domain/physical spectra as separate later theorems.

## 13. Prepared JOIN-0B stronger source theorem DAG — while JOIN-0A pending (2026-11-10)

See [the exact-source JOIN-0B transpose/star memorandum](BFSS_JOIN0B_TRANSPOSE_STAR_PREPARATION_AND_PROOF_DAG_2026_11_10.md) for checked Lean API paths, donor proof tactics, independent consumers, and stop conditions. No JOIN-0A strict run was polled or modified during this preparation.

**Recommended after JOIN-0A green:**
- JOIN-0B1: `(G_x(B))ᵀ = G_x(Bᵀ)` for arbitrary real source 16×16 B; independent consumer skew preservation for Bᵀ = -B.
- JOIN-0B2: `star(Q(J)) = Q(Jᵀ)` for arbitrary real source spinor-matrix J on **actual original Fermion2**; independent consumer skew adjointness / `iQ(J)` self-adjointness. The general star identity only requires true G1A self-adjoint theta, not CAR.
- JOIN-0B3: combine both to make the source-typed pointwise observable `iQ(G_x(B))` self-adjoint for skew B. Distinct future physical FullL2 multiplication and source charge/domain theorem.
- NORM-0 / CAR-TRACE-0 remain separate original source potential/finite-dimensional trace contracts.

Never claim these proposed general transpose/adjoint identities qualified because VLY-0B and BIL-0C are green. Independent new cold Lean gate, source/consumer hashes and standard axiom check required for each.
