# Project Lead — V8N Gate 1 ACCEPTED: original paired skew and square bridges

**Research local date:** 2026-10-30 PDT; strict workflow completed **2026-10-31T03:54:11Z**. **Disposition:** `ACCEPTED_2_ORIGINAL_SOURCE_MATRIX_ROOTS__NORMALIZED_LIE_MAP_OPEN`.

## Exact immutable verification certificate

- [V8N Gate 1 #41165774938](https://github.com/etblink/math/actions/runs/41165774938), attempt **1**, **completed/success** on exact tested Git SHA **`f65c4d3a84f76889eff09d59a6a808ed8d444091`**. Exact strict job **`124432898768`** completed/success.
- Qualified source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9ZeroDiagonalSkewSquareProbe.lean`, source Git blob **`a4a4ada7dab04c87cdad14206656c6b81b32aeae`**.
- Original 48-real Fock-paired label equivalence and source gamma, exact accepted V8A, V8H and V8M ancestors, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` pins verified by preflight **PASS**.
- Pinned dependencies restored **PASS**; source-exact ancestors built **PASS**, `Build completed successfully (8963 jobs)`. This counts dependency jobs, **not** new theorem roots.
- Fresh exact source `lake env lean -DwarningAsError=true` compile **PASS**, emitted source `.olean`, precisely two declaration-level `#print axioms` records.
- Fresh independent imported Lean audit **PASS**: two separately stated exact original-type `example` declarations, two `#check`, two `#print axioms`; exact terminal marker **`K1D18V8N_EXACT_TWO_PAIRED_SKEW_SQUARE_ROOTS_PASS`**.
- Each named theorem uses only `[propext, Classical.choice, Quot.sound]`. No `sorryAx`, no `admit`, no raised limits.
- [Preserved compiler/type/axiom artifact #13029158887](https://github.com/etblink/math/actions/runs/41165774938/artifacts/13029158887): name `bfss-v8n-original-paired-zero-diagonal-skew-square-f65c4d3a84f76889eff09d59a6a808ed8d444091-1`, zip SHA256 **`d60ecff56c03d77325e7f12a3fe35ca7cd20da379e301402f1576ce22ff2e7e2`**, 966 bytes.

## Precisely accepted theorem roots

Both in `FCP.BFSSPairedSpin9Plane`; `L_rs=zeroDiagonalPairedPlane r s : Matrix Source48Label Source48Label ℝ`:

1. `zeroDiagonalPairedPlane_transpose (r s : SpaceIndex)`: `(L_rs).transpose = -L_rs` **for all pairs**, including the zero diagonal. The proof bridges V8A off-diagonal K-skewness with V8H `L_rr=0`.
2. `zeroDiagonalPairedPlane_sq (r s : SpaceIndex) (hrs : r ≠ s)`: `L_rs*L_rs=-(1 : Matrix Source48Label Source48Label ℝ)`. This is specifically **off diagonal**; no square=-I assertion at `r=s`.

The source-native 48-label skewness means all `L_rs` take values in the skew-symmetric real-matrix Lie carrier, but no typed Lie subalgebra or homomorphism has been constructed in this module.

## Full acceptance ledger and scope

V8A 2 + V8B 1 + V8C 1 + V8D 1 + V8E 1 + V8F 1 + V8G 1 + V8H 3 + V8I 5 + V8J 4 + V8K 4 + V8L 5 + V8M 1 + V8N **2** = **32 newly accepted source-exact Lean algebra roots**.

V8M already established `[L_rs,L_tu]=2(δ_su L_rt−δ_st L_ru+δ_rt L_su−δ_ru L_st)` on original 48-real labels, including all coincidences. The raw V8A K diagonal is nonzero (`K_rr=-I`), thus the true Lie basis convention must explicitly use V8H `L_rr=0`; never silently modify K.

## Next research direction

- **Normalization sign must be proved**, not guessed. For standard 9×9 skew basis `F_rs=E_rs-E_sr`, the accepted adjacent `[L_rs,L_st]=-2L_rt` is matched by `F_rs ↦ -(1/2) L_rs`. First create typed `normalizedPairedPlane r s := (-(1/2 : ℝ)) • L_rs` and verify skewness, zero diagonal, orientation, and an adjacent generator bracket under the *exact* original label matrices; a commutator calculation can then be generalized to all four-index values. Do not claim any Lie homomorphism before an actual linear extension preserving bracket.
- Explicitly inspect existing pinned Mathlib for `Matrix.transpose_smul`, `smul_mul_assoc` and matching source-defined indexed antisymmetric matrix basis; prefer explicit `Matrix.ext` and typed scalar bridges to increasing heartbeats or suggesting wrong universe equalities.
- Next larger obligation: a **typed linear map** from native `so(9)` skew-symmetric matrix carrier into the original 48-real `so(48)` carrier, with normalized generator assignment and verified commutator preservation, then group integration only as a *separate* research stage. Prior accepted Spin(48) two-sign group homomorphism/fiber claims do not prove this new global Spin(9) lift.

Preserve red-run V8J and V8L lint negatives and Git-tree incident. No edits to accepted source blobs, frozen FCP, `main`, or upstream mathcommunity; no upstream PR absent owner authorization. This acceptance document is documentary and not a new proof SHA.
