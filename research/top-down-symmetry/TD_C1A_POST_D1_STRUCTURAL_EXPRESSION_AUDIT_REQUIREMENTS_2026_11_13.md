# TD-C1A after D1 — structural expression audit requirements

**Date:** November 13, 2026 Pacific.
**Status:** research requirements only; no new Lean diagnostic, proof candidate or mathematical CI launched.
**Authority:** reviewed D0 and D1 receipts; original TD-C1A remains RED_UNQUALIFIED.

D0 demonstrated literal direct pointwise source consumption, native structure synthesis, variable generic/native helper specialization and actual gauge-only coercion. Actual gauge/gamma joins failed. D1 demonstrated that explicit public application rewrites work on variable data and produce the expected displayed statements on actual data, but final exact matching still recurses.

The next question is therefore narrower: what complete typed expression is being checked at that final boundary, compared with the successful direct consumer? Do not infer the answer from pretty-printed goals.

## Required comparisons

1. Preserve the successful literal D0 direct-axis consumer as control. Compare the elaborated type of a separately obtained original-axis witness with the actual post-ext/post-normalization goal in the same local context.
2. Preserve D1's exact heval and target types. Compare their complete expression structure without first asking an unrestricted definitional equality procedure to normalize the entire native Fock construction.
3. Examine the first differing application argument and classify whether it is a carrier, universe, scalar homomorphism, normed/module/topological instance, coercion path or ordinary data argument. If no difference is found, report that explicitly and investigate the checking context.
4. Distinguish raw syntactic comparison, bounded conversion checking and kernel acceptance. A pass at one level is not a pass at all levels.
5. Include a variable-data control and the previously successful source consumer, so instrumentation errors cannot masquerade as a native mismatch.

## Instrumentation design constraints

Review the exact Lean 4.34.1 public source interfaces before implementing any metaprogram. No guessed API names or unbounded dumps of the 2^24-dimensional carrier. Report bounded expression paths and node/constant summaries; inspect structure arguments only at an actual detected difference. Keep source data and normal elaboration limits unchanged.

Any future diagnostic must state its question, controls, output limits and stopping rules before code/CI. An instrumented diagnostic may observe an unsolved goal; it must never turn that observation into a new theorem or suppress failed audits. If Lean compilation is unavailable locally, say so and test only the non-Lean harness locally.

## Decision barrier before another proof attempt

A new proof retry requires concrete structural evidence or a separately source-reviewed construction that avoids the measured boundary. Alternating exact/simpa/change syntax, raising limits, replacing the Fock carrier, weakening the original theorem or reusing unqualified F18 sources is not sufficient.

No new experiment is registered as executed, no full strict run is launched, and no accepted BFSS result changes in this memo. The point is to make the next CI expenditure answer a question that the existing logs cannot answer.
