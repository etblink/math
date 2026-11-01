# F10S Gate 1 red — precise causal diagnosis and Gate 2 namespace repair (2026-11-01)

**Run:** [#41288470788](https://github.com/etblink/math/actions/runs/41288470788) — **RED** at exact tested commit `b6df2559e7dc1717feaee61926156f81c57aca05`. **Preserve as red; not a mathematical counterexample.**

**Failed step:** `Fresh F10S original gamma negative scalar warning-as-error proof`. The source-hash pins, Lean v4.34.1 + pinned Mathlib restore, and the *entire accepted F10R ancestry rebuild* passed. Independent exact-type audit skipped because proof compilation failed.

**First causal compiler diagnostic:** `SU2BFSSPairedSpin9V10HF10SOriginalPairedNegativeScalarActionProbe.lean:47:37: error(lean.unknownIdentifier): Unknown identifier 'pairedColorSpinEquiv'`. The immediate `line 46:40: unsolved goals` followed from the unresolved local `let E := Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv`. The subsequent compiler diagnostic printed `sorryAx` for F10S proof candidates because elaboration was incomplete. None of those declarations qualifies.

**Why:** `pairedColorSpinEquiv` is **already accepted** in namespace `FCP.BFSSPairedSpin9Plane` (the unchanged original G1A paired Fock-order transport). F10S used it without opening that namespace. This is a missing identifier-scope bridge, not a missing theorem, false claim, or reason to change the source indices.

**Single mathematical-source edit:** insert `open FCP.BFSSPairedSpin9Plane` alongside existing local opens. Preserve all theorem statements, proof steps, genuine source Clifford map, original paired index transport, and source negative-scalar membership *conditional*.

**Workflow edit:** update the already-strict F10S pinned blob hash to the repaired source; keep exact dependencies, `-DwarningAsError=true`, four independent elaborated proposition checks, declaration axiom whitelist, and diagnostics/artifact upload unchanged. Repair is a candidate, not accepted until the new gate passes. No warning disabling, raised limits, new axioms or `sorry` introduced.

**Gate 1 negative evidence:** [artifact #13076845287](https://github.com/etblink/math/actions/runs/41288470788/artifacts/13076845287), ZIP SHA-256 `4fab8a6028df65e5ee93b0c3a2a7147533f1335362ca2afad7f569d3f09196f5`.

**Boundary:** No Spin9 negative central element/membership is constructed by F10S. No continuous Spin9 action, Spin48 lift/cover, Fock implementer or BFSS physical theorem. Accepted F10R remains unchanged. No main merge or external upstream PR.
