# GM0A R2 — exact unified-source strict GREEN qualification, 2026-11-22

**Accepted mathematical scope:** genuine original BFSS SU(2) color-Lie triple scalar invariance, with exact paired source bosonic specialization. Not massless Fock quantizer covariance, L² domain, Hamiltonian, Hopfion, or GUT.

- Exact tested unified commit: `a2362e5ed5a12f4ce8a40b58d7e545bf2233bbb6`.
- [Original strict run #45061916954](https://github.com/etblink/math/actions/runs/45061916954), push, attempt 1, success.
- Native build: 8,992 jobs SUCCESS, frozen original source preflight PASS.
- Independent consumer `lean/diagnostics/BFSSGM0AOriginalColorLieTripleIndependentAudit.lean`: strict Lean `-DautoImplicit=false -DwarningAsError=true`, PASS.
- Native source declaration reports and one independent consumer declaration report: exactly allowed `[propext, Classical.choice, Quot.sound]`, no `sorryAx` or Lean errors.
- Lean 4.34.1; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`.
- [Original artifact #14770127413](https://github.com/etblink/math/actions/runs/45061916954/artifacts/14770127413): independently downloaded ZIP, 7,955 bytes, **SHA-256 `9a8dda9c2734d2b0a72a40146d17f5512fbdca566f47aab804b74fd195e74767`**, ZIP CRC PASS; six original logs/files; `tested-sha.txt` exact match; source/native/consumer logs independently read.
- R1 [#45060181041](https://github.com/etblink/math/actions/runs/45060181041) RED preserved in `research/integration/BFSS_GM0A_R1_INDEPENDENT_CONSUMER_RED_2026_11_22.md`. Root was missing `open OAI.BFSSQuantum.AlgebraData` in independent consumer; source native compile had passed already. R2 modified this namespace only, no theorem body changes.
- **Forward route discovered:** original `CovariantFields.lean` has `GaugeData.deformedFermionField_covariant`; qualified M1b maps `h=1,m=0` field to restricted original complex Fock quantizer. Test their direct composition in GM0B to avoid re-proving a full three-color/48-Majorana covariance expansion.
