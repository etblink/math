# MASSLESS-D0b0 — natural maximal massless source multiplier domain is a complex submodule

**2026-11-22 UTC** (evening of Nov 21 Pacific). Project Lead. **Initial status: STAGED / NOT YET STRICT QUALIFIED**. Research-only `research/bfss-hopfion-gut-counterfactuals-20261121`; eventual source-only integration into `integration/bfss-unified-research-20261108` requires independent candidate CI. No changes to `main` or unified branch.

## Objective: a genuine partial-operator domain, not another Fock identity

For every original `M : AlgebraData N`, use the accepted M1a original *complex-linear* quantizer `V_M(x)=M.quantizeFrequency(M1a.masslessSourceFrequency M x)`. For `ψ : FullL2 N`, define `A_M ψ : Boson N → Fermion N := fun x => V_M(x) (ψ x)`. The literal domain criterion is

\[
\mathcal D_M = \{\psi\in \operatorname{FullL2} N : \operatorname{MemLp}(x\mapsto V_M(x)\psi(x),2,\mathrm{volume})\}.
\]

As a named `Submodule ℂ (FullL2 N)`, this is *maximal by membership definition*: every `FullL2` input whose source quantizer action has an `L²` representative belongs; others are excluded. It **does not yet mean** the multiplication output is proved to be a globally closed/self-adjoint operator or that its graph is specified.

The proof must have the following exact source-root interfaces (each printed and checked independently):
1. `originalMasslessAction_ae_congr`: if original L² representatives coincide a.e., their quantized massless Fock actions coincide a.e., by pointwise congruence.
2. `originalMasslessAction_zero_ae`: action on zero original L² vector is zero a.e.
3. `originalMasslessAction_add_ae`: action respects L² addition a.e., using **pinned** `Lp.coeFn_add` and exact original complex-linear map.
4. `originalMasslessAction_smul_ae`: action respects complex scalar multiplication a.e. using **pinned** `Lp.coeFn_smul` and actual complex-linear `quantizeFrequency` (never silently treating real-linear `deformedFermionField` as complex-linear).
5. `originalMasslessDomain`: the `Submodule ℂ (FullL2 N)` with carrier `MemLp`, zero/add/smul closed via pinned `memLp_congr_ae`, `MemLp.zero`, `MemLp.add`, and `MemLp.const_smul`.
6. `originalCore_mem_originalMasslessDomain`: original source `coreToL2 f` belongs to this exact natural domain for every original smooth compactly supported `f`; uses **strict GREEN D0a `originalMasslessQuantizer_core_memLp`** and original `coreToL2_ae`.
7. `pairedOriginalCore_memMasslessDomain`: exact source consumer specializing the domain/core inclusion to literal `FCP.BFSSSU2GaugeG1A.pairedAlgebraData` 48-Majorana Fock.

## Exact pinned donors and negative controls

- Original `Core.lean` `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, original `MixedEnergy.lean` `cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e`, original `DeformedCharge.lean` `c27c913c44090100f0c714e3eb34e25205f4d2d3`, original `FermionQuantization.lean` `c6b72d030225c707ef54f5285a18a7a8175ee280`, original `GaugeCore.lean` `e4990dadf1d8bde849e351467282ab3f14989c3b`.
- Source-qualified M0 `948671c8173dd69bba380a1b08fd46c7b63efb57`, M1a `93e11616d37a3bfac44320e7518027d8883c6072`, M1b `fc2994f932cc13bbade9735f74a97390a4ea224d`, M1c `749992dec67bf4bca28ab957890191aeb8c78fb8`, D0a `1bf49640d543635313495c505a4a4dbc64583ae2` ([strict #44996343676](https://github.com/etblink/math/actions/runs/44996343676)), and literal paired source `152204ef15a6569534e0503824a697cb9ae8e4ce`.
- Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Directly source-read `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` for `Lp.coeFn_zero/add/smul`, `Lp.memLp`; `LpSeminorm/Basic.lean` `memLp_congr_ae`; `LpSeminorm/TriangleInequality.lean` `MemLp.add`. All present at exact pin.
- No `IsFiniteMeasure` assumption (Euclidean volume infinite), surrogate Fock/Hilbert domain, `sorry/admit/axiom`, D1F/D1S4 failed imports, undefined self-adjointness, closedness, spectral gap or Hopfion.

## Qualification contract and distinct next gates

Create only one isolated `BFSSMasslessD0b0OriginalMaximalDomainSubmodule.lean` file importing the accepted D0a source (and pinned Mathlib already imported by original), plus one path-scoped original CI workflow with frozen original/donor exact blob assertions, native build, standalone warning-as-error, seven exact `#print axioms` roots allowing `propext,Classical.choice,Quot.sound` only, required sentinel `BFSS_MASSLESS_D0B0_MAXIMAL_DOMAIN_STRICT_GREEN`, unconditional original six-file artifact. One diagnosable RED allows one proof-only source fix; second native RED STOP, preserving both artifact checksums and first-causal error. An unqualified candidate is *not* a theorem.

After D0b0 strict GREEN, **D0b1** is a genuinely new bound operator graph: construct an **unbounded partial complex-linear map** `originalMasslessDomain M →ₗ[ℂ] FullL2 N` by `MemLp.toLp`, prove its a.e. pointwise action and single-valued graph, and start gauge **domain** preservation in a separate D0b2 using already proved original `GaugeData.deformedFermionField_covariant`. Do not conflate D0b0 named domain with a closed operator; do not infer spectral conclusions. These modules join the [selective unified manifest](./MASSLESS_SOURCE_TO_UNIFIED_INTEGRATION_MANIFEST_2026_11_22.md) only after independent acceptance.


## Exact candidate implementation and original R1 launch

Source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMasslessD0b0OriginalMaximalDomainSubmodule.lean` implemented at [`7d4c8d49fe4b446992ab759a9f860eecd3676818`](https://github.com/etblink/math/commit/7d4c8d49fe4b446992ab759a9f860eecd3676818), original source blob **`84853fb624289121938e0fb4d2b45afdc16a74c6`**, importing **only independently qualified D0a**. It defines a pointwise original complex quantizer action on arbitrary `FullL2` input representatives; supplies seven source-root claims for a.e. congruence, zero/add/smul, the `Submodule ℂ` `MemLp` domain, D0a smooth-core inclusion and literal paired SU2 consumer. It deliberately does not construct the partial `Domain →ₗ[ℂ] FullL2` operator yet; that is D0b1 only after this gate qualifies.

Dedicated original path-scoped strict workflow `.github/workflows/bfss-massless-d0b0-original-maximal-domain-strict.yml` created at exact tested SHA [`f982bb12939eb3bd757a35a265db5ed0a1c6d597`](https://github.com/etblink/math/commit/f982bb12939eb3bd757a35a265db5ed0a1c6d597). Original [R1 #44998375996](https://github.com/etblink/math/actions/runs/44998375996), job `137134276843`, **IN PROGRESS / UNQUALIFIED** at launch. Frozen original Core/MixedEnergy/DeformedCharge/frequency/FermionQuantization, M0–M1c+D0a and paired SU2 exact SHA pins, Lean 4.34.1 and pinned Mathlib, native standalone strict warning-as-error source proof, seven independent `#print axioms` roots limited to `propext,Classical.choice,Quot.sound`, sentinel `BFSS_MASSLESS_D0B0_MAXIMAL_DOMAIN_STRICT_GREEN`, unconditional original evidence archive. No claimed source qualification before original run/artifact/digest checks. Only one evidence-driven proof-only R2 after native RED; second RED freezes gate. No original BFSS or accepted source changes, no unified integration/merge, no `main` changes.


## D0b0 original strict R1 independently accepted GREEN

Original [run #44998375996](https://github.com/etblink/math/actions/runs/44998375996), job `137134276843`, exact tested SHA `f982bb12939eb3bd757a35a265db5ed0a1c6d597`, original new source blob `84853fb624289121938e0fb4d2b45afdc16a74c6` **completed SUCCESS**. Frozen source Core/MixedEnergy/DeformedCharge/frequency/quantizer, accepted M0/M1a/M1b/M1c/D0a and literal SU2 donor pins PASS; pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS; **8,999 native Lean build jobs PASS**; standalone strict `-DwarningAsError=true` compilation PASS; seven exact roots `FCP.BFSSMasslessD0b0.originalMasslessAction_ae_congr`, `originalMasslessAction_zero_ae`, `originalMasslessAction_add_ae`, `originalMasslessAction_smul_ae`, `originalMasslessDomain`, `originalCore_mem_originalMasslessDomain`, `pairedOriginalCore_memMasslessDomain`, each strictly reports **`[propext, Classical.choice, Quot.sound]`**, no `sorryAx`; required `BFSS_MASSLESS_D0B0_MAXIMAL_DOMAIN_STRICT_GREEN` PASS. Original [artifact #14745166078](https://github.com/etblink/math/actions/runs/44998375996/artifacts/14745166078), **8,646-byte ZIP with six files**, independently downloaded/recomputed SHA256 `48bc9d5fb1d2089e33ff8934c371ffbf4048740498b566c2e345e7421178b74c`, matches original GitHub digest; archive `tested-sha.txt` exactly matches tested SHA and archived source preflight/strict roots inspected. **Original D0b0 R1 accepted, no native RED.** Source `originalMasslessDomain M : Submodule ℂ (FullL2 N)` defined exactly by `MemLp (originalMasslessAction M ψ) 2 volume`, proven a.e. representative consistency/zero/add/complex scalar, original smooth-core inclusion and literal paired SU2 consumer. D0b0 alone **does not define** the operator `Dom→ₗ[ℂ] FullL2`, graph, closure, self-adjointness, gauge-domain preservation or energy/spectrum. **Next bounded D0b1** actual partial `FullL2` operator and a.e. graph source consumer; independent strict acceptance required.
