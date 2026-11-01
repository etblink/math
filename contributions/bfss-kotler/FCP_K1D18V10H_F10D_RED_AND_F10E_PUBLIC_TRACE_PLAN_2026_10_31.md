# K1D18V10H — F10D RED accepted as negative knowledge; F10E public gamma trace route candidate

Date 2026-10-31 PDT. Branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.

## F10D verified failure and classification

- [Run #41268424166](https://github.com/etblink/math/actions/runs/41268424166), attempt 1, job `124735995043`, tested commit `62703ad8cdbeea3b68060fd92f774d6cf28db6c3` completed FAILURE. Exact source F10D blob `95c86b6bb5d5eda44552621bc3b8148560b47b31`. Pinned Lean `v4.34.1` and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Strict preflight PASS, dependency restoration PASS, accepted original F9 rebuild PASS. Fresh two-cell compile FAIL at **line 2**: `error: cannot use \`import all\` without \`module\``. Thus two-cell theorems **were not tested** and independent type/axiom audit SKIPPED.
- [Immutable artifact #13068349015](https://github.com/etblink/math/actions/runs/41268424166/artifacts/13068349015), SHA256 `667c42dab04336bbedfdbf50d9005c5c6bd86a128b8a39114b5023c2d7d5ae9e`. Preserve original red. There is **no mathematical counterexample** implied by this parser rejection.
- The pinned original `SU2RealGammaProbe.lean` is legacy-style, beginning with ordinary `import Mathlib` and no module-system `module` header. Modern Lean reference states that module-form imports require a module-form consumer and their targets must be modules. Therefore `import all` is **not a valid scoped access strategy** here without migrating accepted source modules, which is expressly outside this experiment's allowed scope.
- Combined with earlier immutable F10 Gate 1 [#41266215820](https://github.com/etblink/math/actions/runs/41266215820), Gate 2 [#41266892206](https://github.com/etblink/math/actions/runs/41266892206), Gate 3 [#41267510559](https://github.com/etblink/math/actions/runs/41267510559), the old direct private-table proof is **retired**. Gate 2 resolved 248 of 256 matrix cells but not the negative private signed-permutation diagonal. Gate 3 `change` tactic produced an unbounded cascade of errors rather than source-exact type reduction. All three original F10 declarations remain **unqualified**.

## Accepted working pattern F1–F9

Preserve exact original source statements, pin Git blobs, clean Lean and Mathlib dependencies, build accepted ancestors, compile warning-as-error and independently elaborate every exact theorem type and axiom closure. Source-typed public gamma/Clifford laws, direct determinant multiplication, explicit subtype and algebra-map type bridges, and finite-index source identity are successful. The nested `Matrix.detMonoidHom.comp` attempt, blind private unfolding, wrong Mathlib identifier guesses, unsupported parser imports, speculative `change` repairs and compiler-limit inflation are rejected methodological patterns.

## F10E new PUBLIC source-exact algebraic route (CANDIDATE)

Propose and independently gate FOUR declarations with only already accepted PUBLIC `FCP.BFSSGamma9.gamma_clifford` and pinned Mathlib `Matrix.trace_mul_comm`, `Matrix.trace_neg`, `Matrix.trace_sum`, `Matrix.trace_smul`:

1. `source9OriginalGamma_basis_mul_self`: each actual original gamma_i matrix squares to the identity, via exact original Clifford relation and entrywise cancellation (already used constructively in F9's qualified ancestry).
2. `source9OriginalGamma_anticommute`: original distinct gammas anticommute; no private data needed.
3. `source9OriginalGamma_basis_trace_zero`: for every source gamma_i, choose an explicitly distinct source gamma_j, conjugate gamma_i to -gamma_i using gamma_j²=I, use cyclic trace of real matrices and conclude trace gamma_i = 0.
4. `gammaNineRealLinear_trace_zero`: by public finite-sum trace linearity, the ACTUAL nine-source gamma linear combination used in F9 satisfies trace Γ(v)=0 for **every** real nine-vector v.

The determinant SIGN remains unproved. Formally, F9 already established det Γ(v) = ±Q(v)^8; adding trace Γ(v)=0 is genuine new evidence toward the eigenvalue multiplicity or characteristic-polynomial argument choosing + for the original 16-real representation. An eventual route must source-exactly formalize eigenspace dimension (8/8) for Q(v)>0, or an algebraic equal-characteristic-polynomial argument. No type-level Spin9 perfectness assumption, source connectedness assumption, changed basis, or copied signed-permutation representation.

## Qualification discipline and negative knowledge

F1–F9 remain ACCEPTED and immutable. F10/F10D remain RED and deliberately not imported into F10E; F10E pending. Do not imply `trace=0` from F9 or mark F10E qualified before green. No `sorry`, `admit`, `native_decide`, arbitrary new axioms, recursion/heartbeat increases, changes to accepted Lean source, pinned Mathlib, original paired-Fock indexing, main or external upstream. Unconditional Spin9 orientation determinant +1, original paired SO48, Spin48 lift/cover, Fock physical realization and BFSS spectral results remain OPEN.
