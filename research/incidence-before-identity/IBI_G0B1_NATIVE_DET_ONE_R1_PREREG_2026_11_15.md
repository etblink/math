# IBI-G0B1 native source adjoint determinant-one — R1 preregistration

**Date:** 2026-11-15 Pacific.
**Branch:** `research/bfss-incidence-unified-20261114`.
**Disposition:** PROSPECTIVE/UNQUALIFIED until independent strict Lean CI passes at the exact tested SHA.

## Qualified donors and theorem target

- Signed original Pauli Lie/colorCross normalization and gauge covariance G1B: [#43703395473](https://github.com/etblink/math/actions/runs/43703395473) GREEN_QUALIFIED.
- FIN-DET3 source Pauli colorCross **column determinant** identity and genuine original G3A source specialization: [#43705949773](https://github.com/etblink/math/actions/runs/43705949773) GREEN_QUALIFIED.
- Actual source G3A adjoint-column identification and arbitrary original color Lie/signed-cross scalar-triple covariance: [#43709229043](https://github.com/etblink/math/actions/runs/43709229043) GREEN_QUALIFIED. Its exact source blob `7022f0759fd761791132857e8c07bf8b442d9c43` is frozen.
- G3A already proves `adjointColorMatrix_orthogonal` with source `GaugeGroup 2` and `pairedAlgebraData`; prior acceptance is unchanged.

**Precise new target:** `∀ g : GaugeGroup 2, (FCP.BFSSSU2GaugeG3A.adjointColorMatrix g).det = 1`, using literal original source and ordered Pauli sign, not surrogate rotations or abstract connectedness.

## Dependency-complete bounded proof

The new source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1NativeDetOne.lean` defines `matrixColorColumn` as the original real `ColorVector 2` for input column A of any output-row matrix R. It proposes six helper declarations plus the final theorem:

1. `matrixColorColumn` and `matrixColorColumn_apply`: typed original color vector with exact matrix entries.
2. `matrixColorColumn_adjoint`: original source G3A `adjointColorMatrix g` columns are **the actual conjugated original color units**, by strict-qualified `sourceColumn_apply`.
3. `matrixColorColumn_one`: identity columns are the unchanged source color-unit basis.
4. `originalColumnTriple_eq_sourceInner`: the already-qualified `FIN-DET3.originalColumnTriple` equals the inner product of the actual original `sourceCross` of typed matrix columns. This is a coordinate/inner scalar bridge, not an assumed determinant orientation.
5. `sourceColorUnitTriple_eq_one`: explicitly evaluate +1 for original identity unit columns via `FIN-DET3.originalColumnTriple_eq_det`. The sign cannot be silently discarded.
6. `originalAdjointColorMatrix_det_one`: convert det to `originalColumnTriple`, to signed sourceCross inner, to three genuine source-conjugated unit columns, invoke qualified `sourceCrossTriple_conjugate`, and finish with the proven +1 unit orientation.

The independent consumer `lean/diagnostics/BFSSIBIG0B1NativeDetOneIndependentConsumer.lean` checks arbitrary original source gauge elements with det=+1, their already-qualified G3A orthogonality combined with det=+1, and a **nonsymmetric improper det=-1 reflection** that cannot lie in the image. These are three independent examples, not a disconnected textbook SU(2)/SO(3) model.

## Exact preflight and falsifiers

- Source Git blob `ce78c70b1e70375c87aa3474187f41edf7cafbd9`; independent consumer blob `6e08594769f078946f2793c8df7e55322abc881d`; workflow blob `eab2b5c8bfd5da794e3584d3b6d306d069b34f79`.
- Workflow `.github/workflows/bfss-ibi-g0b1-native-det-one-strict.yml` pins these, accepted source-columns donor `7022f0759fd761791132857e8c07bf8b442d9c43`, FIN-DET3 donor `c53fe995551ec85af6c66f9a5939dd421bbc9c10`, original G1B `b42291fe0aa5f8b22a31bad19b9de5c775372a71`, original G3A `553869f1287c64893398c3b79c04fe010023bd08`, and original Pauli source cross `209b3808222730ca5e817d83ed32253a67513f7f`.
- Exact Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; cold native source build + separately compiled warning-as-error consumer, all **seven named source #print-axioms** accepted only `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, no errors/unexpected warnings. Archive full original logs and exact tested SHA.
- No local Lean compile was run before commit; source proof is a bounded prospective derivation from frozen accepted APIs, **not accepted until complete strict GREEN**.
- On first RED, preserve its first causal Lean error and artifact before deciding a minimal, preregistered repair; on two analogous first-causal REDs stop and rearchitect. A genuine wrong orientation sign defeats this route and must not be hidden by abs-value, assumptions or SO(3) substitution.

## Ceiling and stop conditions

Even a GREEN original native det-one proves `R(g) ∈ SO(3)` (together with qualified G3A orthogonality), **not that every SO(3) element is in the source image**. G0C surjectivity remains independent, then G2 rank-split source orbit classification and physical FullL2/Fock/Hardy domain consequences remain separate. No assertion of BFSS spectral ground state, mass gap or ontological primacy.

No changes to original BFSS G2A/G3A, unified integration, `main`, frozen FCP or original incidence pilot. No promotion without explicit owner authorization and audit.
