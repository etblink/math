# BFSS M4-LB0 R3 — original 48-Majorana bivector CAR and skew-adjointness strict GREEN

**Local date:** 2026-11-15 (America/Los_Angeles); GitHub run completed 2026-11-16 UTC.  
**Canonical active branch:** `integration/bfss-unified-research-20261108` (owner directive: no new branch/PR; `main` untouched).  
**Acceptance decision:** **GREEN / QUALIFIED** for three original normalized CAR bivector source theorems and three independent source-typed Fock consumers. Full summed `K(A)`, a `Spin(9)` Fock-vector group action, common physical supercharge domain and spectrum remain UNPROVED.

## Exact immutable strict qualification

- [M4-LB0 R3 strict #43811766549](https://github.com/etblink/math/actions/runs/43811766549), `status=completed`, `conclusion=success`, attempt 1, original tested commit **`a0279b211a81922b17bff24c735bc1c4569f80f0`**, job `133114794624`.
- All steps succeeded, including pinned-source/donor/toolchain preflight, Lean/Mathlib restore, cold build of the **actual LB0 module**, independently imported original-Fock consumer, strict standard-axiom audit, and artifact upload.
- `BFSS_M4_LB0_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`, `Build completed successfully (8958 jobs)`, and final audit marker `BFSS_M4_LB0_ORIGINAL_FOCK_HS_ISOMETRY_3_SOURCE_3_CONSUMERS_STRICT_GREEN`. Note: the inherited marker contains an old cosmetic `FOCK_HS_ISOMETRY` phrase, but the audited module, actual `.olean`, six theorem names, and independent consumers are strictly the **original Source48 Majorana bivector CAR** workstream. It does not certify an HS isometry result.
- Tested Lean `leanprover/lean4:v4.34.1` and frozen Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4LB0OriginalSource48MajoranaBivectorCAR.lean` immutable Git blob **`d08200fae8ef6c9c9544414307ad537f1eeaa4a4`**.
- Independent `lean/diagnostics/BFSSP3M4LB0OriginalSource48MajoranaBivectorCARIndependentConsumer.lean` immutable Git blob **`7875dfc64ca1a6c56f02306bf7c35c4b11dd996d`**; untouched through R1–R3.
- Exact strict workflow `.github/workflows/bfss-m4-lb0-original-source48-majorana-bivector-strict.yml` Git blob `71b18b2046480e5412188def84e9441794b3eb9f` with correct LB0 cold module and `.olean`.
- Pinned original donor CAR `SU2BFSSSource48NormalizedFockGammaProbe.lean` blob `7abc03723b3111e4a03389b722054e50d6a9bf30`; donor actual Fock Hilbert-adjoint `SU2BFSSSource48FockGammaSelfAdjointProbe.lean` blob `98889cb8607ccc64091165fbca585acb898b9ddc`.
- **3 source + 3 independently compiled consumer `#print axioms` reports**, all six with only `propext, Classical.choice, Quot.sound`. No `sorryAx`, no Lean compiler errors and no non-allowlisted source/consumer warnings under warning-as-error. Benign `.lake/packages` local-change warnings from cache restore are distinct from source compiler warnings and handled by the strict workflow.
- [Artifact #14200957362](https://github.com/etblink/math/actions/runs/43811766549/artifacts/14200957362), size 3,223 bytes; GitHub-reported ZIP SHA-256 `2783922bbc50b81dbac8b6fa4a957dd02bb6af07c78c9ca81d514068638e5332`. The digest is the provider-reported upload value, not an independently rehashed downloaded ZIP.

## Precisely proved mathematics

Write `c_p := sourceNormalizedGamma p : Fermion 2 →L[ℂ] Fermion 2`, where `Source48Label` uses the **original 24×2 paired Majorana order**. These original operators are `sqrt 2` normalized, self-adjoint, square-one and satisfy genuine CAR, with a noncommutative Fock-operator multiplication and genuine Hilbert adjoint.

Qualified original source declarations:

1. `originalMajorana_bivector_commutator_CAR` — exact original triple operator commutator as two delta-dependent scalar identity summands.
2. `originalMajorana_bivector_commutator` — normalized original commutator:
   `(c_p c_q)c_k-c_k(c_p c_q)=2δ(q,k)c_p-2δ(p,k)c_q`.
3. `originalMajorana_bivector_skewAdjoint` — for **distinct** `p≠q`, the **physical Fock adjoint** satisfies `star (c_p c_q) = -(c_p c_q)`.

Independent consumers `originalFockCAR_bivector_raw_consumer`, `originalFockCAR_bivector_coeff_consumer`, `originalFockCAR_bivector_skew_consumer` retype these three theorems against the real original `Fermion 2` Fock-operator carrier. No substitute matrices, changed anticommutators, shifted coefficient or surrogate source labeling.

## Negative-knowledge record and bounded R3 resolution

- [R1 RED #43809206569](https://github.com/etblink/math/actions/runs/43809206569), exact tested `2ac81b61d96ad8535e4839a4ca49f4f42f55f054`: original two CAR commutators clean, third proof failed at line 109 because `linear_combination` demanded a **commutative semiring** on the actual noncommutative Fock operator algebra. [Full R1 diagnosis](BFSS_M4_LB0_R1_RED_43809206569_NONCOMMUTATIVE_RING_TACTIC_2026_11_15.md).
- [R2 RED #43810371539](https://github.com/etblink/math/actions/runs/43810371539), exact tested `df5cc2f31135b5e0108716497c1b38d25bb0b80b`: replacing the noncommutative-algebra misuse with additive `abel` succeeded as a strategy, but the local CAR zero equality failed because Lean did not identify `(0 : ℂ) • (1 : Op)` with the operator zero. [Full R2 diagnosis](BFSS_M4_LB0_R2_RED_43810371539_ZERO_SMUL_NORMALIZATION_2026_11_15.md).
- R3 changed **only** that local CAR normalization proof, explicitly splitting the equality into `(0:ℂ) • 1` and `zero_smul ℂ 1`; retained all three theorem statements, first two proofs, final additive `abel` proof and three original independent consumers. All original R1/R2 red artifacts and source hashes remain documented. No proof added `sorry`, an axiom, an inappropriate commutative multiplication instance or altered normalizations.

## Next bounded research gate (separate, not yet qualified)

Only now that LB0 is **3+3 genuinely green**, consider a finite original **real-skew 48×48** matrix `A` and define
`K(A)=(1/4)∑_(p,q) A[p,q]•(c_p*c_q)`, or the explicitly equivalent skew-antisymmetrized form `(1/8)∑ A[p,q]•(c_p*c_q-c_q*c_p)`. Both require a source-exact finite-sum equality for skew `A` before interchange. The next source obligations are:
- `K(A)†=-K(A)`, using the actual original physical Fock Hilbert adjoint, real skew coefficients and/or the antisymmetrized operator sum.
- `[K(A),c_k] = ∑_p A[p,k] c_p`, derived from the now qualified LB0 triple-CAR identity with **1/4 fixed by source normalization**.
- Only afterward: Lie-bracket preservation and original `so(9)→so(16)→so(48)` source transport; separately evaluate coherent global Fock-vector group action, central element `-1` parity consistency, bosonic pullback, gauge commutation and physically invariant original sixteen-charge domains.

The mathematical assertions just listed are **prospective**, not part of the LB0 GREEN certificate. No spectral gap, physical ground-state existence, Hardy/fidelity estimate or theory-of-everything claim follows. The original operator-HS Spin9 group GREEN HS1 and central-sign GREEN CS0 remain distinct qualified results.

**Acceptance provenance:** the evidence and roadmap records are documentation-only descendants of the exact tested R3 commit. The repo has not claimed a fresh combined-tree strict CI for a later documentation commit.
