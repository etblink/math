# HARDY-G5 R1 red checkpoint — additive sum binder scope

Date:2026-11-14 Pacific. RED_UNQUALIFIED.

[Strict #43645016288](https://github.com/etblink/math/actions/runs/43645016288), attempt1, job #132600730953, tested `6934c2af40193e6e9762a3e7d8f14566bcd4737e`: run/job failure verified. Preflight/toolchain PASS, cold candidate source FAIL; fresh strict source and independent native consumer NOT REACHED.

## Exact causal diagnostics

Source65:31/64 and75:31/63: Unknown identifier alpha in second addend of the anticommutator sum. The assistant omitted explicit parentheses around the full additive summand. With autoImplicit=false, the out-of-scope index is correctly rejected. Source78:2 additionally reports maximum recursion depth in the later vector-evaluation simpa. Do not assume that recursion is independently solved by grouping, or that it is an independent mathematical obstruction, before retesting valid statements.

Four definition/action roots have only standard allowed axioms. The operator/vector anticommutator roots contain consequential sorryAx. Consumer not reached; no G5 qualification. Coefficient-pairing helper precedes the failed statements with no reported error, but has no separate accepted gate receipt.

| Binding | Value |
| --- | --- |
| Source blob | c1c04f779a6f104cce39a08e34434d4d6937b2d9 |
| Consumer blob | db899c75288805c560ca0ad2e8c873456d407eb2 |
| Workflow blob | 89aa88686e315ceab7cd13042de00b96e4295ec5 |
| Reviewed OAI baseline | f51357761243008201f97d9e0ef0cbefa87d0b06 |
| Manifest paths / SHA-256 | 150 / effae561c4508074a96f1b09a6215b43aacbef6e0c24fc29cbc8a5de440c237b |
| Artifact ID / bytes | 14134281761 / 17533 |
| Artifact ZIP SHA-256 | sha256:afbb9755874c3b61f635bece5d447d18892f8a666b5b75624da12337bd67a3a7 |

API digest matches upload log; ZIP not independently rehashed. Administrative #43645016179 GREEN, separate. Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.

## Bounded repair and stop rule

Restore the preregistered intended statements by putting the full two-product/two-vector additive expression inside explicit parentheses under each finite-sum binder. Apply to two source statements and two matching native examples. No new hypotheses, factor/order changes, tactic changes, autoImplicit changes or budget increases. Workflow only expected source/consumer hashes. Preserve before mutation. If evaluation recursion persists, isolate its typed interface; after two related reds use a minimal diagnostic, not proof permutations. Prior G4/G3 results fixed.
