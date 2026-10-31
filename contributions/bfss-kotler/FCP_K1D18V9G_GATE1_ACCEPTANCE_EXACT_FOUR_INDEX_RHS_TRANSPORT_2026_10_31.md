# Project Lead — V9G Gate 1 ACCEPTED: exact native nine-to-paired-four-index bracket RHS transport

**Research date:** 2026-10-31 PDT; GitHub Actions completed 2026-10-31T11:44:32Z. **Disposition:** `ACCEPTED_TWO_SOURCE_EXACT_FOUR_INDEX_RHS_TRANSPORT_ROOTS__GENERATOR_COMMUTATOR_NEXT`.

## Immutable strict verification evidence

- [V9G Gate 1 #41197541258](https://github.com/etblink/math/actions/runs/41197541258), attempt **1**, terminal **completed/success** at exact tested SHA **`7da95f6c442db769d787ffe30a41bfad298ad126`**, job **`124526638209`** completed/success.
- Qualified Lean source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9FourIndexRHSTransportProbe.lean`, Git blob **`b7d08c6dfe027179a2934e580a8fbd0a71484ff4`**.
- Original paired-Fock source/gamma/label pins, accepted V8R paired four-index bracket, V8W native nine-index four-index bracket, V9F skew finite spanning, V9B generator agreement, all imported ancestors, pinned Lean `leanprover/lean4:v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` **PASS** hash preflight and pinned dependency restore.
- Exact accepted ancestor compilation **PASS**. `Build completed successfully (8982 jobs)` is workload, **not** the root count.
- Fresh source `lake env lean -DwarningAsError=true`, .olean emission, 2 source declaration-level `#print axioms` reports **PASS**.
- Independent fresh imported Lean specialization `example` for both exact theorem types, two `#check` and two `#print axioms` **PASS**, marker **`K1D18V9G_EXACT_FOUR_INDEX_RHS_TRANSPORT_AXIOMS_PASS`**.
- The two exact axiom reports only **`[propext, Classical.choice, Quot.sound]`**; no `sorryAx`, `sorry`, `admit`, custom axiom, weakened linter or proof-limit increase.
- [Preserved compiler and independent axiom artifact #13040808934](https://github.com/etblink/math/actions/runs/41197541258/artifacts/13040808934), name `bfss-v9g-original-paired-four-index-rhs-transport-7da95f6c442db769d787ffe30a41bfad298ad126-1`, ZIP SHA256 **`d56bfa6b8ceecdbf4d3b0ed1b41d7dafd36069b230e4deb11b7fb3f35d7de9b2`**, 1044 bytes.

## Exactly qualified theorem roots and correct limitation

1. `coordinateToPairedLinearMap_conditional_plane (p : Prop) [Decidable p] (r s : SpaceIndex)`: `ρ(if p then F_rs else 0) = if p then H_rs else 0` for both truth values of p. This is a typed conditional transport, not a commutator theorem.
2. `coordinateToPairedLinearMap_fourIndexRHS (r s t u : SpaceIndex)`: `ρ(coordinateFourIndexRHS r s t u)=normalizedFourIndexRHS r s t u`; all repeated index cases covered and exact signs `(-,+,-,+)` preserved without changing original paired-Fock 48-real indexing.

**Root ledger:** V8A–V9F **58** qualified source-exact algebraic theorem roots; **V9G +2 = 60**.

## Next exact obligation and methods

**V9H:** prove `ρ([F_rs,F_tu])=[ρ(F_rs),ρ(F_tu)]` for **every four native indices**, using accepted V8W input generator bracket theorem, accepted V9G transport, V9B `ρ(F)=H`, and V8R normalized paired commutator theorem. Bracket is the *actual* matrix product commutator `X*Y-Y*X`, with identical verified `SpaceIndex` source and `Source48Label` output. Retain original source units, exact matrix multiplication and no basis permutation. Verify independently on pinned Lean/Mathlib with a strict job.

Then verify **bilinearity of the difference** `D(A,B)=ρ([A,B])-[ρ(A),ρ(B)]` in *both* 9×9 inputs using source-exact `mul_add`, `add_mul`, `smul_mul_assoc` and `mul_smul_comm`; combine V9F full skew spanning to obtain `D(A,B)=0` for arbitrary skew A,B. Do not infer arbitrary bracket preservation merely from the generator theorem. The typed LieHom, global Spin(9) integration and BFSS physical/spectral claims remain open.

Keep all previous red histories and source SHA pins, frozen FCP, `main` and mathcommunity upstream unchanged. Do not create an external PR without owner authorization. This is a documentary acceptance note, not another theorem root.
