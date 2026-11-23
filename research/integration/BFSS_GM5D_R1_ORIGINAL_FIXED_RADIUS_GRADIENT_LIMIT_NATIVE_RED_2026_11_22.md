# GM5D R1 — original fixed-radius gradient limit native RED (2026-11-22)

**Disposition:** R1 is unqualified. Preserve first-causal diagnostic and do not promote the final convergence theorem from the three earlier successful axiom reports.

- [Exact original run #45102407563](https://github.com/etblink/math/actions/runs/45102407563): conclusion **failure**, attempt 1; tested commit `26373ec7cdfb934e255401921b8a547b780aa772`; original job `137456018880`.
- Frozen source / independent-consumer preflight PASS; exact Lean 4.34.1 and pinned Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restoration PASS. The failure occurred in the original native source build; no independent consumer completion.
- **First Lean error**, source line 65 column 14, in `nativeCoreChargeValue_sub`: `rw [hinput, map_sub]` applied `hinput` but the remaining `map_sub` rewrite did not recognize the coerced original `LinearPMap` application, reporting `Tactic rewrite failed: Did not find an occurrence`. The displayed target had the genuine original native charge column applied to `closedChargeCoreInput M G f - closedChargeCoreInput M G g`.
- **Second Lean error**, source line 134 column 4: the raw `Submodule.isClosed_topologicalClosure` term did not elaborate as the `IsClosed` set statement for the original vector-valued Sobolev graph. This is an elaboration/type-presentation error; it is not evidence of a false closed-graph statement.
- `coordinateDirection`, `sourceCoreGradient_norm_sq`, and `fixedRadiusCoreGradient_sq_le` printed only `[propext, Classical.choice, Quot.sound]`. The final `fixedRadiusNativeGraph_gradientLimit` printed `[propext, sorryAx, Classical.choice, Quot.sound]` due to the failed proof. No downstream acceptance is permitted.
- [Original provider artifact #14786836660](https://github.com/etblink/math/actions/runs/45102407563/artifacts/14786836660), runner-uploaded ZIP 16,869 bytes with upload-log SHA-256 `da88156dae66b8e895d1755c745a00a0c361b9ee8ef9f549802008559df67ab4`. The job log and provider artifact URL were inspected; the ZIP contents/CRC were **not independently downloaded and audited** in this record. Do not mislabel the ZIP as locally archived.
- Original tested blob identities: source `0c798931e4cca5b5e9a5147b6286aa4621b9ad4f`; independent consumer `30c61113bf6329d919ea7d2981d5a1dedae9f2e0`; strict workflow `8b4c4a389b7fabbf070cae9671262c9eb1e75a7e`.

## R2 bounded repair candidate

Preserve all public theorem statements, dependency imports, the independent paired SU(2) consumer, frozen-source pins, Lean resource limits, and strict workflow unchanged. Expose the original partial linear map's subtraction as a typed equality and apply the corresponding linear map law directly, rather than rewriting an unrecognized coerced term. State the Sobolev closed graph at its exact product-Hilbert set type and apply the existing topological-closure theorem through an explicit `change` boundary.

These are proof-interface changes only. They **do not** establish new physical results, domain density, global moment control, compact resolvent, mass gap, ground state, Hopfion, or a GUT. R2 must run its own exact original-source strict CI and independent consumer, with an archived receipt, before GM5D can be called qualified.
