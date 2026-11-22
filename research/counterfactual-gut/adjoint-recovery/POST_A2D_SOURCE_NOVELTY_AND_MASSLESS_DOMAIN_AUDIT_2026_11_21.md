# Post-ADJ-A2d source audit — theorem reuse, massless distinction, and operator-domain boundary

**Date:** 2026-11-21 (America/Los_Angeles). **Branch:** `research/bfss-hopfion-gut-counterfactuals-20261121`.  
**Disposition:** READ-ONLY SOURCE ANALYSIS and governance decision. No new Lean source proof, no CI dispatch, no changed original source or old RED. This memo does **not** assign new qualification to any prospective legacy module.

## Executive verdict

The independently strict qualified A0 → A2d chain now gives a reproducible, two-root source consumer of the original BFSS fermionic Fock quantizer at fixed bosonic configurations. Its final source strict [run #44986683677](https://github.com/etblink/math/actions/runs/44986683677) is GREEN at exact `dd1c28bde99144017e72aa334370e875a74ba7cc`; source blob `29231ef39531c1f24fb7016502b627f481b200b6`, 9,000-job native original build, permitted axiom roots and strict warning-as-error all pass. Original artifact #14740073905 ZIP SHA-256 `18fc01614a63435783a962cf06d12e38b0fbb6ab85971554ecb4a42e8afbb43e` independently checked.

**Two corrections to novelty/physical reading must remain prominent:**

1. Original `FrequencyOperators.lean` at frozen blob `8d18da2d1c8de554e6ad3da01cd5f930d8695681` **already proves** `AlgebraData.quantizeFrequency_selfAdjoint` for any `K : FrequencyMatrix N` satisfying `K.transpose = -K`. A2c is therefore a **new independently strict, modular reproving and audited reuse of an existing mathematical conclusion**, *not the first original BFSS finite quantizer self-adjointness theorem*. It has a different proof decomposition and exact audit trail. The standalone D1S3-to-A2c consumer and source-literal paired SU(2) gate are precisely scoped independent qualifications; this does not automatically make the mathematics novel.
2. Original `FermionQuantization.lean`, blob `c6b72d030225c707ef54f5285a18a7a8175ee280`, defines `fermionCoefficient x` with both its **mass-deformation** `(3/2)·massT` contribution and its boson-dependent interaction. A2d proves self-adjointness for that `h=m=1` source coefficient, as in the existing `deformedFermionField_quantized` identity. **It is not a new massless (`h=1,m=0`) original BFSS field or Hamiltonian theorem.**

## Exact source comparisons

Original `FrequencyOperators.lean` (unchanged) contains

```lean
theorem quantizeFrequency_selfAdjoint (K : FrequencyMatrix N)
    (hK : K.transpose = -K) :
    IsSelfAdjoint (M.quantizeFrequency K) := by ...
```

Accepted independent A2c at source blob `94893b6b4f623dfd92122947a4054c4b1a63a5ad` proves the same proposition via A0/A1/A2a/A2b and the `Complex.I/2` scalar. Accepted A2d at source blob `29231ef39531c1f24fb7016502b627f481b200b6` applies that theorem to the separately strict-qualified D1S3 skew coefficient and literal paired SU(2) `pairedAlgebraData`. **No original source `FrequencyOperators` was edited**, and the old failed D1S4 source was never imported.

Using source labels `r=(α,A)`, `s=(β,B)`, the implemented coefficient is

\[
K_{1,1}(x)_{rs}
=\mathbf{1}_{A=B}\,\frac32\,\mathrm{massT}_{αβ}
-\sum_{j,C}f_{BA C}\,x_{jC}\,\Gamma_{j,αβ}.
\]

Consequently the *massless* interaction coefficient is a distinct object
\[
K_{1,0}(x):=K_{1,1}(x)-K_{1,1}(0).
\]
D1S3 gives the real transpose-skewness of both arguments, so **mathematically** `K_{1,0}(x)` is skew as well. A2c or the original `FrequencyOperators.quantizeFrequency_selfAdjoint` then supplies self-adjointness of its finite-Fock quantization once it is introduced through a new exact typed interface. This is a straightforward algebraic consequence, but **not yet a new separately strict-qualified Lean consumer**. It is importantly weaker than the source field comparison
\[
\operatorname{deformedFermionField}(1,0,x)
\overset{?}{=}
\bigl[\operatorname{quantizeFrequency}(K_{1,0}(x))\bigr]_{\mathbb R},
\]
which requires an exact `ContinuousLinearMap.restrictScalars ℝ` equality, and much weaker than the full physical Hamiltonian domain theorem.

Original `deformedFermionField_quantized` already proves the `h=m=1` real restriction equality. **Do not silently substitute this massive theorem for the massless `h=1,m=0` field.**

## Historical controls and actual open interfaces

- Earlier [D1D source/domain audit](../D1D_SOURCE_PHYSICAL_FERMION_INTERACTION_AND_DOMAIN_BOUNDARY_2026_11_21.md) already identified the original generic theorem, source mass deformation, massless difference `K_{1,0}`, and conditional original smooth-core/Hamiltonian bridge. This new audit **reconciles** the A2d qualification with that existing work, rather than replacing its results.
- [D1J source-to-Hamiltonian audit](../D1J_SOURCE_TO_HAMILTONIAN_BRIDGE_AUDIT_2026_11_21.md) identifies the original gauge representation, smooth-core massless energy and potentially useful historical source `SpectralMasslessCoreFormIdentity` and `P3M5BE0`. Their historic greens are reported there but **not independently requalified in the present gate**. Original gauge `GaugeCore.lean` at `e4990dadf1d8bde849e351467282ab3f14989c3b` defines `FullL2` physical fixed space and invariant core; these are not properties of a pointwise `Fermion N →L[ℂ] Fermion N` by themselves.
- [D1F R1/R2](../D1F_R1_R2_STRICT_REDS_AND_SOURCE_DONOR_DECISION_2026_11_21.md) and [D1F R3](../D1F_R3_STRICT_RED_AND_STAGED_RECOVERY_2026_11_21.md) are **strict native RED, unqualified**. They attempted the massless field/quantization comparison and failed due to finite-sum/scalar normalization, zero-at-origin normalization, and wrong use of field notation on namespaced helpers. No R4. A green A2d does **not** retroactively qualify them.
- Independently accepted M2 operator-valued Hilbert–Schmidt fiber modules, such as `P3M2AOriginalFockHSFiber.lean` (`89543ae62bc971303cbb15d3a0c3207e114d57fa`), have a *distinct* HS fiber norm versus original operator norm. Their transport should not be confused with the unbounded bosonic multiplication-by-`K(x)` or its closed operator domain. The `P3M3G0B1` source file has an explicit **PROSPECTIVE** qualification caveat; do not infer a GREEN from the file's existence.

## Why fixed-fiber Hermiticity does not close a Hamiltonian

The accepted theorem lives on each finite original complex Fock space for a *fixed* bosonic position `x`. A field `x ↦ Q(x)` can have operator norm growing with `‖x‖`, so multiplication `(Vψ)(x) = Q(x)ψ(x)` on `L²(Boson 2; Fermion 2)` is not automatically bounded. Forming its maximal domain requires measurability and the condition `Q(x)ψ(x) ∈ L²`. Showing that a suitably defined multiplication operator is self-adjoint, is compatible with the gauge action, and combines with the bosonic kinetic/form contribution on the exact physical domain takes distinct arguments.

In particular a pointwise self-adjoint field does **not** establish self-adjointness of `H_{bos}+V`, lower spectral gap, normalizability of a zero mode, gauge invariance of candidate wavefunctions, physical Hopfion existence, Standard Model chirality or unification.

## Project Lead next-step decision

**Do not open another expensive original-source 9,000-job CI gate immediately.** The ADJ-A2d result is a natural audit checkpoint. Before any new gate:

1. **Source exact massless diagnostic:** specify just one typed `FrequencyMatrix N` expression for `K_{1,0}(x)` and a one-line skewness proof consuming accepted D1S3, with original source hash and no D1F imports. The straightforward finite-Fock self-adjointness should be documented as *reuse*, not novel physics.
2. **True nontrivial comparison:** use the original working `deformedFermionField_bracket` and `frequency_bracket_contraction` donor, or the explicit D1F source-donor decomposition, to establish the massless real-restriction field equality in separately typed, independent proof atoms. Avoid all previous broad `module/ring/simp` failures and the unresolved `simp <;> ring` pattern. Do not revive old D1F R4; a genuinely different smallest-atom architecture and separate evidence are necessary.
3. **Domain/physics eligibility:** review existing source `FullL2`, `SmoothCore`, `pairedGaugeData`, original normalized physical form and historical strict gates against the exact bosonic multiplication form. Use an adversarial commuting-valley/unbounded-coefficient control. Keep any claim of Hamiltonian closure or spectral consequences conditional until fully verified.
4. **SCC discrimination:** distinguish mass-deformed `h=m=1` from massless `h=1,m=0` in every prospective test. A theorem relying on the `massT` term must never be promoted as evidence for a massless BFSS spectral gap.

**No code or CI changes authorized by this audit itself.** The next implementation should be deliberately small and cannot inherit physical or semantic conclusions from merely seeing another GREEN.
