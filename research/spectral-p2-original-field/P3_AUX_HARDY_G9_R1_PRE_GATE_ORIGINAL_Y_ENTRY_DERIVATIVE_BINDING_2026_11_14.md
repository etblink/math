# HARDY-G9 R1 — prospective original Y entry derivative binding

Date: November 14, 2026 Pacific. Status: REGISTERED_NOT_EXECUTED; candidate source, helper, consumer and workflow are not staged. This contract precedes proof code.

## Observation, endpoint and bounded question

G8 strict #43674445069 qualifies the literal complex-entry fderiv in original tau's product rule. Its scope receipt explicitly leaves binding that derivative to G3's real Y basis evaluation unproved. G3 supplies an original real continuous-linear Y field and its derivative/contraction. This is a small source adapter in the M5 fixed-positive-regulator certificate program; it does not discharge physical Spin9, Hardy or energy-domain assumptions.

For arbitrary original `M : AlgebraData 2`, all spatial labels i,j,k (including i=j), all colors A,B, spinor entries alpha,beta, and X : Boson 2, target:

```
originalHardyTauCoefficientDerivative M i j k B A alpha beta X
  = (originalHardyY M i j (EuclideanSpace.single (k,B) 1) A alpha beta : Complex).
```

The derivative is independent of X. Consequently G8's actual Fock multiplier has the same finite theta sum with these basis coefficients. No new coefficient formula, Clifford table or CAR normalization is introduced.

## Reviewed source and method

Accepted baseline: `19a441adc0bc2408e639a1dca2ec0e67e31e6f57` (G8), current operational parent `6446fd62b5cb0e80ebe64f59418e2c8306e83774`. Original Core `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, G3 `03b5236bd91e4664e7101544b065054bd6c925a1`, G7 `d7320101971790d7fe56bfda1b011ae3e5d1b9d9`, G8 `138ab7f545bf00812a55d1cb035251a9eccb6c27` remain frozen.

At pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, inspected `Topology/Algebra/Module/ContinuousLinearMap/PiProd.lean` (proj/proj_apply), `Analysis/Complex/Basic.lean` (ofRealCLM/ofRealCLM_apply), and `Analysis/Calculus/FDeriv/Linear.lean` (ContinuousLinearMap.fderiv). G3 already represents original Y as a real CLM. Compose two coordinate projections and Complex.ofRealCLM with an arbitrary finite-matrix-valued real CLM; its derivative is itself. Identify this map with original Y entries using G3's apply root. This avoids expanding the nine-direction coefficient algebra.

## Preregistered source/helper/native checks

- `originalHardyYEntryCLM`
- `originalHardyYEntryCLM_apply`
- `originalHardyY_entry_fderiv`
- `originalHardyTauCoefficientDerivative_eq_basis`
- `originalHardyTauCoefficientDerivative_independent_point`
- `originalHardyTauDerivative_eq_basis`

A Mathlib-only helper has three independently audited roots: complex matrix-entry CLM, its exact evaluation, and derivative evaluated on an arbitrary direction. It accepts variable data and must pass before any native BFSS build. The unchanged accepted G5 generic evaluation helper retains its one-root early audit. A cold OAI rebuild then checks six source reports and twelve native reports (the six source roots plus six source donors), with twelve original-carrier examples.

Native examples cover the complex entry CLM and action, full entry fderiv, arbitrary-color basis identity, point independence, actual Fock multiplier and its vector evaluation, insertion in G8's original core product rule, G3's real derivative and contraction, diagonal-plane labels without an added vanishing assumption, and the literal FullL2 carrier. G3's contraction retains its original i != j hypothesis. No inference from the i=j control to a vanishing theorem is permitted.

Expected recursive closure: 162 OAI paths, obtained from G8's 160-path closure by replacing its consumer and adding the G9 source and generic helper. Runtime recursive discovery and exact baseline blob checks are authoritative; do not fabricate a measured count. Source and independent consumer each import only their registered modules; helper imports Mathlib only. Lean4.34.1, allowed axioms propext/Classical.choice/Quot.sound, default elaboration limits and existing warning policy remain fixed.

## Scientific-method contract and stop rule

Hypothesis: coordinate projection and real-to-complex continuous-linear composition identify G8's literal derivative with G3 basis evaluation, preserving every original color/spinor direction. Falsifiers: wrong coercion or derivative order; color-direction mismatch; any nonliteral carrier; native conversion failure; missing or extra roots; unexpected warning/axiom; original source drift. Controls: original baseline and 1/16,1/56 coefficients fixed; early variable-data helper before native data; all colors quantified; original G8 product rule and G3 contraction independently consumed.

Require the complete early helper, cold build, fresh source and complete consumer, exact report order, and only the permitted axioms before LEAN_QUALIFIED. A helper-only green is not G9 acceptance. On red preserve exact SHA, first-causal goal, full artifact and source hashes. An entry/helper failure is isolated there; a repeated native conversion invokes a typed comparison stop. Do not increase limits, silently add hypotheses, weaken statements or retry unchanged native joins.

## Scope ceiling and subsequent decision

G9 targets a coefficient-derivative source adapter and its finite Fock multiplier only. Kinetic CAR contraction, full original charge/tau rotation identity, tau norm, bounded L2 extension, physical Spin9 and reducing sectors, singlet-to-spinor charge covariance, source energy/domain and negative-power identities, Hardy/fidelity, zero modes and gaps remain unproved by this gate. After whole strict green, preregister kinetic CAR contraction separately. The physical symmetry/energy-domain audit remains the highest forward-research priority.
