# HARDY-G5 R2 red checkpoint — typed operator evaluation

Date:2026-11-14 Pacific. RED_UNQUALIFIED.

[Strict #43647718971](https://github.com/etblink/math/actions/runs/43647718971), attempt1, job #132609101629, tested `e76aff10b5ebc16706ac27dec3affcc9d5542e7c`: failure verified. Preflight/toolchain PASS; cold source FAIL; fresh strict source and consumer NOT REACHED.

## Causal result

R1 binder scope errors are gone, and no recursion error is reported. Source78:2 now gives a concrete type mismatch. After the submitted simp-only list, h has SUM ((V*T)v+(T*V)v)=0 v, whereas the target is SUM (V(Tv)+T(Vv))=vector0. The assistant omitted the current operator-composition and zero evaluation rewrites. This is not a failure of the CAR coefficient calculation.

Five source roots, including summed operator cancellation, report only propext/Classical.choice/Quot.sound; final vector-application root has sorryAx. No whole-module or consumer qualification. Preserve scope repair and this new typed boundary separately.

| Binding | Value |
| --- | --- |
| Source blob | 8c9e3e65831b0eca04c943e9a379bd7019c5ef94 |
| Consumer blob | 5e2257d149462ca507c1f9ccde2231846b4bbe65 |
| Workflow blob | 6c7ab054c9c4915f88116294523f6b3c1cf2d4d5 |
| Reviewed OAI baseline | f51357761243008201f97d9e0ef0cbefa87d0b06 |
| Manifest paths / SHA-256 | 150 / 35955aea0ea212749ff3724eef73ef7ba57858dcff7fb32c96c3ba1aac4bf3cf |
| Artifact ID / bytes | 14135496115 / 17281 |
| Artifact ZIP SHA-256 | sha256:bfd179169d3939bc80659753c5a542221dce44ac9cdb7a3e29f0dfe581c6f5d1 |

API digest matches upload log; ZIP not independently rehashed. Administrative #43647718965 GREEN, separate. Lean4.34.1/Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612.

## Recovery architecture

The evaluation boundary has failed twice (R1 recursion after malformed declarations, R2 explicit mismatch). Isolate a generic Mathlib-only finite continuous-linear-map anticommutator evaluation lemma. Current pinned CLM Basic implements IsMulApplyEqComp; current rewrite is mul_apply_eq_comp. Root zero_apply is current; protected ContinuousLinearMap.mul_apply/zero_apply/sum_apply aliases are deprecated and must not be used. Strict-check helper before expensive model build, then instantiate it in the final original Fock theorem. No public statement or native consumer change; no budget increase or model unfolding. Failed helper => stop same-boundary permutations and preserve minimal typed output.
