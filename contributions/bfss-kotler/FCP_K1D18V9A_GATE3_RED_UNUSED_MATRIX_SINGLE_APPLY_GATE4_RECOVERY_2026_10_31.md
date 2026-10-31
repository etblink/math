# Project Lead — V9A Gate 3 RED: valid exact-support proof rejected by three unused simp arguments

**Date:** 2026-10-31 UTC/PDT reporting context. **Disposition:** `GATE3_RED_PRESERVED__GATE4_PENDING`; V9A unqualified.

## Verified immutable failure

- [Gate 3 #41180290050](https://github.com/etblink/math/actions/runs/41180290050): attempt 1, **completed/failure**, exact tested SHA **`d654e6a10143e0fb95a468dbef448ee66a95831c`**, failed job **`124476117140`**.
- Original Fock-paired gamma/label, source SHA, pinned Lean **`leanprover/lean4:v4.34.1`**, pinned Mathlib **`d13f23b723b8a846827a245b89c10fc7d3f11612`**, dependency restoration, and accepted V8Z exact ancestor build all **PASS**.
- Failure at **fresh exact V9A source Lean compilation with warnings as errors**; the independent theorem-type and axiom audit was **SKIPPED**.
- Gate 3 source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LinearMapMatrixUnitEvaluationProbe.lean` Git blob **`7bc8d896fde1e0dfa89d6932e334b7eac16342ed`**.
- Strict linter at source **42:12, 44:12, 47:10**: `This simp argument is unused: Matrix.single_apply`. Suggested replacements: `simp`, `simp [hy.symm]`, and `simp [hx.symm]` respectively. **No unresolved theorem goals** were emitted. Compiler `#print axioms coordinateToPairedLinearMap_matrixUnit` showed only **`[propext, Classical.choice, Quot.sound]`**, **no `sorryAx`**. Accordingly the source's mathematical certificate was already complete, but strict compilation remains red and V9A does **not** qualify.
- [Preserved compiler artifact #13035075927](https://github.com/etblink/math/actions/runs/41180290050/artifacts/13035075927), name `bfss-v9a-original-paired-linear-map-matrix-unit-evaluation-d654e6a10143e0fb95a468dbef448ee66a95831c-1`, ZIP SHA256 **`ffd89a082fda224c4b4608c4dea770f26ad4f67828b130a31acaadfc79d8d834`**, size **657 bytes**.

## Causal distinctions and previous failures

- [Gate 1 #41179406622](https://github.com/etblink/math/actions/runs/41179406622), SHA `a7fd0716c21436cb6be45076f9c927c7d51da657`: source proof had a true unsolved nested matrix-unit selector sum; `Finset.sum_ite_eq'` was unused and `sorryAx` present. Artifact `13034825741`, SHA256 `aa4c0fe2cf0f3aeb85d7723c01602244e7c6a3d01e671276b1ede296f068bc39`.
- [Gate 2 #41180215128](https://github.com/etblink/math/actions/runs/41180215128), SHA `c7f601a6a6469a92b7ca1ad3a4370211b596e409`: exact preflight **stale proof-shape check** requiring old `sum_ite_eq'` failed (Python `AssertionError`), so Lean did **not run** and **no compiler artifact** was uploaded.
- Gate 3 corrected this spurious workflow assertion and Lean reached a complete axiom-clean theorem; it failed only the strict unused-simp linter. Keep all three distinct red causes, avoiding CI-success conflation.

## Gate 4 smallest source-correct repair

- Replace exactly three occurrences of `simp [Matrix.single_apply]` → `simp`, `simp [Matrix.single_apply, hy.symm]` → `simp [hy.symm]`, `simp [Matrix.single_apply, hx.symm]` → `simp [hx.symm]`. All source-native exact `Finset.sum_eq_single r` and `Finset.sum_eq_single s` branches preserved, with no theorem or matrix-carrier change.
- Atomic fast-forward commit **`b2ff2e2c5767a3b4d97ec996343928defba01552`**, corrected source blob **`480a43155cb709cb549a19513ad99183a203afe4`**, workflow exact-source-hash-only blob **`1381c50aaf796ce5e989bf18e64884a0eded89e9`**. Entire parent-child diff verified: **only source three simp argument changes and one workflow SHA update**; no ancestor or proof-limit change.
- [V9A Gate 4 #41180942751](https://github.com/etblink/math/actions/runs/41180942751) triggered at the exact repair commit. **PENDING** until source warning-as-error compilation, independent typed theorem example, declaration-level axiom audit with no `sorryAx`, and retained artifact digest all complete successfully.

## Formal scope and ledger

The target root remains only `coordinateToPairedLinearMap_matrixUnit (r s : SpaceIndex)`, stating `ρ(E_rs)=(1/2)•H_rs` from source-native 9-index matrix units to the original Fock-paired 48-real output label order. V8A–V8Z **51 accepted algebraic theorem roots**; V9A **0 accepted pending Gate 4**. Generator agreement `ρ(F_rs)=H_rs`, arbitrary skew-matrix Lie bracket preservation, global Spin(9) lift, and BFSS physical claims remain separate unproved obligations. Frozen original FCP, accepted modules, `main`, and mathcommunity upstream untouched. No unauthorized upstream PR.

**Method:** a linter can reject a semantically complete proof; do not disable lint to force green. Remove only source-exact unused expressions and independently recheck; record red SHA, source blob and compiler artifact.
