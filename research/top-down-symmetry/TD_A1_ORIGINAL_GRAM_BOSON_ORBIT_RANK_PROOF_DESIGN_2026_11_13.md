# TD-A1 — original Gram, 3-singular-value orbit, and rank-one valley source proof design

**Date:** 2026-11-13 Pacific. **Classification:** source-bound mathematical research design, no new Lean source and no qualification. Parallel to TD-C1A Spin/gauge join.

## Already source-present; avoid duplicating

- `BFSSVLY0AOriginalBosonGramGaugeInvariant.lean`, blob `5633ef2ed7cf182edaee171fb45273d325103b94`, defines the genuine `originalSpatialGram : Boson 2 → Matrix SpaceIndex SpaceIndex ℝ` with `G_ij=inner ℝ (spatialColor X i) (spatialColor X j)` and original `bosonGaugeEquiv q` invariance.
- `BFSSNORM0AOriginalGramTraceBound.lean`, blob `9d4ef34bcfe7f496b94c35e2efa114bf97cf98e9`, defines the original Gram trace `tr G` as sum of the nine diagonal inner products; proves `0≤tr G` and `|G_ij|≤tr G`.
- `BFSSJOIN0B1OriginalGramGammaTranspose.lean`, blob `4070cbb2b8e6538bb5c328651f8df5a2c77a4bf5`, already proves Gram symmetry and transpose compatibility for the original gamma-sandwich operator. Duplicating those would be scientifically wasteful.

## First genuinely missing mathematical statement

At the exact original source types, define the **rectangular** coefficient matrix `A_X : Matrix SpaceIndex (ColorIndex 2) ℝ` via `A_X i a=(spatialColor X i) a`. Prove `originalSpatialGram X = A_X * A_Xᵀ` using the original Euclidean source `spatialColor` inner-product convention, **not** by silently swapping spatial and color indices. Derive positive semidefiniteness and `rank(G)≤3`, since `Card(ColorIndex 2)=3`. The three potential positive eigenvalues are σ₁², σ₂², σ₃² for the singular values of `A_X`.

Then test the source quartic potential against `σ₁²σ₂²+σ₁²σ₃²+σ₂²σ₃²` with an explicit SU2 Pauli basis normalization. Show `V_quartic=0 ⇔ rank A_X≤1`, not merely `⇒` from a special configuration. No source potential identity or spectrum is accepted from this note.

## Why symmetry dimension-counting must not replace Hilbert analysis

Double SO9×SO3 orbits of the *bosonic matrix* are generically represented by 3 ordered singular values, but genuine physical Hilbert states are Fock-valued sections with stabilizer representations and a nontrivial Weyl/Jacobian boundary problem. The ordinary real 9×3 SVD Jacobian on the generic chamber is proportional to `∏_i σ_i^6∏_(i<j)|σ_i²−σ_j²|`; no exact original source measure pullback has been proved. After gauge-only reduction the original system is still substantially higher-dimensional.

For rank one, `X=r⊗u` and the true SU2 gauge color action can send `u↦−u`, hence the residual nonzero spatial vector is modulo sign, `r∼−r`. The rank-one angular direction is `RP8`, not automatically the Hopf `S8`. A source Spin9 vector action cannot implement the antipodal map on R9 by any SO9 element, since `det(−I9)=−1`. Do not identify the physical Weyl sign with the center of source Spin9, which is invisible on its nine-vector representation.

**Gate recommendation:** prepare one future original Gram matrix-factorization root and independent consumer after TD-C1A first-causal review. If it produces nothing beyond generic SVD, stop and prioritize the Spin/source physical covariance bridge; if it yields exact source quartic/measure/operator compatibility, promote only that statement.