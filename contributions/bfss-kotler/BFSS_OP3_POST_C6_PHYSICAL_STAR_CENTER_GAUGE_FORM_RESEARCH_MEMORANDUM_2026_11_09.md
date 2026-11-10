# BFSS — Post-C6 algebraic-to-physical Spin(9) research and guarded proof roadmap

**Recorded:** 2026-11-09 (America/Los_Angeles)
**Repository:** `etblink/math`
**Research branch:** `integration/bfss-unified-research-20261108`
**Read-only research snapshot:** `675bd7b90bf481848f905a2eba610f704c47ada3`
**Scope:** Source inventory, proof-design hypotheses, falsification checks, and decision gates. **Research memorandum only.** This document adds no theorem, proof acceptance, new CI check, star or unitary implementer, and no spectral claim.
**Run control:** OP3-C6C Run [#42728268316](https://github.com/etblink/math/actions/runs/42728268316) was **in progress when this research was requested**. Its status was **not polled** during the audit. C6C is **CANDIDATE**, not accepted, until its strict outcome is supplied and independently qualified.
**Toolchain:** Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Original source, allowed axioms and frozen Git blob policies continue unchanged.

> Governing constraint: seek the actual mathematics of the undeformed relative SU(2) BFSS Hamiltonian, not an easier substitute. A green gate qualifies only the exact source commit, declaration roots, and audit procedure it tested. Preserve negative results and refrain from promoting headers, candidate source files, exploratory estimates, or analyses to certified statements.

## 1. Accepted upstream position and scientific boundary

The new OP3 source route has crossed the following **strictly checked** algebraic interfaces:
- **C4**: original real Clifford Spin(9) automorphism-valued group homomorphism, [Run #42709755735](https://github.com/etblink/math/actions/runs/42709755735).
- **C5A**: original complexified Clifford pointwise algebra equivalences with real-pure-generator covariance, [Run #42714280905](https://github.com/etblink/math/actions/runs/42714280905) at `a5180f26a40f3d8b74515036bb7907bc0cbdaa10`.
- **C5B**: genuine source Spin(9) action on the *original complex Clifford algebra*, [Run #42716548152](https://github.com/etblink/math/actions/runs/42716548152) at `6beca063add86525506d22a429dedc6e4a09e005`.
- **C6A**: exact M3I-transported source Spin(9) `MonoidHom` to `Aut_ℂ(Fermion 2 →L[ℂ] Fermion 2)`, [Run #42719194702](https://github.com/etblink/math/actions/runs/42719194702) at `53074a6cf2129a00bebd97ea670a9302a1633e23`; 30 frozen blob pins, three roots and independent consumer.
- **C6B**: original all-real-source-vector covariance of the M3I donor Majoranas, [Run #42725375970](https://github.com/etblink/math/actions/runs/42725375970) at `177c5306fee094ba9ccbf6e21d508e94cb544922`; 32 frozen blob pins, two roots and independent consumer.

Write `F := Fermion 2`, `A := F →L[ℂ] F`, `R₄₈(g) := source9SpinOriginalPaired48OrthogonalHom g`, and `α_g := source9Spin_originalFockOperatorAutomorphismHom g`. Then **accepted C6B** gives, for the original donor real-linear map `Γ_D`,
```
α_g (Γ_D(v)) = Γ_D(R₄₈(g) • v)    for every genuine source g and v : Source48Vector.
```
C6C [candidate commit 675bd7b90bf481848f905a2eba610f704c47ada3](https://github.com/etblink/math/commit/675bd7b90bf481848f905a2eba610f704c47ada3) proposes, but has not yet qualified, an exact equality `Γ_D = Γ_active` of original real-linear gamma maps, by standard-basis extensionality from qualified OP3-A1 source-axis equality. If its strict gate qualifies, the same covariance follows for the **active** original normalized Majorana map. Do not attribute the active all-vector theorem to C6B alone.

**This is an algebraic automorphism representation**. The map `α : Spin(9) →* (A ≃ₐ[ℂ] A)` does **not** by itself prove Hilbert-star preservation, Hilbert–Schmidt isometry, topological continuity, SU(2) gauge-operator fixedness, preservation of original gauge-physical Hilbert space, global Fock-vector lift, or compatibility with the closed Hamiltonian and natural domains.

## 2. Physical-star route: source-faithful generation argument

**Main target:** for every actual source `g` and original operator `T`,
```
α_g (star T) = star (α_g T)   -- star = physical Hilbert adjoint on A
```
followed by `StarAlgEquiv.ofAlgEquiv (α_g) ...` and, only if needed, packaging the star-preserving group action.

### 2.1 Verified source inventory, not yet certified as fresh dependencies

- [`SU2BFSSSource48FockGammaSelfAdjointProbe.lean`](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSSource48FockGammaSelfAdjointProbe.lean) — source Git blob `98889cb8607ccc64091165fbca585acb898b9ddc`; contains candidate `sourceNormalizedGamma_selfAdjoint` and `sourceGammaRealLinear_selfAdjoint` at the exact `√2` normalization. The module header explicitly calls this an **unaccepted research candidate**; a strict workflow exists but its green receipt was **not re-adjudicated** in this audit. Its local `maxHeartbeats 320000` is not a precedent for increasing budgets in a new gate.
- [`F1BOriginalThetaBivectorSkewAdjoint.lean`](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/F1BOriginalThetaBivectorSkewAdjoint.lean) — source blob `75cdfab1c25e961ba777c9788e77a3e6e4ee6d70`, candidate exact-source skew-adjointness of unequal-label **unnormalized** theta bivectors; do not confuse `θ` (`{θ,θ}=δ`) with `Γ=√2 θ`.
- [M3I literal original Clifford–Fock equivalence](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1V52M3IOriginalComplexCliffordFockAlgebraEquivProbe.lean) — accepted earlier exact `CliffordAlgebra (source48Quadratic.baseChange ℂ) ≃ₐ[ℂ] (Fermion 2 →L[ℂ] Fermion 2)`, source blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b` and historical gate [#42547700192](https://github.com/etblink/math/actions/runs/42547700192). This is **an `AlgEquiv`, not `StarAlgEquiv`**.
- [OP3-C6B accepted original donor gamma covariance](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6BOriginalFockDonorGammaCovariance.lean) and [OP3-C6C candidate active gamma bridge](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3C6COriginalFockActiveGammaCovariance.lean).

**Foundational star warning:** in pinned [Mathlib `CliffordAlgebra/Star.lean`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/Star.lean), default Clifford star is `reverse ∘ involute` and `star(ι Q v) = -ι Q v`. But original normalized real Fock Majoranas are expected to satisfy `Γ(v)†=Γ(v)`. **Never** transport Clifford's default star through M3I as though it were the Fock Hilbert adjoint. Scalar complex-conjugate-linearity of the physical adjoint is another reason to keep the two involutions distinct.

### 2.2 A proof without enumerating 2^48 Clifford words

Let `M : Cl_ℂ →ₐ[ℂ] A` denote the accepted M3I map. For fixed `g`, define a predicate on the *complex* Clifford algebra:
```
P(x) : (α_g (M x))† = α_g ((M x)†).
```
Then use the pinned [`CliffordAlgebra.induction`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean), whose explicit clauses are `algebraMap`, `ι`, `mul`, and `add`.

- **Scalars:** `M` and `α_g` are ℂ-linear/unital; physical adjoint conjugates ℂ-scalars. Check the exact source operator algebra's `star_smul` and `star_algebraMap` APIs, not real-linear guesses.
- **Generators:** for each `w : (source48Quadratic.baseChange ℂ)` establish the relation from real-pure generator self-adjointness and complex linearity/conjugate-linearity. A general complexified `w` is not self-adjoint; decompose over `ℝ` using the exact scalar extension, or instead isolate a generation lemma for the **real** pure generator subset.
- **Multiplication:** use `star_mul`, `map_mul` and the reversed order; both sides have the same order after star reversal.
- **Addition:** use `star_add` and `map_add`.

A robust alternative is to prove `P` on a source-exact generating *-subalgebra of `A`, show the 48 normalized real gamma generators' complex algebraic span is all `A` via M3I (not an independent Fock model), and extend `P` by `Algebra.adjoin` induction. Pinned `CliffordAlgebra.adjoin_range_ι` and `hom_ext` in the same Basic file are likely useful.

**Important engineering point:** `ι(Q.baseChange ℂ)` ranges over *complexified* vectors. C6B covariance on **pure real vectors** is not directly a proof for arbitrary complex `ι(w)`. The first gate should close that scalar-extension/generator boundary explicitly. Avoid inventing an unqualified complex-conjugation API or writing `sorry` under a convenient extensionality lemma.

The pinned [`StarAlgEquiv.ofAlgEquiv`](https://github.com/leanprover-community/mathlib4/blob/d13f23b723b8a846827a245b89c10fc7d3f11612/Mathlib/Algebra/Star/StarAlgHom.lean) accepts `f : A ≃ₐ[ℂ] A` and a proof `∀ x, f (star x) = star (f x)`. It is a **packaging tool**, not a substitute for that proof.

**Adversarial star control:** choose an explicit normalized real Majorana and a nonreal scalar `i`. If a proposed argument incorrectly asserts that `iΓ` is self-adjoint, stop: `(iΓ)†=-iΓ`. This catches false extension of the real-generator argument and accidental use of Clifford's default star.

## 3. Negative center is an independent falsification gate

The genuine source central `z := source9NegativeCentral` belongs to **the original `spinGroup source9Quadratic`**. [F10U](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10UActualNegativeCentralSO48ImageProbe.lean), blob `353978608b978b00d0e36deb1c1a47c32641ea59`, states the actual original paired `R₄₈(z)=-I₄₈`. [F10V](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10VSourceCentralInvolutionSO48SignActionProbe.lean), blob `4d61948281f17213e2c9ba1dc8ae9c57299c34d3`, records the original central involution and its left/right matrix sign identities. Read their exact independently accepted receipts before importing into a new strict gate.

The accepted C6B donor covariance implies
```
α_z (Γ_D(v)) = Γ_D(-v) = -Γ_D(v).
```
Choose an actual nonzero original source axis; its gamma square is a nonzero scalar by source CAR and M3I injectivity. Thus `α_z ≠ 1` on the **whole** operator algebra. A claim that the full `Spin(9) → Aut(A)` factors through `SO(9)` is false unless one first restricts the carrier so the central action becomes trivial.

A candidate Fock occupancy-parity operator `P_F=(-1)^N` should satisfy `P_F Γ_D(v) P_F⁻¹=-Γ_D(v)`. Using full complex algebra generation then identifies `α_z = Ad(P_F)`. **This identification has not yet been qualified.** It is not the scalar map `T ↦ -T` (which is not a unital algebra automorphism), nor is it automatically the historic `L6H5E8` *bosonic spatial parity* operator. [Historical spatial parity](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AFOriginalSmoothParityInvolutionProbe.lean), blob `c9f71c6929121226788181ce3547979dcfe6afef`, transforms bosonic coordinates `X↦-X` on a smooth core; **different parity, different carrier**.

## 4. After star: Hilbert–Schmidt unitarity, continuity and correct operator-fiber weights

### 4.1 Trace and Hilbert–Schmidt structure

For `S,T : A`, expected
```
⟪α_g S, α_g T⟫_HS
  = Tr((α_g S)† (α_g T))
  = Tr(α_g(S† T))
  = Tr(S† T).
```
The middle equality **needs the new physical-star theorem**; the last equality needs a separately proved *trace invariance of the actual full finite-dimensional endomorphism algebra under its automorphisms*. Do not assume `AlgEquiv` alone implies Hilbert–Schmidt isometry.

An API-first trace lemma could compare the trace of left multiplication `L_T : A→ₗ[ℂ]A` and `L_{α(T)}=α ∘ L_T ∘ α⁻¹`, then relate `Tr_A L_T` to `(finrank ℂ F) • Tr_F T`; exact dimension and nonzero scalar must be proved without enumerating the `2²⁴` Fock basis. Alternative source exact inner-auto theorem is acceptable only if its hypotheses and original carrier are pinned. Independently verify trace before packaging the unitary Hilbert–Schmidt group action.

**Weight warning:** the full operator fiber `A`, not `F`, has the conservative Cartan weight ceiling **M=12**, not the Fock-vector **M=6**. Both are analytical targets until specifically proved. No spectral inequality or highest-weight branching is implied by these constants alone.

### 4.2 Continuity

The original `R₄₈` algebraic map is in [F10R](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean), blob `75a679f2a1435d747e219617feea266b4508c53d`; its header explicitly states **algebraic only**.

Pinned [F10BE](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9V10HF10BEPBWTopologyGammaContinuity.lean), blob `db887aa6e495eb2a74c2e826018ffb5453158806`, provides named PBW normed structures and continuity for the original 16-real gamma representation. Continuity of the literal source 48-by-48 reindex/Kronecker map and then of `g↦α_g` on the **full** Fock operator fiber are still separate source-specific bridges. On the finite complex Clifford generator algebra, an entrywise finite-coefficient transport looks plausible; verify the exact source topology and the target operator/HS topology. An abstract `MonoidHom` is not automatically continuous.

## 5. Source SU(2) gauge compatibility and projection invariance

### 5.1 Reusable qualified/candidate inventory

- [OP2a](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2aOriginalFockGaugeSource.lean), blob `328d607ee2bb45edd4268e5592d784c4c84488a7`: actual source `GaugeGroup 2 →* (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)` via G4-E; strict workflow exists, inherited ancestry must be rechecked for a new consumer.
- [OP2b](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2bOriginalGaugeProjectionBridge.lean), blob `13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec`: literal original SU(2) `Module.End` action, continuous-operator evaluation, gauge-fixed subspace and orthogonal projection `originalFermionGaugeProjection`.
- [OP2c](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP2cNonzeroOriginalGaugeVacuum.lean), blob `a16d3573b737bb4453e42b0b543d63cbbac1cd1b`: actual `fermionVacuum ≠ 0`, SU(2) fixedness, nonzero projection. **This is a Fock-fiber fixed vector, not already a nonzero physical L² state.**
- [OP1 generic star-projection theorem](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/LinearAlgebra/GaugeFixedProjectionOP1.lean), blob `7d76162dd685324903fecdd501b4e602d1a93deb`: `starAlgEquiv_fixed_gaugeFixedProjection` takes an actual `StarAlgEquiv` fixing all exact gauge operators.
- [G4-G](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4GMajoranaModeCovarianceProbe.lean), blob `3714b1042583d91d02c6a39b8e1e8b045e42f1be`, and [G4-H](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSG4HExactThetaCovarianceProbe.lean), blob `7f4a93221c8f1168b274155f482e2f5c61f72786`: actual 24 complex modes and 48 normalized/paired-theta SU(2) color laws; check the `θ` versus `Γ` scalar conventions.
- [S1H source gauge implementer uniqueness](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean), blob `eacab43f1b9112e9e1920e656bdf1166f824a5a8`: under explicit genuine gauge group-representation and **all** original theta covariance premises, the implementer agrees exactly with the original `fermionGaugeLinearHom`, not only projectively. Historical source qualification not rechecked here.

**Real missing bridge:**
```
∀ g : source spinGroup, ∀ h : GaugeGroup 2,
   α_g (originalGaugeContinuousAction h) = originalGaugeContinuousAction h.
```
At the 48-Majorana level, spin-label and color transformations commute because they act on independent source-label factors. But **commuting automorphism actions** only proves that `α_g(U_h)` and `U_h` implement the same color conjugations: their ratio can be a scalar. Recover the exact source gauge-group map and use the source S1H character-triviality argument, with its explicit covariance and group-law hypotheses, to eliminate that scalar. Never infer pointwise gauge-operator fixedness from matrix-label commutation alone.

After qualifying physical star and gauge-operator fixedness, OP1 + OP2b should produce
```
α_g(originalFermionGaugeProjection) = originalFermionGaugeProjection.
```
Keep the actual **left-output** gauge action on operator-valued wavefunctions. The operator's *input* fiber is not transformed by the gauge action in the proposed full-column architecture; conjugating both Fock indices would change the physical model. The [projection feasibility memo](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md) shows the full `End(F)` column architecture can avoid requiring a projected left ideal as the only carrier, if source gauge compatibility is proved.

## 6. Closed Hamiltonian/charge-form frontier

[Original D2B28 concrete normalized Hamiltonian](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD2B28ConcretePairedSU2HamiltonianProbe.lean), blob `031acfec5aabe8f099592c7d2de35f18f961a770`, contains declarations binding the actual `pairedAlgebraData`, `pairedGaugeData`, physical Hilbert space and source normalized self-adjoint Hamiltonian `H=(1/16)T†T`. It includes:
- `pairedSU2PhysicalHamiltonian_selfAdjoint`;
- `pairedSU2PhysicalHamiltonian_weakForm_iff`;
- `pairedSU2PhysicalHamiltonian_closed`;
- `pairedSU2PhysicalHamiltonian_domain_dense`.

**Its header is explicitly prospective**, and its exact strict receipts/ancestry have **not** been verified in this audit. Source file presence is not acceptance.

The future operator-column route must prove on the **actual original smooth physical core** the covariance of all sixteen original supercharges under a correctly defined source Spin(9) full-space action and output representation. After establishing source core invariance and a graph-core property, transport covariance to the **closure of the original charge** and its complete natural form domain, then show that the actual normalized physical Hamiltonian reduces to the appropriate Spin(9) isotypic sectors. A core equality without a graph-core/domain proof is insufficient. Nor does a conditional historical unitary transfer create a new eigenpair.

Analytic holds remain: source-exact confinement inequality, true Spin(9)→Spin(8) branching and whole-isotypic oscillator exclusion (not just exclusion of one test vector), nonempty original physical high-type sector, near-valley adversarial escaping-state test, compactness of the actual weighted form embedding and positive point-spectrum existence. The undeformed theory's continuous spectrum at zero must **not** be renamed a positive mass gap.

## 7. Decision gates, hard stops and reusable negative knowledge

| Gate | Minimal original-source theorem or audit | Qualification / hard stop |
| --- | --- | --- |
| **P0 — provenance** | Collect exact source/consumer strict receipts for original gamma self-adjointness, OP1/OP2, F10U/V, G4G/H, S1H and D2B28. Check imports, full blob closures, original `θ/Γ` normalization and pinned source labels. | A header or inherited `.olean` is not a green qualification; uncertain sources stay candidate. No source search or proof mutation needed. |
| **P1 — central sign (parallel)** | Source `z=-1` acts as `-I₄₈` and `α_z Γ_D(v)=-Γ_D(v)` on a proved nonzero real Majorana; optional genuine Fock occupation-parity conjugation identification. | A scalar `-1` action on `End(F)` or silent `SO(9)` descent is FALSE. Spatial parity ≠ Fock occupation parity. |
| **P2a — real generator adjoint** | Strictly qualify `Γ_active(v)†=Γ_active(v)` and the corresponding donor equality via C6B/qualified C6C. | Never import Clifford default star as physical adjoint; no complex `iΓ` self-adjointness. |
| **P2b — full star** | Prove `α_g(T†)=α_g(T)†` on the entire original `Fermion 2 →L[ℂ] Fermion 2` using source-exact gamma generation; package `StarAlgEquiv.ofAlgEquiv`. | Pointwise gamma covariance is not automatically a global star theorem; close the complexified-generator and scalar-anti-linearity boundary. |
| **P3 — finite HS action** | Actual matrix-algebra trace invariance, HS isometry, and source PBW continuity of `g↦α_g` on original operator fiber. | Do not infer either from algebraic `MonoidHom` alone. Weight `M=12` must be proved in this carrier. |
| **P4 — gauge** | Prove `α_g(U_h)=U_h` with original G4-H covariance and character-triviality; then OP1 projection preservation. | Commutation of CAR adjoint actions does not remove projective scalar obstruction. Preserve left-output gauge action. |
| **P5 — physical core** | Original full-space Spin(9) action, source sixteen-charge covariance and gauge-physical smooth-core invariance. | Only exact source fields/normalizations; no imported independent model as surrogate. |
| **P6 — closed form** | Actual graph/domain invariance, source `(1/16)T†T` weak-form equality, reducing sectors and separately established coercivity/compactness. | No extrapolation from finite Fock algebra or a merely dense non-core set to closed operator spectra. |

**Recommended next operational task:** complete P0 **read-only source-receipt audit**, then start P2a/P2b as separately consumer-tested Lean gates if C6C qualifies. P1 is an inexpensive independent falsifier and can be worked in parallel. P3/P4 can then proceed along partially independent routes. Resist the urge to make P5/P6 consequences of algebraic success by assertion.

## 8. Methodology preserved from the recent OP3 gate sequence

Recent reds were informative and repaired only within strict boundaries:
- C5A: `rw` failed beneath tensor/coerced `AlgEquiv` expression; use typed `congrArg` through the exact context, rather than retuning a theorem.
- C6A: a preflight literal guard incorrectly demanded the original source Clifford type be restated in a child consumer; test the authoritative pinned ancestor instead.
- C6B: an unbalanced closing parenthesis caused parse errors and downstream `sorryAx`; close source syntax before interpreting proof-goal failures.
- Do **not** increase heartbeat budgets, change the physical model, inflate the import graph, hide source noncompliance with a dummy literal, or infer mathematical significance from a preflight/parser red.
- Preserve the exact tested commit, original/source/consumer Git blob closure, independent cold compilation, `autoImplicit false`, warnings-as-errors, and exact `#print axioms` roots admitting only `propext`, `Classical.choice`, `Quot.sound`.

**Evidence and status policy:** This memo reflects a bounded source inspection at the snapshot above. No new Lean theorem, spectral inequality, Spin(9) vector lift or physical domain result is claimed. New gates must be accepted individually on their exact commits by independently audited, source-pinned CI.

### Research reference set
- [Original Fock Spin(9) and closed physical form integration memorandum](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_ORIGINAL_FOCK_SPIN9_PHYSICAL_FORM_INTEGRATION_MEMORANDUM_2026_11_08.md)
- [Full original operator-column feasibility and representation weights](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_SPECTRAL_FORWARD_RESEARCH_COMPACT_SPIN9_OPERATOR_COLUMNS_2026_11_06.md)
- [Original gauge-fixed projection feasibility memorandum](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_SPECTRAL_GAUGE_FIXED_PROJECTION_FEASIBILITY_2026_11_08.md)
- [Original representation source-binding audit](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_SPECTRAL_SOURCE_EXACT_REPRESENTATION_BINDING_AUDIT_2026_11_07.md)
- [Original spectral confinement roadmap](https://github.com/etblink/math/blob/675bd7b90bf481848f905a2eba610f704c47ada3/contributions/bfss-kotler/BFSS_SPECTRAL_CONFINEMENT_ROADMAP_2026_11_06.md)

