# Project Lead — V8M Gate 1 ACCEPTED: universal original-paired Spin(9) four-index commutator

**Research-local date:** 2026-10-30 PDT; GitHub strict run completed 2026-10-31T03:43:10Z. **Disposition:** `ACCEPTED_ONE_EXACT_UNIVERSAL_MATRIX_BRACKET_ROOT__NOT_A_GROUP_LIFT`.

## Immutable proof qualification

- [GitHub Actions V8M Gate 1 #41165011808](https://github.com/etblink/math/actions/runs/41165011808), attempt **1**, **completed/success**, exact tested commit **`24794d8a9f7e8792c849952b53714377379e29e1`**, job **`124430570329`** **completed/success**.
- Exact qualified Lean source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9UniversalFourIndexBracketProbe.lean`, Git blob **`b4b302b306e543194789d1af450d3658d93e6f09`**.
- Original Fock-paired label reindex equivalence `pairedColorSpinEquiv`, gamma matrices, exact toolchain `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, original `K` / zero-diagonal `L`, accepted V8J/K/L source Git blobs all verified by workflow **PASS**.
- Pinned dependencies and accepted V8J/V8K/V8L ancestor `lake build` **PASS**, log `Build completed successfully (8962 jobs)`; **8962 is build dependency work count**, not newly accepted declarations.
- Fresh exact V8M module `lake env lean -DwarningAsError=true` source compilation **PASS** and emitted actual source `.olean`; one source declaration-level `#print axioms` record.
- Separate Lean `example` re-stating the **full all-indices, original 48-real matrix theorem type**, `#check`, and `#print axioms` under warnings-as-errors **PASS**. Terminal marker **`K1D18V8M_EXACT_ONE_ORIGINAL_SOURCE_UNIVERSAL_FOUR_INDEX_ROOT_AXIOMS_PASS`**.
- The named source declaration uses only `[propext, Classical.choice, Quot.sound]`; no `sorryAx`, no proof-limit changes.
- [Retained compiler and separate axiom artifact #13029182352](https://github.com/etblink/math/actions/runs/41165011808/artifacts/13029182352), exact name `bfss-v8m-original-paired-universal-four-index-24794d8a9f7e8792c849952b53714377379e29e1-1`, ZIP SHA256 **`d5dd621620cde713f7cf7ba7bf87927b61f0186c37e0cc040f94bcf09b883a0c`**, 962 bytes.

## Accepted theorem and exact mathematical boundary

```lean
FCP.BFSSPairedSpin9Plane.zeroDiagonalFourIndex_universal_bracket
    (r s t u : SpaceIndex) :
    zeroDiagonalPairedPlane r s * zeroDiagonalPairedPlane t u -
      zeroDiagonalPairedPlane t u * zeroDiagonalPairedPlane r s =
    zeroDiagonalFourIndexRHS r s t u
```

The source-defined `zeroDiagonalFourIndexRHS` is the explicit sum
```text
(if s=u then L_rt+L_rt else 0)
 - (if s=t then L_ru+L_ru else 0)
 + (if r=t then L_su+L_su else 0)
 - (if r=u then L_st+L_st else 0).
```
Therefore `[L_rs,L_tu] = 2(δ_su L_rt - δ_st L_ru + δ_rt L_su - δ_ru L_st)` for **all** `r,s,t,u : SpaceIndex`, including equality and diagonal cases. Here `L_rs=zeroDiagonalPairedPlane r s` is typed `Matrix Source48Label Source48Label ℝ` on the **native original 48 real Fock-paired labels**. Raw `K_rr=-I` is not zero; only the explicitly accepted V8H `L_rr=0` supports an all-index so(9) basis convention.

The proof does not establish a linear/bilinear extension from the 9×9 skew matrix Lie algebra to the 48×48 algebra, a Lie algebra homomorphism with correct `-1/2` normalization, group integration, global Spin(9)→Spin(48) lift, original Fock-space action, gauge covariance, topology, or BFSS spectrum. All remain independent open proof obligations.

## Acceptance ledger and lessons

- V8A 2, V8B 1, V8C 1, V8D 1, V8E 1, V8F 1, V8G 1, V8H 3, V8I 5, V8J 4, V8K 4, V8L 5, V8M **1** = **30 source-exact newly accepted algebraic Lean declarations**.
- Each previous strict run and red-run negative knowledge remains preserved; V8J Gate 1 RED `#41161824014` came from unreachable trailing `abel`, V8L Gate 1 RED `#41163775125` came from three unused `simp` hypotheses; both recovered by removing only redundant tactics without relaxing the linter.
- Next bounded bridge: prove that each source-native zero-diagonal `L_rs` is skew under `Matrix.transpose` for all indices. Reuse accepted V8A off-diagonal skew theorem + V8H diagonal-zero and `of_ne`. This certifies an `so(48)`-valued family at the matrix level, then explore the normalized 9×9 Lie algebra generator mapping separately.
- **Governance:** do not alter accepted source blobs, frozen FCP, `main`, or upstream mathcommunity; do not publish upstream PRs without owner authorization. This documentary acceptance is not a new Lean qualification.
