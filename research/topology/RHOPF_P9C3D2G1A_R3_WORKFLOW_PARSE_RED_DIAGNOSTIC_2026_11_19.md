# RHOPF-P9C3D2G1A R3 — workflow-parse RED (no Lean jobs)

**Pacific date:** 2026-11-19.  
**Canonical branch:** `integration/bfss-unified-research-20261108`.  
**Original tested commit:** `c0d1d2fb9258f8507636140e724d4d8d7a7176e0`.  
**Original GitHub Actions run:** https://github.com/etblink/math/actions/runs/44682518923  
**Conclusion:** FAILURE with **zero jobs**; invalid workflow YAML was rejected before checkout, preflight, Lean and artifact steps.

## Failure mechanism

The R3 workflow-only change attempted to update the independent consumer structural preflight from requiring one `end` to requiring two `end` declarations and one `noncomputable section`. The JavaScript `String.replace` replacement-string argument contained the regex text ending in `?$'`. JavaScript treats `$'` in a replacement string as a special back-reference to the entire substring after the match. This silently injected the remaining workflow into the replacement, corrupting the multiline YAML (338 lines instead of the expected 181/182). This incident is **workflow orchestration only**. It neither qualifies nor refutes the original mathematical equivalence. No native/independent jobs ran; no artifacts exist for this run.

R1 mathematical source had already compiled natively, but the independent consumer needed noncomputable context. R2 repaired that consumer, yet the strict preflight still expected one `end`. The R3 intended consumer structure change was mathematically appropriate; its generated YAML was not.

## Bounded R4 correction

Regenerate the complete workflow from the last known syntactically accepted R2 workflow blob at `0569870c0d99c34c113378865fe7bd461c5b38b3`, changing exactly these two structural checks, with a **callback** in the replacement that treats all dollar signs literally:

```python
assert re.findall(r'(?m)^end(?: (\\S+))?$',consumer)==['','FCP.RHOPFP9C3D2G1AIndependent']
assert re.findall(r'(?m)^noncomputable section$',consumer)==['noncomputable section']
```

The checks remain strict: exactly one anonymous section end, one matching named namespace end, and precisely one `noncomputable section`. Preserve original mathematical source, original consumer, all blob pins, source-independent fixture, Lean 4.34.1/Mathlib pins, warning-as-error compilation, proof budgets, and both previous G1A RED reports unchanged.

The new workflow structure was checked locally for exactly one top-level `jobs:`, one `steps:`, two Python heredocs and the expected line count before commit. Require complete strict native + independently imported GREEN, acceptable axioms and independently verified ZIP before acceptance. No `S³`, Hopf quotient, Fock state, or physical topological claim follows from this repair.
