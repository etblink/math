# Project Lead — V9R strict Gate 2 accepted; original Spin(9) global integration remains OPEN

**Date:** 2026-10-31 UTC  
**Repository:** `etblink/math`  
**Research branch:** `research/fcp-k1d17-ancestor-cache-pilot-20261028`  
**Scientific authority:** FCP `EPISTEMIC_RULES.md`: seek truth, preserve results and negatives, do not promote an algebraic theorem to topology or physical realization.

## 1. Exact V9R qualified evidence

- [Green strict V9R Gate 2 #41222859199](https://github.com/etblink/math/actions/runs/41222859199), job `124600846327`, attempt 1, completed success 2026-10-31T17:16:21Z.
- **Exact tested SHA:** `02a4618401ce4ead4f559d0c341122a17492df14`.
- **Exact tested source blob:** `1b17d6542ebec81f12fd0231e8478f66679efd53` in `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9LieHomProbe.lean`.
- **Strict workflow blob:** `490ff9d3ad710ec252991bf401c0ae273257f258`.
- Exact source preflight PASS, pinned Lean v4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` PASS, 8,993 compiled jobs including qualified ancestors PASS.
- Fresh `lake env lean -DwarningAsError=true` V9R compilation PASS. Independent Lean declarations, specialized commutator preservation and scalar homogeneity PASS.
- Exact declaration `FCP.BFSSPairedSpin9Plane.coordinateToPairedSkewLieHom : ↥coordinateSkewLieSubalgebra →ₗ⁅ℝ⁆ ↥pairedSkewLieSubalgebra`.
- Declaration-level axioms exactly `[propext, Classical.choice, Quot.sound]`; **no `sorryAx`**.
- Immutable compiler/audit [artifact #13050833266](https://github.com/etblink/math/actions/runs/41222859199/artifacts/13050833266), uploaded ZIP SHA-256 `3e3d3abda96c3c3f79596bea08cc89c50c0b4c7b30e8be1b03d62d164b68b319`.

**Formal scope:** a genuine `LieHom` between the *actual* source-native real skew 9×9 matrix Lie subalgebra and exact original-Fock-paired real skew 48×48 matrix Lie subalgebra, with actual associative matrix commutator and proven real additivity/scalar structure. This is `SOURCE_DERIVED` mathematical formalization with independent strict verification. It is not a group hom, a covering, an operator-space implementation, or a physical theorem. No injectivity or integration claim is added here.

## 2. Red Gate 1 retained as negative engineering knowledge

- [Failed V9R Gate 1 #41221956469](https://github.com/etblink/math/actions/runs/41221956469), source SHA `52a89c9e9e80c8f285eb6e936218986ca11adc9a`, source blob `6a0e0a11c47341425a4c072eddefa2843be48c14`, job `124598191041`, compiler artifact `13050383412`.
- First error at line 36: rewrite searched for `(?M + ?N).transpose`, while actual goal was `A + B ∈ {A | A.transpose = -A}`. Same typed-goal mismatch at lines 39, 52, 55 for source/target addition and scalar closure.
- Gate 1 proof emitted `sorryAx`, independent audit did not execute; *Gate 1 remains rejected*.
- Repair used explicit `change` expansion of both membership hypotheses and the transpose equality goals in precisely four proof branches. Accepted theorem statement, original paired-index permutation, gamma source, existing ancestry and resource limits stayed unchanged.
- **Lesson:** classify the first Lean elaboration/goal-shape failure and add the necessary typed structural bridge before touching proof limits or mathematics. Preserve both the red and recovered green as distinct immutable evidence.

## 3. Source exactness controls still mandatory

- V8A `SU2BFSSPairedSpin9PlaneGeneratorProbe` defines `pairedColorSpinEquiv := (Equiv.prodComm _ _).trans pairedLabelEquiv` and original paired plane matrices as `Matrix.reindexRingEquiv` of the literal color-spin Kronecker matrix. This is an explicit permutation, not equality of differently indexed representations.
- V8O identifies normalized original skew plane generators; V9B qualified `coordinateToPairedLinearMap (coordinatePlane9 r s) = normalizedPairedPlane r s`; V9N qualified arbitrary native-skew commutators; V9R packages the real Lie algebra morphism.
- FCP [original gamma/center/paired-index audit](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/audits/FCP_BFSS_ACTUAL_SOURCE_GAMMA_SPIN9_CENTER_ORIENTATION_2026_10_27.md) preserves the native `pairedLabelEquiv` Fock flattening `2(3j+a)+q` against color-major `16a+α`. **44/48 slots differ.** Exactly 27 original B tensors reject the untransported color-major identification. FCP run `40478381697` accepts the properly transported finite source equations only, not a continuous group theorem.
- The source gamma basis differs entrywise from an earlier abstract Clifford basis used in Gate 88. Do not equate those bases without an explicit equivariance/transport proof.
- FCP's finite Pfaffian/center diagnostic conditionally predicts the original CAR Fock orientation sign `+Omega48`, not arbitrary `±Omega48`. That prediction remains conditional on a genuinely constructed global source group lift and Fock implementation.

## 4. Next frontier: precise obligations, no premature CI gate

**Proposed critical path, each a distinct claim requiring independent proof:**

1. **Exact infinitesimal identification:** exhibit the source real `so(9)` Lie algebra and the original paired Fock `so(48)` at the intended concrete group-level Lie-algebra interfaces, showing their chosen differentials are *exactly* the accepted V9R `LieHom`, and preserving the V9B normalization and paired label order. The V9R Lean `LieHom` alone does not define a group or its differential.
2. **Topological/smooth prerequisites:** identify exact pinned Lean declarations for the actual original Spin(9), determinant-one source orthogonal group, Clifford Spin(48), compatible topological/smooth group structures, connected and simply connected source, and the required group integration and lifting/covering theorem. The inspected pinned Mathlib `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean` constructs the algebraic `spinGroup` and group operations; no covering or global integration is proved by that file alone. **Do not infer that no such theorem exists elsewhere without an exhaustive library audit.**
3. **Global SO action and Spin lift:** use legitimate source-exact integration to obtain a continuous `Spin(9)→SO(48)` homomorphism whose derivative agrees with V9R; then prove a *based continuous homomorphic lift* to the exact original Clifford Spin(48). Preserve the existing original algebraic Spin48 two-sign fiber and quotient results without misrepresenting them as a topological covering.
4. **Center / exact source Fock action:** prove the `-1` center image and Fock parity/phase with the true source 24-mode Majorana pairing and original orientation. A wrong sign or an SO(9)-factored trivial center must be an explicit falsifier. Do not identify Lie-algebra matrix action with Fock unitaries by naming alone.
5. **Separate physical bridge:** genuine original SU2 gauge-group commutation, full operator/form domains, closed form invariance and spectral claims require independent hypotheses and verification; finite gamma/B-field covariance is insufficient.

**Decision:** preserve V9R as a qualified mathematical milestone; do not create another small CI gate solely to increase the green count. First perform a source-exact library/API feasibility and dependency audit for Items 1–3. Promote a new proof candidate only once its precise Lean declaration/type, dependencies, test and rejection criteria are known. If infrastructure is absent, document the missing theorem/types as `OPEN` rather than inserting axioms, modifying the source model, or raising resource limits.

## 5. Governance and branch policy

This report-only change must not alter the accepted V9R source hash/strict workflow, other qualified Lean ancestors, canonical `main`, frozen FCP files or external `mathcommunity` upstream. The mathematical root count increases only by the **one independently qualified V9R declaration**; no new source theorem is claimed by this acceptance record.
