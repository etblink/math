# BFSS OP3-A — first operational milestone: donor/active source-axis crosswalk

**Date:** 2026-11-09  
**Branch:** `integration/bfss-unified-research-20261108`  
**Planning baseline:** `db5ba04a27f756613d113faa4dc1f6a6022d4091`  
**Status:** R0 read-only API/source inventory complete; OP3-A1 Lean candidate and strict workflow submitted for qualification. **No theorem is accepted by this memorandum.**

## 1. Relation to the flexible roadmap

This is gate **R0 → R1 / OP3-A1** in [the flexible research roadmap](BFSS_FLEXIBLE_RESEARCH_ROADMAP_AND_GUARDRAILS_2026_11_09.md). It eliminates one original-source compatibility ambiguity before transporting the Spin(9) action through the accepted complexified source Clifford/Fock equivalence. The objective is the original relative SU(2) BFSS operator action, **not** an easier substitute representation or automatic spectral claim.

**Qualified prior input:** [M3H/M3I strict #42547700192](https://github.com/etblink/math/actions/runs/42547700192), tested `741e629e228e83071f757ab4adc5588715136fd1`: source complex Clifford algebra `ℂ`-`AlgEquiv` to the genuine `Fermion 2 →L[ℂ] Fermion 2`, with independent consumer and exact rooted axiom checks. **Also accepted:** F1 CAR half antisymmetry [#42654797722](https://github.com/etblink/math/actions/runs/42654797722). Neither establishes the missing global Spin(9) star automorphism or the blocked literal F1F finite-sum equality.

## 2. Exact source inventory and comparison

The original source label is `Source48Label` (48 real Majoranas) and the original vector carrier is `Source48Vector`. In the historical donor S1V52L9E4 module, `SourceLabel` is an abbreviation for `Fin 24 × Fin 2` and its map has exact type `Source48Vector →ₗ[ℝ] (Fermion 2 →L[ℂ] Fermion 2)`. The active `sourceGammaRealLinear` has exactly the same carrier types and returns continuous complex-linear operators on the same 24-mode Fock space.

| Item | Exact active Git blob / theorem | What has been inspected |
| --- | --- | --- |
| Original BFSS | `Core.lean` `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | Physical `Fermion 2`; no surrogate Hilbert space |
| Block/color and real source axis | `SU2BFSSPhysicalDomainS1V5ConcreteSixteenSourceColorBlocksProbe.lean` `fad0eab5014aa038ddb0bf8411b0e81c358e7908` | `RealSpinBlock = Fin 8 × Fin 2`, `ColorIndex 2 = Fin 3`, `sourceBlockColorAxis (j,s) A`, explicit `sourceBlockColorLabel` |
| Original G1A label identity | `SU2PairedThetaLabelCrosswalkProbe.lean` `f3a2b41f902a20f6fe237ecce18dd7e869e9c45e`; `S1V7` `218a419500ca208a2bc26e1528a11b62fa3802f0` | Donor G1A `pairedLabelEquiv` is not identified with `thetaLabelEquiv` by an unproved default ordering |
| Existing normalized source-label equality | `SU2BFSSSource48FockIndexBridgeProbe.lean` `6d732c1acea271b7aba948c95755ac73d2d0fc0a` | `sourceBlockColorMajorana_eq_G1APairedTheta`: actual source-label theta equals original donor paired theta |
| Historical donor normalized axis | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52L9E2OriginalFockMajoranaSourceCliffordAxisNormalizationProbe.lean` `1095d164cb0716ef5c9f80e8e0fdbc4ebd8e19d2` | `originalNormalizedFockMajorana (j,s) A := (↑(Real.sqrt 2) : ℂ) • originalG1A.pairedTheta (spinPairEquiv.symm (j,s)) A` |
| Active normalized gamma | `SU2BFSSSource48NormalizedFockGammaProbe.lean` `7abc03723b3111e4a03389b722054e50d6a9bf30` | `sourceNormalizedGamma p := (↑(Real.sqrt 2) : ℂ) • majoranaCandidate p` |
| Historical donor real gamma map | `OperatorDependencies/SU2BFSSPhysicalDomainS1V52L9E4OriginalFockRealLinearCliffordGeneratorMapProbe.lean` `d1a6194ac68fef46ca99de45beb46d15ccb32c79` | `originalFockGammaRealLinear_sourceAxis (j,s) A` evaluates exactly to donor normalized Majorana |
| Active real gamma map | `SU2BFSSSource48RealLinearGammaProbe.lean` `a9f446ea7986ca796c2f4b222a5ab710d98590cc` | `sourceGammaRealLinear_axis j s A` evaluates exactly to active `sourceNormalizedGamma (sourceBlockColorLabel (j,s) A)` |
| Complex donor generator and equivalence, **not asserted by A1** | `M2` `a5e2f46797b60f196423086a0d52aa7f1f2a14f2`, `M3I` `754a5f2a13baea90312f6031eb8fa7963dbdf42b` | M2 `originalComplexCliffordFockAlgHom_generator` on `1 ⊗ₜ[ℝ] v`; M3I `originalComplexCliffordFockAlgEquiv_apply` identifies donor complex action |

**Exact normalization:** Original `majoranaCandidate p` is the delta-one CAR generator with `θ_p² = (1/2)I`. The actual source Clifford quadratic form assigns `Q(e_p)=1`, so `Γ_p=(↑(Real.sqrt 2):ℂ) • θ_p`. Changing to unscaled `θ_p`, a negative square root or a different pairing is forbidden. Equality of original label maps is proved by the crosswalk, not guessed from `Fintype.equivFin`.

## 3. The OP3-A1 minimal new proofs

New source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OP3AOriginalCliffordFockGeneratorAxisCrosswalk.lean`.

1. `donor_normalized_eq_active_source_axis (j : Fin 8) (s : Fin 2) (A : ColorIndex 2)`: original donor `originalNormalizedFockMajorana (j,s) A` equals active `sourceNormalizedGamma (sourceBlockColorLabel (j,s) A)`. The proof unfolds **only the two small normalized generator names**, then rewrites using the already-proved `sourceBlockColorMajorana_eq_G1APairedTheta`. This is not a 48-label big-operator equality.
2. `donor_real_gamma_eq_active_on_source_axis`: donor `originalFockGammaRealLinear` and active `sourceGammaRealLinear` agree when applied to the identical original axis `sourceBlockColorAxis (j,s) A`. A three-step `calc` invokes the two independently established source-axis evaluations and the new normalized-generator crosswalk, without exposing the two giant finite sums.

Independent consumer: `lean/diagnostics/BFSSOP3AOriginalGeneratorAxisCrosswalkIndependentAudit.lean`. It separately imports and checks both exact theorem statements at the same original 24-mode Fock continuous-linear operator type and validates actual axis application.

**OP3-A1 intentionally does not assert:** equality of these two full real-linear maps on arbitrary `Source48Vector`, M2/M3I `AlgHom` / `AlgEquiv` generator equation on a complex Clifford input, global source Spin(9) action, star, center, gauge, Hamiltonian, spectral, or production F1F result. These are distinct, named later gates.

## 4. Independent acceptance and possible red decisions

Dedicated workflow: `.github/workflows/bfss-op3a-original-generator-axis-crosswalk-strict.yml`, branch `integration/bfss-unified-research-20261108`. It pins **13 exact source/toolchain/consumer Git blobs**, including original physical core and M2/M3I provenance, Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. The gate cold-builds actual donor L9E4, active gamma and new crosswalk; separately compiles source and independent consumer; demands **two exact declaration-root axiom reports in each**, with only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`/errors/unexpected warnings. Immutable tested commit and logs are retained. Approved third-party Mathlib package-dirty status messages are distinguished from source warnings exactly as in the already accepted M3I gate. No recursion-depth, heartbeat, mathematical axiom, or model changes.

If the first theorem fails: stop and classify whether donor `G1A` paired-theta name and active `Source48Label` differ or whether a proof rewrite crosses a concrete definitional boundary; split the label identity and `sqrt(2)` scalar transport as separate **small** test statements. If the first passes but the second recurses: the donor and active source-axis **evaluations** remain independently valid, but the joint source theorem stays unqualified; do not try a full-map `simpa` or inflate budgets. If both pass: accept **only** source-axis compatibility, then design OP3-A2 to bind the M2 `CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) (1 ⊗ₜ[ℝ] e_p)` value and M3I algebra equivalence to the exact same active source gamma, via an independently proved source-axis chain.

**Priority after OP3-A:** OP3-B exact SO(48) quadratic isometry; OP3-C complex Clifford automorphism; OP3-D source full-Fock operator action; OP3-E star, parity center and continuity. The parallel whole-sector exclusion remains conditional with full-operator fiber `M=12`. Gauge/physical closed-domain and spectral results are **not established** by this workflow.

## 5. Research decision

The R0 inspection found an already proven, source-faithful G1A pairing crosswalk and identical required positive Clifford normalization, with the historical M3I equivalence already accepted. **Reuse these.** The smallest additional source theorem is the normalized-axis and donor/active map-axis compatibility. Any green is admitted only by the exact new strict gate; any red is recorded as negative proof-engineering knowledge and evaluated before another gate. The purpose is reducing the gap to the **actual** original source Spin(9) operator action, not accumulating unrelated green declarations.

## OP3-A1 initial red #42661987249 — missing namespace-level G1A paired-label equality

**First-cause evidence, 2026-11-09:** [Run #42661987249](https://github.com/etblink/math/actions/runs/42661987249), attempt 1, tested `ef31c905ceb42e828a194a8de0198406fca73547`, job `129315648029`, terminal **RED**. Strict exact 13-file blob/toolchain preflight completed; Lean 4.34.1 and pinned Mathlib restored; the donor L9E4, active gamma and all inherited original-source parents cold compiled. The new OP3-A1 source `.olean` **failed** at `OP3AOriginalCliffordFockGeneratorAxisCrosswalk.lean:38:64` with `unsolved goals`; this was **not** a recursion-depth/timeout failure. The failed proof had used `rw [FCP.BFSSSource48FockIndexBridge.sourceBlockColorMajorana_eq_G1APairedTheta]` after unfolding the original donor and active normalized gamma names. That existing theorem rewrites the active source Majorana into `FCP.BFSSPairedThetaLabelCrosswalk.pairedTheta`, while donor L9E2 uses the distinct historical namespace `FCP.BFSSSU2GaugeG1A.pairedTheta`. The remaining exact goal was
`(↑√2 : ℂ) • BFSSSU2GaugeG1A.pairedTheta (BFSSSU2GaugeG1A.spinPairEquiv.symm (j,s)) A = (↑√2 : ℂ) • BFSSPairedThetaLabelCrosswalk.pairedTheta (BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j,s)) A`.
A supposed pointwise correspondence was **not** yet a proved cross-namespace equality. The red roots printed `sorryAx` by compiler recovery, so neither of the original two OP3-A1 theorems nor its independent consumer/axiom check was accepted. [Evidence artifact #13695368129](https://github.com/etblink/math/actions/runs/42661987249/artifacts/13695368129), runner ZIP SHA256 `f145aa73995443ce4daede43f4d5e107e4c89313136c3b6e3d947e7913be1739` (not independently downloaded).

**Repair architecture:** Instead of pretending the two `pairedTheta` definitions match definitionally or rewriting ever larger operators, prove an explicit tiny original 48-label equality first:
`BFSSSU2GaugeG1A.pairedLabelEquiv (BFSSSU2GaugeG1A.spinPairEquiv.symm (j,s), A) = BFSSPairedThetaLabelCrosswalk.pairedLabelEquiv (BFSSPairedThetaLabelCrosswalk.spinPairEquiv.symm (j,s), A)`.
Both actual accepted G1A and active paired-label definitions contain the same explicit `finProdFinEquiv` packing, so the proposed proof expands *only* their equivalence application and applies `Equiv.apply_symm_apply`. This is an independently checked assertion, **not** an unproved definitional assumption. Next, use the accepted `FCP.BFSSS1V7.sourceBlockColorLabel_eq_original_paired` as a second small step to reach the actual source label. Transport the resulting exact label equality through `p ↦ (↑(Real.sqrt 2) : ℂ) • majoranaCandidate p` using `congrArg`. Only then reuse accepted donor/active `sourceAxis` evaluation lemmas to prove the second real-linear map-axis claim.

**Guardrails and verdict:** Exact original 48-label and `Fermion 2` operators, positive `√2` normalization, Lean/Mathlib pins, all pre-existing parent blobs, cold source and independent consumer verification, forbidden source warning/`sorryAx` rejection and allowed foundational axiom set remain unchanged. Add one precise source-label parent, update OP3-A1 proof and consumer, and change the strict gate from two to **three exact roots in both source and independent consumer**. A green would qualify **only** source-label, normalized original Fock gamma and source-axis real-linear equality. No full-linear-map, M2/M3I generator-equivalence, global Spin(9) star action, source physical Hamiltonian or spectral claim. If the label equality itself fails, do not continue symbolic Fock rewrites: inspect the explicit G1A `colorModeEquiv`/`spinPairEquiv` packing in that small goal and correct the actual source convention rather than guessing.
