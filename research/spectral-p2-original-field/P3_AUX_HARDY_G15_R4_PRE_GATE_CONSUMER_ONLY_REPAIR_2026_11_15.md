# G15 R4 — preregister consumer-only recovery

**REGISTERED_NOT_EXECUTED**, November 15, 2026. This contract must be committed before changing code. Base branch `integration/bfss-unified-research-20261108`; G15 R3 pre-R4 HEAD `5a8146ad5975a6089d17de6697e9619f86242f6b`. R3 [RED receipt](P3_AUX_HARDY_G15_R3_RED_43759253590_CONSUMER_ONLY_DIAGNOSIS_2026_11_15.md), [run #43759253590](https://github.com/etblink/math/actions/runs/43759253590). G14 #43749092953 remains accepted full gate; D0 #43756234296 remains diagnostic only. R3 source blob `1a6765a57f4dcea2a1d7f05ac5d37dbbade9bdfc`, consumer blob `7e873eae9001339a0f746637b9ac906311ec106b`, workflow blob `c7d5518d1c5d24065ca9f3bd6c3b29d1be8d0744`, accepted D0 generic helper blob `732cee2546bfd629fe8bf0b20e63ac3ef356b5bd`.

## Permitted changes only

1. In `lean/diagnostics/BFSSP3AuxHardyG15OriginalTauCoefficientNormReductionIndependentConsumer.lean`, replace the zero-vector example's `simp only [map_zero, norm_zero, zero_pow, Finset.sum_const_zero]` by ordinary `simp`. Whether this proves the target must be established in strict Lean.
2. Rename **only** the two unused `t` binders in the constant `Fin 4` sums of the ninth native example to `_t`. The two mathematical terms remain alpha-equivalent.
3. Update only the G15 workflow's pinned **consumer blob SHA** in `EXPECTED` (and any strictly necessary consumer-delta check). Retain all other 170 pin expectations, original source closure, six source declarations, D0 helper, donor roots, twelve consumer controls and report lists, permitted axioms `propext`/`Classical.choice`/`Quot.sound`, original cold build and time/resource limits, Lean4.34.1 and Mathlib `d13f23b7`, `autoImplicit=false` and `warningAsError=true`.
4. Change checkpoint, roadmap, static receipt and evidence docs only to reflect accurately the result. No source modifications, additional imports, warning suppression, introduced axioms, new physics claims or edited source proofs.

## Static admissibility before full CI

Compare complete consumer R3 vs R4 after reversing the exact three allowed edits; reject all other byte drift. Require exactly two original imports, all twelve `example` controls and twelve `#print axioms` roots, retained paired data, zero/origin and four-plane cross-term controls, and no `sorry`, `admit`, `unsafe`, unapproved axioms, recursion/budget increase. Recompute and bind actual Git consumer blob and verify workflow changed only the one expected SHA; validate YAML/Python and the closure. Use negative mutation probes to ensure edits cannot bypass the frozen limits.

## Strict R4 qualification contract

Run fresh strict GitHub CI at exact tested SHA: 170 pins; repair-helper2 + helpers1+3+1 PASS; cold original 9,092-job build, native source6 and consumer12 PASS, all expected 12 donor/new reports with allowed axioms, zero Lean errors or prohibited warnings, scope receipt and full evidence artifact. Independently verify exact tested ancestry, artifact SHA and per-entry evidence. Only after that may G15 be GREEN_QUALIFIED for original tau/Fock norm and four-plane real-coefficient norm reduction with cross terms. No numerical coefficient bound, physical Spin(9), domains/energy, Hardy, fidelity, zero-mode/gap or trial-witness conclusion follows.

On RED preserve first-causal evidence and stop for diagnosis; do not rerun unchanged or enlarge budgets.
