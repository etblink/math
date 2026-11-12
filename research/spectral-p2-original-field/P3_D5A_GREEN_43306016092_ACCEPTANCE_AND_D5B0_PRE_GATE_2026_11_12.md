# BFSS P3-D5A accepted; D5B0 first original-Fock finite-L² column gate (2026-11-12)

## Acceptance: P3-D5A

- Run [#43306016092](https://github.com/etblink/math/actions/runs/43306016092), original source + independent consumer complete GREEN, exact tested commit `9d9e27e5f0c9c2638526431c9e1a9ddaf7d3af4e`.
- Lean 4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, 67 pinned source/consumer blobs PASS and only `propext`, `Classical.choice`, `Quot.sound` reported.
- Qualified D5A source blob `b5ab5d1fe86eaf5720eb22f9c70a666477f3fa79`, independent consumer `78bce6688bdfb8b801bd82ae49271f9ded910cb9`, verification artifact `13984747847`, SHA-256 `c88825ce61fdda92f153bacc51576198faa0f1321da495f75f2b32e32cc217c6`.
- Exact original operator norm on `Fermion 2 →L[ℂ] Fermion 2` remains unchanged. The `≃ₗ` into `PiLp 2` and trace-Hilbert pairing equality are qualified; it is not an `≃ₗᵢ` from the operator norm.

## D5B0 source-exact, generic-first candidate

- New source `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/P3D5B0OriginalFockL2Columns.lean` builds an **abstract carrier first** proof of `MemLp f 2 μ ↔ ∀i, MemLp (fun x => f x i) 2 μ` for finite `PiLp 2` (Mathlib's `memLp_piLp_iff`), then specializes to literal `Fermion 2` output columns.
- Proves an `Lp (PiLp 2 (ι → Fermion 2)) 2 μ →L[ℂ] Lp (Fermion 2) 2 μ` coordinate projection via `PiLp.proj` and `ContinuousLinearMap.compLpL`; verifies almost-everywhere equality with `coeFn_compLpL`.
- Independent consumer checks both directions of L² membership, AE projection, and a specialization to the **original bosonic base** `Boson 2` with Lebesgue `volume`, not a surrogate.
- Adds exact two D5B0 blobs to all previously accepted 67 pins = **69** manifest pins, exact source/consumer import checks, distinct D5B0 Lake/olean/source and warning-as-error independent consumer.
- This gate is intentionally smaller than proving the full `L²(X;PiLp₂ ι F) ≃ₗᵢ PiLp₂ ι (L²(X;F))`. That equivalence and finite sum/integral interchange remain future obligations. The `End(F)_{​HS}` fiber vs. original operator-norm field, SU2 gauge, physical fixed space, closed Hamiltonian and spectral existence remain untouched and unproved here.
- Source API pins inspected on the identical Mathlib SHA: `Mathlib/MeasureTheory/SpecificCodomains/WithLp.lean` (`memLp_piLp_iff`), `Mathlib/Analysis/Normed/Lp/PiLp.lean` (`PiLp.proj`), `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean` (`compLpL` and `coeFn_compLpL`).
- **Status:** D5B0 only a candidate pending a separate strict green. First causal RED diagnosis required; no increased heartbeats, no modified accepted mathematical source.
