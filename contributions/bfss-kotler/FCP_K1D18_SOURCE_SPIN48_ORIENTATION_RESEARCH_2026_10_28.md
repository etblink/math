# K1D18 — actual source Spin(48) orientation: research charter

**2026-10-28 UTC — OPEN, NOT FORMALLY QUALIFIED. Zero new Lean declaration roots.**
Owner-only branch `research/fcp-k1d18-spin48-orientation-20261028`, frozen parent `research/fcp-k1d17-isometry-laws-20261028@10848c058a5bf0c0f3ca7b554289089ef937ecdb`.
No `main` merge, original manuscript modification, community upstream PR, or physical theorem promotion.

## Accepted starting point, not the desired conclusion

The independently qualified [K1D17 strict source gate #40649929983](https://github.com/etblink/math/actions/runs/40649929983), tested commit `389ecdcc5a325905d656a36fb961fa949ab03f67`, certifies 81 selected declaration roots in a 37-module fresh qualification closure under Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`; the broader cumulative qualified-contributor ledger records 64 modules. K1D11/K1D14 establish the genuine exact two-sign source vector-action/GL-kernel theorem. K1D16 provides the actual `source48Quadratic.IsometryEquiv source48Quadratic`; K1D17 proves one/mul/inv laws in the source's contravariant composition convention. These statements do **not** prove orientation-preservation.

Source identity:
- `Source48Label := Fin 24 × Fin 2`; `Source48Vector := Source48Label → ℝ`.
- `source48Quadratic := QuadraticMap.weightedSumSquares ℝ (fun _ : Source48Label => (1 : ℝ))` from `SU2BFSSPhysicalDomainS1V0StandaloneOrthogonalGeometryProbe.lean` (owner blob `65db1f822b86bfbf400957a0aaa94784d6cb7a39`).
- Exact vector action: `FCP.BFSSS1V31.sourceSpin48VectorAction`, defined by unique source Clifford-generator conjugation, not a postulated SO(48) action.
- The K1D16 isometry source blob is `6367c33e426cfda4269a34bf1fb8a71dec7fb8bc`, K1D17 source blob `610325c863e509304b31d8914d9652971cddcd3f`.
- Existing `FCP.BFSSS1V37.source48_rankOneConjugationMatrix_det` proves determinant `-1` for the original 48-label matrix `-(I-aℓᵀ)` **assuming** `ℓ ⬝ᵥ a = 2`; `source48_polar_inverse_self` gives normalized scalar self-pairing. Both are relevant source lemmas but are **not yet** an arbitrary-generator determinant action theorem. Verify their exact independent gate/source qualification before citing them as accepted ancestry.

## Scientifically load-bearing proposition

Prove on the actual original source types, with no surrogate representation:

```lean
∀ s : spinGroup source48Quadratic,
  LinearMap.det
    (FCP.BFSSS1V52K1D16.originalSourceSpin48QuadraticIsometry s :
      Source48Vector →ₗ[ℝ] Source48Vector) = (1 : ℝ)
```

This is a **target statement**, not a committed source file or a verified theorem. Once qualified, a separately checked construction can target the original orientation-preserving quadratic isometry group (SO(48)); it still would **not** establish image surjectivity, a topological covering, the global Spin(9) lift, source Fock/gauge covariance, or any BFSS physical eigenstate.

## Proof strategy: test interfaces, then compose

**O1. Source polar-coordinate bridge.** For invertible original `Q a`, define the normalized polar-coordinate functional `ℓ_a(j) = ⅟(Q a) * QuadraticMap.polar Q a (Pi.single j 1)`. Show precisely `ℓ_a ⬝ᵥ a = 2` using `weightedSumSquares_apply`, the literal 48-label coordinate basis, and `QuadraticMap.polar_self`. No guessed basis order or abstract Euclidean replacement. A typed finite-coordinate intermediate is preferred over expanding every quadratic expression at once.

**O2. Genuine generator action / determinant bridge.** For a Clifford unit represented by `ι Q a`, prove that actual conjugation on the original vector space has the `S1V37` rank-one matrix `-(I-aℓ_aᵀ)`; invoke its already source-sized determinant lemma. Do **not** infer O2 merely from the existing rank-one matrix's determinant: identifying that matrix with the true Clifford action is a separate proof. The inversion and `Q a` hypotheses must be exact.

**O3. Extend via the actual pinned Lipschitz closure.** In pinned `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`, `lipschitzGroup` is the **subgroup closure** of invertible degree-one Clifford generators; `pinGroup = lipschitzGroup ∩ unitary`, and `spinGroup = pinGroup ∩ even`. The source does not define Spin merely as a syntactic list of even generator pairs. Develop a genuine Lipschitz vector action and determinant multiplicativity with exact source conjugation, then use `Subgroup.closure_induction''` with generator, inverse, one and product cases. Avoid assuming an unproved even-word decomposition.

**O4. Grade/parity sign bridge.** Relate the determinant sign under the generator action to the Clifford involution's sign on the same generator. Each original invertible 48-real vector conjugation has determinant `-1`, while `involute (ι Q a) = -(ι Q a)`. Prove the invariant through the closure and restrict it using the accepted source `spinGroup.involute_eq`. This should force determinant `+1` on genuine even elements, but the closure-to-linear-action map, inversion cases, and scalar transfer remain unproved today.

**O5. Package the exact original target.** Only after O1–O4 individually qualify, compose into the exact K1D16 isometry statement, then separately build an SO(48)-valued group hom and investigate the continuity/covering and group-lift obligations.

## Failure tests and stop conditions

1. **False-generalization test:** Ordinary Clifford conjugation by a single vector in an odd-dimensional source need not have determinant `-1`; dimension parity is essential. Never replace `Fin 24 × Fin 2` silently by arbitrary `M`.
2. **Wrong-generation test:** `spinGroup` is an intersection of subobjects, not by definition the set of even-length generator words. A proof that only checks products of two generators is insufficient until an exact closure-generation theorem is established.
3. **Representation test:** A determinant calculation for an abstract rank-one matrix does not establish the determinant of the actual K1D16 source action without O2.
4. **Elaboration test:** For a large `IsometryEquiv`, prefer typed `toLinearEquiv`, `toIsometry`, source `LinearMap.det`, coercion/field bridges, and exact pinned theorem inspection **before** changing recursion/heartbeat limits. The K1D16 budget increase is a historical exception, not the K1D18 default.
5. **CI stop:** After two no-information wrapper or identical definitional-conversion failures, stop and improve an offline/isolated source interface probe. A failed compiler cannot certify a root even if it printed some allowed axioms.

## Formal gate contract for subsequent candidate

Pin original `S1V0`, `S1V37`, `S1V31`, K1D16/K1D17 and all required source descendants, Lean v4.34.1, Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`, exact candidate Git blob and strict verifier. Require the complete accepted ancestor closure, fresh compilation to nonempty `.olean`, warning-as-error, exact theorem types, `#print axioms` for each explicitly enumerated root with allowed set only `propext`, `Classical.choice`, `Quot.sound`, no `sorry`/`admit`/`axiom`/`sorryAx`, and preserved compiler/evidence artifacts. No numerical result or plausible paper proof counts as Lean acceptance.

The K1D17 accepted-ancestry cache pilot is an **independent performance study**; its cold source-seed run is qualified, its warm behavior must be separately verified, and branch-scoped cache access is not presumed on this research branch. New candidate proofs must always compile fresh.

## Physical and publication boundary

The [FCP actual-source Spin(9) center/orientation audit](https://github.com/etblink/Foundational-Convergence-Program/blob/research/openai-math-su2-s1v52-global-lift-scoping-20261019/audits/FCP_BFSS_ACTUAL_SOURCE_GAMMA_SPIN9_CENTER_ORIENTATION_2026_10_27.md) has confirmed exact finite gamma-label/permutation facts but leaves a source-exact continuous global Spin(9) group-to-source-Spin(48) lift, actual CAR/Fock implementation, gauge commutation, closed physical form covariance, and spectra unresolved. A future positive determinant root settles none of these automatically.

**Decision:** Start with O1/O2 source-bound interface verification, preserve negative results, and do not prematurely file a global orientation or physical theorem claim.
