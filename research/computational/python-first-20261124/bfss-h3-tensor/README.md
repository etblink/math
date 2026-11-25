# H3 coordinate-tensor and cyclic reconstruction

Research interval: 2026-11-24 Pacific. Parent 68ba9e055f788f093d51c88af319a96d5e7dd148. Computational status: SURVIVED_FINITE_TESTS; no new Lean qualification or physical-domain assertion.

## Inputs and normalization

The archived [constant seed](../bfss-seed-transport/source_seed_integer.npz) has SHA256 131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7 and squared integer norm 8072064. The prior [covariant audit](../bfss-covariants/README.md) supplies the finite CAR/Yukawa operators and exact generator commutators. Companion definitions pinned to 96b19b1fef98486e43bc2527604966c86afd7ca7. X is 3 x 9, color x space. The stored Fock vectors are the numerator of 2 sqrt(2) H3 on the unnormalized integer seed, divided by their recorded denominator. This is not a normalized physical wavefunction.

## Algebraic construction

Let T=X tensor-cubed with the three color slots first and three spatial slots last. Let A be its unnormalized sum over the six color permutations. Pair symmetry implies A is separately symmetric in the spatial slots. Let D denote insertion of a trace into three symmetric slots (sum of the three delta insertions). Then C=5A-D_color(A) and H=D_space(C); the joint projected tensor is H/330. Color projector is C/30 and the spatial trace projector is D_space/11 on the symmetric spatial tensor space. The independent Casimir polynomial checks are exact on all 27 color basis tensors and all 165 symmetric spatial cubic basis tensors. Color rank is 7 and spatial trace rank 9; joint target has dimension 63. This is a reduction of the projection carrier, not of the full Fock Hilbert space.

The earlier 1161 finite commutators and 39 singlet-generator checks permit the tensor projectors to be carried through the map T -> sum T K K K S with the ordered products unchanged. Integer matrix checks are not new Lean theorems. Negative controls: omitted color trace 147 nonzero residual entries and wrong spatial denominator 2025.

## Execution and reproducibility

In this directory:
```bash
OPENBLAS_NUM_THREADS=2 python projector_basis_audit.py
OPENBLAS_NUM_THREADS=2 python tensor_projection.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz rank1 rank3
OPENBLAS_NUM_THREADS=2 python orbit_reconstruct.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz
OPENBLAS_NUM_THREADS=2 python gram_derivative.py ../bfss-covariants
cmp rank3_vector.npz rank3_orbit_vector.npz
```
The original orbit receipt predates completion of the slow direct rank-three path; rank3_comparison.json records the later independent byte equality. The archived rank-one summary matched support, norm squared, maximum coefficient and denominator (not a coefficient-by-coefficient comparison with the older direct Fock Casimir run, which did not preserve its vector). New rank-one tensor and orbit vectors are byte-identical. The rank-three direct tensor contraction took 111.363 s, cyclic evaluation 1.652 s after basis construction, and the exact arrays and complete NPZ bytes agree. Rank-one direct contraction 53.274 s; cyclic construction including all four evaluations 7.623 s. Timing is environment-dependent. The rank-two and oblique cyclic evaluations passed exact rational coefficient solves but were not independently contracted. Prior rank-three Fock Casimir timeout remains historical INCONCLUSIVE; the new method solves that fixture without changing the historical result.

## Gram derivative

With G=XX^T and S(G,X) the sum of three pairwise products G_ab X_ck, the color-traceless spatial trace B=[5 S(G,X)-S(I,tr(G)X+2GX)]/15. DG[E]=EX^T+XE^T. Exact 108 derivative checks (27 directions on four integer fixtures) against a cubic-exact centered stencil, Euler relation and tracelessness passed. Omitting DG gave up to 69 nonzero residual entries. Derivative tensor checks are not differential supercharge equivalence.

## Decision and remaining obligations

Use the 63-dimensional coefficients and their analytic derivatives for the H3 polynomial part. For Phi use the archived antisymmetrized operator-square expression and ordered product rule. Next validate actual Fock derivative vectors, differential charge conventions, source reflection and weighted trial domain before integral/fidelity comparisons. No physical zero-mode result, no new Lean gate. Raw source and result files including generated NPZ vectors are preserved. All transferred Git blobs match local hashes; runtime receipts are observational not reproducibility requirements.
