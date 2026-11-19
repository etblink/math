# RHOPF-P9A0 R2 — exact native strict GREEN acceptance

**Project Lead checkpoint (US Pacific):** 2026-11-18  
**Accepted strict run:** [#44464409223](https://github.com/etblink/math/actions/runs/44464409223)  
**Exact tested commit:** `7ce988d6fa44330dc436aa94c2750d33de07bf4f`  
**Qualification:** **ACCEPT R2 GREEN**, preserve R1 RED.

## Verification

The exact-source preflight and independent original gamma signed-permutation consumer passed. Pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` were restored. The original source gamma module compiled (8925 jobs), and both the new bounded Lean module and separate Lean consumer compiled under `-DwarningAsError=true` without errors.

**Ten original source Lean theorems** were checked in both native and independent consumer axiom reports: `originalGamma_sq`, `originalGamma_anticommute`, `originalGammaPair_sq_neg_one`, `originalGammaPair_skew`, and the six instantiated square/skew identities for `K13`, `K25` and `K46`. The proof dependencies contain only `propext`, `Classical.choice` and `Quot.sound`; no `sorryAx`.

The retained original GitHub Actions artifact [#14500854262](https://github.com/etblink/math/actions/runs/44464409223/artifacts/14500854262) was downloaded and its ZIP digest `c756f70cb3f589917bf1baf9cb8e6cc8001eccadaa8ceff8493d3cdc848334f8` compared exactly with the digest reported by GitHub. It contains the tested commit file, source original-gamma build log, native and independent Lean axiom logs, independent signed-permutation consumer JSON, and toolchain digests. Individual file digests are retained in the paired JSON ledger.

**Native Lean module blob:** `bf5eb554232a6d452e86d85b05220aad7c5d0aeb`. **Original gamma blob:** `b9b8192055c70f0d001d7982669b9823c55562ed`. Original BFSS/Fock source files remained unchanged.

## Negative knowledge retained

R1 [#44463306244](https://github.com/etblink/math/actions/runs/44463306244) remains **RED** at exact commit `db0678aec909db0c6ccb23970649691fe095328c`, with retained artifact [#14501122874](https://github.com/etblink/math/actions/runs/44463306244/artifacts/14501122874). R1 failed on a deprecated `if_neg` simplification and two `No goals to be solved` errors after valid goal-closing rewrites. R2 repaired the proof tactics only; no theorem signature was changed.

**What this green actually proves:** Original BFSS Spin(9) gamma bivectors satisfy source-exact Clifford square and skew identities. It does **not** prove as native Lean theorems that `Γ1Γ3`, `−Γ2Γ5` and `−Γ4Γ6` induce the same common phase on the four-real Hopf subcarrier; the independent finite-coordinate consumer checked those identities but they remain a separate P9A1 qualification. It also does not prove a physical Fock-vector Spin(9) implementer, conserved Noether operator, Hamiltonian domain, vortex particle, proton or Standard Model charge.

## Decision and next bounded gate

**P9A0 accepted.** Prioritize a *small* P9A1 original-source coordinate comparison. The source already contains an exact finite signed-permutation construction and qualified 36-bivector trace/linear-independence lemmas; reuse those rather than reproduce a large matrix proof. First qualify the common action on indices 0,1,8,9, then independently demonstrate full-generator inequivalence. Apply the same strict source-hash, independent consumer, axiom and artifact controls. No full BFSS physical Hamiltonian or speculative particle fields should enter this initial gate.

**Governance:** Preserve original BFSS source, FCP main, rejected NFC forced Hopf tower and the Standard Model program as separate evidence tracks.
