# BFSS P3-OP1B strict acceptance — original Fock trace columns

**Research date:** 2026-11-12 Pacific. **Branch:** `integration/bfss-unified-research-20261108`. **Status: ACCEPTED**, by original cold source and independent-consumer qualification.

## Exact successful evidence

- [Strict run #43271525095](https://github.com/etblink/math/actions/runs/43271525095), attempt 1, `completed/success`, job `131369054200`, tested commit **`c4ebbd8ed441b83cdc6e3f1b0df735f11685484a`**.
- 59/59 exact Git source and consumer blobs checked; pinned Lean 4.34.1 / Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612` restored; cold source build, independent source-treating consumer, warnings-as-errors, standard allowed `propext`, `Classical.choice`, `Quot.sound` axiom checks all passed. Terminal marker: `BFSS_P3_OP1B_ORIGINAL_TRACE_COLUMN_STRICT_GREEN`.
- [Artifact #13968994142](https://github.com/etblink/math/actions/runs/43271525095/artifacts/13968994142), SHA-256 `8b00da38f3e011cccaa98828a724bfcc51881104a85393ce7ff5081e7338f8ce`.
- Accepted source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3OP1BOriginalFockTraceColumns.lean`, Git blob `768e6557415816beefe1d0bf5ddae468d3a82452`; independent consumer `lean/diagnostics/BFSSP3OP1BOriginalFockTraceColumnsIndependentConsumer.lean`, blob `e15c23c047c93ed0aeefae9b07e65ffc019df411`; all 57 accepted OP1A/T1 ancestor source+consumer pins frozen.

## Precisely accepted statements

For the *actual* original `Fermion 2 →L[ℂ] Fermion 2` and any `b : OrthonormalBasis ι ℂ (Fermion 2)` with finite `ι`:
```text
originalFockTrace T = ∑ i, ⟪b i, T (b i)⟫_ℂ
originalFockTrace (star T * T) = ∑ i, ⟪T (b i), T (b i)⟫_ℂ
```
These use exact original Hilbert star, original finite Fock basis, trace under `originalFockEndAlgEquiv`, pinned `LinearMap.trace_eq_sum_inner`, and the typed adjoint-inner identity, without basis enumeration or a substitute matrix/Fock carrier.

This is a **finite-dimensional trace-column identity**. It does not yet state a separately qualified real-part positive-semidefinite theorem, definiteness, Hilbert–Schmidt norm/completeness, continuity of Spin(9) in its source parameter, original SU2 gauge-left-output covariance, physical Hilbert `L²` field columnization, form/closed-graph equality, original bound states or a BFSS mass gap.

## Red-to-green negative evidence

[Run #43268428683](https://github.com/etblink/math/actions/runs/43268428683) was red at `df24dca8869033f0e4335a977f8737db4e8c9d8c`, after 59/59 blob preflight and Mathlib restore. The **first errors were parser `expected token` at the original complex inner product's closing delimiter** in OP1B source lines 31 and 48, before independent consumer was reached. Unresolved declarations logged `sorryAx`; those outputs are *not mathematical evidence*. Exact red artifact [#13968256785](https://github.com/etblink/math/actions/runs/43268428683/artifacts/13968256785), SHA-256 `41d1be6a06404fe843a3e2c9df5184a68a3aa88c025e279565db22043585eec1`. Preserved diagnostic `P3_OP1B_RED_43268428683_PARSER_SCOPE_DIAGNOSIS.md`.

Narrow remedy inserted only `open scoped InnerProductSpace` in **new** OP1B source and consumer, and repinned precisely those two blobs in workflow; retained original theorem statements, proofs, all 57 historical pins, dependencies and strict resource/axiom contracts. Intermediate runs on partial commit states are not qualified; the final exact run `#43271525095` is the only accepted new receipt.

## P3-OP1C0 pre-gate source reuse and bounded decision

**Project Lead GO:** a new *very small* positive-semidefinite real-trace consequence of the accepted OP1B diagonal theorem, still on actual original `Fermion 2`:
`0 ≤ (originalFockTrace (star T * T)).re`
for arbitrary original `T` and a finite original `OrthonormalBasis` `b`.

**Exact donors inspected:**
1. Accepted OP1B `originalFockTrace_star_mul_eq_sum_inner b T`; no new form/star transport.
2. Pinned `Mathlib/Basic/Complex/BigOperators.lean` lines 43–45, `Complex.re_sum` (real part of finite complex sum), and pinned `Mathlib/Analysis/InnerProductSpace/Basic.lean` line 202, `inner_self_nonneg` (real part of complex diagonal inner product is nonnegative).
3. Pinned `Finset.sum_nonneg` standard finite-sum order transfer. Avoid unfolding Fock definitions or introducing a numerical `2^24` basis.
4. Existing original source/consumer + 59 exact blob pins and strict workflow can be copied as verification *architecture*; new C0 source/consumer must have own explicit imports, axioms and acceptance gate.

**Target only:** real-part nonnegativity as a reusable original-Fock operator cone interface. Do not smuggle in imaginary-part zero, definiteness (`Tr(T*T)=0 ↔ T=0`), full Hilbert–Schmidt norm/inner-product instance or a physical operator model. Those require distinct qualified gates.

**Stop rules:** if `simp` does not recognize `Complex.re_sum` over `Finset.univ`, use an explicit typed `map_sum` or small helper; record the first causal error, no max-heartbeats escalation, no extra axioms, no broad rewriting of original CAR or another `Fermion 2` model. New consumer checks arbitrary original `T`; source+consumer warning-as-error and `#print axioms` with only `propext`, `Classical.choice`, `Quot.sound`. Historical sources/workflows/monograph remain unchanged.

**Scientific ceiling:** OP1C0 positivity is a building block, not a source continuous Spin action, gauge reduction, original Hamiltonian spectral proof, positive bound-state existence or mass-gap claim.
