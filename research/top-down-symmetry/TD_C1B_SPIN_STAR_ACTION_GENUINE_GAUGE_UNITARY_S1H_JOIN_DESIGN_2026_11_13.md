# TD-C1B — source Spin(9) star action fixes genuine SU(2) gauge unitaries: exact S1H join design

**Date:** November 13, 2026 Pacific. **Classification:** SOURCE-BOUND RESEARCH DESIGN ONLY; NO NEW LEAN THEOREM/ACCEPTANCE. **Operating candidate:** TD-C1A strict [#43536957727](https://github.com/etblink/math/actions/runs/43536957727), source tested `5564c2f15044326f34f16d8a06c1cba7e131a958`, cold source/consumer status to be checked before any promotion.

## 1. Precise original source diagram and meaningful new question

Take original real Majorana label vector `v : Source48Vector`, `Gamma(v)=sourceGammaRealLinear v : Fermion 2 →L[ℂ] Fermion 2`, original actual SU2 gauge unitary `U_q=FCP.BFSSSU2GaugeG4E.fermionGaugeUnitaryHom q`, original gauge color matrix `C_q=FCP.BFSSSU2PhysicalDomainS1J.sourceRealMajoranaMatrix q`, original Spin9 label orthogonal `S_g=source9SpinOriginalPaired48OrthogonalHom g`, and original Spin9 star automorphism `α_g=source9Spin_originalFockOperatorStarAlgEquiv g`.

The needed identities are the following, with literal source types, matrix transpose/order and inverse conventions:

1. Gauge all-vector intertwining: `U_q Gamma(v) = Gamma(C_q v) U_q`; **pending** full-real-vector microgate TD-C1A, derived from the historically accepted source C48C1A1d0 basis-axis theorem.
2. Spin all-vector covariance: `α_g(Gamma(v)) = Gamma(S_g v)`; original source OP3C6C `source9Spin_originalFockOperatorAutomorphismHom_activeGamma`, historically verified.
3. Spin/color commutation: `S_g C_q = C_q S_g`; original C48C0/C48C0B source comparison with the genuine S1J color matrix.
4. Source α is an algebra and physical-star automorphism with correct group law; original P2bB3 source star action. No continuous vector implementation is assumed.

**Decisive next statement:** for every original g and q, as equality of actual continuous complex Fock operators,

`α_g (U_q) = U_q`.

## 2. Exact purely algebraic proof route with no Fock-vector Spin lift

Define for fixed source Spin g the transformed original gauge operator `V_g(q)=α_g(U_q)` (with the original unitary U_q coerced to continuous linear operators). Given the all-real-vector TD-C1A theorem, on any original gamma `Γ(v)` one has

`V_g(q) Γ(v)`
` = α_g(U_q) α_g(Γ(S_g⁻¹ v))`
` = α_g(U_q Γ(S_g⁻¹ v))`
` = α_g(Γ(C_q S_g⁻¹ v) U_q)`
` = Γ(S_g C_q S_g⁻¹ v) V_g(q)`
` = Γ(C_q v) V_g(q)`.

The second equality uses only Spin-gamma covariance for the inverse source group element, the fourth uses the accepted original gauge intertwiner, and the last uses the exact source C48 matrix commutation. No guessed Spin9 action on physical Fock vectors appears.

Because α_g is multiplicative and unital, `q↦V_g(q)` is a monoid representation in invertible continuous Fock operators. Physical-star preservation ensures unitary operators remain unitary (though for **S1H** only complex-linear invertibility is necessary). Construct the exact source `GaugeGroup 2 →* (Fermion 2 ≃ₗ[ℂ] Fermion 2)` whose underlying continuous maps are `V_g(q)`; do not assume Lean will infer this representation from bare invertible elements without supplying inverses and the group law.

Translate `V_g(q) Γ(v)=Γ(C_q v)V_g(q)` at each original axis into **the exact hV assumption** of [S1H source](../../lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean):

`V_g(q) (pairedTheta α A ψ) = Σ_B (pairedAlgebraData.adjointCoefficient q A B : ℂ) • pairedTheta α B (V_g(q) ψ)`.

Use the already accepted active-gamma normalized `√2` axis and source S1J color matrix bridges, keeping the input-A/output-B sign and order. S1H's `original_source_gauge_representation_unique` then gives **exact equality with the genuine original fermionGaugeLinearHom**, not mere equality up to a character. Thus α_g(U_q)=U_q in the literal operator algebra. The source S1H uniqueness eliminates the dangerous possible central phase, subject to its explicit hV input.

## 3. From fixed gauge unitaries to the genuine original fixed projection

Import original OP2b `originalFermionGaugeProjection`, the orthogonal projection onto the source fixed subspace defined as an intersection of actual `ker(U_q−id)`, not as a Haar integral. Once `α_g(U_q)=U_q` is strict GREEN, prove `α_g(P)=P` by the conditional star projection argument from [Nov 12 projection shortcut](../spectral-p2-original-field/P3_GAUGE_PROJECTION_SPIN_FIXED_ALGEBRAIC_SHORTCUT_2026_11_12.md): all outputs of α_g(P) are fixed by U_q, so `P α_g(P)=α_g(P)`; the same argument for inverse α and physical adjoint implies `P α_g(P)=P`; hence equality.

The source full Fock-operator algebra has dimensions `dim_C End(F)=2^48`, while physical Fock **vectors** have `dim_C F=2^24`. Even proving α_g(P)=P does not produce a continuous Fock-vector Spin9 representation, a source-equivariant Hilbert-space subspace decomposition or physical Hamiltonian covariance. Those remain separate C2-stage obligations.

## 4. Minimal falsifiable microgate sequence

- **TD-C1A (in strict CI):** original gauge unitary intertwinement for all 48 real labels, one root and native consumer.
- **TD-C1B0:** derive source Spin/covariance and label commutation on the inverse group element in the exact S1J matrix convention, without reconstructing gamma CAR.
- **TD-C1B1:** construct the literal transformed gauge `GaugeGroup 2 →* (Fermion 2 ≃ₗ[ℂ] Fermion 2)` from α_g(U_q); verify multiplicativity, inverses and original standard Fock carrier.
- **TD-C1B2:** prove original S1H hV for that transformed gauge representation using B0 and TD-C1A all-label covariance; identify with genuine gauge via S1H.
- **TD-C1B3:** original OP2b fixed orthogonal projection is invariant under source Spin star automorphism (operator-algebra-only). One independent consumer per meaningful join; no monolithic proof.

**Stop rules:** If TD-C1A all-vector proof reveals an actual mismatch in S1J index orientation, stop and preserve first-causal. If V_g cannot be given a source LinearEquiv representation satisfying hV, do not invoke uniqueness. If α(Uq)=χ_g(q)Uq for a nontrivial character, that would contradict the intended S1H hypothesis; explicitly identify the failed premise rather than declaring the phase away. If α fixes the projection but cannot lift to physical Fock-vector Spin9, preserve the narrower operator-algebra conclusion. No BFSS ground state, compactness, original mass gap, GUT/ToE conclusion or NFC empirical support follows.

## 5. Provenance

Historical ed.0.4 internal monograph Chapters 7–9; source OP3C6C blob `2d6f777568b0026737112ff8256e5ed50fc9e6e6`, C48C0 blob `9f9a5ce2186ded98a251efbc24c2b66f416044d5`, C48C0B S1J identification, C48C1A1d0 blob `4d418ade58f8c3c1d998f623f5a5697723cb3d29`, P2bB3 blob `b50ef04695587b267ad8519074b1293f98828749`, S1H blob `eacab43f1b9112e9e1920e656bdf1166f824a5a8`, OP2b blob `13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec`.

## 6. Forward source review — November 13, 2026 (research only)

[Units transport and projection-maximality investigation](TD_C1B_FORWARD_UNITS_TRANSPORT_AND_PROJECTION_MAXIMALITY_2026_11_13.md) refines this uncompiled plan. Package the transformed SU2 operator hom through MonoidHom.toHomUnits, ContinuousLinearEquiv.unitsEquiv and ContinuousLinearEquiv.toLinearEquivMonoidHom; verify the underlying literal G4E operator before applying S1H. This uses the original group inverse and does not require new adjoint proofs for representation packaging. It does not supply a Spin9 Fock-vector action or joint continuity.

For projection fixedness, require full fixed-space range or its universal absorption property in addition to gauge-fixed outputs and physical self-adjointness. The shortened historical generic checklist is falsified by exact matrix counterexamples. Original OP0/OP2b range and idempotence provide the missing premise. Keep normalization cancellation at operator level and evaluate only after the theta identity is established. No new Lean gate is staged here; R4 #43546806160 remains independently pending.
