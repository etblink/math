# TD-C1A D2 — preregistered bounded typed-expression comparison

**Date:** 2026-11-13 Pacific. **Experiment:** `E-TD-C1A-D2-STRUCTURAL-EXPR-001`.
**Status:** prospective / source-interface review; NOT EXECUTED when registered.
**Parent checkpoint:** `44d16ad0f1148902b8446bbac38cfe208b623c50` on `integration/bfss-unified-research-20261108`.
**Qualification:** false. TD-C1A stays `RED_UNQUALIFIED`.

## Observed boundary and exact question

D0 #43554665838 proves the literal direct pointwise axis source consumer compiles while native axis/operator and native conditional-evaluation joins recurse. D1 #43556707461 proves explicit operator-application rewrites compile on variable original-Fock data, but actual axis and conditional-evaluation joins still recurse at final `exact` (26:8 and 28:8), despite matching printed statements. The D1 source files and raw logs are frozen.

**Question:** Within the **same local context**, how do the *actual elaborated expression trees* of (a) the successful literal original-axis witness and D1's post-ext/post-simp goal, and (b) the D1 normalized `heval` hypothesis and its goal, compare? At what first bounded argument path do they diverge? Raw expression equality, α-equivalence, definitional equality, and kernel acceptance are separate notions.

## Audited Lean 4.34.1 public surfaces

Source-reviewed at `leanprover/lean4/v4.34.1`, without relying on present-day Lean APIs:

- `src/Lean/Expr.lean`: `Expr.equal` (structural, considers binder annotations), `Expr.eqv` (alpha-equivalence), `Expr.getAppFn`, `Expr.getAppArgs`; use raw expressions, never `whnf` or recursive simp in the inspector.
- `src/Lean/Meta/Basic.lean`: `getFVarFromUserName` and `inferType` for typed local witnesses; do not elaborate theorem applications against the goal as an expected type.
- `src/Lean/Elab/Tactic/Basic.lean`: `getMainTarget`, `withMainContext`; inspect the goal after the actual ext/rewrite tactics.
- `src/Lean/LocalContext.lean`: `LocalDecl.value?` is available if a future design needs an explicit local let, but this D2 design does not depend on it.

Source review establishes existence/signatures only; syntax and runtime remain untested until the pinned Lean build.

## Prospective controlled comparison

Four independent diagnostic leaves:

1. **Literal D0 positive control.** Use the original `C48C1A1d0` axis theorem in the identical pointwise statement; inspect a separately elaborated source witness, then complete the already accepted direct consumer. Require a raw-expression report, successful proof, and standard-axiom audit.
2. **Variable original-Fock positive control.** Use variable `U,A,B,h` on the exact `Fermion 2` carrier with the same D1 operator ext/application simplifications, then compare `h ψ` against the actual post-rewrite goal. Require proof/axiom success.
3. **Actual native axis observation.** Recreate D1's pointwise goal through `ContinuousLinearMap.ext` and the *same* three public rewrites. Form the original source witness independently using `have hsource := originalGaugeUnitary_S1J_gamma_axis_forward ...`, then inspect its inferred type against the actual goal. **Stop observation deliberately**; do not invoke `exact`, `simpa`, `change`, or a candidate repair.
4. **Actual native evaluation observation.** Form `heval := congrArg (fun T : Fermion 2 →L[ℂ] Fermion 2 => T ψ) h`, normalize that hypothesis using the unchanged D1 public rewrites, and inspect its actual type against the goal. **Stop without proof retry.** The operator identity `h` is an assumption only.

Frozen prerequisites: original Core blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`; original axis source blob `4d418ade58f8c3c1d998f623f5a5697723cb3d29`; Lean `v4.34.1`; Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. All D0/D1 diagnostic sources, original full theorem, independent full consumer and strict workflow are frozen.

## Instrumentation limitations and interpretation

- Perform **raw structural** and alpha comparisons first, with at most 32 descent steps into application arguments and a bounded fixed-size report (target/witness equality flags; first differing path; shallow constructor/head names, universe-list lengths and metavariable presence).
- No `pp.all`, no unrestricted expression dumps, no `whnf`/`isDefEq` normalization of the full native Fock construction, no dimension enumeration, no local recursion/heartbeat increase, no new axiom or `sorry/admit/unsafe`.
- The two native observations **must not close a new theorem**. Their expected source-file failure is a deliberate diagnostic stop after a verified report; any `sorryAx` compiler recovery is never a qualified root.
- Inspect the successful controls **before** the costly original axis build, except the literal D0 control, which necessarily needs that source. Each candidate has a separate bounded process/log and must not suppress another.
- The D2 collection verdict is not a theorem. Workflow color is not proof qualification. Preserve exact tested SHA, source hashes, raw logs, command return codes, expected stop marker and output digest.

If the first difference is a carrier, universe, scalar hom, module/normed/topological instance, coercion path or data argument, **record the path without inferring its cause**. If raw expression structures match but Lean historically failed at `exact`, label that a checking-context/definitional-comparison question, not a compiler bug. If controls fail or the native reports are missing, label the diagnostic inconclusive.

## Stopping rule / next decision

A successful D2 run grants a **read-only interpretive comparison**, not permission for cosmetic proof retries. A future new proof attempt requires a demonstrated difference and a source-reviewed minimal adapter, or a genuinely independent construction avoiding the same measured boundary. Until then TD-C1A stays `RED_UNQUALIFIED`; accepted M5BF0/G0B2, TD-C1B, G0B3, original source and main remain unchanged.
