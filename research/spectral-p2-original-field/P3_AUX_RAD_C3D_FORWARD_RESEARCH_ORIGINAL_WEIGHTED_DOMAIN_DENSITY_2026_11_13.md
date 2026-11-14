# BFSS P3-AUX RAD-C3D — forward research on density of the true original weighted charge domain

**Date:** 2026-11-13 Pacific. **Track:** read-only mathematical investigation, then research-documentation preservation. **Status:** PROSPECTIVE / NOT LEAN-QUALIFIED. **Active parent under test:** `6dfd221d486b74244f34de6fa051d0f2ec9162fa`, strict [RAD-C3 #43570463487](https://github.com/etblink/math/actions/runs/43570463487). **No new proof source, consumer or CI in this workstream.**

## Question and source exact observation

Does the inverse-image weighted charge `Sε` on original physical Hilbert input `E=pairedGaugeData.physicalSpace`, with original sixteen-output Hilbert `K=PiLp 2 (fun _ : SpinIndex => FullL2 2)`, have a **dense domain** for every regularization parameter `ε>0`?

Its proposed graph is `(u,z)∈graph(Sε) ↔ (u,B16ε z)∈graph(T)`, with `T=originalMinimalPhysicalHilbertChargeColumn M G` (actual AY minimal original charge, not a deformed model) and `B16ε` the **accepted** RAD-C2B original output reciprocal (strict #43568618192, source blob `45aa19082616ae874bf642f336d9a7c5fa1fd6f9`). The graph and closedness are **being tested** in RAD-C3 and not counted as accepted here.

The original repository already has the following matching source interfaces:

1. **Core.lean** blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`: `SmoothCore N = TestFunction ⊤ (Fermion N) ⊤` (compact support); `M.charge α : SmoothCore N →ₗ[ℂ] SmoothCore N`; `M.chargeVector f` has components `coreToL2 (M.charge α f)`; `coreToL2_ae` identifies source representatives. No change to original Fock carrier or charges.
2. **H5E8AU** `SU2BFSSPhysicalDomainL6H5E8AUOriginalMinimalClosedChargeLinearPMapProbe.lean`, blob `389bd4318cbc389db226691bbccecaa78c6c6c3e`: `originalMinimalCoreGraph M G` contains each `(coreToL2 f.val, M.chargeVector f.val)` for `f : G.invariantCore`; its closure is the exact original minimal closed graph.
3. **H5E8AY** `SU2BFSSPhysicalDomainL6H5E8AYOriginalPhysicalHilbertChargeGraphProbe.lean`, blob `a9f27a48852ac570aedc8e0ab88d683250e6b138`: canonical `J=originalMinimalHilbertOutputEquiv : K≃L[ℂ](SpinIndex→FullL2 2)`, source physical-input graph membership equivalence `originalMinimalPhysicalHilbertChargeGraph_mem_iff`, and the literal original physical charge partial operator and graph.
4. **H5E8AZ** `SU2BFSSPhysicalDomainL6H5E8AZOriginalPhysicalChargeDomainDensityReductionProbe.lean`, blob `b69166ba7b1118e3542ba826e73aa4f95f575c3c`: `originalMinimalPhysicalHilbertChargeColumn_core_mem_domain` and `originalMinimalPhysicalHilbertChargeColumn_domain_dense_of_coreNormClosure_eq`. The source proof uses `Subtype.dense_iff` and physical core range inclusion.
5. **Original Haar** `SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe.lean`, blob `7b116f1efa2dd62cc5188b3ff2d2cf38ecd7bd9a`: `sourceCoreNormClosure_eq_physical_unconditional M G : G.coreNormClosure=G.physicalSpace` at N=2. This was imported into accepted **H5E8BA** `SU2BFSSPhysicalDomainL6H5E8BAOriginalPhysicalChargeUnconditionalDensityProbe.lean`, blob `3ab254088e3fa2aea7622807b6b10e7eabc6fc8a`, and accepted **P3M3W0D0** source blob `86823abdddb70d1c2158f8e215fb35760e107fd5`, strict #43484147197; the old result proves original unweighted physical `T` has dense natural domain, *not* that the new weighted `Sε` does.
6. **RAD-C2A** true original FullL2 reciprocal AE cancellation and injectivity accepted strict #43566927415; **RAD-C2B** true sixteen-output bounded reciprocal with coordinate formula and injectivity accepted strict #43568618192. **R0A** original radial `wε(x)=sqrt(‖x‖²+ε²)` is positive with pointwise complex cancellation, blob `a67f8740586588c6d4ee9c9148574c81c14d4937`; **G0B0** AE action `Bε f = (wε)⁻¹ f` accepted strict #43523896876, blob `670cc600fdc42a03d21de759e8b46b6cb1306874`.

## Proposed mathematical proof (not yet compiled)

For `f : G.invariantCore`, put `u_f=⟨coreToL2 f.val, f.property⟩ : G.physicalSpace`. For every source spin index `α` let `gα=M.charge α f.val : SmoothCore 2`. Then each `gα` is smooth and compactly supported in the *original* bosonic configuration variable. Since `x↦(originalRadialWeight ε x:ℂ)` is continuous and finite everywhere, its product with `gα` is continuous and compactly supported. Thus its original-Fock-valued `FullL2 2` class exists:

\[
v_{f,ε,α} := [\, x\mapsto (w_ε(x):\mathbb C)\,g_α(x)\,]_{L^2} .
\]

Set `z_{f,ε}=J.symm (fun α => v_{f,ε,α}) : K` using the *actual AY* finite sixteen-component Hilbert equivalence (a distinct compact support set for each finite α is fine). Original G0B0 AE evaluation and R0A scalar cancellation give `Bε v_{f,ε,α} = coreToL2 gα`. By accepted RAD-C2B coordinate action:

\[
J(B_{16,ε}z_{f,ε})_α = B_ε v_{f,ε,α}
= (M.chargeVector\,f.val)_α .
\]

Consequently `B16ε z_{f,ε}=J.symm (M.chargeVector f.val)`; by the **source original core graph** (H5E8AU) and **native AY rebasing**, `(u_f,B16ε z_{f,ε})∈T.graph`. Once RAD-C3 succeeds, membership identifies `(u_f,z_{f,ε})∈Sε.graph`. Hence *every* original invariant smooth-core input belongs to the true weighted partial-charge domain:

\[
\{u_f:f\in G.invariantCore\}\subseteq D(S_ε).
\]

The original D2B10C Haar theorem proves the closure of that core image is `G.physicalSpace`. Therefore:

\[
\boxed{\overline{D(S_ε)}=G.physicalSpace\quad\text{for every }ε>0.}
\]

**This last statement is a derived candidate, not an accepted Lean theorem.** Note that mere density of the older unweighted `D(T)` does *not* alone establish weighted density: we specifically need **range membership** `Tf∈Ran(B16ε)` for each dense core input, as constructed above.

## Efficient independent Lean gates after RAD-C3

**RAD-C3D-A (scalar/vector output-range witness):** establish for arbitrary `g : SmoothCore 2` and `ε>0` the existence of `v : FullL2 2` with `Bε v=coreToL2 g`, by `continuous.memLp_of_hasCompactSupport`, `HasCompactSupport.smul_left`, G0B0 AE formula, and R0A cancellation. No assumption of globally bounded `wε`. Avoid proving `ContDiff` of `wε` or constructing a global inverse continuous linear map; neither is necessary. Cold native source and genuine original FullL2 consumer only.

**RAD-C3D-B (native sixteen-component source core graph):** instantiate A on `M.charge α f.val` for each `α : SpinIndex`; combine the resulting witnesses by `PiLp.continuousLinearEquiv` / `WithLp.toLp`; use exact AY original core graph membership and prospective RAD-C3 `graph_mem_iff` to show `u_f∈D(Sε)` for every `f:G.invariantCore`. Independent concrete `pairedAlgebraData/pairedGaugeData` consumer. Do not expand the gamma algebra or Fock action.

**RAD-C3D-C (density and nonzero):** recycle the original H5E8AZ `Subtype.dense_iff` / `closure_mono` argument and D2B10C `sourceCoreNormClosure_eq_physical_unconditional` for `N=2`; conclude density of native weighted domain. Separately, source G4K2B original physical nonzero witness and topology prove `D(Sε)` nonzero without asserting the witness itself lies in `D(Sε)`. These are distinct proof roots with an independent original paired physical input consumer.

## Important stop rules and alternative routes

- No assumption that the original **unweighted** graph's dense domain is automatically contained in the new **weighted** domain. This implication is generally false without a range/core argument.
- No globally bounded inverse of `Bε` or `B16ε`, no surjectivity onto all original `FullL2`/AY `PiLp`, no global operator norm estimate for `wε`.
- No reliance on the G0B3 physical-space preservation result to prove graph-domain density: the **weighted output** resides in ambient `K` and need not itself be gauge invariant; Gauss invariance is in the input `G.physicalSpace`.
- Distinguish the partial map defined by an **inverse-image graph** from maximal weighted pointwise charge multiplication; maximal-domain equality, graph cores, regulator independence and strong/weak form equality are separate obligations.
- No new zero-regulator graph, Hardy/Spin(9) singlet theorem, auxiliary spectral gap, ground-state fidelity or physical BFSS mass gap from this density argument.
- Do not change the current RAD-C3 source/workflow or launch a competing strict build while #43570463487 remains in progress. Promote this plan only after the running RAD-C3 strict result and source/consumer/axiom review.

## Preliminary failure modes and negative knowledge

1. Using `Bε.injective` without constructing `v` proves *uniqueness* of any weighted output but not *existence* for dense original core inputs. Build the compact-support witness first.
2. Claiming that `T` dense implies `Sε` dense bypasses `Ran(B16ε)`, and is unsound.
3. Global smoothness of `sqrt(‖x‖²+ε²)` can be true for `ε>0` but is not needed here. Avoid an expensive `ContDiff` detour; continuity plus compact support and original `MemLp` lemmas are sufficient.
4. `G.invariantCore` and `G.physicalSpace` are different types; use the same `coreToL2` subtype coercion already verified in H5E8AZ, then `Subtype.dense_iff` instead of ad hoc equality of embedded spaces.
5. Do not mistake a passing roadmap administrative test for a source mathematical GREEN. Each new gate needs frozen original donor pins, independent original consumer and strict root allowed-axiom audit.

**Disposition:** Original-source-reviewed forward research with explicit next three candidate microgates; no theorem promotion and no concurrent proof/CI modifications.
