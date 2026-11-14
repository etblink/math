# HARDY-G4 R1 prospective gate — original potential/Y coefficient cancellation

Date:2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
G3 R3 strict acceptance committed first at 9a67c63087bc37ee6c6c19fcf76641c0437794fe; no G4 source yet.

## Observation and exact source reuse

G1 proves literal ordered three/five gamma traces vanish, including repeated factors; G2 qualifies original Y; G3 qualifies its actual derivative contraction. The remaining potential-term algebra should be connected to the original finite coefficient before full Majorana/core compression. Primary arXiv:2611.09837v1 AppendixB paragraph after B.7 was re-read at https://arxiv.org/html/2611.09837v1: its potential contribution reduces to these odd traces. This is source research, not evidence of completed Lean physical Hardy.

Exact Core.charge uses coefficient (1/2)*structureConstant A B C*gammaTwo(k,l)(alpha,beta), followed by original positions X(k,B)X(l,C). Core.gammaTwo=(1/2)•(gamma_k gamma_l-gamma_l gamma_k). Define the real coefficient matrix by summing those same original structureConstant/coordinate factors. Prove literal entries, transpose sign, trace cancellation and actual same-index scalar pairing; do not substitute trace(PY) for the CAR pairing SUM P(alpha,beta)Y(alpha,beta) without handling transpose.

Pinned Mathlib Matrix.Trace source confirms trace=sum diagonal, matrix multiplication expansion and cyclic/transpose identities. Use explicit trace(P.transpose*Y) expansion and finite sum swap for the scalar pairing. No new gamma tables or Fock model.

Reviewed OAI baseline 9a67c63087bc37ee6c6c19fcf76641c0437794fe; Core9882359ced78b0a3bd7e2f057974bd0a031b3e60, GammaWords d12051e70de679f5458dbd456667a32c7b407ce4, G1 6a019c9111b384e73a05de7b776ac9e5a83c7eb7, G2 952890f8056c2b115d69a03c08c39762210c1a0b, actual G4J e20c76fb22bc09d16dbcd8657333227cb34ed1ea. G3 accepted bytes held fixed separately; G4 finite algebra imports G2 only.

## Fixed six-root contract

- originalGammaTwo_trace_Y
- originalPotentialGamma
- originalPotentialGamma_apply
- originalPotentialGamma_transpose
- originalPotentialGamma_trace_Y
- originalPotentialGamma_pairing_zero

For original M:AlgebraData2, X:Boson2, colors A,D and arbitrary spatial labels (no unnecessary distinctness):
- trace(M.gammaTwo k l * originalHardyY M i j X D)=0, by qualified odd traces.
- originalPotentialGamma M X A := SUM[k,l,B,C] ((1/2)*M.structureConstant A B C*X(k,B)*X(l,C)) • M.gammaTwo k l.
- Entry(alpha,beta) equals SUM[k,l,B,C] (1/2)*structureConstant A B C*gammaTwo k l alpha beta*X(k,B)*X(l,C), literal native charge coefficient order.
- PotentialGamma.transpose=-PotentialGamma.
- trace(PotentialGamma M X A * Y M i j X D)=0.
- SUM[alpha,beta] PotentialGamma M X A alpha beta * Y M i j X D alpha beta=0.
Private gammaTwo/odd-word and transpose helpers may support these roots; no change to accepted source.

Source lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG4OriginalPotentialYCancellation.lean; namespace FCP.BFSSP3AuxHardyG4OriginalPotentialYCancellation; import G2. Consumer lean/diagnostics/BFSSP3AuxHardyG4OriginalPotentialYCancellationIndependentConsumer.lean, plus G4J. Workflow .github/workflows/bfss-p3-aux-hardy-g4-original-potential-y-cancellation-strict.yml.

## Experiment, controls and falsifiers

Independent variables: all original source matrices/coordinates/colors and ordered spatial labels; source potential coefficient factors fixed. Dependent variables: full source/native consumer and six/eleven reports. Twelve native examples: literal FullL2 anchor; gammaTwo/Y trace; potential matrix definition; entry equality; transpose; trace; actual same-index scalar pairing; summed diagonal-color coefficient cancellation; diagonal spatial gammaTwo control; origin potential; nonzero first-gamma/Y probe1; rejection of incorrectly claiming that probe is zero. Explicit Fin color-zero witness, no deprecated names. Use only actually needed simplifier rules; strict lint remains enabled.

Falsifiers: missing transpose in Frobenius/CAR pairing, wrong source index or coordinate order, unqualified odd trace reuse, removed native control, source/warning/axiom failure. Trace-zero alone cannot validate overall potential normalization or identify a full Fock operator: the literal definition/entry root fixes the chosen source coefficient, while actual source charge-to-PotentialGamma operator decomposition and Majorana CAR anticommutator are separate future adapters.

Freeze all existing transitive OAI bytes to reviewed baseline 9a67c63087bc37ee6c6c19fcf76641c0437794fe; explicit Core/GammaWords/G1/G2/GammaIdentity/G4J pins. Same Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, cold source/G4J, fresh warning-as-error source and complete native consumer, budgets/evidence. Six source reports; six new plus five donor consumer reports:
- FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_three_trace_zero
- FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_five_trace_zero
- FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace.originalHardyY
- OAI.BFSSQuantum.AlgebraData.gammaTwo
- OAI.BFSSQuantum.AlgebraData.charge

## Analysis and decision

Static source/blob/root/YAML/bash/Python checks first; no local Lean. Qualification requires complete exact source and native consumer, all twelve examples, exact six/eleven reports with only propext/Classical.choice/Quot.sound and measured manifest/artifact review. Preserve first causal red; after two related reds isolate smallest typed native boundary before full consumer, as successful G3 recovery did.

Scope: original real potential coefficient cancellation against Y, including correct same-index scalar pairing. No source potential-Fock/tau anticommutator, full charge rotation identity, tau norm, physical Spin9, closed domains, Hardy/fidelity, zero mode or gap. Commit prospectively before proof mutation.
