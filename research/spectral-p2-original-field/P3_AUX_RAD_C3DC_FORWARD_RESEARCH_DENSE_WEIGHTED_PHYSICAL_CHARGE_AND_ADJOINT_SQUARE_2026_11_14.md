# P3-AUX-RAD-C3D-C — exact original weighted physical-charge density forward research

**Date:** 2026-11-14 Pacific. **Classification:** source-reviewed PROSPECTIVE research only; no new Lean theorem qualified here. **Live prerequisite:** RAD-C3D-B R2 strict [#43575336639](https://github.com/etblink/math/actions/runs/43575336639), tested SHA `76f207da39b2ead16e3652ddffdb5c16e8188255`, remained in progress at preparation. **This memo does not stage a source file, consumer or workflow and does not modify the running gate.**

## Mathematical target

Let `M : AlgebraData 2`, `G : M.GaugeData`, `E = G.physicalSpace` and original AY output `K = PiLp 2 (fun _ : SpinIndex => FullL2 2)`. The accepted RAD-C3 partial operator `Sε = originalWeightedPhysicalChargeColumn M G hε : E →ₗ.[ℂ] K` is **closed** for `ε>0` (strict #43570463487). Accepted C3D-A proves a native original weighted `FullL2` reciprocal range witness for any compactly supported source `SmoothCore 2` (strict #43572123886).

The pending C3D-B aims to qualify `originalWeightedChargeCore_mem_domain M G hε f` for `f:G.invariantCore`, with exact actual original `pairedAlgebraData/pairedGaugeData` consumer. **Only if C3D-B passes**, the older original Haar theorem yields

`Dense ((originalWeightedPhysicalChargeColumn M G hε).domain : Set G.physicalSpace)`

for every `M,G` at N=2 and every `ε>0`. This means closure in the original **physical Hilbert input norm**, not closure in the graph norm.

## Verified source crosswalk

1. H5E8AZ, `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/OperatorDependencies/SU2BFSSPhysicalDomainL6H5E8AZOriginalPhysicalChargeDomainDensityReductionProbe.lean` blob `b69166ba7b1118e3542ba826e73aa4f95f575c3c`: `originalMinimalPhysicalHilbertChargeColumn_domain_dense_of_coreNormClosure_eq` proves exact source domain density by `rw [Subtype.dense_iff]`, `LinearMap.range (coreToL2.comp G.invariantCore.subtype)`, `closure_mono`; no approximation sequence or new Haar integral required.
2. Original D2B10C, `SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe.lean` blob `7b116f1efa2dd62cc5188b3ff2d2cf38ecd7bd9a`: `sourceCoreNormClosure_eq_physical_unconditional M G : G.coreNormClosure = G.physicalSpace` at N=2. The H5E8BA original unweighted unconditional density adapter blob `3ab254088e3fa2aea7622807b6b10e7eabc6fc8a` already applies it to the AZ conditional theorem.
3. Exact original proposed C3D-B R2 `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph.lean` source blob `093745393a1474863a1b46402f2db76537fa1512`: final candidate `originalWeightedChargeCore_mem_domain M G hε f` is the **only** new mathematical premise needed by the AZ-style density argument. R1 RED from missing namespace and `whnf` timeout has an independent preserved receipt; R2 is not yet considered green.
4. Source original physical nontriviality: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M3W0D0OriginalNonzeroPhysicalChargeDomain.lean` blob `86823abdddb70d1c2158f8e215fb35760e107fd5` proves `originalPhysicalFullL2_witness_ne_zero` at exact `pairedGaugeData.physicalSpace` and demonstrates how to derive an existential nonzero domain vector from density, without assuming the explicit radial bump is in any charge domain. Original M3W0D0 strict #43484147197 qualified.

## Candidate Lean source skeleton — NOT COMPILED / NOT ACCEPTED

First isolate **conditional** density (source H5E8AZ proof copied with only the actual weighted domain substituted), then independently discharge the original SU2 Haar premise as H5E8BA did. Preserve both as separately printed axiom roots in a native original `pairedAlgebraData/pairedGaugeData` consumer.

```lean
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainD2B10CFullHaarCoreCompatibilityAndDensityProbe

set_option autoImplicit false
namespace FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSP3AuxRADC3OriginalPhysicalWeightedChargeGraph
open FCP.BFSSP3AuxRADC3DBOriginalPhysicalWeightedCoreGraph
open FCP.BFSSSU2PhysicalDomainD2B10C
open Set

theorem originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε)
    (hd : G.coreNormClosure = G.physicalSpace) :
    Dense ((originalWeightedPhysicalChargeColumn M G hε).domain :
      Set G.physicalSpace) := by
  rw [Subtype.dense_iff]
  have hs :
      (LinearMap.range (coreToL2.comp G.invariantCore.subtype) :
        Set (FullL2 2)) ⊆
      ((↑) '' ((originalWeightedPhysicalChargeColumn M G hε).domain :
        Set G.physicalSpace) : Set (FullL2 2)) := by
    rintro ψ ⟨f, rfl⟩
    let u : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
    refine ⟨u, ?_, rfl⟩
    exact originalWeightedChargeCore_mem_domain M G hε f
  calc
    (G.physicalSpace : Set (FullL2 2)) =
        (G.coreNormClosure : Set (FullL2 2)) :=
      congrArg (fun S : Submodule ℂ (FullL2 2) =>
        (S : Set (FullL2 2))) hd.symm
    _ = closure (LinearMap.range
        (coreToL2.comp G.invariantCore.subtype) : Set (FullL2 2)) := rfl
    _ ⊆ closure ((↑) '' ((originalWeightedPhysicalChargeColumn
        M G hε).domain : Set G.physicalSpace) : Set (FullL2 2)) :=
      closure_mono hs

theorem originalWeightedPhysicalChargeColumn_domain_dense_unconditional
    (M : AlgebraData 2) (G : M.GaugeData)
    {ε : ℝ} (hε : 0 < ε) :
    Dense ((originalWeightedPhysicalChargeColumn M G hε).domain :
      Set G.physicalSpace) :=
  originalWeightedPhysicalChargeColumn_domain_dense_of_coreNormClosure_eq
    M G hε (sourceCoreNormClosure_eq_physical_unconditional M G)

-- #print axioms both roots; exact original paired-SU2 independent consumer
end
end FCP.BFSSP3AuxRADC3DCOriginalWeightedPhysicalDomainDensity
```

**Lean watchpoints:** This is a typed source-faithful *candidate*, not a compilation result. `Subtype.dense_iff` may require the existing AZ `Set`/submodule context; reuse the accepted AZ proof shape exactly. In case of definitional mismatch, compare elaborator goals before using `change`; do not blindly increase `maxHeartbeats`. Keep `M : AlgebraData 2`, not a deformed model. Do not import D2B10C merely to declare the already accepted unweighted T dense: only its original `G.coreNormClosure = G.physicalSpace` theorem supplies the needed premise.

**Recommended gate:** A two-root C3D-C strict cold native source/consumer compile first, plus exact donor SHA pins. Optional separate smaller third root on **nonzero** native paired weighted domain may copy M3W0D0's closure argument *after* density, but adding its old Fock radial module unnecessarily bloats the principal two-root gate. Nonzero witness does not need to be the original radial bump itself.

## Beyond density: reusable Hilbert adjoint-square route, not yet a new claim

Existing original-source modules already contain generic tools:
- H5E8BC `SU2BFSSPhysicalDomainL6H5E8BCOriginalPhysicalChargeNaturalAdjointSquareProbe.lean` blob `a31a2a04c8c63061fa1d3a447283c2ee261d92d6`: generic `naturalComp` and `naturalFormalProduct_symmetric`, with exact partial-domain composition/energy identities.
- H5E8BD `SU2BFSSPhysicalDomainL6H5E8BDOriginalPhysicalChargeAdjointSquareSelfAdjointProbe.lean` blob `9bedf73dded2229062dce43184c7b1bd11b2ef22`: generic `naturalAdjointSquare_shift_graph_surjective (T:E→ₗ.[ℂ]F) (hT:T.IsClosed) (hd:Dense (T.domain:Set E))`, and `selfAdjoint_of_formalSymmetry_and_shift_surjectivity`. Unlike the original source-specific specialization, the generic graph argument is appropriate in principle for the **new** closed and densely defined `Sε`.
- H5E8BE `SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe.lean` blob `0afafb8eae4b5efdbd4f95eff2ae1e9352dfe7c5`: generic `weakRepresentative_iff_adjoint`, `normalizedWeakRepresentative_iff_naturalAdjointSquare`, and real scalar self-adjoint normalization, with exact source (1/16) convention.

**Candidate later route, NOT qualified:** once C3D-C passes, use the generic BD theorem with `T:=Sε`, accepted RAD-C3 closedness and new C3D-C density to construct and formally verify the self-adjoint nonnegative normalized natural adjoint square `(1/16) Sε† Sε`. Validate compatibility with original source's (1/16) normalization and actual `K` codomain. This is an **operator-theoretic** claim; it is not an auxiliary spectral gap, Hardy coercivity on the Spin(9)-singlet sector, fidelity bound, spectral isolation, or BFSS mass gap.

## Hard distinctions and negative knowledge

1. **Dense input domain ≠ graph core:** `closure(D(Sε))=E` in physical Hilbert input norm does NOT prove original invariant SmoothCore is dense in the `Sε` graph norm. Identifying the minimal and maximal radial weighted expressions or proving full-form closure from test functions may require a **separate graph-core argument**.
2. **Unweighted T dense ≠ weighted Sε dense:** An unbounded inverse of `B16ε` cannot be used on arbitrary original `Tu`; the accepted C3D-A compact-support range witness plus prospective C3D-B source inclusion is essential.
3. **Closed+densely defined Sε ≠ positive spectral gap:** Even `Sε†Sε` self-adjoint and nonnegative leaves its spectrum potentially touching zero. Auxiliary Spin(9)-singlet Hardy and spectral estimates are different workstreams.
4. No global bounded radial weight multiplier, no epsilon-zero closability, no identification with the maximal pointwise (wε Q) operator, no assumption that radial bump is in the weighted domain, and no cross-transfer of a deformed operator equality.

**Stop/next decision:** Await C3D-B exact strict source/consumer result. If green, stage only the C3D-C two-root native physical density gate. If red, repair C3D-B's first causal issue before attempting the density application. Do not start a competing CI job against the running C3D-B strict test.
