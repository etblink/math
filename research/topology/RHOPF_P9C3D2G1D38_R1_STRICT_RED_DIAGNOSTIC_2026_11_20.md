# RHOPF-P9C3D2G1D38 R1 — original Gamma9 Q normed-group strict RED retained

**Pacific date:** 2026-11-20. **Disposition:** REJECTED_NATIVE_RED.
**Original run:** [#44870317438](https://github.com/etblink/math/actions/runs/44870317438), attempt 1 failure, job `136743148395`, exact tested SHA `580786d1e7c09fb5b43824f9fde9e8e62ba53bcd`, canonical branch `integration/bfss-unified-research-20261108`.
**Original artifact:** [#14694191748](https://github.com/etblink/math/actions/runs/44870317438/artifacts/14694191748). Independently computed original five-file ZIP SHA-256 `6002e0b8c3e03ebc37ff75e0b1baf83258162b432ea641caaee59d15a0044674`, matching GitHub metadata and original CI uploader, embedded tested commit verified.

## Provenance and precise error
- Frozen original Gamma9/P/J/Circle and all accepted ancestor source hash preflight PASS; source-independent signed-permutation original Gamma9 integer fixture PASS.
- Exact Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS; accepted dependency build **9,085 jobs** PASS.
- Native D38 **RED** at `.../RHOPFP9C3D2G1D38OriginalGammaSourceQNormAndNormedGroup.lean:81:8`:
  `typeclass instance problem is stuck: InnerProductSpace.Core ?m.7 RelationalSourceComplexFour`.
- Specifically, `InnerProductSpace.Core.toNormedAddCommGroup` is overloaded in its scalar type; Lean could not infer `𝕜 := ℂ` from the expected `NormedAddCommGroup` result.
- First five native D38 norm-related declarations carry only `propext`, `Classical.choice`, `Quot.sound`; the sixth `relationalSourceComplexFourNormedAddCommGroup` includes `sorryAx` from the failed elaboration. Independent imported consumer SKIPPED. No D38 declarations accepted.
- Original archive contains `exact-tested-commit.txt`, `independent-original-integer-consumer.json`, `native-original-q-norm-and-normed-group-and-axioms.log`, `qualified-original-dependency-build.log`, `toolchain-sha256.txt`.

## Bounded R2 recovery
Explicitly fix scalar and carrier in the existing call, `InnerProductSpace.Core.toNormedAddCommGroup (𝕜 := ℂ) (F := RelationalSourceComplexFour)`, while retaining local `InnerProductSpace.Core ℂ RelationalSourceComplexFour`, same source-Q length, every theorem statement, original Gamma9, accepted D1–D37, independent consumer and original R1 failure. Update exact D38 source blob pin in strict workflow. Require native and imported independent warnings-as-errors, 6+6 allowed axiom reports and original ZIP SHA256/embedded tested SHA verification to qualify R2.

No global normed space, complex inner-product-space instance, Q-isometric ℂ² frame, classical Hopf circle/quotient/Chern charge or physical BFSS Fock/Gauss/Hamiltonian/hopfion result is implied.
