# Post-M1c source audit — massless multiplier, original bosonic L² domain, and physical charge-form bridge

**Date:** 2026-11-21 America/Los_Angeles. **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Disposition:** source-read physical-domain audit, **not** a new Lean theorem or CI qualification. New research memo only. Do not edit original BFSS, M0–M1c, or frozen D1F/D1S4 failures.

## 1. Accepted exact-massless source proof chain — now closed in its own scope

| Gate | Original strict run | Accepted literal source result |
| --- | --- | --- |
| M0 | [#44988662078](https://github.com/etblink/math/actions/runs/44988662078) | Real scalar negation passes both original theta finite sums; negative original `frequency_bracket_contraction` yields negative source cubic sum |
| M1a | [#44990226259](https://github.com/etblink/math/actions/runs/44990226259) | `M.quantizeFrequency (masslessSourceFrequency M x) = (-I/2) • ∑ cubicFermionComponent x`, original complex-linear Fock |
| M1b | [#44990981706](https://github.com/etblink/math/actions/runs/44990981706) | `M.deformedFermionField 1 0 x = (M.quantizeFrequency (masslessSourceFrequency M x)).restrictScalars ℝ`, generic + literal paired SU2 consumer |
| M1c | [#44991923266](https://github.com/etblink/math/actions/runs/44991923266) | `masslessSourceFrequency M x = M.fermionCoefficient x - M.fermionCoefficient (0 : Boson N)`, generic + literal paired SU2 |

M1c strict original R1 exact tested `fde9366580b6beace7c7b80310dadc31b7885706`, source blob `749992dec67bf4bca28ab957890191aeb8c78fb8`, original six-file artifact #14742706199, ZIP SHA-256 `441c50f313a1c68d3aa846b60fd71aec25a9b5d91f42f15a2dfd984c70b95cdd`. Native 8,997 jobs, two strict roots `[propext,Classical.choice,Quot.sound]`, pinned sources/toolchain and GREEN sentinel independently verified.

The **composition** of individually qualified M1b and M1c yields the mathematically sound fixed-boson source identity
`V_F(1,0,x)=[quantizeFrequency (fermionCoefficient x - fermionCoefficient 0)]_ℝ`.
There is **no separately strictly checked combined Lean theorem** for that last rewritten surface form, and none is needed just to inflate source algebra. Note mass-deformed `fermionCoefficient x` alone is **not** massless.

## 2. Exact original Hilbert, gauge and form source interfaces

- Original `Core.lean` Git blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60` defines `Boson 2=ℝ²⁷`, `Fermion 2=ℂ^(2^24)`, `FullL2 2 = Lp (Fermion 2) 2 (volume : Measure (Boson 2))`, and `SmoothCore 2 = TestFunction ⊤ (Fermion 2) ⊤`. Original `charge`, `coreForm=(1/16)∑‖Qαψ‖²` and `coreToL2` are source, not surrogate differential operators.
- Original `GaugeCore.lean` blob `e4990dadf1d8bde849e351467282ab3f14989c3b` defines `GaugeData.physicalSpace=⨅_g ker(bosonPullback g−fiberAction g)` and `invariantCore=physicalSpace.comap coreToL2`; proves `invariantCore_equivariant` pointwise and norm/fderiv covariance on exact source smooth core.
- Original SU2 `pairedGaugeData` in `OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean`, blob `e20c76fb22bc09d16dbcd8657333227cb34ed1ea`, uses original paired algebra/Fock gauge action. A source exact definition is present, but no new qualification of it is asserted by this audit.
- Original `PotentialBounds.lean` blob `06afe0a2fa0c6d65439ad15e4e6031f1d43260b7`, generic `AlgebraData.deformedFermionField_growth`, provides `‖M.deformedFermionField 1 0 x‖ ≤ M.fermionGrowthConstant * ‖x‖`; original `fermionGrowthConstant_nonneg`. Candidate `BFSSP2C2OriginalMasslessGrowthBinding.lean` blob `59a2dcc84ff36beddca12a440ab01b21b6c64cef` specializes to `concreteAlgebraData` but has a source comment requiring its own strict qualification; **do not promote by filename**.
- `SpectralMasslessCoreFormIdentity.lean` blob `3a8dd27bb573e62c8f86b79b83e0ab96f391602a` expresses `coreForm` through massless original `deformedFermionField 1 0 x` on **SmoothCore**, and imports `SU2BFSSG4K9DSourcePotentialMultiplierProbe` blob `cc0f4624239160dc39a7a191a519786e71df6abd`. Historical exact [strict run #42325087575](https://github.com/etblink/math/actions/runs/42325087575) is **GREEN** at SHA `c1f309ca6de85b6f9e6c76a38254140e333fe819`; both these source blobs match the present branch (checked). Its source file contains an older prospective disclaimer; historical run evidence is useful, but **not a new independent current-turn requalification of every downstream claim**.
- `P3M5BE0OriginalNativeHamiltonianPort.lean` blob `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1` states original literal paired source `H=(1/16)T†T`, natural domain, action, self-adjointness, closedness, density and weak-form iff on the genuine gauge-physical Hilbert subtype. Historical exact [strict run #43493125150](https://github.com/etblink/math/actions/runs/43493125150) is **GREEN** at `10a9e7e3419f8b02b5e920c60e07facf8602fb42`, with original/consumer/21-root steps passed; port and immediate H5E8BE dependency blobs match this branch. Source file's older `PROSPECTIVE` comment cannot alone invalidate a historical strict GREEN, but neither should a historical GREEN be automatically generalized to trial-state domain membership or energy/spectral conclusions.
- Existing `P3M2B2B1OriginalOperatorLpTransport.lean` blob `d1c99e75bdf1081961b3b794b4dbe2da7ef30e82` supplies an `OriginalFockOperatorLp` bridge via finite HS columns, not the unbounded multiplier domain. `P3M3G0B1OriginalGaugeAEFullOperator.lean` blob `095e63582a5f04a9dd2be0a192fb42586d97dd2f` is **PROSPECTIVE**, relates to arbitrary *L² operator fields* with left-output SU2 gauge action, not automatically the massless Yukawa multiplier.

## 3. The non-obvious functional-analysis boundary

The accepted M1b field `V(x): Fermion 2→L[ℝ]Fermion 2` is bounded for each **fixed** x; yet `‖V(x)‖≤C‖x‖` is a **growth** bound, not a uniform global bound and not a proof that `x↦V(x)` belongs to an unweighted operator-valued `L²(ℝ²⁷)`. Do **not** type the interaction as `OriginalFockOperatorLp` merely because M2 built that space. A linear-growth operator field need not have finite unweighted L² norm on infinite-volume bosonic configuration space.

The correct physical map is a **partially defined multiplication operator** on original vector-valued `FullL2 2`:
\[
  (\mathcal V\psi)(x)=V(x)\psi(x),\qquad
  \mathcal D(\mathcal V)=
   \{\psi\in\mathrm{FullL2}\ 2:\ V(\cdot)\psi(\cdot)\in\mathrm{FullL2}\ 2\}.
\]
A formal implementation must prove that the expression is measurable, independent of chosen a.e. representative, and its output really is in `Lp` precisely for domain members; source continuity/polynomial dependence of `V(x)`, with finite-dimensional Fock carrier, is promising but **not itself a compiled proof**. On an original smooth compactly supported `ψ`, the growth bound makes `Vψ∈L²` plausible because `x` is bounded on support. On arbitrary `FullL2`, no such guarantee exists. Under suitable measurable pointwise self-adjoint field hypotheses, a self-adjoint maximal multiplication operator may be available by standard functional analysis, but this **does not prove** self-adjointness of the sum with the bosonic differential operator or equality to the original normalized `H=(1/16)T†T`.

## 4. Gauge source interface: missing original massless V covariance, not missing GaugeData

For original `pairedGaugeData` and its boson and Fock actions, one concrete nontrivial target is **pointwise intertwining** (convention chosen to match `invariantCore_equivariant`):
\[
V(B_gx)U_gz=U_g(V(x)z)\quad
(g\in SU(2),\ x\in\mathrm{Boson}\ 2,\ z\in\mathrm{Fermion}\ 2).
\]
This is stronger than knowing separately the original `GaugeData` actions exist. The source `BFSSJOIN0AOriginalBosonFockGaugeCovariance.lean` blob `68fd2067b2dcdb6851afed269d25726dd5b634c5` has **pointwise** covariance of a distinct Gram observable; it explicitly declines any full-bosonic-`L²` multiplier, domain or charge result. Do not substitute it for a source-typed exact `M1a.masslessSourceFrequency` or `M1b.deformedFermionField 1 0` covariance.

When pointwise V covariance and the measurable multiplication/domain interface are proved, next check `\mathcal V` maps `G.physicalSpace∩D(\mathcal V)` into physicalSpace and preserves its natural domain (after correct pullback conventions). The source's `invariantCore_equivariant` can help. Independent **real-linear versus complex-linear** map types matter: M1b's `restrictScalars ℝ` is the literal source field; group action is complex-linear.

## 5. Smooth original form and domain eligibility: staged plan

**No new CI gate is launched by this audit.** The next meaningful proof boundaries:

1. **D0 domain-typed source diagnostic (read-only design):** identify exact `FullL2 2` type, original `SmoothCore 2` injection, pointwise `M.deformedFermionField 1 0 x`, linear-growth constant, and current Mathlib `Lp` multiplication/measurability lemmas. First prove/validate one minimal statement that any *original compactly supported smooth core* wavefunction yields a genuine `FullL2` output under the massless multiplier; no field-valued `L²` assumption. Start with a typed Lean `#check` / preflight diagnostic before an expensive native job.
2. **D1 exact source gauge intertwiner:** on `pairedAlgebraData`, `pairedGaugeData`, prove the displayed intertwining for **this** massless coefficient and original Fock representation. Reuse accepted M1b and source gauge/CAR identities, not a derived Gram observable unless its precise coefficient is first identified. Prove gauge-stability of a domain only **after** the domain exists.
3. **D2 physical core-form join:** use existing original `massless_coreForm_energy`, `coreForm`, `G.invariantCore` and physical normalized charge `T` to prove the **specified** trial state is a genuine physical form-domain member, with actual source scalar and fermion expectations and 1/16 normalization. Distinguish form domain `Dom(T)` from stronger Hamiltonian operator domain `Dom(T†T)`.
4. **D3 adversarial valley test:** before claiming spectral gap or particle evidence, test bosonic commuting valleys where classical potential vanishes, and construct/estimate gauge-equivariant localized escaping states with **full gradient, Jacobian, Berry/angular, source fermion and gauge** terms. Historical D1J selected Gaussian leading cancellation and K≈26.0600055 are a numerical **prescreen**, not a full source quadratic-form energy estimate. A form-variational route may be sufficient for a continuum result without an operator Weyl-sequence proof; keep both hypotheses falsifiable.

**Stop rules:** Source definition present ≠ exact independent CI qualification. Never infer that fixed-fiber self-adjointness proves full (L²) or (H); distinguish source h=m=1 deformation from h=1,m=0 massless; no new D1F R4 / D1S4 retry; no experimental Standard Model or GUT claim from pure Fock/source algebra. Preserve red diagnostics, approved source gates and all artifact hashes.
