# RHOPF-P9C3D1 — continuous source-original real-matrix circle representation intake

**Date:** November 19, 2026.
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Status:** NEW STRICT SOURCE/CONSUMER CANDIDATE — no claim of qualification before CI.
**Accepted original predecessor:** P9C3D0 R4 [#44620961318](https://github.com/etblink/math/actions/runs/44620961318), exact tested SHA `493283ce5e94d5da162d8ae18915d8fa191cc8a5`, acceptance commit `072cb8372ad6cb7af5635cb84b9cb3c239d9c97a`.

## Mathematical contract

The original exact 16-real Gamma9 source yielded a native algebraic Mathlib `Circle →* GammaMatrix` with the multiplication law, identity and pointwise orthogonality. This gate proves exactly ONE new original-source theorem:

`FCP.RHOPFP9C3D1.relationalCircleMatrix_continuous : Continuous relationalCircleMatrix`.

Unfold the exact accepted original source `relationalCircleMatrix z = relationalCirclePhase (z:ℂ).re (z:ℂ).im` and `relationalCirclePhase a b = I-P+a•P+b•J`. The proof reduces to continuity of `Complex.re` and `Complex.im` after the `Circle → ℂ` subtype coercion, plus continuity of constant real matrices, subtraction, addition and scalar multiplication in the finite matrix topology. The proof never unfolds 16×16 gamma entries and does not create, reinterpret or change any original source operator.

The independent consumer must import the exact compiled source, accept `Continuous relationalCircleMatrix` from this theorem, and report its root axioms. Strict preflight now validates exact expected theorem/import declarations and **balanced source noncomputable section and independent namespace termination** before expensive cold build, learning directly from P9C3D0 R1/R2/R3 failures. It does not relax syntax strictness or the source freeze.

## Evidence and stop rule

- Pin exact predecessor D0 original source and independent source bytes, pinned Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact original Gamma9 source and independent source signed-permutation integer fixture.
- Require original source and separately imported consumer warning-as-error Lean compilation, both `#print axioms` reports allowed-root-only with no `sorryAx`, matching exact original tested SHA and GitHub ZIP SHA-256.
- No longer proof, additional theorem, direct gamma entry computation, new axiom, `sorry`, global proof-resource increase or changes to `main`.
- Any native RED must be preserved with its exact error and treated as an unqualified proof attempt. If a repeated elaborator/tactic mismatch occurs, split into a small abstract continuity helper before retrying rather than increase resources.

## Deliberately outside scope

Proving `Continuous relationalCircleMatrix` validates the topology of the *matrix map*, together with earlier algebraic homomorphism: it does not automatically bundle a `ContinuousMonoidHom` to the orthogonal group, define a verified vector action, prove the (S^1)-action free on (S^3) or construct a Hopf quotient. Fock/Clifford implementation, original Spin(9) compatibility, SU(2) Gauss constraints, Hamiltonian symmetry, stable soliton interpretation and Standard Model observables remain separate conditional hypotheses. Negative knowledge from P9C3D0 R1/R2/R3, P9C3C R1, P9C3B1 R1/R2 and original gamma coordinate REDs must remain intact.
