import Mathlib.Tactic

/-!
# SM-Y0: Standard Model one-family hypercharge consistency ledger

This module is independent of BFSS. It proves arithmetic anomaly-coefficient
cancellations for an explicitly supplied *left-handed Weyl* Standard Model
family in the convention Q_electric = T₃ + Y. The five entries are Q_L,
u_R^c, d_R^c, L_L and e_R^c. The color/weak multiplicities are encoded
in the coefficients of each anomaly polynomial, not inferred from these
charges or from any BFSS representation.

Anomaly coefficients are necessary gauge-consistency tests, not a
construction of chiral quantum fields, a proof of renormalizability, or
an experimentally new explanation. Global SU(2) parity is a distinct
combinatorial check. Nothing here establishes a physical Spin(10) GUT,
the number of generations, or the origin of masses and interactions.
-/

set_option autoImplicit false

namespace FCP.StandardModel.SMY0
noncomputable section

/-- Five independent rational hypercharges, with every right-handed
physical field represented by its LEFT-handed charge conjugate. -/
structure OneFamilyHypercharges where
  qDoublet : ℚ
  upConj : ℚ
  downConj : ℚ
  leptonDoublet : ℚ
  electronConj : ℚ

/-- The established one-family charge assignment, with Q_electric = T₃+Y. -/
def canonical : OneFamilyHypercharges where
  qDoublet := 1 / 6
  upConj := -(2 / 3)
  downConj := 1 / 3
  leptonDoublet := -(1 / 2)
  electronConj := 1

/-- SU(3)_C² U(1)_Y coefficient, ignoring a common fundamental Dynkin
index. The quark doublet supplies TWO weak components. -/
def colorMixed (x : OneFamilyHypercharges) : ℚ :=
  2 * x.qDoublet + x.upConj + x.downConj

/-- SU(2)_L² U(1)_Y coefficient, ignoring a common doublet Dynkin
index. Q_L supplies THREE color copies. -/
def weakMixed (x : OneFamilyHypercharges) : ℚ :=
  3 * x.qDoublet + x.leptonDoublet

/-- U(1)_Y³ coefficient: each charge is weighted by the total
color × weak representation dimension of its Weyl multiplet. -/
def cubicAbelian (x : OneFamilyHypercharges) : ℚ :=
  6 * x.qDoublet ^ 3 + 3 * x.upConj ^ 3 +
    3 * x.downConj ^ 3 + 2 * x.leptonDoublet ^ 3 +
      x.electronConj ^ 3

/-- Mixed gravitational-U(1)_Y coefficient with identical spectator
multiplicities but linear rather than cubic hypercharge. -/
def gravityMixed (x : OneFamilyHypercharges) : ℚ :=
  6 * x.qDoublet + 3 * x.upConj +
    3 * x.downConj + 2 * x.leptonDoublet + x.electronConj

/-- Four standard perturbative hypercharge-coefficient conditions,
not a complete gauge-anomaly or QFT consistency certificate. -/
def HyperchargeCoefficientsVanish (x : OneFamilyHypercharges) : Prop :=
  colorMixed x = 0 ∧ weakMixed x = 0 ∧
    cubicAbelian x = 0 ∧ gravityMixed x = 0

theorem canonical_colorMixed_zero : colorMixed canonical = 0 := by
  norm_num [colorMixed, canonical]

theorem canonical_weakMixed_zero : weakMixed canonical = 0 := by
  norm_num [weakMixed, canonical]

theorem canonical_cubicAbelian_zero : cubicAbelian canonical = 0 := by
  norm_num [cubicAbelian, canonical]

theorem canonical_gravityMixed_zero : gravityMixed canonical = 0 := by
  norm_num [gravityMixed, canonical]

/-- All four independently specified, finite rational coefficient
conditions hold simultaneously for the canonical source ledger. -/
theorem canonical_hypercharge_coefficients_vanish :
    HyperchargeCoefficientsVanish canonical := by
  exact ⟨canonical_colorMixed_zero, canonical_weakMixed_zero,
    canonical_cubicAbelian_zero, canonical_gravityMixed_zero⟩

/-- The color triplet weak-doublet has three copies and there is one
lepton weak-doublet. Their count is even (global SU(2) parity check). -/
theorem canonical_weak_doublet_count_even : Even (3 + 1 : ℕ) := by
  norm_num

/-- The perturbation deliberately changes the quark doublet's Y to 0,
while retaining the remaining four canonical charges. -/
def erasedQuarkDoubletCharge : OneFamilyHypercharges :=
  { canonical with qDoublet := 0 }

/-- A negative control: a changed quark hypercharge is no longer
color-anomaly-free. This prevents a vacuous auditor from passing. -/
theorem erasedQuark_colorMixed_ne_zero :
    colorMixed erasedQuarkDoubletCharge ≠ 0 := by
  norm_num [colorMixed, erasedQuarkDoubletCharge, canonical]

/-- The same perturbation also breaks the mixed weak-hypercharge sum. -/
theorem erasedQuark_weakMixed_ne_zero :
    weakMixed erasedQuarkDoubletCharge ≠ 0 := by
  norm_num [weakMixed, erasedQuarkDoubletCharge, canonical]

/-- The perturbation therefore fails the conjunctive consistency
condition. This shows only sensitivity to this *one* change. -/
theorem erasedQuark_not_anomaly_free :
    ¬ HyperchargeCoefficientsVanish erasedQuarkDoubletCharge := by
  intro h
  exact erasedQuark_colorMixed_ne_zero h.1

#print axioms canonical_colorMixed_zero
#print axioms canonical_weakMixed_zero
#print axioms canonical_cubicAbelian_zero
#print axioms canonical_gravityMixed_zero
#print axioms canonical_hypercharge_coefficients_vanish
#print axioms canonical_weak_doublet_count_even
#print axioms erasedQuark_colorMixed_ne_zero
#print axioms erasedQuark_weakMixed_ne_zero
#print axioms erasedQuark_not_anomaly_free

end
end FCP.StandardModel.SMY0
