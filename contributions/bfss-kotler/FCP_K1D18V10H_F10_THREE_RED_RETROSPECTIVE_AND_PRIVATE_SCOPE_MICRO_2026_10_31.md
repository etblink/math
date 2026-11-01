# V10H-F10 three-red review and method switch — original source private-scope microprobe

Date: 2026-10-31 PDT. Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Governing principle

Find source-exact truths. Preserve both successful proofs and negative knowledge. A green preflight is not a green proof. Do not claim success from isolated lemmas that fail to prove the actual original theorem. Pinned ancestors F1–F9 remain immutable.

## Verified red-run provenance

1. [F10 Gate1 #41266215820](https://github.com/etblink/math/actions/runs/41266215820), source SHA `4170d1f17973e74b20ead538ad69f7bd7feb87f3`, job `124729447040`. Preflight/pinned toolchain/accepted F9 rebuild PASS. Fresh F10 compiler FAIL on `originalGamma8_eq_diagonal`: 256 unresolved original signed-permutation entry goals after `norm_num [gamma, Matrix.diagonal, Matrix.map_apply]`; unknown pinned identifier `Finset.prod_univ_succ` in `originalGamma8_det_one`. Axiom print revealed `sorryAx`; independent audit skipped. Artifact [#13067525972](https://github.com/etblink/math/actions/runs/41266215820/artifacts/13067525972), SHA256 `00255572d92dd995973c82924c9811d112a85de303466e394b1ac6728cbc3245`.
2. [F10 Gate2 #41266892206](https://github.com/etblink/math/actions/runs/41266892206), SHA `fb012c271dac2bf12acf86f46bb3172bb47db6ce`, job `124731449857`. The correction to **source-exact** `Fin.prod_univ_succ` succeeded. The fallback `norm_num [gamma, Matrix.diagonal, Matrix.map_apply] <;> rfl` reduced 248 of 256 matrix entry goals; 8 (exact negative diagonal indices 8..15) remain as `↑(FCP.BFSSGamma9.gammaInt✝ 8 i i) = -1`. That this imported private value is left opaque cannot be fixed by casting alone. F10 compiler FAIL and all 3 declarations `sorryAx`; audit skipped. Artifact [#13067761462](https://github.com/etblink/math/actions/runs/41266892206/artifacts/13067761462), SHA256 `7e4b418962c7eab99e006f7ed61b468c9a44449a80a91200fdb0231e0853fc58`.
3. [F10 Gate3 #41267510559](https://github.com/etblink/math/actions/runs/41267510559), SHA `f05019f3163e5d9da0ab293b39d36010f18a59fb`, job `124733279698`. The replacement fallback `change ((-1 : ℤ) : ℝ) = (-1 : ℝ)` ran on **still-unreduced original gamma matrix goals**, not just the 8 normalized goals, so Lean repeatedly rejected an incorrect definitional equality. It reached the standard 100-error reporting limit. This shows the prior diagnosis as a mere cast mismatch was incomplete. Preflight/toolchain/F9 green, fresh F10 compiler red; independent audit skipped. Artifact [#13067907236](https://github.com/etblink/math/actions/runs/41267510559/artifacts/13067907236), SHA256 `0f5f68a5bbb07c9370f65e300292a128fb21c46f03309dea077e10699774672d`.

## Review of successful source-exact methods

- F1–F3 accepted direct and typed source matrix determinant statements, explicit multiplication and origin Fock index, not deeply composed global MonoidHom normalization.
- F4 accepted an explicit normal subgroup defined by determinant +1, with subtype-one coercion explicitly bridged using source-specific `Submonoid.coe_one`.
- F5 accepted direct `spinGroup source9Quadratic →* ℝ` character, avoiding the previously unsuccessful nested `Matrix.detMonoidHom.comp`. Gate1 CI preflight red was corrected only after distinguishing executable Lean code from historical comments.
- F6 and F7 accepted source-specific commutator subgroup inclusion and exact two-sign obstruction, with all perfectness/global conclusions explicitly conditional.
- F8 accepted source Clifford-unit determinant map through actual `spinGroup.toUnits`, without replacing the Clifford or paired Fock definitions.
- F9 accepted all-vector determinant-square formula and two-branch magnitude by using `Matrix.det_mul`, `Matrix.det_smul`, and exact pinned `mul_self_eq_mul_self_iff`. This does NOT establish a sign.
- Across accepted F1–F9, immutable Git source blob pins, clean Lean 4.34.1/Mathlib d13f23..., strict warningAsError fresh compilation and independent exact declaration-type/axiom whitelist `[propext, Classical.choice, Quot.sound]` were essential.

## New technical root-cause hypothesis

The original immutable `SU2RealGammaProbe.lean` uses private `perm`, `sign`, `gammaInt` definitions, with original public `gamma` referencing the private integer signed-permutation map. Lean's module system can leave imported private definition values unavailable to ordinary downstream proof unfolding; endlessly adding `simp`, `rfl`, `norm_num`, or `change` would not restore missing definitions. The Lean reference provides `import all` to retrieve a module's private implementation scope, when supported by the module/package boundary. **This hypothesis must be tested on this exact source/module, not asserted as proven.**

## Action — F10D TWO-CELL DIAGNOSTIC ONLY (UNQUALIFIED)

- Add one new **isolated** F10D Lean source, importing original accepted F9 and `import all OAI.MathematicalPhysics.BFSS.Contrib.Kotler.SU2RealGammaProbe`. Prove only two exact original entries of original `gamma (8 : Fin 9)`: `(0,0)=+1`, `(8,8)=-1`. No new gamma definition or copied original signed permutation, no 256-way split, no further cast coercion guess. The two microproofs use a narrow `rfl` or source-transparent `norm_num` fallback.
- Add dedicated F10D strict CI with exact F9/original gamma/F10 historical blob pins, compiler -DwarningAsError, and two independent exact theorem/axiom audits. Do not alter F10 full source or its existing failed workflow.
- Outcome interpretation: if F10D is green, prototype a single entrywise source microlemma and then a full 16x16 diagonal equality using the same visibility bridge. If F10D is red, record whether `import all` is unsupported (old-style file, missing private scope) or private values still refuse to unfold; **do not** attempt a fourth blind full matrix tactic. Investigate a source-level helper theorem exposing selected private signed-permutation entry values, or pursue a basis-independent Clifford algebra proof; explicit authorization would be prudent before touching formerly qualified source files.

## Scope and remaining mathematical obligations

F1–F9 remain accepted; original F10 full theorem and F10D microprobe UNQUALIFIED. The original ninth-axis sign +1 is a source-data expectation, not yet formal proof. Even proving that single matrix determinant does not establish all-vector gamma positivity or source Lipschitz generation, original paired SO48, exact Spin48 lift or BFSS physics. No compiler-limit increases, sorries, native_decide, introduced axioms, pinned dependency changes, edits to accepted sources, main/upstream pushes, or original paired-Fock 48 basis changes.
