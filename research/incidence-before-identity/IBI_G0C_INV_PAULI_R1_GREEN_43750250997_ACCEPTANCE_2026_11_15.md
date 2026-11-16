# IBI-G0C-INV-PAULI R1 — strict GREEN acceptance receipt

**Decision date:** November 15, 2026 (Pacific)
**Research branch:** `research/bfss-incidence-unified-20261114`
**Accepted scope:** exact original BFSS SU(2) matrix inverse/star and Pauli inverse-trace interface.
**Not accepted:** source-to-QICLean GL(2) lift, external QICLean proof dependencies, SO(3) surjectivity, SU(2) kernel {±1}, global bosonic orbit reconstruction, physical/Fock operator equivalences or spectral results.

## Reproducible green evidence

- [GitHub Actions run #43750250997](https://github.com/etblink/math/actions/runs/43750250997): `completed/success`, push, attempt 1, exact tested commit `e0521165ace49ab390f54fd527762c07300af558`.
- [Job #132922402694](https://github.com/etblink/math/actions/runs/43750250997): all required steps `completed/success`, including exact frozen pin preflight, Lean/Mathlib setup, cold native proof build, strict source + consumer and axiom audit, and evidence archive.
- Native source module `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CInversePauli.lean` Git blob `3b6faa5aa1300cae29afbf11ef57e11abc865b0a`.
- Separate consumer `lean/diagnostics/BFSSIBIG0CInversePauliIndependentConsumer.lean` Git blob `65b082f066c13721746f60c95307bae5e2779ca1`.
- Strict workflow `.github/workflows/bfss-ibi-g0c-inverse-pauli-strict.yml` Git blob `2ae38f8b79d4a9924241ebeb65f1f1e5faf220f2`.
- Verified frozen parent `IBIG0CPauliTrace.lean` blob `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`, already qualified in [run #43748016863](https://github.com/etblink/math/actions/runs/43748016863).
- Toolchain `leanprover/lean4:v4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, no updates.
- Cold native build finished `9017/9017`; separate warning-as-error source compile `-DautoImplicit=false -DwarningAsError=true` and independent consumer both passed.
- Job logs show `BFSS_IBI_G0C_INV_PAULI_PREFLIGHT_PASS` then `BFSS_IBI_G0C_INV_PAULI_NATIVE_SOURCE_AND_CONSUMER_STRICT_GREEN`. The latter was emitted **after** checking source and consumer logs and confirming exact declaration axiom reports.
- `#print axioms sourceGaugeMatrix_inverse_eq_star` and `#print axioms originalAdjointColorMatrix_pauliInverseTrace` each reported only the approved `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, `admit`, added `axiom`, or disallowed warnings.
- [Preserved artifact #14176767053](https://github.com/etblink/math/actions/runs/43750250997/artifacts/14176767053), 4,938 bytes per GitHub REST; Actions reported artifact ZIP SHA-256 `a850235af2f3c92a0cc08d0846655c11182e8f203c8ee5f29698c7dec4fc053b`. Artifact not independently downloaded and hashed.

## Accepted source-exact mathematical statements

```lean
theorem sourceGaugeMatrix_inverse_eq_star (g : GaugeGroup 2) :
    (g : ColorMatrix 2)⁻¹ = star (g : ColorMatrix 2)

theorem originalAdjointColorMatrix_pauliInverseTrace
    (g : GaugeGroup 2) (B A : ColorIndex 2) :
    (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
      (Matrix.trace (FCP.BFSSSU2.pauli B *
        ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
          (g : ColorMatrix 2)⁻¹))).re / 2
```

Both range over the literal upstream BFSS `GaugeGroup 2 = Matrix.specialUnitaryGroup (Fin 2) ℂ`. The second uses the accepted Pauli bridge with output-row `B` and input-column `A`. The inverse equality uses Mathlib's existing unitary lemma and exact original source membership.

The independent consumer separately checks arbitrary-source matrix inverse/star and arbitrary-source coefficient inverse-trace equality. This source check does not independently qualify a generic `GL(2)` spin-cover theorem or exotic topology.

## Next admissible gate and stop rule

**Priority:** source-exact (z)- and (x)-axis SU(2) witnesses and their original 3×3 adjoint images, with independent strict gates and nontrivial sign/orientation controls.

Audit source-native `S1V52L7C7`, `S1V52L9C3` and native circle/generator modules for source convention and dependency reuse; their visible headers mark significant modules STAGED/UNQUALIFIED, so do not silently treat their declarations as accepted. The public `LionSR/QICLean` donor at `603fc408b9f4c2a50f2475e1e44843fdc0a9c0ac` supplies a constructive (Z-X-Z) surjectivity approach but pins Lean 4.36.0-rc1, unlike the approved Lean 4.34.1 environment. The donor is external research, not a qualified imported theorem. Prefer narrowly proved native generators, then a separate arbitrary-SO(3) Euler decomposition, and lastly the source-exact witness.

Do not claim `∀ Q ∈ SO(3), ∃ g ∈ GaugeGroup 2, R(g) = Q` from this gate. Preserve red/green provenance and stop after two analogous failures per gate. Future evidence-only commits do not alter exact tested source blobs. Do not edit unified integration, `main`, or frozen FCP material.
