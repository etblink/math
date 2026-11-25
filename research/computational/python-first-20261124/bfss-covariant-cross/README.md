# Cross-family covariant reconstruction and low-order weighted counterfactuals — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for the stated reconstructed finite matrices and exact rational brackets. Full 80/80/104 weighted comparisons remain open. No Lean or original physical-domain qualification.

Parent: `168bcd5a4a172b769c9ce8c1387c2c51a7202cf5`. Companion pin: `96b19b1fef98486e43bc2527604966c86afd7ca7`, optimized_state.json blob `cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc`. The actual 104 witness labels, powers, invariant multipliers and width indices were read from the pinned companion basis using the previously archived trial-104.json; rows104.py reconstructs that metadata and checks the labels. Input occupation seed is the archived source_seed_integer.npz with squared integer norm 8072064. The reflected gamma/Fock identification and typed physical-domain obligations remain separate.

## Cross-family mass and multiplication blocks

For Hermitian Y, g_{pq}^{UV}=<Y^p U,Y^q V>=<U,Y^{p+q}V>, U,V in S,Phi,H3. The code carries vectors scaled by (sqrt(2))^degree, with an exact rational scalar times a primitive Gaussian integer coefficient vector. Phi uses the noncommutative antisymmetric-square trace reduction, H3 the archived color harmonic cyclic basis and spatial-vector reconstruction. Every operator action and dot product is bounded as in the preceding exact kernels; coefficient gcd extraction is exact. Restore the power-of-two factor in rational contractions. The raw integer seed normalization is divided out. Fourteen fixtures, 12 fit and 2 holdout, 41 full-rank fits, 82 exact holdout values, 924 exact independent power-split comparisons, 518 odd-degree zero comparisons. All previous S moment polynomials recovered exactly. H3 norm/support recovered from prior independently contracted rank-one and rank-three tensors; Phi norm from rank-one direct trace calculation. Invariant polynomial extension relies on established finite covariance and parity.

All 104 rows at the two actual physical widths are integrated via the existing rational orientation integrals: M, Y, u, sY, su. 5460 unique entries per block, 284 scalar orientation moment keys; all five 56-row submatrices reproduced exactly. Independent quadrature relative error 6.389630406018109e-15. M has 104 positive fraction-free Bareiss pivots after diagonal integer congruence; diagonally scaled binary64 condition number 1.3026598686e7. The exact trial coefficient norm and normalized multiplicative expectations are in integrated.json. The norm need not be one for the rational rounded witness. No quotient is claimed from these blocks alone.

In particular <YS,H3>=0, <Phi,H3>=0 and <Y^3 S,H3>=||H3||^2 for the base covariants (polynomial identities conditional on the reconstruction). The latter is consistent with the orthogonal tensor projection, not an assertion of zero interaction among all descendants.

## Mixed low-order differential system

Cores S,YS,Y^2S,Phi,H3; ordered product derivative of Phi; explicit derivative of the Gram tensor for H3; generic rotation-derived derivatives plus direct recurrence at degeneracy; one representative of each sixfold transverse set. 10 exact direct rotation checks, Euler identity for every fixture and core. Four generic full-rank fit fixtures; three held-out (234,001,011), 58 full-rank fits, 300 held-out scalar values in nontrivial fits, all 45 prior low-power polynomials recovered exactly. Three further held-out fixtures (012,013,111) give 675 exact scalar comparisons including zero polynomials. Full t correction retained. Both initial jet runs stopped on a zero-valued rational factor in lin (gcd(0)=0); the corrected predicate skips zero factors. Original failure logs and script preserved; mass runs predate the repair and are unchanged. This is an implementation edge case, not a mathematical counterexample.

Use all actual witness rows for S powers <=2 (32) and base Phi and H3 (6 each); 44 rows. Exact rational M,H,q1, 1130 orientation moment keys, independent numerical quadrature relative discrepancy 6.440690296163624e-15, all three prior 32-row matrices recovered exactly. Both entry orderings evaluated for H and q1 (1980 checks); 44 positive weighted pivots. Brackets independently verified by exact rational LDL of A-lo*M and rational trial quotient <hi:

| Families | Rows | Strict lower | Strict upper |
|---|---:|---:|---:|
| S | 32 | 59.078341 | 59.078342 |
| S+Phi | 38 | 39.918605 | 39.918606 |
| S+H3 | 38 | 58.973349 | 58.973350 |
| S+Phi+H3 | 44 | 39.770665 | 39.770666 |

The small mixed subspace is not nested over the complete 56 S sector (different restriction). These results show base Phi has a much larger effect than base H3 under this low-power restriction, but cannot rank the families in the complete witness. The full 80/80/104 comparisons require all remaining mixed ordered differential kernels. The full 104 mass/multiplication blocks are available for that work. Full weighted integrals, native typed Fock and charge correspondence and weighted domains remain open. No changes to Lean or workflows.

## Reproduce from this directory

The preceding sibling directories supply immutable inputs and the existing integration functions. `exact_kernels.so` is a generated local binary, not archived; rebuild from source. Set OPENBLAS_NUM_THREADS=1. Commands:

```sh
g++ -O3 -shared -fPIC exact_kernels.cpp -o exact_kernels.so
python cross_moments.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 5 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 1,1,2 0,2,3 1,1,3 1,2,2 1,1,4 1,2,3 1,3,3 1,2,4 2,2,3
python reconstruct_cross.py ../bfss-yukawa-moments
python rows104.py ../bfss-yukawa-moments
python integrate104_mass.py ../bfss-yukawa-moments ../bfss-cross-gram22
python base_jets.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 2 0 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 1,2,3 1,2,4 1,2,5 1,3,4 2,3,4
python reconstruct_base_jets.py ../bfss-full-jets
python integrate44_mixed.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-full-jets
python bracket_mixed.py
python additional_controls.py
```

The archived additional_controls.py used local dated directory names; replace those two reference paths with the sibling `bfss-h3-tensor` and `bfss-covariants` paths when reproducing inside Git. The original executed file is retained unchanged. The two initial failure logs preserve the zero-factor exception. `SHA256SUMS` lists all reproducibility files; binary shared library excluded. `matrices.json.gz` is the full 104-row multiplicative dataset; `mixed44_matrices.json.gz` is the complete restricted energy dataset. `mixed_lower_pivots.json.gz` retains exact lower-bound pivots.
