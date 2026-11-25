# MSY weighted cross-Gram expansion: 22 actual witness rows (2026-11-24)

Classification: SURVIVED_FINITE_TESTS, not Lean qualification, interval certification, or physical-domain identification. Retrospective research record. Parent 7aba675abeb3e74dd9c284b75b0751dc22eebeaa. Source companion 96b19b1fef98486e43bc2527604966c86afd7ca7, optimized state Git blob cdfe3df61c65204c8e0bb6eb6289c8d192f6b8dc. The labels, powers and invariant exponents were checked against that pinned state. The physical widths are taken from the archived rational trial-104.json (lambda 29/20), not the companion optimized-state widths.

## Method and scope

Reuse the reconstructed finite S,YS charge kernels in ../bfss-cross-gram, including the exact free differential charge annihilation of YS and the mixed gradient-potential kernel (5/3) tr(A(sG-G^2)). The new calculations inherit the earlier finite kernel checks and their invariant-polynomial ansatz; this is not a fresh proof of their universality or native carrier identification.

Let G=XX^T, (s,u,v) its elementary symmetric polynomials. For w=s^k u^l v^m, grad(w)=D_w X where D_w=2[w_s I+w_u(sI-G)+w_v adj(G)]. For an oriented Gaussian f_A, grad(w f_A)=f_A(D_w-w A)X. Same-family real charge bilinears use the factor n_P=1 or (80/3)s multiplying (1/2) tr((D_j-w_j A)G(D_h-w_h B))+u w_j w_h. Odd integrated terms vanish by X->-X. Opposite-family weighted charge uses the direct kernel (5/3)(1+s)tr(((A+B)w_jw_h-w_h D_j-w_j D_h)(sG-G^2)); the integration-by-parts version is (5/3) w_jw_h [16(s+s^2)+4u]. This follows from div((sI-G)X)=16s and grad(s) dot ((sI-G)X)=4u. Direct and IBP routes independently agree at the quadrature nodes. The unweighted mixed formula is (80/3)s w_jw_h. Normalization uses reduced trial functions b^(1/4) pi^(-27/4) f_A w P, with normalized uniform orientation measure.

The polynomial trace reduction uses the exact Cayley-Hamilton G^3=sG^2-uG+vI. New independent moment algorithm expands s,u,v and diagonal G^p (p=0,1,2) in row lengths and angular correlations. In the K eigenbasis t_i are independent gamma(9/2,1/lambda_i). Let c01=x,c02=y,c12=xy+sqrt((1-x^2)(1-y^2))z, x,y independent first coordinates on S^8, z on S^7. Even beta moments produce exact rational coefficients of the inverse eigenvalues. The second algorithm implements the Stein recurrence from companion gaussian.py (blob 646fd883dd9e9236d2f0e0cff2fc8f1ab377bc5d). Both methods are evaluated on 3 orientation-width pairings. The 50-digit implementation uses analytic spectral projectors for the 2x2 block of K, a separate mpmath quadrature and Cholesky whitening.

## Results

- 22 actual labels, 12 scalar-only and 10 YS; 253 unique pair entries each in M, H, q1. 102 distinct scalar/matrix moment types; 271 trace insertion keys.
- Maximum moment disagreement 2.3941611539381207e-15; direct vs IBP 1.3711600597849545e-15; 32/64 integration discrepancy 1.0955430554440862e-15; previous 4-row submatrix discrepancy at most 1.55545249889455e-14.
- Full 22 q1 minimum 97.65908252589173 (50-digit value 97.65908252589155948802059621445947425621); scalar12 142.9936836825722; YS10 164.62025261057997; low invariant degree <=4 (12 rows) 97.81551483325188; no-cross22 142.99368368257183; original4 100.527979403252.
- Mass diagonal-scaled condition 780683.0674687782. Generalized eigen residual 9.898710092498432e-16. 50-digit 32/48 matrix convergence 2.03032048767034e-39. 50-digit minimum difference from binary64 1.7395e-13. Positive definite M and positive q1 spectrum as numerical observations.
- Truncating released coefficients to these 22 rows yields q1=308.2512101749172, not the optimized quotient or the published full witness. A restricted minimum is an upper bound on the larger-space minimum, not a lower bound. Removing cross terms raises q1 by ~46.4% relative to full22 (31.7% reduction from no-cross).

## Negative knowledge and next decision

Adding invariant multipliers in this restricted fermionic span gives only ~2.85% reduction relative to four rows; the selected widths are not optimized for the subspace. The existing scalar-only Hardy obstruction is not a lower bound for all S-family Yukawa powers. Neither full witness q1 nor the companion independent full matrix comparison has been completed. The 50-digit convergence check is not a rigorous error bound. High matrix conditioning motivates exact rational integration/interval arithmetic before relying on tiny margins. Prior execution setup attempted a streaming container command that was unsupported; no calculation ran in those attempts; subsequent nonstreaming execution completed.

Next: prioritize the additional S-family Yukawa powers (34 actual rows), developing the g, derivative and potential contractions for Y^p S; compare nested minima and negative controls. Do not infer that Phi/H3 are necessary from this limited subspace; use controlled additions to quantify their contribution. No Lean sources or workflows changed.

Reproduce in this directory: `OPENBLAS_NUM_THREADS=2 python integrate22.py > run.log` and `OPENBLAS_NUM_THREADS=2 python precision22.py > precision.log`. Python dependencies numpy, scipy, mpmath. `old4.json` and `trial-104.json` are the archived inputs, copied verbatim. Full matrices in results.json and precision_results.json. Logs and checksums included.
