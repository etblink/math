# F10AQ Gate 1 RED — source namespace resolution repair

Date: 2026-11-01. Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Immutable failed qualification

[Run #41360255466](https://github.com/etblink/math/actions/runs/41360255466) tested exact SHA `9ad17ac27301a8e152ffa3edb8769e56ca58dd38`, attempt 1, completed FAILURE. [Artifact #13105786072](https://github.com/etblink/math/actions/runs/41360255466/artifacts/13105786072), ZIP SHA256 `490b9cbeb6a9828b5a3c5456e7d42fb05924bfc6f3ed84abfb5b98df7bb77c23`.

Original source pins, frozen Lean v4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted F10AP ancestry rebuild all passed. Fresh warnings-as-errors F10AQ compiler FAILED: original source line 64 and line 103 both report `error(lean.unknownIdentifier): Unknown identifier source9OriginalGamma_anticommute`, with unsolved proof goals at lines 63 and 102. Lean printed declaration axiom reports that include `sorryAx` due to incomplete proofs; they are NOT accepted proofs. Independent four declaration-type/axiom audit was skipped. There was no weakening of the mathematical theorem statements, but F10AQ itself is NOT QUALIFIED. This is a proof namespace-resolution failure, not a counterexample to either bracket identity.

## Gate 2 one-line statement-preserving repair

Original F10AQ module omitted `open FCP.BFSSPairedSpin9DetFixture` from its imports' namespace openings; accepted F10AP and previous source gamma modules explicitly open it. Add only `open FCP.BFSSPairedSpin9DetFixture` after `open FCP.BFSSGamma9`. Preserve byte-for-byte the four proposed theorem statements, all proofs, exact public original source gamma tables/axioms and the pinned mathlib toolchain. Update the F10AQ source's exact SHA pin in its strict workflow; no other verification conditions changed.

Require a new source-pinned `-DwarningAsError=true` compiler pass, independently elaborated exact FOUR theorem types and permitted root axiom audit (`propext`, `Classical.choice`, `Quot.sound` ONLY, no sorryAx). Preserve the Gate 1 red run, do not disable warnings or increase limits, and do not alter accepted modules, merge to main or create upstream PR. If Gate 2 fails, analyze its actual new goals without guessing.
