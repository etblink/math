# K1D18V10H F10AV — Gate 2 compiler diagnostics and bounded Gate 3 repair

**Review date:** 2026-11-01 Pacific / 2026-11-02 UTC  
**Repository and branch:** `etblink/math`, `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Epistemic status:** Gate 2 failed. Gate 3 is a **new unqualified candidate**, never an acceptance record.

## Immutable Gate 2 evidence

- [Run #41376326160](https://github.com/etblink/math/actions/runs/41376326160), first attempt, **failure**, exact tested SHA `6f8cf82093ca1cd756d3e6cf15bdafb4ecf6677f`, job `125057237094`.
- Failure artifact ID `13111529100`, artifact zip SHA256 `3f640bbc7a28a19c83d5e526311ea20b85147cb4cb0d11ca06d8f908625993f5`.
- The corrected *exact full-line* Python source preflight passed. Pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restore passed. Accepted F10AU exhaustive original gamma native Lie-bracket module and V9F true source skew-plane spanning module both rebuilt successfully.
- Fresh candidate compilation with `-DwarningAsError=true` **failed** at:
  - line 123:15 `if_neg` deprecated (Lean now recommends `ite_eq_right`), followed by a line 123:4 `simp made no progress` error;
  - line 141:15 same `if_neg` deprecation and line 141:4 `simp made no progress`;
  - line 164:11 `simp made no progress`, accompanied by a note that a target expression was not type-correct at implicit transparency, with `function expected: A i` after aggressive rewriting.
- `#print axioms` for four downstream theorems (`coordinateToOriginalGammaLinearMap_coordinatePlane`, `..._coordinatePlane_transpose`, `..._image_transpose`, and `..._image_mem_so`) includes `sorryAx`, reflecting incomplete elaboration after tactics failed, **not** a passing axiom audit. First four earlier declarations reported only the permitted base axioms.
- The separate independent eight-root exact-type and axiom audit was **skipped**, not passed.

**Causal finding:** source proof-tactic/API and simplifier elaboration failures after a successful validator correction; these diagnostics do not mathematically disprove the target skew-image theorem.

## Pinned accepted repair patterns

- The accepted F10AU source already uses `rw [dite_eq_right ...]` in dependent-if negative branches. Replace only the two deprecated `simp only [if_neg hrs]` sites with `rw [dite_eq_right hrs]`.
- The accepted V9C `coordinateToPairedLinearMap_image_transpose` proof uses `simp only` rather than recursive `simp_rw` for finite-sum matrix transpose, scalar action, and known generator transpose identities. Replace **only** the line-164 `simp_rw` with `simp only` on the same specified lemmas. This is a smaller tactic-method change, not a new representation or theorem.
- Leave the map, 1/4 and 1/2 normalization, all eight signatures, source-native nine gamma generators, original matrix carriers, and accepted ancestry unchanged. Do not increase limits, use `sorry`, `admit`, disable linters, or weaken axiom restrictions.
- Update only the source blob pin in the corresponding strict workflow to the new source SHA `509ae337fe1ec9da898dae9a98ec9eb676a30694`.

## Gate 3 strict acceptance contract

A new green workflow at its exact tested SHA must pass complete source/ancestry pinning, dependency restoration, accepted F10AU and V9F rebuilds, fresh warnings-as-errors F10AV compile, **all eight independent exact type elaborations**, declaration-level axiom reports excluding `sorryAx`, and retained artifact validation. Until then, the proof is a candidate.

Do not claim a source-native so(9)-to-original-so(16) LieHom from this skew-image step. Generator-level bracket, arbitrary-skew bracket preservation, full LieHom, Spin-group integration, paired-Fock Spin(48) lift, gauge/physical-domain compatibility, and BFSS spectral claims remain separate unproved obligations.

Prior unsuccessful gates #41375113865 (prefix-count validator false negative), #41376229127 (workflow serialization `$'` substitution issue), and #41376326160 (actual Lean compilation errors) remain distinct historical red evidence.
