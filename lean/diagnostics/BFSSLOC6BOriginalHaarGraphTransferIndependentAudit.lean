import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC6BOriginalHaarGraphTransfer

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSLOC6BIndependent
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSLOC6B FCP.BFSSICDB0

theorem originalSU2HaarGraphTransferAudit (M : AlgebraData 2) (G : M.GaugeData)
    (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (hp : (u, v) ∈ closure (Set.range (fun f : SmoothCore 2 =>
      (coreToL2 f, coreToL2 (M.charge a f))))) :
    (u, v) ∈ originalIndividualClosedGraph M G a :=
  ambient_to_physical_graph M G a u v hu hv hp

theorem originalSU2WeakExtensionAudit (M : AlgebraData 2) (G : M.GaugeData)
    (a : SpinIndex) (u v : FullL2 2)
    (hu : u ∈ G.physicalSpace) (hv : v ∈ G.physicalSpace)
    (h : ∀ f : G.invariantCore,
      inner ℂ (coreToL2 (M.charge a f.val)) u = inner ℂ (coreToL2 f.val) v) :
    ∀ f : SmoothCore 2,
      inner ℂ (coreToL2 (M.charge a f)) u = inner ℂ (coreToL2 f) v :=
  physical_weak_pair_ambient M G a u v hu hv h

#print axioms originalSU2HaarGraphTransferAudit
#print axioms originalSU2WeakExtensionAudit
end
end FCP.BFSSLOC6BIndependent
