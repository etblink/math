# Project Lead — K1D18V8B Gate 1 accepted: native paired-Spin(9) adjacent bracket

**Date:** 2026-10-30 UTC. **Disposition:** `ACCEPTED_1_SOURCE_EXACT_LEAN_ROOT__NOT_FULL_SPIN9_ACTION`.

## Immutable accepted strict verification

- [GitHub Actions run #41143495333](https://github.com/etblink/math/actions/runs/41143495333), attempt 1, **completed/success** (updated 2026-10-30T23:22:39Z); job **124363061174**, **completed/success**.
- Exact workflow-tested Git commit **`c112b36c5a711d1c97eb17ee6f3b3532e975fbb4`** on research branch `research/fcp-k1d17-ancestor-cache-pilot-20261028`.
- Qualified candidate: `lean/OAI/MathematicalPhysics/BFSS/Contrib/Kotler/SU2BFSSPairedSpin9AdjacentLieBracketProbe.lean`; **immutable source blob `2186cce50ad2f06c125b7281cbe10f319d975a81`**.
- Exact source preflight passed pinned source gamma, original paired-label crosswalk, exact V8A module; pinned Lean 4.34.1 and Mathlib `d13f23b723b8a846827a245b89c10fc7d3f11612`. Pinned Lean/Mathlib restore and source/V8A ancestor compilation passed. `lake build` printed `Build completed successfully (8951 jobs)`, which counts dependency build jobs, **not** new V8B theorem roots.
- Fresh candidate `lake env lean -DwarningAsError=true` **PASS**, with no source warnings/errors; original exact `.olean` written. One expected `#print axioms` result appeared.
- Independent separate Lean audit imported the newly compiled module and checked an **exactly restated original-label theorem type** via a fresh `example`, plus `#check` and `#print axioms`, all **PASS**.
- The exact validator success marker: `K1D18V8B_EXACT_ONE_SOURCE_BRACKET_ROOT_TYPE_AXIOMS_PASS`.
- Allowed axioms only: `[propext, Classical.choice, Quot.sound]`; no `sorryAx`. No raised proof/resource limits.
- Preserved [GitHub Actions artifact #13019499036](https://github.com/etblink/math/actions/runs/41143495333/artifacts/13019499036), named `bfss-v8b-original-paired-adjacent-bracket-c112b36c5a711d1c97eb17ee6f3b3532e975fbb4-1`, **SHA256 `a9763c0f5fb38cc7502e56c66a2a58ad93ffc596a3e129109b146ca3e7abd549`**, size 978 bytes. Stores fresh compiler and independent axiom logs.

## Exactly accepted mathematical statement

`FCP.BFSSPairedSpin9Plane.originalPairedPlane_adjacent_bracket`:

```lean
(r s t : SpaceIndex) (hrs : r ≠ s) (hst : s ≠ t) (hrt : r ≠ t) :
  originalPairedPlane r s * originalPairedPlane s t -
    originalPairedPlane s t * originalPairedPlane r s =
  -(originalPairedPlane r t + originalPairedPlane r t)
```

This is exactly the adjacent-plane Lie bracket on the original `Source48Label = Fin 24 × Fin 2` via V8A's fixed source `pairedColorSpinEquiv`, literal `FCP.BFSSGamma9.gamma`, and the pinned Mathlib matrix Kronecker/reindex operations.

With (K_{rs}=-\gamma_r\gamma_s) on each color, transported by the native paired-label equivalence, the result is ([K_{rs},K_{st}]=-2K_{rt}) when (r,s,t) are pairwise distinct. **Do not rewrite to a positive sign**; the source sign and factor two are fixed. For normalized infinitesimal generator (J_{rs}=K_{rs}/2), this specific relation becomes ([J_{rs},J_{st}]=-J_{rt}).

An independent finite exact-integer source-gamma checker also evaluated all **504 distinct triples** with zero mismatches. That checker is a cross-check, **not** a substitute for or extension of the strict Lean theorem.

## Scope boundary and next obligations

- V8A [strict green #41141833097](https://github.com/etblink/math/actions/runs/41141833097): original paired 48-label plane skew/square, two independently verified theorem roots, unchanged.
- V8B: **one additional independently verified theorem root**, strictly about pairwise distinct adjacent planes. The complete `so(9)` commutator relations (shared and disjoint indices) and exact source `B`-tensor covariance are still **open** in Lean. The source finite evidence alone does not qualify those.
- Not proven: any continuous global Spin(9)-to-Spin(48) group homomorphism/lift, Spin/orthogonal topological covering or smooth Lie integration, original Clifford/Fock group implementation, full SU(2) gauge invariance, positive normalizable spectral solutions.
- Recommended next bounded theorem: one disjoint-plane commutator (four pairwise distinct spatial labels), `[K_{rs},K_{tu}] = 0`, first as a sixteen-gamma calculation, then source-label Kronecker and ring-equivalence transport. This is the missing complementary bracket class. Establish distinctness assumptions exactly; do not generalize prematurely to a Lie-group representation.
- Successful procedure: reuse exact accepted V8A typed bridge; isolate actual gamma algebra from original source 48-label transport; preserve exact source/toolchain/git pins; fresh source compilation and kernel-checkable separate Lean `example`; parse only axiom names, not formatted Lean theorem types. No new resource limits.
- Negative knowledge from V8A Gate 1–3 is retained unchanged in the preceding handoff and diagnostic audit records.

**Repository controls:** no changes to accepted V8A source, frozen FCP, `main`, or upstream mathcommunity. This acceptance record is documentary only; it must not alter the exact tested SHA.
