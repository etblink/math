# G16 D1A R2 — GREEN_DIAGNOSTIC_QUALIFIED, not full G16

**November 15, 2026: independently reviewed strict run.** [G16 D1A R2 #43769722679](https://github.com/etblink/math/actions/runs/43769722679) completed SUCCESS at exact tested commit `bcd340435ac02763a95949c95808379df634cc66`, job `132982702846`, attempt 1. [Complete eight-entry artifact](https://github.com/etblink/math/actions/runs/43769722679/artifacts/14183888986), ID `14183888986` (17,224-byte ZIP), was downloaded and independently rehashed: `sha256:e4c56390be79de234b90ecdc15b1271b09cfef9cb169d6aff9cee53ed428e23b`. [Independent audit](diagnostics/P3_AUX_HARDY_G16_D1A_R2_GREEN_43769722679_INDEPENDENT_AUDIT_2026_11_15.json) records all eight entry hashes and proof/claim scope. GitHub retention expires November 29, 2026; the ZIP itself is not committed to Git history.

The 147-pin manifest `sha256:076c373373df18f94542fbe622331e9c8bee48622add74e0c23a2829baeb9c15` passed source closure against frozen G15 tested ancestor `4d45f9c3bd1b3b2e94c7d23e2576a8fb87a65166`; original `Core.lean` and `GammaWords.lean` hashes fixed. Native 9,069-job cold build PASS; Lean4.34.1/Mathlib `d13f23b7`; source and consumer compiled with warnings-as-errors. Each emitted the same **three new original gamma Frobenius roots plus the existing `trace_reverseWord_word` donor**, with axioms restricted to `propext`, `Classical.choice`, `Quot.sound`. Five independent native consumer examples compiled. Accepted source Git blob `3956f0a3f62164a0ae1245beb0c0f07e034e60cb` and consumer `f3e6866f90f282f19a347bc6c2ffd288f43585d0` were unchanged across R1 and R2. [R1 #43769261429](https://github.com/etblink/math/actions/runs/43769261429) remains RED due to a preflight *comment parsing false positive*, with its separate [receipt](P3_AUX_HARDY_G16_D1A_R1_RED_43769261429_PREFLIGHT_COMMENT_FALSE_POSITIVE_2026_11_15.md) and [preregistered R2 repair](P3_AUX_HARDY_G16_D1A_R2_PREREG_PREFLIGHT_COMMENT_GUARD_2026_11_15.md).

## Exact theorem scope

For **actual original** `M : AlgebraData 2` and `s,t : Finset SpaceIndex` with `s.card ≤ 4`, `t.card ≤ 4`, Lean proves

```lean
Matrix.trace ((OAI.BFSSGamma.word M.gamma s).transpose *
    OAI.BFSSGamma.word M.gamma t) = if s = t then 16 else 0
```

and the diagonal `16` and off-diagonal `0` corollaries. The proofs consume the frozen `M.gamma_symmetric`, `M.gamma_clifford`, `OAI.BFSSGamma.list_transpose`, and `OAI.BFSSGamma.trace_reverseWord_word`. The independent consumer binds them to original `pairedAlgebraData`, including a concrete singleton-vs-triple test.

This is a **qualified original-source diagnostic**, not G16 numerical coefficient integration. No theorem yet identifies literal `M.gamma k * M.gamma i * M.gamma j` with a positively ordered canonical word for all four original consecutive planes; unique triple-support indexing, generic orthogonal-family quadratic expansion, and the `originalHardyY` refolding remain separate. G16 D0 already qualified finite incidence [#43768003845](https://github.com/etblink/math/actions/runs/43768003845). G15 R4 [#43763173942](https://github.com/etblink/math/actions/runs/43763173942) remains the last qualified **full** gate.

## Next bounded research

Keep D1B and the generic orthogonal-family lemma as **separate** proof interfaces: prove source ordered-triple-to-sorted-word conversion with the consecutive-index dichotomy, and independently establish the finite Frobenius Parseval formula using abstract mutually orthogonal matrices. Only after source-typed support injectivity, rational multiplicities, and a literal native `originalHardyY` consumer compile may full G16 source coefficient identity be proposed for promotion. Preserve pointwise-versus-physical boundaries: no physical Spin(9) representation, energy/domain/Hardy, fidelity, or mass-gap conclusion.

**No G15 requalification or G16 full qualification is implied.**
