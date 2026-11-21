import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.D1S0OriginalQuantizedCARGaugeBridge
import OAI.MathematicalPhysics.BFSS.FermionQuantization

/-!
D1S1 — exact original real 48-index frequency coefficient pushforward.
The four-index finite-sum lemma is separated from source G4J theta
covariance; the original D1R0 complex quadratic is not imported.

PROSPECTIVE until source/consumer strict Lean qualification.
No projector rank, SmoothCore, physical spectrum or Hopfion claim.
-/
set_option autoImplicit false

namespace FCP.BFSSHopfD1S1
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSSU2GaugeG1A
open FCP.BFSSSU2GaugeG4J

private abbrev M : AlgebraData 2 := pairedAlgebraData
private abbrev G : M.GaugeData := pairedGaugeData

/-- Source real 48×48 pushforward: color rows are OUTPUT and
color columns are INPUT, as in qualified G3A. -/
noncomputable def sourceTransportFrequency
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) : FrequencyMatrix 2 :=
  fun p q =>
    ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
      K (p.1, A) (q.1, B) *
        (M.adjointCoefficient g A p.2 *
          M.adjointCoefficient g B q.2)

theorem sourceTransportFrequency_apply
    (g : GaugeGroup 2) (K : FrequencyMatrix 2)
    (p q : FrequencyIndex 2) :
    sourceTransportFrequency g K p q =
      ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
        K (p.1, A) (q.1, B) *
          (M.adjointCoefficient g A p.2 *
            M.adjointCoefficient g B q.2) := rfl

/-- Pure finite additive theorem: four nested summations commute. -/
private theorem exchangeFourSums
    {I J P Q W : Type*}
    [Fintype I] [Fintype J] [Fintype P] [Fintype Q]
    [AddCommMonoid W] (f : I → J → P → Q → W) :
    (∑ i, ∑ j, ∑ p, ∑ q, f i j p q) =
      ∑ p, ∑ q, ∑ i, ∑ j, f i j p q := by
  calc
    _ = ∑ i, ∑ p, ∑ j, ∑ q, f i j p q := by
      apply Finset.sum_congr rfl
      intro i _
      exact Finset.sum_comm
    _ = ∑ p, ∑ i, ∑ j, ∑ q, f i j p q := Finset.sum_comm
    _ = ∑ p, ∑ i, ∑ q, ∑ j, f i j p q := by
      apply Finset.sum_congr rfl
      intro p _
      apply Finset.sum_congr rfl
      intro i _
      exact Finset.sum_comm
    _ = ∑ p, ∑ q, ∑ i, ∑ j, f i j p q := by
      apply Finset.sum_congr rfl
      intro p _
      exact Finset.sum_comm

/-- Pure scalar/finite-sum covariance of an ordered vector-valued
quadratic contraction, for arbitrary real matrices k and r. -/
private theorem exchangeQuadraticColors
    {ι V : Type*} [Fintype ι] [AddCommMonoid V] [Module ℂ V]
    (k : ι → ι → ℝ) (r : ι → ι → ℝ) (w : ι → ι → V) :
    (∑ A, ∑ B, (k A B : ℂ) •
      (∑ C, ∑ D, ((r A C * r B D : ℝ) : ℂ) • w C D)) =
      ∑ C, ∑ D, ((∑ A, ∑ B,
        k A B * (r A C * r B D) : ℝ) : ℂ) • w C D := by
  calc
    _ = ∑ A, ∑ B, ∑ C, ∑ D,
        ((k A B : ℂ) * ((r A C * r B D : ℝ) : ℂ)) • w C D := by
      simp only [Finset.smul_sum, smul_smul]
    _ = ∑ C, ∑ D, ∑ A, ∑ B,
        ((k A B : ℂ) * ((r A C * r B D : ℝ) : ℂ)) • w C D :=
      exchangeFourSums _
    _ = ∑ C, ∑ D, ((∑ A, ∑ B,
          k A B * (r A C * r B D) : ℝ) : ℂ) • w C D := by
      simp only [Complex.ofReal_sum, Complex.ofReal_mul, Finset.sum_smul]

/-- Specialize the purely algebraic exchange to the original BFSS
color coefficients and ORIGINAL ordered theta operator products. -/
private theorem sourceColorExchange
    (g : GaugeGroup 2) (K : FrequencyMatrix 2)
    (α β : SpinIndex) (v : Fermion 2) :
    (∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
      (K (α, A) (β, B) : ℂ) •
        (∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
          ((M.adjointCoefficient g A C : ℂ) *
            (M.adjointCoefficient g B D : ℂ)) •
            M.theta α C (M.theta β D (G.fermion g v)))) =
      ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
        (sourceTransportFrequency g K (α, C) (β, D) : ℂ) •
          M.theta α C (M.theta β D (G.fermion g v)) := by
  simpa only [sourceTransportFrequency, Complex.ofReal_mul] using
    (exchangeQuadraticColors
      (k := fun A B => K (α, A) (β, B))
      (r := fun A C => M.adjointCoefficient g A C)
      (w := fun C D =>
        M.theta α C (M.theta β D (G.fermion g v))))

/-- A vector-level, ordered original 48-Majorana contraction.
The operator itself is always the ORIGINAL quantizeFrequency. -/
private noncomputable def sourceRawQuadratic
    (K : FrequencyMatrix 2) (v : Fermion 2) : Fermion 2 :=
  ∑ α : SpinIndex, ∑ A : ColorIndex 2,
    ∑ β : SpinIndex, ∑ B : ColorIndex 2,
      (K (α, A) (β, B) : ℂ) •
        M.theta α A (M.theta β B v)

/-- Unfold exactly the original quantizer, including its i/2 factor. -/
private theorem sourceQuantize_apply
    (K : FrequencyMatrix 2) (v : Fermion 2) :
    (M.quantizeFrequency K) v =
      (Complex.I / 2) • sourceRawQuadratic K v := by
  simp [AlgebraData.quantizeFrequency, sourceRawQuadratic,
    Fintype.sum_prod_type, _root_.sum_apply,
    IsSMulApply.smul_apply, mul_apply_eq_comp]

/-- Transport every original ordered two-theta monomial; only
commuting SCALAR coefficients, never the theta operators. -/
private theorem sourceRawQuadratic_gauge
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) :
    G.fermion g (sourceRawQuadratic K v) =
      sourceRawQuadratic (sourceTransportFrequency g K) (G.fermion g v) := by
  unfold sourceRawQuadratic
  calc
    G.fermion g
      (∑ α : SpinIndex, ∑ A : ColorIndex 2,
        ∑ β : SpinIndex, ∑ B : ColorIndex 2,
          (K (α, A) (β, B) : ℂ) •
            M.theta α A (M.theta β B v)) =
        ∑ α : SpinIndex, ∑ A : ColorIndex 2,
          ∑ β : SpinIndex, ∑ B : ColorIndex 2,
            (K (α, A) (β, B) : ℂ) •
              G.fermion g (M.theta α A (M.theta β B v)) := by
      simp only [map_sum, map_smul]
    _ = ∑ α : SpinIndex, ∑ A : ColorIndex 2,
          ∑ β : SpinIndex, ∑ B : ColorIndex 2,
            (K (α, A) (β, B) : ℂ) •
              (∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
                ((M.adjointCoefficient g A C : ℂ) *
                  (M.adjointCoefficient g B D : ℂ)) •
                  M.theta α C (M.theta β D (G.fermion g v))) := by
      apply Finset.sum_congr rfl
      intro α _
      apply Finset.sum_congr rfl
      intro A _
      apply Finset.sum_congr rfl
      intro β _
      apply Finset.sum_congr rfl
      intro B _
      rw [FCP.BFSSHopfD1S0.originalThetaPair_covariant g α β A B v]
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ∑ A : ColorIndex 2, ∑ B : ColorIndex 2,
            (K (α, A) (β, B) : ℂ) •
              (∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
                ((M.adjointCoefficient g A C : ℂ) *
                  (M.adjointCoefficient g B D : ℂ)) •
                  M.theta α C (M.theta β D (G.fermion g v))) := by
      apply Finset.sum_congr rfl
      intro α _
      exact Finset.sum_comm
    _ = ∑ α : SpinIndex, ∑ β : SpinIndex,
          ∑ C : ColorIndex 2, ∑ D : ColorIndex 2,
            (sourceTransportFrequency g K (α, C) (β, D) : ℂ) •
              M.theta α C (M.theta β D (G.fermion g v)) := by
      apply Finset.sum_congr rfl
      intro α _
      apply Finset.sum_congr rfl
      intro β _
      exact sourceColorExchange g K α β v
    _ = ∑ α : SpinIndex, ∑ C : ColorIndex 2,
          ∑ β : SpinIndex, ∑ D : ColorIndex 2,
            (sourceTransportFrequency g K (α, C) (β, D) : ℂ) •
              M.theta α C (M.theta β D (G.fermion g v)) := by
      apply Finset.sum_congr rfl
      intro α _
      exact Finset.sum_comm

/-- Substantive SOURCE theorem: the real 48-index ORIGINAL BFSS
quantizer intertwines with the ORIGINAL SU2 fermion isometry. -/
theorem originalQuantizeFrequency_gauge
    (g : GaugeGroup 2) (K : FrequencyMatrix 2) (v : Fermion 2) :
    G.fermion g ((M.quantizeFrequency K) v) =
      (M.quantizeFrequency (sourceTransportFrequency g K))
        (G.fermion g v) := by
  calc
    G.fermion g ((M.quantizeFrequency K) v) =
        G.fermion g ((Complex.I / 2) • sourceRawQuadratic K v) :=
      congrArg (fun z : Fermion 2 => G.fermion g z)
        (sourceQuantize_apply K v)
    _ = (Complex.I / 2) • G.fermion g (sourceRawQuadratic K v) := by
      simp only [map_smul]
    _ = (Complex.I / 2) •
          sourceRawQuadratic (sourceTransportFrequency g K)
            (G.fermion g v) := by
      rw [sourceRawQuadratic_gauge]
    _ = (M.quantizeFrequency (sourceTransportFrequency g K))
          (G.fermion g v) :=
      (sourceQuantize_apply (sourceTransportFrequency g K)
        (G.fermion g v)).symm

#print axioms sourceTransportFrequency_apply
#print axioms originalQuantizeFrequency_gauge

end
end FCP.BFSSHopfD1S1
