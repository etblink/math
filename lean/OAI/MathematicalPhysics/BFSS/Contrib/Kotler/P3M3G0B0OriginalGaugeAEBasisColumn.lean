import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3M3G0AOriginalFockGaugeColumnTransport

/-!
# P3-M3G0B0 — original source-gauge a.e. Fock basis-column action

Prospective B0 theorem source, UNQUALIFIED until exact independent strict CI.
This imports qualified M3G0A, M2C0 and L6G7Z (thereby L6G7Y/U),
and proves only source original FullL2 a.e. and original bounded
operator-valued Lp evaluated at a genuine original Fermion 2 ONB
vector. No full operator equality, original operator-norm SU2 isometry,
basis independence, physical fixedness, unbounded H or spectrum.
-/
set_option autoImplicit false

namespace FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn
noncomputable section

open OAI.BFSSQuantum
open OAI.BFSSQuantum.AlgebraData
open FCP.BFSSS1V0
open FCP.BFSSSU2GaugeG4J
open FCP.BFSSSU2PhysicalDomainL6G7U
open FCP.BFSSSU2PhysicalDomainL6G7Z
open FCP.BFSSP3M2B2B1OriginalOperatorLpTransport
open FCP.BFSSP3M2C0OriginalFockOperatorLpColumns
open FCP.BFSSP3M3G0AOriginalFockGaugeColumnTransport
open MeasureTheory

variable {ι : Type*} [Fintype ι]

/-- The exact L6G7Z original FullL2 unitary has the original source
left-fermion output action AFTER inverse-boson pullback, a.e. -/
theorem actualOriginalFullL2GaugeUnitaryHom_apply_ae
    (g : GaugeGroup 2) (v : FullL2 2) :
    ((actualOriginalFullL2GaugeUnitaryHom g v : FullL2 2) :
      Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        pairedGaugeData.fermion g
          (v (pairedGaugeData.boson g⁻¹ x))) := by
  have hf := ContinuousLinearMap.coeFn_compLp
    (pairedGaugeData.fermion g).toContinuousLinearEquiv.toContinuousLinearMap
    (pairedGaugeData.bosonPullback g⁻¹ v)
  have hb := Lp.coeFn_compMeasurePreserving v
    (pairedGaugeData.boson g⁻¹).measurePreserving
  filter_upwards [hf, hb] with x hfiber hboson
  calc
    (actualOriginalFullL2GaugeUnitaryHom g v : FullL2 2) x =
        pairedGaugeData.fermion g
          ((pairedGaugeData.bosonPullback g⁻¹ v) x) := by
      change (pairedGaugeData.fiberAction g
        (pairedGaugeData.bosonPullback g⁻¹ v)) x =
          pairedGaugeData.fermion g
            ((pairedGaugeData.bosonPullback g⁻¹ v) x)
      exact hfiber
    _ = pairedGaugeData.fermion g
          (v (pairedGaugeData.boson g⁻¹ x)) := by
      change (pairedGaugeData.bosonPullback g⁻¹ v) x =
        v (pairedGaugeData.boson g⁻¹ x) at hboson
      exact congrArg (pairedGaugeData.fermion g) hboson

/-- Transported original operator Lp action on the literal Fock-vector
Lp column is the original L6G7 source unitary field formula, a.e.
This is a vector-column statement, not a full operator identity. -/
theorem originalFockOperatorGaugeEquiv_source_column_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) (i : ι) :
    ((originalFockOperatorLpColumnsEquiv b
      (originalFockOperatorGaugeEquiv b g f) i : FullL2 2) :
        Boson 2 → Fermion 2) =ᵐ[volume]
      (fun x : Boson 2 =>
        pairedGaugeData.fermion g
          ((originalFockOperatorLpColumnsEquiv b f i : FullL2 2)
            (pairedGaugeData.boson g⁻¹ x))) := by
  rw [originalFockOperatorGaugeEquiv_column_apply]
  exact actualOriginalFullL2GaugeUnitaryHom_apply_ae g
    (originalFockOperatorLpColumnsEquiv b f i)

/-- Exact original operator-norm L² field evaluated on an actual
original Fermion 2 basis vector, with physical left-output action and
the CORRECT inverse boson map, a.e. This is not operator conjugation. -/
theorem originalFockOperatorGaugeEquiv_source_basis_ae
    (b : OrthonormalBasis ι ℂ (Fermion 2))
    (g : GaugeGroup 2) (f : OriginalFockOperatorLp) (i : ι) :
    (fun x : Boson 2 =>
      ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)
        (b i)) =ᵐ[volume]
      (fun x : Boson 2 =>
        pairedGaugeData.fermion g
          ((f (pairedGaugeData.boson g⁻¹ x)) (b i))) := by
  have hout := originalFockOperatorLpColumnsEquiv_apply_ae b
    (originalFockOperatorGaugeEquiv b g f) i
  have hsource := originalFockOperatorGaugeEquiv_source_column_ae b g f i
  have hin := originalFockOperatorLpColumnsEquiv_apply_ae b f i
  have hin_comp := hin.comp_tendsto
    (pairedGaugeData.boson g⁻¹).measurePreserving.quasiMeasurePreserving.tendsto_ae
  filter_upwards [hout, hsource, hin_comp] with x hleft hmid hright
  calc
    ((originalFockOperatorGaugeEquiv b g f : OriginalFockOperatorLp) x)
        (b i) =
      (originalFockOperatorLpColumnsEquiv b
        (originalFockOperatorGaugeEquiv b g f) i : FullL2 2) x :=
          hleft.symm
    _ = pairedGaugeData.fermion g
          ((originalFockOperatorLpColumnsEquiv b f i : FullL2 2)
            (pairedGaugeData.boson g⁻¹ x)) := hmid
    _ = pairedGaugeData.fermion g
          ((f (pairedGaugeData.boson g⁻¹ x)) (b i)) := by
      change (originalFockOperatorLpColumnsEquiv b f i : FullL2 2)
          (pairedGaugeData.boson g⁻¹ x) =
        (f (pairedGaugeData.boson g⁻¹ x)) (b i) at hright
      exact congrArg (pairedGaugeData.fermion g) hright

#print axioms actualOriginalFullL2GaugeUnitaryHom_apply_ae
#print axioms originalFockOperatorGaugeEquiv_source_column_ae
#print axioms originalFockOperatorGaugeEquiv_source_basis_ae

end
end FCP.BFSSP3M3G0B0OriginalGaugeAEBasisColumn
