# BFSS × QIT × SCC — W0C2B1 R1 frozen original Fock Jacobi and covariance-closure microgate

Date: 2026-11-17 Pacific. **NEW PROSPECTIVE GATE. MATHEMATICAL QUALIFICATION NOT YET CLAIMED.**

Project Lead authorization: work on `integration/bfss-unified-research-20261108` only. Never change `main`, existing accepted source/consumer/workflow bytes, original historical archives, or their negative knowledge. Do not retry the stopped W0C2B0 real-source architecture.

## Accepted exact source ancestry

Latest accepted source-exact **P3-M4-W0C2B0N R1** strict [#44260119108](https://github.com/etblink/math/actions/runs/44260119108) GREEN at `d66a948cfd9741fd4f9428471d9e7f559228276f`; source blob `c5841055363a6eef713f35e568409dd2fa2b6c9e`, independent consumer blob `3773f069d3da87c7c899596817f02efec639fbfa`, strict workflow blob `d431d74251ba5826baf312534fd6578424306643`. Original ZIP artifact #14407892726, 3,975 bytes SHA-256 `e68c0260726275649427ee7d4e02c8c954504fd5fd228cd86a7f9a58e0f12761`; ZIP Git blob `3e57a0e7205dc6f34c6f3da90ff3056fa63943ea`, full log blob `43186ecee898599b9f21e02b2484543e24e79790`, SHA-256/CRC manifest blob `4a2e00c318f0b202ebafda249bc6be81e3f0532c`. Independent preservation [#44261708018](https://github.com/etblink/math/actions/runs/44261708018) GREEN; acceptance commit `814b6a6c06d2dedc190c5f3f463c633a1a79da1a`, independent post-acceptance roadmap [#44262068152](https://github.com/etblink/math/actions/runs/44262068152) GREEN. **26 accepted anchors**.

Qualified reusable donors:
- `P3M4QTC0AOriginalFockWeightedQuadraticCovariance.lean`, Git blob `b0b519e46566856e100bf6aa882f9fcdf37d397e`, already has qualified public `originalFock_commutator_complex_smul` and a **private** (not importable) `originalFock_commutator_sum` on the genuine `Fermion 2` bounded complex-linear Fock operator algebra.
- `P3M4W0C2B0MOriginalFockComplexNestedCoefficientR2.lean`, blob `b98cc05a012c98da8016496492d77135fc58ebc8`, accepted source-exact matrix coefficient action and coefficient-matrix bracket, original strict [#44255202048](https://github.com/etblink/math/actions/runs/44255202048) GREEN, independent original archive by #44257915520 GREEN.
- `P3M4LB1C1OriginalSource48SkewKMajoranaCovariance.lean`, blob `c2e7a7c665121283cde13ae5dabc183362b6b420`, contains accepted original `[K(A),Γ_k] = ∑_p A_{pk}Γ_p` under **real skew A**, not a global Lie bracket.
- `P3M4W0C2B0NOriginalSource48RealComplexCoefficientAdapter.lean`, blob `c5841055363a6eef713f35e568409dd2fa2b6c9e`, accepted genuine original real-to-complex Source48 coefficient and matrix commutator transport.
- `P3M4W0C2AOriginalBivectorLieDefectTraceBridge.lean`, blob `51c4b4ab238bcc0f897822a7da4d9fc74dfd55fb`, proves zero trace and **conditional** full K bracket given all-48 gamma centrality, which remains unproved.

Pinned Mathlib commit `d13f23b723b8a846827a245b89c10fc7d3f11612` contains the verified `noncomm_ring` tactic at `Mathlib/Tactic/NoncommRing.lean`. It expands noncommutative ring expressions by distributivity/associativity and additive normal forms: no commutation of Fock products is introduced.

## Exact first atom: four theorem statements on true original Op

Use only the actual `Op := Fermion 2 →L[ℂ] Fermion 2`. Import the qualified W0C2B0M source (transitively QTC0A) and `Mathlib.Tactic`. Do not define a replacement matrix/operator space.

1. **Finite sum linearity** `originalFock_commutator_sum`, public in the new module:
```lean
T * (∑ i : ι, f i) - (∑ i : ι, f i) * T =
  ∑ i : ι, (T * f i - f i * T)
```
Proof by the exact qualified QTC0A private donor architecture `Finset.mul_sum`, `Finset.sum_mul`, `Finset.sum_sub_distrib`.

2. **Weighted finite sum linearity** `originalFock_commutator_weighted_sum`, for arbitrary `c : ι → ℂ`:
```lean
T * (∑ i : ι, c i • x i) - (∑ i : ι, c i • x i) * T =
  ∑ i : ι, c i • (T * x i - x i * T)
```
Use root 1 then **qualified** QTC0A `originalFock_commutator_complex_smul` pointwise by `Finset.sum_congr`.

3. **Original operator Jacobi action** `originalFock_commutator_jacobi`:
```lean
(T * U - U * T) * X - X * (T * U - U * T) =
 (T * (U * X - X * U) - (U * X - X * U) * T) -
 (U * (T * X - X * T) - (T * X - X * T) * U)
```
Use `noncomm_ring` only. Do not assume `T*U = U*T`, turn products into commutative products, or claim Jacobi for unbounded BFSS physical Hamiltonians.

4. **Conditional coefficient covariance Lie closure** `originalFock_commutator_covariance_bracket`. For arbitrary finite `ι`, `T U : Op`, `x : ι → Op`, `A B : Matrix ι ι ℂ`, and explicit hypotheses `hT : ∀k, T*x k-x k*T=∑p, A p k•x p`, `hU : ∀k, U*x k-x k*U=∑p, B p k•x p`, prove
```lean
(T * U - U * T) * x k - x k * (T * U - U * T) =
 ∑ q : ι, (A * B - B * A) q k • x q
```
First Jacobi (root 3), then both covariance hypotheses, then weighted sum linearity (root 2), then pointwise hypotheses and qualified W0C2B0M `originalFock_complex_nested_coefficient_bracket`. Sign/order matters: `δ_T(δ_U x) - δ_U(δ_T x)` corresponds to **`A*B-B*A`** on column coefficient actions. The theorem is conditional on generic covariance; do not silently substitute the original `K(A)` or assert its all-48 gamma defect centrality at this gate.

## Independent strict qualification

New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4W0C2B1OriginalFockJacobiCovarianceAction.lean`; independent importer `lean/diagnostics/BFSSP3M4W0C2B1OriginalFockJacobiCovarianceIndependentConsumer.lean`. Exactly four original `#print axioms` roots, four independently importing consumer roots, and four original `Fermion 2` controls (including the conditional matrix-covariance closure), six negative auditor mutations. Allow only `propext`, `Classical.choice`, `Quot.sound`; no `sorry`, `admit`, `unsafe`, `maxRecDepth` or `maxHeartbeats`. Lean 4.34.1, pinned Mathlib; isolated workflow, SHA-256 exact original source/consumer/workflow and qualified donors. Retain all W0C2B0M/N original accepted and stopped native RED evidence. Strict workflow must save source/consumer/diagnostic logs on GREEN and RED.

Promote only after exact native source+consumer CI GREEN, positive and negative axiom-auditor checks, independent Git preservation of original provider ZIP, full Actions transcript and per-member SHA-256/CRC; then canonical **27th** accepted anchor and independent post-promotion roadmap GREEN. Two comparable native REDs from this architecture trigger stop, never broaden resources or retry unchanged.

## Claim ceiling and forward roadmap

This gate only proves the **true original Fock operator algebraic commutator action** and its generic coefficient covariance closure under explicit premises. It does not prove the source-specific original covariance hypotheses anew (LB1C1 already qualifies them under skewness) or assemble them into `∀k, Commute (originalSource48K_lieDefect A B) (sourceNormalizedGamma k)`.

The next prospective **W0C2B2** must integrate source-exact skew-`K(A)` covariance from LB1C1, real-to-complex Source48 transport from W0C2B0N, complex nested coefficient contraction W0C2B0M, and conditional Jacobi closure W0C2B1. Only if that proves all-48 gamma centrality, separately combine with W0C2A trace/centralizer to prove the full original bivector bracket. Global Spin9, physics gauge/parity domains, normalizable ground state, spectral gap, mass gap and SCC operational capacity remain unproved.

Truth-first stopping rule: preserve original GREEN and RED provider artifacts; no statement weakening, no surrogate operators, no main branch changes.
