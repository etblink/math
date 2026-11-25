# Mixed 68-row weighted system — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for exact reconstructed finite matrices and rational eigenvalue brackets. Full 80/80/104 weighted integration and typed source/domain correspondence remain OUTSTANDING. No Lean or physical qualification.

Parent: `430625cd4a79677f6f2732d36a6029c733d4bbd4`. Companion pin: `96b19b1fef98486e43bc2527604966c86afd7ca7`; actual witness metadata and all 104 mass and multiplicative blocks are inherited from `../bfss-covariant-cross`. The exact 56-row S sector is inherited from `../bfss-full-jets`. We retain 56 S rows plus 6 base Phi and 6 base H3 rows. This is a different, larger restriction than the previous mixed 44-row test, not the full 80/80/104 system. The objective is to isolate base-covariant effects in the presence of the complete S sector before adding higher covariant descendants.

## Computation

`mixed68.py` uses the previous rational primitive Gaussian-integer representation, carries the common square-root factors exactly, and evaluates only mixed kernels (at least one index is Phi or H3), not S-S. Ordered products at degenerate singular values, rotation-derived derivatives elsewhere, sixfold transverse multiplicity, exact Euler identities, and 11 direct rotation comparisons. For the five shared prior fixtures, 720 mixed scalar entries exactly match the independent prior base-jet receipts. Each fixture receipt has the full shape with zero placeholders for S-S; **the placeholders are not computed S-S zeros**. `reconstruct68.py` restores the archived S-S polynomials before assembly. 8 fitting fixtures (`001,011,012,111,013,112,113,122`), 2 holdouts (`023,114`); 98 full-rank fits, 348 held-out scalar comparisons, 102 parity/antisymmetry zero cases. All 125 prior base-jet polynomials match exactly after index remapping. The first holdout reconstruction was used for assembly while the second ran; rerunning with both produced the same SHA-256 for the polynomial file (`pre_holdout.sha256`). No independent reconstruction of S-S is claimed in the new jet calculation.

`integrate68.py` reuses the exact orientation-moment implementation and 104 mass/multiplication kernels, retaining all t/beta/v weighted corrections. 1371 orientation moment keys, 4692 forward/reverse entry comparisons for H and q1, all three previous 56-row and mixed 44-row matrices recovered entrywise, numerical quadrature relative discrepancy 7.500870476629954e-15, 68 positive fraction-free weighted pivots. `bracket68.py` uses a positive diagonal integer congruence and fraction-free symmetric Bareiss elimination to verify positivity of A-lo*M, and a rational trial direction to prove q_min<hi. The pivot archive contains integer Bareiss pivots, not ordinary rational LDL diagonal entries; each pivot is positive. All brackets conditional on the reconstructed finite invariant kernels, not a source operator theorem.

| Families | Rows | Strict lower | Strict upper | Rational trial quotient (decimal) |
|---|---:|---:|---:|---:|
| S | 56 | 0.638141 | 0.638142 | 0.6381414796068431 |
| S+Phi | 62 | 0.634652 | 0.634653 | 0.634652945690527 |
| S+H3 | 62 | 0.636491 | 0.636492 | 0.6364914788214827 |
| S+Phi+H3 | 68 | 0.632632 | 0.632633 | 0.6326321960466376 |

All four systems are strictly above the 3/8 sufficient target and the sharper kappa^-1 ~0.3791713 threshold. Neither this result nor the original 56-row lower bound excludes a different set of profiles or the full witness.

## SCC observations

`scc68.py` performs nested reoptimization, retaining base Phi/H3 at each S power limit. Adding both improves S<=2 by 32.6815%, but S<=3 by only 0.01144%, S<=8 by 0.86333%. Numerical mass-norm projection diagnostics: residual squared norm fraction of each base Phi row after projection onto S is 0.20806–0.22676; corresponding H3 range 0.98774–0.99340. These are numerical diagnostics (not exact bounds on these fractions). Independent Fock directions need not be effective directions for the energy objective. The additional 36 rows Y^p Phi and Y^p H3 (p>=1) remain necessary to investigate the large gap between 68-row minimum and companion 104-row trial. This is not a claim that every omitted row is indispensable.

## Negative knowledge and execution boundaries

The initial streaming command was unavailable; local subprocesses were used only during this research interval. Restarting the local batches briefly duplicated the 111 and 112 jobs; duplicate processes were stopped to respect the 4 GiB memory limit. The original processes completed their receipts, but the restart truncated the first lines of the two logs (NUL-filled holes preserved in raw log bytes). Only the completed JSON receipts are counted as evidence; the duplicates are not additional independent runs. `batch_*` and holdout logs are retained. The first held-out verification was recorded separately; the second did not change the reconstructed coefficients. No new Lean changes. Full mixed higher-power differential kernels, typed native Fock/charge correspondence, weighted domain and physical ground-state certificate remain open.

## Reproduction

From this directory, with the archived sibling directories checked out, use these commands (set OPENBLAS_NUM_THREADS=1). Generated shared library is excluded; rebuild it. The copied dependency scripts match the prior archive. `run.sh` and `integrate.sh` preserve local execution paths and are not portable; use the commands below.

```sh
g++ -O3 -shared -fPIC exact_kernels.cpp -o exact_kernels.so
python mixed68.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 0 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 1,1,2 1,1,3 1,2,2 0,2,3 1,1,4
python reconstruct68.py ../bfss-full-jets ../bfss-covariant-cross
python integrate68.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-full-jets ../bfss-covariant-cross
python bracket68.py
python scc68.py
```

Delete generated jet receipts or run in a fresh directory to force recomputation; the script skips existing receipts after acquiring a per-fixture lock. The SHA256SUMS manifest excludes the shared library, lock files, caches and itself. The full evidence archive carries original scripts, JSON, rational matrix/pivot gzip files and logs.
