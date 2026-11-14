# TD-C1A R4 focused interface R2 — generic evaluation boundaries

**Date:** November 13, 2026 Pacific. **Status:** preregistered focused feasibility retry, NOT full original TD-C1A R4 strict qualification.

## Reviewed evidence and falsifiable change

RED #43546806160 at 454fad941b2b4b7e8bc54014420ad83087914a2d is preserved by checkpoint commit ca8d30d91b880d113c9cddb056aee7384c6514c7 and its first-causal ledger. The verified artifact shows abstract basis extension compiles, but native pointwise/operator conversions recurse at 46:4 and 86:2. Native originalColorLinear also leaves the RingHom.id scalar annotation unsimplified. A P0 deprecated real import warning would fail explicit strict audit; the previous late-only audit never executed after P1 failed.

**Distinct intervention:** carry the generic-first abstraction across both remaining conversion boundaries. In a separate module over a variable normed field and normed module, prove:

- operator_of_pointwise: U(A psi)=B(U psi) for every psi implies U.toContinuousLinearMap * A = B * U.toContinuousLinearMap.
- pointwise_of_operator: evaluate that operator identity back to U(A psi)=B(U psi).

Here U is a variable linear isometric equivalence; A and B are variable continuous linear maps. The native proof applies these already elaborated generic theorems to actual G4E, gamma and literal S1J expressions, rather than asking native ContinuousLinearMap.ext/congrArg/simpa to reduce the full Fock coercion stack.

This targets the actual causal errors. It does not reconstruct the original gamma finite sum, introduce a substitute module or modify the original theorem/consumer.

## Pinned interface source review

Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, Analysis/Normed/Operator/LinearIsometry.lean supplies the isometry-to-continuous-map interface and coe_coe'' (underlying function equality is rfl). ContinuousLinearMap/Basic.lean supplies composition multiplication and mul_apply_eq_comp. The new generic lemmas close those definitional conversions before Fock specialization.

Mathlib.Basic.Real.Basic exists in this pinned tree. Replace the deprecated Mathlib.Data.Real.Basic import; mathematical basis-extension statement and proof remain unchanged. Normalize originalColorLinear.map_smul' with Matrix.mulVec_smul and RingHom.id_apply only.

## Fixed experiment

**ID:** E-TD-C1A-R4-P0P1-R2.

1. P0 basis lemma: compiler plus immediate root/warning audit.
2. P0B evaluation-interface module: compiler plus immediate two-root/warning audit, before any original Fock imports/build.
3. Cold compile frozen original axis prerequisite.
4. P1 native probe: same three target roots as the prior attempt, with compiler plus immediate root/warning audit.
5. Each new compiler stage retains a 120-second limit. No new maxRecDepth/maxHeartbeats setting. Stop on any stage failure; no full strict original TD-C1A run.

**Exact generic/evaluation/native/auditor source pins:**
- lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/TDC1AR4OperatorBasisExtensionInterface.lean: d54455fdce4d8aead18478bb7efa45790fa6076c
- lean/diagnostics/BFSSTDC1AR4NativeOperatorInterfaceProbe.lean: 241dada0969f9f3f2c762b93e15d6e751bac637f
- lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/TDC1AR4FockOperatorEvaluationInterface.lean: df617aa024e3890465a098b4c339765a8e7f6d15
- tools/check_bfss_td_c1a_r4_probe_log.py: 7c76c48056b98db3b1db77f2e6c83fb5e619cdd2

The source G4E/S1J/Core/axis donors and original failed TD-C1A source, native independent consumer and full strict workflow remain frozen by the same original hash pins.

## Early-audit regression

The new tools/check_bfss_td_c1a_r4_probe_log.py was exercised locally against the verified original raw P0 and P1 logs: it rejects the old P0 import warning and the old P1 source failures. A clean multiline standard-axiom report passes; a sorryAx mutation fails. YAML, every shell block, embedded Python and local source hashes were checked. No local Lean compiler is available; compilation evidence must come from this focused CI.

These checks validate the auditor and workflow, not the new mathematical lemmas. A generic compiler-stage exit code alone is no longer treated as sufficient to incur the original dependency build.

## Decision rule

GREEN means INTERFACE_FEASIBLE_ONLY. Only afterward may the original unchanged-statement theorem and unchanged native independent consumer be staged for full strict R4. RED requires its own first-causal ledger and another architecture review if the original native coercion boundary still recurses; do not keep cosmetically rewriting or raise limits.

P0's prior compiler-only success remains historical evidence, not an accepted gate. M5BF0/G0B2 remain accepted. TD-C1A, C1B gauge fixedness, physical Spin9 implementation and spectral claims are not promoted.
