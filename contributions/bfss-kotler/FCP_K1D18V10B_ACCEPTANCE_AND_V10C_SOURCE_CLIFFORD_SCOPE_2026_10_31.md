# K1D18V10B — strict acceptance and V10C source-Clifford boundary (2026-10-31)

## Acceptance: exact original paired-fock continuous SO48 one-parameter flows

**ACCEPTED** at [run #41250296900](https://github.com/etblink/math/actions/runs/41250296900), job `124682217576`, attempt 1, successful, exact tested SHA `a256da8d1884fb20df88cbcfa54e92985879781a`.

- Source: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9ContinuousSpecialOrthogonalFlowProbe.lean`, immutable Git blob `6cfd2b7fd2c240818350da5b41ce6a5446b12e20`.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- Preflight exact V10A accepted source, actual 48 paired labels and source hash: PASS; pinned restore PASS; accepted V10A ancestry rebuild PASS; V10B fresh `-DwarningAsError=true` compile PASS.
- Independently elaborate the seven exact typed declarations and verify their axiom sets: PASS, with only `propext`, `Classical.choice` and `Quot.sound` permitted, no `sorryAx`.
- Immutable artifact [#13060149825](https://github.com/etblink/math/actions/runs/41250296900/artifacts/13060149825), SHA256 `223b3ccf18fa772be74611fccbbc0487473f1672c970f43ac5af35e7eb76c41c`. Nonexpired at this review.
- Seven declarations: `pairedSkewOneParameterSpecialOrthogonalHom`, `pairedSkewContinuousOneParameterSpecialOrthogonalHom`, `pairedSkewContinuousOneParameterSpecialOrthogonalHom_apply`, `normalizedPairedPlaneContinuousOneParameterSpecialOrthogonalHom`, `normalizedPairedPlaneContinuousOneParameterSpecialOrthogonalHom_apply`, `coordinateToPairedCanonicalContinuousOneParameterSpecialOrthogonalHom`, `coordinateToPairedCanonicalContinuousOneParameterSpecialOrthogonalHom_apply`.

**Exact scope:** V10B gives actual continuous multiplicative-real one-parameter homomorphisms to `Matrix.specialOrthogonalGroup Source48Label ℝ`, including normalized original paired-plane and canonical V9T LieHom-image specializations. It does NOT glue these families into one `Spin(9) → SO(48)` group map, nor supply its differentiability, source topological group, exact central -1 action, Spin48 covering, Fock unitary action or BFSS physics.

## Scientific decision

Stop extending V10B via cosmetic equivalent per-generator flow statements. The next genuinely independent route is the original gamma-driven **constructive Clifford representation**. Exact pinned `Mathlib/LinearAlgebra/CliffordAlgebra/Basic.lean` supplies `CliffordAlgebra.lift` via the all-vector square law. Exact pinned `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` supplies algebraic `spinGroup Q` and `spinGroup.toUnits`, but not automatic continuity, unitary matrix transport, a source-specific group action or a Spin48 covering.

V10C is a **staged candidate, NOT QUALIFIED**: define the actual source-nine unit quadratic form, construct the real-linear combination of the exact previously accepted nine real gamma matrices, prove the all-vector quadratic Clifford square, and use the pinned universal property to define an algebra homomorphism `CliffordAlgebra Q9 →ₐ[ℝ] GammaMatrix` with a generator equality. This connects to a later global group restriction but does not yet furnish it.

Falsifiers: reject a replacement signed-permutation gamma model; reject a new 48 real label order; reject a spurious `CliffordAlgebra.star` assertion for odd gammas (Mathlib has `star (ι Q v)=-ι Q v` whereas accepted real gamma matrices are symmetric); reject claiming all Clifford elements have invertible image; test the actual Spin(9) *unit* subgroup separately.

If V10C compiles, next research must restrict the resulting real-algebra map to the **true source spinGroup Q9** and prove that exact matrix image is invertible/orthogonal, then transport to the **original** 48-label color-spinor carrier using the existing `pairedLabelEquiv`. Determinant-one, topology, central sign, lifting through original Spin48 and physical Fock action remain separate obligations.

This commit adds a V10B acceptance record and a candidate V10C source + strict gate only; no qualified ancestor, external upstream, or original FCP history is modified.
