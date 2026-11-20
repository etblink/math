# RHOPF-P9C3D2G0B R3 — original Gamma9 relational nonzero fixed vector strict GREEN

**Date (Pacific):** 2026-11-19 (run completed 2026-11-20 04:28:54 UTC).  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original strict run:** [#44673328325](https://github.com/etblink/math/actions/runs/44673328325), attempt 1 SUCCESS.  
**Exact tested commit:** `88328326104d22cf8750d05e0f374eec64accaa3`.  
**Original job ID:** `136079173765`.  
**Original artifact:** [#14602485032](https://github.com/etblink/math/actions/runs/44673328325/artifacts/14602485032).  
**Independently computed ZIP SHA-256:** `e270f1b4168877911d16ec035fa2d25cc7912e4545f3a62134367254d2ec216f`.  
**Disposition:** **ACCEPT** `FCP.RHOPFP9C3D2G0B.relationalProjector_exists_nonzero_fixed` as original-source-native and independently imported strict GREEN.

## Original exact-source qualification

- Frozen original BFSS Gamma9, relational projector/phase/Circle and prior accepted G0A exact blob pins: PASS.
- Source and independent imported consumer proof-contract preflight, original independent integer fixture: PASS.
- Lean `4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: PASS.
- Accepted original-source dependency build (9032 jobs): PASS.
- Native source warnings-as-errors Lean compilation: PASS.
- Independently imported source-typed consumer warnings-as-errors Lean compilation: PASS.
- Native and independent `#print axioms`: both exactly `[propext, Classical.choice, Quot.sound]`, no `sorryAx`: PASS.
- Original ZIP independently downloaded and SHA-256 computed locally; matches original CI upload digest: PASS.
- Original ZIP extracted `exact-tested-commit.txt` matches exact run tested SHA: PASS.
- Archive entries: `exact-tested-commit.txt`, `native-relational-nonzero-fixed-vector-and-axioms.log`, `independent-lean-types-and-axioms.log`, `independent-original-integer-consumer.json`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Qualified mathematical result

```lean
theorem relationalProjector_exists_nonzero_fixed :
    ∃ v : SpinIndex → ℝ,
      (Matrix.toLin' relationalProjector) v = v ∧ v ≠ 0
```

From strictly qualified nontriviality of the exact Gamma9 projector range, the source identifies a nonzero element of that range and invokes the accepted Mathlib `LinearMap.isProj_range_iff_isIdempotentElem` interface to show it is fixed. No chosen coordinate basis or alternate projection enters. This is a genuine source-derived nonzero projector-fixed vector, but it is not yet normalized.

## Negative knowledge and remaining obligations

G0B R1 [#44670301525](https://github.com/etblink/math/actions/runs/44670301525) failed a local `letI` style error and unavailable projection field notation. G0B R2 [#44671858118](https://github.com/etblink/math/actions/runs/44671858118) failed a local `haveI` proposition style error and unavailable `IsIdempotentElem.mem_range_iff` in imported environment. Both RED diagnostic reports are preserved. R3 avoided local instance declarations and reused the exact source-imported projection interface. No resource limits enlarged.

Next bounded target: use nonzero fixed `v` to prove `Nonempty RelationalUnitSpinor`, with `relationalProjector.mulVec u = u` and `u ⬝ᵥ u = 1` in the original real-16-spinor carrier. Verify normalization's dot-self identity independently, possibly in subgates. The free continuous circle action (F1/F2/F4) and rank-four image (P9C1B1) are accepted. Coordinate-identification with `S³`, genuine Hopf quotient, original Fock-space implementation, gauge/Hamiltonian covariance and physical topology remain unproved and independent.

Preserve RED history; leave `main` and frozen accepted original sources unchanged.
