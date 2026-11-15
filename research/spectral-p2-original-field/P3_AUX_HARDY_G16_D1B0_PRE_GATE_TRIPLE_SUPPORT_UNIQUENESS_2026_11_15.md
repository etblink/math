# G16 D1B0 — preregister finite triple-support uniqueness diagnostic

**REGISTERED_NOT_EXECUTED, November 15, 2026.** This contract must precede any new D1B0 Lean source, consumer or workflow. Accepted full predecessor: [G15 R4 #43763173942](https://github.com/etblink/math/actions/runs/43763173942). Qualified G16 diagnostics: [D0 R2 #43768003845](https://github.com/etblink/math/actions/runs/43768003845), [D1A R2 #43769722679](https://github.com/etblink/math/actions/runs/43769722679). All remain unchanged. The [D1A acceptance](P3_AUX_HARDY_G16_D1A_R2_GREEN_43769722679_SOURCE_GAMMA_FROBENIUS_ACCEPTANCE_2026_11_15.md) and [audit](diagnostics/P3_AUX_HARDY_G16_D1A_R2_GREEN_43769722679_INDEPENDENT_AUDIT_2026_11_15.json) are preserved.

## Exact finite proposition

Reuse the *existing* D0 `planeLeft (t:Fin4)=2t`, `planeRight (t:Fin4)=2t+1` on `Fin 9`. Define finite admissible plane/third-axis labels

```lean
abbrev TripleLabel :=
  {x : Fin 4 × Fin 9 // x.2 ≠ planeLeft x.1 ∧ x.2 ≠ planeRight x.1}

def tripleSupport (x : TripleLabel) : Finset (Fin 9) :=
  {planeLeft x.1.1, planeRight x.1.1, x.1.2}
```

Four separately named theorem roots:
1. `tripleLabel_card`: `Fintype.card TripleLabel = 28`;
2. `tripleSupport_card`: every label has support cardinality 3;
3. `tripleSupport_injective`: no two admissible labels have the same triple support;
4. `thirdAxis_outside`: every admissible third index is strictly less than the left endpoint or strictly greater than the right endpoint.

These are finite, exact propositions; `decide`/exhaustive term computation is allowed under default kernel checking only. Reject `native_decide`, `sorry`, `admit`, added axioms, heartbeat/recursion escalation, opaque external numerics and any changed D0/G15/GammaWords source. If general `decide` elaboration is too expensive, record a red and switch to an explicit structural `Fin 4` / `Fin 9` proof, not a budget increase.

## Tests and controls

A *new* Mathlib/D0-only source and independent consumer (not a change to qualified D0), exactly four source named axiom roots, at least seven independent consumer examples: theorem forwarding, explicit support `{0,1,2}` from plane0/axis2, `{6,7,8}` from plane3/axis8, and a pair of distinct labels whose supports must be unequal. Require source and consumer exact `#print axioms` for the four roots; allowed axioms only `propext`, `Classical.choice`, `Quot.sound`; toolchain Lean4.34.1 and Mathlib `d13f23b7...` pinned; strict warnings-as-errors. Fresh workflow pins source/consumer blobs and accepted D0, D1A, G15, Core/GammaWords byte closure, and preserves all logs/evidence (R1 negative if applicable). Provide static positive and negative checks on source absence of original gamma/Fock, four roots, consumer examples and frozen upstream hashes.

**Exit ceiling:** D1B0 GREEN proves only exact finite triple-support uniqueness and the no-middle-index dichotomy. It does not prove the ordered Clifford product sign, the orthogonal-family Parseval formula, `originalHardyY` coefficient identity, full G16, physical Spin(9), energy/domains, Hardy, or fidelity. Any source-mismatch, false support uniqueness, linter/axiom failure is RED; no silent alteration or retry.
