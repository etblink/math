# Unified integration × M0–M1c: source-exact reconciliation before physical-domain research

**Date:** 2026-11-21 Pacific. **Disposition:** COMPLETE READ-ONLY SOURCE AND CI RECONCILIATION; no new Lean theorem, formal qualification, merge, or workflow dispatched. **Research documentation is committed only on** `research/bfss-hopfion-gut-counterfactuals-20261121`. Do not modify `main` or the unified integration branch based on this document.

## 1. Git provenance and branch separation

- Unified source snapshot: `integration/bfss-unified-research-20261108` at **`0e33867c2b6a5093906232b77398d5a8f3e9d536`**; active RHOPF canonical-projectivization D66 R3 **PENDING** [#44992809964](https://github.com/etblink/math/actions/runs/44992809964) at inspection. The latest inspected D65 strict [GREEN #44988327478](https://github.com/etblink/math/actions/runs/44988327478) proves an **algebraic Equiv** from standard Circle orbit quotient to projectivization, not yet a homeomorphism for independently defined projective topology, Chern invariant, Gauss-physical Hopfion, or gap.
- Research snapshot: `research/bfss-hopfion-gut-counterfactuals-20261121` at pre-reconciliation **`e0373ab13259e180fdbed0a7fd8bf7f71e10368c`**.
- Common ancestor `07d6a13c365ffcc581efcad25424025482c493ba`; Git compare shows **diverged**: research-only side 229 unique commits, unified side 56 unique commits at snapshot, 158 differing files in compare. **Never merge entire histories blindly.** No original BFSS mathematical source-file differences in the 15 exact files checked below.
- The four M0/M1a/M1b/M1c source modules exist only on research branch (Git comparison identifies them as `added` on that side). The unified branch must not be described as having their exact declarations until a reviewed source-only import or verified equivalent donor is identified.

## 2. Original source identity check (both branches: exact matching Git blobs)

| Literal source module relative to `lean/OAI/MathematicalPhysics/BFSS/` | Identical source blob | Reuse |
| --- | --- | --- |
| `Core.lean` | `9882359ced78b0a3bd7e2f057974bd0a031b3e60` | `Boson 2`, `Fermion 2`, `FullL2 2`, `SmoothCore`, `coreToL2`, 16-charge `coreForm` |
| `MixedEnergy.lean` | `cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e` | `MixedEnergy.field`, `remainderCore`, and `remainderCore_apply` |
| `DeformedCharge.lean` | `c27c913c44090100f0c714e3eb34e25205f4d2d3` | `deformedRealField_contDiff`, `deformedRealField_anticommutator`, `deformedFermionField`, `averaged_core_energy` |
| `CovariantFields.lean` | `a2a5430550524a57f2fb7d519169050053e886bb` | **EXISTING EXACT MASSLESS-FIELD GAUGE INTERTWINER** `GaugeData.deformedFermionField_covariant` |
| `FermionQuantization.lean` | `c6b72d030225c707ef54f5285a18a7a8175ee280` | Original `deformedFermionField_bracket`, `fermionCoefficient`, `quantizeFrequency` and `frequency_bracket_contraction` |
| `PotentialBounds.lean` | `06afe0a2fa0c6d65439ad15e4e6031f1d43260b7` | **GENERIC** `M.deformedFermionField_growth 1 0 x`, `M.deformedFermionField_inner_lower 1 0 x z` |
| `GaugeCore.lean` | `e4990dadf1d8bde849e351467282ab3f14989c3b` | `GaugeData.physicalSpace`, `invariantCore`, pointwise smooth-core equivariance |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSG1APairedThetaProbe.lean` | `152204ef15a6569534e0503824a697cb9ae8e4ce` | Literal original `pairedAlgebraData` |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSG4JExactGaugeDataAssemblyProbe.lean` | `e20c76fb22bc09d16dbcd8657333227cb34ed1ea` | Literal original `pairedGaugeData` on **pairedAlgebraData**, not a surrogate |
| `Contrib/Kotler/SpectralMasslessCoreFormIdentity.lean` | `3a8dd27bb573e62c8f86b79b83e0ab96f391602a` | Source `M.massless_coreForm_energy` on actual `SmoothCore N` |
| `Contrib/Kotler/P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness.lean` | `16be28f3b526fc08759980bd1dbffba6522e2279` | Exact `FullL2` compact-support radial weighted scalar range pattern |
| `Contrib/Kotler/P3M5BE0OriginalNativeHamiltonianPort.lean` | `f08f1eac4dfb2ff75cdda7421faaf78d4dce77e1` | Original physical normalized `H=(1/16)T†T`, natural domain, closed/self-adjoint |
| `Contrib/Kotler/P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain.lean` | `f954917f21669fd68befc12f48a2b092b71a9044` | Exact gauge-restricted source charge graph and existential nonzero physical H-domain vector |
| `Contrib/Kotler/BFSSP2C2OriginalMasslessGrowthBinding.lean` | `59a2dcc84ff36beddca12a440ab01b21b6c64cef` | Strict original **concreteAlgebraData**, not automatically the **pairedAlgebraData** consumer |
| `Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainD3BFullChargeGaugePreservationProbe.lean` | `532648ee147e218aba4e69ae2f79dd7da63cd9a8` | Original smooth-core charge pointwise gauge covariance and invariant-core preservation |

The **paired vs concrete data warning matters**: `SU2BFSSG1APairedThetaProbe.lean` defines `pairedAlgebraData` by reusing original `concreteAlgebraData` color and gamma, but its theta field is `pairedTheta` rather than `concreteAlgebraData.theta`. The original P2C2 strict [GREEN #43174015946](https://github.com/etblink/math/actions/runs/43174015946) specializes `PotentialBounds` to `concreteAlgebraData`. **Do not apply its specialized constant/statement to the paired gauge model without proof.** The unchanged **generic** `M.deformedFermionField_growth` applies directly at `M=pairedAlgebraData`; that is the correct source-level route, with a new specialized consumer only if the eventual physical theorem actually needs one.

## 3. Independently strict-qualified M0–M1c source chain (research branch only)

| Gate | Exact new source Git blob | Original strict GREEN | Precisely accepted scope |
| --- | --- | --- | --- |
| M0 | `948671c8173dd69bba380a1b08fd46c7b63efb57` | [#44988662078](https://github.com/etblink/math/actions/runs/44988662078) | Source original theta-pair double-sum negation and negative gamma/color contraction |
| M1a | `93e11616d37a3bfac44320e7518027d8883c6072` | [#44990226259](https://github.com/etblink/math/actions/runs/44990226259) | `K_10(x):= -sourceBracketCoefficient M x`; `M.quantizeFrequency K_10(x) = (-i/2) • ∑ cubic` in original complex Fock |
| M1b | `fc2994f932cc13bbade9735f74a97390a4ea224d` | [#44990981706](https://github.com/etblink/math/actions/runs/44990981706) | `M.deformedFermionField 1 0 x = (M.quantizeFrequency K_10(x)).restrictScalars ℝ`, generic and actual paired SU2 |
| M1c | `749992dec67bf4bca28ab957890191aeb8c78fb8` | [#44991923266](https://github.com/etblink/math/actions/runs/44991923266) | `K_10(x)=M.fermionCoefficient x - M.fermionCoefficient 0`, generic and actual paired SU2 |

Exact R2 GREEN M0/M1a, R1 GREEN M1b/M1c, source/consumer axiom reports and independent ZIP integrity were preserved in their original named acceptance records and canonical ledger CF-259–282. Historical D1F R1–R3 and D1S4 R1/R2 stay native RED/frozen; never import them. **No separately strict combined theorem** for the final rewritten M1b+M1c surface form is asserted by this crosswalk.

## 4. What unified integration had already qualified, and what it DOES NOT do

| Source / original run | Existing result | Non-implication |
| --- | --- | --- |
| `SpectralMasslessCoreFormIdentity.massless_coreForm_energy`; historical exact strict [#42325087575](https://github.com/etblink/math/actions/runs/42325087575) with matching source blobs | Original 16-charge normalized smooth-core energy decomposes into kinetic, bosonic-potential and **massless fermionic expectation density** | No theorem that arbitrary `FullL2` state has massless V-multiplication in `FullL2`; no gap |
| `P2C2OriginalMasslessGrowthBinding`; [#43174015946](https://github.com/etblink/math/actions/runs/43174015946) | Pointwise `‖deformedFermionField 1 0 x‖ ≤ C||x||` and inner-lower, on `concreteAlgebraData`; underlying source general bound applies to paired | This is growth, **not** unweighted operator-field `L²`, and does not bound `V` uniformly |
| `P3M3G0B1OriginalGaugeAEFullOperator`; [#43467719230](https://github.com/etblink/math/actions/runs/43467719230) | True source operator-valued `Lp` field a.e. left-output SU2 action, derived from ONB | Applies to an **existing operator-valued `Lp` field**; cannot blindly model linearly growing massless V as such a field |
| `P3M5BE0OriginalNativeHamiltonianPort`; [#43493125150](https://github.com/etblink/math/actions/runs/43493125150) | Source actual paired gauge-physical normalized Hamiltonian `H=(1/16)T†T`, natural domain, closure, self-adjointness, domain density, weak form | No source V-multiplier maximal-domain equality, no spectral assertion |
| `P3M5BF0OriginalSourceGaugeGraphAndNonzeroHDomain`; [#43498649514](https://github.com/etblink/math/actions/runs/43498649514) | Same actual source source-graph match and **existence of nonzero physical H-domain vector** | The vector is existential, **not an explicitly normalized energy-controlled trial state** |
| `P3AuxRADC3DAOriginalWeightedCoreFullL2RangeWitness`; successor original weighted-graph strict [#43578132553](https://github.com/etblink/math/actions/runs/43578132553) | Compact-support continuous scalar-weighted fields have genuine `FullL2` representatives; original physical smooth-core weighted charge graph | Weighted **scalar** multipliers / charge graph, not automatically the matrix-valued massless Yukawa multiplier |

## 5. TWO previously overstated 'missing gates' are ALREADY IN THE ORIGINAL SOURCE

### 5A. Pointwise gauge covariance of the exact massless fermion field already exists

Original `CovariantFields.lean` blob `a2a5430550524a57f2fb7d519169050053e886bb`, `GaugeData.deformedFermionField_covariant` (lines 164–190), proves for **all h,m**:
```lean
G.fermion g (M.deformedFermionField h m x v) =
  M.deformedFermionField h m (G.boson g x) (G.fermion g v)
```
Instantiate `M = FCP.BFSSSU2GaugeG1A.pairedAlgebraData`, `G=pairedGaugeData`, `h=1`, `m=0`; these are the SAME source field as M1b, not a proxy. **Consequently the assertion in the earlier post-M1c memo that pointwise massless V covariance was missing is FALSE and SUPERSEDED by this audit.** The identity is **source-proved**; a new M1a complex-quantizer pointwise rewrite or a separately checked joined consumer may be useful later, but it is not new physical mathematics. Retain earlier memo as historical negative knowledge with a visible correction.

### 5B. Smooth compact-core pointwise multiplier action is largely source built

Original `MixedEnergy.lean` blob `cc00f5b2ce4bb1811162e4bf2d9c773a9779ef8e`:
- `MixedEnergy.field V hV f` (lines 123–142) is an **exact TestFunction/smooth-core-to-smooth-core** map with `field_apply: field V hV f x=V x (f x)`; the smoothness and compact-support obligations are discharged in source.
- `MixedEnergy.remainderCore B V hV f` (lines 237–247) **already lives in the original smooth core**, and `MixedEnergy.remainderCore_apply` identifies the derivative-cancelled sum with `MixedEnergy.remainderField B V x (f x)` given an exact anticommutator.
- Original `DeformedCharge.lean` blob `c27c913c44090100f0c714e3eb34e25205f4d2d3` has `M.deformedRealField_contDiff 1 0` (line 22), `M.deformedRealField_anticommutator 1 0` (line 48), and
  `M.deformedFermionField 1 0 x := (1/16 : ℝ) • MixedEnergy.remainderField (...) x` (line 90).
- Original `M.averaged_core_energy` (lines 120–147) **already consumes `remainderCore_apply`** and proves integrability of the fermionic energy density on compact smooth source states. Original `Core.lean` `coreToL2` (lines 102–118) injects any resulting smooth core as a true `FullL2` class.

Thus existence of a smooth-core Fock-vector multiplication output via **the properly scaled remainderCore** is not an unexplored analytic frontier; it is a short exact source-adapter boundary. The proposed expression
```lean
(1/16 : ℝ) • MixedEnergy.remainderCore
    M.kineticSkewSymbol (M.deformedRealField 1 0)
    (M.deformedRealField_contDiff 1 0) f
```
is a **research-level source-shaped adapter sketch**, not yet a freshly elaborated Lean term or separately accepted axiom root. Its pointwise identity to `M.deformedFermionField 1 0 x (f x)` is the same original `remainderCore_apply`/anticommutator computation, not a new physics result. Avoid a large CI gate merely to repeat it.

## 6. Genuine missing cross-branch interface: unbounded maximal Fock-vector multiplication

At original **paired SU2** source (M), define (K(x):=M1a.masslessSourceFrequency\,M\,x), (V_\mathbb{C}(x):=M.quantizeFrequency(K(x))). For each x, (V_\mathbb{C}(x)) acts complex linearly on the **original finite Fock**, and M1b identifies its real-scalar restriction with the original `deformedFermionField 1 0 x`. This is essential: original `FullL2 2` is a **complex Hilbert** space, whereas `deformedFermionField` is presented as an `ℝ`-linear map. Use **M1a's exact complex-linear quantizer** to construct the global complex-linear partial multiplier rather than casually asserting a complex-linear map from real-linear source notation.

Target:
\[
  \mathcal{D}(\mathcal{V})=
    \{\psi\in \mathrm{FullL2}\ 2\mid
      x\mapsto V_\mathbb{C}(x)\psi(x)\in\mathrm{FullL2}\ 2\},
\quad
  (\mathcal V\psi)(x)=V_\mathbb{C}(x)\psi(x)\quad\text{a.e.}
\]
Needed: `K(x)`/quantizer strong measurability/continuity; `Lp` representative-independence; exact partial linear-map domain/submodule; graph closure or maximal-domain self-adjointness only with separately proved fiber Hermiticity; original smooth-core membership; then **gauge domain preservation** using existing `G.deformedFermionField_covariant`, measure-preserving pullback and M1b; finally source physical form/H graph compatibility.

This is NOT the operator-valued `OriginalFockOperatorLp` of M2/M3 (which would require square-integrable V itself), and is NOT the existing bounded reciprocal *scalar* multiplier. A linear-growth field may be unbounded over bosonic x even though each Fock fiber is bounded.

## 7. Minimal no-duplication execution contract

1. **No new proof gate right now.** Use the original `MixedEnergy.field/remainderCore` and `GaugeData.deformedFermionField_covariant` **as accepted source starting points**. The immediate D0 existence/covariance gates imagined in the old memo are removed.
2. **Source-typed feasibility diagnostic, no CI yet:** inspect pinned Mathlib `Lp` integrability of operator-valued *action on L² vectors*, a.e.-representatives, partial linear map/graph, closed multiplication, and `SmoothCore`/pairedGaugeData source imports. Distinguish `Dom(T)` (charge form) from `Dom(T†T)` (H).
3. **Single meaningful future strict gate only after feasibility:** construct the actual `FullL2 2` maximal **complex-linear** massless multiplier on the literal paired Fock, prove its a.e. action and inclusion of the actual original smooth core, and independently consume with M1a/M1b/M1c and the original `Core` injection. Prefer the source `remainderCore` for inclusion; do not rederive finite CAR sums.
4. **Separate physically meaningful next gate:** prove paired gauge action commutes with this partial operator and its domain—**reusing, not reproving**, the original `GaugeData.deformedFermionField_covariant`. Require proper measure-preserving a.e. transport; do not confuse pointwise intertwining with `FullL2` graph invariance.
5. **Original physical form and adversarial test:** determine whether chosen gauge-physical smooth trial vectors lie in the original `T` form domain and/or the stricter `H` operator domain, calculate the true kinetic, bosonic and fermionic energy expectation with 1/16 normalization, and search for physical escaping valley packets or a coercive bound. No spectral gap, Hopfion, Standard Model or GUT conclusion before these tests.

**Governance:** Keep qualified M0–M1c sources in their research branch, preserve all RED evidence, do not alter unified branch or `main`, and do not claim an integration gate or merged proof has passed. The existing root `BFSS_GATE_STATE.json` dates to 2026-11-18 and does not capture later RHOPF gates; inspect exact dated strict receipts. Review import-only strategy and historical branch conflicts before ever integrating M0–M1c.
