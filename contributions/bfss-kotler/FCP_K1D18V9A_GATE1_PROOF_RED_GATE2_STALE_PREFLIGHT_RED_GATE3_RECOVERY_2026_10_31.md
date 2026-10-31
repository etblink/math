# Project Lead — V9A Gates 1–2 RED: nested matrix selector reduction and stale preflight assertion

**Research-local date:** 2026-10-31 PDT. **Disposition:** `GATE1_PROOF_RED__GATE2_PREFLIGHT_RED__GATE3_PENDING__NO_NEW_ACCEPTED_ROOT`.

## Gate 1: exact compiler proof failure

- [V9A strict Gate 1 #41179406622](https://github.com/etblink/math/actions/runs/41179406622), **completed/failure**, tested SHA **`a7fd0716c21436cb6be45076f9c927c7d51da657`**, job **`124473544137`**, original source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LinearMapMatrixUnitEvaluationProbe.lean` blob **`ad7a78c405e2b4448133348d991963233846a689`**.
- Source and original paired gamma/label pins, exact Lean `leanprover/lean4:v4.34.1`, pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, dependency restore and accepted V8Z source ancestor compilation **PASS**.
- Failed `Fresh compile exact V9A source with warnings as errors`: line **34:49** unsolved goal; after the attempted `Matrix.single_eq_of_single_single` rewrite, source Lean goal was
```text
⊢ ∑ x, ∑ x_1, (if x = r then Pi.single s 1 else 0) x_1 •
    normalizedPairedPlane x x_1 = normalizedPairedPlane r s
```
- Line **39:25** unused simplification lemma `Finset.sum_ite_eq'` rejected by warnings-as-errors. The theorem `coordinateToPairedLinearMap_matrixUnit` reported **`sorryAx`** because its proof was unfinished. Independent type and axiom gate **SKIPPED**, **no V9A acceptance**. This is not evidence the desired matrix-unit identity is false.
- [Preserved Gate 1 compiler artifact #13034825741](https://github.com/etblink/math/actions/runs/41179406622/artifacts/13034825741), ZIP SHA256 **`aa4c0fe2cf0f3aeb85d7723c01602244e7c6a3d01e671276b1ede296f068bc39`**, size **755 bytes**.

## Gate 2: bounded proof repair but stale workflow preflight

- Atomic two-file fast-forward commit **`c7f601a6a6469a92b7ca1ad3a4370211b596e409`**, source blob **`7bc8d896fde1e0dfa89d6932e334b7eac16342ed`**, workflow blob **`2a5cc90a2bb3ccb1b534f0e4f0cfd57557f17676`**. The proof **retains the exact same theorem statement** `ρ(E_rs)=(1/2)•H_rs` on original 9-index input and paired 48-index output and replaces the global conditional simplifier with two exact finite-support reductions:
```lean
rw [coordinateToPairedLinearMap_apply]
unfold coordinateToPairedFiniteLift
congr 1
rw [Finset.sum_eq_single r]
· rw [Finset.sum_eq_single s]
  · simp [Matrix.single_apply]
  · intro y _ hy
    simp [Matrix.single_apply, hy.symm]
  · simp
· intro x _ hx
  simp [Matrix.single_apply, hx.symm]
· simp
```
- [Gate 2 #41180215128](https://github.com/etblink/math/actions/runs/41180215128), tested **`c7f601a6a6469a92b7ca1ad3a4370211b596e409`**, job **`124475898842`**, **completed/failure** in **`Exact original paired and gamma pins`**. No Lean compiler or independent audit was reached; **no preserved compiler artifact** because the artifact step had no compiler files.
- Root cause: the source-hash pin was updated correctly, but the copied preflight still contained **`assert 'Finset.sum_ite_eq\'' in s`**. This assertion was an out-of-date internal *proof-shape* requirement for the previous failed source. Python raised **`AssertionError`**; accepted ancestor pins and source theorem definition were unchanged.
- This is **CI configuration drift**, not a failed Lean mathematical proof or any evidence for/against the theorem. The green status of source compilation is unknown for Gate 2. Preserve the red event separately rather than declaring a green theorem or masking the preflight.

## Gate 3: precise workflow preflight alignment only

- Updated **only** `.github/workflows/bfss-kotler-paired-spin9-linear-map-matrix-unit-evaluation-strict.yml` to match the source `assert 'Finset.sum_eq_single' in s` while retaining every exact gamma/label/source hash, pinned Lean/Mathlib revisions, warnings-as-errors compilation, theorem-type check, declaration-level `#print axioms` whitelist, and evidence upload.
- Fast-forward commit **`d654e6a10143e0fb95a468dbef448ee66a95831c`**; new workflow blob **`a09705df0c774349c409051cacc1230cfd1cf58d`**; **same V9A source blob `7bc8d896fde1e0dfa89d6932e334b7eac16342ed`**. Exact diff contains one workflow assertion replacement, no source change.
- [Gate 3 #41180290050](https://github.com/etblink/math/actions/runs/41180290050) launched at this commit. **PENDING** completion of actual Lean warnings-as-errors source compilation, independently restated imported theorem example and axiom gate with **no `sorryAx`**, and artifact hash before accepting any root.

## Scope and methods preserved

V8A–V8Z: **51 accepted source-exact algebraic theorem roots**. V9A: **0 qualified** until a strict full green. This gate concerns only the exact native input matrix-unit evaluation `ρ(E_rs)=(1/2)•H_rs`. The next, *separate* theorem is `ρ(F_rs)=H_rs` using source `F_rs=E_rs-E_sr` and output skew `H_sr=-H_rs`. Arbitrary skew 9×9 spanning, map of skew carriers, global Lie algebra bracket preservation, global Spin(9) lift and BFSS physical claims remain open.

Operational lessons: use source-pinned matrix-unit definitions, isolate support with `Finset.sum_eq_single` before rewriting algebraic signs; keep exact workflow hash pins; **when proof shape changes, audit workflow source-content preflight assertions** to avoid spurious CI failures. Do not weaken linters or raise proof limits, do not change accepted sources, and never convert a queued CI status into acceptance.

Frozen FCP, `main` and mathcommunity upstream remain unchanged; no upstream PR without owner authorization. This is a negative-knowledge record, not a new theorem.
