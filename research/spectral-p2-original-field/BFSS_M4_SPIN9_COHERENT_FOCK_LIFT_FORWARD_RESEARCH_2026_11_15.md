# BFSS M4 — coherent Spin(9) Fock lift, source-exact central sign, and operator-HS alternative

**Date:** 2026-11-15 Pacific. **Branch:** `integration/bfss-unified-research-20261108` ONLY, per owner.  
**Status:** READ-ONLY MATHEMATICAL RESEARCH + documentation. No new Lean theorem/CI qualification is asserted by this memo. The parallel M4-HS0 cold strict gate [#43801631165](https://github.com/etblink/math/actions/runs/43801631165) was in progress when research began. This document-only commit must not be counted as a new compiler qualification.

## Main finding — the source is already a genuine 48-real representation

The source original paired 48-real label action is not a generic analogy:

- `SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean` supplies `source9SpinOriginalPaired48OrthogonalHom`, constructed using *exactly* `pairedColorSpinEquiv` and the original three-color identity tensor `1₃ ⊗ κ₉(g)`; this retains the original 24 mode ×2 Majorana ordering rather than a color-major surrogate.
- `SU2BFSSPairedSpin9V10HF10RSourceSpinOriginalPaired48SOHomProbe.lean` supplies `source9SpinOriginalPaired48SpecialOrthogonalHom : spinGroup source9Quadratic →* Matrix.specialOrthogonalGroup Source48Label ℝ`.
- `OP3C6AOriginalFockOperatorSpinAction.lean` and `OP3C6COriginalFockActiveGammaCovariance.lean` transport that exact action through the original Fock/complex Clifford AlgEquiv and prove **all-real-vector original active Majorana covariance**.
- `P2bB2OriginalFockGlobalPhysicalStar.lean`, `P2bB3OriginalFockStarAutomorphismAction.lean` prove/represent the physical-Hilbert-adjoint star automorphism action on ALL original continuous Fock operators (as a group-valued `MonoidHom`); `T1OriginalFockTraceInvariance.lean` and `P3OP1AOriginalFockTracePairing.lean` prove genuine trace and HS pairing invariance.
- `P3M2AOriginalFockHSFiber.lean` gives a **distinct** normed Hilbert–Schmidt PiLp2 fiber, equivalently represented by true original Fock operator columns. The original continuous operator space **retains its operator norm**.
- This chain is in the unified source; check exact imported bytes against individual historical acceptance whenever it is used in a new strict gate. Presence of source text or a source comment labeled accepted is not an independent new qualification.

## A. The missing Fock-vector implementer is a *coherent lift*, not merely an individual unitary

Let `A = End_ℂ(𝓕)` where the genuine finite original `𝓕 = Fermion 2` and `α : Spin9 → Aut⋆(A)` is the existing B3 group action.

For a fixed `g`, a finite complex matrix-star automorphism is inner: there is a unitary `W_g` with `α_g(T) = W_g T W_g⁻¹`. But `W_{gh}` and `W_g W_h` may differ by a scalar phase. Consequently, per-element implementability **does not establish** `Spin9 →* (𝓕 ≃ₗᵢ[ℂ] 𝓕)`. The phase cocycle or an explicit Clifford-even lift must be resolved. An external example of single-matrix implementation is QICLean's `Matrix.exists_unitary_conj_of_starAlgEquiv_matrix`; it is **not** a pinned repository/mathlib dependency and is not imported here.

**Proposed source-faithful route:** exploit the already proved original `ρ₄₈ : Spin9 → SO(48)` built from THREE true real-16 source spinor copies. Classically, the faithful real-16 spinor representation of simply connected Spin(9) admits a continuous lift to Spin(16), and direct sums of such orthogonal representations lift into Spin(48). The source-free geometric precedent is Thomas Friedrich's *Weak Spin(9)-Structures on 16-dimensional Riemannian Manifolds* (section 2, explicit lifted spin representation and center-volume sign): https://arxiv.org/pdf/math/9912112 .

A complete source theorem would involve

```text
source9_to_originalSpin48 :
  spinGroup source9Quadratic →* spinGroup source48Quadratic
cover_comp_lift_eq_original_rho48 :
  ∀ g, sourceSpin48Cover (source9_to_originalSpin48 g) =
    source9SpinOriginalPaired48SpecialOrthogonalHom g
original_Fock_spin48_unitary :
  spinGroup source48Quadratic →*
    (Fermion 2 ≃ₗᵢ[ℂ] Fermion 2)
Fock_conjugation_matches_source_B3 :
  ∀ g T, α g T = U g * T * (U g)⁻¹
```

These are **hypothetical interfaces**, not extant declarations. The second must respect literal `Source48Label` and original `pairedColorSpinEquiv`; `source48Quadratic` is the positive Euclidean form with the normalized original axis gamma squared to ONE.

For a spin element in the positive source even Clifford algebra, its product of normalized **self-adjoint** real Fock Majoranas is a plausible unitary implementer. Critical subtlety: Mathlib's general Clifford `star (ι v) = -ι v` does NOT match the physical Fock adjoint on odd generators, which are self-adjoint. Restrict an adjoint-compatibility bridge to **even** products before using `spinGroup.star_mul_self`. The existing `SU2BFSSSource48FockBivectorStarCompatibilityProbe.lean` proves a two-generator version (its prior source comment warns about its standalone historical qualification). Do not assert a global odd-generator `StarAlgHom`.

**Clifford-sign convention caution:** Friedrich uses the **negative-definite** real Clifford form, with unit vectors squaring to `-1`; the project's `source9Quadratic` and `source48Quadratic` use a **positive** unit-axis convention (normalized Fock gamma axes square to `+1`). The abstract group-lift existence is transferable, but the paper's explicit volume-word sign cannot be copied into Lean without a source-exact convention and orientation check. The actual source central `-1 → -I₄₈` theorem remains independent of that convention.

**Topology cost:** the existing source `ρ₄₈` is an **algebraic** `MonoidHom` into original paired SO48; continuity and simply-connected/covering structure are NOT provided just by this type. Mathlib has `IsCoveringMap.existsUnique_continuousMap_lifts` (https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Homotopy/Lifting.html); invoking it requires independently source-bound original `Spin9` topology/simply-connectedness, continuous `ρ₄₈`, a certified `Spin48 → SO48` covering, and a basepoint. It produces a continuous lift first; **multiplicativity still needs its own proof** (e.g. uniqueness of lifts on connected `Spin9 × Spin9`). This may be the most expensive path, and source K1D18/K1D9 topological/central modules deserve a focused reuse audit before coding.

## B. A falsifiable CENTRAL SIGN gate is already almost available

The unified source contains unusually strong negative-control information:

- `SU2BFSSPairedSpin9V10HF10TSourceSpin9NegativeCentralMembershipProbe.lean`: constructs genuine `source9NegativeCentral ∈ Spin9` with underlying Clifford scalar `-1`.
- `...F10UActualNegativeCentralSO48ImageProbe.lean`: proves its **exact original paired-48 SO image is -I₄₈**, hence not the identity.
- `...F10VSourceCentralInvolutionSO48SignActionProbe.lean`: proves centrality, square one, and left/right sign action.
- `OP3C6COriginalFockActiveGammaCovariance.lean` transports that source label action to the genuine original Fock active gamma operator. Consequently the planned source-exact theorem is
  `α(source9NegativeCentral)(sourceGammaRealLinear v) = - sourceGammaRealLinear v`.
  It follows directly from already available covariance, `(-I₄₈).mulVec v=-v` and real linearity; verify an exact typed Lean theorem and independent consumer before marking it qualified.
- For an actual original unit axis `v`, `sourceNormalizedGamma_sq_one` gives `Γ(v)^2=1`, so `Γ(v) ≠ 0`. Thus a putative `U(source9NegativeCentral)` that is the identity **or any scalar operator** cannot implement this gamma sign reversal. **This distinguishes a false lift immediately without needing a global Spin48 covering theorem.**
- On the canonical 24 creation/annihilation pairs, if normalized Majoranas are `c_{2j-1}=a_j+a_j†` and `c_{2j}=i(a_j†−a_j)`, then `c_{2j-1}c_{2j}=i(1−2N_j)`, and the ordered product of all 48 normalized Majoranas is `i^24 (-1)^F = (-1)^F`. Thus the source-central implementer should be a **parity-type operator up to an overall phase**, with order-two group law reducing that phase to a sign. **The exact equality/sign is NOT proven for the actual `pairedTheta` convention and must be checked against `pairedColorSpinEquiv` before being adopted.** Explicit Clifford-volume sign can detect an orientation or Majorana normalization error. The original unnormalized CAR theta squares to 1/2, which is precisely why `sourceNormalizedGamma` uses `sqrt 2`.

This is a more diagnostic next unit gate than implementing a new full central character from scratch. Its earliest valid partial result is source-central operator gamma sign (with independent axiom control), not a claimed Fock unitary.

## C. The HS/column path produces an operator-field singlet, NOT a physical Fock-vector singlet

The running **M4-HS0** theorem transfers B3 star action across M2A `OriginalFockHSFiber` and uses `P3OP1A.source9Spin_originalFockTracePairing_invariant` to obtain an isometry of the **correctly normed operator-HS fiber**. Only when exact source and independent consumer CI pass can it be accepted.

Because any algebra automorphism fixes the unit, `α_g(1)=1` for all g. This gives a nonzero Spin9-invariant vector **inside the HS OPERATOR fiber**. Its HS squared norm is `Tr(I†I) = dim_ℂ(Fermion 2) = 2^24`, so the canonical unit HS operator is `I/2^12` (in the source's dimension convention). If a nonzero radial L² scalar `f(x)` is available, `f(x) I/2^12` is a candidate Spin9-invariant original **operator-valued** L² field under the simultaneous original bosonic action. Additional source-intertwining and measure-preservation proofs are needed for that field assertion.

**Hard negative control:** `I/2^12` is not an element of the original `Fermion 2` Fock-vector space; it is an operator in `End(Fermion 2)`. It therefore **does not** prove existence of a nonzero original physical `FullL2 2` singlet. Any automated roadmap promotion from operator-field invariant to physical singlet would be logically invalid.

A cost-effective follow-on once HS0 is green is a coherent **HS-fiber group action** `Spin9 →* (OriginalFockHSFiber ι ≃ₗᵢ[ℂ] OriginalFockHSFiber ι)`, transported from B3, with pointwise trace pairing and operator-unit fixed-vector consumers. HS0 only constructs a linear isometry for each g; the group law for isometries should be proved separately, without invoking a Fock-vector implementer. Extending it to original operator-valued L² requires an independently source-accurate bosonic pullback/measure-preserving action.

## D. Revised decision table and next strict experiments

| Path | What it would establish | Gap / proof cost | Scientific ceiling |
| --- | --- | --- | --- |
| **M4-HS0 → HS1** | True unitary group action on original **operator Hilbert–Schmidt columns**, source-star/trace invariant | HS0 cold/consumer result pending; HS1 group hom and inverse/isometry packaging are small | Not a Fock-vector unitary, no physical charge covariance |
| **Central-sign microgate** | Falsifiable `Spin9(-1)` action on literal 48-real gamma operators, distinguishing nontrivial parity-type implementation | Exact typed negative matrix-vector and normalized gamma square bridge; comparatively small | Does not construct a full Spin9 Fock-vector lift |
| **Explicit source Spin9→Spin48 lift** | Global coherent original Fock-vector implementer with central sign and source gamma conjugation | Requires continuity/covering or explicit even-Clifford representation, all in source label order; potentially large | Still must prove combined bosonic pullback, gauge commutation and charge-domain covariance |
| **Per-element unitary via matrix automorphisms** | Every individual B3 star automorphism is inner | Projective phases and globally coherent group law persist | Never label single-element innerness as a physical representation |
| **Bottom-up original charge-square difference** | Direct actual 16-charge norm equality potentially without global physical Spin9 group action | Native source algebra and physical operator form/domain | Independent comparator; avoid making global Spin9 lift a logically required step when it is not |

**Research priority (conditional on HS0 CI):** First complete the source-exact HS1 group packaging (it reuses more accepted machinery with minimal risk); in parallel pursue the **one-lemma central-sign negative control**. Compare their results to the previous original spinor-square-difference route before spending CI on the expensive global Spin48 covering lift. A failure of center sign is a fatal counterexample to any proposed Fock-vector implementer; a green HS isometry is not a physical-state theorem.

## Governance and falsification

All future source/diagnostic/evidence changes must be **on the existing unified integration branch** only. All red outcomes receive first-causal diagnostics and preserved artifacts before bounded repairs. Do not alter original source normalization, source 48-label ordering, accepted Lean axioms or frozen toolchain pins to make a prospective theorem succeed. No edit to `main`, no speculative 11-dimensional geometry claim, no GUT/gap/existence claim.

Relevant public mathematical sources for background, **not source acceptance**:
- [Mathlib Clifford SpinGroup API](https://leanprover-community.github.io/mathlib4_docs/Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.html).
- [Mathlib covering-space continuous lift](https://leanprover-community.github.io/mathlib4_docs/Mathlib/Topology/Homotopy/Lifting.html).
- [Thomas Friedrich, Weak Spin(9)-Structures](https://arxiv.org/pdf/math/9912112).
- [Finite-dimensional CAR representations, Cambridge University Press](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/D6AC1C3AF2A1268458481C995F5D6482/9781009290821c12_313-336.pdf/canonical_anticommutation_relations.pdf).
