# HARDY-G5 R1 prospective gate — original pointwise Fock potential/tau CAR

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
G4 strict acceptance/five-gate review committed first at f51357761243008201f97d9e0ef0cbefa87d0b06. No G5 proof source yet.

## Observation, source review and selected cut

G4 qualifies original potential/Y same-index scalar pairing. Current CliffordSymbols.lean already has cliffordLinear on the actual Fermion2 carrier, with original theta_CAR normalization, and cliffordLinear_mixed turning a real coefficient pairing into the operator anticommutator. Reuse that donor to lift the coefficient cancellation, without rebuilding 48-Majorana sums. The prior Hardy B1 primitive map calls for separate potential and derivative fermion pieces before the smooth-core charge/rotation identity.

Reviewed frozen baseline f51357761243008201f97d9e0ef0cbefa87d0b06. Exact Core9882359ced78b0a3bd7e2f057974bd0a031b3e60, CliffordSymbols cc01379653404c4ede3d551fd8d823e079543b21, G4 b2a482d0817fd39e7437a77d66d8f911c7073de3, G2 952890f8056c2b115d69a03c08c39762210c1a0b, actual G4J e20c76fb22bc09d16dbcd8657333227cb34ed1ea. Read exact cliffordLinear_mixed/selfAdjoint and native sum_apply/finite-product expansion patterns. The pointwise potential field is coefficient-defined using the accepted original matrix; formal equality to the literal Core.charge potential action is intentionally a separate adapter.

## Fixed six-root contract

- originalHardyTau
- originalHardyTau_apply
- originalPotentialFermion
- originalPotentialFermion_apply
- originalPotentialTau_anticommutator_zero
- originalPotentialTau_anticommutator_apply

Original M:AlgebraData2, X:Boson2, alpha:SpinIndex, spatial plane i,j:
- tau_alpha = M.cliffordLinear(fun p:SpinIndex x ColorIndex2 => originalY M i j X p.color alpha p.spin).
- Literal action tau_alpha v = SUM[A,beta] (Y M i j X A alpha beta :Complex) • M.theta beta A v.
- V_alpha = M.cliffordLinear(fun p => originalPotentialGamma M X p.color alpha p.spin).
- Literal V action is the same native coefficient matrix/majorana sum.
- SUM[alpha] (V_alpha*tau_alpha+tau_alpha*V_alpha)=0 as actual Fermion2 continuous-linear operators.
- SUM[alpha] (V_alpha(tau_alpha v)+tau_alpha(V_alpha v))=0 for all actual Fock vectors.

Use only coefficient pairing zero from G4 plus native cliffordLinear_mixed, carefully permuting finite spin/color sums. No assumption of operator cancellation; derive it. Private finite coefficient and native control helpers may support the public roots.

Source lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG5OriginalPotentialTauCAR.lean; namespace FCP.BFSSP3AuxHardyG5OriginalPotentialTauCAR, imports accepted G4 and CliffordSymbols. Consumer lean/diagnostics/BFSSP3AuxHardyG5OriginalPotentialTauCARIndependentConsumer.lean plus original G4J; workflow .github/workflows/bfss-p3-aux-hardy-g5-original-potential-tau-car-strict.yml.

## Experiment and falsifiers

Independent variables: all original M, coordinates, spin/plane/color labels and actual Fock vectors. Dependent variables: full exact source/native consumer and six/eleven reports. Twelve native examples: actual FullL2 anchor; literal tau definition/action; literal potential definition/action; operator anticommutator and Fock-vector evaluation; both fields at X=0; original unit-row CAR=identity; rejection of doubled CAR coefficient on any nonzero actual v; tau self-adjointness from its real coefficients. Unit-row functions are explicitly real, avoiding G1's untyped sum issue. No new Fock carrier or abstract assumed CAR model.

Falsifiers: wrong paired index ordering, swapped gamma row/column, source CAR coefficient2 instead of1, unsupported potential/charge identification, zero-field shortcut, failed native control or source/warning/axiom audit. The nonzero-vector condition in the doubled-CAR negative control is explicit; no witness existence is claimed from that conditional control.

Freeze transitive OAI bytes to f51357761243008201f97d9e0ef0cbefa87d0b06; explicit Core/CliffordSymbols/G4/G2/G1/GammaWords/GammaIdentity/G4J pins as available in actual closure. Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612 and same budgets/warnings/evidence. Cold source+native G4J, fresh warning-as-error source and complete consumer. Six new reports and eleven consumer reports with donors:
- OAI.BFSSQuantum.AlgebraData.cliffordLinear_mixed
- OAI.BFSSQuantum.AlgebraData.cliffordLinear_selfAdjoint
- FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_pairing_zero
- FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation.originalPotentialGamma_apply
- OAI.BFSSQuantum.AlgebraData.theta_CAR

## Analysis and decision

Static source/blob/root/YAML/bash/Python checks first; no local Lean. Qualification only after full original source/native consumer, all twelve controls and exact standard-axiom report order, measured manifest/artifact review. Preserve first causal red; two related reds => isolate exact native boundary before full consumer as G3 did, never disable lint or permute proofs blindly.

Scope: pointwise original coefficient-defined Fock potential/tau anticommutator. No literal Core.charge decomposition yet, no tau smooth-core mapping/domain claim, derivative/full charge rotation identity, tau norm, physical Spin9, Hardy/fidelity, zero mode or gap. Commit prospective record before new proof mutation.
