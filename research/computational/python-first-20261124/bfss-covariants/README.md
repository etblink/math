# Post-E0 finite covariant audit — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for the completed finite tests; rank-three H3 INCONCLUSIVE. No Lean qualification or physical claim.

Parent: 2bd1039cf9181b903d290c14e6749e9d79330d66. This is a retrospective research record, not a prospectively registered test.

## Source and conventions

Companion pin: [model and covariants](https://github.com/asmichel/SU2-BFSS/tree/96b19b1fef98486e43bc2527604966c86afd7ca7/variational/src/bfss). Input: [archived integer seed](../bfss-seed-transport/source_seed_integer.npz), SHA-256 131e703b19da9a1aea1e137dac45f451bbfc7f64374aff6619a46488410d5ff7, support 19136, squared integer norm 8072064. Normalized seed divides by sqrt(8072064). Matrices use color x space (3 x 9); t=sqrt(2)*theta, Z=sqrt(2)*Y, G2=2G, R8=8R. The reconstructed finite operators use the original Gamma9 and paired occupation labeling. Earlier exact source/companion transport and its ninth-axis reflection remain necessary to identify the two conventions.

## Trace reduction

For M=YM(X), expand (M_dc-M_cd)^2 without commuting entries. Then

    tr(M^T M)-tr(M M) = sum_(d<c) (M_dc-M_cd)^2
    P_hat = 160*s*I - 2*Y^2 - 2*sum_(d<c)(M_dc-M_cd)^2
    Phi = P_hat Y S

Both formulas agree coefficientwise on rank-one diag(1,0,0) and rank-three diag(1,2,3). Scaled sqrt(2)*Phi (on the unnormalized integer seed) has support 31536 and 275984 respectively. The operator identity is algebraic, not just an empirical identity at those points.

## Cubic H3

    H3 = (30*I-Ksp)/22 * Pi_3(C2) * Y^3 S

The scaled color Casimir C4=4*C2 uses G2; K64=64*Ksp uses R8. Pi_3 is evaluated using (C4)(C4-8)(C4-24)/(48*40*24). The rank-one output is nonzero, with 28256 coefficients. After separating the common factors, the numerator of 2*sqrt(2)*H3 on the integer seed has denominator 55. Exact residuals give C4 eigenvalue 48 and K64 eigenvalue 512, or C2=12 and Ksp=8 at that fixture. Neither is a physical particle quantum-number assignment.

## Finite commutator audit

All 81 color-Yukawa, 972 spatial-Yukawa, 108 mixed generator commutators pass exact coefficient checks in a signed occupation/Pauli-string representation. A reversed-sign nonzero commutator gives 16 nonzero coefficients. The identities establish finite operator covariance with the specified normalization. Together with the earlier singlet seed and the trace/Casimir construction, they give an algebraic route to the polynomial descendants, not a typed Hilbert or differential-domain qualification.

## Negative knowledge

- The first fixture definition contained a wrong row length; fixed before successful calculations.
- The initial assumption that the color-projector denominator divides every coefficient was false. The accepted implementation uses an explicit rational denominator and integer numerator, reducing by gcd without rounding.
- The rank-three Phi result was printed successfully, but the direct H3 run exceeded the 200-second command timeout. The partial stdout receipt is transcribed in rank3-partial.json; no completed H3 result is claimed. Rank-two and oblique fixtures are defined in the script but were not run.
- Full repeated Fock-vector Casimir expansion is costly; prefer coefficient-level equivariance and polynomial tensor projection in the next interval.

## Reproduce

    cd research/computational/python-first-20261124/bfss-covariants
    OPENBLAS_NUM_THREADS=2 python covariant_audit.py ../bfss-seed-transport/source_seed_integer.npz rank1
    python commutator_audit.py

The rank3 argument reproduces the expensive path, with no assurance of completion within the original time limit. The two scripts and completed JSON receipts have Git blob hashes matching their local executed files. The partial receipt was reconstructed from the printed console line. The scripts use bounded Gaussian-integer arithmetic stored in complex128, with integral checks and conservative component bounds; the finite commutator products are small exact Gaussian integers. The full variational integrals, companion-to-typed-source Hilbert map, differential charges and weighted domains remain unverified. No new Lean run or alteration to source theorems.

## Forward decision

Exploit covariance to replace repeated Casimir actions with finite polynomial tensor projections, validate against rank-one exact results, then test general configurations. Next connect the descendants to the sixteen differential charge actions and their radial weights, retaining source reflection and Fock ordering. Do not infer a physical ground state from these checks.
