# Project Lead — V9F Gate 1 ACCEPTED: full source-native skew nine-index coordinate-plane spanning

**Research date:** 2026-10-31 PDT; workflow completed 2026-10-31T08:50:35Z. **Disposition:** `ACCEPTED_ONE_SKEW_COORDINATE_SPANNING_ROOT__ARBITRARY_BRACKET_PRESERVATION_PENDING`.

## Exact independent strict qualification

- [V9F Gate 1 #41185591390](https://github.com/etblink/math/actions/runs/41185591390), attempt **1**, terminal **completed/success** on exact tested commit **`da0a29d1b3a1d29e6a5c293e0680f1a49495098d`**, job **`124491758834`** completed/success.
- Qualified source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SkewCoordinatePlaneSpanningProbe.lean`, exact Git blob **`626124eaa4635f64223b48bd6b986a367dc9b40e`**.
- Exact original paired-Fock gamma/label source pins and accepted native V9E antisymmetric expansion ancestor; pinned Lean **`leanprover/lean4:v4.34.1`** and Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**: pin preflight **PASS**. Dependency restore and exact ancestor compilation **PASS** (`Build completed successfully (8981 jobs)` counts jobs, *not theorem roots*).
- Fresh warnings-as-errors source compiler, generated `.olean` and `#print axioms` **PASS**. Independent fresh Lean import, exact theorem-type `example`, `#check`, and `#print axioms` **PASS**, marker **`K1D18V9F_EXACT_SKEW_PLANE_SPANNING_AXIOMS_PASS`**.
- Declaration dependencies only **`[propext, Classical.choice, Quot.sound]`**, no `sorryAx`, `sorry`, `admit`, custom axiom, relaxed linter or proof-limit increase.
- [Preserved compiler/type/axiom artifact #13036953393](https://github.com/etblink/math/actions/runs/41185591390/artifacts/13036953393), `bfss-v9f-original-paired-skew-coordinate-plane-spanning-da0a29d1b3a1d29e6a5c293e0680f1a49495098d-1`, ZIP SHA256 **`627ae6e36d38ef76aee6ef6b462dcba0d8b01705a01f759b525d56c0fdad8e56`**, 986 bytes.

## Exact accepted root and its boundary

```lean
theorem coordinateSkewMatrix9_plane_spanning
    (A : Matrix SpaceIndex SpaceIndex ℝ)
    (hA : A.transpose = -A) :
    A = (1 / 2 : ℝ) •
      (∑ r : SpaceIndex, ∑ s : SpaceIndex,
        (A r s) • coordinatePlane9 r s)
```

This proves a full finite *spanning/decomposition* by native source `F_rs` planes for **every skew** real 9×9 source matrix, with exact 1/2 normalization over all **ordered pairs** and no imposed pairwise distinctness, basis-order guess or external Lie hypothesis. The proof specializes V9E's accepted `∑A_rs F_rs=A-Aᵀ` under `Aᵀ=-A` and verifies scalar arithmetic per native matrix entry. It does *not* show preservation of arbitrary commutators and does *not* construct a `LieHom`.

**Root ledger:** V8A–V9E **57** qualified source-exact algebraic roots; **V9F +1 = 58**.

## Next steps and research controls

**V9G:** formalize the coefficient-linear extension interface needed for bracket preservation, using the accepted native V9F spanning certificate, exact V8W input and V8R original-paired output generator four-index brackets, and accepted V9B generator agreement. First independently qualify real bracket bilinearity/finite-sum transport at the exact matrix types; avoid assuming generator identities alone imply arbitrary bracket preservation. Then prove a bounded bracket preservation theorem for one generator against arbitrary skew input, followed by arbitrary skew against skew, tracking the two one-half factors. New obligations must have small typed Lean tests, warning-as-error strict gates, and permitted declaration-level axiom results only.

**Unproved:** source-native arbitrary bracket law `ρ([A,B])=[ρ(A),ρ(B)]` on skew `A,B`; typed `so(9)→so(48)` Lie homomorphism; global Spin(9) lift and Fock action; BFSS spectral/physical existence. Keep these separate from 58 accepted algebraic results.

Preserve all prior negative knowledge including V8Y Gate1/2 and V9A Gate1–3 reds. No mutation of accepted sources, frozen FCP, `main` or mathcommunity upstream; no external PR absent owner authorization. This is an acceptance audit, not an extra Lean root.
