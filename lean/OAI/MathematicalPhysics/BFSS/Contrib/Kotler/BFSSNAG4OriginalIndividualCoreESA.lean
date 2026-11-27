import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSNAG3OriginalIndividualCoreClosure

/-! NAG4: explicit essential self-adjointness of the literal original
invariant smooth-core operator. Reuses NAG2, NAG3 and original Haar
density; no new core, extension hypothesis, square or spectral claim. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSNAG4
noncomputable section
open Set Topology
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSNAG0 FCP.BFSSNAG1 FCP.BFSSNAG2 FCP.BFSSNAG3 FCP.BFSSICDC0
open FCP.BFSSSU2PhysicalDomainD2B10C
open FCP.BFSSSU2GaugeG1A FCP.BFSSSU2GaugeG4J

theorem source_native_core_mem_domain {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ u v : FullL2 N, u ∈ G.physicalSpace →
      (u, v) ∈ originalIndividualClosedGraph M G a → v ∈ G.physicalSpace)
    (f : G.invariantCore) :
    (⟨coreToL2 f.val, f.property⟩ : G.physicalSpace) ∈
      (nativeCoreOperator M G a).domain := by
  let u : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
  let v : G.physicalSpace := ⟨coreToL2 (M.charge a f.val),
    hout _ _ f.property (source_core_pair_mem M G a f)⟩
  have hg : (u, v) ∈ (nativeCoreOperator M G a).graph := by
    rw [nativeCoreOperator_graph_eq M G a h]
    exact (nativeCoreGraph_mem_iff M G a u v).mpr ⟨f, rfl, rfl⟩
  exact LinearPMap.mem_domain_of_mem_graph hg

theorem source_native_core_dense_of_normClosure {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ u v : FullL2 N, u ∈ G.physicalSpace →
      (u, v) ∈ originalIndividualClosedGraph M G a → v ∈ G.physicalSpace)
    (hd : G.coreNormClosure = G.physicalSpace) :
    Dense ((nativeCoreOperator M G a).domain : Set G.physicalSpace) := by
  rw [Subtype.dense_iff]
  have hs :
      (LinearMap.range (coreToL2.comp G.invariantCore.subtype) :
        Set (FullL2 N)) ⊆
      ((↑) '' ((nativeCoreOperator M G a).domain :
        Set G.physicalSpace) : Set (FullL2 N)) := by
    rintro ψ ⟨f, rfl⟩
    let u : G.physicalSpace := ⟨coreToL2 f.val, f.property⟩
    exact ⟨u, source_native_core_mem_domain M G a h hout f, rfl⟩
  calc
    (G.physicalSpace : Set (FullL2 N)) =
        (G.coreNormClosure : Set (FullL2 N)) :=
      congrArg (fun S : Submodule ℂ (FullL2 N) => (S : Set (FullL2 N))) hd.symm
    _ = closure (LinearMap.range
        (coreToL2.comp G.invariantCore.subtype) : Set (FullL2 N)) := rfl
    _ ⊆ closure ((↑) '' ((nativeCoreOperator M G a).domain :
        Set G.physicalSpace) : Set (FullL2 N)) := closure_mono hs

/-- Symmetry is transported from the actual literal graph, not from a
new operator or a formal differential expression. -/
theorem source_native_core_symmetric {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖) :
    (nativeCoreOperator M G a).IsFormalAdjoint (nativeCoreOperator M G a) := by
  intro x y
  have hx := (nativeCoreOperator M G a).mem_graph x
  have hy := (nativeCoreOperator M G a).mem_graph y
  rw [nativeCoreOperator_graph_eq M G a h] at hx hy
  obtain ⟨f, hf, hqf⟩ := (nativeCoreGraph_mem_iff M G a _ _).mp hx
  obtain ⟨g, hg, hqg⟩ := (nativeCoreGraph_mem_iff M G a _ _).mp hy
  change inner ℂ (((nativeCoreOperator M G a) x : G.physicalSpace) : FullL2 N)
      ((y : G.physicalSpace) : FullL2 N) =
    inner ℂ ((x : G.physicalSpace) : FullL2 N)
      (((nativeCoreOperator M G a) y : G.physicalSpace) : FullL2 N)
  rw [← hqf, ← hg, ← hf, ← hqg]
  exact M.charge_symmetric a f.val g.val

theorem source_native_core_closable {N : ℕ} (M : AlgebraData N)
    (G : M.GaugeData) (a : SpinIndex)
    (h : ∀ (f : G.invariantCore) (b : SpinIndex),
      ‖coreToL2 (M.charge b f.val)‖ = ‖coreToL2 (M.charge a f.val)‖)
    (hout : ∀ u v : FullL2 N, u ∈ G.physicalSpace →
      (u, v) ∈ originalIndividualClosedGraph M G a → v ∈ G.physicalSpace) :
    (nativeCoreOperator M G a).IsClosable :=
  ⟨individualPhysicalOperator M G a, source_native_core_graph_closure M G a h hout⟩

private theorem selfAdjoint_closure_transport {E : Type*}
    [NormedAddCommGroup E] [InnerProductSpace ℂ E] [CompleteSpace E]
    (A B : E →ₗ.[ℂ] E) (h : A.closure = B) (hs : IsSelfAdjoint B) :
    IsSelfAdjoint A.closure := by
  rw [h]
  exact hs

theorem paired_native_core_selfAdjoint_closure (a : SpinIndex) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    IsSelfAdjoint (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure := by
  let : CompleteSpace pairedGaugeData.physicalSpace :=
    pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
  exact selfAdjoint_closure_transport _ _ (paired_native_core_closure a)
    (paired_native_selfAdjoint a)

/-- Explicit ESA interface: the literal core is dense, symmetric and
closable, and its native closure is self-adjoint on the actual physical space. -/
theorem paired_native_core_esa (a : SpinIndex) :
    letI : CompleteSpace pairedGaugeData.physicalSpace :=
      pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
    Dense ((nativeCoreOperator pairedAlgebraData pairedGaugeData a).domain :
      Set pairedGaugeData.physicalSpace) ∧
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).IsFormalAdjoint
      (nativeCoreOperator pairedAlgebraData pairedGaugeData a) ∧
    (nativeCoreOperator pairedAlgebraData pairedGaugeData a).IsClosable ∧
    IsSelfAdjoint (nativeCoreOperator pairedAlgebraData pairedGaugeData a).closure := by
  let : CompleteSpace pairedGaugeData.physicalSpace :=
    pairedGaugeData.physicalSpace_closed.isComplete.completeSpace_coe
  exact ⟨source_native_core_dense_of_normClosure pairedAlgebraData pairedGaugeData a
      (fun f b => paired_core_charge_norm a b f)
      (source_individual_output_physical pairedAlgebraData pairedGaugeData a
        (fun f b => paired_core_charge_norm a b f))
      (sourceCoreNormClosure_eq_physical_unconditional pairedAlgebraData pairedGaugeData),
    source_native_core_symmetric pairedAlgebraData pairedGaugeData a
      (fun f b => paired_core_charge_norm a b f),
    source_native_core_closable pairedAlgebraData pairedGaugeData a
      (fun f b => paired_core_charge_norm a b f)
      (source_individual_output_physical pairedAlgebraData pairedGaugeData a
        (fun f b => paired_core_charge_norm a b f)),
    paired_native_core_selfAdjoint_closure a⟩

#print axioms source_native_core_mem_domain
#print axioms source_native_core_dense_of_normClosure
#print axioms source_native_core_symmetric
#print axioms source_native_core_closable
#print axioms paired_native_core_selfAdjoint_closure
#print axioms paired_native_core_esa
end
end FCP.BFSSNAG4
