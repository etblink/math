# K1D18V10D accepted — V10E global source Spin9 orthogonality candidate (2026-10-31)

## V10D verified qualification

**ACCEPTED:** [run #41253181469](https://github.com/etblink/math/actions/runs/41253181469), job `124690755224`, completed success, attempt 1, exact tested SHA `a60b362ee96be965501d6a6cea87561c4d9c8417`. Source blob `351d4b0f1a704ca4e02261b36bf49245e22f80dd`, at `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinGammaMatrixUnitsProbe.lean`.

- Toolchain `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Original nine signed-permutation gamma source and exact accepted V10C original Clifford map SHA preflight passed, pinned restore passed, V10C ancestor compilation passed, fresh strict V10D compiler passed with warnings fatal, three independent source-type examples and three declaration-level axiom whitelist checks passed.
- Accepted declarations: `source9SpinGammaMatrixUnitsHom`, `source9SpinGammaMatrixUnitsHom_apply`, `source9SpinGammaMatrix_isUnit`. All use only `propext`, `Classical.choice`, `Quot.sound`, with no `sorryAx`.
- Green immutable [artifact #13062351923](https://github.com/etblink/math/actions/runs/41253181469/artifacts/13062351923); SHA256 `b4b63f4adf4ecb33ed6b3d621d2cbf8562337f6fa8ef2d25679897c09c1aa9a2`. Artifact nonexpired at acceptance review.

**Mathematically accepted:** actual global *algebraic* source `spinGroup source9Quadratic →* GammaMatrixˣ`; proof uses the exact accepted source `CliffordAlgebra source9Quadratic →ₐ[ℝ] GammaMatrix`, pinned `spinGroup.toUnits`, and `Units.map`. The exact matrix evaluation and invertibility are proven. This is GL(16,ℝ), **not** global SO(original paired 48), not a continuous Spin(9) Lie group representation, not a Spin48 lift or Fock group action.

## V10E next obligation — do not qualify before strict verification

The true next mathematical obstruction is **orthogonality** of this global matrix image, not the existence of additional fixed-parameter exponentials. Pinned source `Mathlib/LinearAlgebra/CliffordAlgebra/Conjugation.lean` provides `CliffordAlgebra.reverse.map_mul` (grade reversal is anti-multiplicative). Source `...SpinGroup.lean` has `spinGroup.involute_eq`, `spinGroup.mul_star_self_of_mem`. The accepted source `FCP.BFSSGamma9.gamma_symmetric` proves each gamma matrix is symmetric.

Candidate V10E tests the exact, necessary chain:
1. Original `gammaNineRealLinear v` symmetric for every source nine-vector.
2. The accepted whole-Clifford gamma representation intertwines Clifford grade reversal and real matrix transpose, via the pinned `CliffordAlgebra.induction` generators/add/mul/scalar API.
3. On the actual even `spinGroup source9Quadratic` subgroup, `star=reverse`; this bridges the known Clifford spin unitary identity to matrix transpose.
4. Exact original global matrix image lies in `Matrix.orthogonalGroup SpinIndex ℝ`, not merely units.
5. Build one genuine `spinGroup source9Quadratic →* Matrix.orthogonalGroup SpinIndex ℝ` global algebraic group homomorphism and prove it has the same exact Clifford gamma evaluation.

**V10E remains UNQUALIFIED until a new strict gate checks all six declarations.** No claim of a source group topology, SO(16) orientation, SO(original paired 48) lift, source Clifford isometry over pairedColorSpinEquiv, central `-1` image, original Spin48 topological covering, or physical CAR/gauge/spectral fact is warranted yet.

Rejected methodology: do not rewrite accepted original 9 gamma matrices, substitute untransported color-major indexing, confuse `CliffordAlgebra.star_ι=-ι` with odd-generator matrix transpose, assert invertibility implies orthogonality, or increase compiler resource limits to hide missing structure-field bridges.

This commit changes only this qualification report, V10E source candidate and its dedicated strict gate; preserves prior negative evidence and qualified ancestors, no main or upstream changes.
