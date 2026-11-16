# BFSS M4 Spin(9) — original Fock HS source audit and unified-branch governance

**Date:** 2026-11-15 Pacific. **Project Lead working branch:** `integration/bfss-unified-research-20261108`.
**Owner directive:** keep forward research, bounded source tests, strict CI, both green and red receipts, roadmaps and any physical proof adapters **on this unified integration branch**. No new side research branch for this workstream. Never touch `main` without a separate explicit request. Historical branches continue to exist, but unified integration is the canonical active research state and Git history preserves every failed experiment.

## The already discovered real source: stronger than merely algebraic covariance

The unified tree, after qualified IBI/Spin(9) imports, already has:

1. `OP3C6AOriginalFockOperatorSpinAction`: exact source `spinGroup source9Quadratic` action by `ℂ`-algebra automorphisms of `Fermion 2 →L[ℂ] Fermion 2`.
2. `OP3C6COriginalFockActiveGammaCovariance`: covariance of literal original **active** 48-real normalized Majorana operator map.
3. `P2bA`, `P2bB1`, `P2bB2`: **physical Fock-Hilbert adjoint**, not source Clifford odd-star, is preserved first on original Majorana generators, then on every complexified Clifford element, then on **every original Fock operator**. `P2bB2.source9Spin_originalFockOperator_global_map_star` is the key theorem.
4. `P2bB3OriginalFockStarAutomorphismAction`: packages the genuine source action as `Spin(9) →* (OriginalFockOp ≃⋆ₐ[ℂ] OriginalFockOp)` on the actual Fock operator carrier. This is already mentioned as accepted in the M4 table of `BFSS_ACTIVE_ROADMAP.md`. When consuming it, requalify its exact imported bytes through cold build and restricted-axiom gates.
5. `T1OriginalFockTraceInvariance`: the actual original full Fock matrix-algebra trace is invariant under this action.
6. `P3OP1AOriginalFockTracePairing`: the genuine trace pairing `Tr(S†T)` is invariant.
7. `P3D5AOriginalFockHilbertColumns`, `P3M2AOriginalFockHSFiber`: the original source operator carrier, which **retains its operator norm**, is `ℂ`-linearly equivalent to a **separately normed** finite Hilbert–Schmidt PiLp2 original Fock column fiber; the trace pairing is its actual complex Hilbert inner product.

**Consequence to test:** on the actual original Fock HS fiber, conjugating the original star-automorphism action via accepted M2A operator/column equivalence should preserve the HS complex inner product. The existing pinned `LinearMap.isometryOfInner` constructor converts this into a genuine `→ₗᵢ[ℂ]` isometry. This is **not** a unitary group representation on the *Fock-vector* carrier and should not be mislabeled as one.

## Current bounded native attempt M4-HS0 — UNQUALIFIED until strict result

- Source `P3M4HS0OriginalSpin9FockHSIsometry.lean`: five named declarations including a literal transported HS column `≃ₗ[ℂ]`, a source operator recovery identity, source trace-derived inner-product invariance, actual HS `→ₗᵢ[ℂ]` map and its application identity.
- Independent `BFSSP3M4HS0OriginalSpin9FockHSIsometryIndependentConsumer.lean`: three source-typed consumers — native Fock HS pairing, norm and recovery of the exact OP3C6A/B3 source operator.
- [Strict M4-HS0 run #43801631165](https://github.com/etblink/math/actions/runs/43801631165), launched after source and consumer were committed **directly to unified integration**. Target: five native-source + three independent-consumer axioms, standard whitelist only `propext`, `Classical.choice`, `Quot.sound`; exact pinned original donors and toolchain Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. **Do not claim this gate green from source existence or CI launch.**
- If red, preserve the exact first causal error, tested SHA, job log and original artifact, then make **one** bounded source or proof-boundary repair on the same unified branch. No speculative new model, unbounded heartbeats, source coefficient change, hidden axioms or side branch.

## The actual next physical implementation gap

Even with a source-correct finite-dimensional `Spin9 →* StarAlgEquiv(FockOp)` and its HS isometry, it does **not** automatically give a coherent linear/unitary Fock-vector **group** action. For a single star automorphism of the full complex matrix algebra, a unitary conjugating implementer exists up to a U(1) phase. Choosing such a unitary independently for each group element yields at best a **projective** group action; coherence, central Spin sign, continuity and the actual original 48-real/Fock CAR action remain additional physical/source tasks.

A potentially reusable formal donor (NOT an installed/pinned dependency) is the public `QICLean.Algebra.SkolemNoetherUnitary` theorem `Matrix.exists_unitary_conj_of_starAlgEquiv_matrix`: https://sirui-lu.com/QICLean/docs/QICLean/Algebra/SkolemNoetherUnitary.html. It covers a **single** finite matrix star-automorphism. Its applicability requires a source-exact original operator-to-matrix equivalence and independent transfer; it is **not** evidence for a continuous source Spin(9) lift or a global group homomorphism. Do not import this external package or pretend it is pinned Mathlib without owner-review and source-matching.

Compare two routes for a next physical bridge:
- **Source 48-real Clifford-even lift:** build a coherent source-Spin9 even-element implementer on original Fock vectors (via original source Clifford action) with the correct star/unitary/sign law. Potentially resolves the projective phase without an arbitrary per-element matrix choice, but requires an explicit group hom and source Lie/Clifford compatibility.
- **Matrix unitary Skolem–Noether:** quickest per-element existence, but a phase/group-law obstruction remains. Use it as a limited mathematical preliminary, not a completed physical implementation.
- **HS/column route:** already strongly supported by T1/OP1A/M2A and does not require constructing a Fock-vector action; it can support a different operator-field covariance route but cannot replace the original Fock-vector supercharge/domain theorem.

**Stop rule:** no claim of physical Spin9 invariant charge domain, native sixteen-charge average, nonzero Spin9-singlet state, original Hardy positivity, fidelity or a mass gap from any HS isometry or matrix-unitary implementer alone. Keep the signed-incidence-to-octonions equivalence as an independent, falsifiable reconstruction test.

## Branch continuity

The combined checkpoint `BFSS_UNIFIED_QUALIFIED_INCIDENCE_SPIN9_MERGE_CHECKPOINT_2026_11_15.md` and accepted [Spin9 abstract R4 #43799204363](https://github.com/etblink/math/actions/runs/43799204363) continue to be the frozen foundation. **All new source changes and evidence live alongside them in this unified branch**, not another promotion PR or a fresh side branch.
