# K1D18V10E — Gate 3 accepted; V10F original paired-48 global orthogonal target (2026-10-31 PDT)

**Research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`. **Disposition:** V10E **ACCEPTED**. V10F **CANDIDATE / NOT QUALIFIED** until a later strict gate is independently green.

## V10E exact acceptance

- Accepted [strict run #41254869047](https://github.com/etblink/math/actions/runs/41254869047), job `124695773027`, attempt 1, completed success, exact tested SHA `4b4ba9926a8515ae2f73579f0e4d2ef28a465f0b`.
- Original accepted source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9SourceSpinGammaOrthogonalProbe.lean`, immutable Git blob `3979ea1d3c64e4a3cb82e4baf2c10cbc6b5cb627`.
- Lean `leanprover/lean4:v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Exact predecessor and source-hash preflight, pinned restore, accepted V10D rebuild, fresh warning-as-error compile and independent six-exact-type elaboration/axiom audit all **PASS**.
- Accepted `gammaNineRealLinear_transpose`, `source9GammaCliffordAlgHom_reverse`, `source9SpinGammaMatrix_star_transpose`, `source9SpinGammaMatrix_mem_orthogonalGroup`, `source9SpinGammaOrthogonalHom` and `source9SpinGammaOrthogonalHom_apply`.
- Allowed axiom sets only `propext`, `Classical.choice`, `Quot.sound`, **no `sorryAx`**.
- Preserved [artifact #13062524428](https://github.com/etblink/math/actions/runs/41254869047/artifacts/13062524428), SHA-256 `2a04b0b0d37feef926f925671d9f7b2e576583639df106a5db091f2ac0bd0db7`, nonexpired at review.

**Qualified mathematical boundary:** The actual pinned `spinGroup source9Quadratic` acts by a single global **algebraic** homomorphism to `Matrix.orthogonalGroup SpinIndex ℝ`, i.e. `Spin(9) → O(16)`, with original signed-permutation nine gamma matrices. No source Lie-group continuity, SO16 determinant or global original 48-label orthogonality is smuggled into this statement.

## Prior reds retained and lessons

Gate 1 [#41253720110](https://github.com/etblink/math/actions/runs/41253720110), artifact `13061733662`, failed at scalar Clifford induction normalization, including an unsolved goal and strict unused-simp-argument errors. Gate 2 [#41254379517](https://github.com/etblink/math/actions/runs/41254379517), artifact `13062003867`, failed by an invalid `change` from `algebraMap ℝ Cl(9) r` to `r • 1` (not definitionally equal). Both are independently documented in `FCP_K1D18V10E_GATE1_RED_SCALAR_INDUCTION_CAUSAL_REVIEW_2026_10_31.md` and `FCP_K1D18V10E_GATE2_RED_DEFINITIONAL_EQUALITY_FAILURE_REVIEW_2026_10_31.md`. Gate 3 fixed only this proof bridge via *typed witnesses* for `reverse.commutes` and `AlgHom.commutes`, joined by `congrArg`, `calc`, and a separately justified scalar transpose, not altered mathematical premises.

## V10F — actual original paired 48-label group transport candidate

The exact source `SU2BFSSPairedSpin9PlaneGeneratorProbe.lean` already defines `pairedColorSpinEquiv : (ColorIndex 2 × SpinIndex) ≃ Source48Label`, derived from the accepted `pairedLabelEquiv` in `SU2PairedThetaLabelCrosswalkProbe.lean`. This is **not** the incorrect old color-major coordinate identification: for spinor \(\alpha=2j+r\), color \(a\), original index \(\ell(\alpha,a)=2(3j+a)+r\).

V10F separately tests the exact matrix transport `gamma16ToOriginalPaired48 A := Matrix.reindexRingEquiv ℝ pairedColorSpinEquiv (1₃ ⊗ₖ A)`, then proofs of one-preservation, multiplication, transpose, orthogonal-group membership and a source-group homomorphism `spinGroup source9Quadratic →* Matrix.orthogonalGroup Source48Label ℝ` with exact matrix evaluation. Six declaration-level strict axiom checks and independent type examples are required. **This is a CANDIDATE, not accepted** until a green source-exact verification run.

A passing V10F would give a genuine global **algebraic O(original 48)** representation. It does **NOT** establish determinant +1, source topological continuity, a Spin48 covering/lift, exact central action, actual Fock implementation or BFSS invariance/eigenstate claims. Those remain separate obligations.

Methods: no modification of source-index order, prior accepted proofs, pinned Lean/Mathlib or CI resource limits; no new axioms, `sorry` or `admit`, no CI status promotion by declaration names alone, preserve each failure by tested SHA. A red compiler diagnostic should trigger exact typed source/API remediation rather than repeated speculative gates. No changes to canonical main or external upstream.
