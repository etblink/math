import SU2BFSSPhysicalDomainS3K0SourceSpinFullL2LiftProbe
import SU2BFSSPhysicalDomainD2B7SourceFullL2GaugeIsometryAndFixednessProbe
import SU2BFSSG4JExactGaugeDataAssemblyProbe

/-!
# S3K1 — actual fermionic spin flow preserves the exact Gauss physical space

Proves commutation with the original gauge fermion fiber action and boson
pullback on the actual FullL2 2, then proves preservation of the source
pairedGaugeData.physicalSpace. Does not claim closed charge/Hamiltonian
domain preservation, the full combined spatial rotation, or spectroscopy.
-/

namespace FCP.BFSSSU2PhysicalDomainS3K1
noncomputable section
open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open MeasureTheory
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainS3H
open FCP.BFSSSU2PhysicalDomainS3I
open FCP.BFSSSU2PhysicalDomainS3K0

/-- The literal source Fock-plane rotation commutes with the literal
SU(2) fermionic fiber gauge action, as genuine FullL2 elements. -/
theorem sourceSpinFullL2CLM_comm_fiber
    (i j : SpaceIndex) (t : ℝ) (g : GaugeGroup 2)
    (v : FullL2 2) :
    sourceSpinFullL2CLM i j t (pairedGaugeData.fiberAction g v) =
      pairedGaugeData.fiberAction g (sourceSpinFullL2CLM i j t v) := by
  apply Lp.ext
  have hFout := ContinuousLinearMap.coeFn_compLp
    (sourceSpinFockIsometry i j t).toContinuousLinearMap
    (pairedGaugeData.fiberAction g v)
  have hGin := ContinuousLinearMap.coeFn_compLp
    (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap v
  have hGout := ContinuousLinearMap.coeFn_compLp
    (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
    (sourceSpinFullL2CLM i j t v)
  have hFin := ContinuousLinearMap.coeFn_compLp
    (sourceSpinFockIsometry i j t).toContinuousLinearMap v
  filter_upwards [hFout, hGin, hGout, hFin]
    with x hxFout hxGin hxGout hxFin
  calc
    (sourceSpinFullL2CLM i j t (pairedGaugeData.fiberAction g v)) x =
      sourceSpinFockIsometry i j t ((pairedGaugeData.fiberAction g v) x) := hxFout
    _ = sourceSpinFockIsometry i j t (pairedGaugeData.fermion g (v x)) :=
      congrArg (sourceSpinFockIsometry i j t) hxGin
    _ = pairedGaugeData.fermion g (sourceSpinFockIsometry i j t (v x)) := by
      simpa only [sourceSpinFockIsometry_apply,
        pairedGaugeData_fermion_exact] using
        (pairedFermionPlaneSpinFlow_gauge_commutes g i j t (v x)).symm
    _ = pairedGaugeData.fermion g ((sourceSpinFullL2CLM i j t v) x) :=
      congrArg (pairedGaugeData.fermion g) hxFin.symm
    _ = (pairedGaugeData.fiberAction g (sourceSpinFullL2CLM i j t v)) x :=
      hxGout.symm

/-- Pointwise-constant fermionic flow commutes with the original
measure-preserving boson pullback on the genuine BFSS FullL2. -/
theorem sourceSpinFullL2CLM_comm_boson
    (i j : SpaceIndex) (t : ℝ) (g : GaugeGroup 2)
    (v : FullL2 2) :
    sourceSpinFullL2CLM i j t (pairedGaugeData.bosonPullback g v) =
      pairedGaugeData.bosonPullback g (sourceSpinFullL2CLM i j t v) := by
  apply Lp.ext
  have hFout := ContinuousLinearMap.coeFn_compLp
    (sourceSpinFockIsometry i j t).toContinuousLinearMap
    (pairedGaugeData.bosonPullback g v)
  have hBin := Lp.coeFn_compMeasurePreserving v
    (pairedGaugeData.boson g).measurePreserving
  have hBout := Lp.coeFn_compMeasurePreserving
    (sourceSpinFullL2CLM i j t v)
    (pairedGaugeData.boson g).measurePreserving
  have hFin := ContinuousLinearMap.coeFn_compLp
    (sourceSpinFockIsometry i j t).toContinuousLinearMap v
  have hFinComp := Filter.EventuallyEq.comp_tendsto hFin
    (pairedGaugeData.boson g).measurePreserving.quasiMeasurePreserving.tendsto_ae
  filter_upwards [hFout, hBin, hBout, hFinComp]
    with x hxFout hxBin hxBout hxFin
  calc
    (sourceSpinFullL2CLM i j t (pairedGaugeData.bosonPullback g v)) x =
      sourceSpinFockIsometry i j t ((pairedGaugeData.bosonPullback g v) x) :=
        hxFout
    _ = sourceSpinFockIsometry i j t (v (pairedGaugeData.boson g x)) :=
      congrArg (sourceSpinFockIsometry i j t) hxBin
    _ = (sourceSpinFullL2CLM i j t v) (pairedGaugeData.boson g x) :=
      hxFin.symm
    _ = (pairedGaugeData.bosonPullback g (sourceSpinFullL2CLM i j t v)) x :=
      hxBout.symm

/-- S3H's true fermionic rotation acts on the LITERAL gauge-invariant
submodule, with no Hamiltonian domain assumptions or proxy gauge action. -/
theorem sourceSpinFullL2CLM_mem_physical
    (i j : SpaceIndex) (t : ℝ)
    (v : FullL2 2) (hv : v ∈ pairedGaugeData.physicalSpace) :
    sourceSpinFullL2CLM i j t v ∈ pairedGaugeData.physicalSpace := by
  have hphys (g : GaugeGroup 2) :
      pairedGaugeData.bosonPullback g v =
        pairedGaugeData.fiberAction g v := by
    have hm : v ∈
        (⨅ h : GaugeGroup 2,
          LinearMap.ker (pairedGaugeData.bosonPullback h -
            pairedGaugeData.fiberAction h)) := hv
    exact sub_eq_zero.mp ((Submodule.mem_iInf _).mp hm g)
  change sourceSpinFullL2CLM i j t v ∈
    (⨅ g : GaugeGroup 2,
      LinearMap.ker (pairedGaugeData.bosonPullback g -
        pairedGaugeData.fiberAction g))
  apply (Submodule.mem_iInf _).mpr
  intro g
  apply LinearMap.mem_ker.mpr
  apply sub_eq_zero.mpr
  calc
    pairedGaugeData.bosonPullback g (sourceSpinFullL2CLM i j t v) =
      sourceSpinFullL2CLM i j t (pairedGaugeData.bosonPullback g v) :=
        (sourceSpinFullL2CLM_comm_boson i j t g v).symm
    _ = sourceSpinFullL2CLM i j t (pairedGaugeData.fiberAction g v) :=
      congrArg (sourceSpinFullL2CLM i j t) (hphys g)
    _ = pairedGaugeData.fiberAction g (sourceSpinFullL2CLM i j t v) :=
      sourceSpinFullL2CLM_comm_fiber i j t g v

#print axioms sourceSpinFullL2CLM_comm_fiber
#print axioms sourceSpinFullL2CLM_comm_boson
#print axioms sourceSpinFullL2CLM_mem_physical
end
end FCP.BFSSSU2PhysicalDomainS3K1
