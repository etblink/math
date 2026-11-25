# Post-E0 differential charge audit — 2026-11-24

**Status:** SURVIVED_FINITE_TESTS for completed fixtures; H3 oblique charge INCONCLUSIVE. Analytic scalar-profile obstruction in reconstructed representation, not a Lean or physical ground-state qualification. Retrospective experiment record. Parent unified commit `8a200579f5850467c875d17b060c409ff80f0c5c`.

## Inputs and conventions

Original `Core.lean` blob `9882359ced78b0a3bd7e2f057974bd0a031b3e60`, `charge`, `gammaTwo`, `fermionAction`, `coreForm`. Gamma9 and paired Fock as in previous finite audits; companion pin `96b19b1fef98486e43bc2527604966c86afd7ca7`. Use X color x space (3 x 9), t=sqrt(2)*theta, f=exp(-alpha*|X|^2/2). Ordered spatial-pair 1/2 gives unordered pairs i<j. f_abc=sqrt(2) epsilon_abc. Original charge differential expression on f P, after dividing by f: kinetic -i Gamma theta (dP-alpha X P), potential sqrt(2) sum_(i<j) Gamma_i Gamma_j theta^a (X_i cross X_j)_a. Kinetic numerator A with t rather than theta, potential numerator B with t (sqrt(2) already cancels). Charge density is [norm(A)^2/2+norm(B)^2+sqrt(2) Re<A,B>]/(d_P^2*N*s_P^2), N=8072064; d_P rational denominator; s_P^2=1,2,8 for S, sqrt(2)*Phi, 2sqrt(2)*H3 respectively. All reported densities divide out f^2, not by local polynomial norm. Full 104-function witness not assembled or integrated. The source/companion reflection and typed carrier obligations from previous work are unchanged.

## Completed finite checks

- All 2304 two-point inner products of t_r S and t_s S exactly N delta_rs on the integer seed. Constant S times alpha=2 isotropic Gaussian: all 16 charge densities each exactly 2, 77, 22 at rank1, rank3 and oblique respectively. Independent scalar kinetic plus quartic expression matches. Omission of Gaussian gradient gives zero at rank1 instead of two.
- Phi rank1, H3 rank1 and H3 rank3: 27 exact polynomial derivative vectors, Euler identity, 3 color and 3 spatial tangent identities; H3 values compared coefficientwise with archived vectors. All 16 charge actions for each, densities equal at completed fixtures. This is pointwise evidence, not application of CSQ-E0 to pointwise values. Phi rank1 value checked against archived norm; no independent full Phi derivative coefficient comparison this interval.
- Artificial S+sqrt(2)Y S mixed control at rank3: correct sign density 59418.23905483418; reversed relative potential sign 55722.427611832485. Nonzero cross term; a scalar energy-only check on separate states would miss it. Not a released trial.
- All 112 completed charge actions have raw numerator norm and interference receipts. The H3 oblique jet passed value/Euler/tangent checks before R1 conservative exact dot bound failure; R2 bounded chunked exact sums implemented, but 20 s and 35 s command retries timed out. Retain `charge_audit_initial.py` and failure record. The revised chunk procedure ran successfully for mixed control; no completed oblique H3 charge receipt. Not mathematical falsification.

## Scalar-only obstruction (analytic; normalized real scalar f)

The checked finite two-point identity implies <theta_r S,theta_s S>=delta_rs/2. Hence every charge density on f S is 1/2 |grad f|^2+V_B f^2 for real f, independently of pointwise gauge invariance. Kinetic term: gamma anticommutation gives squared norm |grad f|^2/2 per component. Potential: for each color a with cyclic (a,b,c), write C_a=Gamma(X_b)Gamma(X_c)-(X_b dot X_c) I; C_a C_a^T=|X_b wedge X_c|^2 I by Clifford. Sum colors yields V_B=sum_(i<j)|X_i cross X_j|^2. Imaginary kinetic vs real potential coefficients have zero real cross term since two-point matrix is real. On real compactly supported smooth f (or sufficiently decaying f with valid integration by parts), d=27 and div X=d imply d ||f||^2=-2 Re int f X dot grad f. Thus int r^2 |grad f|^2 >= d^2 ||f||^2/4 by Cauchy-Schwarz. For q_1=1/16 sum ||sqrt(r^2+1) Q_alpha f S||^2, normalized scalar profile gives q_1>=d^2/8=91.125, far above threshold 25/(36+8 sqrt(14)) approximately 0.3791713. This does not cover X-dependent Fock directions, mixed covariants, all S-labelled rows (which may include Yukawa powers), or a typed source theorem. No claim about general complex scalar phases.

For isotropic Gaussian f as above, density is (alpha/pi)^(27/2) exp(-alpha r^2). Wick moments give <V_B>=54/alpha^2, <r^2 V_B>=837/alpha^3, <r^2>=27/(2 alpha), <r^4>=27*29/(4 alpha^2). Then q_1=27 alpha/4+54/alpha^2+783/8+837/alpha^3. Independent radial quadrature reproduces the expression; numerical minimizer alpha=4.59424175519, q_1=140.07597113148. Scalar-only profile optimization cannot suffice. The full witness relies on nonconstant covariants and cross terms, not just Gaussian width.

## Reproduce

From this directory in repository (NumPy/SciPy/SymPy):

```
export OPENBLAS_NUM_THREADS=2
python charge_audit.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz
python cubic_jets.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz H3 rank1
python cubic_jets.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz H3 rank3
python cubic_jets.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz Phi rank1
python mixed_control.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz
python scalar_bound.py
```

Initial constant and cubic receipts produced before chunk repair; mixed and scalar receipts after. Exact arithmetic uses bounded integer-valued complex128 for vector operations, Python integers for norm squares and chunk sums; displayed densities are floating conversions. No Lean invoked. Next: exploit finite orbit symmetry and invariant contractions for cross-Gram matrices of the polynomial covariants, incorporate released projected Gaussian profiles, validate weighted integral errors, and eventually bind to literal source domain. Do not infer a ground state or promote the witness on the basis of these results.
