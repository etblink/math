# Mixed 80-row weighted system — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for the reconstructed finite representation and rational matrix brackets. Full single-family 80-row experiments and full 104-row weighted witness, typed native carrier, and weighted physical domain remain open. No Lean or physical qualification.

Parent `ce2f23273bbf0ee6bf350055ee2f0fa9a3efb3a9`; companion pin `96b19b1fef98486e43bc2527604966c86afd7ca7`. Reuse the exact 104 mass/multiplicative blocks from `../bfss-covariant-cross`, complete S-sector differential kernels from `../bfss-full-jets`, and prior mixed base kernels from `../bfss-mixed68`. Include all 56 S rows, 12 base cubic rows, and 12 first Yukawa descendant rows, six per family. This 80-row combined restriction is not either proposed full single-family 80-row system. Physical widths (29/10,29/20) and (87/20,29/20) are unchanged.

## New derivative evidence

For each base U=Phi,H3, use D_mu(YU) = K_mu U + Y D_mu U; for the scaled representation use Z=sqrt(2)Y and preserve the existing degree-dependent rational normalization. `mixed80.py` evaluates only contractions with at least one new core (YPhi or YH3); old-old zeros in raw receipts are placeholders, not computed zeros. Ten fitting configurations 001,011,012,111,013,112,113,122,123,124 and two holdouts 023,114. 118 full-rank polynomial reconstructions, 420 held-out scalar comparisons, 122 parity/antisymmetry zero cases, 13 direct rotation comparisons; all twelve fixtures pass exact Euler identities. The 605 inherited polynomials are copied unchanged and checked by exact comparison (not independently re-derived). Initial fit frozen in `pre_holdout.sha256`; adding both holdouts leaves the file byte-identical. Exact rational primitive Gaussian-integer arithmetic with checked int64 actions and chunked int128 dot products suffices for all twelve fixtures; no modular reconstruction required.

`identity_audit.py` independently compares the new nu kernels against the archived cross-family mass polynomials g_pq: sum_b nu_pq,b = degree(q)*g_pq; nu_pq,b + nu_qp,b = x_b*d_b g_pq; sum_b t_pq,b = 0. 2880 exact raw scalar equalities over twelve fixtures and 144 exact polynomial identities in the Cayley-Hamilton quotient (48 ordered pairs times three identities). `finite_difference_control.py` directly evaluates YPhi and YH3 at X +/- E, X +/- 2E. The fourth-degree-exact stencil reproduces the ordered derivative on both rank-one (001, direction 00) and generic rank-three (123, direction 01) fixtures. Omitting K_mu U gives nonzero support 48288, 43904, 303032, 121360 respectively. This is a discriminating implementation control; it is not a proof of the typed original-carrier map.

## Integration and brackets

Exact rational M,H,q1; 1476 orientation moment keys; 6480 forward/reverse energy-entry comparisons; exact recovery of every entry of the previous mixed 44-, S 56-, and mixed 68-row M,H,q1 matrices. All 80 weighted matrix fraction-free Bareiss pivots positive. Maximum relative disagreement with numerical quadrature 7.500870476629954e-15. Brackets proved by positive diagonal integer congruence and fraction-free symmetric elimination on A-lo*M, plus exact rational Rayleigh trial direction below hi. Pivots are Bareiss pivots, not conventional LDL diagonal values.

| Restriction | Rows | Strict lower | Strict upper | Trial quotient decimal |
|---|---:|---:|---:|---:|
| S | 56 | 0.638141 | 0.638142 | 0.6381414796068431 |
| S+Phi (through YPhi) | 68 | 0.625845 | 0.625846 | 0.6258455127776982 |
| S+H3 (through YH3) | 68 | 0.626137 | 0.626138 | 0.6261376835220638 |
| Combined | 80 | 0.612007 | 0.612008 | 0.6120079529036383 |

All remain above the sufficient 3/8 comparison and sharp kappa^-1 ~0.3791713. These are finite matrix brackets conditional on the reconstructed polynomial kernels, not original physical lower bounds. No exclusion of other widths or full variational spaces.

## Structural counterfactuals

Numerical reoptimization in `scc80.json`: old combined 68 q~0.632632196046456; old+YPhi q~0.623896386447905; old+YH3 q~0.6227135620063505; both q~0.612007952903521. Marginal improvements 0.0087358096 and 0.0099186340, joint 0.0206242431, excess over their sum 0.0019697995. The YH3 directions retain 93.15–96.31% of their mass squared norm after projection away from the old 68, whereas YPhi retains 6.84–7.75%; comparable energy gains despite different mass independence. All are numerical diagnostics of exact rational matrices. Truncating the actual published rational coefficients to these 80 rows yields exact Rayleigh quotient with decimal 10.431536666572237, so reoptimization is essential. Full 104 coefficient vector not evaluated in this interval.

## Execution boundaries / negative knowledge

Initial identity-audit glob matched jet_polynomials.json as well as raw jet files and stopped with KeyError 'diag'; original script/log retained. Restricting to three-digit fixture names fixed bookkeeping, no numerical results changed. Three local batches were used within the research interval. Two generic fitting receipts (123 and 124) were accelerated in a third batch; later original batches skipped those already existing receipts, truncating their redirected run logs to zero bytes. The original completed logs are preserved verbatim as receipt_123.log and receipt_124.log, with no duplicate computation counted. All twelve raw JSON receipts are intact. The local run.sh is preserved as executed; use portable commands below. Compiled library is excluded and rebuilt from source. No Lean changes.

## Reproduce

From this directory with archived sibling directories checked out; use OPENBLAS_NUM_THREADS=1.

```sh
g++ -O3 -shared -fPIC exact_kernels.cpp -o exact_kernels.so
python mixed80.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 1 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 1,1,2 1,1,3 1,2,2 1,2,3 1,2,4 0,2,3 1,1,4
python reconstruct80.py ../bfss-full-jets ../bfss-mixed68
python identity_audit.py ../bfss-covariant-cross
python finite_difference_control.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz ../bfss-h3-tensor 8 1
python integrate80.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-full-jets ../bfss-covariant-cross
python bracket80.py
python scc80.py
```

Remove generated raw receipts to force recomputation. `SHA256SUMS` excludes itself, shared library and caches. Next test higher covariant descendants through p>=2; full 104-row threshold comparison and original-carrier/domain certification remain open.
