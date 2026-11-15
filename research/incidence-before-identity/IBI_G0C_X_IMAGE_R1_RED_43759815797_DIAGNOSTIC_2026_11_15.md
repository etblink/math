# IBI-G0C-X-IMAGE — R1 RED strict linter diagnosis

**Decision date:** 2026-11-15 Pacific  
**Status:** RED_NOT_QUALIFIED, independent consumer not yet reached; source theorem compilation completed in non-strict cold build.
**Original tested commit:** `a1edd04bc4b19d6b78c3fdd0e5808f312d0a62d8`
**Research branch at R1:** `research/bfss-incidence-unified-20261114`

## Exact evidence and interpretation

- [Run #43759815797](https://github.com/etblink/math/actions/runs/43759815797) `completed/failure`, job `132951875468`.
- Pinned original source/consumer preflight passed, Lean 4.34.1 / pinned Mathlib restored. The cold `lake build` finished **9019 jobs** and printed allowed axioms for `sourceXPauli_trace_rotX` and `originalAdjointColorMatrix_sourceX_eq_rotX`: exactly `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.
- Strict source `lake env lean -DautoImplicit=false -DwarningAsError=true -o ...` failed at `IBIG0CXImage.lean:82:24`: `This simp argument is unused: neg_zero`. Lean explicitly recommended omitting it.
- Therefore **no source proof mismatch** is shown, but the candidate is **not GREEN** because strict source and independent consumer weren't completed.
- [Preserved R1 artifact #14179769451](https://github.com/etblink/math/actions/runs/43759815797/artifacts/14179769451), 5412 bytes as reported by GitHub; job-log artifact ZIP SHA256 `b8adfe895c8252e5240920e9f11ab55b6b179c3d755028334130aab7672e7f87`, not independently downloaded/rehashed.

## R2 minimal correction and scientific boundary

- Remove only unused `neg_zero` argument from the finite `simp only` expansion; leave theorem statements, original native X generator, source BFSS color action, all other proof tactics and independent consumer **byte-identical**.
- Re-pin this exact source Git blob in its strict workflow and launch a new run. The RED artifact and memorandum remain available; no retroactive GREEN.
- If the independent consumer reports a new typed mismatch, preserve that goal, and do not conflate it with this linter-only RED.
- This does not qualify X-image or prove arbitrary SO3 Euler decomposition or global surjectivity. No changes to previously qualified source bytes, unified integration or main.

The separate SO(3) Euler forward-research memo was committed evidence-only while R1 ran. It was not part of the exact R1 test SHA and has no effect on original tested source.
