# P3-M2C1 R1 — first-causal RED and bounded original source carrier repair

Recorded 2026-11-12 Pacific / 2026-11-13 UTC. **R1 RED; M2C1 UNQUALIFIED.**

[Strict R1 #43378870092](https://github.com/etblink/math/actions/runs/43378870092) tested `a30d77b715ef7a11861ce3c65529f629f4bf45aa`, job `131731708253`. The exact first causal failure was `AssertionError: Boson 2` in Python preflight, **before Lean or pinned Mathlib restoration**. The independent consumer referred to the correct `OriginalFockOperatorLp` alias without explicitly expanding its `Boson 2` base, while the preflight required that literal source-carrier check. This is not a theorem counterexample.

Failure artifact `14014689572` (189 bytes), digest `sha256:99bf4ec0215c9fb55401f80e53a9ec07099570ac0375b4261587325ce41cfd89`.

R2 repair: add exactly one independent Lean example
```lean
example : OriginalFockOperatorLp =
    Lp (Fermion 2 →L[ℂ] Fermion 2) 2
      (volume : Measure (Boson 2)) := rfl
```
proving the alias is the *actual original operator-norm* L² on Boson 2. Raise consumer example preflight count 6→7. Keep the **96 unique pins**; update only its consumer SHA, leaving the other 95 exact pins unchanged, notably M2C1 theorem blob `1b528ed3921173a00725ebf23507b24a63a872be` and every previously qualified ancestor. No relaxed preflight or theorem change.

A new R2 strict cold Lean/consumer/axiom run is required. R1 remains RED and cannot qualify the mathematical claim.
