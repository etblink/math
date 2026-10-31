# Project Lead — V8S Gate 1 RED: dependent if/Decidable rewrite in coordinate-plane transpose

**Research-local date:** 2026-10-30 PDT (GitHub strict run completed 2026-10-31T05:17:25Z). **Disposition:** `GATE1_RED_PRESERVED__GATE2_PENDING`.

## Strict negative verification, preserved

- [V8S Gate 1 #41171275170](https://github.com/etblink/math/actions/runs/41171275170), attempt **1**, **completed/failure**, exact tested SHA **`748752e1d89d90602ee6721ffc01c5a6043c06c6`**, job **`124449549408`**.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9CoordinatePlaneCarrierProbe.lean`, Git blob **`1ac381a90bc2d95e482d9681afc1d2f93ef4e33f`**.
- Pinned source labels, native gamma and accepted V8R source, `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, package restore, and strict accepted V8R ancestor compilation all passed.
- First failing stage: `Fresh compile exact V8S source with warnings as errors`. Independent theorem-type and axiom gate **SKIPPED**.
- Exact compiler diagnostic `SU2BFSSPairedSpin9CoordinatePlaneCarrierProbe.lean:60:6: error: Tactic rewrite failed: motive is not type correct`. Lean elaborated `rw [h₁,h₂]`, where `h₁ : (j=r ∧ i=s)=(i=s ∧ j=r)` and similarly `h₂`. The source uses these equalities as **conditions of `ite`**, with elaborated dependent `Decidable (j=r ∧ i=s)` evidence. Rewriting the proposition independently invalidated the dependent motive: `Decidable (j=r ∧ i=s)` was expected to have type `Decidable _a`. This is a concrete dependency-transport problem, not a counterexample to input skewness.
- The unfinished transpose theorem's red `#print axioms` included **`sorryAx`**. No V8S root was qualified by the red gate; even separately typechecked candidate roots remain part of a failed three-root qualification.
- [Retained failure artifact #13030819808](https://github.com/etblink/math/actions/runs/41171275170/artifacts/13030819808), `bfss-v8s-original-paired-coordinate-plane-carrier-748752e1d89d90602ee6721ffc01c5a6043c06c6-1`, zip SHA256 **`dc9a927bafb4dbe0be05ceb355c81a43b342e2822e3c886d4a56a7a314b9d546`**, size 1252 bytes.

## Minimal corrective experiment

V8S defines precisely `coordinatePlane9 r s : Matrix SpaceIndex SpaceIndex ℝ` entrywise as `E_rs-E_sr`. It is **9×9** on the native spatial `SpaceIndex`, not the accepted paired-Fock 48-label output `normalizedPairedPlane r s`. The three proposed theorem statements are unchanged:
```lean
coordinatePlane9_self r : coordinatePlane9 r r = 0
coordinatePlane9_swap r s : coordinatePlane9 s r = -(coordinatePlane9 r s)
coordinatePlane9_transpose r s :
    (coordinatePlane9 r s).transpose = -(coordinatePlane9 r s)
```

The Gate 2 candidate **only** replaces:
```lean
have h₁ : (j = r ∧ i = s) = (i = s ∧ j = r) := propext (and_comm)
have h₂ : (j = s ∧ i = r) = (i = r ∧ j = s) := propext (and_comm)
rw [h₁, h₂]
abel
```
with:
```lean
-- Simplification is congruence-aware inside dependent ite conditions.
simp only [and_comm]
abel
```
`simp` has a congruence-aware strategy for `ite` conditions and avoids rewriting a proposition as though its decidability evidence were independent. This is a testable Lean compilation hypothesis; **not** evidence of success until Gate 2 is green. No mathematical statement, original source gamma, source label bridge, accepted root, or warning-as-error/limit policy was changed.

- Atomic two-file commit **`b5ab01906c7299746a43154280f9727c65d68a10`**, on the exact parent tree, verified fast-forward. Corrected source Git blob **`92a26e8380abe9c1f9bdf011d27b8e97b4e17ef3`**, updated workflow source pin/preflight blob **`c295e8158403a58ae17b81c830ff1de5d3ef852a`**.
- Complete parent-to-repair diff has exactly two changed files, **V8S source** and **V8S strict workflow**.
- [V8S Gate 2 #41172080487](https://github.com/etblink/math/actions/runs/41172080487), on repair SHA. **PENDING** until a complete success, 3 exact imported theorem-type examples, 3 source declaration-level permitted-axiom audits excluding `sorryAx`, exact source pin and retained artifact.

## Methodological lessons and boundary

This error is related to but not identical with V8R Gate 2's mismatched `Decidable` conditional helper rewrite and deprecated `if_pos`: here the failed operation was a raw proposition equality `rw` **inside a dependent `ite`**. Prefer `simp only` for logic normalization under `ite`; preserve explicit source-native input/output matrix types rather than rewriting dependent evidence or increasing resource limits. Historical reds V8J unused tactic, V8L unused simp, V8O loop, V8R unresolved cases and deprecated conditional rewrite also remain separately documented.

Cumulative accepted: **39 source-exact V8A–V8R roots**. V8S has **zero accepted roots** until a new strict gate passes. No `so(9)→so(48)` Lie algebra homomorphism, global Spin(9) integration, topology or physical BFSS claim has been proved. Frozen FCP, `main`, accepted Lean source blobs and mathcommunity upstream untouched; no upstream PR without owner permission.

This document is a RED causal ledger and corrective attempt, not an acceptance.
