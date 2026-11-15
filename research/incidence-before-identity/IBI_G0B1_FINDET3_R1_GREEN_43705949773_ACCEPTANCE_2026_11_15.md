# IBI-G0B1 FIN-DET3 R1 — GREEN_QUALIFIED signed original-column determinant identity

**Date:** 2026-11-15 Pacific. **Verdict:** GREEN_QUALIFIED bounded finite determinant theorem plus source G3A specialization, **not** original G3A det-one.

## Exact reproducibility receipt

- [Run #43705949773](https://github.com/etblink/math/actions/runs/43705949773), attempt 1, completed/success at immutable commit `35e0a754fc9ba07223492b8e108c60d30bc6b8ea`, branch `research/bfss-incidence-unified-20261114`.
- Job `132786937418`, `finite-source-and-independent-consumer`, completed/success. Exact source/consumer/dependency blob pins PASS, Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored. **9,020-job cold source build PASS**, fresh warning-as-error native source and independently compiled 3-example consumer PASS. Full strict completion marker `BFSS_IBI_G0B1_FINDET3_SOURCE_AND_INDEPENDENT_CONSUMER_STRICT_GREEN` verified in job logs.
- Source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/IBIG0B1FinDet3.lean`, Git blob `c53fe995551ec85af6c66f9a5939dd421bbc9c10`.
- Independent consumer `lean/diagnostics/BFSSIBIG0B1FinDet3IndependentConsumer.lean`, Git blob `61ed8edbf37d54c115768a0df8f75a8f40e909db`.
- Workflow `.github/workflows/bfss-ibi-g0b1-fin-det3-strict.yml`, Git blob `bcd47fbe4f856a87e9bf832e2af51fa4cd9421b4`.
- Three `#print axioms` reports `originalColumnTriple`, `originalColumnTriple_eq_det`, `originalAdjointColumnTriple_eq_det` contain only `propext`, `Classical.choice`, `Quot.sound`; no `sorryAx`.
- [GitHub archived artifact #14157734824](https://github.com/etblink/math/actions/runs/43705949773/artifacts/14157734824), 5,160 bytes, expires 2026-11-29 UTC. GitHub reports ZIP SHA256 `9a4be4db8745b0b1e42c8f9ff3a64c500105b183fd21d328dd84ad56a7a226b7`; not independently rehashed.

## Actual theorem scope and adversarial control

For any real 3x3 matrix `R`, the **source** Pauli `colorCross` satisfies
`originalColumnTriple R = ∑ A, colorCross (R_.0) (R_.1) A * R A 2 = R.det`,
with output rows / input columns. The identity specializes to the **literal original** G3A `adjointColorMatrix g` for every source `g : GaugeGroup 2`.
The independent consumer explicitly tests a nonsymmetric improper reflection with value `-1`, positive identity with `+1`, and the actual-source symbolic specialization. Thus the signed orientation has not been silently erased.

## Limits and next gate

**Not yet proved:** `(G3A.adjointColorMatrix g).det=1`, exact original SU(2) adjoint image = SO(3), rank-split classical orbit separation, physical Fock gauge invariant state/domain, any spectral certificate, or ontological primacy.
Next: prove exact original G3A conjugated source color columns and source color-Lie/cross triple conjugation (reusing G1B), THEN combine with FIN-DET3 and source unit basis to derive original native det-one under separate strict qualification. Avoid unqualified quaternion whole-matrix donors and generic stand-in SO(3).

Preserve original source pins, G1B acceptance, earlier RED receipts and OCT-SRC diagnostics. This acceptance note changes no Lean theorem, independent consumer or workflow, nor unified integration, `main`, FCP or original incidence pilot.
