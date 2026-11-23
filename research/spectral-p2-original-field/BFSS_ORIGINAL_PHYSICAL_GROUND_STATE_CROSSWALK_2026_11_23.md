# Original physical ground-state crosswalk

23 November 2026 · Read-only research pass on the unified integration branch · Source snapshot 2bdc0b697f807659ee35c1ddd4a7798a7a4ea46d

The source gamma matrices can be matched to Michel–Scheinpflug–Yin’s Appendix A matrices by an exact real orthogonal basis map and reversal of the ninth spatial coordinate. One released basis profile also passes an independent radial and ordinary-energy calculation. The next source obligation is to transport the sixteen differential charges on the physical smooth core using the corresponding Fock unitary.

## GM5E10 R2 qualification evidence

[GitHub Actions run #45236470826](https://github.com/etblink/math/actions/runs/45236470826) succeeded at the exact SHA above in job 137909397803. The frozen-source preflight, pinned Lean 4.34.1 and Mathlib restoration, 9,170-job native build, and independent paired SU(2) consumer all passed. The two native declarations and the independent consumer list only propext, Classical.choice and Quot.sound. The job emitted the strict success sentinel.

The original 19,948-byte [provider ZIP #14851287114](https://github.com/etblink/math/actions/runs/45236470826/artifacts/14851287114) passed all seven member CRC checks. Its SHA-256 is 2d0d0fba08857bf756f20334a96733f2fb3cadb2d985d376064ee6f983dc0c68, matching provider metadata and the upload log. Its tested SHA, source, workflow, independent consumer blobs and environment hashes match the tested commit. The original ZIP is included byte-for-byte in the reproducibility bundle.

R2 proves the conditional fixed-ball criterion on the original natural Hamiltonian domain. It assumes a gauge-invariant smooth IMS partition and a bounded smooth-core sequence with native charges tending to zero and probability uniformly retained in one closed configuration-space ball. The read-only pass did not update the repository checkpoint.

## Normalization and basis comparison

| Interface | Original Lean source | Michel–Scheinpflug–Yin | Bajaj–Lin |
| --- | --- | --- | --- |
| Coordinates and color | 27 real coefficients in nine traceless matrices, Pauli color basis normalized by \(1/\sqrt2\) | \(3\times9\) array, same normalized Pauli convention, \(g_{\rm YM}=1\) | \(g_{\rm YM}=1\), three singular values in the invariant description |
| Relevant radius | \(\|X\|\) is the Euclidean norm of the coefficient array | \(R^2=\operatorname{tr}(XX^\mathsf{T})\); the separate tail variable is the largest singular value | \(s^2=\sum_i s_i^2\) is the full squared radius |
| Fermion basis | 48 real Majoranas paired into 24 complex modes, with paired algebra inheriting the integer Gamma9 matrices | 48 Majoranas and its own explicit Appendix A realization; an exact spinor basis map and spatial sign are identified below | 48 Majoranas and a 2,066-component generic-orbit singlet basis; a concrete comparison with the repository basis remains open |
| Differential expression | Sixteen charges, with kinetic factor \(-i\) and \(\tfrac12 f_{abc}\gamma_{ij}\) summed over ordered plane indices | Eq. (5) uses \(\sqrt2\,\epsilon_{abc}\Gamma_i\Gamma_j\) over \(i<j\), from the same color normalization and combining the two ordered terms | Eq. (2.1) uses a trace form; the quartic term in Eq. (2.3) matches the singular-value expression |
| Physical graph and numerics | Gauge-invariant physical Hilbert space and exact closed charge graph | Preprint auxiliary fidelity argument and released finite variational state in their conventions | Numerical reconstruction, with interpolation and boundary regularity relevant to any graph-norm transfer |

[Original source at tested SHA](https://github.com/etblink/math/tree/2bdc0b697f807659ee35c1ddd4a7798a7a4ea46d/lean/OAI/MathematicalPhysics/BFSS) · [Michel–Scheinpflug–Yin, §§II–IV and Appendices A, B and E](https://arxiv.org/html/2611.09837v1) · [Bajaj–Lin, §2 and Appendix D](https://arxiv.org/html/2611.14512v1)

### The ninth-axis sign

Write \(S_i\) for the repository matrices and \(A_i\) for Appendix A. Exact integer multiplication gives \(\prod_{i=1}^9 S_i=-I\) and \(\prod_{i=1}^9 A_i=+I\). A single similarity on the spinor fiber with all nine axes held fixed is therefore impossible. Applying the nine commuting linear involutions \(M\mapsto s_i A_i M S_i\), with \(s_9=-1\) and all other \(s_i=1\), gives an integer matrix \(P\). It has 64 nonzero entries and passes
\[
P^\mathsf{T}P=PP^\mathsf{T}=4I,\qquad A_i P=s_i P S_i
\]
for every index. The same calculation with all signs positive gives the zero intertwiner space. The reproducer reads the literal source integer tables and constructs the external matrices from Appendix A.

For \(O=P/2\), the proposed transport uses the coordinate reflection \(y_{ia}=s_i x_{ia}\) and the same spinor map on all three color copies. The sign occurs once in each differentiated coordinate term and twice in each quadratic position term, with the corresponding gamma transformation cancelling it in both cases. The reflection preserves Lebesgue measure and the full-radius ball. Existing CAR-unitary infrastructure supplies a route to construct the actual Fock implementation. Gauge action, global singlet identification, and graph transport require their own source checks. This finite matrix computation is exact conventional evidence.

## Independent trial calculation

The [pinned companion data](https://github.com/asmichel/SU2-BFSS/blob/96b19b1fef98486e43bc2527604966c86afd7ca7/variational/results/seeded_state.json) contain 19,652 basis entries and coefficients. I evaluated raw basis row zero, a projected Gaussian of widths \(a=3,\ b=3/2\) multiplying a degree-zero seed, using a unit constant spinor. This calculation is for that basis function before assembly of the optimized mixture and its saved dilation. It depends on the profile and constancy of the spinor, so the spinor coordinates cancel from the normalized expectations. The integrated massless fermion term vanishes by oddness in \(X\).

To reproduce the profile calculation, let \(M_n=aI-(a-b)nn^\mathsf T\) for a unit color vector \(n\). For the squared profile average over two directions \(n,m\), set \(K=(M_n+M_m)/2\) and \(t=|n\cdot m|\). Integrating the 27 Gaussian coordinates leaves a one-dimensional integral on \(0\le t\le1\), weighted by \(\pi^{27/2}\det(K)^{-9/2}\). The determinant is \(a[(a+b)^2-(a-b)^2t^2]/4\). With covariance \(\Sigma=K^{-1}/2\), the moment, kinetic and quartic integrands relative to that weight are \(9\operatorname{tr}\Sigma\), \((9/2)\operatorname{tr}(M_nM_m\Sigma)\) and \(36[(\operatorname{tr}\Sigma)^2-\operatorname{tr}(\Sigma^2)]\). The bundle contains the quadrature and an isotropic Gaussian control.

| Quantity for row zero | Independently evaluated value |
| --- | ---: |
| Raw squared norm | 29.87271453 |
| Normalized \(\langle \|X\|^2\rangle\) | 5.68298387 |
| Kinetic energy | 16.16171372 |
| Bosonic quartic energy | 9.29551972 |
| Ordinary energy | 25.45723344 |
| Charge-column norm in the \(E=\|T\psi\|^2/16\) normalization | 20.18206469 |
| Radius-six ball probability lower-bound estimate from the numerical moment | 0.84213933 |

There is also an exact analytic probability bound for this row. The eigenvalues of \(K\) are \(a,(a+b)/2\pm(a-b)t/2\). Thus \(\operatorname{tr}K^{-1}\) is maximal at \(t=1\), with value \(2/a+1/b=4/3\). The normalized second moment is at most \(6\) and Markov's inequality gives radius-six probability at least \(5/6\).

The reported optimized state is a distinct input. Its saved data give \(\langle R^2\rangle\simeq8.07419\), \(E\simeq4.17227\times10^{-8}\), and an auxiliary fidelity lower bound near \(0.9999978\). I inspected the saved values. The independent calculation above reproduces one basis profile and its ordinary energy. Reproducing the optimized state's weighted residual and transferring its Appendix B estimate to our source remain open. [Paper, §IV.4](https://arxiv.org/html/2611.09837v1#S4.SS4)

## GM5E10 hypotheses and controls

| Requirement | Status after this pass |
| --- | --- |
| Smooth gauge-physical core sequence with bounded norm | A smooth Gaussian profile times an invariant seed can be brought into compact support by radial cutoffs. Bringing the external optimized state into the literal source gauge carrier still requires the Fock and gauge transport. |
| Native closed charge converges to zero | A finite trial energy gives one residual. The released state and this single-basis calculation do not give a source sequence with residual tending to zero. A transported and independently justified auxiliary fidelity theorem would instead yield a nonzero kernel projection directly. |
| Positive probability in a single fixed ball | The one-basis calculation gives a positive bound in its coordinate convention. Retention must hold for the same low-charge sequence used in the theorem. |
| Fixed smooth gauge-invariant IMS partition | At the conventional level a smooth angle depending on \(\|X\|^2\), flat at \(0\) inside the radius-\(R\) ball and flat at \(\pi/2\) outside the radius-\(2R\) ball, gives cosine/sine cutoffs and bounded gradients. The partition is explicit data in GM5E10. |

For an escape control, normalize the original gauge-invariant Fock vacuum times a smooth scalar bump supported in \(L<\|X\|<2L\) and \(V_B(X)<1\). The support contains a neighborhood of a rank-one configuration at each \(L\). With ordered singular values \(\sigma_1,\sigma_2,\sigma_3\), the quartic formula gives \(\sigma_2^2+\sigma_3^2\le3/L^2\) on the support. This concentrates around rank-one commuting configurations, and the norm in any preselected fixed ball is exactly zero for sufficiently large \(L\). Its charge has no assumed decay. A separate charge estimate would be needed to use an escape family to study the continuum.

## Next decision

The one proposed theorem is common-core transport of all sixteen original charges under the identified coordinate reflection and a generator-preserving Fock unitary, with the charge output rotated by \(O\). The immediate prescreen is to bind the external gamma, CAR, and gauge formulas to the same physical core and apply the existing generator-preserving unitary lemma. A sign, color permutation, or gauge-action mismatch stops this transport before a closed-domain claim. A verified common-core map would give a concrete basis for checking the closure and auxiliary-domain premises, and eventually for testing a gravity observable. The Standard Model comparison can proceed on its own empirical evidence.
