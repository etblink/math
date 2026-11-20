# RHOPF-P9C3D2F0 R1 — native matrix-notation RED and bounded R2 recovery

**Date (local):** 2026-11-19
**Canonical branch:** `integration/bfss-unified-research-20261108`.
**Original R1 run:** [#44650911660](https://github.com/etblink/math/actions/runs/44650911660), attempt 1, FAILURE.
**Exact tested commit:** `a516e0d10316ea6ed81cb64488b49f0ddfda6339`.
**Original job:** `136005263456`.
**Original failed artifact:** [#14590789854](https://github.com/etblink/math/actions/runs/44650911660/artifacts/14590789854). Independently downloaded ZIP SHA-256 `c3a2474110367521a3cff404e81df8defcf5cfc160670c70beee2f20878b36aa`, matching GitHub original artifact digest; independently read `exact-tested-commit.txt`, identical to R1 SHA. The ZIP includes original native failed Lean log, source integer fixture, accepted original dependency-build transcript and exact toolchain manifest. Independent consumer was skipped.

## Classification: native source notation/elaboration failure

- Frozen original Gamma9/Core and all accepted dependency hashes, source import/declaration contract, toolchain Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, independent original signed-permutation integer Gamma9 fixture and cold accepted dependency build: PASS.
- Original native source `RHOPFP9C3D2F0OriginalGammaCircleQuadraticFormInvariance.lean:37:47`: `error: elaboration function for Mathlib.Tactic.subscriptTerm has not been implemented`, pointing at standalone `ᵥ` in broken vector-matrix notation `((rho(z).mulVec v) ᵥ* rho(z))`.
- Secondary unsolved goals in lines 38 and 31 follow the malformed expression. The source theorem axiom report includes `sorryAx`, so R1 remains unqualified; the independent consumer did **not** run.
- This is a Lean parser/elaborator/proof-script RED. It does not disprove the previously strict-qualified source-original `rho(z)ᵀ rho(z)=I`, nor does it qualify norm invariance.

## Exact bounded repair R2

Replace only the malformed notation expression:
```lean
(((relationalCircleMatrix z).mulVec v) ᵥ*
  relationalCircleMatrix z) ⬝ᵥ v
```
with the explicit Mathlib function:
```lean
(Matrix.vecMul ((relationalCircleMatrix z).mulVec v)
  (relationalCircleMatrix z)) ⬝ᵥ v
```
in the same `calc` step. Keep `Matrix.dotProduct_mulVec`, `Matrix.mulVec_transpose`, `Matrix.mulVec_mulVec`, source original `relationalCircleMatrix_orthogonal`, and the theorem statement unchanged. Update only the one frozen source blob SHA in the strict original workflow. Do **not** modify original Gamma9 source, Core, projectors, physical Fock/gauge/Hamiltonian, independent consumer, native proof resources, Lean/Mathlib pins or axiom requirements.

R2 must re-run exact original-source preflight, independent original integer fixture, native and imported independent warnings-as-errors Lean compilation, both `#print axioms` containing only `propext`, `Classical.choice`, `Quot.sound`, and archived original ZIP integrity checks. Preserve any new RED independently and make no acceptance claim before native and consumer strict GREEN.

## Mathematical goal and scientific boundaries

The target is exactly `(rho(z)v) ⬝ᵥ (rho(z)v) = v ⬝ᵥ v`, derived from previously accepted original source `rho(z)ᵀrho(z)=I`, for the original real 16-spinor carrier. This is an intermediate prerequisite for restricting the accepted algebraically free Circle action on the nonzero P-image to a unit norm sphere. It is **not** yet a continuous packaged sphere action, source-exact `S³` homeomorphism, Hopf orbit quotient, physical 24-mode Fock implementation, SU(2) Gauss/Hamiltonian covariance, Spin(9) global equivariance, or empirical Standard Model result. Preserve all prior native/consumer REDs and their full original diagnostics.
