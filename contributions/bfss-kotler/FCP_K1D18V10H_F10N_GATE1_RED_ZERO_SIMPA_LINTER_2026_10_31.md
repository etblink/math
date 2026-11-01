# V10H F10N Gate 1 RED — zero-case `simpa` linter under warning-as-error

Date: 2026-10-31 PDT, before local midnight (run timestamp 2026-11-01T06:54:50Z). Research branch: `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## Exact verified Gate 1 outcome — preserve as RED
- [F10N Gate 1 run #41282125837](https://github.com/etblink/math/actions/runs/41282125837) completed FAILURE, attempt 1, job 124775994675, tested SHA `2fedac384ed94c92d8d320b3df480fba51e1303c`, source blob `07a96a2e476cd857c5e8cca1f106d39689793117`.
- [Immutable failure artifact #13074091748](https://github.com/etblink/math/actions/runs/41282125837/artifacts/13074091748), digest `sha256:6227873a4fe428353583206aad7bce2ef32f8021987a6af4cf2d9dcfd0296637`.
- Original gamma and F9/F10E–F10M exact source preflight PASS. Pinned Lean `v4.34.1`, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored PASS. The qualified F10M source ancestor rebuilt PASS.
- F10N fresh warning-as-error compilation FAILED at line 81 column 6: `error: try 'simp' instead of 'simpa'`; compiler reports `linter.unnecessarySimpa` in zero-vector branch of universal original gamma determinant theorem.
- All four F10N declarations generated `#print axioms` lines showing only `propext`, `Classical.choice`, `Quot.sound` and no `sorryAx`, but these are NOT qualification: compiler failed and independent four exact-type/axiom checks were SKIPPED. Never turn the red F10N Gate 1 green retrospectively.

## Minimal bounded corrective F10N Gate 2 candidate — pending
- Change ONLY the zero-vector negative sign branch of `gammaNineRealLinear_det_eq_source9Quadratic_pow8`: replace `simpa [hQ] using h` with `simp [hQ] at h ⊢ <;> exact h`.
- This follows the pinned linter's `simp` request without disabling or suppressing `linter.unnecessarySimpa`. The equation `Q(0)=0` is already established by accepted `source9Quadratic_eq_dot`; the negative determinant sign is equal to the positive sign because both are zero. No altered theorem statement, added axiom, proof-limit increase or gamma matrix access.
- Source content hash in the independent F10N strict workflow must change to the exact revised Git source blob, with an added fail-closed preflight asserting the explicit `simp` tactic and rejecting the old `simpa` line.
- Independent F10N strict gate remains mandatory: exact pinned ancestors, fresh warning-as-error compilation, four independently elaborated exact theorem types, only allowed root axioms `propext`, `Classical.choice`, `Quot.sound`, no `sorryAx`, and immutable logs/artifact. F10N remains **UNQUALIFIED until a new gate passes**.

## Frozen accepted scope and negative evidence
- Accepted F1–F9 and F10E–F10M immutable. Earlier private-table F10 red runs #41266215820/#41266892206/#41267510559; F10D import-all #41268424166; F10E `if_neg` #41269330982; F10F matrix entrywise simplification #41270798888; F10H missing `WithLp` #41273184444 remain retained negative evidence.
- The original gamma 16-real-spinor positive determinant for all original nine-vectors is the F10N TARGET, not yet an accepted theorem. Original global Spin(9) character, original paired SO(48), Spin(48) lift/cover, Fock-order covariance and BFSS physical spectrum are separate OPEN obligations regardless of the next run.
- Do not change original F9 source, F10E–F10M ancestors, pinned dependencies, warning policies, compilation limits, original Fock-label ordering, main branch or third-party upstream.
