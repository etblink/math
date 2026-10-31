# K1D18V9X — strict acceptance of typed original paired one-parameter orthogonal homomorphisms

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
Acceptance commit: `ee1d6ae171ab85b54a79f911258edac316944f1f`
Unchanged original V9X source blob: `51f634be2330d53e976bf12d82be01f1f64683f6`
Pinned Lean: `leanprover/lean4:v4.34.1`
Pinned Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`
Strict accepted evidence: [Run #41236259454](https://github.com/etblink/math/actions/runs/41236259454), completed SUCCESS; job `124640573404`.
Preserved artifact: `bfss-v9x-original-paired-typed-one-parameter-hom-ee1d6ae171ab85b54a79f911258edac316944f1f-1`, id `13055633291`, digest `sha256:bdd924ade483d816e77c14a791a86951bbc7044d828391343a1d3119de97ef05`.

## Accepted results

Exact pinned source/dependency preflight, complete V9W ancestry, fresh V9X Lean compilation with warnings as errors, independent six-declaration type elaboration and per-declaration axiom checks all passed. Each source declaration depends only on `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`.

Six accepted declarations:

1. `pairedSkewOneParameterOrthogonalHom` — a real additive parameter encoded by `Multiplicative ℝ` maps via the *actual original source-paired 48-matrix exponential* into `Matrix.orthogonalGroup Source48Label ℝ`, packaged as a genuine `MonoidHom` for every original skew matrix.
2. `pairedSkewOneParameterOrthogonalHom_apply` — identifies the underlying 48×48 matrix of that typed hom exactly with `exp(t•X)`.
3. `normalizedPairedPlaneOneParameterOrthogonalHom` — genuine typed hom for the exact original paired-Fock normalized plane generators, with all index pairs included.
4. `normalizedPairedPlaneOneParameterOrthogonalHom_apply` — exact matrix exponential evaluation for the original normalized planes.
5. `coordinateToPairedCanonicalOneParameterOrthogonalHom` — genuine typed hom for every image of the accepted source-exact canonical `so(9) → so(48)` real LieHom.
6. `coordinateToPairedCanonicalOneParameterOrthogonalHom_apply` — exact source label and matrix evaluation for the canonical image.

This is an actual one-parameter group hom, not an integration of the full nine-dimensional Spin group. The group parameter is additive real under a multiplicative type tag. No global `Spin(9)→SO(48)` construction, continuous group hom, determinant-one orientation proof, Spin(48) lift or BFSS physical theorem follows automatically.

## Negative engineering evidence

Initial [Run #41235236249](https://github.com/etblink/math/actions/runs/41235236249) was RED on exact research SHA `3acc97956eb2ffccca8bebe26b2d9fbc0087770b`. The source declarations compiled, all six declarations emitted the permitted axiom set, and the independent audit failed at a standalone *plain* `example` trying to computationally construct a noncomputable matrix-exponential hom. Lean gave `error(lean.dependsOnNoncomputable)`. The corrective fast-forward commit `ee1d6ae171ab85b54a79f911258edac316944f1f` changed **only** that independent audit line to `noncomputable example`. The original six V9X declarations were unchanged. The accepted run independently validated their type and axioms. Preserve the RED evidence and do not treat it as mathematical refutation.

## Next bounded V9Y experiment — NOT YET QUALIFIED

Pinned `NormedSpace.exp_continuous` in `Mathlib/Analysis/Normed/Algebra/Exponential.lean` provides continuity of the matrix exponential once an explicit matrix norm is selected; pinned `Matrix.linftyOpNormedRing` / `Matrix.linftyOpNormedAlgebra` via `Norms.Operator` are available in `Mathlib/Analysis/Matrix/Normed.lean`. The topology of the actual orthogonal subgroup is the subtype topology. Test four source-exact declarations: (a) continuous underlying matrix exponential as a function of real time, (b) continuous real evaluation into the true orthogonal subtype for arbitrary skew 48-matrices, (c) normalized original paired-plane specialization, and (d) canonical LieHom image specialization. Use `Continuous.subtype_mk`, never replace the actual 48-label type or alter the accepted V9X typed hom. Preserve strict compiler/axiom checks and an independent full-qualified-label audit. The four declarations are *proposals* and must be accepted only after a fresh strict gate.

Even successful V9Y would not establish a continuous `Spin(9)→SO(48)` global hom, determinant-one orientation, a Spin(48) lift or covering, and would not resolve any BFSS spectral/physical assertion.

Main, frozen FCP provenance and upstream mathcommunity remain untouched.
