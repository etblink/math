import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSGM5COriginalMasslessCoreMomentControl
import OAI.MathematicalPhysics.BFSS.SobolevGraphs

/-! Strong convergence to the source closed gradient for a fixed-radius
invariant core sequence converging in the native charge graph. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSGM5D
noncomputable section

open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2PhysicalDomainL6H5E8AY
open FCP.BFSSGM5B FCP.BFSSGM5C
open MeasureTheory Filter Topology

abbrev CoordinateIndex (N : ℕ) := SpaceIndex × ColorIndex N

/-- The original directions used by `coordinateDerivative`. -/
def coordinateDirection {N : ℕ} (p : CoordinateIndex N) : Boson N :=
  EuclideanSpace.single p 1

/-- The original vector-valued Sobolev gradient on smooth vectors. -/
abbrev sourceCoreGradient {N : ℕ} (f : SmoothCore N) :
    PiLp 2 (fun _ : CoordinateIndex N => FullL2 N) :=
  BFSSSliceSobolev.gradient (volume : Measure (Boson N)) coordinateDirection f

/-- The Sobolev gradient has exactly the squared norm in the core kinetic term. -/
theorem sourceCoreGradient_norm_sq {N : ℕ} (f : SmoothCore N) :
    ‖sourceCoreGradient f‖ ^ 2 =
      ∑ p : CoordinateIndex N, ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖ ^ 2 := by
  rw [PiLp.norm_sq_eq_of_L2]
  apply Finset.sum_congr rfl
  rintro ⟨i, a⟩ _
  rw [BFSSSliceSobolev.gradient_apply]
  have hd : TestFunction.lineDerivCLM (k := ⊤) ℝ (coordinateDirection (i, a)) f =
      coordinateDerivative i a f := by
    apply DFunLike.ext
    intro x
    change (TestFunction.lineDerivCLM (k := ⊤) ℝ
      (EuclideanSpace.single (i, a) 1) f) x =
      (TestFunction.lineDerivCLM (k := ⊤) ℂ (EuclideanSpace.single (i, a) 1) f) x
    simp only [TestFunction.lineDerivCLM_apply]
  change ‖coreToL2 (TestFunction.lineDerivCLM (k := ⊤) ℝ
    (coordinateDirection (i, a)) f)‖ ^ 2 = _
  rw [hd]

/-- The exact native charge output of an embedded invariant core vector. -/
abbrev nativeCoreChargeValue (M : AlgebraData 2) (G : M.GaugeData) (f : G.invariantCore) :
    PiLp 2 (fun _ : SpinIndex => FullL2 2) :=
  originalMinimalPhysicalHilbertChargeColumn M G (closedChargeCoreInput M G f)

private theorem nativeCoreChargeValue_sub (M : AlgebraData 2) (G : M.GaugeData)
    (f g : G.invariantCore) :
    nativeCoreChargeValue M G (f - g) =
      nativeCoreChargeValue M G f - nativeCoreChargeValue M G g := by
  have hinput : closedChargeCoreInput M G (f - g) =
      closedChargeCoreInput M G f - closedChargeCoreInput M G g := by
    apply Subtype.ext
    apply Subtype.ext
    exact map_sub coreToL2 f.val g.val
  change originalMinimalPhysicalHilbertChargeColumn M G
    (closedChargeCoreInput M G (f - g)) = _
  rw [hinput, map_sub]

/-- The squared gradient norm is bounded by the squared native charge norm
and a fixed-radius mass term. -/
theorem fixedRadiusCoreGradient_sq_le (M : AlgebraData 2) (G : M.GaugeData)
    (f : G.invariantCore) (R : ℝ) (hzero : ∀ x : Boson 2, R < ‖x‖ → f.val x = 0) :
    ‖sourceCoreGradient f.val‖ ^ 2 ≤
      (1 / 8 : ℝ) * ‖nativeCoreChargeValue M G f‖ ^ 2 +
        (2 * (M.fermionGrowthConstant * R)) * ‖coreToL2 f.val‖ ^ 2 := by
  have hb := (abs_le.mp (nativeCoreEnergy_difference_le_of_support M G f R hzero)).1
  have hpot : 0 ≤ (∫ x : Boson 2, M.deformedBosonicPotential 1 0 x * ‖f.val x‖ ^ 2) :=
    integral_nonneg (fun x => mul_nonneg (M.deformedBosonicPotential_nonneg 1 0 x) (sq_nonneg _))
  rw [kineticPotentialCoreEnergy, ← sourceCoreGradient_norm_sq] at hb
  linarith only [hb, hpot]

private theorem cauchySeq_of_sq_distance_le {E F H : Type*} [PseudoMetricSpace E]
    [PseudoMetricSpace F] [PseudoMetricSpace H] (a : ℝ) (b : ℝ)
    (u : ℕ → E) (v : ℕ → F) (w : ℕ → H) (hu : CauchySeq u) (hv : CauchySeq v)
    (h : ∀ n m, dist (w n) (w m) ^ 2 ≤ a * dist (u n) (u m) ^ 2 +
      b * dist (v n) (v m) ^ 2) : CauchySeq w := by
  have hu0 := cauchySeq_iff_tendsto_dist_atTop_0.mp hu
  have hv0 := cauchySeq_iff_tendsto_dist_atTop_0.mp hv
  let bound (p : ℕ × ℕ) := a * dist (u p.1) (u p.2) ^ 2 + b * dist (v p.1) (v p.2) ^ 2
  have hb : Tendsto bound atTop (𝓝 (0 : ℝ)) := by
    simpa only [zero_pow (by decide : (2 : ℕ) ≠ 0), mul_zero, add_zero] using
      ((hu0.pow 2).const_mul a).add ((hv0.pow 2).const_mul b)
  have hs : Tendsto (fun p => Real.sqrt (bound p)) atTop (𝓝 0) := by
    simpa only [Real.sqrt_zero] using hb.sqrt
  apply cauchySeq_iff_tendsto_dist_atTop_0.mpr
  apply squeeze_zero (fun _ => dist_nonneg) _ hs
  intro p
  have hp := h p.1 p.2
  exact (Real.le_sqrt dist_nonneg ((sq_nonneg _).trans hp)).2 hp

/-- Common-radius smooth core approximations converging in the native charge
graph converge strongly to a gradient in the original closed Sobolev graph.
The core kinetic energies converge to half the squared norm of that gradient. -/
theorem fixedRadiusNativeGraph_gradientLimit (M : AlgebraData 2) (G : M.GaugeData)
    (R : ℝ) (f : ℕ → G.invariantCore)
    (hzero : ∀ n (x : Boson 2), R < ‖x‖ → (f n).val x = 0)
    (u : FullL2 2) (v : PiLp 2 (fun _ : SpinIndex => FullL2 2))
    (hu : Tendsto (fun n => coreToL2 (f n).val) atTop (𝓝 u))
    (hv : Tendsto (fun n => nativeCoreChargeValue M G (f n)) atTop (𝓝 v)) :
    ∃ g : PiLp 2 (fun _ : CoordinateIndex 2 => FullL2 2),
      (u, g) ∈ BFSSSliceSobolev.closedGraph (volume : Measure (Boson 2)) coordinateDirection ∧
      Tendsto (fun n => sourceCoreGradient (f n).val) atTop (𝓝 g) ∧
      Tendsto (fun n => (1 / 2 : ℝ) * ∑ p : CoordinateIndex 2,
        ‖coreToL2 (coordinateDerivative p.1 p.2 (f n).val)‖ ^ 2)
        atTop (𝓝 ((1 / 2 : ℝ) * ‖g‖ ^ 2)) := by
  have hc : CauchySeq (fun n => sourceCoreGradient (f n).val) := by
    apply cauchySeq_of_sq_distance_le (1 / 8 : ℝ) (2 * (M.fermionGrowthConstant * R))
      (fun n => nativeCoreChargeValue M G (f n)) (fun n => coreToL2 (f n).val)
      _ hv.cauchySeq hu.cauchySeq
    intro n m
    have hsub : ∀ x : Boson 2, R < ‖x‖ → (f n - f m).val x = 0 := by
      intro x hx
      change (f n).val x - (f m).val x = 0
      rw [hzero n x hx, hzero m x hx, sub_self]
    have hgsub : sourceCoreGradient ((f n - f m).val) =
        sourceCoreGradient (f n).val - sourceCoreGradient (f m).val := by
      exact map_sub (BFSSSliceSobolev.gradient (volume : Measure (Boson 2))
        coordinateDirection) (f n).val (f m).val
    have hmass : coreToL2 ((f n - f m).val) =
        coreToL2 (f n).val - coreToL2 (f m).val := map_sub coreToL2 _ _
    simpa only [dist_eq_norm, hgsub, nativeCoreChargeValue_sub, hmass] using
      fixedRadiusCoreGradient_sq_le M G (f n - f m) R hsub
  obtain ⟨g, hg⟩ := cauchySeq_tendsto_of_complete hc
  have hgraph : IsClosed (BFSSSliceSobolev.closedGraph (F := Fermion 2)
      (volume : Measure (Boson 2)) coordinateDirection : Set _) :=
    (BFSSSliceSobolev.graph (F := Fermion 2)
      (volume : Measure (Boson 2)) coordinateDirection).isClosed_topologicalClosure
  refine ⟨g, hgraph.mem_of_tendsto (hu.prodMk_nhds hg) (Eventually.of_forall ?_), hg, ?_⟩
  · intro n
    exact BFSSSliceSobolev.core_mem_closedGraph (volume : Measure (Boson 2))
      coordinateDirection (f n).val
  · simpa only [sourceCoreGradient_norm_sq] using (hg.norm.pow 2).const_mul (1 / 2 : ℝ)

#print axioms coordinateDirection
#print axioms sourceCoreGradient_norm_sq
#print axioms fixedRadiusCoreGradient_sq_le
#print axioms fixedRadiusNativeGraph_gradientLimit

end
end FCP.BFSSGM5D
