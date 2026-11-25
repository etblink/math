# Ordered Yukawa jets and exact rational 32-row weighted form (2026-11-24)

**Classification:** finite reconstructed occupation algebra and exact rational integration; conditional on invariant contraction structure and the archived finite representation. Not a Lean qualification or native physical-domain certificate. Parent `d4d594a0aa43b2db7f556b11e95af7ce83edc932`; companion pin `96b19b1fef98486e43bc2527604966c86afd7ca7`, state blob `cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc`. Prior 56-row mass data and 22-row differential matrices are inputs, not modified.

## Ordered jets

With `Z=sqrt(2)Y`, use `d Z^2 S=K Z S+Z K S` for `K=dZ`. In `jet2.py` the `B2` insertion is twice the companion B, since t=sqrt(2)theta. The diagonal term is exactly zero because B_(mu,mu)=sum_alpha C_mu^alpha C_mu^alpha-8I=0. `CV` constructs sqrt(2)*i sum c_alpha V_alpha, using the original Gamma9, ordered i<j sum, color cross products. Normalization for tau/nu is N*2^((p+q)/2), for beta/t twice that, for v N*2^((p+q+1)/2). Here N=8072064 and P_p=Y^p S normalized. `msum` checks the imaginary part vanishes exactly; the initial full rank-one code extracted real parts only, which the reduced rank-one version now checks. Beta uses B anti-Hermitian: <P,B dP>=-<BP,dP>. All integer complex128 arithmetic has explicit bounds and exact chunks for dot sums.

At a diagonal slice, unbroken SO(6) permutes the six transverse directions of each color, so contraction contributions (not vectors) agree. Evaluate k=3, multiply its contractions by six, and verify spatial tangent identity R8_(b,k) P2=-8*x_b*d_(b,k)P2 whenever x_b!=0. Full direct rank-one (27 derivatives) agrees on all five raw arrays with reduced rank-one (12 representatives). Rank-one, rank-two (1,1,0), rank-three (1,2,3) and held-out rank-three (1,2,4) completed. Total 9 representative transverse rotation checks (1+2+3+3) in reduced runs plus 6 in full rank-one. Four Euler tests in reduced runs, one in full. First full direct rank-three attempt stopped at 13 printed coordinate rows, second at 15; do not count them as completed. A multi-fixture reduced attempt completed two fixtures then timed out on third; resumed held-out separately. Streaming setup was unsupported. Initial implementation and logs retained. The rank-three reduced run took 24.57 seconds; the earlier full direct calculation did not complete in its execution budget. Timings are observed receipts, not guaranteed performance.

## Polynomial reconstruction

Use companion `contract.py` blob `66323abda2418509f6030cb2942fe2354cc7a476`, `model.py` and `blocks.py` blob `0ef1da1fb9473b74807948962c6cef000bb1d0ef`. Scalar invariant homogeneous degree p+q-2 for tau, p+q for beta, p+q+3 for v. Diagonal covariant matrix families nu and t have degrees p+q and p+q+2, using basis I,G,G^2 times invariants. These degree/parity constraints come from the source family definitions and previous exact finite equivariance; no claim of a native typed identification. All nonzero families have full-rank interpolation on three fixtures and exact fourth-fixture holdout. For a same-state t entry, anti-Hermiticity plus real inner products gives zero without interpolation where rank is deficient; other t entries checked by full-rank interpolation. Verify parity-zero families on all fixtures. Results `jet_polynomials.json`.

Examples: tau_11=720, tau_22=(204160/3)s; beta_11=-(640/3)s, beta_22=-(388480/33)s^2-(741160/33)u; v_01=-(160/3)u, v_12=-(118876/33)su+(75836/77)v. Nu_02=(160/3)G, nu_11=(80/3)G, nu_22=(140728/33)sG-(14568/11)G^2. t vanishes on this low-power reconstructed sector. These distinguish noncommuting derivatives from pure mass moments. The earlier 22-row integrated matrix provides an independent normalization control for the conventions and weighted corrections.

## Integration and exact finite eigenvalue bracket

`integrate32.py` selects all 32 actual S descendants with power <=2 from the pinned 56-row metadata, uses the exact previous mass data, then builds both H and q1 from gradient and multiplication pieces and -beta/8, -v/8 corrections. General polynomial profile differentiation includes invariant-multiplier gradients and Gaussian profile cross terms. Use rational Wishart matrix moments reduced by Cayley-Hamilton, and the finite orientation sum with equal longitudinal widths from the archived witness. 936 distinct scalar/matrix orientation moment keys; independent 32-node numerical orientation quadrature using earlier eigenvalue Stein polynomials agrees to relative 6.440690296163624e-15. The two routes share Stein moment relations, but independently implement matrix reduction and orientation integration. Exact rational reduced mass, H and q1 matrices stored losslessly in `matrices.json.gz`. Prior 22-row mass/H/q1 agree within 4.47e-15, 4.94e-15, 5.47e-15 respectively. All 32 q1 LDL pivots positive. Binary64 diagonally scaled M condition 1317215.1221951135. Full32 numerical minimum 59.07834181710854 vs recovered old22 97.6590825258915; Y2-only minimum 173.3678690711772. Approx 39.5% reduction, not a lower bound on larger space.

`bracket32.py` checks 32 exact positive pivots of A-(5907834/100000)M, and a rational rounded coefficient vector whose exact Rayleigh quotient is below 5907835/100000 (decimal 59.07834181710904). Thus 59.07834 < qmin32 < 59.07835, conditional on the reconstructed finite matrices, no floating eigensolver needed to validate the bracket. The full rational trial coefficients, quotient, and lower LDL pivots are archived. The bracket does not certify the full 104-row physical witness.

## Reproduction

From this directory in the repo (local scratch directory names differed during execution):

```
OPENBLAS_NUM_THREADS=1 python jet2_initial.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 1,0,0
mv jet_100.json jet_100_direct.json
OPENBLAS_NUM_THREADS=1 python jet2.py ../bfss-covariants ../bfss-seed-transport/source_seed_integer.npz 1,0,0 1,1,0 1,2,3 1,2,4
python reconstruct.py
OPENBLAS_NUM_THREADS=1 python integrate32.py ../bfss-yukawa-moments ../bfss-cross-gram22
OPENBLAS_NUM_THREADS=1 python bracket32.py
```
Run fixtures separately if execution budget requires. Time fields in receipts vary. `integrate32.py` imports prior exact scalar recurrence, using its command-line path convention. The `if False` branch in emon is dead code left unchanged from the executed script. Python 3.13.5, NumPy/SciPy/SymPy, single OpenBLAS thread. No Lean sources or workflows changed.

## Next research decision

Use the same reduced jets recursively for p>2, with integer or modular arithmetic if coefficient bounds/occupation support become prohibitive; test nonzero higher t rather than assuming it vanishes. 32 complete rows of 104; remaining 24 S descendants (p>=3), Phi24, H3 24. Typed original Fock representation and source charge transport, full witness integrations, weighted domain remain outstanding. Do not infer physical ground-state existence or universal necessity from subspace comparisons.
