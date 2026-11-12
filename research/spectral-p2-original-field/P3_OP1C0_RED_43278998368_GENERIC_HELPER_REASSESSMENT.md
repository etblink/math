# P3-OP1C0 strict RED #43278998368 — original Fock specialization recursion

**Date:** 2026-11-12 Pacific. **Branch:** `integration/bfss-unified-research-20261108`. **Status:** RED, no new theorem accepted. **Project Lead decision:** isolate generic inner-product positivity from the massive original Fock carrier.

## Exact immutable run evidence

- [Run #43278998368](https://github.com/etblink/math/actions/runs/43278998368), attempt 1, `completed/failure`, tested commit `e6ef1dac6b9fe57c1c2ddedc7e8008d74ce115ce`, job `131394980916`.
- 61/61 original source and consumer Git blob pins passed. Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; original accepted OP1A and OP1B compiled. New OP1C0 source failed before independent consumer.
- First causal error `P3OP1C0OriginalFockTraceNonnegative.lean:39:38: maximum recursion depth has been reached`, at the already-corrected `inner_self_nonneg (x := T (b i))` term in `Finset.sum_nonneg`. The historical first red [#43275220286](https://github.com/etblink/math/actions/runs/43275220286) was `Function expected` due positional implicit argument; **that first error is no longer present**. New failure is nested specialization/elaboration pressure, not a counterexample.
- Reported `sorryAx` is an automatic consequence of uncompiled source, not an accepted axiom. All original source/consumer bytes outside the two unqualified OP1C0 files remain frozen.
- [Red artifact #13972274183](https://github.com/etblink/math/actions/runs/43278998368/artifacts/13972274183), SHA-256 `23fbcc69ac42ab9e298192a8aea608d96988ac9068dd82e24fe6a5e300f10b4a`.

## Source-typed fix decision and stop rule

**Only remaining interface:** finite sum of real parts of complex self-inner-products, on arbitrary **abstract** complex inner-product space, followed by specialization to the literal source original Fock vectors `T (b i)`.

Avoid another direct nested application of `inner_self_nonneg` under the huge expanded `Fermion 2` concrete instance. Prove a `private`, **generic** helper with `{E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℂ E]`, finite `ι`, and `v : ι → E`:
```lean
0 ≤ (∑ i, ⟪v i, v i⟫_ℂ).re
```
using pinned `Complex.re_sum`, `Finset.sum_nonneg`, and `inner_self_nonneg (𝕜 := ℂ) (x := v i)`, **before** specializing to `E = Fermion 2`. Then, after using the already accepted OP1B trace-to-column equation, apply the helper to `v i := T (b i)`.

This is a **candidate strategy**, not a compiled theorem. Keep the public OP1C0 theorem, imports, original source carrier, 59 ancestor pins, independent consumer, strict warning and axiom contracts, and resource limits unchanged. Replace only the new source proof with a separately typed helper, repin exactly the changed source Git blob, and launch strict CI. If another red appears, inspect its first cause; do **not** escalate maxRecDepth or modify accepted history.

**Scientific ceiling:** the target is real-part nonnegativity of the original trace of `T†T`, not definiteness, HS norm, source Spin continuity, gauge compatibility, physical closed Hamiltonian, bound states or mass gap.
