# Higher ordered Yukawa derivatives and 44-row exact integration — 2026-11-24

Status: SURVIVED_FINITE_TESTS; exact rational eigenvalue bracket conditional on reconstructed finite invariant contractions. Full 56-row differential integration and typed physical correspondence remain OPEN. Parent `e6b5a444cfaa338a2e1b7d23f2f66826e9709cf1`. Retrospective record, no Lean qualification. Companion pin `96b19b1fef98486e43bc2527604966c86afd7ca7`; `contract.py` blob `66323abda2418509f6030cb2942fe2354cc7a476`, `blocks.py` blob `0ef1da1fb9473b74807948962c6cef000bb1d0ef`. Uses archived exact seed, source Gamma9 and finite charge normalization, 56 actual witness labels and exact mass blocks.

## Method and exactness

Ordered jet D_mu V_(p+1)=K_mu V_p+Z D_mu V_p for V_p=Z^p S, Z=sqrt(2)Y. Retain all 12 representative directions on the diagonal slice (18 transverse directions reduced to three representatives of multiplicity six), as in prior jet2. C++ `exact_kernels.cpp` propagates signed Gaussian integers in int64 and contracts sparse sorted occupation vectors in signed __int128. Python computes conservative component bounds (each signed sum strictly below 2^63); split wide dots into chunks with absolute sum bound strictly below 2^126 and add limbs as arbitrary-precision Python integers. No floating point propagation; the inherited operator terms are exact small Gaussian integers. At (1,2,3), p<=2, all five raw families recover the archived jet_123.json exactly, 9.616897 s versus 24.567863 s in earlier recorded run (not controlled hardware benchmark). Euler and transverse rotation tests are retained at every new fixture. The initial implementation stops on a conservative 128-bit bound; chunked variant stops on a conservative int64 2^62 bound at (1,2,3), p8, during final insertion. Initial and chunked source/logs archived. Final int64 bound is strictly <2^63, sufficient for signed accumulation; no bypass of a genuinely overflowing operation. p8 (1,1,2) completed all five families in 89.236235 s, with apply bound 50578528088883200 and total dot bound 1380122407705611990324636531587809280. All p<=4 subblocks exactly match separately executed p4 fixture. No completed p8 (1,2,3) result; p8 (1,1,2) is a single fixture, not high-degree interpolation.

## Exact reconstruction and new t correction

Seven fit configurations (100,110,120,111,112,122,123); independent 124 holdout. 125 ordered family/pair combinations through power4; 63 full-rank fits, 62 zero parity/negative-degree checks, 45 nonzero fitted kernels; 115 exact holdout scalar values. All previous jet2 polynomial lists recovered exactly. Reconstruction uses previously established finite covariance and homogeneous invariant polynomial structure; no native typed source inference.

The weighted diagonal contraction t is nonzero for (0,4), (1,3), (2,4) and reverse antisymmetric pairs. Specifically t_04=(14568/11)[(s^2-2u)G-sG^2], t_13=t_04/2. t_24 coefficients in jet_polynomials.json. The formerly valid low-power simplification t=0 is falsified as a universal assumption. In weighted form add -1/8 times w_j tr(Z_h T_jh) with Z_h=derivative multiplier matrix - B_width*w_h (companion block definitions); include the beta and v terms as previously. Weighted expressions are checked in BOTH orders for every unique pair instead of forcing symmetry. All 990 agree exactly. Omitting t affects 192 entries and breaks Hermiticity for exactly 192 pairs. An intentionally forced-symmetric t-omitted matrix has a rounded rational trial direction with exact negative quotient -112.23378061127954; on the correct charge matrix the same direction yields +311.07656438336926. The coefficient vector and exact fractions in omit_t_control.json. Not a physical instability.

## Integration and bounds

44 actual witness rows p<=4; 1,057 distinct rational orientation moment keys, exact versus independent orientation quadrature max relative 6.440690296163624e-15 (shared Stein recurrence). Recovered old22 mass/H/q1 within 5.48e-15 and entire archived 32-row rational matrices entrywise exactly. All 44 weighted matrix LDL pivots positive. Diagonally scaled mass condition 1614128.1124. Minima (floating estimates): p<=2 59.07834181710854, p<=3 (38 rows) 30.055426465586276, p<=4 12.595988555655438, p3 and p4 alone 17.820243915192364. Exact rational positive LDL pivots of A-(629799/50000)M and rational trial quotient 12.595988555656618 <1259599/100000 establish 12.59598 < qmin44 < 12.59599 conditional on finite kernel reconstruction. Preserve complete matrices, rational trial vector, lower pivots, raw receipts. Neither this finite bound nor smaller subspace minima bound the physical full-space minimum from below.

## Reproduction

Local scratch directories differed from repository directory names. Use Python 3.13.5, NumPy 2.3.5, SciPy 1.17.0, SymPy 1.14.0 and GCC 14.2.0 (C++ compiler supporting signed __int128). Rebuild binary locally, not archived as architecture-specific executable. Use OPENBLAS_NUM_THREADS=1. Commands from this directory:

```
c++ -O3 -march=native -shared -fPIC exact_kernels.cpp -o exact_kernels.so
python higher_jets.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 2 1,2,3
python higher_jets.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 4 1,0,0 1,1,0 1,2,0 1,1,1 1,1,2 1,2,2 1,2,3 1,2,4
python higher_jets.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 8 1,1,2
python verify_controls.py ../bfss-ordered-jets
python reconstruct4.py ../bfss-ordered-jets
python integrate44.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-ordered-jets
python bracket44.py
python omit_t_control.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-ordered-jets
```

Execute individual fixtures when necessary. Timings depend on contention; raw logs retained. p4 ran on initial/chunked/final variants with no overflow, so the final wider safe bound does not change the computed arithmetic. No Lean sources/workflows changed. Next: extend full-rank interpolation through p5-8 with modular or further bounded propagation as needed, test t without assuming vanishing, then tackle Phi/H3. Current complete matrix coverage 44/104 (12 S descendants still missing); finite physical carrier and weighted domains remain open.
