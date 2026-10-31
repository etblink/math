# Project Lead — V9C Gate 1 ACCEPTED: arbitrary nine-index matrix input maps to original paired 48-real skew output

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T08:17:02Z. **Disposition:** `ACCEPTED_ONE_ALL_INPUT_ORIGINAL_PAIRED_IMAGE_SKEW_ROOT__ARBITRARY_SKEW_BRACKET_OPEN`.

## Strict immutable certificate

- [V9C Gate 1 #41183289839](https://github.com/etblink/math/actions/runs/41183289839), attempt 1, terminal **completed/success** on exact tested SHA **`c9d1678fef8daf20f8a6e5edf141eb994204a8b8`**, job **`124484941304`** completed/success.
- Qualified exact Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LinearMapImageSkewProbe.lean`, Git blob **`d8a75242a843db8b2cb26e62da0f10df9f814ea9`**.
- Original source paired-Fock gamma and 48-real label pins, accepted V8O normalized skew output, V9B exact generator agreement and ancestors, `leanprover/lean4:v4.34.1` and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: **PASS** source preflight, dependency restore and ancestor build.
- Fresh exact source `lake env lean -DwarningAsError=true` and emitted .olean, declaration `#print axioms` **PASS**. `Build completed successfully (8978 jobs)` counts jobs, **not** theorem roots.
- Independent fresh Lean import and exact theorem-type `example`, `#check`, declaration `#print axioms` **PASS** with marker **`K1D18V9C_ALL_INPUT_PAIRED48_IMAGE_SKEW_AXIOMS_PASS`**.
- Actual axiom dependencies **`[propext, Classical.choice, Quot.sound]`**; **no `sorryAx`**, `sorry`, `admit`, custom axiom, linter suppression or proof-limit increase.
- [Evidence artifact #13036465951](https://github.com/etblink/math/actions/runs/41183289839/artifacts/13036465951), name `bfss-v9c-original-paired-linear-map-image-skew-c9d1678fef8daf20f8a6e5edf141eb994204a8b8-1`, ZIP SHA256 **`56a979650f0eb2ef3c8ea7e4e5799f561e4ab5c0c9704072728d2ab6e43b3c7f`**, 954 bytes.

## Exactly qualified root and correct type boundaries

```lean
theorem coordinateToPairedLinearMap_image_transpose
    (A : Matrix SpaceIndex SpaceIndex ℝ) :
    (coordinateToPairedLinearMap A).transpose =
      -(coordinateToPairedLinearMap A)
```

For **every** real native 9×9 input (not just skew input), `ρ(A)` is a skew matrix on original source Fock-paired 48-real label carrier `Source48Label`. The proof unfolds exact source coefficient definition, applies the pinned Mathlib transpose of real scalar multiples and finite sums, and the previously accepted original `normalizedPairedPlane_transpose`. No output reindexing, color-major substitution or unverified source algebra.

V9B establishes `ρ(F_rs)=H_rs` for every coordinate generator. The matrix's skew **output** does not imply `ρ` preserves the commutator for arbitrary **input skew matrices**. The source-native arbitrary input nine-index algebra and correct bracket equality remain distinct obligations.

**Ledger:** V8A–V9B **53** qualified exact algebraic theorem roots; **V9C +1 = 54**.

## Next mathematical gate

**V9D** should establish *source-native skew input* structural lemmas on `Matrix SpaceIndex SpaceIndex ℝ`: from the explicit hypothesis `A.transpose=-A`, prove `A s r=-A r s` on all native 9 labels, then construct a verified coefficient decomposition of skew `A` as a finite sum of antisymmetric coordinate planes. The correct ordered-pair normalization is
```text
A = (1/2) • ∑ r, ∑ s, (A r s) • coordinatePlane9 r s
```
for skew `A`; this requires an actual finite matrix-unit spanning proof and should not be asserted based on generator brackets. Check pinned Mathlib `Matrix.single` / sum lemmas and `Finset` selectors first. Distinguish the first typed lemma from the full decomposition if it requires more than a bounded strict proof.

After a skew spanning certificate, combine accepted V8W input and V8R original paired output universal generator bracket identities, source-linear extension, exact ordered-pair normalization and bilinearity to verify `ρ([A,B])=[ρ(A),ρ(B)]` **for arbitrary skew input**, before constructing a true Lie algebra homomorphism. Global Spin(9) integration and BFSS physical claims remain unproved.

Preserve strict root counting and prior reds, including V8Y Gate1/2 scalar errors, V9A Gate1 nested sums, Gate2 stale CI preflight and Gate3 unused simp. No changes to accepted Lean source Git blobs, frozen FCP, `main`, or mathcommunity upstream; no upstream PR without owner authorization. This record is documentary, not another theorem.
