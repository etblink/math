# RHOPF-P9C3D2G1D49 R1 — original strict RED, independent checker stale-name failure

**Pacific date:** 2026-11-21. **Disposition:** RED, D49 NOT YET QUALIFIED. Original [run #44938565865](https://github.com/etblink/math/actions/runs/44938565865), job `136950532730`, attempt 1, exact tested commit `4afd9bf87c9a6c5ed31da6cc36fed100304f6219`.

## Original archived evidence
[Original original-source artifact #14720829280](https://github.com/etblink/math/actions/runs/44938565865/artifacts/14720829280) downloaded independently and ZIP SHA-256 recomputed as `fc083fde0bcd3bf76a4e1413107e0e9ce7d5acfdd3da65d1c3759c7756cf6b8d`, equal to original GitHub digest. Six ZIP members, `unzip -t` PASS, embedded `exact-tested-commit.txt` equals `4afd9bf87c9a6c5ed31da6cc36fed100304f6219`.

## Verified gate components — distinct from overall RED
- Frozen original Gamma9 source SHA/contract preflight PASS and independent source-original integer signed-permutation fixture PASS.
- Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; original dependency build 9,096 jobs PASS.
- Native source D49 compilation PASS, with all three native declarations' `#print axioms` reports containing only permitted `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx` or `error:`.
- Independent imported consumer D49 compilation also PASS and all three independent `#print axioms` reports clean, as independently parsed from the original ZIP. **Six mathematical axiom checks were clean despite overall CI RED.**

## Actual RED cause (workflow contract, not Lean math)
In final Python native/independent axiom verifier step, line 232 of D49 workflow used stale D48 declaration name:

```python
for name in ['relationalSourceQUnitEuclideanUnitHomeomorph']:
```

The original native and independent output contains the three D49 declarations, not this D48 declaration; final checker raised `AssertionError: ('FCP.RHOPFP9C3D2G1D49.relationalSourceQUnitEuclideanUnitHomeomorph', [])`, and the independent consumer CI step failed even though its Lean compilation succeeded.

## Bounded R2 correction
Modify **only** the stale verifier list in D49 workflow to check all three D49 declarations:
- `relationalSourceQUnitCircleAction`
- `relationalEuclideanUnitCircleAction`
- `relationalSourceQUnitHomeomorph_circle`

Preserve original source/independent consumer SHA pins, original Gamma9 source, all prior accepted D42 and D45–D48, pinned toolchain and Mathlib, full axioms whitelist, and `main`. Re-run full strict original native+independent verification and preserve its own artifact. **Do not mark D49 accepted on the basis of R1's partial PASS alone.** R1 original RED and diagnostic remain immutable.
