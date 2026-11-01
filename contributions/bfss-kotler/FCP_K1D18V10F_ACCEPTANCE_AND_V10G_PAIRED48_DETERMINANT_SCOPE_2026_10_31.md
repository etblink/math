# K1D18V10F accepted — V10G exact original paired48 determinant boundary (2026-10-31 PDT)

**Dispositions:** V10F **ACCEPTED**. V10G **CANDIDATE / NOT YET QUALIFIED**.

## Strict accepted V10F

- [GitHub Actions #41255474778](https://github.com/etblink/math/actions/runs/41255474778), job `124697615635`, attempt 1, exact successful tested commit `1ad145337a37d06dfb7ab790877ed0349fe02af1`.
- Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pinned, original genuine source 9-gamma orthogonal hom and G1A paired-label ancestry restored, strict `-DwarningAsError=true` fresh compilation plus six independent typed declarations/axiom whitelists passed.
- Accepted V10F source blob `9dc5713dfea7c40d8c9f58088392e144c3c28517` at `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinOriginalPaired48OrthogonalProbe.lean`.
- Accepted declarations `gamma16ToOriginalPaired48_one`, `gamma16ToOriginalPaired48_mul`, `gamma16ToOriginalPaired48_transpose`, `gamma16ToOriginalPaired48_mem_orthogonalGroup`, `source9SpinOriginalPaired48OrthogonalHom`, `source9SpinOriginalPaired48OrthogonalHom_apply`. Each only has axioms `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Preserved [artifact #13062774409](https://github.com/etblink/math/actions/runs/41255474778/artifacts/13062774409), SHA-256 `4a028590c7a6b7b2f328b158b47b001b65c5742792b728689e9b8ea34bbcca22`, nonexpired on verification.

**Exactly qualified boundary:** actual source `spinGroup source9Quadratic →* Matrix.orthogonalGroup Source48Label ℝ`, that is an *algebraic* global `Spin9 → O(48)` homomorphism. It uses the accepted original G1A source permutation `pairedColorSpinEquiv`, not the incorrect color-major index convention. The exact original source formula is `Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv (1₃ ⊗ₖ gammaImage16 g)`.

## V10G — determinant transport, not fabricated orientation

Pinned Mathlib provides `Matrix.det_reindex_self` in `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` and `Matrix.det_kronecker` in `Mathlib/LinearAlgebra/Matrix/Kronecker.lean`. Those imply the exact original 48-label determinant of the qualified source gamma transport is the **third power** of its 16-spinor determinant: `det(gamma16ToOriginalPaired48 A)=(det A)^3`, since `ColorIndex 2` is `Fin 3`.

V10G probes four small *typed* obligations: exact paired determinant transport; full source-group 48 determinant formula; exact identity of transported source `plane16 r s` with already qualified original paired `originalPairedPlane r s`; and a **conditional** SO(original paired48) membership theorem assuming det of the source O16 gamma image is +1. The last theorem **does not discharge its antecedent**, so **do not** claim a global SO48 action even on V10G green.

This algebraically isolates the remaining determinant-one obstruction to the 16-real source gamma image and preserves the paired-label source map unchanged. Source Spin9 topological continuity, Spin48 covering/lift, original global Fock implementation, central action, and BFSS physical statements remain separately **OPEN**.

**Method:** Preserve all former red/green evidence. Do not change pinned source gamma or labels; no resource increases, `sorry`, `axiom` or surrogate hypotheses, and no upstream PR. A red V10G requires source-exact typed diagnostic, never fake gate promotion.
