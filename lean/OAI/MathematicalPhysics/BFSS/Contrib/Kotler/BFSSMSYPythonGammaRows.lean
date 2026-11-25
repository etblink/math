import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMSYPackedSpin

/-! Exact signed row formulas for the nine Python Kronecker words in
check_seed.py. Bind to the original source gamma, not merely a Clifford
representation. The actual sparse occupation witness remains separate. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYPythonGammaRows

open OAI.BFSSQuantum
open FCP.BFSSSU2GaugeG1A

-- Exact integer source tables. The subsequent rfl binds the actual
-- original gamma definition, including every sign and row.
private def sourcePerm : Fin 9 → Fin 16 → Fin 16
  | 0 => ![
    9, 8, 11, 10, 13, 12, 15,
    14, 1, 0, 3, 2, 5, 4,
    7, 6
  ]
  | 1 => ![
    11, 10, 9, 8, 15, 14, 13,
    12, 3, 2, 1, 0, 7, 6,
    5, 4
  ]
  | 2 => ![
    14, 15, 12, 13, 10, 11, 8,
    9, 6, 7, 4, 5, 2, 3,
    0, 1
  ]
  | 3 => ![
    10, 11, 8, 9, 14, 15, 12,
    13, 2, 3, 0, 1, 6, 7,
    4, 5
  ]
  | 4 => ![
    12, 13, 14, 15, 8, 9, 10,
    11, 4, 5, 6, 7, 0, 1,
    2, 3
  ]
  | 5 => ![
    15, 14, 13, 12, 11, 10, 9,
    8, 7, 6, 5, 4, 3, 2,
    1, 0
  ]
  | 6 => ![
    13, 12, 15, 14, 9, 8, 11,
    10, 5, 4, 7, 6, 1, 0,
    3, 2
  ]
  | 7 => ![
    8, 9, 10, 11, 12, 13, 14,
    15, 0, 1, 2, 3, 4, 5,
    6, 7
  ]
  | 8 => ![
    0, 1, 2, 3, 4, 5, 6,
    7, 8, 9, 10, 11, 12, 13,
    14, 15
  ]

/-- The exact ±1 coefficient in that entry. -/
private def sourceSign : Fin 9 → Fin 16 → ℤ
  | 0 => ![
    1, -1, 1, -1, 1, -1, 1,
    -1, -1, 1, -1, 1, -1, 1,
    -1, 1
  ]
  | 1 => ![
    1, 1, -1, -1, 1, 1, -1,
    -1, -1, -1, 1, 1, -1, -1,
    1, 1
  ]
  | 2 => ![
    1, -1, -1, 1, 1, -1, -1,
    1, -1, 1, 1, -1, -1, 1,
    1, -1
  ]
  | 3 => ![
    1, -1, -1, 1, -1, 1, 1,
    -1, -1, 1, 1, -1, 1, -1,
    -1, 1
  ]
  | 4 => ![
    1, -1, 1, -1, -1, 1, -1,
    1, -1, 1, -1, 1, 1, -1,
    1, -1
  ]
  | 5 => ![
    1, 1, 1, 1, -1, -1, -1,
    -1, -1, -1, -1, -1, 1, 1,
    1, 1
  ]
  | 6 => ![
    1, 1, -1, -1, -1, -1, 1,
    1, -1, -1, 1, 1, 1, 1,
    -1, -1
  ]
  | 7 => ![
    1, 1, 1, 1, 1, 1, 1,
    1, 1, 1, 1, 1, 1, 1,
    1, 1
  ]
  | 8 => ![
    1, 1, 1, 1, 1, 1, 1,
    1, -1, -1, -1, -1, -1, -1,
    -1, -1
  ]

/-- The nine integer signed-permutation gamma matrices. -/
private def sourceGammaInt (a : Fin 9) : Matrix (Fin 16) (Fin 16) ℤ :=
  fun i j => if sourcePerm a i = j then sourceSign a i else 0

private theorem sourceGamma_eq (r : SpaceIndex) :
    FCP.BFSSGamma9.gamma r = (sourceGammaInt r).map (Int.castRingHom ℝ) := rfl

/-- High-to-low I/X/Z/J word row flips (X and J). -/
def pythonFlipMask : Fin 9 → ℕ :=
  ![9, 11, 14, 10, 12, 15, 13, 8, 0]

/-- High-to-low I/X/Z/J word row sign bits (Z and J). -/
def pythonSignMask : Fin 9 → ℕ :=
  ![9, 10, 11, 15, 13, 12, 14, 0, 8]

def pythonRowTarget (r : Fin 9) (i : Fin 16) : Fin 16 :=
  ⟨(i.val ^^^ pythonFlipMask r) % 16, Nat.mod_lt _ (by decide)⟩

def pythonRowSign (r : Fin 9) (i : Fin 16) : ℤ :=
  let m := i.val &&& pythonSignMask r
  (if m.testBit 0 then -1 else 1) *
  (if m.testBit 1 then -1 else 1) *
  (if m.testBit 2 then -1 else 1) *
  (if m.testBit 3 then -1 else 1)

private theorem sourcePerm_python :
    ∀ (r : Fin 9) (i : Fin 16), sourcePerm r i = pythonRowTarget r i := by
  intro r
  fin_cases r <;> decide

private theorem sourceSign_python :
    ∀ (r : Fin 9) (i : Fin 16), sourceSign r i = pythonRowSign r i := by
  intro r
  fin_cases r <;> decide

theorem pythonRowSign_ne_zero :
    ∀ (r : Fin 9) (i : Fin 16), pythonRowSign r i ≠ 0 := by
  intro r
  fin_cases r <;> decide

/-- Ordered matrix product row: first row target of r, then of s. -/
def pythonPairTarget (r s : Fin 9) (i : Fin 16) : Fin 16 :=
  pythonRowTarget s (pythonRowTarget r i)

def pythonPairSign (r s : Fin 9) (i : Fin 16) : ℤ :=
  pythonRowSign r i * pythonRowSign s (pythonRowTarget r i)

theorem pythonPairSign_ne_zero (r s : Fin 9) (i : Fin 16) :
    pythonPairSign r s i ≠ 0 :=
  mul_ne_zero (pythonRowSign_ne_zero r i)
    (pythonRowSign_ne_zero s (pythonRowTarget r i))

/-- Exact entry binding to the actual paired AlgebraData gamma field. -/
theorem sourceGamma_entry (r : SpaceIndex) (i j : SpinIndex) :
    pairedAlgebraData.gamma r i j =
      if pythonRowTarget r i = j then (pythonRowSign r i : ℝ) else 0 := by
  change FCP.BFSSGamma9.gamma r i j = _
  rw [sourceGamma_eq]
  change ((if sourcePerm r i = j then sourceSign r i else (0 : ℤ)) : ℝ) = _
  rw [sourcePerm_python, sourceSign_python]
  by_cases h : pythonRowTarget r i = j
  · rw [ite_eq_left h, ite_eq_left h]
  · rw [ite_eq_right h, ite_eq_right h, Int.cast_zero]

-- Same exact sparse row proof as the original source gamma gate.
private theorem sourceGammaInt_mul_apply (r s : Fin 9) (i j : Fin 16) :
    (sourceGammaInt r * sourceGammaInt s) i j =
      if sourcePerm s (sourcePerm r i) = j then
        sourceSign r i * sourceSign s (sourcePerm r i)
      else 0 := by
  classical
  change (∑ k : Fin 16,
      (if sourcePerm r i = k then sourceSign r i else 0) *
      (if sourcePerm s k = j then sourceSign s k else 0)) = _
  rw [Finset.sum_eq_single (sourcePerm r i)]
  · simp
  · intro k _ hk
    simp [Ne.symm hk]
  · simp

/-- Every actual source gamma product has precisely the Python row target
and integer weight, including orientation of the ordered product. -/
theorem sourceGammaPair_entry (r s : SpaceIndex) (i j : SpinIndex) :
    (pairedAlgebraData.gamma r * pairedAlgebraData.gamma s) i j =
      if pythonPairTarget r s i = j then (pythonPairSign r s i : ℝ) else 0 := by
  change (FCP.BFSSGamma9.gamma r * FCP.BFSSGamma9.gamma s) i j = _
  rw [sourceGamma_eq, sourceGamma_eq, ← Matrix.map_mul]
  change (((sourceGammaInt r * sourceGammaInt s) i j : ℤ) : ℝ) = _
  rw [sourceGammaInt_mul_apply]
  simp only [sourcePerm_python, sourceSign_python, pythonPairTarget, pythonPairSign]
  by_cases h : pythonRowTarget s (pythonRowTarget r i) = j
  · rw [ite_eq_left h, ite_eq_left h]
  · rw [ite_eq_right h, ite_eq_right h, Int.cast_zero]

#print axioms pythonRowSign_ne_zero
#print axioms pythonPairSign_ne_zero
#print axioms sourceGamma_entry
#print axioms sourceGammaPair_entry

end FCP.BFSSMSYPythonGammaRows
