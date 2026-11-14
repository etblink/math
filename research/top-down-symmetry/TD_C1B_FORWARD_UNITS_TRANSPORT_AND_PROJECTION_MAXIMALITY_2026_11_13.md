# TD-C1B forward investigation — units transport and the missing projection maximality premise

**Date:** November 13, 2026 Pacific. **Classification:** SOURCE-REVIEWED RESEARCH DESIGN plus exact finite negative controls; NO new Lean qualification. **Concurrent R4:** #43546806160 tests 454fad941b2b4b7e8bc54014420ad83087914a2d; its outcome is not inferred or polled by this investigation. Original probe files are unchanged.

## 1. Findings that change the next proof design

1. The transformed gauge representation can be packaged using **existing group-to-units and units-to-equivalences interfaces**, without a fresh inverse/adjoint construction for every Fock operator.
2. The historical projection-shortcut memo's conventional proof uses the entire gauge-fixed subspace, but its abbreviated generic-lemma checklist omits that essential premise. The weakened checklist is false even after adding idempotence. Preserve this as negative knowledge and correct the proposed contract before implementation.
3. The original OP0/OP2b source already supplies exactly the missing full-range information. This defect affects a prospective generic interface, not an accepted BFSS theorem or the source-defined canonical projector.
4. Source S1H requires a genuine group representation and exact theta covariance. Its displayed theorem has no extra continuity or Hilbert-isometry hypothesis. The source-specific theta join remains the key mathematical obligation.

## 2. Non-obvious reuse: transport through units

Let F denote the literal original Fermion 2 and A=F→L[ℂ]F. Let U:G→*A be the genuine source SU2 gauge action packaged at continuous-operator level; its identity/multiplication laws must be tied to G4E, not assumed from the unbundled function.

For fixed source Spin g, let alpha=source9Spin_originalFockOperatorStarAlgEquiv g. Define the algebraic hom W(q)=alpha(U(q)). Because q ranges over a **group**, W(q) is automatically invertible with inverse W(q⁻¹). Its inverse does not require a new Hilbert-adjoint theorem.

Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 provides:

| Exact interface | File | Role |
| --- | --- | --- |
| MonoidHom.toHomUnits; MonoidHom.coe_toHomUnits | Mathlib/Algebra/Group/Units/Hom.lean | Lift any group-to-monoid hom to units using the source group inverse |
| ContinuousLinearEquiv.unitsEquiv; unitsEquiv_apply | Mathlib/Topology/Algebra/Module/Equiv.lean | Convert units of the literal continuous-operator algebra to continuous linear equivalences |
| ContinuousLinearEquiv.toLinearEquivMonoidHom | Same file | Forget continuity while retaining a genuine multiplicative linear-equivalence representation |
| StarAlgEquiv.toAlgEquiv | Mathlib/Algebra/Star/StarAlgHom.lean | Expose the already given algebraic operator action |

**Uncompiled composition sketch:** W=(alpha.toAlgEquiv.toAlgHom.toMonoidHom).comp U; then compose W.toHomUnits with (ContinuousLinearEquiv.unitsEquiv ℂ F).toMonoidHom and ContinuousLinearEquiv.toLinearEquivMonoidHom. The result has precisely S1H's target type G→*(F≃ₗ[ℂ]F). Validate pinned coercions in a generic interface check before native specialization; this text is not a claim of Lean elaboration success.

The two source-interface identities to isolate are V_g(q)(ψ)=alpha(U(q))(ψ) and the source G4E continuous-operator hom law. Pin their source bytes and exercise nonidentity operators in a future independent consumer.

**Scope:** this packages a SU2 representation for each fixed g. It does not construct a Fock-vector Spin9 representation, and continuity of each bounded operator is not joint continuity in either group parameter. Physical-star preservation is unnecessary for this packaging step, but remains needed in the later orthogonal-projection argument.

## 3. What S1H still needs, exactly

Original source SU2BFSSPhysicalDomainS1HSourceGaugeCovariantImplementerUniquenessProbe.lean blob eacab43f1b9112e9e1920e656bdf1166f824a5a8 takes:

- V:GaugeGroup 2→*(Fermion 2≃ₗ[ℂ]Fermion 2);
- for every original q, SpinIndex alpha, ColorIndex A and Fock vector psi,
  V(q)(pairedTheta alpha A psi)=sum_B (pairedAlgebraData.adjointCoefficient q A B:ℂ) • pairedTheta alpha B (V(q) psi).

It then identifies V with the complete original fermionGaugeLinearHom. S1G's displayed source proof removes the scalar character using exact original SU2 curves, quarter-turn conjugations, halving and Euler factorization. It does not add a continuity premise to the S1H theorem.

**Source-specific join design, conditional on TD-C1A:**
- Use original all-label gauge covariance, OP3C6C Spin-gamma covariance and C48 source Spin/color matrix commutation.
- Obtain alpha(Uq) Gamma(w)=Gamma(Cq w) alpha(Uq), using w=Sg v and surjectivity of the actual source Sg, or the explicitly sourced inverse group element. No inverse orientation is guessed.
- At the actual source axes, use C48C1A1a.sourceGammaAxis_eq_originalGaugeTheta and C48C1A1c0.originalS1J_axis_gamma_color_sum. Those separately bind the normalized gamma, unscaled source theta and source S1J column orientation.
- Cancel the nonzero common complex scalar sqrt(2) **at operator level**, through a generic scalar-cancellation lemma if needed, before evaluating on a Fock vector. Do not introduce repeated native real-linear vector maps or silently drop normalization.
- Match the literal source output-B/input-A coefficient before invoking S1H. A transpose, relative phase, unqualified F18 replacement or only-axis claim at the wrong preimage is a stop condition.

All listed original donor roots require exact source/consumer provenance at the future join gate. Displayed source and prospective comments are not new acceptance receipts.

## 4. Exact counterexample to the weakened projection interface

The weakened prospective claim is:

alpha fixes every Uq; P*=P; P²=P; Uq P=P  ==> alpha(P)=P.

Take the trivial SU2 representation on C², Uq=I for every q, P=diag(1,0), and alpha(T)=S T S* with S exchanging the two coordinates. Every listed premise holds, but alpha(P)=diag(0,1) differs from P.

The issue is **maximality**: P projects onto only part of the fixed space, which here is all C². For T=alpha(P), every Uq T=T, but P T=0 differs from T. A second exact control uses the nontrivial C2-group action diag(1,1,-1) on C³ and the same swap inside its two-dimensional fixed space. It gives the same failure for a one-dimensional subprojection. Replacing it with P=diag(1,1,0) gives a positive control with a nonidentity automorphism and a nonzero proper canonical projection.

These examples were explicitly derived before computation. **33ee88545363001b9296c2a71e7111cf3a472fdb** preregisters only their deterministic reproduction, E-TD-C1B-PROJ-CONTRACT-001. The committed script research/top-down-symmetry/tools/check_projection_fixedness_contract.py was executed with Python integer arithmetic. Script blob 66a0d5973104d7bdd9104a88293825432e3cdb24; script SHA-256 e64aa4bb4c0fd42dbf66054cf6ed9f58af570fbb050953b393ab46f335c21dd3; raw JSON research/top-down-symmetry/TD_C1B_PROJECTION_CONTRACT_EXACT_CONTROLS_2026_11_13.json, SHA-256 a20d921925092e81460cebb84104c742ac25635baf6c995f0591466b07887fbd. Both negative examples satisfy every weak premise and violate the conclusion and absorption. The positive control passes. **Verdict: weakened generic contract FALSIFIED.** This is not a BFSS counterexample or Lean qualification.

## 5. Corrected sufficient abstract contract and proof

For a star-algebra automorphism alpha and represented operators Uq, require:

- exact pointwise alpha(Uq)=Uq;
- Uq P=P for every q;
- star P=P;
- **universal absorption:** for every operator T, if every Uq T=T then P T=T.

The absorption condition is the missing source-binding premise. With these assumptions:

1. Multiplicativity gives every Uq alpha(P)=alpha(P), hence P alpha(P)=alpha(P).
2. alpha.symm fixes each Uq. The same absorption condition applied to alpha.symm(P) gives P alpha.symm(P)=alpha.symm(P).
3. Apply alpha: alpha(P) P=P.
4. Take physical star: P alpha(P)=P.
5. Compare steps 1 and 4: alpha(P)=P.

This is a complete conventional conditional argument, not a compiled theorem. Idempotence is not an additional necessary premise in this formulation: absorption applied to T=P already gives P²=P.

**Reuse the original range interface rather than reconstructing the projector:** OP0 range_le_gaugeFixedSubspace and OP2b originalFermionGaugeProjection_range show that T's gauge-fixed outputs lie in range P. OP2b's existing idempotence then gives P T=T by evaluating on any vector, selecting its preimage under P and using P²=P. This avoids rebuilding Submodule.starProjection or reopening its finite-dimensional completeness witnesses. Pinned Mathlib Submodule.starProjection_eq_self_iff gives a second valid derivation if needed.

Original OP0 source blob 98b2c65be8054b4587a3b7a1c258f00dffbdaeae; original OP2b source blob 13a80bb53eb3d0ca357e4c87db4bd3ebd53854ec. P2bB3 source physical-star action blob b50ef04695587b267ad8519074b1293f98828749. Their exact current source was read; no source definition was changed.

## 6. A weaker future target worth retaining

Pointwise gauge-unitary fixedness is sufficient, but setwise normalization of the represented gauge family by alpha and alpha.symm also preserves the canonical fixed-space projection. The same absorption proof applies with the gauge elements reindexed. This is a possible generalization, not a newly established native source shortcut. The present source Spin/color action is designed to commute exactly, so retain S1H as the immediate native target rather than introduce an unnecessary alternative gate.

## 7. Bounded next sequence

1. Await the focused R4 interface receipt; no new strict run is launched by this research.
2. If it succeeds, prepare original TD-C1A full strict qualification without changing its native consumer.
3. Future TD-C1B representation packaging should use generic units transport, then source G4E binding.
4. Future theta covariance should cancel normalization at operator level, then invoke source S1H with its full explicit premise.
5. Future projection fixedness must consume the corrected absorption/range contract, with exact negative and nonidentity positive controls.

M5BF0/G0B2 remain accepted. TD-C1A stays RED_UNQUALIFIED pending its own qualification process. No full physical Spin9 action, closed Hamiltonian covariance, auxiliary gap, ground state, mass gap or unification is claimed.
