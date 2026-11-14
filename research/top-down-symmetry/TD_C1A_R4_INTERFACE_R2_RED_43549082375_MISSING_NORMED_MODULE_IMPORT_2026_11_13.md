# TD-C1A R4 interface R2 — RED at the generic import boundary

**Date:** November 13, 2026 Pacific. **Verdict:** RED / UNQUALIFIED. The native source experiment was not reached.

- Exact run [#43549082375](https://github.com/etblink/math/actions/runs/43549082375), attempt 1, tested **57e64b3183f8605faf0cc1f824f940f1f6254747**, job **132307116768**.
- Artifact **14094964796**, 6,763 bytes, SHA-256 **2b3740a485dcddcfc1396cb7c71dfdeca841859dd2e9f3678f0b726afdccc4d9**. Downloaded ZIP digest independently verified.
- Generic evaluation source blob **df617aa024e3890465a098b4c339765a8e7f6d15**; basis source **d54455fdce4d8aead18478bb7efa45790fa6076c**; native probe **241dada0969f9f3f2c762b93e15d6e751bac637f**; workflow **2a8598584cd9c59067fddcaf8eab4da0e71be674**; early auditor **7c76c48056b98db3b1db77f2e6c83fb5e619cdd2**.
- Raw P0/P0B logs, tested SHA and source pins copied byte-for-byte into [evidence](evidence/TD_C1A_R4_INTERFACE_R2_43549082375/).

## Stage result and first cause

Frozen-source preflight and toolchain restoration PASS. P0 abstract basis extension compiled and its immediate warning/root audit PASS: only standard allowed axioms and recognized dependency-local-change notices. This is a narrow compiler/audit result, not an original BFSS gate acceptance.

P0B first source error is **13:24 Unknown identifier NormedField** in TDC1AR4FockOperatorEvaluationInterface.lean. Its import of Analysis.Normed.Operator.LinearIsometry does not expose the normed-field/module hierarchy used by the helper's variable declaration. This missing import was introduced in the new helper. With autoImplicit=false, the failed declaration prevents E and the scalar type from entering the context. The subsequent unknown E/scalar identifiers, universe constraints and sorryAx outputs are consequential; they are not independent mathematical obstructions.

Both the cold original-axis build and native P1 were **skipped**. There is no new evidence about native Fock recursion or the effectiveness of the conversion lemmas. The early-stage ordering prevented an unnecessary original dependency build.

## Source-reviewed minimal repair

Pinned Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612:
- Analysis/Normed/Module/Basic.lean, blob 0c70350a94ff80dd45966f2a9e6abdd5d0a629e7, defines NormedSpace and publicly imports Analysis.Normed.Field.Lemmas.
- Field/Lemmas.lean publicly imports Field/Basic.lean.
- Field/Basic.lean, blob dc7cd6d1b9d57f6965c8aa0ee3e4c2f8b95db6ac, defines NormedField.

Add the explicit nondeprecated Module.Basic import to the generic evaluation helper and update only its workflow hash pin. Leave both generic proof bodies, native probe, basis helper, stage auditor, target statements and resource budgets unchanged.

TD-C1A remains RED_UNQUALIFIED. Original full theorem, independent consumer, original strict workflow and accepted M5BF0/G0B2 remain unchanged.
