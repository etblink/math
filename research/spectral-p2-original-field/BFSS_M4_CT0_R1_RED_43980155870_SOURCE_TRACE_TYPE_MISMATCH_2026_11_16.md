# BFSS CT0 R1 — strict RED: original trace cyclicity Lean type mismatch

Date: 2026-11-16 Pacific. Branch: `integration/bfss-unified-research-20261108`.

**Verdict: RED / UNQUALIFIED, not mathematical disproof.** Original [strict run #43980155870](https://github.com/etblink/math/actions/runs/43980155870) completed **FAILURE**, tested commit `144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e`, job `133694241639`.

The exact source/consumer/donor/toolchain preflight passed, and Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration completed. Cold native source compilation failed. The independent consumer and three full strict source/consumer axiom audits were not reached. Do **not** qualify CT0.

## First causal failure

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4CT0OriginalSkewBivectorTrace.lean:41:4:
Application type mismatch: The argument
  originalFockEndAlgEquiv.symm X
has type
  Module.End ℂ (Fermion 2)
of sort Type but is expected to have type
  Type ?u.20
of sort Type (?u.20 + 1) in the application
  @LinearMap.trace_mul_comm (originalFockEndAlgEquiv.symm X)
```

R1 invoked `LinearMap.trace_mul_comm` as if its first positional argument were an operator. At the pinned API, that argument position is a type parameter. This is an elaboration/signature mismatch in the *first source theorem* (`originalFockTrace_mul_comm`); not evidence that trace cyclicity, the original skew-sum identity, or the project’s physical theorem is false.

Consequently the `#print axioms` output on the failed cyclic-trace theorem and downstream original K-trace theorem included `sorryAx`; those reports are **RED evidence, never acceptance**. The independent scalar skew/symmetric finite-sum helper reported only `propext, Classical.choice, Quot.sound` but the gate did not satisfy its cold source and consumer acceptance requirements, so no root is promoted.

## Original evidence

- [Complete original job log](research/spectral-p2-original-field/diagnostics/BFSS_M4_CT0_R1_43980155870_complete_job.log) from GitHub Actions, preserved without reconstructing the failure.
- Original GitHub Actions artifact ID: `14284665134` ([provider artifact](https://github.com/etblink/math/actions/runs/43980155870/artifacts/14284665134)), ZIP SHA-256 as reported by Actions: `8657ba3a6002428c8e7194d88460ac7998ed2ed4b86aeeaf6816613a3953e3b3`; upload `bfss-m4-ct0-144d2d1d9c7b14199ad5ebf9e0c0dfe13410e55e-1.zip`, size `17567` bytes. Provider artifact exists as of this receipt; the original binary ZIP has **not** been copied into the repo. Never claim it has.
- Staged source blob `6f884308f3029d5e2b227ddcabd0558e35c2c6f8`, independent consumer blob `f2ddadc880c62632dd91547526ee97bc92a0d504`, workflow blob `11071ae728e6f6b21bf623b5662c220872f0d935`. Exact donors unchanged.
- The unrelated roadmap governance failure sequence #43979915272, #43979979963 and #43982339512 was resolved by successful [#43982431503](https://github.com/etblink/math/actions/runs/43982431503) and documented in `BFSS_M4_CT0_ROADMAP_GOVERNANCE_REPAIR_2026_11_16.md`. Do not conflate the two.

## Safe bounded R2 candidate (NOT IMPLEMENTED)

Inspect pinned `Mathlib/LinearAlgebra/Trace.lean` theorem signature and supply its necessary explicit type parameters, or use a source-proved cyclicity rewrite with the actual T1 `Module.End ℂ (Fermion 2)` carrier. Keep all existing accepted source statements, exact original operator trace, coefficient `1/4`, and scalar finite-sum proof unchanged. Before any new run freeze revised source SHA, independent consumer and workflow pins, preserve this R1 log and provider ZIP evidence, and maintain the one-gate-at-a-time stop rule.

**Governance note:** the schema-2 `BFSS_GATE_STATE.json` currently registers CT0 R1 as `PENDING_STRICT_CI` from its earlier staging. This receipt records the later observed RED. Do not promote it to GREEN; a canonical RED checkpoint update requires the schema's complete immutable evidence conditions. P0B R3 remains the last accepted proof gate.

No direct R1 repair, CI rerun, accepted proof change, branch migration, toolchain alteration or `main` write is performed by this receipt.
