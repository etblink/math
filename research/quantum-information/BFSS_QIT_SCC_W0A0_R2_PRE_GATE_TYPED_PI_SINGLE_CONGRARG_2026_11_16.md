# BFSS W0A0 R2 — typed Source48Vector Pi.single transport repair, pre-gate contract

Date: 2026-11-16 Pacific; **contract precedes R2 source modification**. Unified branch only. R1 [#44033364617](https://github.com/etblink/math/actions/runs/44033364617) strict RED (source line 38:18 type mismatch) is recorded in `research/quantum-information/BFSS_QIT_SCC_W0A0_R1_RED_44033364617_TYPED_PI_SINGLE_2026_11_16.md`. Last qualified is QTC1G0 [#44024718712](https://github.com/etblink/math/actions/runs/44024718712).

## Scope frozen

Preserve exactly one theorem with the original statement and name `originalComplexEquiv_allLabelAxis_eq_activeGamma`, its sole independent consumer theorem, both controls, the actual `Source48Label` and `Fermion 2` carrier, qualified M3I and OP3-A2 sources, pinned toolchain, and approved axioms. Change only the local `haxis` proof fragment to a *typed* `congrArg` over `Pi.single` and `Source48Vector`, followed by `simpa only [sourceBlockColorAxis]`. This prevents implicit dependent family ambiguity without expanding any Fock operator or Clifford terms.

Exact replacement fragment:
```lean
  have haxis : sourceBlockColorAxis q.1 q.2 =
      Pi.single p (1 : ℝ) := by
    simpa only [sourceBlockColorAxis] using
      congrArg (fun t : Source48Label =>
        (Pi.single t (1 : ℝ) : Source48Vector)) hlabel
```

Preflight must enforce frozen consumer Git blob `c58f6d3e49bbcb4b7d2c88a08f57f7e07b61ce63`, original M3I blob `754a5f2a13baea90312f6031eb8fa7963dbdf42b` and original OP3-A2 blob `a9db27fc28379b35ca85515d733cc0bc43376592`, unchanged Lean 4.34.1/Mathlib. Strict source and consumer `#print axioms` must contain no `sorryAx`, only `propext`, `Classical.choice`, `Quot.sound`, with two independent consumer controls and six negative auditor mutations. Preserve original R1 artifact digest, complete log and causal receipt; a new R2 CI GREEN does not qualify until provider-original archive rehashed and accepted.

No extra theorem, no W0 witness completeness claim, no native QTC1/CT1 restart, no recursion/heartbeat budget escalation. An analogous R2 dependent-type failure triggers source-architecture stop instead of R3.
