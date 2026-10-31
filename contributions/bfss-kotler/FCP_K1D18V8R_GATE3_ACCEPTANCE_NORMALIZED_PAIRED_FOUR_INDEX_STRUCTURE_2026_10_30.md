# Project Lead — V8R Gate 3 ACCEPTED: exact normalized all-indices original-paired Spin(9) bracket

**Research-local date:** 2026-10-30 PDT; workflow finished 2026-10-31T05:04:55Z. **Disposition:** `ACCEPTED_2_EXACT_SOURCE_ORIGINAL_NORMALIZED_FOUR_INDEX_ROOTS__LIE_HOMOMORPHISM_STILL_OPEN`.

## Immutable qualification evidence

- [V8R Gate 3 #41170549275](https://github.com/etblink/math/actions/runs/41170549275), attempt **1**, **completed/success**, job **`124447379325`** completed/success, exact tested Git SHA **`46421c2bfe3cdef3849475f507c3afc6af4e83b9`**.
- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9NormalizedFourIndexStructureProbe.lean`, qualified Git blob **`46e02a38f6647458132039bc1f44b0358c9c4f44`**. This is the **repaired** V8R proof, not the rejected Gate 1 or Gate 2 blobs.
- Original 48-real paired-Fock label equiv and gamma data, accepted V8M, V8O, V8Q ancestors, Lean `leanprover/lean4:v4.34.1`, and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` all exact-pin-verified.
- Dependency restoration **PASS**; accepted ancestor compilation **PASS**, log `Build completed successfully (8967 jobs)`. This is the build dependency job count, **not** a theorem count.
- Fresh exact V8R source compilation with `lake env lean -DwarningAsError=true`, source `.olean`, and two source declaration-level `#print axioms` reports **PASS**.
- Independent imported Lean audit with **two** exact theorem-type `example`s, `#check`s, and `#print axioms` **PASS**; terminal marker **`K1D18V8R_TWO_NORMALIZED_FOUR_INDEX_STRUCTURE_ROOTS_AXIOMS_PASS`**.
- Both roots' only axioms: `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, `sorry`, `admit`, new axioms, increased recursion/heartbeat limits or disabled linters.
- [Compiler/audit artifact #13030942951](https://github.com/etblink/math/actions/runs/41170549275/artifacts/13030942951), `bfss-v8r-original-paired-normalized-four-index-structure-46421c2bfe3cdef3849475f507c3afc6af4e83b9-1`, SHA256 **`e357b7a95eb38efd82e706dc9ad353af0a61d9a589f99a6b2496b167e8d5efbd`**, size 1054 bytes.

## Accepted exact theorem roots

Both in `FCP.BFSSPairedSpin9Plane`, native `Source48Label = Fin 24 × Fin 2`:

1. `normalizedFourIndexRHS_scalar_bridge (r s t u : SpaceIndex)`: `(1/4 : ℝ) • zeroDiagonalFourIndexRHS r s t u = normalizedFourIndexRHS r s t u`.
2. `normalizedPairedPlane_universal_four_index_bracket (r s t u : SpaceIndex)`: `H_rs*H_tu - H_tu*H_rs = normalizedFourIndexRHS r s t u`.

`H_rs = -(1/2 : ℝ) • zeroDiagonalPairedPlane r s` is source-native, zero-diagonal, skew-symmetric, antisymmetric in orientation. The explicit normalized right-hand side is exactly
```text
-(if s=u then H_rt else 0)
+ (if s=t then H_ru else 0)
- (if r=t then H_su else 0)
+ (if r=u then H_st else 0)
```
or `[H_rs,H_tu] = -δ_su H_rt + δ_st H_ru - δ_rt H_su + δ_ru H_st`. **Every conditional contributes ONE H**, not a doubled H. The previous draft double-H formula was a factor-two error, explicitly rejected and corrected in V8Q documentary negative knowledge before V8R construction.

## Two red gates were evidence, not acceptance

- [V8R Gate 1 RED #41169217908](https://github.com/etblink/math/actions/runs/41169217908), SHA `862afdf19712495da7f85e26812a75719d731c68`, source blob `b26cd3eb1378d8533934255a08c487364f927447`, artifact `13031125112` SHA256 `c46819e6bf6367eec7f28b7e86c5a99fc0a61896424c664454bbb482588e3c89`: uncontrolled 16-case matrix simp/ring left unresolved conditional proof goals with `sorryAx`.
- [V8R Gate 2 RED #41169903407](https://github.com/etblink/math/actions/runs/41169903407), SHA `8838e6acd4f2ebd497b22e8e274aacc99e78fb2f`, source blob `42c7a72271e3fdd67c976bfadf9626f4e5cb7f4f`, artifact `13031270498` SHA256 `4b62ad797f69485b0b40b3fd92ea2909482e15b9356db7e2f3df106263840c00`: deprecated `if_pos` in strict pinned Lean and conditional rewrite failed to match the source's decidable instance. Proof incomplete with `sorryAx`.
- Gate 3 recovery preserved the typed one-term scalar lemma, supplied `[Decidable p]` explicitly and eliminated deprecated `if_pos` with `simp only [hp, ite_true]`; all remaining proof material unchanged. The red causal records `FCP_K1D18V8R_GATE1_RED_UNRESOLVED_CONDITIONALS_SORRYAX_GATE2_REPAIR_2026_10_30.md` and `FCP_K1D18V8R_GATE2_RED_DEPRECATED_ITE_DECIDABLE_INSTANCE_GATE3_RECOVERY_2026_10_30.md` remain separately preserved.

## Ledger, next method and strict scope boundary

V8A–V8Q **37 accepted source-exact algebra roots**; V8R adds **2**: **39 total accepted**. The full `H` basis bracket now has the standard `so(9)` coefficient pattern.

**Next V8S:** develop the *input* `9×9` skew coordinate generator `F_rs:=E_rs-E_sr` on the actual `SpaceIndex` (not a guessed color-major or paired-label equivalence). Prove source-exact orientation antisymmetry, diagonal zero, skew transpose, and correct generator-to-generator bracket if small and type-safe. First qualify its typed matrix carrier and orientation before attempting arbitrary skew-matrix linear extension. When constructing `ρ`, ensure normalization `ρ(F_rs)=H_rs` (because both are antisymmetric), keep input `so(9)` and output `so(48)` carrier types explicit, and verify **`ρ([A,B])=[ρ(A),ρ(B)]` for arbitrary skew matrices** in a distinct gate. Do not infer the full homomorphism from the generator bracket without proving linearity and spanning. Further global Spin(9)→Spin(48) integration, Fock operator implementation, topology and BFSS physical results are separate open obligations.

No modification of accepted source blobs, frozen FCP provenance, `main` or mathcommunity upstream; no upstream PR without owner permission. This acceptance document is documentary only.
