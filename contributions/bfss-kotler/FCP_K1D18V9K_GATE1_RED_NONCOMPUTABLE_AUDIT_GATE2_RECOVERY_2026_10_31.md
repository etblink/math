# Project Lead — V9K Gate 1 RED: independent audit examples omitted `noncomputable`; Gate 2 bounded workflow-only recovery

**Research date:** 2026-10-31 PDT. **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`; no V9K theorem root is accepted until strict independent audit passes.

## Exact failed source and job

- [V9K strict Gate 1 #41201834484](https://github.com/etblink/math/actions/runs/41201834484), terminal **completed/failure**, exact tested SHA **`7c8d56873e2ad839e7cecdb5af1ddf94ab210906`**, job **`124538987478`**.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9BracketDefectLinearExtensionsProbe.lean`, Git blob **`90c700e2152312f82c6f16e7a485a31e2d331579`**, is **unchanged and remains the candidate**.
- Exact paired-Fock source pins **PASS**, pinned Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore **PASS**, accepted V9J scalar/ V9H generator source ancestor compilation **PASS**, fresh exact V9K source compile with `-DwarningAsError=true` **PASS**, and the source `#print axioms` reported **`[propext, Classical.choice, Quot.sound]`** for `coordinateToPairedBracketDefect_coordinatePlanes`.
- **Independent proof audit RED** with precisely two `error(lean.dependsOnNoncomputable)` diagnostics at `/tmp/PairedSpin9V9K_Audit.lean:4:0` and `:7:0`. The independent `example` declarations that instantiate the genuine real linear maps `coordinateToPairedBracketDefect_rightLinear` and `coordinateToPairedBracketDefect_leftLinear` were missing the `noncomputable` modifier. The source's two definitions correctly are marked `noncomputable`, and its zero-defect theorem compiled. The independent axiom check command therefore failed before terminal PASS. **Do not accept the gate based on the source-only green step.**
- [Preserved Gate 1 independent/compiler artifact #13043321931](https://github.com/etblink/math/actions/runs/41201834484/artifacts/13043321931), name `bfss-v9k-original-paired-bracket-defect-linear-extensions-7c8d56873e2ad839e7cecdb5af1ddf94ab210906-1`, ZIP SHA256 **`65c1629c6d87277b08855423e5eda1b1026f5e56250fd7fa807750caf159c19f`**, size 1143 bytes.
- Independent build warnings about modified local caches under `.lake/packages/` occurred but are not the causal error in V9K.

## Minimal Gate 2 fix, without proof or source changes

The only diff from the failed tested SHA is **two workflow lines** in `.github/workflows/bfss-kotler-paired-spin9-bracket-defect-linear-extensions-strict.yml`:
```diff
- example (A : Matrix SpaceIndex SpaceIndex ℝ) :
+ noncomputable example (A : Matrix SpaceIndex SpaceIndex ℝ) :
- example (B : Matrix SpaceIndex SpaceIndex ℝ) :
+ noncomputable example (B : Matrix SpaceIndex SpaceIndex ℝ) :
```
The independently typed third `Prop` example and `#print axioms` remain unmodified. No change to V9K research source, theorem statement, definition, old ancestor, exact original paired label/gamma pins, Lean/Mathlib pins, CI compiler flags, lints, timeouts or axiom allowlist.

- Recovery commit **`5ba4e9d44b1e997a1e744cdb24e2200b0681ead1`**, workflow Git blob **`d1c0e997c5b20050a4f65f267ff5762d5076beda`**.
- [V9K strict Gate 2 #41202976036](https://github.com/etblink/math/actions/runs/41202976036), tested commit **`5ba4e9d44b1e997a1e744cdb24e2200b0681ead1`**, **in progress** when recorded. Require strict source compile, exact independent examples, permitted axiom report and preserved artifact before acceptance.

## Qualification boundary and next step

V9K bundles two genuine typed `ℝ`-linear restrictions of already verified V9I/V9J bilateral defect `D` and proves the single theorem `D(F_rs,F_tu)=0` for every native pair. These statements retain original `Matrix SpaceIndex SpaceIndex ℝ` inputs and original Fock-paired `Matrix Source48Label Source48Label ℝ` outputs. No external color-major reindexing or unproved bracket assumption.

**Accepted ledger remains V8A–V9J = 65 algebraic theorem roots, V9K = 0 pending strict Gate 2.** The typed definitions are not counted as theorem roots. Next prove finite-sum/smul extension from the accepted V9F skew spanning to arbitrary skew-pair vanishing of D, in separately strict bounded Lean gates. Do not infer a typed LieHom, Spin(9) global lift, Fock implementation, or physical BFSS result from source compilation.

**Negative knowledge:** an independent Lean `example` *returning a noncomputable structure* must itself be marked `noncomputable`, even when the source declaration and theorem are already valid. Audit fixtures are part of the qualification contract. Never bypass or skip a red independent check. Preserve the historical red alongside eventual green, and keep frozen FCP, `main`, mathcommunity upstream and earlier accepted sources untouched. No unauthorized upstream PR.
