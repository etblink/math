# MOL-L2J0 R2 native RED — R3 explicit complex linearity

2026-11-26 Pacific. Run 45944417447, job 140325740490, tested SHA 41db38747f9a00cdf18c4fa6ccdf3d4b0d68c47f. Frozen preflight and pinned toolchain passed; source failed and consumer not reached. Original artifact 15174811071, 7567 bytes, independently downloaded and verified using Python hashlib and zipfile: SHA256 a1876f0bce8256e483c3a1b875bb29b89c652149d4ef89246f8e4cac4a635a8e matches provider, six ZIP members, testzip None. Tested SHA and blobs checked directly: source 793fcf3cdc03a986fafe30ec4c9c776ed2033db3, consumer 6bb5f7d42c830420c4aedc999289c242457ce31d, workflow 5150154bdcd3722be1c22dd15dc8b378bda34ea1. Provider original https://github.com/etblink/math/actions/runs/45944417447/artifacts/15174811071 (retention-limited).

R2 removed the R1 strict linter and deterministic timeout. It isolated a single leaf equality requiring propositional complex linearity of theta rather than definitional equality. Five source reports have only permitted axioms; remaining four have propagated sorryAx and are unqualified.

```text
error: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:66:68: Tactic `rfl` failed: The left-hand side
2026-11-27T05:19:56.5553696Z   ↑(1 / 2 * M.structureConstant A B C * M.gammaTwo i j a b) •
2026-11-27T05:19:56.5554426Z     (coreEval x) ((M.fermionAction b A) ((position i B) ((position j C) f)))
2026-11-27T05:19:56.5555040Z is not definitionally equal to the right-hand side
2026-11-27T05:19:56.5555552Z   ↑(1 / 2 * M.structureConstant A B C * M.gammaTwo i j a b) •
2026-11-27T05:19:56.5556005Z     ↑(coordinate i B x) • ↑(coordinate j C x) • (M.theta b A) (f x)
2026-11-27T05:19:56.5556228Z 
2026-11-27T05:19:56.5556360Z N : ℕ
2026-11-27T05:19:56.5556607Z M : AlgebraData N
2026-11-27T05:19:56.5556893Z a : SpinIndex
2026-11-27T05:19:56.5557140Z f : SmoothCore N
2026-11-27T05:19:56.5557390Z x : Boson N
2026-11-27T05:19:56.5557633Z i : SpaceIndex
2026-11-27T05:19:56.5557915Z hi : i ∈ Finset.univ
2026-11-27T05:19:56.5558186Z j : SpaceIndex
2026-11-27T05:19:56.5558477Z hj : j ∈ Finset.univ
2026-11-27T05:19:56.5558724Z A : ColorIndex N
2026-11-27T05:19:56.5558994Z hA : A ∈ Finset.univ
2026-11-27T05:19:56.5559260Z B : ColorIndex N
2026-11-27T05:19:56.5559539Z hB : B ∈ Finset.univ
2026-11-27T05:19:56.5559793Z C : ColorIndex N
2026-11-27T05:19:56.5560036Z hC : C ∈ Finset.univ
2026-11-27T05:19:56.5560311Z b : SpinIndex
2026-11-27T05:19:56.5560653Z hb : b ∈ Finset.univ
2026-11-27T05:19:56.5561780Z ⊢ ↑(1 / 2 * M.structureConstant A B C * M.gammaTwo i j a b) •
2026-11-27T05:19:56.5562999Z       (coreEval x) ((M.fermionAction b A) ((position i B) ((position j C) f))) =
2026-11-27T05:19:56.5564026Z     ↑(1 / 2 * M.structureConstant A B C * M.gammaTwo i j a b) •
2026-11-27T05:19:56.5565243Z       ↑(coordinate i B x) • ↑(coordinate j C x) • (M.theta b A) (f x)
2026-11-27T05:19:56.5567377Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:96:0: 'FCP.BFSSMOLL2J0.kineticCore' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5568975Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:97:0: 'FCP.BFSSMOLL2J0.potentialCore' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5570172Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:98:0: 'FCP.BFSSMOLL2J0.charge_split' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5571296Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:99:0: 'FCP.BFSSMOLL2J0.coreEval' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5572429Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:100:0: 'FCP.BFSSMOLL2J0.kineticCore_apply' depends on axioms: [propext, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5573536Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:101:0: 'FCP.BFSSMOLL2J0.potentialCore_apply' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5575032Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:102:0: 'FCP.BFSSMOLL2J0.charge_apply_split' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5576250Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:103:0: 'FCP.BFSSMOLL2J0.corePotentialL2_eq' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5577415Z info: OAI/MathematicalPhysics/BFSS/Contrib/Kotler/BFSSMOLL2J0OriginalChargeDecomposition.lean:104:0: 'FCP.BFSSMOLL2J0.chargeL2_split' depends on axioms: [propext, sorryAx, Classical.choice, Quot.sound]
2026-11-27T05:19:56.5578415Z Some required targets logged failures:
2026-11-27T05:19:56.5578932Z - OAI.MathematicalPhysics.BFSS.Contrib.Kotler.BFSSMOLL2J0OriginalChargeDecomposition
2026-11-27T05:19:56.5579455Z error: build failed
2026-11-27T05:19:56.6182745Z
```

R3 retains the six explicit sum-congruence steps. After the existing leaf simplification, explicitly change the goal to theta applied to nested coordinate scalar multiples and use map_smul twice through simp only. This follows the original source definitions of fermionAction, position, smoothMultiplier, and the original qualified potentialOperator_apply. No theorem statements, definitions, consumer, pins, resource limits or policy changes. R1 and R2 negative evidence retained. No physical claim. Local native Lean unavailable; R3 pending strict CI.
