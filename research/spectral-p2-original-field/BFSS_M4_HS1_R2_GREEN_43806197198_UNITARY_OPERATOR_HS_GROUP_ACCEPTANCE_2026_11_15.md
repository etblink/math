# BFSS M4-HS1 R2 — source Spin(9) group action on original Fock-HS operators

**Date:** 2026-11-15 Pacific / CI finished 2026-11-16 UTC.  
**Canonical active branch:** `integration/bfss-unified-research-20261108`; no side-branch merge and no `main` edit.  
**Decision:** **GREEN / QUALIFIED on exact original Fock-OPERATOR Hilbert–Schmidt fiber. NOT a physical Fock-VECTOR group action.**

## Immutable qualification

- [Strict HS1 R2 #43806197198](https://github.com/etblink/math/actions/runs/43806197198): `completed/success`, attempt 1, tested Git commit `522b8943407775037b507a45e7cd0de0a3483ce1`, job `133097442645`.
- All checkout, exact input/donor/toolchain preflight, frozen toolchain restore, genuine cold native build, separate original-Fock-HS consumer, strict axiom audit and evidence upload PASSED.
- Strict preflight marker `BFSS_M4_HS1_SOURCE_DONORS_CONSUMER_PIN_PREFLIGHT_PASS`; strict consumer marker `BFSS_M4_HS1_ORIGINAL_FOCK_HS_ISOMETRY_5_SOURCE_5_CONSUMERS_STRICT_GREEN`.
- Lean `leanprover/lean4:v4.34.1` and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold source `Build completed successfully (9180 jobs)`.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3M4HS1OriginalSpin9FockHSUnitaryGroupAction.lean`, exact Git blob `a9c7b74e358eef4a56c2ae11eca5f138842d55a8`, five declarations.
- Independent `lean/diagnostics/BFSSP3M4HS1OriginalSpin9FockHSUnitaryGroupIndependentConsumer.lean`, exact Git blob `2f615ef5d62eceb9b47d4e0bbc5b00e21bb50622`, five separate declarations.
- Strict workflow `.github/workflows/bfss-m4-hs1-original-spin9-fock-group-strict.yml`, exact Git blob `615236665b75395b663448e7c8807ea31ed8bcb8` and correct **HS1** module/target `.olean`, rather than incorrectly building parent HS0.
- **10/10 exact independent `#print axioms` reports**, only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx` or native compiler errors in the audited source/consumer logs.
- [Evidence artifact #14199390776](https://github.com/etblink/math/actions/runs/43806197198/artifacts/14199390776), size 17,513 bytes; GitHub-reported uploaded ZIP SHA-256 `52d407eb1454a2a09540e06610dfa118cb9edbf5b155a014014a739fc4949a50`. This digest was reported by GitHub; it was not independently recomputed locally.

## Precisely qualified declarations

The exact original `spinGroup source9Quadratic` acts on the correctly normed operator Hilbert–Schmidt column fiber `OriginalFockHSFiber ι`, built from `Fermion 2` and a true original orthonormal basis. The original bounded-operator carrier retains its OPERATOR norm; no replacement Hilbert structure or new Fock model has been introduced.

Source:
1. `originalSpin9FockHSFiberIsometryEquiv`: converts the already qualified source HS0 linear equivalence and inner-product-preserving isometry to a **surjective complex-linear isometry equivalence**.
2. `originalSpin9FockHSFiberIsometryEquiv_apply`: evaluation agrees with the already qualified original HS0 source action.
3. `originalSpin9FockHSFiberUnitaryHom`: a genuine **algebraic group homomorphism** `spinGroup source9Quadratic →* (OriginalFockHSFiber ι ≃ₗᵢ[ℂ] OriginalFockHSFiber ι)`, using the accepted B3 original physical-star operator automorphism action. No continuity/group-topology assertion is added.
4. `originalSpin9FockHSFiberUnitaryHom_toOperator`: exactly recovers the actual original Fock OPERATOR star-automorphism under source M2A column equivalence.
5. `originalSpin9FockHSFiberUnitaryHom_fixes_operator_one`: fixes the Hilbert–Schmidt-column image of the actual original **identity operator**. The word singlet here refers to the operator HS fiber, not the physical Fock-vector carrier.

Independent source-typed consumer:
`originalHS_group_law_consumer`, `originalHS_group_identity_consumer`, `originalHS_fockOperator_consumer`, `originalHS_unitary_norm_consumer`, `originalHS_operatorOne_singlet_consumer`.

## Negative history and repair

- [R1 #43804304851](https://github.com/etblink/math/actions/runs/43804304851) **RED** at commit `fcbb277bd37ec61b89a23d335dc16ddf67770f3f`; four source axioms passed but the fifth fixed-identity theorem failed at line 123 due to a Lean rewrite not matching the named original M2A inverse. R1 source report had `sorryAx` in that one declaration; no independent consumer compiled.
- R1 workflow also cold-built parent HS0 instead of HS1; the R2 workflow now builds **HS1** itself and checks its exact target source and consumer.
- R2 repairs only the fifth source theorem's round-trip proof body and corrects the strict cold module/target. All five theorem statements, other four source proof bodies, independent consumer and pinned original math donors remain unchanged.
- [Detailed R1 red diagnostic and exact R2 pins](BFSS_M4_HS1_CS0_R1_RED_DIAGNOSTIC_2026_11_15.md); no negative evidence erased. Historical automatic intermediate run `#43806179041` was cancelled by workflow concurrency on the subsequent corrected workflow commit; it was not a separate theorem red.

## Physics and next decision

**OPEN**: a coherent Spin(9) unitary group hom on *original Fock vectors* `Fermion 2`, implementation of all physical Majorana transforms by conjugation, correct central element and fermion parity, continuity/topology, gauge SU(2) commutation at the physical level, bosonic pullback, joint charge-domain invariance, sixteen original supercharge covariance and nonzero physical singlet. In particular the fixed **identity operator** is not an element of the underlying Fock-vector carrier.

Next choose a bounded source-exact original 48-Majorana bivector infinitesimal implementer test, or a source-local central-sign parity negative control, before attempting a full global source Spin9→Spin48 Fock-vector lift. Compare against bottom-up supercharge-square difference as a competing route. Neither the present theorem nor CS0 implies the existence of a ground state, Hardy/fidelity estimate, gap, or theory of everything.

**Provenance scope:** The acceptance document itself is a documentation-only descendant of the exact tested SHA and makes no claim of fresh strict CI on the later roadmap/receipt commit.
