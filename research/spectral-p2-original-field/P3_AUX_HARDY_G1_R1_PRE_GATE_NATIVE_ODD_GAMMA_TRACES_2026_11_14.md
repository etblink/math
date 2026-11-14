# HARDY-G1 R1 prospective gate — original odd gamma traces

Date: 2026-11-14 Pacific. RESEARCH_DESIGN_NOT_STAGED, NOT LEAN QUALIFIED.
HARDY-X0 R2 #43625439216 acceptance is checkpointed in this commit BEFORE new G1 source.

## Observation and question

The prior Hardy B1 primitive map requires three- and five-gamma trace cancellations for the potential/tau calculation. Exact GammaWords.lean already supplies gamma_sq, gamma_anti, list_commute, list_conj and trace_conj. Unlike sorted finite words restricted to cardinality <=4, the list identities support literal ordered five-factor products. Can these existing generic relations qualify trace-zero statements for the original AlgebraData 2 gamma matrices, without a physical group representation or private gamma tables?

Reviewed source: current branch ref 321a49fb29de3ab55d41bf35f54e1fcfdfa6eaea. GammaWords blob d12051e70de679f5458dbd456667a32c7b407ce4; Core blob 9882359ced78b0a3bd7e2f057974bd0a031b3e60; actual G4J e20c76fb22bc09d16dbcd8657333227cb34ed1ea. Reviewed principal-symbol donor remains cc01379653404c4ede3d551fd8d823e079543b21 but is not required by G1. Historical Hardy-map paths for the public three/four-word probes returned 404 at current branch paths; their provenance is retained in the old memo, but G1 does not assume their availability. Direct generic GammaWords reuse avoids that dependency. Pinned Mathlib List.toFinset_card_le and Finset.exists_mem_notMem_of_card_lt_card were read at d13f23b723b8a846827a245b89c10fc7d3f11612.

## Fixed hypothesis and smallest contract

For every original M:AlgebraData 2:
1. Every list of <=5 spatial labels omits some one of the nine labels.
2. If k is missing and (-1)^length=-1, the ordered gamma product has trace zero, using existing list_commute and trace_conj.
3. Every literal ordered three-factor gamma product has trace zero.
4. Every literal ordered five-factor gamma product has trace zero.
5. trace(gamma_i gamma_i)=16 (normalization and even-word control).

The three/five statements allow repeated labels: a missing label still exists. No unnecessary distinctness assumption. This is stronger than the distinct-label subcase needed in the Hardy plan, but excludes the nine-factor volume word. Fixed named roots:
- originalGamma_missing_of_length_le_five
- originalGamma_trace_of_missing_odd
- originalGamma_three_trace_zero
- originalGamma_five_trace_zero
- originalGamma_square_trace

Source: lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxHardyG1OriginalOddGammaTraces.lean
Namespace FCP.BFSSP3AuxHardyG1OriginalOddGammaTraces; import original Core and GammaWords. Consumer: lean/diagnostics/BFSSP3AuxHardyG1OriginalOddGammaTracesIndependentConsumer.lean; import new module plus original G4J. Workflow: .github/workflows/bfss-p3-aux-hardy-g1-original-odd-gamma-traces-strict.yml.

## Falsifiers and experiment

Independent variables: all original M and ordered spatial labels; explicit unused ninth label 8 for the 0,1,2 product; repeated-label triple; five distinct 0..4 factors. Dependent variables: complete cold source/fresh native consumer and five/ten exact root reports. Consumer anchors actual pairedAlgebraData and FullL2 2, exercises missing-label/helper contracts and literal three/five products, repeated-label cancellation, square trace 16 and square nonzero. An invalid claim that all word traces vanish is blocked by the square control.

Falsifiers: wrong product order or gamma normalization, accidental distinctness restriction, failure of repeated-label/ninth-label controls, inappropriate five-word extension by a <=4 donor, surrogate gamma model, unexpected warning/axiom, or source/consumer compile failure.

Freeze existing transitive OAI sources to reviewed 321a49fb29de3ab55d41bf35f54e1fcfdfa6eaea; explicit Core/GammaWords/G4J hashes, current 4.34.1/d13f23b pins, same budgets/warning policy as X0. Five new roots and five independent generic donor reports:
- OAI.BFSSGamma.gamma_sq
- OAI.BFSSGamma.gamma_anti
- OAI.BFSSGamma.list_commute
- OAI.BFSSGamma.list_conj
- OAI.BFSSGamma.trace_conj

## Analysis, decision and communication

Use elementary finite-cardinality missing-index proof and existing generic Clifford conjugation, not table expansion. No local Lean installed; static source/hash/YAML/shell/Python checks precede exact CI. Mathematical acceptance requires complete original source and paired native consumer, exact ordered reports with only propext/Classical.choice/Quot.sound, measured manifest and retained evidence artifact. Preserve first causal red; after two related reds isolate a typed gamma/list interface, no tactic permutations.

Scope: original gamma trace algebra only. No tau/rotation anticommutator, fermion CAR norm for tau, physical Spin9 implementation, individual closed supercharge square, Hardy inequality, fidelity, zero mode or gap. Existing X0/CERT/weighted operator acceptances remain fixed.

Commit this prospective receipt before first G1 candidate mutation.
