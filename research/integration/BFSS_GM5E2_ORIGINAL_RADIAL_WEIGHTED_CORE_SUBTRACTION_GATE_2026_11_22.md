# GM5E2 — exact original radial weighted Fock core subtraction

**Classification:** staged candidate, **not qualified**. This microgate does not assert global physical weight/domain control.

## Theorem contract

Using accepted GM5E1 `radialWeightedCore`, prove on original `f,g : SmoothCore N`:
```text
radialWeightedCore (f - g) = radialWeightedCore f - radialWeightedCore g.
```

This is a statement in the genuine original `FullL2 N` with weight `√‖x‖`. Prove it from original `BFSSSliceSobolev.weightedToL2_ae`, `Lp.coeFn_sub`, smooth-core pointwise subtraction and `smul_sub`. Bind it independently to the literal paired SU(2) invariant Fock core.

**Exact gate:** one native theorem, one independent consumer theorem, strict 9k+ native build, source and consumer axioms only `propext`, `Classical.choice`, `Quot.sound`; original provider artifact on success or failure. Frozen source identity for GM5E1, GM5D, GM5E0, GM5C, exact original gauge and Sobolev files; pinned Lean 4.34.1 / Mathlib. No `sorry`, `admit`, `unsafe`, new axiom, or Lean resource-budget change.

## Why this gate is needed

Qualified GM5E1 bounds `‖gradient f‖²` by the normalized true charge-square and the first radial-weighted core norm. To apply this to Cauchy **differences**, we must identify weighted output on `f_n-f_m` with the difference of the weighted outputs. This theorem, along with GM5D's qualified `LinearPMap.map_sub` source adapter, is a direct dependency for GM5E3 conditional graph gradient limits.

The next graph-limit theorem must assume actual original charge-output convergence, original physical input convergence, and radial weighted-`FullL2` convergence. It concludes only strong gradient convergence on the resulting **joint weighted core graph closure**. Do not silently identify that closure with arbitrary `Dom(T) ∩ Dom(M_{√r})`, or infer bosonic potential/multiplier operator limits, compact resolvent, gap, eigenvector, Hopfion, GUT or a Standard Model theorem.

The historical 27 M4 anchors, W0C2B2 BLOCKED, and GM5D R1/R2 REDs remain unchanged.
