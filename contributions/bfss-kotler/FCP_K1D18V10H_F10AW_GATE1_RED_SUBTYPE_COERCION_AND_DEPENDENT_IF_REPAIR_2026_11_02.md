# K1D18V10H F10AW — Gate 1 RED: subtype coercion and dependent-if case proof

**Date:** 2026-11-02 UTC / 2026-11-01 Pacific  
**Repository:** \`etblink/math\`  
**Branch:** \`research/fcp-k1d17-ancestor-cache-pilot-20261028\`  
**Disposition:** Gate 1 failed. The next source is an unqualified Gate 2 candidate.

## Immutable run evidence

- [Run #41388590016](https://github.com/etblink/math/actions/runs/41388590016), attempt 1, terminal failure.
- Exact tested commit: \`277fef5d9f53de80a0668b4203e6126bfa75665a\`.
- Job: \`125094806285\`, \`original-gamma-coordinate-plane-bracket\`.
- The exact source and accepted-ancestor pins passed.
- Lean 4.34.1 / Mathlib \`d13f23b723b8a846827a245b89c10fc7d3f11612\` restore passed.
- Accepted F10AV and F10AU ancestry rebuilt successfully.
- Native source four-index coordinate-plane bracket ancestry rebuilt successfully.
- Fresh F10AW warnings-as-errors compilation failed.
- Independent theorem-type/root-axiom audit was skipped.
- Artifact #13116429795 was retained by the workflow.

## Earliest causal failure

At source line 97, the attempt to convert F10AU's native \`LieSubalgebra\` bracket equality to a \`GammaMatrix\` equality did not push the subtype coercion through F10AU's dependent \`if\` expression.

The elaborated term remained of the form

\`\`\`lean
↑(if hac : r = t then ... else ...)
\`\`\`

while the target expected a matrix-valued dependent conditional. The prior \`simp only\` list rewrote the bracket and pair constructors but omitted the coercion/conditional reduction needed at this interface.

This is a source-level type-conversion/elaboration failure. It is not a counterexample to F10AU, F10AV, or the desired generator-pair identity.

## Additional failed proof construction

The hand-written target case table then produced cascading failures:

- \`subst t\` and \`subst u\` changed the local context while later lines continued to refer to the pre-substitution variables and witnesses.
- Negated equalities were treated as though they had a \`.symm\` field; they are functions of type \`r = s → False\`, so any symmetry conversion must use \`Ne.symm\`.
- Several simplifier argument lists contained unused entries under warnings-as-errors.
- Some scalar coefficient goals remained after the invalid case branches.

The final \`#print axioms\` output included \`sorryAx\` because the declaration had failed elaboration. It is not a qualified axiom report. The independent audit did not run, so no root was accepted.

## Method correction

The next candidate makes two bounded changes while preserving the mathematical statement and all accepted ancestry:

1. Convert the subtype bracket equality with the ordinary simplifier after explicitly exposing the native Lie-subalgebra commutator and original pair carrier. This tests whether the standard subtype coercion simp rules reduce the dependent conditional to the expected matrix expression.
2. Remove the duplicated substitution-based five-way proof table. After expanding the source four-index RHS and applying the already-proved coordinate-plane map, use \`split_ifs\` on the two expressions in their existing priority order, then simplify with the unchanged distinct-pair hypotheses and normalize only the rational scalar factors.

No theorem hypothesis, source label, pair orientation, coefficient, target carrier, accepted source pin, axiom whitelist, linter policy, or proof limit is weakened.

## Gate 2 acceptance contract

At the exact new commit, require all source and ancestry pins, pinned dependency restore, accepted F10AV/F10AU/V8W rebuilds, fresh warnings-as-errors compilation, independent exact theorem-type elaboration, declaration-level root-axiom audit with no \`sorryAx\`, and retained tested-SHA/artifact evidence.

If the subtype coercion remains the first failure, stop editing the full theorem and isolate that single carrier-conversion interface in a small source-pinned diagnostic. Do not submit another full manual case-table variant without new evidence.

## Scope ceiling

Even a green F10AW gate would establish only generator-pair bracket compatibility for the stated source-native coordinate planes under the original 16-real gamma coefficient map. Arbitrary-skew bracket preservation, the typed \`so(9) → so(16)\` \`LieHom\`, global Spin(9) integration, Spin(48) lifting/covering, the original Fock action, gauge/physical-domain compatibility, and BFSS spectral existence remain separate obligations.
