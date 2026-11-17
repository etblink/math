# W0A4 stopped — forward architectural redesign for BFSS × QIT / SCC

Date: 2026-11-17 Pacific. **Read-only mathematical planning; no new Lean gate staged.**

## Current immutable boundary

Last-qualified: W0A3 R1 [#44051746176](https://github.com/etblink/math/actions/runs/44051746176), exact identity on real-source pure complex tensors:
```
Φ(ι(z ⊗ₜ[ℝ] v)) = z • sourceGammaRealLinear v
```
W0A4 R1 [#44055363556](https://github.com/etblink/math/actions/runs/44055363556) and R2 [#44059417729](https://github.com/etblink/math/actions/runs/44059417729) both RED at the source definition of a *new* complex-linear map. The W0A4 route is STOPPED, not disproved. Do not qualify `activeGammaComplexLinear`.

## Lower-assumption alternative: direct commutant predicate induction

For `T : Fermion 2 →L[ℂ] Fermion 2`, assume `h : ∀ p : Source48Label, Commute T (sourceNormalizedGamma p)`. Define the **property**, not a new linear map:

```lean
def C (w : ℂ ⊗[ℝ] Source48Vector) : Prop :=
  Commute T
    (FCP.BFSSS1V52M3I.originalComplexCliffordFockAlgEquiv
      (CliffordAlgebra.ι (source48Quadratic.baseChange ℂ) w))
```

One exact real-source lemma: `Commute T (sourceGammaRealLinear v)` from `sourceGammaRealLinear`'s finite sum over `Source48Label`, `Commute.smul_right` and `Commute.sum_right`. Pinned Mathlib confirms these interfaces.

One exact complexified-source lemma: `∀ w, C w` by `TensorProduct.inductionOn`. Pure tensor case uses qualified W0A3 and scalar closure of commutation. Addition case needs **only** additivity of original `CliffordAlgebra.ι` and `originalComplexCliffordFockAlgEquiv` plus `Commute.add_right`. Crucially, the target already is `Φ(ι w)`; **no `activeGammaComplexLinear` object is constructed or transported**.

This produces the W0B0 centralizing-gamma theorem without asserting W0A4's failed new-map equality. W0A3's exact source equivalence for pure tensors is sufficient for the induction bases.

## Downstream separate gates

1. W0B1: `CliffordAlgebra.induction` from commutation with `Φ(ι w)` to commutation with `Φ a` for all original complex Clifford elements `a`; preserve base scalar and multiplication/addition cases.
2. W0B2: explicit source-exact adapter from complex-continuous endomorphism `T` to `Module.End A (Fermion 2)`, using M3B original Clifford action and M3C's already-existing scalar-commutant theorem. Type mismatch is a real obligation, not a cast.
3. W0C: normalized original trace `T1OriginalFockTraceInvariance.originalFockTrace` eliminates scalars using `trace_one` and the nonzero original vacuum/finite-dimensionality; prove witness injectivity on the full operator algebra.
4. QIT layer after algebraic proof: investigate parity/gauge visibility, 47-of-48 witness minimality on parity-even subalgebra, and conditional expectation/twirling quantitative bound without conflating with BFSS Hamiltonian gap.

## Acceptance and negative-knowledge safeguards

A successor, if authorized, needs a new pre-gate theorem contract and source-exact strict workflow. Preserve untouched W0A4 R1/R2 ZIPs and full job logs; do not rewrite W0A4 history. No user-visible claim of complete witness injectivity or physical measurement completeness until its own Lean gate qualifies. No branch split; use unified integration for future accepted work, `main` untouched.

**Recommendation:** Favor *predicate induction on the already existing Clifford generator map* over constructing another complex-linear operator map. This preserves the proof destination while avoiding the failed typeclass interface entirely.
