# HARDY-G6 R1 prospective contract — original Core potential binding

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED / UNQUALIFIED. Commit before code.

## Source review and reuse

G5 strict #43662023823 is accepted at247899464453b2613d312f3a776aff87ee605cbf. Original Core.charge has the actual six-index potential with factor one-half and gammaTwo alpha-beta. Original Kinetic defines that exact bracketMultiplier and proves charge_kinetic_plus_bracket and bracketPart_apply. Recovered K9C supplies sourceMasslessCoefficient_eq_halfOriginalOrdered; K9D supplies sourcePotentialMultipliers_equal. Their bytes are present at the reviewed accepted baseline but K9C/D were not in the G5 import closure, so this gate must compile and audit them freshly.

PotentialBasis.deformedPotentialCoefficients reads beta-alpha in a massless matrix carrying a leading minus sign; K9A skew-transpose conversion and K9C ordered-pair one-half relation preserve the authentic alpha-beta coefficient. Do not identify these by an unchecked rfl or omit the transpose/sign accounting. Do not rebuild K9D's six-sum reordering.

## Six bounded roots

- originalPotentialGamma_eq_sourceCoefficient
- originalPotentialFermion_eq_sourceMultiplier
- originalPotentialFermion_eq_bracketMultiplier
- originalCharge_apply_kinetic_add_potential
- originalBracketPart_apply_potential
- originalBracketMultiplier_tau_anticommutator_zero

First prove originalPotentialGamma M X A alpha beta equals M.deformedPotentialCoefficients1 0 X alpha(beta,A), using G4 entry and K9C half-ordered formula, expanding coordinateBracketAll and ring-normalizing each of four finite scalar indices. Equality of real coefficient functions then gives equality under the unchanged M.cliffordLinear. Transitivity with K9D binds bracketMultiplier. Original Kinetic identities bind literal M.charge alpha f X and M.bracketPart alpha f X to the accepted potential acting on f X. Finally rewrite the bracket multiplier and use accepted G5 operator cancellation.

No new public hypothesis, substitute model or charge definition.

## Native qualification

Independent consumer imports original G4J fixture; tests genuine pairedAlgebraData on original Fermion2, Boson2, FullL2 and SmoothCore2, all six roots, literal bracketMultiplier six-sum definition, vector evaluation and original bracketPart definition. Include conditional nonzero-coefficient controls rejecting swapped alpha/beta and a doubled coefficient; these are normalization controls, not a claimed nonzero state/witness. Six source plus six independent donor axiom inventories. All existing original sources remain byte-identical.

Donors:
- FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_apply
- FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_zero
- FCP.BFSSSU2GaugeG4K9C.sourceMasslessCoefficient_eq_halfOriginalOrdered
- FCP.BFSSSU2GaugeG4K9D.sourcePotentialMultipliers_equal
- OAI.BFSSQuantum.AlgebraData.charge_kinetic_plus_bracket
- OAI.BFSSQuantum.AlgebraData.bracketPart_apply

Use original G5 accepted generic operator-evaluation helper as an early pinned Mathlib-only check. Fresh cold G6 and original G4J build, fresh warning-as-error source/native consumer, standard three axioms only. Recursively pin all original OAI imports against24789946, explicit new source/consumer hashes and exact K9C/D/Core/Kinetic/G4/G5/helper bytes. Actual closure count comes from preflight. Keep500-second fresh checks,3600-second native build and existing toolchain/budgets.

## Falsifiers and scope

Index/transpose/sign/factor disagreement, fresh legacy donor failure, malformed source/public assumption, unexpected warning/axiom or native conversion failure blocks qualification. Preserve exact first cause and isolate a generic/typed boundary if needed; no blind source unfolding or budget increase. Static YAML/bash/Python, root/import/hash and control checks first; no local Lean.

Acceptance identifies the literal original charge potential and transfers its pointwise tau cancellation. It does not yet establish the full smooth-core charge/tau differential identity, tau norm, physical Spin9, Hardy/fidelity, zero mode or gap.
