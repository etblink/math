import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF1OriginalNativeChargeForm
import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.OperatorDependencies.SU2BFSSPhysicalDomainL6H5E8BEOriginalNormalizedPhysicalHamiltonianProbe

/-! CSQ-F2: exact common natural square via equality of weak
representative graphs; no domain invariance or spectral assertion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF2
noncomputable section
open Set
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSNAG0 FCP.BFSSNAG1 FCP.BFSSNAG2 FCP.BFSSNAG3
open FCP.BFSSCSQF1
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSSU2PhysicalDomainL6H5E8BC
open FCP.BFSSSU2PhysicalDomainL6H5E8BE

section Abstract
variable {E F : Type*}
variable [NormedAddCommGroup E] [InnerProductSpace ℂ E]
variable [NormedAddCommGroup F] [InnerProductSpace ℂ F]

theorem graph_iff_representative (P : E →ₗ.[ℂ] E) (x w : E) :
    (x, w) ∈ P.graph ↔ ∃ h : x ∈ P.domain, w = P ⟨x, h⟩ := by
  constructor
  · intro h
    obtain ⟨u, rfl, rfl⟩ := (LinearPMap.mem_graph_iff P).mp h
    exact ⟨u.property, rfl⟩
  · rintro ⟨h, rfl⟩
    exact P.mem_graph ⟨x, h⟩

/-- Equality of form tests under transport between the identical domains. -/
theorem common_form_test_iff (A : E →ₗ.[ℂ] E) (T : E →ₗ.[ℂ] F)
    (hd : A.domain = T.domain)
    (e : T.domain → A.domain) (he : ∀ u, (e u : E) = (u : E))
    (hf : ∀ u v : T.domain, inner ℂ (A (e u)) (A (e v)) =
      (1 / 16 : ℂ) * inner ℂ (T u) (T v))
    (u : T.domain) (w : E) :
    (∀ v : A.domain, inner ℂ w (v : E) = inner ℂ (A (e u)) (A v)) ↔
    (∀ v : T.domain, inner ℂ w (v : E) =
      (1 / 16 : ℂ) * inner ℂ (T u) (T v)) := by
  constructor
  · intro h v
    calc
      inner ℂ w (v : E) = inner ℂ w (e v : E) := by rw [he v]
      _ = inner ℂ (A (e u)) (A (e v)) := h (e v)
      _ = _ := hf u v
  · intro h v
    let t : T.domain := ⟨(v : E), by rw [← hd]; exact v.property⟩
    have ht : e t = v := Subtype.ext (he t)
    calc
      inner ℂ w (v : E) = inner ℂ w (t : E) := rfl
      _ = (1 / 16 : ℂ) * inner ℂ (T u) (T t) := h t
      _ = inner ℂ (A (e u)) (A (e t)) := (hf u t).symm
      _ = _ := by rw [ht]

/-- The actual natural adjoint-square, not a core restriction, is selected
by exactly the same weak representative graph as H. -/
theorem naturalSquare_of_common_form [CompleteSpace E]
    (A : E →ₗ.[ℂ] E) (T : E →ₗ.[ℂ] F) (H : E →ₗ.[ℂ] E)
    (hA : IsSelfAdjoint A) (hd : A.domain = T.domain)
    (e : T.domain → A.domain) (he : ∀ u, (e u : E) = (u : E))
    (hf : ∀ u v : T.domain, inner ℂ (A (e u)) (A (e v)) =
      (1 / 16 : ℂ) * inner ℂ (T u) (T v))
    (hHdom : H.domain ≤ T.domain)
    (hH : ∀ (u : T.domain) (w : E),
      (∀ v : T.domain, inner ℂ w (v : E) =
        (1 / 16 : ℂ) * inner ℂ (T u) (T v)) ↔
      ∃ h : (u : E) ∈ H.domain, w = H ⟨u, h⟩) :
    naturalComp A A = H := by
  have hg (u : T.domain) (w : E) :
      ((u : E), w) ∈ (naturalComp A.adjoint A).graph ↔
      ((u : E), w) ∈ H.graph := by
    have h1 := (weakRepresentative_iff_naturalAdjointSquare A hA.dense_domain
      (e u) w).trans (graph_iff_representative (naturalComp A.adjoint A) (e u : E) w).symm
    have h2 : (∀ v : A.domain, inner ℂ w (v : E) =
        inner ℂ (A (e u)) (A v)) ↔
        ((u : E), w) ∈ (naturalComp A.adjoint A).graph := by
      simpa only [he u] using h1
    exact h2.symm.trans ((common_form_test_iff A T hd e he hf u w).trans
      ((hH u w).trans (graph_iff_representative H (u : E) w).symm))
  have hEq : naturalComp A.adjoint A = H := by
    apply LinearPMap.eq_of_eq_graph
    apply Submodule.ext
    rintro ⟨x, w⟩
    constructor
    · intro h
      have ha : x ∈ A.domain :=
        naturalComp_domain_le (LinearPMap.mem_domain_of_mem_graph h)
      have ht : x ∈ T.domain := by rw [← hd]; exact ha
      exact (hg ⟨x, ht⟩ w).mp h
    · intro h
      have ht : x ∈ T.domain :=
        hHdom (LinearPMap.mem_domain_of_mem_graph h)
      exact (hg ⟨x, ht⟩ w).mpr h
  rw [LinearPMap.isSelfAdjoint_def.mp hA] at hEq
  exact hEq
end Abstract

/-- Transport the BE Hamiltonian-domain inclusion without concrete
elaboration of the paired carrier. -/
theorem source_hamiltonian_domain_le (M : AlgebraData 2) (G : M.GaugeData) :
    (originalMinimalPhysicalNormalizedHamiltonian M G).domain ≤
      (originalMinimalPhysicalHilbertChargeColumn M G).domain := by
  rw [originalMinimalPhysicalNormalizedHamiltonian_domain]
  exact naturalComp_domain_le

/-- The genuine closed individual original charge squares to the exact
BE Hamiltonian as a LinearPMap, hence with identical domain and action. -/
theorem paired_native_common_square (a : SpinIndex) :
    naturalComp (individualPhysicalOperator pairedAlgebraData pairedGaugeData a)
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a) =
    originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData := by
  let : CompleteSpace pairedGaugeData.physicalSpace :=
    pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
  exact naturalSquare_of_common_form
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a)
    (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData)
    (originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData)
    (paired_native_selfAdjoint a) (paired_native_domain_eq a)
    (pairedIndividualInput a) (fun _ => rfl) (paired_normalized_form a)
    (source_hamiltonian_domain_le pairedAlgebraData pairedGaugeData)
    (originalMinimalPhysicalNormalizedHamiltonian_weakForm_iff pairedAlgebraData pairedGaugeData)

/-- Identify the literal smooth-core closure's natural square, not merely
the separately constructed native individual charge. -/
theorem paired_core_closure_common_square (a : SpinIndex) :
    naturalComp (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure
      (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure =
    originalMinimalPhysicalNormalizedHamiltonian pairedAlgebraData pairedGaugeData := by
  rw [paired_native_core_closure a]
  exact paired_native_common_square a

#print axioms graph_iff_representative
#print axioms common_form_test_iff
#print axioms naturalSquare_of_common_form
#print axioms source_hamiltonian_domain_le
#print axioms paired_native_common_square
#print axioms paired_core_closure_common_square
end
end FCP.BFSSCSQF2
