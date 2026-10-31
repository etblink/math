# Project Lead — V9N Gate 1 ACCEPTED: exact direct native skew commutator equality

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T15:46:58Z. **Disposition:** `ACCEPTED_ONE_EXACT_NATIVE_SKEW_COMMUTATOR_EQUALITY_ROOT__SKEW_CARRIER_CLOSURE_NEXT`.

## Immutable strict qualification

- [V9N Gate 1 #41215787754](https://github.com/etblink/math/actions/runs/41215787754), attempt 1, completed/**success**, exact tested SHA **`571e1e9a6281115d3799ae8beb449279a0fc08d7`**, job **`124579901467`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NativeSkewCommutatorEqualityProbe.lean`, exact Git blob **`ca26ae3f9942eb8d3ad639e77356a7df3c41456f`**.
- Exact original paired-Fock 48-real gamma and label source SHA pins, pinned Lean **`v4.34.1`**, Mathlib SHA **`d13f23b723b8a846827a245b89c10fc7d3f11612`**, accepted V9M arbitrary skew bracket-defect zero, typed source-native real LinearMap ancestors: preflight **PASS**, dependency restore **PASS**, accepted ancestor compilation **PASS**. `Build completed successfully (8989 jobs)` is build workload, **not theorem roots**.
- Fresh `lake env lean -DwarningAsError=true`, emitted source .olean and source-level `#print axioms` **PASS**.
- Independent imported exact theorem-type `example`, `#check` and `#print axioms` **PASS**, marker **`K1D18V9N_EXACT_SKEW_COMMUTATOR_EQUALITY_AXIOMS_PASS`**.
- Actual declaration axiom dependencies **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, additional axioms, disabled lint or raised proof limits.
- [Preserved compiler, independent theorem and axiom artifact #13047868058](https://github.com/etblink/math/actions/runs/41215787754/artifacts/13047868058), name `bfss-v9n-original-paired-native-skew-commutator-equality-571e1e9a6281115d3799ae8beb449279a0fc08d7-1`, ZIP SHA256 **`a17fe6eb32958fd602524e5043723bfaac6b221016fe3ba5e46d85fbfa800569`**, size 1003 bytes.

## Qualified theorem

```lean
theorem coordinateToPairedLinearMap_skew_commutator
    (A B : Matrix SpaceIndex SpaceIndex ℝ)
    (hA : A.transpose = -A)
    (hB : B.transpose = -B) :
    coordinateToPairedLinearMap (A * B - B * A) =
      coordinateToPairedLinearMap A * coordinateToPairedLinearMap B -
      coordinateToPairedLinearMap B * coordinateToPairedLinearMap A
```
The theorem directly extracts the source-exact commutator identity from accepted V9M's zero-defect result using typed `change` and `sub_eq_zero.mp`. It is a **real 9×9 skew input to original Fock-paired real 48×48 matrix theorem**; it does not assert a LieHom structure or a global group action.

**Ledger:** V8A–V9M **68** qualified roots, V9N **+1 = 69** qualified algebraic theorem roots.

## Typed next steps, preserving the logical boundary

The matrix bracket-preservation identity is **complete** for skew inputs; now verify the *carrier and structure*, rather than counting the same equality as a full Lie homomorphism. Next bounded V9O: prove the native input skew carrier is closed under the actual matrix commutator `A*B-B*A` using `Matrix.transpose_sub`, `Matrix.transpose_mul`, source skew assumptions and exact negation/subtraction laws, with a separate strict source theorem/axiom gate. The original output is skew for all inputs by accepted V9C, but packaging the real input and paired 48-real output skew carriers as Lie algebras and creating their typed `LieHom` remains a future obligation.

Only once source, target, additive/scalar, bracket, and subtype-to-matrix bridge obligations are discharged can a genuine Lie algebra homomorphism be accepted. Do not assume an associative algebra map (unproved for arbitrary matrices), a color-major basis change, or any `Spin(9)` group integration. Original Clifford/Fock implementation, covering/surjectivity and BFSS spectral/physical claims remain separate and unproved. Preserve V8Y, V9A, V9J Gate1, V9K Gate1 and V9L Gate1 red histories and all acceptance records. Frozen FCP, `main`, and mathcommunity upstream unchanged; no external upstream PR without owner authorization. This documentary acceptance does not add a further root.
