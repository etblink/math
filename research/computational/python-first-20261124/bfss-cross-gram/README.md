# Post-E0 weighted cross-Gram baseline (2026-11-24)

Status: SURVIVED_FINITE_TESTS, exact finite coefficient checks and independent numerical integration, not Lean qualification, a certified interval, or a full source-domain/fidelity certificate. Parent unified commit `3626c03cf70ed472380af9b1b2fff297fb4f55ce`. Retrospective registration.

## Inputs

Companion commit `96b19b1fef98486e43bc2527604966c86afd7ca7`, optimized_state Git blob `cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc`. The archived `research/integration/evidence/msy-fixed-regulator-trial-witnesses.zip` Git blob `4a925684613dfdcc3d11571c4c4b3f126b8d4155` contains `trial-104.json`; its raw deflate member was recovered from Git, length 3724 bytes and CRC32 bf7520ee verified. That exact member is included here. The 104 labels were cross-referenced with the pinned optimized state; all coefficients and labels are preserved in the witness member. No full companion integration was rerun. Companion source `gaussian.py` blob `646fd883dd9e9236d2f0e0cff2fc8f1ab377bc5d`, `blocks.py` blob `0ef1da1fb9473b74807948962c6cef000bb1d0ef`, `contract.py` blob `66323abda2418509f6030cb2942fe2354cc7a476`. Original source conventions and exact occupation seed inherited from previous archives. Four lowest-order actual witness rows 0,1,424,425 have invariant (0,0,0), seed S and Yukawa powers 0,1 at physical widths (29/10,29/20),(87/20,29/20). Reduced wavefunction normalization b^(1/4) pi^(-27/4), same as companion blocks. Fixed weight 1+s, s=tr G, G=XX^T, u=e2(G).

## Pointwise charge kernels

Let Z=sqrt(2)Y, k=80/3. Seed S normalized; <S,ZS>=0 and ||ZS||^2=(160/3)s. Direct kinetic charge on ZS, denoted D1/sqrt(2), annihilates the seed for all 16 charges: all integer coefficient norms exactly zero. Because ZS is linear in X, this identity is independent of X. The profile derivative remains. Reconstructed 15 complex scalar kernel entries using degree-constrained invariant monomials in s,u,v=e3(G) and direct summed charge contractions; fit five diagonal configurations and test three independent holdouts (rank3, oblique, reflected sign). All comparisons exact. 8 configurations x 16 charges x 15 pair entries = 1920 pair contractions (including zeros). The invariant polynomial ansatz is supported by established finite covariance and the SO(3)xSO(9) orbit invariants; no independent typed original-source map proved here. Orientation-gradient contractions were tested on 14 fixture/gradient pairs, 12 used to fit and 2 held out, with exact agreement. For real symmetric gradient matrix A, the mixed contraction in scaled Z convention equals (10/3) tr(A (sG-G^2)); the opposite pairing agrees, imaginary part zero. Candidate orientation kernel is inferred from the complete four-element equivariant trace ansatz and exact tests, not a new Lean theorem.

## Integrated Gram

For oriented profiles f_A=exp(-tr(A G)/2), f_B analogously, product exponent K=(A+B)/2. Let g=tr(A B G), T=sG-G^2. Real charge-pair integrands after factoring f_A f_B are:

    M00=1, M01=0, M11=k*s
    H00=g/2+u, H11=k*s*(g/2+u)
    H01=(5/3)*tr((A+B)*T)

These follow from finite Majorana CAR (real-part same-state kinetic/potential Gram), spatial sign reversal for odd-degree averaged scalar terms, D1=0 and the fitted exact mixed contraction; Y=Z/sqrt(2). Weighted integrands multiply all H entries by (1+s). Integration by parts gives the independent mixed expression H01 integral=(80/3) integral s. For q1 mixed integral it is (5/3) integral [16(s+s^2)+4u], with the same Gaussian-product measure. Derivation: grad u=2(sI-G)X, Delta u=32s, grad s dot grad u=8u, and div integration with exp(-tr(KG)) yields the identity. Direct oriented moment and IBP expressions agree numerically at every integration node. In particular the H mixed block equals the mass block of YS. Orientation average is a pair of independent directions, not the same-direction square. Relative absolute cosine z uniform on [0,1]; orientation integrated by Gauss-Legendre. Gaussian partition factor b^(1/4)d^(1/4) det(K)^(-9/2). Independent moment algorithms: eigenbasis independent Gamma(9/2,1/lambda_i) row lengths and conditional angle expectation of squared row dot product (1/9), vs inverse-trace derivatives of det(I-tK^-1)^(-9/2) in 50-digit mpmath. SciPy 32 vs 128 node checks and independent 32-node mpmath quadrature. Largest relative discrepancy 1.825e-14; not rigorous interval arithmetic. Isotropic alpha=2 scalar control q1=229.5 agrees with prior scalar-bound script. All four mass eigenvalues and all four generalized q1 eigenvalues positive. Raw M,H,A1 and high precision independent block entries in integrated_results.json. M condition number about 42224.4 (raw basis). Minimum q1 100.5279794; suppress mixed S/YS cross terms ->156.5974969. Truncating exact released coefficients to these four rows yields 142.6584844, not the released full state. No global bound on larger variational space, and no certificate at q1<3/8.

## Reproduction

From this directory under research/computational/python-first-20261124:

    export OPENBLAS_NUM_THREADS=2
    python gram_audit.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz ../bfss-differential-charge
    python oriented_kernel.py ../bfss-covariants ../bfss-h3-tensor ../bfss-seed-transport/source_seed_integer.npz ../bfss-differential-charge
    python integrate_gram.py

Scripts reuse pinned finite source occupation infrastructure, not companion contraction/integration code. The intermediate tool invocation initially failed because streaming exec was unavailable; no execution or mathematical failure resulted from that invocation. Completed standard execution. Runtime logs retained; values are numerical quadrature, despite exact finite inputs. Source carrier, gauge/differential/domain closure and all remaining witness rows are not qualified. Next: extend invariant/derivative kernels to the 22 actual S/YS rows with invariant multipliers (12 power-zero, 10 power-one), derive moments with u and v, then higher Yukawa powers/Phi/H3. Treat partial subspace minima as upper bounds on full-space minimum, never lower bounds.
