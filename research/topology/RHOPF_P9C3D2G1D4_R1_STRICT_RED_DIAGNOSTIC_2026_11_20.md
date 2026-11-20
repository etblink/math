# RHOPF-P9C3D2G1D4 — R1 native RED preserved

**Date:** 2026-11-20 (Pacific). **Disposition:** REJECTED_STRICT_RED.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original run:** [#44725244988](https://github.com/etblink/math/actions/runs/44725244988) at exact tested `f60489dce4527d431c1c070c4b6ab2db49414c6d`; job `136250891801`.  
**Original evidence artifact:** [#14624611943](https://github.com/etblink/math/actions/runs/44725244988/artifacts/14624611943).  
**Independently downloaded and SHA256 verified:** `b08ba1468e6c2b53dfa2226ae4c69c7aa391da26c4a71e49208be1d1d6053785` matches original CI upload. ZIP embedded `exact-tested-commit.txt` matches tested HEAD. Archive has five entries.

## Executed facts

Original source blob pins, signed integer fixture and structural preflight: PASS. Lean 4.34.1 and pinned Mathlib restored: PASS. Accepted dependency build: PASS (9,051 jobs). Native new source: RED. Imported independent consumer: correctly SKIPPED. The native reports show `sorryAx`; the theorem is **not accepted**.

```text
G1D4OriginalGammaRelationalStandardSphereHomeomorph.lean:30:28 unknown identifier StandardUnitCoordinates
G1D4OriginalGammaRelationalStandardSphereHomeomorph.lean:36:8 declaration uses sorry
G1D4OriginalGammaRelationalStandardSphereHomeomorph.lean:46:9 unknown identifier StandardUnitCoordinates
```

## Narrow root-cause and bounded correction

The accepted G1D0 source defines `StandardUnitCoordinates` inside namespace `FCP.RHOPFP9C3D2G1D0`. The new G1D4 native and independent imported consumer omitted this namespace, although G1D2 uses it indirectly through its own imports. The `sorryAx` is compiler elaboration fallout, not a proof of topological obstruction.

Permitted R2 change: add `open FCP.RHOPFP9C3D2G1D0` once in each new module, update exactly their source SHA pins in the original strict workflow, and rerun unchanged strict native/consumer checks. No altered theorem statements/proof tactics, no new axioms, no source projector edits, no enlarged proof budgets, no writes to `main`. Stop after a second native RED to diagnose new evidence.

Preserve this RED as a reusable negative-knowledge artifact; never relabel R1 GREEN.
