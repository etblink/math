# TD-C1A D0 — GREEN collection, native joins RED

**Date:** November 13, 2026 Pacific. **Run:** [#43554665838](https://github.com/etblink/math/actions/runs/43554665838), completed/success, exact tested SHA 186e338662a2a64bfb14277e134b5a373feca0f0. **Job:** 132324689318. **Mathematical gate:** TD-C1A remains RED_UNQUALIFIED.

## Verified evidence

Artifact 14098322089, 32,248 bytes. Downloaded ZIP SHA-256 d6bc1d65f9ba86083d7ac5fc0a81b70862a9d4035ed35d2ea550a6bc7942a9d0 matches GitHub. Exact tested-sha.txt, all 13 per-command log hashes and the log-sha256 inventory verified. Re-ran named-root/allowed-axiom/warning audits for all ten diagnostic cases. Every raw artifact file is preserved under evidence/TD_C1A_D0_43554665838/.

| Diagnostic case | Compiler/audit result |
| --- | --- |
| Metadata: native structures and generic specialization | PASS |
| Variable original-Fock isometry cast | PASS |
| Generic variable-data lift on original Fermion 2 | PASS |
| Generic variable-data evaluation on original Fermion 2 | PASS |
| Fixed original-carrier helper, two roots | PASS |
| Exact original pointwise axis theorem consumption | PASS |
| Actual G4E isometry cast, without gamma | PASS |
| Native axis operator join | FAIL: recursion at 33:10 |
| Native conditional evaluation | FAIL: recursion at 25:8 |
| Generic conditional evaluation | FAIL: recursion at 25:8 |

Frozen generic helper compiler/audit, original Core build and frozen axis build all passed. Axis build took 509.968 seconds. Seven of ten diagnostic cases passed; none was skipped. Seven new case roots compiled with only propext, Classical.choice and Quot.sound; the two frozen generic roots also passed. All three failed case roots contain compiler-recovery sorryAx and are unqualified. No source admits were introduced.

## First causal boundary and hypothesis update

The native axis case fails while matching the literal accepted source theorem to a goal expressed through local U/A/B lets. Its helper join after that witness emits no separate error, but relies on the failed witness and cannot be qualified. The direct axis case, with the original pointwise statement, passes.

Both conditional evaluation cases fail applying their helper to actual G4E plus gamma data, even though an operator identity is supplied as a hypothesis. Their failure is conversion/elaboration evidence, not a failure to prove that operator identity.

The planned fixed-carrier helper **does not solve the actual-data joins by itself**. Both arbitrary-carrier specialization and the native helper pass with variable data, so D0 supplies no specialization differential. Native NormedSpace/module synthesis passes; primitive and actual G4E coercions pass. These observations narrow the failing boundary to combined actual-data conversion; they do not prove an instance diamond or dimension normalization is the cause.

## Decision

Retain all D0 sources/workflow untouched. Do not assemble a full proof yet. Test a bounded explicit-application-normalization join: rewrite continuous-operator products to composition and function application using pinned nondeprecated public lemmas, then consume the accepted pointwise source in its literal syntax. Compare this with unchanged D0 failures and successful direct source/cast controls.

[Next prospective contract](TD_C1A_D1_PROSPECTIVE_EXPLICIT_APPLICATION_NORMALIZATION_2026_11_13.md) records the exact leaves and stop rules before new Lean source. Actions GREEN here means collection completed; it is not native covariance qualification. Original full source, consumer and full strict workflow remain frozen.

Roadmap-consistency run #43554665859 independently completed/success at the same tested SHA; it is administrative evidence only.
