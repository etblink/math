# Project Lead — V9H Gate 1 ACCEPTED: exact source-native generator commutator preservation

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T11:55:29Z. **Disposition:** `ACCEPTED_ONE_EXACT_GENERATOR_COMMUTATOR_ROOT__ARBITRARY_SKEW_BRACKET_PENDING`.

## Strict immutable qualification

- [V9H Gate 1 #41198262803](https://github.com/etblink/math/actions/runs/41198262803), attempt **1**, terminal **completed/success**, exact tested SHA **`72db30ae582956215a3981d917813f22bdcb5b7f`**, job **`124528727352`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9GeneratorCommutatorPreservationProbe.lean`, Git blob **`c486ca5e6606fb69038cffa073c68791580b496e`**.
- Exact original paired-Fock 48-real label/gamma pins, accepted V8R output commutator, V8W nine-index input commutator, V9G four-index RHS transport, V9B generator agreement, V9F source-native skew spanning and earlier typed real map ancestors, Lean **`leanprover/lean4:v4.34.1`**, Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**: source-hash preflight **PASS**, pinned dependency restore **PASS**.
- Accepted ancestors compiled **PASS**. `Build completed successfully (8983 jobs)` is the dependency build workload and **not** the theorem root count.
- Fresh source `lake env lean -DwarningAsError=true` and emitted `.olean`, declaration-level `#print axioms` **PASS**.
- Independent fresh imported exact theorem-type `example`, `#check` and `#print axioms` **PASS**, marker **`K1D18V9H_EXACT_GENERATOR_COMMUTATOR_AXIOMS_PASS`**.
- Exact declaration axiom dependencies **`[propext, Classical.choice, Quot.sound]`**, no `sorryAx`, `sorry`, `admit`, custom axioms, linter suppression or proof-limit increase.
- [Preserved compiler and independent axiom artifact #13041856782](https://github.com/etblink/math/actions/runs/41198262803/artifacts/13041856782), name `bfss-v9h-original-paired-generator-commutator-preservation-72db30ae582956215a3981d917813f22bdcb5b7f-1`, ZIP SHA256 **`df67f2cc8a45accd6ffd3fde59298564f25ff572f05867a2c54166f3cd1ed8ce`**, 999 bytes.

## Exactly qualified root

```lean
theorem coordinateToPairedLinearMap_generator_commutator
    (r s t u : SpaceIndex) :
    coordinateToPairedLinearMap
      (coordinatePlane9 r s * coordinatePlane9 t u -
        coordinatePlane9 t u * coordinatePlane9 r s) =
      coordinateToPairedLinearMap (coordinatePlane9 r s) *
        coordinateToPairedLinearMap (coordinatePlane9 t u) -
      coordinateToPairedLinearMap (coordinatePlane9 t u) *
        coordinateToPairedLinearMap (coordinatePlane9 r s)
```

All four source-native nine spatial indices range independently, including diagonal/repeated label cases. The actual matrix product difference is used on native `Matrix SpaceIndex SpaceIndex ℝ` and original paired `Matrix Source48Label Source48Label ℝ`, not an assumed abstract bracket, external Lie homomorphism or a color-major basis replacement. Proof rewrites with the separately accepted V8W source generator bracket, V9G transport, V9B generator values and V8R original paired 48-real bracket.

**Ledger:** V8A–V9G **60** independently qualified algebraic theorem roots, **V9H +1 = 61**.

## Next priority — exact bilinear extension, not premature LieHom

Define a *bracket preservation defect* for arbitrary native input matrices `A B`:
```
D(A,B) := coordinateToPairedLinearMap (A*B-B*A) -
  (coordinateToPairedLinearMap A * coordinateToPairedLinearMap B -
   coordinateToPairedLinearMap B * coordinateToPairedLinearMap A)
```
It is a 48-real matrix, and `D(F_rs,F_tu)=0` now follows from V9H. The next bounded V9I work should prove **additivity in each argument** using exact matrix `add_mul`, `mul_add`, `map_add`, `map_sub`, `abel` and typed source carriers, with warning-as-error source check and independent axiom audit. Subsequent V9J should separately prove scalar homogeneity in each argument (requiring correct matrix scalar multiplication side laws). Only then use V9F exact skew source spanning to establish `D(A,B)=0` for **all skew A,B**. Do not count a bilinear defect definition as a theorem root.

**Still unproved:** bracket preservation for arbitrary skew A and B, typed `so(9)→so(48)` Lie homomorphism, global Spin(9) integration on original paired Fock representation, and BFSS physical/spectral existence. Preserve errors and negative knowledge from earlier V8Y and V9A Gates 1–3, source-hash pins and the pair-order boundary. Frozen FCP, `main`, and mathcommunity upstream untouched, no external PR without owner authorization.

This provenance record is documentary, not another theorem root.
