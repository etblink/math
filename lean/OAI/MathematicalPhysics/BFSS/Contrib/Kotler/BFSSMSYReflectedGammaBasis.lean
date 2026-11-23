import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe

/-! Finite gamma basis identification for arXiv:2611.09837v1, Appendix A,
equations A.2 and A.3. The checked map reverses the ninth spatial axis. -/

set_option autoImplicit false
set_option warningAsError true

namespace FCP.BFSSMSYGamma

open OAI.BFSSQuantum
open scoped Matrix

-- The literal source tables are tied to the imported gamma by definitional equality.
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

private def sourceGammaInt (a : Fin 9) : Matrix (Fin 16) (Fin 16) ℤ :=
  fun i j => if sourcePerm a i = j then sourceSign a i else 0

private theorem sourceGamma_eq (a : SpaceIndex) :
    FCP.BFSSGamma9.gamma a = (sourceGammaInt a).map (Int.castRingHom ℝ) := rfl

private def appendixPerm : Fin 9 → Fin 16 → Fin 16 :=
  ![
    ![2, 3, 0, 1, 6, 7, 4, 5, 10, 11, 8, 9, 14, 15, 12, 13],
    ![3, 2, 1, 0, 7, 6, 5, 4, 11, 10, 9, 8, 15, 14, 13, 12],
    ![0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15],
    ![6, 7, 4, 5, 2, 3, 0, 1, 14, 15, 12, 13, 10, 11, 8, 9],
    ![7, 6, 5, 4, 3, 2, 1, 0, 15, 14, 13, 12, 11, 10, 9, 8],
    ![10, 11, 8, 9, 14, 15, 12, 13, 2, 3, 0, 1, 6, 7, 4, 5],
    ![11, 10, 9, 8, 15, 14, 13, 12, 3, 2, 1, 0, 7, 6, 5, 4],
    ![14, 15, 12, 13, 10, 11, 8, 9, 6, 7, 4, 5, 2, 3, 0, 1],
    ![15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
  ]

private def appendixSign : Fin 9 → Fin 16 → ℤ :=
  ![
    ![1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1],
    ![1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1],
    ![-1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1, -1, -1, 1, 1],
    ![1, -1, -1, 1, -1, 1, 1, -1, 1, -1, -1, 1, -1, 1, 1, -1],
    ![1, 1, -1, -1, -1, -1, 1, 1, -1, -1, 1, 1, 1, 1, -1, -1],
    ![1, -1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1, 1, -1, -1, 1],
    ![1, 1, -1, -1, 1, 1, -1, -1, -1, -1, 1, 1, -1, -1, 1, 1],
    ![1, -1, -1, 1, 1, -1, -1, 1, -1, 1, 1, -1, -1, 1, 1, -1],
    ![1, 1, -1, -1, -1, -1, 1, 1, 1, 1, -1, -1, -1, -1, 1, 1]
  ]

private def appendixInt (a : Fin 9) : Matrix (Fin 16) (Fin 16) ℤ :=
  fun i j => if appendixPerm a i = j then appendixSign a i else 0

private def basisInt : Matrix (Fin 16) (Fin 16) ℤ :=
  ![
    ![0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1],
    ![0, 0, 0, -1, 0, 0, 0, -1, 0, 1, 0, 0, 0, 1, 0, 0],
    ![0, 0, 1, 0, 0, 0, 1, 0, -1, 0, 0, 0, -1, 0, 0, 0],
    ![1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0],
    ![0, 0, -1, 0, 0, 0, 1, 0, 1, 0, 0, 0, -1, 0, 0, 0],
    ![1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, -1, 0],
    ![0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 1],
    ![0, 0, 0, -1, 0, 0, 0, 1, 0, 1, 0, 0, 0, -1, 0, 0],
    ![0, 0, 0, 1, 0, 0, 0, -1, 0, 1, 0, 0, 0, -1, 0, 0],
    ![0, 1, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 1],
    ![1, 0, 0, 0, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0, 1, 0],
    ![0, 0, -1, 0, 0, 0, 1, 0, -1, 0, 0, 0, 1, 0, 0, 0],
    ![1, 0, 0, 0, 1, 0, 0, 0, 0, 0, -1, 0, 0, 0, -1, 0],
    ![0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0],
    ![0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0],
    ![0, -1, 0, 0, 0, -1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1]
  ]

/-- The Appendix A gamma matrices, using the displayed tensor-product order. -/
def appendixGamma (a : SpaceIndex) : GammaMatrix :=
  (appendixInt a).map (Int.castRingHom ℝ)

/-- Twice the real orthogonal map from the original spinor basis to Appendix A. -/
def doubledBasis : GammaMatrix :=
  basisInt.map (Int.castRingHom ℝ)

private theorem source_symm_entries :
    ∀ a i j, sourceGammaInt a i j = sourceGammaInt a j i := by
  change ∀ (a : Fin 9) (i j : Fin 16),
    (if sourcePerm a i = j then sourceSign a i else 0) =
      (if sourcePerm a j = i then sourceSign a j else 0)
  decide

private theorem appendix_left_apply (a : Fin 9) (i j : Fin 16) :
    (appendixInt a * basisInt) i j = appendixSign a i * basisInt (appendixPerm a i) j := by
  change (∑ k : Fin 16, (if appendixPerm a i = k then appendixSign a i else 0) *
    basisInt k j) = _
  rw [Finset.sum_eq_single (appendixPerm a i)]
  · simp
  · intro k _ hk
    simp [Ne.symm hk]
  · simp

private theorem source_right_apply (a : Fin 9) (i j : Fin 16) :
    (basisInt * sourceGammaInt a) i j = basisInt i (sourcePerm a j) * sourceSign a j := by
  rw [Matrix.mul_apply]
  calc
    _ = ∑ k : Fin 16, basisInt i k * sourceGammaInt a j k :=
      Finset.sum_congr rfl fun k _ =>
        congrArg (fun v : ℤ => basisInt i k * v) (source_symm_entries a k j)
    _ = _ := by
      change (∑ k : Fin 16, basisInt i k * (if sourcePerm a j = k then sourceSign a j else 0)) = _
      rw [Finset.sum_eq_single (sourcePerm a j)]
      · simp
      · intro k _ hk
        simp [Ne.symm hk]
      · simp

private theorem signed_entries :
    ∀ (a : Fin 9) (i j : Fin 16),
      appendixSign a i * basisInt (appendixPerm a i) j =
        if a = 8 then -(basisInt i (sourcePerm a j) * sourceSign a j)
        else basisInt i (sourcePerm a j) * sourceSign a j := by
  decide

private theorem signed_int (a : Fin 9) :
    appendixInt a * basisInt =
      if a = 8 then -(basisInt * sourceGammaInt a) else basisInt * sourceGammaInt a := by
  ext i j
  by_cases ha : a = 8
  · simpa only [ite_eq_left ha, Matrix.neg_apply, appendix_left_apply, source_right_apply]
      using signed_entries a i j
  · simpa only [ite_eq_right ha, appendix_left_apply, source_right_apply]
      using signed_entries a i j

/-- The ninth generator needs the negative sign under the real basis comparison. -/
theorem appendixGamma_mul_doubledBasis (a : SpaceIndex) :
    appendixGamma a * doubledBasis =
      if a = 8 then -(doubledBasis * FCP.BFSSGamma9.gamma a)
      else doubledBasis * FCP.BFSSGamma9.gamma a := by
  unfold appendixGamma doubledBasis
  rw [sourceGamma_eq]
  by_cases ha : a = 8
  · have h : appendixInt a * basisInt = -(basisInt * sourceGammaInt a) := by
      simpa only [ite_eq_left ha] using signed_int a
    have he := congrArg (fun M : Matrix (Fin 16) (Fin 16) ℤ =>
      M.map (Int.castRingHom ℝ)) h
    simp only [ite_eq_left ha]
    rw [← Matrix.map_mul, ← Matrix.map_mul]
    rw [he]
    ext i j
    exact Int.cast_neg _
  · have h : appendixInt a * basisInt = basisInt * sourceGammaInt a := by
      simpa only [ite_eq_right ha] using signed_int a
    simp only [ite_eq_right ha]
    rw [← Matrix.map_mul, ← Matrix.map_mul, h]

private theorem gram_entries :
    ∀ i j : Fin 16, (∑ k : Fin 16, basisInt k i * basisInt k j) =
      if i = j then 4 else 0 := by
  decide

/-- Normalizing the columns of the doubled map by two gives an orthogonal basis. -/
theorem doubledBasis_transpose_mul :
    doubledBasis.transpose * doubledBasis = (4 : ℝ) • (1 : GammaMatrix) := by
  ext i j
  change (∑ k : Fin 16, ((basisInt k i : ℤ) : ℝ) * ((basisInt k j : ℤ) : ℝ)) =
    ((4 : ℝ) • (1 : GammaMatrix)) i j
  have h := congrArg (fun z : ℤ => (z : ℝ)) (gram_entries i j)
  push_cast at h
  by_cases hij : i = j
  · simpa [hij, Matrix.smul_apply, Matrix.one_apply] using h
  · simpa [hij, Matrix.smul_apply, Matrix.one_apply] using h

/-- In the quadratic charge coefficients, each of the two plane indices
contributes its spatial sign. -/
theorem appendixGamma_pair_mul_doubledBasis (a b : SpaceIndex) :
    (appendixGamma a * appendixGamma b) * doubledBasis =
      if (a = 8) ↔ (b = 8) then
        doubledBasis * (FCP.BFSSGamma9.gamma a * FCP.BFSSGamma9.gamma b)
      else -(doubledBasis * (FCP.BFSSGamma9.gamma a * FCP.BFSSGamma9.gamma b)) := by
  rw [Matrix.mul_assoc, appendixGamma_mul_doubledBasis]
  by_cases ha : a = 8 <;> by_cases hb : b = 8 <;>
    simp [ha, hb, ← Matrix.mul_assoc, appendixGamma_mul_doubledBasis]

#print axioms appendixGamma_mul_doubledBasis
#print axioms doubledBasis_transpose_mul
#print axioms appendixGamma_pair_mul_doubledBasis

end FCP.BFSSMSYGamma
