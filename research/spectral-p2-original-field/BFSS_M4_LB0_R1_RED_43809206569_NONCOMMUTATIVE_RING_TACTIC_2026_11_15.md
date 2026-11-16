# LB0 R1 RED — additive CAR skewness mistakenly sent to commutative ring tactic

Date: 2026-11-15 Pacific / GitHub CI 2026-11-16 UTC. Canonical branch: `integration/bfss-unified-research-20261108` (owner: all work on unified only).

## Exact immutable evidence
- [Strict LB0 R1 #43809206569](https://github.com/etblink/math/actions/runs/43809206569) **completed/failure**, exact tested source+workflow commit `2ac81b61d96ad8535e4839a4ca49f4f42f55f054`, attempt 1, job `133106833123`.
- Preflight `BFSS_M4_LB0_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS` and Lean 4.34.1/frozen Mathlib restoration **PASS**. Genuine cold source compilation reached `[8958/8958]`; first causal failure `P3M4LB0OriginalSource48MajoranaBivectorCAR.lean:109:6`: `failed to synthesize CommSemiring FCP.BFSSSource48NormalizedFockGamma.Op`.
- The source `originalMajorana_bivector_commutator_CAR` and `originalMajorana_bivector_commutator` each printed only `propext, Classical.choice, Quot.sound`. The third `originalMajorana_bivector_skewAdjoint` printed `sorryAx` as a consequence of that failed proof. No independent consumer compiled; **whole 3+3 gate RED**.
- Adjacent linter warnings at line 95: deprecated `if_neg` and unused `zero_smul` simp arguments. Strict warning-as-error would reject these if they survive a successful cold build.
- [Preserved R1 artifact #14199289833](https://github.com/etblink/math/actions/runs/43809206569/artifacts/14199289833), size 3056 bytes, GitHub-reported ZIP SHA-256 `c2ec4b4e293d659c6f529e7745f3cb03cf829bb8346915cd59c000496879f4b0`.
- Frozen original R1 source blob `f96f407ac7abbc7c1c7077e5dadf09e9211a358c`, independent original consumer blob `7875dfc64ca1a6c56f02306bf7c35c4b11dd996d`, source donors original normalized CAR `7abc03723b3111e4a03389b722054e50d6a9bf30` and original Fock physical adjoint `98889cb8607ccc64091165fbca585acb898b9ddc`.

## Mathematical diagnosis and bounded repair contract
The Fock operator carrier `Fermion 2 →L[ℂ] Fermion 2` is a genuine **noncommutative operator algebra**; never supply a commutative ring instance or replace it with a commuting proxy. The additive group is commutative. Replace **only** the third theorem's final `linear_combination hcar` by an additive `abel` reordering and `rw [hcar]`, using the exact normalized original CAR equation `c_p c_q+c_q c_p=0` for distinct labels. Fix the two linter warnings by a source-exact simplification of the same CAR premise. Preserve all three theorem statements, first two proof bodies, original consumer, physical normalization and original indices. Update only the new source blob pin in the strict workflow and rerun exact native cold source + 3 independent consumers, with 6 standard-only axioms and no `sorryAx`/new warnings.

**Scientific status:** the triple commutator is proven under original CAR in R1 but the full native skewness/consumer gate is unqualified. The result would not itself establish a full 48×48 K(A), Spin(9) Fock-vector unitary, operator-domain invariance, gauge covariance or original supercharge identity. Preserve the R1 RED as a real proof-engineering failure and do not misrepresent it as a physics counterexample.
