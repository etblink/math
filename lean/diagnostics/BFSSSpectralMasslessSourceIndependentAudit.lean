import OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SpectralMasslessCoreFormIdentity

/-! Independent exact-type consumers of the recovered original source identities.
AlgebraData is the explicit source parameter; no concrete instance is assumed constructed. -/

set_option autoImplicit false

noncomputable section
open OAI OAI.BFSSQuantum OAI.BFSSQuantum.AlgebraData MeasureTheory
open FCP.BFSSSU2GaugeG4K9A FCP.BFSSSU2GaugeG4K9B
open FCP.BFSSSU2GaugeG4K9C FCP.BFSSSU2GaugeG4K9D

variable {N : ℕ}

-- The authentic negative matrix sign, before converting its column.
example (M : AlgebraData N) (x : Boson N) (A : ColorIndex N) :
    M.deformedPotentialMatrix 1 0 x A =
      -(∑ p : BFSSGamma.SpatialPair,
        M.coordinateBracket x p A • BFSSGamma.pairGamma M.gamma p) :=
  sourceMasslessPotentialMatrix_eq_neg_pairSum M x A

-- The beta-alpha source column converts to the positive alpha-beta pair entry.
example (M : AlgebraData N) (x : Boson N) (α β : SpinIndex) (A : ColorIndex N) :
    M.deformedPotentialCoefficients 1 0 x α (β, A) =
      ∑ p : BFSSGamma.SpatialPair,
        M.coordinateBracket x p A * BFSSGamma.pairGamma M.gamma p α β :=
  sourceMasslessPotentialCoefficient_eq_pairSum M x α β A

-- Full ordered pairs keep their original one-half factor.
example (M : AlgebraData N) (x : Boson N) (α β : SpinIndex) (A : ColorIndex N) :
    M.deformedPotentialCoefficients 1 0 x α (β, A) =
      (1/2 : ℝ) * ∑ i : SpaceIndex, ∑ j : SpaceIndex,
        M.coordinateBracketAll x i j A * M.gammaTwo i j α β :=
  sourceMasslessCoefficient_eq_halfOriginalOrdered M x α β A

-- Equality in the actual complex-linear operator carrier, with no hp premise.
example (M : AlgebraData N) (α : SpinIndex) (x : Boson N) :
    M.deformedPotentialMultiplier 1 0 x α = M.bracketMultiplier α x :=
  sourcePotentialMultipliers_equal M α x

-- Actual full-space smooth-core charges are equal, not just their norms.
example (M : AlgebraData N) (α : SpinIndex) (f : SmoothCore N) :
    M.deformedCoreCharge 1 0 α f = M.charge α f :=
  sourceUnconditionalCoreCharge_equal M α f

example (M : AlgebraData N) (α : SpinIndex) (f : SmoothCore N) (x : Boson N) :
    M.deformedCoreCharge 1 0 α f x = M.charge α f x :=
  congrArg (fun g : SmoothCore N => g x) (sourceUnconditionalCoreCharge_equal M α f)

-- The named source energies retain the literal coreForm carrier.
example (M : AlgebraData N) (f : SmoothCore N) :
    M.deformedCoreEnergy 1 0 f = M.coreForm f :=
  sourceUnconditionalCoreForm_equal M f

-- Original sixteen-charge normalization, independently consumed as a definition.
example (M : AlgebraData N) (f : SmoothCore N) :
    M.coreForm f = (1/16 : ℝ) * ∑ α : SpinIndex,
      ‖coreToL2 (M.charge α f)‖^2 := rfl

-- Full source energy decomposition, with no assumed multiplier identity.
example (M : AlgebraData N) (f : SmoothCore N) :
    M.coreForm f =
      (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex N,
        ‖coreToL2 (coordinateDerivative p.1 p.2 f)‖^2 +
      ∫ x : Boson N, (M.deformedBosonicPotential 1 0 x * ‖f x‖^2 +
        inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) :=
  M.massless_coreForm_energy f

-- SU(2) specialization keeps M explicit; no paired-instance existence claim.
example (M : AlgebraData 2) (f : SmoothCore 2) :
    M.coreForm f =
      (1/2 : ℝ) * ∑ p : SpaceIndex × ColorIndex 2,
        ‖(coreToL2 (coordinateDerivative p.1 p.2 f) : FullL2 2)‖^2 +
      ∫ x : Boson 2, (M.deformedBosonicPotential 1 0 x * ‖f x‖^2 +
        inner ℝ (f x) (M.deformedFermionField 1 0 x (f x))) :=
  M.massless_coreForm_energy f

#print axioms FCP.BFSSSU2GaugeG4K9A.sourceMasslessPotentialMatrix_eq_neg_pairSum
#print axioms FCP.BFSSSU2GaugeG4K9A.sourceMasslessPotentialCoefficient_eq_pairSum
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceCoordinateBracketUpperPair
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceGammaTwoUpperPair
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceMasslessCoefficient_eq_originalUpperTriangle
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceChargeDifference_eq_potentialDifference
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceCharge_eq_of_potentialAgreement
#print axioms FCP.BFSSSU2GaugeG4K9B.sourceCoreForm_eq_of_potentialAgreement
#print axioms FCP.BFSSSU2GaugeG4K9C.symmetricZeroDiagonal_halfDoubleSum_eq_upper
#print axioms FCP.BFSSSU2GaugeG4K9C.sourceOrderedCoefficient_symmetric
#print axioms FCP.BFSSSU2GaugeG4K9C.sourceOrderedCoefficient_diagonal_zero
#print axioms FCP.BFSSSU2GaugeG4K9C.sourceOriginalOrderedCoefficient_eq_upper
#print axioms FCP.BFSSSU2GaugeG4K9C.sourceMasslessCoefficient_eq_halfOriginalOrdered
#print axioms FCP.BFSSSU2GaugeG4K9D.sourcePotentialMultipliers_equal
#print axioms FCP.BFSSSU2GaugeG4K9D.sourceUnconditionalCoreCharge_equal
#print axioms FCP.BFSSSU2GaugeG4K9D.sourceUnconditionalCoreForm_equal
#print axioms OAI.BFSSQuantum.AlgebraData.massless_coreForm_energy
#eval IO.println "SPECTRAL_MASSLESS_CORE_FORM_AUDIT_OK"
