# K1D18V10H — V10H-F8 ACCEPTED; F9 exact original gamma vector determinant magnitude candidate

Date: October 31, 2026 PDT. Research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## V10H-F8 strict qualification

- [GitHub Actions run #41264657880](https://github.com/etblink/math/actions/runs/41264657880) completed success, attempt 1, job `124724836879`, exact SHA `80db617f21d1f302acddbca40d9c41d429545a39`.
- Exact accepted F8 source `SU2BFSSPairedSpin9V10HF8CliffordUnitsGeneratorDetBridgeProbe.lean`, Git blob `937e1033ad5261f2dfa0c415e60d4b7e38ac0736`. Exact F7 source ancestry rebuilt with pinned Lean `v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; warning-as-error fresh F8 compile and FOUR independently elaborated theorem types and root axiom whitelist all PASS. Axioms only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`.
- Accepted declarations: `source9CliffordUnitsGammaDetHom`, `source9CliffordUnitsGammaDetHom_apply`, `source9CliffordUnitsGammaDetHom_spin_apply`, `source9CliffordUnitsGammaDetHom_generator`. There is now a **genuine source Clifford-unit monoid homomorphism** into multiplicative real scalars that agrees with the accepted source Spin9 determinant character via actual pinned `spinGroup.toUnits`. On any genuinely invertible original Clifford vector represented by `ι source9Quadratic v`, its value equals the determinant of the original real `gammaNineRealLinear v`.
- [Verification artifact #13066753674](https://github.com/etblink/math/actions/runs/41264657880/artifacts/13066753674) SHA256 `3aebd393078bc047d6b850469451549216529cc2fd5aa0897f9bc05baa3abdbd`, nonexpired at review.
- **F8 does not prove any generator determinant sign**. Previous unqualified V10H character gates red `#41257058496`, `#41257744030`; F4 Gate1 identity coercion red `#41260509990`; F5 Gate1 comment-sensitive preflight red `#41261931766` preserved, with no qualifying assertions.

## F9: new source exact mathematical obligation (CANDIDATE)

The original qualified `gammaNineRealLinear_sq v` proves `Γ(v)^2 = Q(v)•I_{16}`. The determinant identity `det(Γ(v))²=Q(v)^{16}` follows via `Matrix.det_mul`, `Matrix.det_smul`, and `Fintype.card_fin` at the exact original `SpinIndex=Fin 16`. In the real integral domain, elementary `mul_self_eq_mul_self_iff` then narrows the signed result to `det Γ(v) = Q(v)^8` **OR** `det Γ(v) = -Q(v)^8`. The accepted F8 generator bridge transfers this exact statement to any genuine unit whose Clifford value equals `ι Q v`.

Three exact type-verified declarations are attempted:
1. `gammaNineRealLinear_det_sq16` (nonconditional all-vector magnitude identity).
2. `gammaNineRealLinear_det_eq_pow8_or_neg` (all-vector two-sign magnitude dichotomy).
3. `source9CliffordUnitsGammaDetHom_generator_two_sign` (source unit-generator bridge).

These do NOT select the positive branch. They also do not assert `source9Quadratic v > 0` without a verified nonzero-vector fact or that every source Spin9 element is a product of squares. A later proof must determine actual positive sign on original generators and propagate through the original Lipschitz-group closure and source even subgroup, or find a counterexample. Standard Spin(9) Lie-group properties are not imported as evidence about the exact pinned source definition.

F9 source is UNQUALIFIED until pinned warning-as-error compilation, three independent source-exact type elaborations and axiom whitelist pass. No introduced axioms, sorry, recursion/heartbeat increases, accepted source modifications, main/upstream changes, original Fock index changes or alterations to pinned Lean/Mathlib. Global SO48, source continuity, source Spin48 lift/cover, Fock action and BFSS spectral physics remain OPEN.
