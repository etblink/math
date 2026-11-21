# RHOPF-P9C3D2G1D43 R1 — original strict RED preserved

**Date (Pacific):** 2026-11-21. **Disposition:** RED, D43 UNQUALIFIED. Original [run #44919215004](https://github.com/etblink/math/actions/runs/44919215004) job `136891365037`, attempt 1, tested commit `ae72d35a70023b283c5bc9c7f512354ec1de1ab7`.

The exact frozen original Gamma9 source SHA and bounded proof contract preflight passed; the independent source-exact signed-permutation integer fixture passed; Lean 4.34.1 / pinned Mathlib restore passed; all 9,090 accepted dependency build jobs passed.

**Native compilation FAILED at new D43 source line 1**, before proof elaboration:
```text
object file .../Mathlib/Tactic/Omega.olean of module Mathlib.Tactic.Omega does not exist
```
This Lean module is not present at Mathlib pin `d13f23b723b8a846827a245b89c10fc7d3f11612`; the pinned `Mathlib/Tactic.lean` is present. Independent imported consumer SKIPPED. No valid D43 `#print axioms` reports; no evidence for or against D43 theorem yet.

**Original artifact:** [#14713114238](https://github.com/etblink/math/actions/runs/44919215004/artifacts/14713114238), ZIP SHA256 `caf90f66c1814f27ef4e4bbcbb1e3a904565bc34fa4b34aa289cb30903e1b03d`, independently downloaded and hashed with matching GitHub uploader digest. ZIP integrity verified; five original members; `exact-tested-commit.txt` matches `ae72d35a70023b283c5bc9c7f512354ec1de1ab7`. Preserve this original RED archive and logs.

**R2 narrow repair:** replace only invalid source `import Mathlib.Tactic.Omega` with verified available `import Mathlib.Tactic`; update the single source blob hash and import contract in strict workflow. Mathematical theorem statements, proofs, consumer, all accepted Gamma9 sources, and `main` remain unchanged. D43 qualification requires complete new strict native+consumer compilation, six axioms restricted to `propext`, `Classical.choice`, `Quot.sound`, and independent original ZIP verification.

Do not infer complex `ℂ²` isometry, Hopf quotient or physical BFSS result from an unqualified gate.
