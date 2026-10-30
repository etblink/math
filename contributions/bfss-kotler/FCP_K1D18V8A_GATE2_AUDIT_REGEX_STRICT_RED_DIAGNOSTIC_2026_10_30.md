# Project Lead — K1D18V8A Gate 2 strict red: audit-output parsing, not Lean (2026-10-30)

**Disposition:** IMMUTABLE RED EVIDENCE. Two source-exact Lean roots compiled but no full strict qualification until independent gate is green.

## Verified exact run

- [V8A Gate 2 #41138786968](https://github.com/etblink/math/actions/runs/41138786968) — tested SHA `0eb5a2930d5e7ff10ade37f1935176837ff18c9e`, job `124347697045`, complete conclusion **failure**.
- Evidence artifact `13018221747` digest `sha256:ad43cfe7d0a6bea4166656c3c1910c59feb4c0acf5b3b5d0f6030c87e67669de`.
- Strict source/toolchain pin checks **PASS**. Dependency restore **PASS**. Exact gamma, paired-label, source48 ancestor compilation **PASS**. Fresh V8A warning-as-error Lean compilation **PASS**.
- Fresh compiler printed exactly:
  - `'FCP.BFSSPairedSpin9Plane.originalPairedPlane_transpose' depends on axioms: [propext, Classical.choice, Quot.sound]`
  - `'FCP.BFSSPairedSpin9Plane.originalPairedPlane_sq' depends on axioms: [propext, Classical.choice, Quot.sound]`
- Independent audit source imported candidate and ran both `#check` and both `#print axioms` successfully; both declarations' full types and allowed axiom dependencies appeared without Lean errors.
- **First actual failure:** Python audit assertion `('missing exact declaration type', 'FCP.BFSSPairedSpin9Plane.originalPairedPlane_transpose')`. The checker required the substring `name + ' :'`, but Lean prints binder-bearing theorem types as `name (r s : SpaceIndex) (hrs : r ≠ s) :`. This is an **audit script false negative** on a valid theorem signature, not a mathematical/Lean compiler issue.

## Resolution and controls

- Keep exact original Lean candidate SHA/blobs and two theorem statements **unchanged**.
- Improve the independent audit with actual Lean `example` declarations whose propositions restate both exact original source-indexed targets, applied to original theorem declarations. This checks the type semantically inside Lean instead of depending on a fragile output string. Preserve direct `#check` and `#print axioms` for both declarations, and assert the full printed parameter prefix with a binder-aware regex as supplemental evidence.
- Only if fresh compilation, exact Lean type examples, independent allowed-axiom audit, and evidence retention all succeed can V8A be promoted. A passing compilation alone was not sufficient for Gate 2's strict policy.
- Do not increase proof/resource limits, introduce new axioms, alter source labels, or change mathematical statements. Preserve the original Gate 1 `ᵀ` parser red and separate this Gate 2 validator false negative.

**Generalizable failure pattern:** an output parser that assumes `theoremName :` instead of binder-bearing `theoremName (args) :` can falsely reject independently checked Lean theorems. Prefer type-checking exact propositions in Lean, leaving textual regex as a secondary signal.
