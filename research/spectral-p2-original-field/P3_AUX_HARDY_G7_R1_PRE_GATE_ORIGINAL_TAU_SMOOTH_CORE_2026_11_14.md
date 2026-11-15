# HARDY-G7 R1 preregistration — tau on the original smooth core

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED / UNQUALIFIED. Commit before code.

## Exact source route

Accepted G6 #43664706689 binds the actual original bracketPart to the G5 potential. Tau is currently a pointwise Fock CLM. G3 originalHardyYCLM is a real continuous-linear Boson2-to-GammaMatrix map equal to actual originalHardyY, so every complex-cast matrix entry is smooth. Reuse this identity, then compose the original Core.smoothMultiplier for that entry with original M.fermionAction beta A. Sum over exact source color/spinor indices to obtain a complex-linear SmoothCore2 endomorphism.

This uses the accepted Y definition with its1/16 and1/56 factors unchanged. Do not manually re-encode the coefficient field or infer tau(i,i)=0: the accepted formula exists for all i,j, while rotational/derivative assertions may separately require distinct indices.

## Six roots

- originalHardyY_entry_contDiff
- originalHardyTauCore
- originalHardyTauCore_apply
- originalHardyTauCore_support_subset
- originalBracketTauCore_anticommutator_apply
- originalBracketTauCore_anticommutator_zero

1. Complex-cast original Y entry ContDiff∞, via G3 CLM equality, real entry smoothness and Complex.ofRealCLM.
2. Tau core definition as finite original fermionAction composed with smoothMultiplier.
3. Exact evaluation equals accepted originalHardyTau acting on f X.
4. Function.support of tauCore f is contained in support f, by field linearity at zero.
5. Pointwise summed original bracketPart/tauCore anticommutator vanishes for actual f:SmoothCore2.
6. The same finite sum vanishes as an original bundled SmoothCore2 element, via TestFunction.ext.

Original bracketPart is the original core function, not a newly assumed bounded L2 multiplier. Two-sided compositions are defined because tauCore is an actual core endomorphism.

## Pinned library/API review

Pinned Mathlib TestFunction implements IsZeroApply, IsAddApply, IsSubApply, IsSMulApply, and TestFunction.ext. Use root sum_apply/zero_apply and current apply-class lemmas; old TestFunction.coe_* aliases are deprecated. Original CliffordSymbols supplies fermionAction_apply and smoothMultiplier_apply, so field evaluation needs only finite sums/composition and actual theta complex linearity. No additional physical premise.

## Qualification and controls

Source imports only accepted G6 plus G3. Six source and six independent donor reports; native consumer uses actual original G4J paired data, SmoothCore2/Fermion2/Boson2/FullL2, all six roots, source map definition, complex linearity/zero behavior, support and diagonal-label evaluation. All original sources fixed at11656f35e14a64df15286288427c2b519f6070fd; freshly compile G3 and all inherited sources. Keep accepted generic evaluation helper early, same strict axiom/warning policy,500-second fresh checks and3600-second native build.

Donors:
- FCP.BFSSP3AuxHardyG3OriginalYDerivativeContraction.originalHardyYCLM_apply
- FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalHardyTau_apply
- FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR.originalPotentialTau_anticommutator_apply
- FCP.BFSSP3AuxHardyG6OriginalCorePotentialBinding.originalBracketPart_apply_potential
- OAI.BFSSQuantum.AlgebraData.fermionAction_apply
- OAI.BFSSQuantum.AlgebraData.smoothMultiplier_apply

Static imports/roots/hashes/native-control/YAML/bash/Python checks precede CI. No local Lean. Any smoothness, exact application, support or bundled-core conversion failure blocks qualification; preserve its first causal typed boundary, then isolate a source-independent helper if needed. No increased limits or changing accepted definitions.

## Scope boundary

Acceptance gives the original smooth-core tau map, its pointwise Fock binding, support inclusion and potential contribution cancellation. The full charge-tau differential identity still requires kinetic Leibniz/finite CAR contraction and the correct source rotation interpretation. No bounded L2 tau extension, tau norm, physical Spin9, Hardy/fidelity, zero mode or gap is claimed.
