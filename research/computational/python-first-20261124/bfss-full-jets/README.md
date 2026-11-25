# Full 56-row S-descendant sector — 2026-11-24

Status: SURVIVED_FINITE_TESTS; exact rational bracket conditional on the reconstructed finite invariant kernels. No Lean or physical-domain qualification. Parent `5ac8f73554a73ece6ed4208051723a7827d94136`, companion `96b19b1fef98486e43bc2527604966c86afd7ca7`. Retrospective record. Reuse the earlier archived integer seed (SHA256 `131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7`), paired Gamma9, and exact mass/multiplication blocks. Use the actual 56 rows of the 104-term witness at its two fixed physical width pairs.

## Scaled propagation and rotation-derived jets

Instead of modular CRT, propagate W_p=(Z/2)^p S, Z=sqrt(2)Y, and its ordered first derivatives, checking exact divisibility by two on every vector application/combination before division. Recover unscaled raw inner products by 2^(p+q). Retain bounded int64 applications, signed int128 inner products and chunked arbitrary-precision summation; no unbounded integer assumption. Tested p<=8 at 13 new fixtures; inherited the prior unscaled exact p8 (1,1,2) receipt. No modular reconstruction was needed. In a distinct squared-singular-value plane b<k, the commutator identities give gW=x_k D_bk W-x_b D_kb W and rW=-x_b D_bk W+x_k D_kb W, for g=G2/2,r=R8/8. Solve these two equations; check divisibility in the integer vector. Transverse direction uses rW=-x_b D_bk W; degenerate denominators use ordered recurrence instead. All 12 representative derivatives are included, with transverse multiplicity six. `audit2.log` and `jet_123_p2.json` reproduce the previous five raw p2 families exactly, including nine independent off-diagonal/transverse checks. `high_rotation_control` independently checks three chosen directions at every power 0..8 (27 vector equalities). All new fixtures finish; old p8 (1,2,3) overflow is resolved (new bound 18605477122670592, 80.2345 seconds under concurrent execution). No timing comparison implies hardware-controlled speedup.

## Invariant contractions

`covariance_basis.py` checks all 39 rotations against all 729 ordered B-coordinate pairs (28,431 exact coefficient identities), and cubic cV covariance by cubic-exact directional finite differences on two fixtures (78 identities); reversing B commutator sign gives 19,584 nonzero matrix coefficients. Uses independent 48-dimensional bivector coefficient representation. General cubic cV covariance follows from epsilon and Clifford tensor transformation; tangent checks remain finite controls. For scalar contractions on the slice, SO(9) can implement each sign change via an unused spatial axis, and permutations via signed rotations. Consequently homogeneous scalar polynomials restrict to symmetric polynomials of g_i=x_i^2. For the equivariant diagonal nu/t contractions, the bth component is symmetric in the other two g_i; express in g_b,s,u,v using the elementary symmetric functions of the other two variables, then reduce g_b^3 by Cayley-Hamilton. Thus these basis choices follow from polynomial covariance, not an arbitrary numerical fit. This reasoning is conditional on the inherited finite representation and covariance, not a native Hilbert-carrier theorem.

Twelve fitting triples: 001,011,012,111,013,112,023,113,122,114,123,133; held-out triples 124 and 223. 194 full-rank fits, 202 parity/negative-degree zeros, 9 antisymmetry diagonal zeros, 173 nonzero fitted kernels, 680 exact held-out scalar values; all prior p<=4 polynomial lists recovered exactly. Scalar degree through 18 and diagonal degree through 16 (t_88=0 by antisymmetry), with 19 full-rank designs. t antisymmetry and tau/v symmetry checked. 30 ordered nonzero t pairs. Raw receipts retain action/dot bounds and per-fixture timings.

## Exact integration and negative controls

56x56 mass/H/q1 rational matrices; 1,134 unique orientation-moment keys. Exact integral vs independent 32-node orientation quadrature max relative 7.500870476629954e-15 (shared Gaussian Stein moment recurrence). Exact recovery of every 44-row entry; old 22 errors mass 4.47e-15, H 4.94e-15, q1 5.47e-15. All 1596 reverse-order weighted entries equal exactly; 56 positive weighted LDL pivots. Diagonally scaled mass condition 1.90456e6. Numerical nested minima by max power 4..8: 12.595988555655438, 4.365490811307365, 1.483586914122494, 0.7885689573705098, 0.6381414796070658. Rational LDL of A-(638141/1000000)M has 56 positive pivots. Exact rational trial quotient 0.6381414796068431 < 319071/500000. The initial uniform 10^13 rounding of normalized coefficients failed the narrow upper bound; original source/log preserved, repaired via rational representations of floating coefficients with denominator <=10^30, and verified with exact arithmetic. Thus 0.638141 < qmin56 < 0.638142, above the target 0.3791713, conditional on reconstructed finite matrices. Not a lower bound on the full 104-row or physical-space minimum. `integrated.json` label `Y3_and_higher_only` corrects the inherited misleading `Y3_Y4_only` label in `integration.log` (actual predicate power>=3 unchanged). The exact published 104-vector restricted to the 56 S rows gives q1 10.363719813621875, not the reoptimized result. Omitting t breaks 472 reverse-order pairs; a deliberately symmetrized damaged matrix has rational direction q=-575.3661356053191, same direction correct q=378.5520546931593. Preserve exact coefficient vector, fractions and first asymmetric entry. No physical instability.

## SCC row deletions

Each comparison reoptimizes within an actual principal subspace. Omitting all p=7 rows gives 1.478289; p=5 gives 1.403370; p=6 gives 0.920855; p=8 gives 0.788569. Only first width 1.462413; only second width 4.864389; no invariant multipliers 2.827900. These are numerical subspace estimates, not separately interval certified or intrinsic causal identifications. The full 56 result is rationally bracketed. This makes the independent Phi/H3 additions a high-value research target; no claim that either alone is required for crossing threshold, or that the 56-row trial is globally optimal over all Yukawa-only constructions.

## Reproduction

Python 3.13.5 / NumPy 2.3.5 / SciPy 1.17.0 / SymPy 1.14.0, GCC 14.2.0 with signed __int128. The architecture-specific .so and __pycache__ are intentionally excluded; rebuild from exact C++ source. Local scratch directory suffixes differ from repository directories. From this directory (use one fixture per command if memory constrained):

```
c++ -O3 -march=native -shared -fPIC exact_kernels.cpp -o exact_kernels.so
export OPENBLAS_NUM_THREADS=1
python scaled_jets.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 2 1,2,3
python batch.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 0,0,1 0,1,1 0,1,2 1,1,1 0,1,3 0,2,3 1,1,3 1,2,2 1,1,4 1,2,3 1,3,3 1,2,4 2,2,3
python high_rotation_control.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz
python covariance_basis.py ../bfss-covariants
python reconstruct8.py ../bfss-higher-jets
python integrate56.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-higher-jets
python bracket56.py
python scc56.py
python omit_t_control.py ../bfss-yukawa-moments ../bfss-cross-gram22 ../bfss-higher-jets
```

Batch skips present receipts; delete a copy of a receipt in a fresh working directory to rerun it. The inherited 112 receipt can be independently regenerated using scaled_jets.py p8 or original higher_jets.py. Reproduction does not require finish.sh (historical orchestration only). No new Lean code or workflows. Full 104-row integration and companion cross-comparison, native typed carrier, charge transport and weighted-domain membership remain open. Next: integrate S+Phi and S+H3 in separate nested tests, using efficient generator and derivative constructions already archived.
