# K1D18V10H F10F Gate 1 RED — matrix application vs transpose API; bounded repair

Date: 2026-10-31 PDT. Authorized branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Preserved immutable evidence

- [Strict F10F #41270798888](https://github.com/etblink/math/actions/runs/41270798888), attempt 1, job `124742985150`, `completed/failure` at SHA `836cc90339c80af0d9ede2078aaf2cb9d000d42f`.
- [CI artifact #13069516265](https://github.com/etblink/math/actions/runs/41270798888/artifacts/13069516265) SHA-256 `41b3936a3c40a922f1040a2348cc91b3e6e94a77313a989d1667cddc99419331`, not expired at review.
- Pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact original gamma and accepted F9/F10E hashes preflight PASS, pinned dependencies restored PASS, accepted F10E source ancestry rebuilt PASS.
- Fresh `-DwarningAsError=true` F10F compiler FAILED at line 68 of the source, `simp only [Finset.sum_apply, Pi.smul_apply, smul_eq_mul]`. Exact diagnostic: `error: \`simp\` made no progress`, target not type-correct under implicit transparency, `function expected (∑ a, v a • gamma a) j`. The attempted entrywise reduction of a matrix-valued sum crossed a nested function/matrix elaboration boundary.
- First `source9Quadratic_eq_zero_iff` and second `source9Quadratic_pos_of_ne` elaborated, with only `propext`, `Classical.choice`, `Quot.sound`. Third `gammaNineRealLinear_isSymm` had `sorryAx` from an incomplete proof. The independent three-declaration type/axiom audit was rightly SKIPPED. **F10F is not accepted**.

## Pinned Mathlib source-exact repair — candidate, no claims until CI

The pinned `Mathlib/Data/Matrix/Basic.lean` provides `Matrix.transpose_sum`, transporting transpose through a finite **matrix sum**, and pinned `Mathlib/LinearAlgebra/Matrix/Defs.lean` provides `Matrix.transpose_smul`. Pinned `Mathlib/LinearAlgebra/Matrix/Symmetric.lean` identifies `Matrix.IsSymm A` with `A.transpose=A`; the accepted original source public `gamma_symmetric a : (gamma a).IsSymm` supplies each summand. This avoids the unsuccessful `Finset.sum_apply` and `Pi.smul_apply` path.

Proposed exact replacement for **only** the third proof:
```lean
  change (∑ a : SpaceIndex, (v a) • gamma a)ᵀ =
    ∑ a : SpaceIndex, (v a) • gamma a
  rw [Matrix.transpose_sum]
  apply Finset.sum_congr rfl
  intro a ha
  rw [Matrix.transpose_smul, (gamma_symmetric a).eq]
```
The source theorem statement, first two already elaborated proofs, original public gamma and original 48 paired-Fock indexing are unchanged. The F10F strict workflow retains all three exact type/axiom independent checks, pinning the updated source blob and checking the two actual Mathlib transpose identities instead of the failed entrywise tactic.

This proof is an **unqualified candidate** pending full warningAsError and independent audit. Do not bypass the checks, increase maxHeartbeats/maxRecDepth, introduce axiom/sorry/admit, change accepted F1–F9/F10E or pinned Lean/Mathlib, publish to main or upstream, or infer spectral/determinant sign from symmetry alone.

## Reusable historical signal

- Source exact F1–F9 and F10E successes preserved via public gamma/Clifford source lemmas, finite algebra and deterministic strictly pinned independent type/axiom audit.
- Earlier F10 Gate1/2/3 [#41266215820](https://github.com/etblink/math/actions/runs/41266215820), [#41266892206](https://github.com/etblink/math/actions/runs/41266892206), [#41267510559](https://github.com/etblink/math/actions/runs/41267510559), F10D parser [#41268424166](https://github.com/etblink/math/actions/runs/41268424166) are red and unqualified. Do not revive private `gammaInt` unfolding or legacy `import all`.
- F10E Gate1 [#41269330982](https://github.com/etblink/math/actions/runs/41269330982) was red only for deprecated `if_neg`; F10E Gate2 [#41270021638](https://github.com/etblink/math/actions/runs/41270021638) accepted all four exact source gamma trace theorems using modern `ite_eq_right`.

## Future scope

If F10F passes, the source has positive quadratic, symmetric gamma, trace zero, and det magnitude. This supplies the **inputs** for a real spectral theorem and a characteristic multiplicity proof; it is not itself proof of `det Γ(v) = +Q(v)^8`. Genuine source Spin9 orientation, paired SO48, Spin48 lift/cover, Fock action and BFSS physical spectral existence remain OPEN.
