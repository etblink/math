# BFSS × QIT × SCC — W0H1A R2 bounded original centralizer definition-unfold repair

2026-11-17 Pacific. **FROZEN R2 PRE-GATE CONTRACT — UNQUALIFIED.** The original W0H1A R1 native source RED is preserved. R2 uses a **separate source file, independent consumer file and new strict workflow**, avoiding unintended retrigger or mutation of the R1 source/CI. Do not stage W0H1B until a separately strict GREEN W0H1A gate with complete archived provider evidence.

## Exact preceding original RED and qualified donors

- Native original W0H1A R1 [run #44145848122](https://github.com/etblink/math/actions/runs/44145848122) **RED**, job `134260618792`, tested commit `4e04deec085de52ac1e55e7265e3463788893d3a`. Original source blob `a4c6a2d8006cdd151b72995bb35313c5f2299d57`; independent consumer `8e0e457e2d781737f09ef7b7e48a9a142d51a4e0`; original strict workflow `95fdaea744514d567bdf4da471adb4c15c5650a0`. Preflight and Lean/Mathlib restoration passed; failure occurred at original source line 44 before any source-axiom standalone or independent consumer report. Lean: `Tactic rewrite failed: Did not find an occurrence of the pattern` because `rw [Subalgebra.mem_comap, Subalgebra.mem_centralizer_iff]` did not unfold the named `originalSourceCentralizerPullback T` in the target. The error produced `sorryAx`; proof R1 **unqualified**.
- Original 13,910-byte three-member provider RED ZIP SHA-256 `ef701824430dc78c70d4bd049e013a30a1a09df447e44e6b1a6dc5231fafcd43`, Git blob `0240463e97836e347a5423999e6832dfcf81e2cf`, exact path `research/quantum-information/diagnostics/BFSS_M4_W0H1A_R1_44145848122_SOURCE_RED_evidence.zip`. Full original 235,899-byte Actions job log SHA-256 `200c0ffcc2daa07d45397e17aaa53be6d6fd5d550279dc418d074b2c4c96db05`, blob `135b2d53ad7e64f4cc6c516c4c80fba002181a7b`. Original manifest blob `33b4c47ba4a0ebec35a408794ce1a96607cc16e2`. These were independently rehashed and pinned by [preservation #44148961842](https://github.com/etblink/math/actions/runs/44148961842) GREEN. First archiver #44148751105 RED was a literal-backtick match error in preservation harness only; corrected without changing original source or provider bytes.
- Last accepted source-exact gate W0H0 R1 [strict #44139239821](https://github.com/etblink/math/actions/runs/44139239821) GREEN (original source `7555f5e17d9f465c1e4b7b04ffc450eb1667fc13`, original provider ZIP `ffbd66e56aff83031aece2c3b310ed34678bdd9f`, preservation #44142635149 GREEN). Original W0B0 R2 generator [strict #44109519633](https://github.com/etblink/math/actions/runs/44109519633) GREEN, unchanged.
- Both stopped original W0B1 R1 RED #44117272657 and R2 RED #44127193329 remain preserved, no W0B1 R3, no dependency on their failed source. W0G0 generic GREEN and W0A4 STOP historical evidence untouched.

## Only bounded mathematical change

R2 must keep the exact original theorem statement, unchanged definitions, original qualified donor imports and original `Fermion 2` Fock carrier. Use the exact same `originalSourceCentralizerPullback` definition and `originalGenerator_mem_sourceCentralizerPullback` target in a separate `P3M4W0H1AOriginalGeneratorCentralizerComapR2.lean` module.

Replace the failed rewrite **only** with an explicit definitional view:

```lean
  change
    FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w) ∈
        Subalgebra.centralizer ℂ ({T} : Set Op)
  rw [Subalgebra.mem_centralizer_iff]
  intro g hg
  have hgt : g = T := Set.mem_singleton_iff.mp hg
  subst g
  exact (originalComplexEquiv_generator_commutes T h w).eq
```

The `change` elaborates via the original `Subalgebra.comap` definition rather than forcing the rewrite matcher to synthesize an occurrence through the named definition. This is a **hypothesized bounded repair until native strict Lean CI**; do not claim the new source theorem proved before source+independent consumer GREEN.

The separate R2 independent consumer imports **R2 only**, restates the same exact original theorem and checks `w=0` and `w=1⊗ₜ[ℝ]v` original controls, exactly 1 source / 1 consumer `#print axioms`, six negative auditor mutations, pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, no `sorry`, no `maxHeartbeats` or `maxRecDepth` adjustments.

## Archive, qualification and stopping rule

New R2 strict CI preflight verifies exact original R1 source, consumer, workflow, original RED ZIP and complete original log Git blobs; original W0H0, W0B0 original GREEN evidence and W0B1 R1/R2 stopped original native REDs stay pinned. Archive the original provider R2 ZIP, full Actions job log, member hashes and manifest, preserve both outcomes. One new native source failure at the same pullback/interface boundary makes **two analogous native W0H1A failures** and triggers an architecture STOP; no R3 cosmetic retry. If R2 GREEN, promote only after independent consumer and axiom checks, six negative mutations, preserved archive and independent roadmap guard; W0H1B remains prospective.

No W0B1 proof, full Clifford commutant, W0B2 scalar Schur commutant, W0C trace, W0D parity/gauge or physical BFSS conclusion is admitted by staging this repair. Work only on `integration/bfss-unified-research-20261108`; `main` untouched.
