# BFSS × QIT × SCC — W0C2B0 R1/R2 STOP: original real coefficient contraction and safer complex-carrier route

Date: 2026-11-17 Pacific. **FROZEN RESEARCH DECISION: W0C2B0 R1/R2 NATIVE RED, STOPPED. NO B0 R3.**

Project Lead authority is limited to `integration/bfss-unified-research-20261108`. Keep `main`, accepted original donor bytes, and historical positive/negative evidence intact. **The last qualified gate is W0C2A R1**, original strict [#44213315719](https://github.com/etblink/math/actions/runs/44213315719), exact original provider preservation [#44216554946](https://github.com/etblink/math/actions/runs/44216554946), acceptance `7c3834651ebd328bd8b8f8f95cba64269ba6a353`, independent roadmap [#44217096057](https://github.com/etblink/math/actions/runs/44217096057) GREEN.

## Two source-exact native REDs — distinct failures, same mathematical proof architecture

### W0C2B0 R1

Original [strict #44218523669](https://github.com/etblink/math/actions/runs/44218523669), tested commit `f52bef1a52636bf51945d431c164f0f7ad28c6ce`, job `134514310717`, provider artifact `14390513069`, **NATIVE_SOURCE_RED_UNQUALIFIED**. Source blob `4846915b6d6f99e765a1ec28f9286295d7db2571`; independent consumer blob `ee6224071561e675d276e9d3a8d2bd865e87d7d6`; strict workflow blob `341b3ad5ae1b381db1ca6e297110cfd5783472a6`. Exact donor preflight and Lean 4.34.1/Mathlib restoration passed. Native errors at line 69 unclosed real sum/Matrix.mul_apply goal, line 72 unused `Finset.sum_smul` simplifier, line 98 wrong-direction `sub_smul` rewrite, line 100 recursion depth during downstream original Source48Label specialization. Real scalar commutator axiom report clean; finite-matrix contraction axiom report contained `sorryAx`; consumer never executed.

R1 provider-original three-member ZIP 20,778 bytes, SHA256 `02722db3e4d82c68bed20f980bc2f1b3400b7ed47604cc6f6463b0761d0b5ddb`, Git blob `4117bd19a0a8d1614df176e72d69a9b628de19da`; full original 333,680-byte Actions job log SHA256 `45b35f48b127d04d0d28e81b3b2aa03466ae589288b35223fba8f33b67797616`, Git blob `6736a0b404bc31eaa4b7bae58ff78d0bd0b232f7`; member SHA/CRC manifest Git blob `ba36b8a4862ca4d0931d9dac86761a893a3e48ac`. Independently preserved by [#44221612711](https://github.com/etblink/math/actions/runs/44221612711) GREEN, archive commit `23938ab8ff6fe7e8f3195259ec580966daa086fc`.

### W0C2B0 R2

Original [strict #44222678258](https://github.com/etblink/math/actions/runs/44222678258), exact tested commit `105086fe87d17f79f75641878a6b9218db05167d`, job `134528155435`, provider artifact `14391499234`, **NATIVE_SOURCE_RED_UNQUALIFIED**. Source blob `0a75a24387c2a50f14ed5698575cf2c670a864c1`; consumer blob `cc03e80af0573315f07a5d079c177a8ad279c559`; strict workflow blob `0d68b23bc98aef28870d050397e02d02af26e6bb`. Source-exact original donor and prior RED preflight passed; pinned toolchain passed. The added two PRIVATE real-to-complex helper proofs did not close their own casted rewrite goals: `map_sum` failed to match at line 56, `Finset.sum_smul` failed to match at line 58, and `map_sub` failed to match at line 74. The dependent original 48-label specialization hit recursion depth at line 144. The scalar commutator theorem remained axiom-clean, but matrix contraction printed `sorryAx`, independent consumer never executed. **Do not reclassify this as only a setup failure; it is the second analogous native failure.**

R2 provider-original three-member ZIP **20,434 bytes**, SHA256 `9f7c56be541406843d1b5556c687f0500a4bb8112fc65867559f16fc70fff266`, Git blob `3f15c1c8bcf0e057e3de2055abc6ec00e8b931ec`; complete original **333,135-byte** Actions transcript SHA256 `bffab9a103f67d8c3080be2a39124c5e68bc2a65502ab9ddb1e04daaa301ed46`, Git blob `d20cb3c7e2239fd63922a1afb70b86e2e8734088`; per-member SHA256/CRC manifest Git blob `850033634128dc24705404a5b086c3fbda3725e1`. Independently rehashed and Git-pinned by [#44224922749](https://github.com/etblink/math/actions/runs/44224922749) **GREEN**, original evidence commit `68b349ce9b79af1e9286a743df8737455d636495`.

## Mathematical interpretation and stop rule

The coefficient contraction identity is mathematically standard, and neither failed run supplies a counterexample. The recurring operational failure is an unstable interface: **real coefficient scalar action on a complex-linear original Fock operator**, casted finite sums, `Matrix.mul_apply` normalization, and downstream original 48-index specialization were all unfolded in a single source module. Both attempts exhausted native proof/elaboration resources in that layout. It is unsafe to treat unproved helper lemmas or independently untested consumer declarations as reusable qualified facts.

**Stop `P3-M4-W0C2B0` current real-coefficient proof architecture. No R3. No elevated `maxRecDepth`, `maxHeartbeats`, warning suppression, `sorry`, new axioms, or substitution of the physical source.** A different smaller mathematical architecture may be proposed and separately vetted; that does not retroactively qualify R1/R2.

## Prospective alternative: W0C2B0M — original complex-operator *microgate*

The accepted original operator carrier `Op := Fermion 2 →L[ℂ] Fermion 2` is already naturally an `ℂ`-module. The qualified **QTC0C** [#44016807302](https://github.com/etblink/math/actions/runs/44016807302), source `P3M4QTC0CAbstractCoefficientContraction.lean`, Git blob `9448c9a47c605cb6aba2cfc798ae28a0213c9411`, proves finite-index contraction of **complex scalar** coefficients on arbitrary complex modules. Qualified **QTC0D** [#44018395393](https://github.com/etblink/math/actions/runs/44018395393), source `P3M4QTC0DOriginalFockThinTensorAdapter.lean`, blob `e52b8ca7a440e04ab3c3a93187e5100daa39e074`, demonstrates original Fock module specialization without changing the operator model. Qualified **QTC0A** source complex-scalar commutator helper `originalFock_commutator_complex_smul` remains available.

**First proposed gate:** prove the coefficient multiplication/sum reindexing on the **actual original Fock Op but only over `ℂ` coefficients**, in a small independent Lean module with 1–2 statements and consumer. Do not introduce `A,B : Matrix Source48Label Source48Label ℝ` or the `Source48Label`-specific gamma family in this first module; test the finite-index complex-module algebra separately. The abstract QTC0C result may be imported as a donor, but its specialization to the actual Op must be explicit in the independent consumer.

**Second proposed gate:** a separately tested thin original real-to-complex coefficient adapter: given `A,B : Matrix Source48Label Source48Label ℝ` and original `γ`, make the complexified coefficient matrix and its `Matrix.mul_apply` identity explicit via small typed normalization lemmas, and only then compare the original `ℝ`-smul to `ℂ`-smul using the already-qualified scalar bridge. Prove each equality without carrying a large `calc` expression across an entire source48 specialization.

**Third prospective gate:** combine the source-exact LB1C1 covariance with that separately qualified coefficient adapter to prove `∀k, Commute (D(A,B)) (sourceNormalizedGamma k)` without unproved QTC1/CT1 experimental adapters. **Final W0C2B2** would then apply the existing qualified W0C2A conditional defect-zero theorem.

The candidate microgate is `P3-M4-W0C2B0M`, **PROSPECTIVE_NOT_STAGED**. No source/consumer/workflow exists or is qualified. Decide its contract and explicit original source imports separately before any strict run.

## Claim ceilings

Accepted original W0C1 R2 and W0C2A R1 remain intact. **`full_bivector_bracket_qualified=false`**. No unconditional original Lie-bracket theorem, global Spin(9), physical gauge/parity-admissible witness, BFSS ground state or mass gap, BMN spectral transfer or SCC operational capacity is proved by these REDs.

**Owner/research principle:** preserve both failures and the failed proof architecture as reproducible negative knowledge; do not abandon the mathematical goal.
