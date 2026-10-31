# Project Lead — V9I Gate 1 ACCEPTED: exact bilateral additivity of native bracket-preservation defect

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T12:08:49Z. **Disposition:** `ACCEPTED_TWO_TYPED_BRACKET_DEFECT_ADDITIVITY_ROOTS__SCALAR_HOMOGENEITY_PENDING`.

## Immutable strict evidence

- [V9I Gate 1 #41199066109](https://github.com/etblink/math/actions/runs/41199066109), attempt **1**, terminal **completed/success**, exact tested SHA **`0a7e9469974d6b6aec07792af0ad26b57e1521f9`**, job **`124531076442`** completed/success.
- Qualified Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9BracketDefectAdditivityProbe.lean`, Git blob **`f2f60cb89cd7ec5f844e71e46cb70baf697c9c56`**.
- Exact original paired-Fock gamma and label SHA pins, accepted V9H exact source-native generator commutator, V9F native skew-spanning, V8R and V8W universal source generator brackets, accepted real typed LinearMap ancestors, Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`: exact preflight **PASS**, pinned dependency restore **PASS**.
- Accepted V9H source ancestor compilation **PASS**. `Build completed successfully (8984 jobs)` is dependency build workload, **not** theorem roots.
- Fresh source `lake env lean -DwarningAsError=true`, generated `.olean`, two source `#print axioms` **PASS**.
- Independent imported source-exact `example` for each of two theorem types, two `#check` and two `#print axioms` **PASS**, terminal marker **`K1D18V9I_BILATERAL_BRACKET_DEFECT_ADDITIVITY_AXIOMS_PASS`**.
- Actual axiom dependencies **`[propext, Classical.choice, Quot.sound]`** only; no `sorryAx`, `sorry`, `admit`, additional axioms, disabled lint or raised limits.
- [Preserved compiler and independent axiom artifact #13042002599](https://github.com/etblink/math/actions/runs/41199066109/artifacts/13042002599), `bfss-v9i-original-paired-bracket-defect-additivity-0a7e9469974d6b6aec07792af0ad26b57e1521f9-1`, ZIP SHA256 **`e32232f79a75cd2ebd522e711f9c7adf5d308c5d8499ccb1fcb65704a0a36a3b`**, size **999 bytes**.

## Exactly accepted typed roots

Define **`coordinateToPairedBracketDefect A B`**, with `A,B : Matrix SpaceIndex SpaceIndex ℝ` and result `Matrix Source48Label Source48Label ℝ`, by
```
D(A,B)=ρ(A*B-B*A) - (ρ(A)*ρ(B)-ρ(B)*ρ(A)).
```
**Definition is not an extra theorem root.**

1. `coordinateToPairedBracketDefect_add_left (A B C : Matrix SpaceIndex SpaceIndex ℝ)` proves `D(A+B,C)=D(A,C)+D(B,C)` for all real native 9×9 matrices.
2. `coordinateToPairedBracketDefect_add_right (A B C : Matrix SpaceIndex SpaceIndex ℝ)` proves `D(A,B+C)=D(A,B)+D(A,C)` for all real native 9×9 matrices.

These use exact matrix `add_mul`, `mul_add`, accepted typed `map_add`, `map_sub`, and `abel` on the original 48-real paired output carrier. They establish **biadditivity, not yet ℝ-bilinearity**.

**Root ledger:** V8A–V9H **61** qualified algebraic theorem roots; V9I **+2 = 63**.

## Next bounded V9J — real scalar homogeneity on both arguments

For source-native real `c` and arbitrary matrices, prove
```
D(c • A,B) = c • D(A,B)
D(A,c • B) = c • D(A,B)
```
using exact source matrix scalar-product laws, the V8Z `LinearMap.map_smul` interface, and `smul_sub` on output. Verify pinned Mathlib names/signatures before constructing the strict gate, and check **two distinct Lean theorem types and axiom reports**. No broad theorem-prover timeouts or limitation increases.

After V9J, combine V9F full half-scaled skew input spanning with V9H's exact generator commutator zero-defect to establish `D(A,B)=0` for **arbitrary skew A,B**, with precise finite sums and real scalars. Only after passing this independent strict theorem may one construct a genuine `so(9)→so(48)` typed Lie algebra homomorphism. Global Spin(9) lift and BFSS physical/spectral existence remain unproved.

Preserve earlier negative evidence (V8Y, V9A Gates1–3), all accepted Lean blobs, frozen FCP, `main` and mathcommunity upstream. No unauthorized external PR. This file is documentary rather than a further proof root.
