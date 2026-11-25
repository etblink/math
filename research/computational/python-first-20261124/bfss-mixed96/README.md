# Mixed 96-row weighted system — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for reconstructed finite rational matrices. No typed original-carrier correspondence or physical-domain qualification. Parent `e024e4670dfb05e9114912f77d019ee65c4ee786`; companion pin `96b19b1fef98486e43bc2527604966c86afd7ca7`. The 96 rows use both cubic covariant families through third Yukawa descendants and all 56 S descendants, at the unchanged physical widths `(29/10,29/20)` and `(87/20,29/20)`. Eight rows (fourth and fifth Yukawa powers of the cubic covariants) remain.

## Method and independent controls

`mixed96.py` uses rational primitive Gaussian-integer occupation vectors scaled by degree, checked int64 operator actions, chunked int128 inner products, and the ordered derivative recurrence. Off-diagonal derivatives use color/spatial rotation identities when squared singular values differ; degeneracies use the direct recurrence. Six transverse spatial directions are represented by one with multiplicity six. Only pairs containing at least one new core are evaluated; inherited old-old raw entries are placeholders, not independently computed zeros. All fourteen receipts complete, including exact Euler identities and 17 direct rotation comparisons. Twelve fitting fixtures 001,011,012,111,013,112,023,113,122,114,123,133 and holdouts 124,223. Exact 296 full-rank fits, 1056 held-out scalar comparisons, 304 parity/antisymmetry zero cases. Fit-only file frozen via `pre_holdout.sha256` before comparing both holdouts; no coefficient changes. The 845 inherited polynomials are copied unchanged, not independently rederived. The raw identity audit passes 8400 scalar equalities and 360 polynomial identities using previously archived independent mass kernels. Eight direct sixth-degree-exact finite-difference comparisons at 001 and 011 validate all four new ordered derivatives; omitting the product-rule term gives nonzero support up to 106624. No modular reconstruction required.

`design_check.py` reproduces the exact rank design results. For the 104-row extension, the present fitting set has rank 27/30 for degree-18 diagonal tensor coefficients. Adding 014,134,125 raises the rank to 30/30 without consuming either holdout. This is a design result only, not a completed 104-row reconstruction.

## Exact rational matrices and brackets

1496 distinct orientation moment keys, 9312 exact forward/reverse comparisons (both H and q1, including diagonal entries); all entries of prior mixed 44-, S 56-, mixed 68- and mixed 80-row M,H,q1 matrices recovered exactly. Maximum relative independent quadrature discrepancy `7.500870476629954e-15`; 96 positive fraction-free weighted-matrix pivots. Certified lower bounds use positive diagonal integer congruence and fraction-free symmetric elimination of A-lo*M; upper bounds use exact rational Rayleigh trial vectors.

| Restriction | Rows | Strict lower | Strict upper | Rational trial quotient (decimal) |
|---|---:|---:|---:|---:|
| S | 56 | 0.638141 | 0.638142 | 0.6381414796068431 |
| S+Phi through power 3 | 76 | 0.611950 | 0.611951 | 0.6119508496759698 |
| S+H3 through power 3 | 76 | 0.537744 | 0.537745 | 0.5377447304945424 |
| Combined | 96 | 0.495863 | 0.495864 | 0.49586343284749096 |

`threshold96.py` independently uses 3.74 < sqrt(14) < 3.75, giving kappa^-1 < 625/1648. Since 0.495863 > 625/1648, the sharp threshold is excluded in this finite reconstructed fixed-width subspace. This is not a universal exclusion, physical lower bound or validation of full companion witness. `scc96.json` gives numerical reoptimization and exact frozen published-coefficient quotients. 80->88 (second descendants) q decreases from 0.61200795 to 0.56447835; 88->96 (third descendants) to 0.49586343. Adding both higher Phi powers to 80 gives 0.59876008; adding both higher H3 powers to 80 gives 0.51808035. Higher H3 descendants are more consequential in this restriction. All SCC eigenvalues are numerical diagnostics of exact matrices; only the four main brackets are rationally certified.

## Execution boundaries and reproduction

Three concurrent local workers completed all fixtures under the 4 GiB limit; no OOM or arithmetic failure. Three receipts 133,223,124 were accelerated in a separate batch; subsequent scheduled skips truncated `run_133.log`, `run_223.log`, `run_124.log` to zero bytes. Original completed logs preserved as `receipt_133.log`, `receipt_223.log`, `receipt_124.log`. No duplicate computation counted. Shared library omitted and rebuildable from source. No Lean sources or workflows changed. No background tasks remain.

From this directory with archived sibling directories checked out (OPENBLAS_NUM_THREADS=1):

```sh
g++ -O3 -shared -fPIC exact_kernels.cpp -o exact_kernels.so
python mixed96.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 3 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 1,1,2 0,2,3 1,1,3 1,2,2 1,1,4 1,2,3 1,3,3 1,2,4 2,2,3
python reconstruct96.py ../bfss-full-jets ../bfss-mixed80 --fit-only
sha256sum jet_polynomials.json > pre_holdout.sha256
python reconstruct96.py ../bfss-full-jets ../bfss-mixed80
sha256sum -c pre_holdout.sha256
python identity_audit.py ../bfss-covariant-cross
python finite_difference96.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 3
python design_check.py
python integrate96.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-full-jets ../bfss-covariant-cross
python bracket96.py
python scc96.py
python threshold96.py
```

Remove generated raw receipts to force recomputation. SHA256SUMS excludes itself, shared library and caches. Next: remaining eight rows, final 80/80/104 comparisons, actual published rational witness vector evaluation, typed source transport and domain obligations. No physical ground-state conclusion.
