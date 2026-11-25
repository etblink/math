import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPythonGammaRows

/-! Exact sparse contraction used by Python: one signed column per
original row, same color, ordered Majorana product, with factor 1/8.
This holds on arbitrary packed vectors, not just the particular seed. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPythonSpinContraction
noncomputable section

open OAI.BFSSQuantum
open FCP.BFSSS1V0 FCP.BFSSSU2GaugeG1A FCP.BFSSPairedSpin9Plane
open FCP.BFSSMSYPackedCarrier FCP.BFSSMSYPackedBilinear
open FCP.BFSSMSYPackedSpin FCP.BFSSMSYPythonGammaRows
open FCP.BFSSP3M4LB1SOriginalSource48SkewMatrixFockBivector

/-- Literal Python same-color ordered bilinear target. -/
def pythonSecondLabel (r s : SpaceIndex) (u : MajoranaLabel) : MajoranaLabel :=
  (pythonPairTarget r s u.1, u.2)

noncomputable def pythonSpinTerm (r s : SpaceIndex) (x : PackedCoordinates)
    (u : MajoranaLabel) : PackedCoordinates :=
  ((pythonPairSign r s u.1 : ℝ) : ℂ) •
    packedBilinear u (pythonSecondLabel r s u) x

/-- All 3*16 terms, independent of enumeration order. -/
noncomputable def pythonSpinContraction (r s : SpaceIndex)
    (x : PackedCoordinates) : PackedCoordinates :=
  ∑ u : MajoranaLabel, pythonSpinTerm r s x u

noncomputable def sourceRowTarget (r s : SpaceIndex) (p : Source48Label) : Source48Label :=
  pairedLabelEquiv (pythonSecondLabel r s (packedLabel p))

private theorem label_roundtrip (u : MajoranaLabel) :
    packedLabel (pairedLabelEquiv u) = u :=
  pairedLabelEquiv.symm_apply_apply u

private theorem source_roundtrip (p : Source48Label) :
    pairedLabelEquiv (packedLabel p) = p :=
  pairedLabelEquiv.apply_symm_apply p

private theorem coeff_on_pair (r s : SpaceIndex) (hrs : r ≠ s) (u : MajoranaLabel) :
    normalizedPairedPlane r s (pairedLabelEquiv u)
      (pairedLabelEquiv (pythonSecondLabel r s u)) / 4 =
      (pythonPairSign r s u.1 : ℝ) / 8 := by
  change normalizedPairedPlane r s (pairedLabelEquiv (u.1, u.2))
    (pairedLabelEquiv (pythonPairTarget r s u.1, u.2)) / 4 = _
  rw [normalizedPlane_sourceCoefficient r s hrs,
    ite_eq_left (rfl : u.2 = u.2), sourceGammaPair_entry,
    ite_eq_left (rfl : pythonPairTarget r s u.1 = pythonPairTarget r s u.1)]
  ring

private theorem coeff_off_pair (r s : SpaceIndex) (hrs : r ≠ s)
    (u v : MajoranaLabel) (h : v ≠ pythonSecondLabel r s u) :
    normalizedPairedPlane r s (pairedLabelEquiv u) (pairedLabelEquiv v) / 4 = 0 := by
  change normalizedPairedPlane r s (pairedLabelEquiv (u.1, u.2))
    (pairedLabelEquiv (v.1, v.2)) / 4 = 0
  rw [normalizedPlane_sourceCoefficient r s hrs]
  by_cases hc : u.2 = v.2
  · have ht : pythonPairTarget r s u.1 ≠ v.1 := by
      intro e
      apply h
      exact Prod.ext e.symm hc.symm
    rw [ite_eq_left hc, sourceGammaPair_entry, ite_eq_right ht]
    norm_num
  · rw [ite_eq_right hc, zero_div]

theorem sourceRowWeight (r s : SpaceIndex) (hrs : r ≠ s) (p : Source48Label) :
    normalizedPairedPlane r s p (sourceRowTarget r s p) / 4 =
      (pythonPairSign r s (packedLabel p).1 : ℝ) / 8 := by
  have h := coeff_on_pair r s hrs (packedLabel p)
  change normalizedPairedPlane r s (pairedLabelEquiv (packedLabel p))
    (sourceRowTarget r s p) / 4 = _ at h
  rw [source_roundtrip] at h
  exact h

theorem sourceRowOff (r s : SpaceIndex) (hrs : r ≠ s) (p q : Source48Label)
    (h : q ≠ sourceRowTarget r s p) :
    normalizedPairedPlane r s p q / 4 = 0 := by
  have hn : packedLabel q ≠ pythonSecondLabel r s (packedLabel p) := by
    intro he
    apply h
    calc
      q = pairedLabelEquiv (packedLabel q) := (source_roundtrip q).symm
      _ = sourceRowTarget r s p := congrArg pairedLabelEquiv he
  have hz := coeff_off_pair r s hrs (packedLabel p) (packedLabel q) hn
  rw [source_roundtrip, source_roundtrip] at hz
  exact hz

-- Support collapse is entirely additive, with no Fock reduction.
private theorem sparse_double_sum {I E : Type*} [DecidableEq I] [AddCommMonoid E]
    (s : Finset I) (T : I → I → E) (target : I → I)
    (hm : ∀ i, target i ∈ s) (hz : ∀ i j, j ≠ target i → T i j = 0) :
    (∑ i ∈ s, ∑ j ∈ s, T i j) = ∑ i ∈ s, T i (target i) := by
  apply Finset.sum_congr rfl
  intro i _
  exact Finset.sum_eq_single (target i) (fun j _ hj => hz i j hj)
    (fun hn => (hn (hm i)).elim)

private theorem row_scale (k : ℝ) :
    ((k / 8 : ℝ) : ℂ) = (1 / 8 : ℂ) * (k : ℂ) := by
  push_cast
  ring

private theorem scale_sum {I E : Type*} [AddCommMonoid E] [Module ℂ E]
    (s : Finset I) (T : I → E) :
    (∑ i ∈ s, (1 / 8 : ℂ) • T i) = (1 / 8 : ℂ) • (∑ i ∈ s, T i) :=
  Finset.smul_sum.symm

private def fullTerm (r s : SpaceIndex) (x : PackedCoordinates)
    (p q : Source48Label) : PackedCoordinates :=
  ((normalizedPairedPlane r s p q / 4 : ℝ) : ℂ) •
    packedBilinear (packedLabel p) (packedLabel q) x

private theorem fullTerm_off (r s : SpaceIndex) (hrs : r ≠ s)
    (x : PackedCoordinates) (p q : Source48Label) (h : q ≠ sourceRowTarget r s p) :
    fullTerm r s x p q = 0 := by
  unfold fullTerm
  rw [sourceRowOff r s hrs p q h, Complex.ofReal_zero, zero_smul]

private theorem fullTerm_on (r s : SpaceIndex) (hrs : r ≠ s)
    (x : PackedCoordinates) (p : Source48Label) :
    fullTerm r s x p (sourceRowTarget r s p) =
      (1 / 8 : ℂ) • pythonSpinTerm r s x (packedLabel p) := by
  have ht : packedLabel (sourceRowTarget r s p) = pythonSecondLabel r s (packedLabel p) :=
    label_roundtrip _
  unfold fullTerm pythonSpinTerm
  rw [sourceRowWeight r s hrs p, ht, smul_smul, row_scale]

private theorem packed_eq_full (r s : SpaceIndex) (x : PackedCoordinates) :
    packedSpinPlane r s x = ∑ p : Source48Label, ∑ q : Source48Label, fullTerm r s x p q :=
  rfl

private theorem row_reindex (r s : SpaceIndex) (x : PackedCoordinates) :
    (∑ p : Source48Label, pythonSpinTerm r s x (packedLabel p)) =
      pythonSpinContraction r s x := by
  unfold pythonSpinContraction
  exact pairedLabelEquiv.symm.sum_comp (pythonSpinTerm r s x)

theorem packedSpin_eq_python (r s : SpaceIndex) (hrs : r ≠ s) (x : PackedCoordinates) :
    packedSpinPlane r s x = (1 / 8 : ℂ) • pythonSpinContraction r s x := by
  have hc := sparse_double_sum (Finset.univ : Finset Source48Label)
    (fullTerm r s x) (sourceRowTarget r s) (fun _ => Finset.mem_univ _)
    (fullTerm_off r s hrs x)
  have ht : (∑ p : Source48Label, fullTerm r s x p (sourceRowTarget r s p)) =
      ∑ p : Source48Label, (1 / 8 : ℂ) • pythonSpinTerm r s x (packedLabel p) :=
    Finset.sum_congr rfl (fun p _ => fullTerm_on r s hrs x p)
  rw [packed_eq_full, hc, ht, scale_sum, row_reindex]

theorem pythonSpin_zero_iff (r s : SpaceIndex) (hrs : r ≠ s) (x : PackedCoordinates) :
    pythonSpinContraction r s x = 0 ↔
      originalSource48BivectorK (normalizedPairedPlane r s) (packedCarrier x) = 0 := by
  have hscale : (1 / 8 : ℂ) ≠ 0 := by norm_num
  have h := packedSpinPlane_intertwines r s x
  rw [packedSpin_eq_python r s hrs x, map_smul] at h
  constructor
  · intro hz
    rw [← h, hz, map_zero, smul_zero]
  · intro hz
    have hzero : (1 / 8 : ℂ) • packedCarrier (pythonSpinContraction r s x) = 0 :=
      h.trans hz
    have hv := (smul_eq_zero.mp hzero).resolve_left hscale
    apply packedCarrier.injective
    rw [map_zero]
    exact hv

#print axioms sourceRowWeight
#print axioms sourceRowOff
#print axioms packedSpin_eq_python
#print axioms pythonSpin_zero_iff

end
end FCP.BFSSMSYPythonSpinContraction
