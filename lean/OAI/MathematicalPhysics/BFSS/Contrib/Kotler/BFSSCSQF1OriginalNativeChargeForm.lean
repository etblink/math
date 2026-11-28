import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSCSQF0OriginalClosedJointPairing

/-! CSQ-F1: identify the native individual output with the selected
original Hilbert column coordinate, then identify the normalized form.
No operator-square or spectral conclusion. -/
set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSCSQF1
noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J
open FCP.BFSSNAG0 FCP.BFSSNAG1 FCP.BFSSICDB0 FCP.BFSSICDC0
open FCP.BFSSSU2PhysicalDomainL6H5E8AU FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSCSQF0
open scoped BigOperators

/-- AY native graph points yield literal original ambient joint points. -/
theorem source_column_point {N : ℕ} (M : AlgebraData N) (G : M.GaugeData)
    (u : (originalMinimalPhysicalHilbertChargeColumn M G).domain) :
    (((u : G.physicalSpace) : FullL2 N),
      originalMinimalHilbertOutputEquiv (originalMinimalPhysicalHilbertChargeColumn M G u))
      ∈ originalMinimalClosedGraph M G := by
  have hp := (originalMinimalPhysicalHilbertChargeColumn M G).mem_graph u
  rw [originalMinimalPhysicalHilbertChargeColumn_graph_eq M G] at hp
  exact (originalMinimalPhysicalHilbertChargeGraph_mem_iff M G _).mp hp

/-- Match native individual output using the already qualified full
graph uniqueness. No new physical output subtype is constructed. -/
theorem source_output_of_common_input {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (u : (originalMinimalPhysicalHilbertChargeColumn M G).domain)
    (v : (individualPhysicalOperator M G a).domain)
    (he : (v : G.physicalSpace) = (u : G.physicalSpace)) :
    originalMinimalHilbertOutputEquiv (originalMinimalPhysicalHilbertChargeColumn M G u) a =
      (individualPhysicalOperator M G a v : FullL2 N) := by
  have hp := (individualPhysicalOperator M G a).mem_graph v
  rw [individualPhysicalOperator_graph_eq M G a h] at hp
  have hi := (individualPhysicalGraph_mem_iff M G a
    (v : G.physicalSpace) (individualPhysicalOperator M G a v)).mp hp
  obtain ⟨y, hy, ha⟩ := (source_component_graph_iff M G a h
    ((v : G.physicalSpace) : FullL2 N)
    (individualPhysicalOperator M G a v : FullL2 N)).mp hi
  rw [he] at hy
  have hj := source_column_point M G u
  have eqy := M.fullClosedGraph_unique (originalMinimalClosedGraph_le_full M G hj)
    (originalMinimalClosedGraph_le_full M G hy)
  exact (congrFun eqy a).trans ha

/-- The finite sum is the actual PiLp-two inner product, not a product norm. -/
theorem normalized_constant_pairing {F : Type*}
    [NormedAddCommGroup F] [InnerProductSpace ℂ F]
    (x y : PiLp 2 (fun _ : Fin 16 => F)) (a : Fin 16)
    (h : ∀ b : Fin 16, inner ℂ (x b) (y b) = inner ℂ (x a) (y a)) :
    inner ℂ (x a) (y a) = (1 / 16 : ℂ) * inner ℂ x y := by
  rw [PiLp.inner_apply]
  simp only [h, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  ring

def pairedIndividualInput (a : SpinIndex)
    (u : (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain) :
    (individualPhysicalOperator pairedAlgebraData pairedGaugeData a).domain :=
  ⟨(u : pairedGaugeData.physicalSpace), by
    rw [paired_native_domain_eq a]
    exact u.property⟩

theorem paired_native_output (a : SpinIndex)
    (u : (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain) :
    originalMinimalHilbertOutputEquiv
      (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData u) a =
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a
        (pairedIndividualInput a u) : FullL2 2) :=
  source_output_of_common_input pairedAlgebraData pairedGaugeData a
    (fun f b => paired_core_charge_norm a b f) u (pairedIndividualInput a u) rfl

theorem paired_normalized_form (a : SpinIndex)
    (u v : (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData).domain) :
    inner ℂ (individualPhysicalOperator pairedAlgebraData pairedGaugeData a (pairedIndividualInput a u))
      (individualPhysicalOperator pairedAlgebraData pairedGaugeData a (pairedIndividualInput a v)) =
      (1 / 16 : ℂ) * inner ℂ
        (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData u)
        (originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData v) := by
  let T := originalMinimalPhysicalHilbertChargeColumn pairedAlgebraData pairedGaugeData
  have hu := source_column_point pairedAlgebraData pairedGaugeData u
  have hv := source_column_point pairedAlgebraData pairedGaugeData v
  have hc (b : SpinIndex) : inner ℂ (T u b) (T v b) = inner ℂ (T u a) (T v a) :=
    paired_closed_joint_pairing b a _ _ hu hv
  have hs := normalized_constant_pairing (T u) (T v) a hc
  have h1 : T u a = (individualPhysicalOperator pairedAlgebraData pairedGaugeData a
      (pairedIndividualInput a u) : FullL2 2) := paired_native_output a u
  have h2 : T v a = (individualPhysicalOperator pairedAlgebraData pairedGaugeData a
      (pairedIndividualInput a v) : FullL2 2) := paired_native_output a v
  rw [h1, h2] at hs
  exact hs

#print axioms source_column_point
#print axioms source_output_of_common_input
#print axioms normalized_constant_pairing
#print axioms paired_native_output
#print axioms paired_normalized_form
end
end FCP.BFSSCSQF1
