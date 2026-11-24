# Python-first research — archival and source-transport checkpoint

2026-11-24 Pacific · Unified integration branch · **SURVIVED_FINITE_TESTS / EXACT FINITE ARITHMETIC; NOT NEW LEAN QUALIFICATION OR PHYSICAL SPECTRUM.**

Source baseline: 93d7adb2a62e8f9a3ecfe3f7e709eea1910914ea, CSQ-E0 R3 [run 45505859621](https://github.com/etblink/math/actions/runs/45505859621). E0 identifies each original basis-charge norm squared with the normalized core form on the actual paired invariant smooth core. It does not give a closed-domain or spectral result. The original two exploratory intervals were read-only. The owner subsequently directed that Python research, including its negative knowledge and original evidence, be kept in the repository rather than left in chat.

## Durable evidence

Both original ZIPs and all 18 members are retained byte-for-byte, including both NPZ vector files. SHA-256 values were recomputed from the original local ZIP bytes; ZIP CRC and byte comparison of all extracted members passed. Each of the 20 uploaded Git blobs matched its independently calculated local Git blob SHA. The original README files, including historical limitations and then-current archival status, are preserved unedited; this note supersedes only their statement that repository archival was outstanding.

| Archive | Members | Bytes | SHA-256 |
| --- | ---: | ---: | --- |
| [Python re-entry](python-first-20261124/original-archives/bfss-python-reentry-20261124.zip) | 6 | 9,499 | 038c21fdaeec45d6adee6cc8cd0cfae4fd0376613371457e3192165bcdf1a147 |
| [Actual seed transport](python-first-20261124/original-archives/bfss-seed-transport-20261124.zip) | 12 | 124,422 | 984f02bcdeb19c32af728b57533ed50082709527d233db589ad0d6ae9bf98a3c |

- [Re-entry code, raw data, instructions and checksums](python-first-20261124/bfss-python-reentry/)
- [Seed transport code, input, raw data, exact integer coefficient vector and checksums](python-first-20261124/bfss-seed-transport/)
- [Scientific Method Protocol](../methodology/BFSS_SCIENTIFIC_METHOD_PROTOCOL.md) and [experiment registry](../methodology/BFSS_EXPERIMENT_REGISTRY.json): retrospective archival, not prospective registration.

## Knowledge recovered and results

Use the historical D1G, D1I, D1K0 and D1L notes on [the counterfactual research branch](https://github.com/etblink/math/tree/research/bfss-hopfion-gut-counterfactuals-20261121/research/counterfactual-gut), [fixed-regulator witnesses](../spectral-p2-original-field/BFSS_MSY_FIXED_REGULATOR_TRIAL_WITNESSES_2026_11_23.md), [ground-state crosswalk](../spectral-p2-original-field/BFSS_ORIGINAL_PHYSICAL_GROUND_STATE_CROSSWALK_2026_11_23.md), [reflected Gamma9 qualification](../spectral-p2-original-field/BFSS_MSY_REFLECTED_GAMMA_BASIS_R1_GREEN_ACCEPTANCE_2026_11_23.md), [Majorana transport gate](../spectral-p2-original-field/BFSS_MSY_MAJORANA_TRANSPORT_GATE_2026_11_23.md), and [GM5E10](../integration/BFSS_GM5E10_R2_ORIGINAL_FIXED_BALL_ZERO_MODE_GREEN_ACCEPTANCE_2026_11_23.md) as primary internal research resources, with exact qualification ceilings retained.

### Re-entry
The replication uses seed 20261124. Twenty-four randomized rank-one samples recover 11 bosonic zero directions, 16 fermionic zero directions and local leading cancellation (max absolute residual 2.274e-13); exact Clifford residual zero. The three-mode Fock blocks reproduce covariance, CAR, norm and stabilizer controls. Wrong all-plus stabilizer and one-color rotor fail with residuals 2 and 1.112858079 respectively. Deterministic Wishart quadrature reproduces the D1L model: at R=40, R^2 E_model is 83.605236695, 26.060117378 and 82.417079269 for width ratios .99, 1, 1.01. The 96- and 240-node values differ by about 8.38e-10. With a shell-dependent fractional mismatch delta_R=.1(10/R)^(3/2), scaled energy is consistent with a bounded limit; fixed fractional mismatch breaks the cancellation. The critical tube-shrink control is adverse. Earlier rare-event QMC convergence failure remains negative computational knowledge, not mathematical falsification.

For the Appendix A bridge, the signed kinetic and cubic coefficient identities and Bogoliubov CAR checks give exact zero; omitting the spatial sign gives residual 2. Four particle-hole directions per color; the transformed one-color vacuum has sixteen signed occupation coefficients and four particles, with exact annihilation check. The unchanged vacuum fails (0.70710678). This is finite-dimensional transport, not a differential-domain theorem.

The 104-function companion trial is below the auxiliary threshold numerically: q1=0.3643611475, threshold approximately 0.379171306613, nominal conditional fidelity >3.9%; the historical checked comparison q1<3/8 and kappa<66/25 give the conservative strict bound >1%. The 206- and 1542-function candidates remain alternatives. No companion trial integrals were recomputed here. All fidelity figures are conditional on source transport, admissibility and the auxiliary theorem hypotheses.

### Actual seed S
Pinned [companion state](https://github.com/asmichel/SU2-BFSS/blob/96b19b1fef98486e43bc2527604966c86afd7ca7/variational/results/optimized_state.json), Git blob cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc; 750 compressed rows, 14,240 expanded occupation masks, integer norm squared 8,072,064=84^2*1144. Packed FNV1a32 528ac3d8 is a consistency control, not a fresh cryptographic hash of the entire companion state.

The spherical exterior map, signed bitmask permutation, and three local 256-dimensional Bogoliubov intertwiners yield 19,136 source Cartesian occupation coefficients. Independent exact arithmetic in Q(i,sqrt(2)) with bounded integer accumulators reproduces every recovered integer coefficient; local unitarity, all eight intertwining identities and literal Gamma9 tables pass. Normalized vector is z/sqrt(8072064), stored in source_seed_integer.npz. All three color and 36 spatial bilinear generator residuals are zero in the reconstructed source convention. Perturbing one coefficient produces 12 nonzero residual coefficients; omitting permutation signs produces 16,584. Initial local matrix scaling by 4 was insufficient; scale 64 passes divisibility and intertwining checks. The N=0,4,8,12,16,20,24 occupation distribution is polarization-dependent, not yet a physical invariant. Both numerical and exact coefficient outputs are archived.

## Reproduction and limits
Use Python 3.13.5, NumPy 2.3.5, SciPy 1.17.0, SymPy 1.14.0; OPENBLAS_NUM_THREADS=2 for seed transport. To preserve original receipts, rerun in a scratch copy. Verify member SHA256SUMS before rerunning. The archived results are original executed receipts, not fresh calculations during the archival pass.

No claim of full typed native Hilbert-carrier identification, global differential-charge transport, weighted graph admissibility, Hardy/fidelity premises, physical zero mode, physical Hopfion, or unification. Keep qualified mathematics, exploratory computation, genuine falsifiers, RED proof attempts, and unresolved hypotheses distinct.

## Next scientific objective and repository practice
Transport the actual generating covariants Phi and H3 from S, then the sixteen differential charges, then the regulated auxiliary form. Recover the old gates and exact conventions before constructing new machinery. CSQ-E0 is a numerical oracle only within its theorem scope. Use SCC perturbations to distinguish substantive structures from basis choices; retain negative controls. The owner directs that ongoing Python-first research be committed to unified integration, with executable code, source pins, original inputs/results, limitations and negative knowledge, indexed through this research archive and the existing experiment registry. No new Lean source or workflow is needed merely to archive research; selective Lean only when it materially resolves a research uncertainty.
