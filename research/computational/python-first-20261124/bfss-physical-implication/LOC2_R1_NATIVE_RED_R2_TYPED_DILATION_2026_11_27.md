# LOC2 R1 native RED — R2 explicitly typed dilation

2026-11-27 Pacific. Run 45991763710, job 140481057642, exact tested SHA f6d86840fe792b35d6ee37ee3830f8d98bdd2241. Frozen preflight and pinned toolchain passed; native source failed and independent consumer not reached. Original artifact 15194107807, 8141 bytes, independently downloaded and verified with local Python hashlib and zipfile: SHA256 837f7ccc802b463eed6446bd57a0e635719a0f5440ff5aecf0777ea444f0995c matches provider; six ZIP members testzip None. Original tested-sha.txt matches and tested-blobs.txt records source cff9fd90ed3c9f0d21f80152059b0645b0c25fdf, consumer e1be80a177af66940a3c7dc28952a5c7d8f675a2, workflow 9edc45bdc63a3c4c90e73a483d43653693578b69. Provider original https://github.com/etblink/math/actions/runs/45991763710/artifacts/15194107807 (retention-limited).

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:37:31: Application type mismatch: The argument
2026-11-27T11:44:01.5556618Z   ContDiff.smul contDiff_const contDiff_id
2026-11-27T11:44:01.5556977Z has type
2026-11-27T11:44:01.5557419Z   ContDiff ?m.57 ?m.62 ((fun x => ?m.39) • id)
2026-11-27T11:44:01.5568142Z but is expected to have type
2026-11-27T11:44:01.5568717Z   ContDiff ℝ (↑⊤) (HSMul.hSMul (cutoffScale n))
2026-11-27T11:44:01.5569125Z in the application
2026-11-27T11:44:01.5569686Z   ContDiff.comp (ContDiffBump.contDiff (baseCutoff N)) (ContDiff.smul contDiff_const contDiff_id)
2026-11-27T11:44:01.5570996Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:123:0: 'FCP.BFSSLOC2.baseCutoff' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5572696Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:124:0: 'FCP.BFSSLOC2.cutoffScale' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5574681Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:125:0: 'FCP.BFSSLOC2.cutoffScale_pos' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5576464Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:126:0: 'FCP.BFSSLOC2.cutoffScale_tendsto' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5578468Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:127:0: 'FCP.BFSSLOC2.expandingCutoff' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5580838Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:128:0: 'FCP.BFSSLOC2.expandingCutoff_smooth' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5582336Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:129:0: 'FCP.BFSSLOC2.expandingCutoff_bounds' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5583714Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:130:0: 'FCP.BFSSLOC2.expandingCutoff_support' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5585075Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:131:0: 'FCP.BFSSLOC2.expandingCutoff_compact' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5586464Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:132:0: 'FCP.BFSSLOC2.expandingCutoff_eventually_one' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5588072Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:133:0: 'FCP.BFSSLOC2.expandingCutoff_gradient' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5589445Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:134:0: 'FCP.BFSSLOC2.baseCutoff_gradient_bound' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5590838Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSLOC2OriginalExpandingCutoffs.lean:135:0: 'FCP.BFSSLOC2.expandingCutoff_uniform_gradient' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T11:44:01.5591703Z Some required targets logged failures:
2026-11-27T11:44:01.5592311Z - OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSLOC2OriginalExpandingCutoffs
2026-11-27T11:44:01.5592817Z error: build failed
2026-11-27T11:44:01.6699716Z
```

R2 repair: explicitly type the constant real scalar function and the boson identity as ContDiff of the required order, combine via ContDiff.smul with a named dilation proof, then compose the fixed bump with that function. No theorem statement, definition, prior qualified source, resource limit, independent consumer, or verification policy change. Twelve other source axiom reports are clean (including gradient scaling/decay), but the gate is unqualified. Local native Lean unavailable; R2 pending strict CI. Canonical state read via full Git blob, all prior history retained.
