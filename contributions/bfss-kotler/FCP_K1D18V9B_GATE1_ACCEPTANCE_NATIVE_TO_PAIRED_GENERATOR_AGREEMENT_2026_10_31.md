# Project Lead — V9B Gate 1 ACCEPTED: native so(9) coordinate generator agreement on original paired 48-real labels

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T07:52:16Z. **Disposition:** `ACCEPTED_ONE_SOURCE_EXACT_GENERATOR_AGREEMENT_ROOT__ARBITRARY_SKEW_LIE_HOM_PENDING`.

## Exact strict evidence

- [V9B strict Gate 1 #41181704313](https://github.com/etblink/math/actions/runs/41181704313), attempt **1**, terminal **completed/success**, exact tested commit **`76f03e3966eb5ac8d902f4606b5b85f99198c5f0`**, job **`124480267250`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LinearMapGeneratorAgreementProbe.lean`, Git blob **`549c1d332a2b9de322fad13abc2ec23ec42c966b`**.
- Exact source 48-real paired-label/Fock gamma pins, accepted V8T matrix-unit bridge, V8O source normalized-plane skew identity, V9A matrix-unit evaluation and all earlier ancestors; Lean **`leanprover/lean4:v4.34.1`**, pinned Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**; SHA preflight **PASS**.
- Pinned dependency restore **PASS**; exact accepted ancestors compiled **PASS**. `Build completed successfully (8977 jobs)` is build workload, **not** number of theorems.
- Fresh V9B compilation `-DwarningAsError=true`, emitted `.olean` source and `#print axioms` **PASS**.
- Independent fresh Lean import with exact theorem-type `example`, `#check`, declaration-level `#print axioms` **PASS**, marker **`K1D18V9B_NATIVE_TO_PAIRED_GENERATOR_AGREEMENT_AXIOMS_PASS`**.
- Actual axioms **`[propext, Classical.choice, Quot.sound]`** only; no `sorryAx`, `sorry`, `admit`, custom axiom, weakened linter or raised proof limits.
- [Preserved compiler and independent axiom artifact #13035786274](https://github.com/etblink/math/actions/runs/41181704313/artifacts/13035786274), `bfss-v9b-original-paired-linear-map-generator-agreement-76f03e3966eb5ac8d902f4606b5b85f99198c5f0-1`, SHA256 **`2a1f2ce791800744262fd76654cb019404ffdd25768572dbb1d5245682b872c7`**, size **946 bytes**.

## Exact qualified mathematical root

```lean
theorem coordinateToPairedLinearMap_coordinatePlane
    (r s : SpaceIndex) :
    coordinateToPairedLinearMap (coordinatePlane9 r s) =
      normalizedPairedPlane r s
```
The proof uses accepted source-exact `coordinatePlane9_eq_single_sub_single`, actual typed `LinearMap.map_sub`, V9A exact matrix-unit evaluations `ρ(E_rs)=(1/2)•H_rs` and `ρ(E_sr)=(1/2)•H_sr`, original paired `normalizedPairedPlane_swap` `H_sr=-H_rs`, and scalar arithmetic. Valid for **all spatial indices**, including r=s, no r≠s assumption or reindexing.

The input carrier is source-native `Matrix SpaceIndex SpaceIndex ℝ` (9 indices). The output is the original 48-real Fock-paired `Matrix Source48Label Source48Label ℝ`. The output matches source's accepted normalized 48-real bracket constants (V8R), and the input matches V8W's real `so(9)` generator bracket constants, but source-native *arbitrary skew-matrix decomposition and bracket preservation are not yet proved*.

**Accepted ledger:** V8A–V9A **52** theorem roots; V9B **one** additional source-exact root; **53 qualified algebraic theorem roots**.

## Highest-value bounded successor

**V9C:** prove `(coordinateToPairedLinearMap A).transpose = -(coordinateToPairedLinearMap A)` for **all** native real 9×9 matrices `A`, by exact finite coefficient definition plus previously accepted `normalizedPairedPlane_transpose r s`. This is a well-defined stronger property (since the map's image consists of linear combinations of output skew generators) and would establish that the *whole image*, not only generator images, lies in original paired 48-real skew carriers. Prove using source-exact transpose/pointwise scalar and finite-sum lemmas, no guessed `Matrix.IsSkew` API. Qualify by strict compiler and an independently typed theorem/axiom audit.

After V9C: source-native skew input decomposition as a coefficient sum of `F_rs` with `1/2` ordered-pair normalization, then arbitrary bracket preservation for skew 9×9 inputs using V8W, V8R, full bilinearity and finite sums. Only after that build true `so(9)→so(48)` `LieHom`; global Spin(9) group lift, Fock action, BFSS physical conclusions remain unproved and separate.

Negative knowledge: preserve V9A Gate 1 unresolved nested selector, Gate 2 stale preflight content assertion, Gate 3 unused `Matrix.single_apply`; Gate 4 exact successful repair. Preserve V8Y Gates 1/2 red normalization history and Gate3 success. No changes to accepted source hashes, frozen FCP, `main` or mathcommunity upstream; no upstream PR absent owner authorization. Evidence before green counts.

This record does not itself qualify another Lean theorem.
