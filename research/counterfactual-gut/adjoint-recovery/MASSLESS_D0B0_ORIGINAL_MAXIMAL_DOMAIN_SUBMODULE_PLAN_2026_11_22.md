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
