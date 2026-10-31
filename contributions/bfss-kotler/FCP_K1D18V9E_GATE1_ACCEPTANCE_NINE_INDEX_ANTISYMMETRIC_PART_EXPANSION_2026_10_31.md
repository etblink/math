# Project Lead — V9E Gate 1 ACCEPTED: full source-native nine-index antisymmetric-part coordinate-plane expansion

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T08:39:02Z. **Disposition:** `ACCEPTED_ONE_NATIVE_ANTISYMMETRIC_PART_EXPANSION_ROOT__HALF_SKEW_SPANNING_NEXT`.

## Exact strict qualification certificate

- [V9E strict Gate 1 #41184833441](https://github.com/etblink/math/actions/runs/41184833441), attempt **1**, terminal **completed/success** on exact tested SHA **`5eeb5db5d1cf6d89ab1295be774a7f9971947ea2`**, job **`124489551809`** completed/success.
- Exact source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9AntisymmetricPartExpansionProbe.lean`, qualified Git blob **`133ae2ada5935a5c1d66bbfd46f225c41173dfce`**.
- Original source 48-real Fock-paired label and gamma pins, accepted V8T native coordinate planes and V9D matrix-unit ancestry, `leanprover/lean4:v4.34.1`, pinned Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**: exact source preflight **PASS**. Dependency restoration and accepted ancestor compilation **PASS**; `Build completed successfully (8980 jobs)` is workload, **not** a count of theorem roots.
- Fresh V9E source compilation under `-DwarningAsError=true`, output .olean and source `#print axioms` **PASS**.
- Independent fresh Lean import, source-exact theorem-type `example`, `#check`, `#print axioms` **PASS**, marker **`K1D18V9E_NATIVE_ANTISYMMETRIC_PART_EXPANSION_AXIOMS_PASS`**.
- Declaration-level axiom dependencies only **`[propext, Classical.choice, Quot.sound]`**, without `sorryAx`, `sorry`, `admit`, custom axioms, weakened linter or proof-limit increase.
- [Preserved evidence artifact #13037025771](https://github.com/etblink/math/actions/runs/41184833441/artifacts/13037025771), `bfss-v9e-original-paired-antisymmetric-part-expansion-5eeb5db5d1cf6d89ab1295be774a7f9971947ea2-1`, ZIP SHA256 **`fa932f32132c075b8e72e2cfc4c5a3a6e897c5012629e5254b92e4bb08e41fa1`**, size 982 bytes.

## Exactly accepted theorem and scope

```lean
theorem coordinateMatrix9_antisymmetric_part_expansion
    (A : Matrix SpaceIndex SpaceIndex ℝ) :
    (∑ r : SpaceIndex, ∑ s : SpaceIndex,
       (A r s) • coordinatePlane9 r s) = A - A.transpose
```
The theorem holds for **all** native real 9×9 matrices, without skew assumptions or pairwise distinctness, and retains the exact Fock-source distinction: `SpaceIndex` for the input, `Source48Label` for the separately constructed output. It uses the accepted source-native decomposition of V9D, Mathlib pinned transpose single and finite sum lemmas, and accepted V8T's `F_rs=E_rs-E_sr` bridge. No basis permutation or presumed Lie bracket preservation was used.

**Root ledger:** V8A–V9D **56** accepted algebraic roots. V9E adds **one** independently qualified theorem root: **57 total**.

## Next bounded V9F step

Use the accepted V9E identity and hypothesis `hA : A.transpose=-A` to prove, in the *same native matrix type*:
```lean
A = (1/2 : ℝ) •
      (∑ r : SpaceIndex, ∑ s : SpaceIndex,
        (A r s) • coordinatePlane9 r s)
```
This is full ordered-pair finite spanning on the skew `so(9)` carrier; diagonal pairs vanish by existing coordinatePlane9_self and scalar normalization is exact. Prefer `rw [coordinateMatrix9_antisymmetric_part_expansion A, hA]`, followed by a direct componentwise field arithmetic identity under `ext i j`, rather than inventing a new spanning theorem or raising limits. Require one strict new theorem root and independent axiom report.

Beyond V9F, the original paired output V8R and native input V8W generator four-index brackets must be extended to **arbitrary skew input matrices** by finite sums and bilinear bracket, with exact 1/2 normalization. Only after that proof should a true `so(9)→so(48)` Lie homomorphism be introduced. No global Spin(9) integration, spectral BFSS existence or physical conclusion is established by the accepted V9E identity.

Preserve V8Y Gate1/2 and V9A Gate1–3 reds as negative knowledge. No alteration to source-exact ancestor hashes, frozen FCP, main, or mathcommunity upstream, and no external PR absent owner authorization. This is documentary provenance, not a new Lean theorem.
