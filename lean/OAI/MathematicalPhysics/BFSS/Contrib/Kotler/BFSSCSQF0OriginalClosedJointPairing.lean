import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG4OriginalIndividualCoreESA

/-! CSQ-F0: literal original complex core pairing and its two-variable
extension to the original ambient closed joint graph. No polarization,
operator square, weak Hamiltonian or spectral conclusion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF0
noncomputable section
open Set Topology
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSICDA0 FCP.BFSSSU2PhysicalDomainL6H5E8AU
open FCP.BFSSSU2PhysicalDomainL6G3

/-- Pairing transport at an abstract output type; no concrete
smooth-core or Hilbert carrier reduction is needed in the equality chain. -/
private theorem abstractSymmetricPairing {D E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E]
    (J : D → E) (A B : D → D) (f g : D)
    (ha : inner ℂ (J (A f)) (J (A g)) = inner ℂ (J f) (J (A (A g))))
    (hb : inner ℂ (J (B f)) (J (B g)) = inner ℂ (J f) (J (B (B g))))
    (h : A (A g) = B (B g)) :
    inner ℂ (J (A f)) (J (A g)) = inner ℂ (J (B f)) (J (B g)) :=
  ha.trans ((congrArg (fun k : D => inner ℂ (J f) (J k)) h).trans hb.symm)

theorem symmetricPairing {A B : SourceEnd 2}
    (hA : CoreSymmetric A) (hB : CoreSymmetric B)
    (f g : SmoothCore 2) (h : A (A g) = B (B g)) :
    inner ℂ (coreToL2 (A f)) (coreToL2 (A g)) =
      inner ℂ (coreToL2 (B f)) (coreToL2 (B g)) :=
  abstractSymmetricPairing (fun k : SmoothCore 2 => coreToL2 k)
    (fun k : SmoothCore 2 => A k) (fun k : SmoothCore 2 => B k)
    f g (hA f (A g)) (hB f (B g)) h

theorem paired_core_pairing (a b : SpinIndex)
    (f g : pairedGaugeData.invariantCore) :
    inner ℂ (coreToL2 (pairedAlgebraData.charge a f.val))
      (coreToL2 (pairedAlgebraData.charge a g.val)) =
    inner ℂ (coreToL2 (pairedAlgebraData.charge b f.val))
      (coreToL2 (pairedAlgebraData.charge b g.val)) :=
  symmetricPairing (pairedAlgebraData.charge_symmetric a)
    (pairedAlgebraData.charge_symmetric b) f.val g.val
    (FCP.BFSSCSQE0.basisSquareCore a b g)

/-- Separate closedness in each argument extends a pairing identity
from S x S to closure S x closure S. No sequential approximation. -/
theorem pairing_on_closure {X F : Type*} [TopologicalSpace X]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (S : Set X) (A B : X → F) (ha : Continuous A) (hb : Continuous B)
    (h : ∀ x y : X, x ∈ S → y ∈ S →
      inner ℂ (A x) (A y) = inner ℂ (B x) (B y))
    (x y : X) (hx : x ∈ closure S) (hy : y ∈ closure S) :
    inner ℂ (A x) (A y) = inner ℂ (B x) (B y) := by
  have hright (p : X) (hp : p ∈ S) :
      inner ℂ (A p) (A y) = inner ℂ (B p) (B y) := by
    let T : Set X := {q | inner ℂ (A p) (A q) = inner ℂ (B p) (B q)}
    have ht : IsClosed T := isClosed_eq (continuous_const.inner ha)
      (continuous_const.inner hb)
    have hs : S ⊆ T := fun q hq => h p q hp hq
    exact closure_minimal hs ht hy
  let T : Set X := {p | inner ℂ (A p) (A y) = inner ℂ (B p) (B y)}
  have ht : IsClosed T := isClosed_eq (ha.inner continuous_const)
    (hb.inner continuous_const)
  have hs : S ⊆ T := fun p hp => hright p hp
  exact closure_minimal hs ht hx

theorem joint_range_pairing {D E F ι : Type*} [TopologicalSpace E]
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (J : D → E) (A : ι → D → F) (a b : ι)
    (h : ∀ f g : D, inner ℂ (A a f) (A a g) =
      inner ℂ (A b f) (A b g))
    (p q : E × (ι → F))
    (hp : p ∈ closure (Set.range (fun f : D => (J f, fun i => A i f))))
    (hq : q ∈ closure (Set.range (fun f : D => (J f, fun i => A i f)))) :
    inner ℂ (p.2 a) (q.2 a) = inner ℂ (p.2 b) (q.2 b) := by
  let S : Set (E × (ι → F)) := Set.range (fun f : D => (J f, fun i => A i f))
  let U : E × (ι → F) → F := fun v => v.2 a
  let V : E × (ι → F) → F := fun v => v.2 b
  have hu : Continuous U := (continuous_apply a).comp continuous_snd
  have hv : Continuous V := (continuous_apply b).comp continuous_snd
  have hS : ∀ x y : E × (ι → F), x ∈ S → y ∈ S →
      inner ℂ (U x) (U y) = inner ℂ (V x) (V y) := by
    rintro x y ⟨f, rfl⟩ ⟨g, rfl⟩
    exact h f g
  exact pairing_on_closure S U V hu hv hS p q hp hq

theorem paired_closed_joint_pairing (a b : SpinIndex)
    (p q : FullL2 2 × (SpinIndex → FullL2 2))
    (hp : p ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData)
    (hq : q ∈ originalMinimalClosedGraph pairedAlgebraData pairedGaugeData) :
    inner ℂ (p.2 a) (q.2 a) = inner ℂ (p.2 b) (q.2 b) := by
  have he := source_joint_closed_graph_eq pairedAlgebraData pairedGaugeData
  change p ∈ (originalMinimalClosedGraph pairedAlgebraData pairedGaugeData :
    Set (FullL2 2 × (SpinIndex → FullL2 2))) at hp
  change q ∈ (originalMinimalClosedGraph pairedAlgebraData pairedGaugeData :
    Set (FullL2 2 × (SpinIndex → FullL2 2))) at hq
  rw [he] at hp hq
  exact joint_range_pairing
    (fun f : pairedGaugeData.invariantCore => coreToL2 f.val)
    (fun i (f : pairedGaugeData.invariantCore) =>
      coreToL2 (pairedAlgebraData.charge i f.val))
    a b (paired_core_pairing a b) p q hp hq

#print axioms symmetricPairing
#print axioms paired_core_pairing
#print axioms pairing_on_closure
#print axioms joint_range_pairing
#print axioms paired_closed_joint_pairing
end
end FCP.BFSSCSQF0
