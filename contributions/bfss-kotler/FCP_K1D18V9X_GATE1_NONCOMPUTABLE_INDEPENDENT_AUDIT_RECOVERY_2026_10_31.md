# K1D18V9X — first red strict gate: independent noncomputable example

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
First V9X experiment SHA: `3acc97956eb2ffccca8bebe26b2d9fbc0087770b`
Original V9X Lean source blob: `51f634be2330d53e976bf12d82be01f1f64683f6`
Prior accepted V9W: [Run #41234334212](https://github.com/etblink/math/actions/runs/41234334212), qualified SHA `36048095f2cd544607c267d140651ec35067a8f4`.
First V9X gate: [Run #41235236249](https://github.com/etblink/math/actions/runs/41235236249) — **RED**; job `124637502776`; preserve unchanged original failure artifact id `13055620692`, sha256 `bb3b7b209ab0d8cbe8f0e5645f5074a94a42aac0a93ed32e369b5efa58ec2dd5`.

## Exact error and classification

V9X exact source hash/statement preflight, pinned Lean 4.34.1/Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, accepted V9W ancestry compilation and fresh V9X source compilation under `-DwarningAsError=true` all passed. All six declared source items printed only the permitted foundational axioms `propext`, `Classical.choice`, `Quot.sound` and **no `sorryAx`**.

The separately compiled independent audit failed at `/tmp/PairedSpin9V9X_Audit.lean:11:0` with `error(lean.dependsOnNoncomputable)` on an `example (r s : SpaceIndex) : Multiplicative ℝ →* Matrix.orthogonalGroup FCP.BFSSS1V0.Source48Label ℝ` whose body was `normalizedPairedPlaneOneParameterOrthogonalHom r s`. A normal `example` asks Lean to compile computational code, but the real matrix exponential and resulting typed hom are intentionally declared `noncomputable`. This was an audit declaration-modifier error, not proof rejection or a missing original group-theoretic fact.

## Bounded fix

Modify **one audit line only** from `example (r s : SpaceIndex) :` to `noncomputable example (r s : SpaceIndex) :`, preserving the typed hom construction and its exact original 48-label carrier. Pinned Mathlib has native examples of `noncomputable example` syntax. All six source definitions/theorems, exact original source blob, compiler strictness, separate original source-identity checks, independent four examples, and per-declaration axiom standards stay unchanged. No source rewrite, heartbeat or other limits, weak assumptions, or replacement of original paired-Fock indexing.

A fresh strict gate must pass before V9X acceptance. Even if qualified, this is an individual one-parameter hom `(ℝ,+) → O(48)` per skew input, not a global `Spin(9)→SO(48)`, group covering/lift into source `Spin(48)`, continuity proof or physical BFSS result. Main, frozen FCP provenance and mathcommunity upstream remain untouched.
