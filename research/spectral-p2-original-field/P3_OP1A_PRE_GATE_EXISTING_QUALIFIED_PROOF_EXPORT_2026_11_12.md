# P3-OP1A pre-gate evidence receipt — existing proof, importability only

**Date:** 2026-11-12 (Pacific). **Project Lead decision:** GO for a *source-export-only* gate, **NO NEW MATHEMATICAL PROOF**.  
**Repository/branch:** `etblink/math` / `integration/bfss-unified-research-20261108`.  
**Parent prior to this receipt:** `7da98c84ca26495430bcd617bb058ec9bf37de8d`.  
**Proven scientific ceiling:** ordinary algebraic original-Fock-operator trace pairing under the existing source Spin(9) star-automorphism, no continuity, gauge-left-output compatibility, Fock-vector implementer, physical operator-domain or spectral theorem.

## Exact target and genuine missing interface

Let `OriginalFockOp := Fermion 2 →L[ℂ] Fermion 2`, with the **original** 48-Majorana `Fermion 2 ≅ ℂ^(2^24)` fiber and the actual Hilbert adjoint. Define `originalFockTracePairing S T := originalFockTrace (star S * T)`. Export an importable theorem for every source `g : spinGroup source9Quadratic` and original `S,T`:
`originalFockTracePairing (α_g S) (α_g T) = originalFockTracePairing S T`.
Here `α_g := source9Spin_originalFockOperatorStarAutomorphismHom g`. This is an algebraic trace identity and **not** Hilbert–Schmidt positivity, source-topological continuity or original physical Hamiltonian covariance.

The exact mathematics is **ALREADY PROVED AND STRICT-QUALIFIED** as
`FCP.BFSST1OriginalFockTraceIndependentAudit.originalFock_trace_pairing_invariant`
in `lean/diagnostics/BFSST1OriginalFockTraceIndependentAudit.lean`, blob `e3ce4de9987a07a7405c29ece850b9b203eeade7`. This was an independent **diagnostic consumer**, not a reusable `OAI` library module compiled into the source dependency tree. Reusing its exact proof text in one importable source module is a *transport of an accepted derivation*, not novel theorem construction.

## Actual retrieval and evidence matrix

| Item | Exact evidence | Disposition |
|---|---|---|
| Physical-star action B3 | `P2bB3OriginalFockStarAutomorphismAction.lean` blob `b50ef04695587b267ad8519074b1293f98828749`; green [#42764649026](https://github.com/etblink/math/actions/runs/42764649026) | DIRECT DONOR |
| Ordinary original trace T1 | `T1OriginalFockTraceInvariance.lean` blob `3be6c9a6f2898484df66690f94fdfa1877660897`; green [#42769361446](https://github.com/etblink/math/actions/runs/42769361446) at `b05b97260bb56718110f014a1052b54bc74bafa2` | DIRECT DONOR |
| Exact pairing theorem | `BFSST1OriginalFockTraceIndependentAudit.lean` blob `e3ce4de9987a07a7405c29ece850b9b203eeade7`; same strict run validates its independent `#print axioms` root | **EXACT QUALIFIED PROOF**; non-importable diagnostic location |
| Monograph Chapter 8 | `docs/bfss-internal-research-monograph-20261111`, Chapter 8 Section “Hilbert–Schmidt consequence” | CONVENTIONAL NARRATIVE, no separate Lean certificate |
| Prior OP1A memo | `research/spectral-p2-original-field/P3_OP1_TRACE_PAIRING_AND_C4B_FALLBACK_2026_11_12.md` | PROPOSAL SUPERSEDED by existing qualified diagnostic |
| P2-C4B | green [#43249643884](https://github.com/etblink/math/actions/runs/43249643884), exact `e4b07eba3f64525d7f48206558a2f5e524d3644e` | QUALIFIED predecessor milestone; not a trace dependency |
| Mathlib pinned `LinearMap.trace_eq_sum_inner` | `Mathlib/Analysis/InnerProductSpace/Trace.lean` at `d13f23b723b8a846827a245b89c10fc7d3f11612` | OP1B ONLY; not needed for OP1A |

Checked the current target sources and the exact diagnostic proof text, T1/B3 acceptance chronology, November 10 evergreen, pre-gate protocol, P3 operator-column memorandum, internal monograph Chapter 8, and pinned Mathlib trace page. Not claimed exhaustive across all FCP branches or upstream modules. GitHub default-branch code search returning zero does **not** establish nonexistence.

## Negative knowledge and stop rules

- B3 [#42762309173](https://github.com/etblink/math/actions/runs/42762309173) source compiled but consumer generic `map_star` typeclass synthesis timed out; accepted consumer instead used the *typed* B2 original-Fock physical-star theorem. **Copy the accepted hstar/hmul steps exactly** rather than relying on a broad generic `map_star` search.
- T1 initial red [#42767247872](https://github.com/etblink/math/actions/runs/42767247872) was trailing `No goals to be solved` after `congr 1`, not a mathematical failure.
- P2-C4B reds were massive `AlgebraData` conversion/recursion failures unrelated to this trace gate; do not import original massless energy merely for this finite operator identity.
- No new Fock carrier, `2^48` basis enumeration, non-original trace, `sorry`, `admit`, `unsafe`, custom axioms, heartbeat escalation, blanket warning suppression or changed historical files.
- If exact proof transport cannot elaborate because of namespace/type or dependency visibility, classify the first causal error and repair **only** the adapter. Do not redo B2/B3/T1 mathematics.

## Bounded source-export gate and independent validation

Create one importable `OAI.MathematicalPhysics.BFSS.Contrib.Kotler.P3OP1AOriginalFockTracePairing` module. Its sole import is `T1OriginalFockTraceInvariance`, its exported definition and theorem state the exact original pairing; theorem proof is a source-module relocation of the previously qualified diagnostic proof body. New independent consumer tests the general original expression and its diagonal specialization, not merely a zero operator.

The strict workflow must pin the **original 55 T1 source/consumer closure Git blobs** plus the two new source and consumer blobs, toolchain Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, compile the source cold and separately consume it with warnings-as-errors, audit its exact `#print axioms` roots against `propext`, `Classical.choice`, `Quot.sound`, preserve logs and tested SHA, and fail closed on any unqualified dependence.

**GO criterion:** importability is the actual missing interface. A green source/consumer strict gate qualifies the exported reusable declaration only. If it fails, remain CANDIDATE; do not infer mathematical disproof from a compiler, linter or preflight red.

**Next substantive gate after source export:** OP1B finite-dimensional Hilbert–Schmidt positivity / actual orthonormal-basis column identity, using pinned `LinearMap.trace_eq_sum_inner`. The OP1A identity does not itself produce the finite-column isometry or original Hamiltonian closed-graph match.
