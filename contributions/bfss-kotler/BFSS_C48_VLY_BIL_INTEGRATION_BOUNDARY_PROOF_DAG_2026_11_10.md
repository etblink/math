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
