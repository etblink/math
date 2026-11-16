# IBI-G0C source-exact Pauli trace bridge — R5 GREEN qualification

**Research branch:** `research/bfss-incidence-unified-20261114`
**Decision date:** 2026-11-15 (Pacific)
**Verdict:** **GREEN_QUALIFIED for G0C-PAULI-TRACE only.**
**Not admitted:** G0C surjectivity, kernel classification, global bosonic orbit classification, physical-state equivalence, or spectral conclusions.

## Exact accepted receipt

- GitHub Actions run [#43748016863](https://github.com/etblink/math/actions/runs/43748016863), job `132915521949`, completed **SUCCESS** (push workflow; attempt 1).
- Tested code commit: `a10167e0fefde8ddcac5d6ae8d6aa233fbf95aab` (not the later evidence-only acceptance commit).
- Workflow: `.github/workflows/bfss-ibi-g0c-pauli-trace-strict.yml`.
- Original native source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0CPauliTrace.lean` at Git blob `b3fc2604a8536cef7c5d0a1a6ca9ba12eccd4c8f`.
- Independent consumer: `lean/diagnostics/BFSSIBIG0CPauliTraceIndependentConsumer.lean` at Git blob `e330a6bd52aba03c7e85308d6220d9a9631044fc`.
- Strict workflow Git blob `c79e975b6e6ae8f960dda88c995e6557caeb6453`.
- Accepted toolchain: `leanprover/lean4:v4.34.1`; pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Cold native source `lake build` completed at job step 9016/9016. Warning-as-error `lake env lean -DautoImplicit=false -DwarningAsError=true -o ...` succeeded.
- Separate `lake env lean -DautoImplicit=false -DwarningAsError=true diagnostics/BFSSIBIG0CPauliTraceIndependentConsumer.lean` succeeded.
- Strict source preflight marker `BFSS_IBI_G0C_PAULI_TRACE_SOURCE_PREFLIGHT_PASS`; final post-build marker `BFSS_IBI_G0C_PAULI_TRACE_SOURCE_AND_INDEPENDENT_CONSUMER_STRICT_GREEN` emitted after content pin, build, consumer, and axiom checks.
- Two `#print axioms` declarations matched exactly with approved axioms `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`, `admit`, new axiom or unexpected warning.
- [Preserved Actions artifact #14175905179](https://github.com/etblink/math/actions/runs/43748016863/artifacts/14175905179), 4846 bytes per GitHub API; GitHub job log reported ZIP SHA256 `f7f8a5a8b100d6db581bb7c5be0111b5a1226d0e1c0a756dfc29d85e5f41797b` (not independently downloaded/rehashed).

## Exact mathematical scope

For arbitrary ORIGINAL BFSS `g : GaugeGroup 2` and original `B A : ColorIndex 2`, the qualified theorem
`FCP.BFSSIBIG0CPauliTrace.originalAdjointColorMatrix_pauliTrace`
establishes:

```lean
(FCP.BFSSSU2GaugeG3A.adjointColorMatrix g) B A =
  (Matrix.trace (FCP.BFSSSU2.pauli B *
    ((g : ColorMatrix 2) * FCP.BFSSSU2.pauli A *
      (g : ColorMatrix 2).conjTranspose))).re / 2
```

The supporting theorem `originalAdjointColorMatrix_normalizedPauliTrace` establishes the literal normalized source basis form. The strict independent consumer checks (1) arbitrary source coefficient, (2) 3×3 extensional matrix equality, (3) the original source `g=1` identity trace/Kronecker delta. This verifies exact row=output B and column=input A conventions. It does **not** prove nontrivial Euler orientation controls as additional independent matrix witnesses; those remain possible strengthening.

Combined with accepted native G0B1 det-one ([#43733883094](https://github.com/etblink/math/actions/runs/43733883094)), the original source adjoint representation has now been recognized as an (SO(3))-valued Pauli conjugation action. The missing quantifier direction is unchanged:

```lean
∀ Q : Matrix.specialOrthogonalGroup (Fin 3) ℝ,
  ∃ g : GaugeGroup 2,
    FCP.BFSSSU2GaugeG3A.adjointColorMatrix g = Q.1
```

The bridge proves identity of action coefficients, **not surjectivity**. It does not prove kernel `{±1}`, SO(3) Euler factorization, bosonic Gram-plus-signed-triple orbit separation or physical state consequences.

## Provenance and negative-knowledge continuity

The sequence leading to this green receipt is retained in Git commits and separate artifacts:

| Run | Outcome / failure class | Action |
| --- | --- | --- |
| [#43740977438](https://github.com/etblink/math/actions/runs/43740977438) | R1 RED: unsupported `ᴴ` scope in source | Moved to explicit native `.conjTranspose` |
| [#43742479662](https://github.com/etblink/math/actions/runs/43742479662) | R2 RED: real-to-complex `pauliScale` coercion and final scalar normalization | Reused source `congrArg` cast and `ring` |
| [#43745356624](https://github.com/etblink/math/actions/runs/43745356624) | R3 RED: linter rejected `<;>` proof syntax under strict warning-as-error | Replaced with `;` |
| [#43746595679](https://github.com/etblink/math/actions/runs/43746595679) | R4 RED: remaining unscoped `ᴴ` in identity independent consumer | Corrected consumer and added preflight guard against remaining `ᴴ` |
| [#43748016863](https://github.com/etblink/math/actions/runs/43748016863) | R5 GREEN: full source, consumer and axiom acceptance | Freeze exact qualified theorem/source bytes |

Failures remain negative *verification* results rather than refutations of the target theorem. No retroactive assignment of GREEN to a previous red run.

## Next gate (decision, not qualification)

**G0C-INV-PAULI:** establish the native source (SU(2)) matrix inverse equals conjugate transpose, then compare original source Pauli trace coordinates to the public Euler spin-cover donor's inverse-based convention. Prove or adapt a narrow source-exact interface rather than importing QICLean wholesale. Before attempting an SO(3) surjectivity proof, audit available `S1V52C1`, `S1V52C2C`, `S1V52L9C3`, and `S1V52L7C7` quaternion/Euler candidates and external `LionSR/QICLean` version differences (external snapshot Lean 4.36.0-rc1 vs accepted native Lean 4.34.1); note any staged/unqualified declarations.

Only after independent source checks and a genuine arbitrary-`Q` witness theorem may G0C surjectivity be admitted. Preserve a separate strict workflow, independent consumer, original dependencies and frozen toolchain pins. Stop after two analogous source/consumer failures and record typed diagnostics.

**Repository governance:** Evidence-only memo commit on incidence research branch. No edits to accepted Lean source bytes, original BFSS donors, unified integration or `main`. No PR or promotion authorized by this gate.
