# P3-AUX-RAD-C4A R2 — typed energy composition and proposition-proof instance binders

**Date:** 2026-11-14 Pacific. **Status:** PROSPECTIVE / STRICT PENDING / UNQUALIFIED.
**Reviewed parent:** `3dac79f0c8067f379ce9a5171c400d6b573d5754`. Original R1 [#43583785009](https://github.com/etblink/math/actions/runs/43583785009) RED is [preserved](P3_AUX_RAD_C4A_R1_RED_43583785009_ENERGY_REWRITE_AND_INSTANCE_STYLE_2026_11_14.md) with exact diagnostic excerpt and artifact. Its checkpoint [administrative #43585135722](https://github.com/etblink/math/actions/runs/43585135722) passed at the same preservation commit before this repair.

## Single bounded change

Keep all six public root statements, operator definition, imports, literal paired SU2 independent consumer, frozen original donor bytes and resource/axiom/warning rules.
1. Six proposition-proof `letI` binders become `let`, as the pinned linter requires. Definition and result-signature `letI` binders remain.
2. Replace only the final concrete energy rewrite by composition:
```lean
  exact (congrArg Complex.re hinner).trans
    (inner_self_eq_norm_sq (𝕜 := ℂ)
      (originalWeightedPhysicalChargeColumn M G hε
        ⟨u, naturalComp_domain_le u.property⟩))
```
The existing native `hinner` already elaborated in R1. The explicitly complex-specialized generic norm theorem is inspected at pinned Mathlib `Analysis/InnerProductSpace/Basic.lean:391`. Direct theorem composition avoids applying a rewrite matcher to the semireducible native domain expression. No new generic lemma, axiom, warning suppression or heartbeat setting.

## Pins and independent acceptance

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3AuxRADC4AOriginalWeightedNaturalAdjointSquare.lean`, blob `3202d27cbe9c27ea2d559cb0a1966c4a6d974920`.
- Independent actual paired source consumer: `lean/diagnostics/BFSSP3AuxRADC4AOriginalWeightedNaturalAdjointSquareIndependentConsumer.lean`, unchanged blob `820ec0bd4a0255d2564dc05b72bc488b1dabf4d0`.
- Workflow: `.github/workflows/bfss-p3-aux-rad-c4a-original-weighted-natural-adjoint-square-strict.yml`, blob `b725fb9350e75b4122b800b3661008c685eab70d`; **only** the new-source SHA entry changed.
- Original reviewed import baseline remains `5d74a3b5abe74dae4d6ba181ae29f0cb76865414`. R1 measured 212 transitive pins; R2 must independently measure its own count and receipt.
- Pinned Lean 4.34.1 / Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612; cold existing OAI closure, fresh source, independent actual paired consumer, exact six new / thirteen consumer axiom reports and fail-closed warnings/errors.
- Local review confirms unchanged public theorem signatures/imports/root lists/consumer and only source-pin workflow difference. YAML, embedded Python and shell syntax pass. Local Lean is unavailable; **no local compilation or theorem qualification is claimed**.

## Stop/next decision

If strict GREEN, independently review exact source SHA, source/consumer logs, all roots, pins and artifact before acceptance; only then C4B. If this second related attempt is RED, stop tactic variants and run an explicit tiny domain/instance diagnostic. Do not change source physics, accepted Sε/H, the six target statements, original consumer, proof budgets or qualification standard.

The [forward C4B/kernel/positive-regulator memo](P3_AUX_RAD_C4B_FORWARD_RESEARCH_NORMALIZATION_KERNEL_AND_POSITIVE_REGULATOR_STABILITY_2026_11_14.md) remains conventional analysis only.

## Launch binding

[Strict #43585322863](https://github.com/etblink/math/actions/runs/43585322863) started at exact `c2ff95769d65b45e002118eac6e12f910866373f`; administrative #43585322835 is separate. Source/consumer/root contract and donor pins unchanged from this prospective repair. No verdict or R2 import count assumed.
