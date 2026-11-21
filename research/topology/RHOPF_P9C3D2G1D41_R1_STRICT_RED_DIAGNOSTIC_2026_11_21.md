# RHOPF-P9C3D2G1D41 R1 — original-source strict RED

**Date:** 2026-11-21 (Pacific). **Disposition:** RED/UNQUALIFIED. Branch: `integration/bfss-unified-research-20261108`.

- Original run [#44890187470](https://github.com/etblink/math/actions/runs/44890187470), attempt 1, failed at exact tested commit `31c764e99b219e11a3ab748c0e1f3b74197d2bc4`, original job `136804108979`.
- Original artifact [#14702031984](https://github.com/etblink/math/actions/runs/44890187470/artifacts/14702031984) independently downloaded and hashed: `60611cf1d71ef3ef713a19f36acdb46a40dceb038cb385592bdc9e0a77963b50` SHA256, matching GitHub upload metadata. Original ZIP contains five files, embedded tested SHA equals `31c764e99b219e11a3ab748c0e1f3b74197d2bc4`. The original ZIP is preserved in GitHub Actions; it is not rewritten.
- Exact frozen original source preflight and independent integer fixture PASS. Lean 4.34.1/Mathlib pins and 9,088 dependency jobs PASS.
- Native Lean compilation FAIL: line 48 invalid field `InnerProductSpace.Core.toPreInnerProductSpaceCore` (not in pinned Mathlib). Line 67 `rfl` failed when binding packaged inner to source Hermitian, likely downstream from the failed constructor.
- The three native reports contain `sorryAx` and are **not** qualified. Independent imported consumer SKIPPED.
- For R2, fix **only** the invalid `InnerProductSpace.Core` → `PreInnerProductSpace.Core` conversion by using pinned Mathlib's already-defined typeclass instance under the local D37 core; keep original `rfl` for an unbiased retry. No changes to theorem statements, D37–D40 proofs, original Gamma9, modules or global typeclass scope. Re-pin the exact new source hash, and correct the workflow display name.
- No acceptance until native and independent warning-as-error compilation, six clean axiom reports, original artifact digest and tested-commit validation have all passed. Preserve R1 RED as negative evidence.
