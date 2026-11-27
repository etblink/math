# MOL-L2G0 R1 native RED — R2 explicit typed continuity repair

2026-11-26 Pacific. Run 45939461329, job 140310176014, exact candidate 35a29856d258e7d58499ab5ac39d90bccf7440de. Frozen original source preflight and pinned Lean 4.34.1/Mathlib restoration passed. Native source failed; independent consumer not reached. Original artifact 15172267609, 7021 bytes, independently downloaded and verified using Python hashlib and zipfile: SHA256 e52b3688dffb5518582161997375d2e8947eb628828caceef9c39c674a889dec matches provider; six ZIP members testzip None. Tested SHA and blobs match source 5c485010943c9a8bc8d39a68fc1a715b36a1adfd, consumer 41d9808eb8a174443a51ccd242352f4367c0fec3, workflow f6c4407d929233beafff84468c045e38fcc78128. Retention-limited provider original https://github.com/etblink/math/actions/runs/45939461329/artifacts/15172267609.

First causal failure line 50:48: stuck TopologicalSpace metavariable in nested continuity proof. The first two source reports (potentialOperator and potentialOperator_apply) have only propext, Classical.choice, Quot.sound; continuity and its two dependent bound declarations have sorryAx from the elaboration error and are not qualified.

Original first-causal job diagnostic:

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:50:48: typeclass instance problem is stuck
2026-11-27T04:27:49.8655688Z   TopologicalSpace ?m.206
2026-11-27T04:27:49.8655868Z 
2026-11-27T04:27:49.8656972Z Note: Lean will not try to resolve this typeclass instance problem because the type argument to `TopologicalSpace` is a metavariable. This argument must be fully determined before Lean will try to resolve the typeclass.
2026-11-27T04:27:49.8657710Z 
2026-11-27T04:27:49.8658752Z Hint: Adding type annotations and supplying implicit arguments to functions can give Lean more information for typeclass resolution. For example, if you have a variable `x` that you intend to be a `Nat`, but Lean reports it as having an unresolved type like `?m`, replacing `x` with `(x : Nat)` can get typeclass resolution un-stuck.
2026-11-27T04:27:49.8660620Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:74:0: 'FCP.BFSSMOLL2G0.potentialOperator' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T04:27:49.8662040Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:75:0: 'FCP.BFSSMOLL2G0.potentialOperator_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T04:27:49.8663544Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:76:0: 'FCP.BFSSMOLL2G0.potentialOperator_continuous' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T04:27:49.8665014Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:77:0: 'FCP.BFSSMOLL2G0.potentialOperator_ball_bound' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T04:27:49.8666496Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2G0OriginalPotentialBound.lean:78:0: 'FCP.BFSSMOLL2G0.potentialOperator_difference_bound' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T04:27:49.8667385Z Some required targets logged failures:
2026-11-27T04:27:49.8668111Z - OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2G0OriginalPotentialBound
2026-11-27T04:27:49.8668621Z error: build failed
2026-11-27T04:27:49.9198287Z
```

R2 makes only one proof-local repair: introduce explicitly typed continuity witnesses htheta : Continuous (fun _ : Boson N => M.theta b A) and hcoef : Continuous (fun _ : Boson N => original complex coefficient). Compose them using the same nested scalar-multiplication continuity lemma with the already typed h1/h2. No mathematical statement, source import, accepted source, consumer, workflow, pins, resource limits, or axiom policy changed. No physical promotion. Local native Lean unavailable; R2 candidate unqualified pending strict CI. If this repair fails natively, re-evaluate the architecture rather than repeatedly increasing resources.
