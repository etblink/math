# HARDY-G2 R1 prospective gate — original plane coefficient trace

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT QUALIFIED.
G1 R2 #43628804541 acceptance is checkpointed in this commit BEFORE new G2 proof work.

## Source review and precise question

The Hardy primitive map separates finite coefficient algebra from physical sectors. Primary source arXiv:2611.09837v1, Appendix B, B.5–B.7 was re-read at https://arxiv.org/html/2611.09837v1. It defines the plane coefficient with constants 1/16 and 1/56 and contracts it against gamma to recover the angular coordinate coefficients. This gate implements that finite matrix definition and the first trace contraction only. The derivative contraction and core anticommutator are separate.

Reuse current source G1 square trace, GammaWords list_reverse_eq/list_transpose and GammaIdentity.trace_skew_symm. Distinct triple gamma products are skew-transpose; each original gamma is symmetric, so their trace pairing vanishes. This avoids a full four-gamma trace table. G1 odd three/five traces remain available for the later potential term; they are not substituted for a four-factor trace argument.

Reviewed existing baseline 3645cdc05202abefd0b5a9533a4daa1ca45fdf6d. Core blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60; GammaWords d12051e70de679f5458dbd456667a32c7b407ce4; GammaIdentity 45e58da900a7691b88e5760a483b8adff1c7f015; G1 6a019c9111b384e73a05de7b776ac9e5a83c7eb7; actual G4J e20c76fb22bc09d16dbcd8657333227cb34ed1ea. Current pinned PiL2 source confirms nondeprecated PiLp.single_apply for basis-coordinate controls.

## Fixed contract

For original M:AlgebraData 2, all original X:Boson 2 and A:ColorIndex 2, distinct plane i!=j:
Y(M,i,j,X,A)=(1/16) • (X(i,A) • gamma_j-X(j,A) • gamma_i)
 +(1/56) • SUM[k!=i,j] X(k,A) • (gamma_k gamma_i gamma_j).

Trace(gamma_l Y)= (if l=j then X(i,A) else 0) - (if l=i then X(j,A) else 0).
No order i<j needed; i!=j suffices and swapped planes have the reversed trace sign. Auxiliary finite roots cover gamma pair trace16 delta, distinct triple transpose sign and symmetric/skew trace cancellation. Five roots in exact order:
- originalGamma_pair_trace
- originalGamma_three_transpose
- originalGamma_trace_mul_three_distinct
- originalHardyY
- originalHardyY_trace

Source lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG2OriginalPlaneCoefficientTrace.lean; namespace FCP.BFSSP3AuxHardyG2OriginalPlaneCoefficientTrace; import accepted G1 and original GammaIdentity. Consumer lean/diagnostics/BFSSP3AuxHardyG2OriginalPlaneCoefficientTraceIndependentConsumer.lean, imports new module plus G4J. Workflow .github/workflows/bfss-p3-aux-hardy-g2-original-plane-coefficient-trace-strict.yml.

## Experiment, controls and falsifiers

Independent variables: all source M, X, color/plane/probe labels; no private gamma table. Dependent variables: full exact source/native paired consumer, five source and ten consumer reports. Eleven native examples exercise literal FullL2 anchor, pair trace, triple transpose, four-factor trace cancellation, coefficient definition and trace formula, two actual EuclideanSpace basis directions, swapped-plane sign, origin and rejection of the incorrect positive orientation on the second axis. Bases use the actual Boson 2 coordinates, not a new carrier.

Falsifiers: wrong 1/16 normalization or gamma order, unqualified four-factor shortcut, missing i!=j premise, flipped coordinate sign, removed controls, original-source drift, any compile/warning/axiom failure. Deliberate scope limit: the trace contraction does not identify the transverse 1/56 coefficient by itself; its norm/derivative role requires later independent gates. The 1/56 is fixed in the literal definition against B.5, not inferred from this trace theorem.

Freeze all existing transitive OAI bytes to reviewed baseline above; explicit Core/GammaWords/GammaIdentity/G1/G4J pins. Same 4.34.1/d13f23b toolchain, cold build, fresh warning-as-error source and complete native consumer, budgets and notice allowlist. Five independent donor reports:
- FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces.originalGamma_square_trace
- OAI.BFSSGamma.gamma_anti
- OAI.BFSSGamma.list_reverse_eq
- OAI.BFSSGamma.list_transpose
- OAI.BFSSGamma.trace_skew_symm

## Analysis and decision

Reuse finite list transpose and skew/symmetric trace; do not expand sixteen-by-sixteen tables or original Fock dimensions. Explicitly normalize numeric goals before any decide involving variable-containing syntax. No local Lean: static source/blob/YAML/bash/Python checks first, exact CI qualifies. Acceptance requires five/ten ordered reports with only propext/Classical.choice/Quot.sound, all original native controls and measured manifest/artifact review. Preserve first causal red; after two related reds isolate the smallest typed boundary.

Communication: finite original coefficient trace only. No derivative identity, tau CAR norm or source rotation anticommutator, closed generators, physical Spin9, Hardy/fidelity, zero mode or gap. Existing G1/X0/CERT results fixed. Commit this prospective record before source mutation.
