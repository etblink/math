# K1D18V9W — strict acceptance: exact source-paired one-parameter matrix exponential composition

Date: 2026-10-31 UTC
Branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`
V9W qualified commit: `36048095f2cd544607c267d140651ec35067a8f4`
V9W unchanged Lean source blob: `fe56b8b55ea9e72d50b8991962d8b22def7375d9`
Pinned Lean: `leanprover/lean4:v4.34.1`
Pinned Mathlib: `d13f23b723b8a846827a245b89c10fc7d3f11612`
Strict success: [Run #41234334212](https://github.com/etblink/math/actions/runs/41234334212); job `124634836267` — **PASS**.
Saved evidence artifact: `bfss-v9w-original-paired-one-parameter-exponential-36048095f2cd544607c267d140651ec35067a8f4-1`, id `13054839462`, digest `sha256:e4d0e5b6dfe3fd9340479080dc2fdc47a40ff3b6e9afc172c0ce389a8324fabd`.

## Qualified declarations

Pinned-source/hash/statement preflight, pinned Lean/Mathlib restore, all accepted V9V ancestry, fresh V9W compilation with `-DwarningAsError=true`, and independent five-declaration elaboration and axiom audit all passed.

- `pairedMatrixExp_add`: for every real matrix on the literal source Fock-paired `Source48Label`, `exp ((s+t) • X) = exp(s • X) * exp(t • X)`. Same matrix in both exponents, so commuting by actual algebra law.
- `pairedMatrixExp_zero`: the matrix identity at parameter zero.
- `pairedMatrixExp_neg`: the negative-parameter exponential is the genuine inverse.
- `coordinateToPairedCanonicalSkewLieHom_exp_add`: specialization to the source-exact accepted canonical LieHom image.
- `normalizedPairedPlane_exp_add`: specialization to the original normalized paired plane generators for all index pairs, without the color-major substitute.

Each declaration independently reports only `propext`, `Classical.choice`, `Quot.sound`, and no `sorryAx`. The saved artifact includes compiler and independent audit outputs.

## Next bounded V9X experiment — NOT YET QUALIFIED

Formalize a genuine `MonoidHom` `Multiplicative ℝ →* Matrix.orthogonalGroup Source48Label ℝ` using accepted V9V source-exact orthogonal membership, accepted V9W composition and zero identity, and explicitly the original 48-label carrier. This captures the additive real parameter group in multiplicative notation and returns an actual typed orthogonal-group element. Proposed six declarations: a generic skew source hom and its matrix evaluation, the normalized paired plane hom and its matrix evaluation, and a hom for every canonical V9T image and its matrix evaluation. The latter requires the exact source label and skew subtype-field bridge identified and used in earlier accepted results.

This is a genuinely typed *one-parameter* group hom. It is **not** an integration of all of Spin(9), a determinant-one SO(48) theorem, a group lift to Spin(48), a covering, a global smoothness theorem, or a BFSS physical result. V9X must pass a distinct fresh strict compile and independently type-checked declaration/axiom audit before promotion.

## Negative knowledge and next constraints

The earlier V9V red Run #41232312032 was solely an explicit Matrix argument omission to `Matrix.mul_nonsing_inv`. The accepted correction at `3c6281324d1610579d13050a6d8aab5e0de44b03` preserved all theorem statements and basis order. Original V9U audit type failures remain recorded. Do not conflate positive proof evidence with successful CI alone, or suppress failed tests. No unauthorized change to main, frozen Foundational Convergence Program or upstream mathcommunity.
