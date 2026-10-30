# Project Lead — V8A Gate 1 strict-red diagnostic (2026-10-30)

**State:** immutable failed-attempt record. No theorem acceptance. No prior accepted module modified.

## Exact recorded run and failed gate

- Original Gate 1: [run #41137852252](https://github.com/etblink/math/actions/runs/41137852252), job `124344621413`, tested commit `36a2736a59566742ace408ed2420cd6969225609`; `failure` on candidate **fresh Lean compilation**, so independent type/axiom audit was **skipped**.
- Exact artifact ID **13017159857**, named `bfss-v8a-paired-spin9-plane-36a2736a59566742ace408ed2420cd6969225609-1`, digest `sha256:d8eae69afac7f35a17a4a7a1f198bf466904a0e56c360ffeec0c58c3ac8dd8ee`.
- Source/toolchain SHA pins, pinned Lean/Mathlib restoration, and original gamma/paired-label ancestors **all passed**. Source uses the exact original `pairedLabelEquiv`, `FCP.BFSSGamma9.gamma`, and original Source48Label. No environment or proof-limit escalation.
- First causal Lean error at `SU2BFSSPairedSpin9PlaneGeneratorProbe.lean:72:17`: `unexpected token 'ᵀ'; expected ':=', 'where' or '|'`. Other syntax errors at 96:66 and 137:29 have the same postfix transpose notation cause. Later `Unknown constant originalPairedPlane_transpose` was downstream of its rejected declaration.
- The distinct **square theorem** successfully emitted `'FCP.BFSSPairedSpin9Plane.originalPairedPlane_sq' depends on axioms: [propext, Classical.choice, Quot.sound]` within the failed module. This is **not** full strict qualification: the module had errors and the independent declaration audit was skipped.

## Bounded recovery and rationale

- Repair commit `0eb5a2930d5e7ff10ade37f1935176837ff18c9e` changes **only** all twelve occurrences of unsupported `ᵀ` postfix notation to explicit `.transpose` syntax, leaving declaration mathematical statements, original gamma and paired-label data, and resource limits unchanged.
- New strict Gate 2 [#41138786968](https://github.com/etblink/math/actions/runs/41138786968), tested source commit `0eb5a2930d5e7ff10ade37f1935176837ff18c9e`; **PENDING** at the writing of this record. Do not infer acceptance until its entire strict gate completes.
- Lesson: source-exact algebra is not source-exact syntax. Avoid introducing unverified postfix notation in a new standalone module. A first-error parser failure must be addressed before changing mathematical proof strategy. Do not raise resource limits or weaken proof statements for grammar errors.

**Exclusions:** Neither Gate 1 nor this note asserts continuous Spin(9)→Spin(48), a topological double cover, a global Fock action, gauge invariance, or spectral claims.
