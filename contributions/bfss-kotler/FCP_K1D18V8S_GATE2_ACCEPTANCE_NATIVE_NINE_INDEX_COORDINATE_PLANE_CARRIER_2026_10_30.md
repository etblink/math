# Project Lead — V8S Gate 2 ACCEPTED: source-native nine-index coordinate-plane carrier

**Research-local date:** 2026-10-30 PDT, GitHub Actions completed 2026-10-31T05:25:51Z. **Disposition:** `ACCEPTED_3_NATIVE_9X9_SKEW_MATRIX_ROOTS__FULL_LIE_HOMOMORPHISM_OPEN`.

## Immutable exact qualification

- [V8S Gate 2 #41172080487](https://github.com/etblink/math/actions/runs/41172080487), attempt 1, **completed/success**, exact tested Git SHA **`b5ab01906c7299746a43154280f9727c65d68a10`**, job **`124451998120`** completed/success.
- Qualified Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinatePlaneCarrierProbe.lean` Git blob **`92a26e8380abe9c1f9bdf011d27b8e97b4e17ef3`**.
- Native nine-dimensional `SpaceIndex` input matrix, original paired-Fock source-48-real gamma/label equivalence and accepted V8R ancestor, Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` all pinned by exact preflight.
- Pinned dependency restore **PASS**; accepted V8R compiled **PASS**; `Build completed successfully (8968 jobs)` is **build job count**, not theorem count.
- Fresh source `lake env lean -DwarningAsError=true` compiled with `.olean` **PASS**, emitting three exact `#print axioms` records.
- Independent imported Lean audit: three exact typed `example` declarations, three `#check` declarations, three `#print axioms` **PASS**. Terminal marker `K1D18V8S_THREE_NATIVE_NINE_INDEX_CARRIER_ROOTS_AXIOMS_PASS`.
- All three roots use exclusively **`[propext, Classical.choice, Quot.sound]`**; **no `sorryAx`**, `sorry`, `admit`, enlarged proof limits, or ignored warnings.
- [Preserved compiler/type/axiom artifact #13031541374](https://github.com/etblink/math/actions/runs/41172080487/artifacts/13031541374), name `bfss-v8s-original-paired-coordinate-plane-carrier-b5ab01906c7299746a43154280f9727c65d68a10-1`, SHA256 **`7ef2c870135d2a4ba241ff5ea4d6704f380aba6296b6ec8d941956e6fb62b9dd`**, 957 bytes.

## Exact accepted theorems and scope

On `coordinatePlane9 r s : Matrix SpaceIndex SpaceIndex ℝ` defined entrywise as `E_rs-E_sr`:
1. `coordinatePlane9_self (r)`: `F_rr=0`.
2. `coordinatePlane9_swap (r s)`: `F_sr=-F_rs`.
3. `coordinatePlane9_transpose (r s)`: `F_rsᵀ=-F_rs`.

Input `SpaceIndex` is native, independent of output `Source48Label=Fin 24×Fin 2` and `normalizedPairedPlane`. No 9-to-48 linear map, arbitrary skew bracket preservation or group lift has been constructed.

## Preserved failure and successful repair

- [V8S Gate 1 RED #41171275170](https://github.com/etblink/math/actions/runs/41171275170), exact tested SHA **`748752e1d89d90602ee6721ffc01c5a6043c06c6`**, source Git blob **`1ac381a90bc2d95e482d9681afc1d2f93ef4e33f`**, error `...CoordinatePlaneCarrierProbe.lean:60:6: Tactic rewrite failed: motive is not type correct`. Rewriting commuted conjunctions with raw `rw [h₁,h₂]` tried to transport a proposition within an `ite` with dependent `Decidable`, invalidating the motive. `sorryAx` was reported for unproved transpose. Preserved red artifact `13030819808`, SHA256 `dc9a927bafb4dbe0be05ceb355c81a43b342e2822e3c886d4a56a7a314b9d546`.
- Gate 2 replaced **only** the dependent `rw` with congruence-aware `simp only [and_comm]` and `abel`, leaving all three statements and input geometry unchanged; no proof limits raised. This passed strict source, type and axiom verification.
- Complete causal report: `contributions/bfss-kotler/FCP_K1D18V8S_GATE1_RED_DEPENDENT_ITE_REWRITE_GATE2_RECOVERY_2026_10_30.md`.

## Ledger and next stage method

V8A–V8R **39 accepted roots**, V8S **3** = **42 qualified source-exact algebraic roots**. These include output normalized `H` all-indices structure bracket and input `F` generator skewness, but not the input `F` bracket or the fully linear representation.

**Next bounded objective V8T:** build and strictly verify an exact *input matrix-unit bridge*, preferably `coordinatePlane9 r s=U_rs-U_sr` where `U` are Mathlib/native matrix units, with native `SpaceIndex` and no guessed basis reindexing. Then obtain `U_rs U_tu = δ_st U_ru` and derive the input four-index generator bracket with sign matching accepted V8R, before constructing linear extension to arbitrary skew matrices. Inspect pinned Mathlib APIs; do not invent lemma names or rely on absent algebra-map assumptions. Keep small typed targets with separate strict compile and independent axiom gates. Negative knowledge about V8J, V8L, V8O, V8R, V8S red failures remains authoritative.

No edits to previously accepted Lean source blobs, frozen FCP, `main` or upstream mathcommunity without explicit authorization; no full Lie algebra homomorphism/global Spin(9)/Fock implementation/BFSS physical claims asserted. This is a documentary acceptance and handoff.
