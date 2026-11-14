# TD-C1A R4 focused interface R3 — RED: invalid isometry-equivalence field

**Date:** November 13, 2026 Pacific. **Verdict:** RED / UNQUALIFIED. Native original-axis and Fock stages were not reached.

- Run [#43550275483](https://github.com/etblink/math/actions/runs/43550275483), attempt 1, tested **4f375b1a0a63a20ad7c1260e375aa19b16767306**, job **132310911779**.
- Artifact **14095099799**, 6,424 bytes, SHA-256 **2c675acedb3c550b3f0561d81ba44c1bc73285f76d4cfe59f1ec6eb29de1f3f4**. The downloaded ZIP digest was independently verified.
- Evaluation helper blob **a7a5e1b0b4f3f14fbb17a6b509cb7446d69bc3fe**; native probe **241dada0969f9f3f2c762b93e15d6e751bac637f**; workflow **7925c2284c898d911879aa7ff3055937eb5c1e32**.
- Raw P0/P0B logs, source pins and tested SHA are retained in [evidence](evidence/TD_C1A_R4_INTERFACE_R3_43550275483/).

## Exact first cause

Source and toolchain preflight PASS. P0 compiler and immediate explicit warning/root audit PASS. Adding Normed.Module.Basic repaired the earlier unavailable NormedField declaration.

P0B now fails at **21:6**, with the same error at **21:40, 29:11, 29:45**:
Invalid field toContinuousLinearMap; the environment does not contain LinearIsometryEquiv.toContinuousLinearMap for U:E≃ₗᵢ[𝕜]E.

These four occurrences are the same incorrectly assumed shortcut in the two helper theorem statements. The sorryAx reports come from invalid declarations. Both the expensive original-axis build and native P1 were skipped, so no claim about native recursion follows.

## Mandatory two-RED interface review

The helper introduced two distinct interface mistakes: missing normed-module import (R2) and a nonexistent direct field (R3). Do not just import a broad namespace to mask the latter. Audit the full conversion chain against the pinned Mathlib source before another run.

Mathlib d13f23b723b8a846827a245b89c10fc7d3f11612, Analysis/Normed/Operator/LinearIsometry.lean provides:
- LinearIsometryEquiv.toLinearIsometry;
- LinearIsometry.toContinuousLinearMap;
- explicit instance LinearIsometryEquiv.instCoeTCContinuousLinearEquiv and instCoeTCContinuousLinearMap;
- LinearIsometryEquiv.toContinuousLinearMap_toLinearIsometry, whose statement identifies the two-step map with the explicit coercion;
- LinearIsometryEquiv.coe_coe'', which identifies the underlying coerced continuous-map function with U by rfl.

Thus the source-reviewed expression is the explicit typed cast (U:E→L[𝕜]E), or the two-step U.toLinearIsometry.toContinuousLinearMap. The generic helper should use the explicit cast. Its native intermediate operator statements should use the same literal cast of the original G4E isometry, eliminating the same assumed shortcut consistently. The final pointwise original Fock target and original independent consumer must stay identical.

The normed-field/module assumptions are now explicitly imported, generic basis extension has a clean early audit, and the remaining helper body only uses ContinuousLinearMap.ext, function congruence and the documented composition multiplication. No resource escalation is justified.

**Decision:** preserve this RED and perform the complete explicit-cast interface correction in a focused preregistered probe, still stopped before native compilation if generic checks fail. Original full strict R4 remains unstaged. TD-C1A remains RED_UNQUALIFIED; accepted M5BF0/G0B2 remain unchanged.
